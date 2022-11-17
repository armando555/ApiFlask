# Nginx steps
first we have to install nginx
```
sudo apt install nginx
```

after that, we must to create two files in the path /etc/nginx/sites-available


- The first file is flask-api


this file will contain the next data

```
server {
        listen 80;
        server_name ariosg55-tk.tk www.ariosg55-tk.tk;

        location / {
            include uwsgi_params;
            uwsgi_pass localhost:8080;
            proxy_redirect off;
            proxy_set_header Host $host:$server_port;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Host $server_name;
            proxy_ssl_name $host;
            proxy_ssl_server_name       on;
            proxy_ssl_session_reuse     off;
        }
}
```

- The second file is front-react


this file will contain the next data

```
server {
         listen 80;
         listen [::]:80;
         root /var/www/html/react/;
         index index.html index.htm;
         # MODIFY SERVER_NAME EXAMPLE
         server_name react.ariosg55-tk.tk;
         location / {
              try_files $uri $uri/ =404;
         }
}

```

now, we have to disable the default nginx site with this command 
```
sudo unlink /etc/nginx/sites-enabled/default
```
Now we must make a folder to save the build data of the react. Next, copy all contents from the build directory to the react directory and give the user-group of the that folder:
```
sudo mkdir /var/www/html/react
sudo cp -r /home/admin/build/* /var/www/html/react/
sudo chown -R www-data:www-data /var/www/html/react
```

and link the new files to the sites-enabled with the next commands
```
sudo ln -s /etc/nginx/sites-available/flask-api /etc/nginx/sites-enabled
sudo ln -s /etc/nginx/sites-available/front-react /etc/nginx/sites-enabled
```
to verify the syntax of the nginx file
```
sudo nginx -t
```

finally, if the syntax is ok. We must restart nginx service
```
sudo systemctl restart nginx
```

# Docker Flask app

Now, we must install docker https://docs.docker.com/engine/install/debian/


after that, we need to run 
```
docker compose up --build -d
```
In this command we are running the flask app dockerized. In this case we are exposing the port 8080 locally to the 5000 port in the docker that have the app. So in the nginx we use the local port 8080 ("uwsgi_pass localhost:8080;").

# React app
We must run the command in the path "react-app/hello-world/"  to compile the react-app
```
npm run build
```
Now we have to compress the built folder
```
tar cvf dist.tar build
```
and push to the repository or do a scp to the machine


This is a example of a scp
```
scp dist.tar  root@11.11.11.11:~/
```
## Now in the server
make pull if you did a push to the repository or if you did a scp to the server please verify with "ls" that the file is in the home


decompress the folder
```bash
tar xvf dist.tar
```

Next, copy all contents from the build directory to the react directory and give the user-group of the that folder:
```
sudo cp -r /home/admin/build/* /var/www/html/react/
sudo chown -R www-data:www-data /var/www/html/react
```

