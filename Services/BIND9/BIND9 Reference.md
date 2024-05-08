# BIND9 
##### Bind configuration files location
- BIND9 configuration files are located in the directory */etc/bind.*


|BIND9 file & commands  |Description
| ---|----|
|/etc/bind             | BIND9 configuration directory                 |
|named.conf            |Primary configuration/zone declaration file.   |
|named.conf.options    |Options configurations file                    |
|/etc/bind/zones       |Dirctory for zone configuration file           |
|sudo named-checkconf  | Check named.conf/.options configuration       |
|sudo named-checkzone hudds.se /etc/bind/zones/hudd.se| Check forward zone configuration|
|sudo named-checkzone 0.0.10.in-addr.arpa /etc/bind/zones/0.0.10.in-addr.arpa| Check reverse zone configuration|

> [!IMPORTANT]
> *Create directroy named "zones" in the /etc/bind.*
> *The "zones" directory will store the forward and reverse DNS zones.*
> *Forward zone = hudds.se and Reverse zone = 0.0.10.in-addr.arpa.*
> *If the IP-address of the DNS server is 193.10.160.74 then the name of the reverse zone should be 160.10.193.in-addr.arpa.*
-------------------------------------------------------------------------------------------------------------

## Primary DNS server
1. ### *Declare the forward and reverse zone in the /etc/bind/named.conf file on the primary server*
```
//This is the primary configuration file for the master BIND DNS server.
//

include "/etc/bind/named.conf.options";
include "/etc/bind/named.conf.local";
include "/etc/bind/named.conf.default-zones";
//========================================================================

zone "hudds.se" {
                type master;
                file "/etc/bind/zones/hudds.se";
                allow-transfer { 10.0.0.51; };
                notify yes;             //faster zone transfer
};
//========================================================================

zone "0.0.10.in-addr.arpa" {
                type master;
                file "/etc/bind/zones/0.0.10.in-addr.arpa";
                allow-transfer { 10.0.0.51; };
                notify yes;             //faster zone transfer
};
//========================================================================
```
-------------------------------------------------------------------------------------------------------------

2. ### *Configure the file named.conf.options*
- *Define an Access Control-list (ACL) for hosts and networks for which recursive DNS queries is allowed.*
- *Allow queries and query-cache for the specified ACL.*
- *Create log file and login clause*

> [!NOTE]
> *If client is sitting on a network not included in the ACL they will not be able to use the DNS server*

```
// ACL for trusted hosts and networks
acl trusted {
                10.0.0.50;              #ns1
                10.0.0.51;              #ns2
                10.0.0.0/24;    #local network
};
//========================================================================

options {
        directory "/var/cache/bind";
        recursion yes;                                  #enables recursive query
        allow-recursion {trusted; };    #only allows recursive queries from "trusted" acl
        allow-query {trusted; };                #only allows query from "trusted" acl
        allow-query-cache {trusted; };  #trusted acl is allowed to access the servers cache
        listen-on port 53 {10.0.0.50;};


        forwarders {
                1.1.1.1;        #public dns resolver
                8.8.8.8;        #public dns resolver
                };
};
//========================================================================

logging {
                channel bind_log {
                                file "/var/log/named/bind.log" versions 3 size 250k;
                                severity info;
                                print-time yes;
                                print-category yes;
                                print-severity yes;
                };
                category default {
                                bind_log;
                };
                category queries {                      #log queries
                                bind_log;
                };

};
//========================================================================
```
-------------------------------------------------------------------------------------------------------------

3. ### *Configure the forward zone file in the /etc/bind/zone directory*
- *The following is a forward zone file for the domain hudds.se.* 
- *;are comments*

