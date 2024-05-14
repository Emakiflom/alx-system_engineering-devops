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
Install Gunicorn and any other required libraries.
Start Gunicorn to serve the Flask application on port 5000.

```bash

