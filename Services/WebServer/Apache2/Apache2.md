```Linux
sudo apt install apache2
```
##### How to host multiple websites on one Apache2 server


###### Navigate to cd /var/www and create these directories 
```Linux
sudo mkdir site1 site2 
```
###### Create these files in the directories
```Linux
sudo touch site1/index.html site2/index.html 
```


###### Navigate to cd /etc/apache2/sites-available and create a file name that ends with .conf
```Linux
sudo touch domain_sites.conf 
```
```put this conf on these files```
```Linux
    <VirtualHost *:80>
        ServerAdmin admin@domain.com
        ServerName www.site1.domain.com
        DocumentRoot /var/www/site1
    </VirtualHost>
```

```Linux
    <VirtualHost *:80>
        ServerAdmin admin@domain.com
        ServerName www.site2.domain.com
        DocumentRoot /var/www/site2
    </VirtualHost>
```

###### Navigate to cd /etc/apache2/sites-available$ and Enable/disable websites with these commands
```a2ensite enables website while a2dissite disables websites```

```
sudo a2ensite domain_sites.conf 
sudo a2dissite domain_sites.conf
```

###### Curl a ipv6 website 
curl http://[2a02:1406:b:d693:215:5dff:fe00:a11]

###### Surv to a website via ipv6
http://[2a02:1406:b:d693:215:5dff:fe00:a11]
