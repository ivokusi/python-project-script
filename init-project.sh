#!/bin/bash

DefaultREADME()
{

	echo "# "$1"

## Overview

[project overview]

## Running the Script

Run the following commands to clone the project and download any nessecary python libraries

\`\`\`bash
git clone https://github.com/[project name]
\`\`\`

Once we've successfully copied the repository, run the following commands

### In Windows

\`\`\`bash
python -m venv venv
source venv/Scripts/activate
\`\`\`

\`\`\`bash
pip install -r requirements.txt
\`\`\`

### In Mac

\`\`\`bash
python3 -m venv venv
source venv/bin/activate
\`\`\`

\`\`\`bash
pip3 install -r requirements.txt
\`\`\`

Once we've setup the repository correctly, run the following command

### In Windows

\`\`\`bash
python main.py
\`\`\`

### In Mac

\`\`\`bash
python3 main.py
\`\`\`" > $2

}

CreateProject()
{

	# Prompts user for project name.
	# Prompts until a valid name is read.
	# i.e. Can't just be whitespace

	projectName=""

	while [ -z "$projectName" ] || [ -d "$projectName" ]
	do

	echo "Please enter the project name"
	read projectName

	# Notice user of possible error in their input

	if [ -z "$projectName" ]
	then
		echo "Whitespace Name Error. Project name is empty."
	elif [ -d "$projectName" ]
	then 
		echo "Duplicate Name Error. Project already exists."
	fi

	done

	# Create and change to project directory
	# "" allow for a project name with whitespaces

	mkdir "$projectName" 
	cd "$projectName"

	git init . > /dev/null

	echo "Please enter a README.md template file."
	echo "If left empty will use script default."

	touch README.md

	readmePath=""
	read readmePath

	if [ -z "$readmePath" ]
	then

		DefaultREADME "$projectName" README.md
		echo "Created default README.md file."

	else

		cp ../"$readmePath" .
		echo "Copied "$readmePath" to README.md file."

	fi

	python3 -m venv venv

	echo "Created virtual enviornment."

	touch requirements.txt .gitignore .env

	echo "venv" >> .gitignore
	echo ".env" >> .gitignore

	echo "Created template files."

	git add .
	git commit -m "Initialized project from template." > /dev/null

	echo "Created "$projectName""

	cd ..

}

echo "Welcome to the init-project script."
echo "We'll help you build your next python project."

projectCount=0

while true
do

	if [ $projectCount -gt 0 ]
	then

		another=""
		
		while [ "$another" != "y" ] && [ "$another" != "n" ]
		do
			
			echo "Would you like to create another project today [y/n]"
			read another

		done

		if [ $another == "y" ]
		then

			CreateProject

		else 

			break

		fi

	else

		CreateProject

	fi
	
	projectCount=$((projectCount + 1))

done
