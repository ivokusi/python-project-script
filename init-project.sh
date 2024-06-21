#!/bin/bash

DefaultREADME()
{
	echo "Hello" >> "$1"
}

echo "Welcome to the init-project script."
echo "We'll help you build your next python project."

# Prompts user for project name.
# Prompts until a valid name is read.
# i.e. Can't just be whitespace

projectName=""

while [ -z $projectName ]
do
	echo "Please enter the project name"
	read projectName
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

if [ -z $readmePath ]
then

	echo "Creating default README.md file."
	DefaultREADME README.md

else

	echo "Copying $readmePath to README.md file."
	cat "$readmePath" >> README.md

fi

python3 -m venv venv

touch requirements.txt .gitignore .env

echo "venv" >> .gitignore
echo ".env" >> .gitignore

git add .
git commit -m "Initialized project from template."

