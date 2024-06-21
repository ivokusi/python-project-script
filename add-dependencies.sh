#!/bin/bash

RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'

echo "Welcome to the add-dependencies script."
echo "We'll help you add dependencies to your next python project."

source venv/bin/activate

echo "Add dependency"
read dep

found=$(grep -Fx $dep requirements.txt > /dev/null; echo $?)

if [ $found -eq 1 ]
then 

	pip3 install $dep > /dev/null 2> /dev/null

	if [ $? -eq 1 ]
	then 

		echo -e "${RED}- Couldn't install $dep."

	else

		echo $dep >> requirements.txt
		echo -e "${GREEN}+ Installed $dep."

	fi

else

	echo -e "${YELLOW}= $dep satisfied."

fi
