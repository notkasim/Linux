
# ISC-DHCP config file

| Command      | Description                                                                      |
| :---------| :-----------------------------------------------------------------------------------|
| cd /etc/dhcp/dhcpd.conf                   | dhcp config file                                  |
| apt install -y isc-dhcp-server            | dhcp server installation                          |
| dhcp-lease-list                           | View dhcp leases                                   |
| cat /var/lib/dhcp/dhcpd*.lease            | dhcp leases file location                          |


```
# Lease time
default-lease-time 600;     #Seconds    
max-lease-time 7200;        # Seconds

# Authoritative
authoritative

subnet 10.0.0.0 netmask 255.255.255.0 {
    range 10.0.0.10 10.0.0.254;
    option routers 10.0.0.1;
    option domain-name exampel.com;
    option domain-name-server MS1.example.com;
}

# IP mappning
host HOSTNAME {
    hardware ethernet AA:AA:AA:AA:AA:AA;
    fixed-address 10.0.0.0;
}

```