# Server Block


|Command    | Description |
|--- |--- |
|*```sudo apt install -y nginx```*      |*Download NGINX with*              |
|*```/etc/nginx```*                     |*NGINX configuration directory*    |
|*```/etc/nginx/conf.d```*              |*Server Block configuration files location*  |
|*```/etc/nginx/sites-enabled```*       |*Web sites being server*           |
|*```/etc/nginx/sites-avaliable```*     |*Virtual hosts*                    |
|*```/etc/nginx/nginx.conf```*          |*Main nginx config file*           |
|*```/etc/nginx/modules-enabled```*     |*Applied config modules*           |
|*```/var/log/nginx```*                 |*NGINX log file*                   |
|*```sudo nginx -t```*                  |*Checks for syntax error*          |

------------------------------------------------------
## Server Block
How to host two website on Nginx configuration


#### NGINX installation
1. Install nginx with this command: *```sudo apt install nginx -y```*


#### Directory Structure
2. Create a directory for each website in the *```/var/www```* directory. Create the following directories: *```/var/www/web1/html```* and *```/var/www/web2/html```*. Place the website contents under the *```html```* directory.


> [!IMPORTANT]
> *The ```/var/www/``` directory and all sub-directories should have the permissions 755. Use this command to give those permissions:* *```sudo chmod -R 755 /var/www```*


#### Index File
3. Configure an index files for each website and put it under the *```/html```* directory.
    - ***Example index.html configuration:*** [index.html](https://github.com/notkasim/NICS/blob/main/Linux/Nginx/Server%20Block/index/web1.Index.html)
    

#### Server Blocks
5. Open the directory *```/etc/nginx/conf.d```*. Create the files *```web1.conf```* and *```web2.conf```*
    - Inside of the *```web1.conf```* file place the desired configuration for the server block
    - Inside of the *```web2.conf```* file place the desired configuration for the server block
        - ***Example website1 configuration:*** [web1.conf](https://github.com/notkasim/NICS/blob/main/Linux/Nginx/Server%20Block/conf.d/web1.conf)
        - ***Example website2 configuration:*** [web2.conf](https://github.com/notkasim/NICS/blob/main/Linux/Nginx/Server%20Block/conf.d/web2.conf)


#### Log
- *Create a log file for each website ```/var/log/websida1``` and ```/var/log/websida1```*