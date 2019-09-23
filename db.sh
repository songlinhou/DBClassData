#!/bin/bash

username="";

if [ ! -f .name ]; then
	#echo 'file not found'
	while [ -z "$username" ]; do
        	echo "please input your username:"
        	read username
        	#echo "value is $username"
	done
else
	username=$(head -n 1 .name)
	#echo "hi, ${username}"
	while [ -z "$username" ]; do
	        echo "please input your username:"
        	read username
	done
	echo "${username}" > .name
fi


echo "Nice to meet you,${username}"
source /cs/bin/oracle-setup;
sqlplus ${username}/${username^^}@cs;
