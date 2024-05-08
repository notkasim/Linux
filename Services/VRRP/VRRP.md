##### Primary vrrp server konf. 
```
vrrp_track_process_track_haproxy {
    process haproxy
    weight 120
}
vrrp_instance vrrp1 {
    state MASTER
    interface eth0
    virtual_router_id 51
    prioriy 120             #the primary server should have higher priority than the secondary. 
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass Cicso123!
    
    }
    virutal_ipaddress {
        10.0.0.254/24
    }
    track_process {
        track_haproxy
    }
}
```


##### Secondary vrrp server 
```
vrrp_track_process_track_haproxy {
    process haproxy
    weight 120
}
vrrp_instance vrrp1 {
    state MASTER
    interface eth0
    virtual_router_id 51
    prioriy 110             #the secondary server should have lower priority than the primary.
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass Cicso123!
    
    }
    virutal_ipaddress {
        10.0.0.254/24
    }
    track_process {
        track_haproxy
    }
}
```