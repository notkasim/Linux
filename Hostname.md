## Hostname

***Hostname is a userfriendly name for a computer.*** 
*```kasmoh@ns1:~$```*
> *ns1* is the hostname for this computer.

*```kasmoh@dnsburk:~$```*
> *dnsburk* is the hostname for this computer. 
-------------------------------------------------------------------------------------------------------

### Change hostname on Linix computer.
The hostname can be set in the */etc/hostname* file:
```
ns1
```
- When the hostname is changed on the ***/etc/hostname*** file, also update the ***/etc/hosts*** file.
- Debian dists expect that 127.0.0.1 is defined in the */etc/hosts* file:
```
127.0.0.1 localhost
127.0.0.1 ns1.hudds.se ns1
10.0.0.30 ns1.hudds.se ns1
```
-------------------------------------------------------------------------------------------------------

***To check the hostname of a Linux computer use the command:*** 
*```hostname```*

***To get information such as Architecture, kernal and static hostname use the command:*** 
*```hostnamectl```*





