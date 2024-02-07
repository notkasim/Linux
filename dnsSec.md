# BIND9 DNSSEC

dns server without dnssec  #see how server and client respond
dns server with dnssec      #see how server and client respond
kali linux send false dns respons, and see if dnssec works

## To do Steps
1. Create zones directory with correct owner & permissions
2. Create keys directory with correct owner & permissions 
3. Configure named.conf
4. Configure named.conf.options
5. configure forward zone
6. configure reverse zone
7. configure Apparmor
8. Reload bind9 and sign the zone file
9. Test localy to make sure dnssec works
10. Generate DS (Delegation signer) key required som domain registrar
11. Update domain registrar with the DS key so that it publishes our domain as dnssec enabled
12. Veryfiy that dnssec is working externaly
13. view signed zone file

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

// Forawd zone
zone "example.com" {
        type master;
        file "/etc/bind/zones/example.com";

        // DNSSEC
// Fully Automated (Key and Signing Policy) - !! strongly recommended
        dnssec-policy default;
// Location of dnssec keys
        key-directory "/etc/bind/keys";
        inline-signing yes;

};

// Reverse zone
zone "0.0.10.in-addr.arpa" {
        type master;
        file "/etc/bind/zones/0.0.10.in-addr.arpa";

        // DNSSEC
// Fully Automated (Key and Signing Policy) - !! strongly recommended
        dnssec-policy default;
// Location of dnssec keys
        key-directory "/etc/bind/keys";
        inline-signing yes;
};
```



```
```

```
```
```
```
