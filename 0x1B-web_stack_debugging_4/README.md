# Web Stack Debugging #4

## Description
This repository contains solutions to the Web Stack Debugging #4 project, part of the curriculum in ALX Software Engineering program. The project focuses on debugging issues related to web server setup and performance using Nginx and ApacheBench.

## Tasks
- **Task 0: Sky is the limit, let's bring that limit higher**
  - Benchmarking the web server setup with ApacheBench
  - Fixing the configuration to handle requests without failing
  - Ensuring all requests complete successfully

## Files
- `0-the_sky_is_the_limit_not.pp`: Puppet manifest to fix the web server setup.
- `README.md`: This file, providing an overview of the project.

## Requirements
- Ubuntu 14.04 LTS
- Puppet v3.4
- Puppet-lint v2.1.1

## Usage
To apply the Puppet manifest and fix the web server setup:
```bash
$ puppet apply 0-the_sky_is_the_limit_not.pp

```

