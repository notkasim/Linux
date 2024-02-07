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