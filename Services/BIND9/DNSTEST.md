## Testing BIND9 Configuration

> [!TIP]
> *If the BIND DNS zone file is not transferred, try allowing BIND on the firewall. The transferred zone files should be in the /var/lib/bind directory*
- *sudo ufw allow Bind9*

NSLOOKUP
10.0.0.50 = PRIMARY DNS SERVER
10.0.0.51 = SECONDARY DNS SERVER

> *Use nslookup to check if both dns server can resolve domin name.*
- *nslookup ns1.hudds.se 10.0.0.50*
- *nslookup ns1.hudds.se 10.0.0.51*

- *nslookup ns2.hudds.se 10.0.0.50*
- *nslookup ns2.hudds.se 10.0.0.51*

- *nslookup 10.0.0.50 10.0.0.50*
- *nslookup 10.0.0.50 10.0.0.51*

- *nslookup 10.0.0.51 10.0.0.50*
- *nslookup 10.0.0.51 10.0.0.51*

- ***Once the dns servers are up, every time you make changes on the primary server you have to increment the serial number in the zone files, and reload Named daemon.***