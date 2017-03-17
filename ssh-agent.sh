#!/bin/bash
#for i in $(ps auxf | grep ssh-agent | grep -v grep |awk '{print $2}'); do kill $i; done;
clear;

###  FUNCTIONS ###

# colors 
green() {
echo -e "\e[32m$1\e[0m"
}
red() {
echo -e "\e[31m$1\e[0m"
}

# pass / fail check
pass_fail() {
if [[ $? == 0 ]]; then green Pass; else red Fail; fi;
}

# under-lines
lines() {
	for i in $(seq $1); do 
		echo -n "="
	done;
	echo
}


####  MAIN ####

# Creating ssh-agent
echo "Starting ssh-agent :"
lines 20

eval "$(ssh-agent -s)" > /dev/null
pass_fail | tr "\n" "\t";
echo "Creating ssh-agent.." ; 

# Adding ssh-keys to Agent
ssh-add ~/.ssh/kvamshikanth_git_rsa  &> /dev/null
pass_fail | tr "\n" "\t";
echo "Adding ssh keys.." 

# Pulling from git
echo -e "\nPulling GIT directories..."
lines 26
cd /root/GIT
for dir in $(for i in $(ls -1s); do if [[ -d $i ]]; then echo $i; fi; done); 
do 
	cd $dir; 
	git pull &> /dev/null 
	pass_fail | tr "\n" "\t";
	echo "$dir"
	cd ..; 
done; 
cd
echo -e "\n\n\n"



