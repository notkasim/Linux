##### SSH client config on Linux 
Create .ssh dicrectory in your users home katalog

``` 
mkdir .ssh
```

In the .ssh dicrectory create a file with this name
```
touch authorized_keys
```
In the authoried_keys file paste in the public key
if the public key is on a another linux machine you can use this command to copy the public key to your machine
```
ssh-copy-id username@10.0.0.10
```

##### SSH Server config on Linux 
To create ssh-key pairs use this command
```Linux
ssh-keygen -f /home/arrakis/.ssh/test1 -t rsa -b 4092
```
The generated rsa key pairs will be saved in the /home/arrakis/.ssh dicrectory.
To copy the public key to another linux machine you this command
```
ssh-copy-id -i /home/arrakis/.ssh/furo.pub kasim@10.0.0.254
```
if you want to copy the public key to another machine that is not linux or save want to save the key, you cat use this command to display the public key 
``` cat .ssh/key_name.pub

If you want to reuse these key pairs you can copy the ssh private key and paste it for exmepel in the .ssh file in your windows user home katalog ```c:\users\kasim\.ssh\```. Then you will be able to use the key to authentica yourself. And the public key should be pasted in the required area of the application or OS.  

```







#### !!!Caution the following command will over write any keys saved in the default localtion
To check if there are any keys in the .ssh dicrectory use this command;
```
ls -l ~/.ssh
```
If you get an error that the .ssh dicrectory does not exist it is ok 
