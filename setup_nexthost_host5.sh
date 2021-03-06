#Install nginx
#Set /etc/hosts
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt


cat << EOF | tee -a /etc/nginx/sites-available/default  
  
    
##--------/etc/nginx/sites-available/default------------    
# Default server configuration    
#    
# Default server configuration    
#    
upstream keymicobank {    
        #after 3 fails, take out the server for an hoiur    
        server host1:18080 max_fails=3 fail_timeout=3600s;     
        server host2:18080 max_fails=3 fail_timeout=3600s;    
        server host3:18080 max_fails=3 fail_timeout=3600s;    
}    
    
upstream keycloak {    
        #after 3 fails, take out the server for an hoiur    
        server host1:9443 max_fails=3 fail_timeout=3600s;     
        server host2:9443 max_fails=3 fail_timeout=3600s;    
        server host3:9443 max_fails=3 fail_timeout=3600s;    
}    
server {    
#       listen 80 default_server;    
#       listen [::]:80 default_server;    
    
        # SSL configuration    
        #    
        listen 9443 ssl default_server;    
        listen [::]:9443 ssl default_server;    
        include snippets/self-signed.conf;    
        include snippets/ssl-params.conf;    
    
        #root /var/www/html;    
    
        # Add index.php to the list if you are using PHP    
        #index index.html index.htm index.nginx-debian.html;    
    
        server_name _;    
    
    
        #if there is auth in the URL, it must be Keycloak - so send it there    
        location  / {  
		proxy_set_header Host $host:$server_port;    
                proxy_pass https://keycloak;    
        }   
  
}   
  
server {  
#       listen 80 default_server;    
#       listen [::]:80 default_server;    
  
        # SSL configuration    
        #    
        listen 8443 ssl default_server;  
        listen [::]:8443 ssl default_server;  
        include snippets/self-signed.conf;  
        include snippets/ssl-params.conf;  
  
        #root /var/www/html;    
  
        # Add index.php to the list if you are using PHP    
        #index index.html index.htm index.nginx-debian.html;    
  
        server_name _;    
  
  
  
        location / {  
                proxy_pass http://keymicobank;  
        }  
}    
#-------------------------------------------------------  
EOF