```
$TTL 300
$ORIGIN hudds.se.

;Start of Authority
@       IN      SOA     ns1.hudds.se.   info.hudds.se. (

                20240401                ;serial number
                60                      ;refresh
                60                      ;update retry
                120                     ;expire
                120                     ;minimum
)

;NAME SERVER
@       IN      NS      ns1.hudds.se.
ns1     IN      A       10.0.0.50
ns2     IN      A       10.0.0.51

; WEB SERVERS
www.websida1    IN      CNAME   hudds.se.
www.websida2    IN      CNAME   hudds.se.
@       IN      A       10.0.0.30
@       IN      A       10.0.0.31
```
-------------------------------------------------------------------------------------------------------------

4. ### *Configure the reverse zone file in the /etc/bind/zone directory*
- *The following is a reverse zone file for the domain hudds.se. (0.0.10.in-addr.arpa)* 
- *;are comments*

```
$TTL 300
$ORIGIN 0.0.10.in-addr.arpa.


@       IN      SOA     ns1.hudds.se.   info.hudds.se. (

                20240401                ;serial number
                60                      ;refresh
                60                      ;update retry
                120                     ;expire
                120                     ;minimum
)

;NAME SERVER
@               IN              NS              ns1.hudds.se.
50              IN              PTR             ns1.hudds.se.
51              IN              PTR             ns2.hudds.se.

; WEB SERVER
30      IN      PTR     www.websida1.hudds.se.
30      IN      PTR     www.websida2.hudds.se.
31      IN      PTR     www.websida1.hudds.se.
31      IN      PTR     www.websida2.hudds.se.	
```
-------------------------------------------------------------------------------------------------------------

## Secondary DNS server

1. ### *Declare the forward and reverse zone in the /etc/bind/named.conf file on the secondary server*

```
//This is the primary configuration file for the secondary BIND DNS server.
//

include "/etc/bind/named.conf.options";
include "/etc/bind/named.conf.local";
include "/etc/bind/named.conf.default-zones";
//========================================================================

zone "hudds.se" {
        type secondary;
        file "/var/lib/bind/hudds.se";
        masters { 10.0.0.50; };
};
//========================================================================

zone "0.0.10.in-addr.arpa" {
        type secondary;
        file "/var/lib/bind/0.0.10.in-addr.arpa";
        masters { 10.0.0.50; };
};
//========================================================================
```
-------------------------------------------------------------------------------------------------------------

2. ### *Configure the file named.conf.options*
- *Define an Access Control-list (ACL) for hosts and networks for which recursive DNS queries is allowed.*
- *Allow queries and query-cache for the specified ACL.*
- *Create log file and login clause*

***This file should be identical to ns1's named.conf.options file except it should be configured to listen on ns2's IP-address. You can use Secure Copy (scp) to copy the file from the primary dns server***
> sudo scp primary@10.0.0.50:/etc/bind/named.conf.options /etc/bind

> [!NOTE]
> *If client is sitting on a network not included in the ACL they will not be able to use the DNS server*


```
//This is the options configurations file for the secondary BIND DNS server
//========================================================================

// ACL for trusted hosts and networks
acl trusted {
                10.0.0.50;              #ns1
                10.0.0.51;              #ns2
                10.0.0.0/24;    #local network
};
//========================================================================

options {
        directory "/var/cache/bind";
        recursion yes;                                  #enables recursive query
        allow-recursion {trusted; };    #only allows recursive queries from "trusted" acl
        allow-query {trusted; };                #only allows query from "trusted" acl
        allow-query-cache {trusted; };  #trusted acl is allowed to access the servers cache
        listen-on port 53 {10.0.0.51;};


        forwarders {
                1.1.1.1;        #public dns resolver
                8.8.8.8;        #public dns resolver
                };
};
//========================================================================

logging {
                channel bind_log {
                                file "/var/log/named/bind.log" versions 3 size 250k;
                                severity info;
                                print-time yes;
                                print-category yes;
                                print-severity yes;
                };
                category default {
                                bind_log;
                };
                category queries {                      #log queries
                                bind_log;
                };

};
//========================================================================
```
-------------------------------------------------------------------------------------------------------------
