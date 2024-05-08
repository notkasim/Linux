# Debian

### IPV4
```
    auto eth0
    iface eth0 inet static
        address 10.0.0.0/24
        gateway 10.0.0.0/24
        dns-nameservers 10.0.0.1/24

    auto eth0
    iface eth0 inet dhcp
```


### IPV6
```
  iface eth0 inet6 static
        address 2001:db8::c0ca:1eaf/64
        gateway 2001:db8::1ead:ed:beef
        dns-nameserver 


# SLAAC
    auto eth0
    allow-hotplug eth0
    iface eth0 inet6 dhcp


# Stateful ipv6 dhcp config
    auto eth0
    allow-hotplug eth0
    iface eth0 inet6 auto

```