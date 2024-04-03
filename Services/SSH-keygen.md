# SSH-keygen 
### SSH-Keygen
ssh-keygen on Linux: ```ssh-keygen -f /home/arrakis/.ssh/Furo -t rsa -b 4092 -C kasim.mohamoud@outlook.com```
The generated rsa key pairs will be stored in the /home/arrakis/.ssh dicrectory.

ssh-keygen on Windows: ```ssh-keygen -f C:\Users\k4s\.ssh\Furo -t rsa -b 2048 -C kasim.mohamoud@outlook.com```
The generated rsa key pairs will be stored in the C:\Users\k4s\.ssh\ dicrectory.

### SSH Client config on Linux 
Create .ssh dicrectory in the users home katalog: 
``` mkdir .ssh```
Inside the .ssh directory paste the private key, that will be used to authenticate when connecting to a SSH server.

### SSH Server config
Inside the .ssh dicrectory create a file with the name authorized_keys: ```touch authorized_keys```

In the authoried_keys file paste the public key. If the Client and Server are not Linux machines then you must copy and paste the public key manually.
If the Server and Client are Linux machines then copy the public from the Client to the Server using: ```ssh-copy-id -i /home/arrakis/.ssh/furo.pub kasim@10.0.0.254```


### SSH key Management
If you want to reuse key pairs you can copy the ssh private key and paste it for exmepel in the .ssh file in your windows user home katalog. Then you will be able to use the private key to authentica yourself. And the public key should be pasted in the required area of the application or OS.
