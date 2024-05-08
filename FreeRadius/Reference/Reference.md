# FreeRADIUS REFERENCE
FreeRadius configuration files are located in the directory *```/etc/freeradius/3.0.```*

|FreeRadius file & commands  |Description
| ---|----|
|/etc/freeradius/3.0     |FreeRadius configuration directory       |
|clients.conf            |Clients and Secret configuration file.   |
|users                   |Users and password configurations file    |
|radtest hudds nics 10.0.0.250 1812 Labb1@cygate|Test radius username and password agains the radius server|
-------------------------------------------------------------------------

## FREERADIUS SERVER
> **FreeRadius installation**
1. Install FreeRadius with this command: *```sudo apt install freeradius -y```*

> **Freeradius server configuration**
2. Open the file *```/etc/freeradius/3.0/clients.conf```* with sudo for editing.
3. Add clients IP-ADDRESS, respective SECRET and the desired OPTIONS .
    - ***Example configuration:*** [clients.conf](https://github.com/notkasim/Information-Technology/blob/main/FreeRadius/Reference/clients.conf)
##### FreeRadius Server configuration file locations
- FreeRadius server configuration files are located in the directory */etc/freeradius/3.0.*

4. Open the file *```/etc/freeradius/3.0/users```* with sudo for editing.
5. Add the desired usernames and passwords.
    - ***Example configuration:*** [users](https://github.com/notkasim/Information-Technology/blob/main/FreeRadius/Reference/users)
> [!IMPORTANT]
> The file *```/etc/freeradius/3.0/users```* should point to the file *```/etc/freeradius/3.0/mods-config/files/authorize```*
-------------------------------------------------------------------------

## RADIUS CLIENT
> **Install Freeradius client**
1. Install the package with this command: *```sudo apt-get install libpam-radius-auth freeradius-utils -y```*

> **Edit PAM authentication**
2. Open the file *```/etc/pam_radius_auth.conf```* with sudo for editing.
3. Add the target RADIUS-server IP-Address.
    - **Example configuration:** [pam_radius_auth.conf](https://github.com/notkasim/Information-Technology/blob/main/FreeRadius/Reference/pam_radius_auth.conf)
4. Open the *```/etc/pam.d/common-auth```* with sudo for editing.
5. Add this configuration line: *```auth sufficient pam_radius_auth.so ```*
-------------------------------------------------------------------------

## FreeRADIUS Server Log Configuration

|FreeRadius log Section  |Description
| ---|----|
|auth = yes             |log all (Accept and Reject) authentication results to the log file |
|auth_accept = yes      |log all Access-Accept results to the log file.                     |
|auth_reject = yes      |log all Access-Reject results to the file                          |
|auth_badpass = yes     |log passwords with with the authentication requests                |
|auth_goodpass = yes    |log passwords with with the authentication requests                |
|auth_reject = yes      |log all Access-Reject results to the file                          |