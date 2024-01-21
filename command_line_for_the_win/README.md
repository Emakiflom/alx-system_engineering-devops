# Command Line for the Win

This project involves completing various tasks using the command line. As each task is completed, the corresponding task name will turn green.

## Project Requirements

### General

- A README.md file, at the root of the folder of the project, is mandatory.
- This project will be manually reviewed.
- As each task is completed, the name of that task will turn green.
- Create a screenshot, showing that you completed the required levels.
- Push this screenshot with the right name to GitHub, in either the PNG or JPEG format.

### Specific

- In addition to completing the project tasks and submitting the required screenshots to GitHub, you are also required to demonstrate the use of the SFTP (Secure File Transfer Protocol) command-line tool to move your local screenshots to the sandbox environment.

## SFTP File Transfer

Follow these steps to use the SFTP command-line tool to move your local screenshots to the sandbox environment:

1. **Take Screenshots:**
   - Take screenshots of the completed levels as mentioned in the general requirements.
   - Save the screenshots inside the directory: `/root/alx-system_engineering-devops/command_line_for_the_win/`

2. **Open Terminal:**
   - Open a terminal or command prompt on your local machine.

3. **Connect to Sandbox Environment:**
   - Use the SFTP command-line tool to establish a connection to the sandbox environment.
   - Command: `sftp username@hostname`
   - Enter the password when prompted.

4. **Navigate to Directory:**
   - Once connected, navigate to the directory where you want to upload the screenshots.
   - Command: `cd /path/to/sandbox/directory`

5. **Upload Screenshots:**
   - Use the SFTP `put` command to upload the screenshots from your local machine to the sandbox environment.
   - Command: `put local_screenshot.png`
   - Repeat for each screenshot.

6. **Confirm Transfer:**
   - Confirm that the screenshots have been successfully transferred by checking the sandbox directory.
   - Command: `ls`

7. **Push to GitHub:**
   - Proceed to push the screenshots to GitHub as mentioned in the initial requirements.

8. **Documentation:**
   - Include the steps you followed to use the SFTP command-line tool in your project’s README.md file. This will help the reviewers understand how you performed the file transfer using SFTP.

## Manual QA Review

It is your responsibility to request a review for this project from a peer. If no peers have been reviewed, you should request a review from a TA or staff member.


