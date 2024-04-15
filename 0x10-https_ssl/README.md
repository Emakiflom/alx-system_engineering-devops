# 0x10. HTTPS SSL

## Description

This project covers the concepts of HTTPS SSL, including its main roles, the purpose of encrypting traffic, and SSL termination. The tasks focus on configuring domain zones, adding subdomains, and writing Bash scripts to display information about subdomains.

## Learning Objectives

Upon completing this project, you should be able to explain the following concepts without the help of Google:

### General

- What is HTTPS SSL and its two main roles
- The purpose of encrypting traffic
- What SSL termination means

## Requirements

### General

- Allowed editors: vi, vim, emacs
- All your files will be interpreted on Ubuntu 16.04 LTS
- All your files should end with a new line
- A README.md file, at the root of the folder of the project, is mandatory
- All your Bash script files must be executable
- Your Bash script must pass Shellcheck (version 0.3.7) without any error
- The first line of all your Bash scripts should be exactly #!/usr/bin/env bash
- The second line of all your Bash scripts should be a comment explaining what is the script doing

## Tasks

### 0. World wide web

Configure your domain zone so that the subdomain www points to your load-balancer IP (lb-01). Add other subdomains to make life easier, and write a Bash script that will display information about subdomains.

- Add the subdomain www to your domain and point it to your lb-01 IP
- Add the subdomains lb-01, web-01, and web-02 to your domain and point them to their respective IPs
- Bash script must accept 2 arguments: domain and subdomain
- Output format: The subdomain [SUB_DOMAIN] is a [RECORD_TYPE] record and points to [DESTINATION]

## Usage

# Secure HAProxy with Let's Encrypt on Ubuntu 20.04

This guide explains how to secure HAProxy with SSL termination using Let's Encrypt certificates on Ubuntu 20.04.

## Installation

### Step 1: Install HAProxy

```bash
sudo apt-get update
sudo apt-get install haproxy
```
### Step 2: Configure HAProxy
Edit the HAProxy configuration file:
```bash
sudo nano /etc/haproxy/haproxy.cfg
```
Add the following configuration:
```bash
frontend haproxy_balancer
    bind *:80
    mode http
    default_backend web-servers

frontend https
    bind *:443 ssl crt /etc/letsencrypt/live/www.ema2tel.tech/fullchain.pem
    http-request add-header X-Forwarded-Proto https
    default_backend web-backend

backend web-servers
    balance roundrobin
    option forwardfor
    server 330126-web-01 54.158.180.95:80 check
    server 330126-web-02 100.26.10.90:80 check

backend web-backend
    balance roundrobin
    server 330126-web-01 54.158.180.95:80 check
    server 330126-web-02 100.26.10.90:80 check
```
### Step 3: Obtain SSL Certificate with Certbot

```bash
sudo service haproxy stop
sudo certbot certonly --standalone --preferred-challenges http --http-01-port 80 -d www.ema2tel.tech
```
Output:
```bash
IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/www.ema2tel.tech/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/www.ema2tel.tech/privkey.pem
   Your cert will expire on 2024-07-14. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot
   again. To non-interactively renew *all* of your certificates, run
   "certbot renew"
```
### Step 4: Update Certificate Files
```bash
cat /etc/letsencrypt/live/www.ema2tel.tech/cert.pem > /etc/letsencrypt/live/www.ema2tel.tech/fullchain.pem && cat /etc/letsencrypt/live/www.ema2tel.tech/privkey.pem >> /etc/letsencrypt/live/www.ema2tel.tech/fullchain.pem
```
### Step 5: Start HAProxy
```bash
sudo service haproxy restart

```
