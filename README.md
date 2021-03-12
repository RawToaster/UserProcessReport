# UserProcessReport

## Description
A Bash script tasked with listing all of the current users signed into the system and how many processes each user is running. It reruns the report every 5 seconds. Catches the SIGINT signal and prompts the user with a termination prompt.

### No command line args
This script an be run in 2 modes. The first is when executed with no command line arguments. In this case, every user signed into the system is printed with every process being run at the given time, this is continuously checked every 5 seconds until manual termination.
### Command line args
If a userID is entered as a command line argument, only that user and its processes will be printed. Multiple users can be checked this way by including multiple userIDs as command line arguments. This is also checked every 5 seconds until termination.

## To terminate
The script can be stopped by the user by envoking the SIGINT signal, `CTRL - c` usually. This will bring up a prompt for the user to confirm they would like to terminate the script.
