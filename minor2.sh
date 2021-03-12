#! /bin/bash

#Author: Jeremy Kracy
#EUID: 	 jek0138
#Section: CSCE 3600.002
#Description: If no command line arguments are passed in, prints out users and which 
#	      how many processes each is running, along with total number of users
#     	      and processes running
#	      Accepts user IDs as command line inputs, if IDs are provided it will
#	      only perform the above processes with the provided users


leaving() 										#Function for if a SIGINT is entered
{
	echo " (SIGINT) recieved"
	read -p "Terminate Program? (Y/N) " choice 					#Prompt user to exit
	case $choice in
	Y|y)	echo "Terminating program" 						#Exit
		exit 1;;
		
	*)	echo "Continuing Execution";; 						#continue
	esac
}


trap leaving SIGINT 									#Go to leaving function if ^C is entered



while true 										#Loop until stop is requested
do
	numUser=0 									#set number of users and number of processes to 0
	numProc=0 									#at the start of each loop
	date 										#print out date
	printf "%-20s%-10s\n" "User ID" "Count" 					#print out header for output
	if [ $# -ne 0 ]									#Check if command line arguments were entered
	then
		numUser=$#								#Set num users to number of arguments entered
		for i in $@								#loop through entered users
		do
			let numProc=$numProc+`ps -u $i|wc -l` 				#add up processes for each entered user
			printf "%-20s%-10s\n" $i `ps -u $i|wc -l` 			#Print out each user and its number of processes

		done
	else
		numUser=`ps -eo user|sort|uniq|wc -l` 					#Set num users to the amount of users on
        	numProc=`ps aux|wc -l`							#Set num processes to mount of processes running
		ps -eo user=|sort|uniq -c | gawk '{ printf "%-20s%-10s\n", $2, $1 };'	
	fi
	
	echo "$numUser USERS, TOTAL PROCESSES $numProc" 				#Final output
	echo ""										#new line
	sleep 5										#sleep for 5 seconds


done
