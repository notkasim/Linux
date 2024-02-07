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

```



```
```

```
```
```
```
