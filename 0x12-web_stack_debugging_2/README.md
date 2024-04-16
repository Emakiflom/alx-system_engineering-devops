# 0x12. Web stack debugging #2

## Description

This repository contains solutions to web stack debugging challenges focused on fixing issues related to running software and services on Linux systems. The tasks involve debugging Bash scripts and configuring web servers like Nginx.

## Repository Structure

- `0-iamsomeoneelse`: Bash script to run the `whoami` command under a specified user.
- `1-run_nginx_as_nginx`: Bash script to configure Nginx to run as the `nginx` user and listen on port 8080.

## Requirements

- All scripts are interpreted on Ubuntu 20.04 LTS.
- Scripts must end with a new line.
- Scripts must be executable.
- Scripts must pass Shellcheck without any error.
- Scripts must run without error.
- The first line of all Bash scripts should be exactly `#!/usr/bin/env bash`.
- The second line of all Bash scripts should be a comment explaining what the script is doing.

## Usage

1. Clone the repository:

    ```bash
    git clone https://github.com/<username>/0x12-web_stack_debugging_2.git
    ```

2. Navigate to the directory of the task you want to run/debug:

    ```bash
    cd 0x12-web_stack_debugging_2
    ```

3. Run the script with appropriate permissions:

    ```bash
    ./0-iamsomeoneelse <username>
    ./1-run_nginx_as_nginx
    ```

## Author

Aman Hablu

## License

This project is licensed under the [MIT License](LICENSE).

