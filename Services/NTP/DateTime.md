# Date & Time

***To check the date and time use the commands:***
*```date```* or
*```timedatectl```* *shows date and time in more detail.*

-------------------------------------------------------------------------------------------------------
Set the timezone manually with command: 
*```timedatectl set-timezone Europa/Stockholm ```*

Set the date and time manually with the commands:
*```timedatectl set-time '2024-04-07 14:54:00'```* or 
*```date -s '2024-04-07 14:54:00'```*

*If the ntp service is active and you cannot set the time statically, use the following command to disable ntp:*
*```sudo timedatectl set-ntp false```*

-------------------------------------------------------------------------------------------------------
Sync the HW Clock with the Real Time Clock (RTC):
*```hwclock --systohc```*
> hw clock Counts time regardless if the computer is on/off.