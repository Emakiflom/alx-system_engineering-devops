# Application Server Setup

This repository contains scripts and configurations for setting up an application server environment using Python, Gunicorn, and Nginx.

## Instructions

Follow the steps below to set up your application server:

### Task 0: Set up development with Python

1. SSH into your web-01 server.
2. Clone the AirBnB_clone_v2 repository.
3. Install the net-tools package.
4. Configure the Flask application to serve content from `/airbnb-onepage/` on port 5000.

```bash
#!/usr/bin/env bash
# This script sets up development environment with Python for serving AirBnB clone v2 on web-01.

# Install net-tools package
sudo apt install -y net-tools

# Clone AirBnB clone v2
git clone https://github.com/your_username/AirBnB_clone_v2.git /opt/AirBnB_clone_v2

# Configure Flask application to serve from /airbnb-onepage/ on port 5000
sed -i 's@app.route("/")@app.route("/airbnb-onepage/")@' /opt/AirBnB_clone_v2/web_flask/0-hello_route.py

```

### Task 1: Set up production with Gunicorn
1. Install Gunicorn and any other required libraries.
2. Start Gunicorn to serve the Flask application on port 5000.

```bash
#!/usr/bin/env bash
# This script sets up production environment with Gunicorn for serving AirBnB clone v2 on web-01.

# Install Gunicorn and required libraries
sudo apt-get install -y gunicorn

# Start Gunicorn to serve Flask application on port 5000
gunicorn --bind 0.0.0.0:5000 web_flask.0-hello_route:app

```
### Task 2: Serve a page with Nginx
1. Configure Nginx to serve the page both locally and on its public IP on port 80.
2. Proxy requests to the process listening on port 5000.

```bash
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    server_name _;

    location /airbnb-onepage/ {
        proxy_pass http://127.0.0.1:5000/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}

```

### Task 3: Add a route with query parameters
1. Configure Nginx to serve the page both locally and on its public IP on port 80.
2. Proxy requests to the route /airbnb-dynamic/number_odd_or_even/(any integer) to the process listening on port 5001.

```bash
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    server_name _;

    location /airbnb-dynamic/number_odd_or_even/ {
        proxy_pass http://127.0.0.1:5001/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}

```
### Task 4: Let's do this for your API
1. Configure Nginx to proxy requests to a Gunicorn instance listening on port 5002.

```bash
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    server_name _;

    location /api/ {
        proxy_pass http://127.0.0.1:5002/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}

```
### Task 5: Serve your AirBnB clone
1. Configure Nginx to proxy requests to a Gunicorn instance serving content from web_dynamic/2-hbnb.py on port 5003.
2. Configure Nginx to serve static assets found in web_dynamic/static/

```bash
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    server_name _;

    location / {
        proxy_pass http://127.0.0.1:5003/;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }

    location /static/ {
        alias /opt/AirBnB_clone_v4/web_dynamic/static/;
    }
}

```
### Task 6: Deploy it!
1. Write a systemd script which starts a Gunicorn process to serve the same content as the previous task (web_dynamic/2-hbnb.py).
2. The Gunicorn process should spawn 3 worker processes.
3. The process should log errors in /tmp/airbnb-error.log.
4. The process should log access in /tmp/airbnb-access.log.
5. The process should be bound to port 5003.
6. Your systemd script should be stored in the appropriate directory on web-01.
7. Make sure that you start the systemd service and leave it running.

Example: gunicorn.service

### Task 7: No service interruption
1. Write a simple Bash script to reload Gunicorn in a graceful way.

```bash
#!/usr/bin/env bash

# Get the PID of the Gunicorn process
PID=$(pgrep gunicorn)

# Reload Gunicorn gracefully
kill -s HUP $PID

```
