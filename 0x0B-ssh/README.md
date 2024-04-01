# 0x0B. SSH

This repository contains solutions to the SSH project for Holberton School. The project focuses on understanding servers, SSH, creating SSH RSA key pairs, and connecting to remote hosts using SSH RSA key pairs.

## Resources

Read or watch:
- [What is a (physical) server - text](https://www.ibm.com/cloud/learn/servers)
- [What is a (physical) server - video](https://www.youtube.com/watch?v=3vQyTM1XGhU)
- [SSH essentials](https://www.digitalocean.com/community/tutorials/ssh-essentials-working-with-ssh-servers-clients-and-keys)
- [SSH Config File](https://www.ssh.com/academy/ssh/config)
- [Public Key Authentication for SSH](https://www.digitalocean.com/community/tutorials/how-to-set-up-ssh-keys-2)
- [How Secure Shell Works](https://www.youtube.com/watch?v=ORcvSkgdA58)
- [SSH Crash Course](https://www.youtube.com/watch?v=hQWRp-FdTpc) (Long, but highly informative. Watch this if configuring SSH is still confusing. It may be helpful to watch at x1.25 speed or above.)

For reference:
- [Understanding the SSH Encryption and Connection Process](https://www.digitalocean.com/community/tutorials/understanding-the-ssh-encryption-and-connection-process)
- [Secure Shell Wiki](https://en.wikipedia.org/wiki/Secure_Shell)
- [IETF RFC 4251](https://tools.ietf.org/html/rfc4251) (Description of the SSH Protocol)
- [Internet Engineering Task Force](https://www.ietf.org/)
- [Request for Comments](https://en.wikipedia.org/wiki/Request_for_Comments)

man or help:
- ssh
- ssh-keygen
- env

## Learning Objectives

At the end of this project, you should be able to explain the following concepts without the help of Google:

- What is a server
- Where servers usually live
- What is SSH
- How to create an SSH RSA key pair
- How to connect to a remote host using an SSH RSA key pair
- The advantage of using `#!/usr/bin/env bash` instead of `/bin/bash`

## Requirements

- Allowed editors: vi, vim, emacs
- All your files will be interpreted on Ubuntu 20.04 LTS
- All your files should end with a new line
- A README.md file, at the root of the folder of the project, is mandatory
- All your Bash script files must be executable
- The first line of all your Bash scripts should be exactly `#!/usr/bin/env bash`
- The second line of all your Bash scripts should be a comment explaining what the script is doing

# SSH Access Setup Guide

This guide provides step-by-step instructions for setting up SSH access to servers using private keys. Follow these instructions to securely connect to remote servers from your system or PC.

## Prerequisites
- Git Bash installed on your system.
- Access to the private key associated with the SSH connection.

## Instructions

1. Open Git Bash.
2. Create a directory for SSH:
    ```bash
    mkdir ~/.ssh
    ```
3. Edit SSH configuration:
    ```bash
    vi ~/.ssh/config
    ```
    Configure it as follows:
    ```text
    Host web-01
        HostName 54.158.180.95
        User ubuntu
        IdentityFile ~/.ssh/school
    Host web-02
        HostName 100.26.10.90
        User ubuntu
        IdentityFile ~/.ssh/school
    Host lb-1
        HostName 100.25.16.118
        User ubuntu
        IdentityFile ~/.ssh/school
    ```
4. Edit private key file:
    ```bash
    vi ~/.ssh/school
    ```
    Add the private key and save it.

5. Set permissions on SSH directory and files:
    ```bash
    chmod 700 ~/.ssh && chmod 600 ~/.ssh/school
    ```

6. Connect to the server:
    - To connect to `web-01`:
        ```bash
        ssh web-01
        ```
    - Or using the IP address directly:
        ```bash
        ssh ubuntu@54.158.180.95
        ```

    Repeat the above command for other servers (`web-02`, `lb-1`) using their respective aliases.

