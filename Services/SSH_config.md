# Define private key for SSH clients
### This is how you can define what SSH key should be used for a client

1. Create the .ssh directory in the user home catalog: 
Unix ```mkdir /home/USERNAME/.ssh```,
Windows ```mkdir C:\Users\USERNAME\.ssh\```

3. Create a file named config in the .ssh directory
```touch config```

4. Open the config file for editing and specifying the path to your private key files:
```
HOST 10.0.0.254
  User pihole
  IdentityFile C:\Users\k4s\.ssh\Furo OR ~/.ssh/Furo

HOST 10.0.0.10
  User kasim
  IdentityFile C:\Users\k4s\.ssh\Furo OR ~/.ssh/Furo

Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/Furo OR C:\Users\k4s\.ssh\Furo
```


5. If thier is an entry for a Host in the ssh config file you can connect to host using:
```ssh 10.0.0.254``` 


