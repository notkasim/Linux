# Network Time Protocol

| Command                   | Description           |
|:--------------------------| :---------------------|
| apt install -y ntpsec     |                       |
| systemctl start ntpsec    |                       |
| systemctl enable ntpsec   |                       |

NTP config file can be found in: ``` /etc/ntpsec/ntp.conf ```

```
# /etc/ntpsec/ntp.conf, configuration for ntpd


driftfile /var/lib/ntpsec/ntp.drift     # Minimize hwclock drift
leapfile /usr/share/zoneinfo/leap-seconds.list  # Track leapseconds



# To enable Network Time Security support as a server, obtain a certificate
# (e.g. with Let's Encrypt), configure the paths below, and uncomment:
# nts cert CERT_FILE
# nts key KEY_FILE
# nts enable


# You must create /var/log/ntpsec (owned by ntpsec:ntpsec) to enable logging.
#statsdir /var/log/ntpsec/


# only allow localhost to configure or query, other sources can only recieve ntp time
restrict default kod limited nomodify nopeer noquery
restrict 127.0.0.1
restrict ::1


# SERVER PEERS, netnod public ntp servers
pool sth1.ntp.netnod.se iburst
pool sth2.ntp.netnod.se iburst
pool gbg1.ntp.netnod.se iburst
pool gbg2.ntp.netnod.se iburst
pool mmo1.ntp.netnod.se iburst
pool mmo2.ntp.netnod.se iburst


# if netnod is unreachable use local clock pool localhost iburst
fudge localhost stratum 10


minsane 3       #give time even without any Internet peers
minclock 4      #minimum of 3 peers (must be more than minsane)


# track up to 5 ntp candidates (potential peers)
# maxclock = number of pools + 0 or 1
# maxclock should always be odd, maxclock should never be less than minclock
tos maxclock 5
```