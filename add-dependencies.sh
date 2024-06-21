#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'

AddDependency()
{

	found=$(grep -Fx $1 requirements.txt > /dev/null; echo $?)

	if [ $found -eq 1 ]
	then 

		pip3 install $1 > /dev/null 2> /dev/null

		if [ $? -eq 1 ]
		then 

			echo -e "${RED}- Couldn't install $1."

		else

			echo $1 >> requirements.txt
			echo -e "${GREEN}+ Installed $1."

		fi

	else

		echo -e "${YELLOW}= $1 satisfied."

	fi

}

AddDependencies()
{

	echo "Add dependency or dependencies"
	read -a deps

	for dep in "${deps[@]}"
	do
		
		AddDependency $dep

	done

}

echo "Welcome to the add-dependencies script."
echo "We'll help you add dependencies to your next python project."

source venv/bin/activate

loopCount=0

while true
do
	
	if [ $loopCount -gt 0 ]
	then

		another=""
		
		while [ "$another" != "y" ] && [ "$another" != "n" ]
		do
			
			echo "Would you like to create another project today [y/n]"
			read another

		done

		if [ $another == "y" ]
		then

			AddDependencies

		else 

			break

		fi

	else

		AddDependencies

	fi
	
	loopCount=$((loopCount + 1))

done


