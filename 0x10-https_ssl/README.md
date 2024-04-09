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

Example usage of the Bash script:

```bash
./0-world_wide_web holberton.online
./0-world_wide_web holberton.online web-02

