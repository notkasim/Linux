# NGINX

|Command    | Description |
|--- |--- |
|*```sudo apt install -y nginx```*      |*Download NGINX with*              |
|*```/etc/nginx```*                     |*NGINX configuration directory*    |
|*```/etc/nginx/sites-enabled```*       |*Web sites being server*           |
|*```/etc/nginx/sites-avaliable```*     |*Virtual hosts*                    |
|*```/etc/nginx/nginx.conf```*          |*Main nginx config file*           |
|*```/etc/nginx/modules-enabled```*     |*Applied config modules*           |
|*```/var/log/nginx```*                 |*NGINX log file*                   |
|*```sudo nginx -t```*                  |*Checks for syntax error*          |

------------------------------------------------------
1.  ## *Create directory structure within /var/www for each website*
Create the following directories: *```/var/www/websida1/html```* and 
*```/var/www/websida2/html```*.

The actual webcontent will be placed under *```/var/www/websida1/html```* directory. 

The /var/www directory and all sub-directories should have the permissions 755. Use the following command to give those permissions:

*```sudo chmod -R 755 /var/www```*

------------------------------------------------------
2. ## *Index file*
Create an index file for each website and put it under *```/var/www/websida1/html```* directory: *```/var/www/websida1/html/index.html```* and *```/var/www/websida2/html/index.html```* 

------------------------------------------------------
3. ## *Create Virtual Hosts*
Copy the default server block file from *```/etc/nginx/sites-available/default```* to *```/etc/nginx/sites-available/hudds.se```*.

Edit the newly created *hudds.se* file:
```
# NGINX

#WEBSIDA1
server {
                listen 80;
                listen [::]:80;
                server_name www.websida1.hudds.se;
                root /var/www/websida1/html;
                index index.html;

                location / {
                                try_files $uri $uri/ =404;
                }
}

#WBSIDA2
server {
        listen 80;
        listen [::]:80;
        server_name www.websida2.hudds.se;
        root /var/www/websida2/html;
        index index.html;

        location / {
                try_files $uri $uri/ =404;
        }
}
``` 

------------------------------------------------------
4. ## *Create symbolic link from sites-avaliable to sites-enabled*
Inroder to enable the websites, we have to create a symbolic link from the Virtual Hosts file in *sites-avaliable* to the *sites-enabled* directory.

*```sudo ln -s /etc/nginx/sites-available/hudds.se /etc/nginx/sites-enabled```*

------------------------------------------------------
## Hash bucket memory
> [!TIP]
> *In order to avoid a possible hash bucket memory problem that can arise from adding additional server names we will adjust a single value in the ```/etc/nginx/nginx.conf``` file.*


Within the file, find the *```server_names_hash_bucket_size```* directive. Remove the # symbol to uncomment the line: Save and close the file. 

## Create log file
- *Create a log file for each website ```/var/log/websida1``` and ```/var/log/websida1```*
