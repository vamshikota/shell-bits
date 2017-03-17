#!/bin/bash
echo -n "Enter the number of iterations :"
read num
msg="Hello World"
count=1
while [ $count -le $num ]
do 
	echo $msg
	count=$(expr $count + 1)
done



