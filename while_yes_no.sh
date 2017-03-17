while [[ $response != "yes" && $response != "no" ]]; do 
	echo -n "Enter yes / no : "
	read answer
	response=$(echo $answer | tr "A-Z" "a-z")
	if [[ $response != "yes" || $response != "no" ]]; then 
		echo "Please use either "yes" or "no" "
	fi

done

