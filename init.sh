#!/bin/bash

username=""

echo "Please input your username:"

read username

while [ -z "$username" ]; do
	echo "please input your username:"
        read username
done
echo "${username}" > .name

echo "Nice to meet you ${username}"

echo -e "\e[34m1)PLEASE INPUT this command to create tables:\e[0m"

echo -e "\e[32m@createTables;\e[0m"
#echo "@createTables"

echo -e "\e[34m2)AND quit current db session\e[0m"

echo -e "\e[32mexit;\e[0m"

#echo "PASSWORD is ${username^^}"
source /cs/bin/oracle-setup;
sqlplus ${username}/${username^^}@cs;

echo "Now start to insert data"

sqlldr ${username}@CS/${username^^} control=loadHW3-emp.ctl

sqlldr ${username}@CS/${username^^} control=loadHW3-dept.ctl

sqlldr ${username}@CS/${username^^} control=loadHW3-works.ctl

echo -e "\e[32m@ALL DONE.\e[0m"

echo -e "\e[32m@Use ./db.sh to quickly start your DB!\e[0m"

chmod +x db.sh
cp db.sh ~/db.sh
