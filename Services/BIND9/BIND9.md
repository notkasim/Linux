# BIND9 
Bind configuration files are located in the directory *```/etc/bind.```*

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
> *Create a directroy named "zones" in the /etc/bind. The "zones" directory will store the forward and reverse DNS zones.Forward zone = hudds.se and Reverse zone = 0.0.10.in-addr.arpa. If the IP-address of the DNS server is 193.10.160.74 then the name of the reverse zone should be 160.10.193.in-addr.arpa.*
---------------------------------------------------------------

## Primary DNS server
> **BIND9 installation**
1. Install BIND9 with this command: *```sudo apt install bind9 -y```*

> **DNS zone declaration and options**
2. Open the file *```/etc/bind/named.conf```* with sudo for editing.
    - Declare the forward and reverse zone
        - ***Example named.conf configuration:*** [named.conf](https://github.com/notkasim/NICS/blob/main/Linux/BIND9/Primary/named.conf)
3. Open the file *```/etc/bind/named.conf.options```* with sudo for editing.
    - Add options for the DNS zone
        - ***Example named.conf.options configuration:*** [named.conf.options](https://github.com/notkasim/NICS/blob/main/Linux/BIND9/Primary/named.conf.options)

> **Forward and Reverse zone configuration**
4. Open the file *```/etc/bind/zones/domain.se```* with sudo for editing.
    - Add the forward zone configuration
        - ***Example forward zone configuration:*** [hudds.se](https://github.com/notkasim/NICS/blob/main/Linux/BIND9/Primary/hudds.se)
5. Open the file *```/etc/bind/zones/0.0.10.in-addr.arpa```* with sudo for editing.
    - Add the reverse zone configuration
        - ***Example reverse zone configuration:*** [0.0.10.in-addr.arpa](https://github.com/notkasim/NICS/blob/main/Linux/BIND9/Primary/0.0.10.in-addr.arpa)
---------------------------------------------------------------

## Secondary DNS server
> **DNS zone declaration and options**
1. Open the file *```/etc/bind/named.conf```* with sudo for editing.
    - Declare the forward and reverse zone
        - ***Example named.conf configuration:*** [named.conf](https://github.com/notkasim/NICS/blob/main/Linux/BIND9/Secondary/named.conf)
2. Open the file *```/etc/bind/named.conf.options```* with sudo for editing.
    - Add options for the DNS zone
        - ***Example named.conf.options configuration:*** [named.conf.options](https://github.com/notkasim/NICS/blob/main/Linux/BIND9/Secondary/named.conf.options)

> [!IMPORTANT]
> The file named.conf.options should be identical to the Primary DNS servers named.conf.options file except it should be configured to listen on the Secondary DNS servers IP-address. You can use Secure Copy (scp) to copy the file from the primary dns server to the secondary dns server.

*```sudo scp USERNAME@10.0.0.50:/etc/bind/named.conf.options /etc/bind```*

---------------------------------------------------------------
## Post Configuration
> [!TIP]
> - Once the dns servers are up, every time you make changes on the primary server you have to increment the serial number in the zone files, and reload Named daemon.
> - If the forward and reverse DNS zone files are not transferred, try allowing BIND on the firewall. The transferred zone files should be in the *```/var/lib/bind```* directory.

> *```sudo ufw allow Bind9```* allows BIND9 on the firewall


> **Test BIND9 configuration with NSLOOKUP**
- ***Example commands to use for test BIND9 configuration:*** [nslookup](https://github.com/notkasim/NICS/blob/main/Linux/BIND9/Test.md)
















