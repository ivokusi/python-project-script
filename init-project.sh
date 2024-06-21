#!/bin/bash

DefaultREADME()
{

	echo "# people-weave-acm-scraper

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

echo "Welcome to the init-project script."
echo "We'll help you build your next python project."

# Prompts user for project name.
# Prompts until a valid name is read.
# i.e. Can't just be whitespace

projectName=""

while [ -z "$projectName" ] || [ -d "$projectName" ]
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

if [ -z "$readmePath" ]
then

	DefaultREADME README.md
	echo "Created default README.md file."

else

	cat "$readmePath" >> README.md
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

