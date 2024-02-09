# BIND9 DNSSEC

dns server without dnssec  #see how server and client respond
dns server with dnssec      #see how server and client respond
kali linux send false dns respons, and see if dnssec works
drwxr-sr-x 2 root bind 4096 Feb  7 19:49 zones  #zones direcotry
-rw-r--r-- 1 root bind 455 Feb  7 19:38 0.0.10.in-addr.arpa
-rw-r--r-- 1 root bind 501 Feb  7 19:38 netnadiif.onlin

bind has to own keys direcotry
drwxr-sr-x 2 bind bind 4096 Feb  7 20:28 keys

when configuring dnssec the zones direcotry needs to be owen by bind. or test to give bind group rwx to see if that helps.

## To do Steps
- Create zones directory with correct owner & permissions
- Create keys directory with correct owner & permissions
- Create log file
- Configure named.conf
- Configure named.conf.options
- configure forward zone
- configure reverse zone
- configure Apparmor
- Reload bind9 and sign the zone file
- Test localy to make sure dnssec works
- Generate DS (Delegation signer) key required som domain registrar
- Update domain registrar with the DS key so that it publishes our domain as dnssec enabled
- Veryfiy that dnssec is working externaly
- view signed zone file



### Create zones directory with correct owner & permission
```linux
cd /etc/bind
sudo mkdir zones
sudo chown -R bind zones && sudo -R chgrp bind zones
sudo chmod -R 755 zones
```



### Create keys directory with correct owners & permissions
```linux
cd /etc/bind
sudo mkdir keys
sudo chown -R bind keys && sudo -R chgrp bind keys
sudo chmod -R 755 bind
```



### Configure named.conf
```linux
// This is the primary configuration file for the BIND DNS server named.

include "/etc/bind/named.conf.options";
include "/etc/bind/named.conf.local";
include "/etc/bind/named.conf.default-zones";

zone "netsare.com" {
        type master;
        file "/etc/bind/zones/netsare.com";
};

zone "0.0.10.in-addr.arpa" {
        type master;
        file "/etc/bind/zones/0.0.10.in-addr.arpa";

};
```



### Configure named.conf.options
```linux
acl ask_acl {
        localhost;
        localnets;
        10.0.0.0/24;
        193.10.160.0/23;
};


options {
        directory "/etc/bind/cache";
        recursion yes;
        allow-query { ask_acl; };
        allow-query-cache { ask_acl; };

        forwarders {
                1.1.1.1;
        };

        dnssec-validation yes;

//      listen-on-v6 port 53 { ::1; };                  // If you wish to use IPV6 uncomment this line
        listen-on port 53 { 127.0.0.1; 10.0.0.215; };   // Change the IP-address to the IP-address of the DNS server
};

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
        category queries {
                bind_log;
        };
};
```



### Configure forward zone
```linux
$TTL 300
$ORIGIN netsare.com.

@       IN      SOA     ns1.netsare.com.     info.netsare.com. (

        20240208;       serial
        4H;             refresh (4400)
        1H;             retry (3600)
        1W;             expire (604800)
        1H;             minimum (3600)
)


; NAME SERVERS
@       IN      NS      ns1.netsare.com.
ns1     IN      A       10.0.0.215


; WEB SERVER
www.netsare.com.		IN      A       10.0.0.254
dnssec.netsare.com.		IN		A		10.0.0.253
```


### onfigure reverse zone
```linux
$TTL 300
$ORIGIN 0.0.10.in-addr.arpa.
@       IN      SOA     ns1.netsare.com.       info.netsare.com. (

        20240205; serial
        4H; refresh (14400)
        1H; retry (3600)
        1W; expire (604800)
        1H; minimum (3600)
)

; MAGAC SERVER
@       IN      NS      ns1.netsare.com.
215     IN      PTR     ns1.netsare.com.

; WEB SERVERS
254     IN      PTR     www.netsare.com.
253		IN		PTR		dnssec.netsare.com.		
```



```
