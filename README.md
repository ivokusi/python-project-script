# Python-project-script

## Overview

This project is meant to remove the repetitive steps involved in creating a new Python project. 

### init-project.sh

The init-project.sh script:

- creates a virtual enviornment
- creates .env and .gitignore files 
- creates a requirements.txt file for adding library dependencies
- creates a README.md file (default or custom)

To execute the script run the following command:

```bash
bash init-project.sh
```

Answer the prompts requested by the script. 

When asked about the README.md file make sure to pass the relative path from the current directory to the README.md template file you want to use. You'll be prompted for the template file until a valid file is passed.  

### add-dependencies.sh

The add-dependencies.sh script:

Allows users to add dependencies to the python project. No need to initialize the virtual environemnt when running the script. 

The script will also follow 3 states corresponding to:

- installed (Green) 
- statisfied (Yellow)
- error (Red) 

These states occur when the dependency is installed succesfully, when the dependency is already installed, and when the dependency couldn't be installed due to an error with pip, respectively.

To execute the script run the following command:

```bash
bash add-dependencies.sh
```

Answer the prompts requested by the script. Enter whitespace in between dependenies when you want to eneter more than one dependency at a time.

## Cloning the project

Clone the git repository with the following command:

```bash
git clone https://github.com/ivokusi/python-project-script.git
```

## Running the script

Run the following command:

```bash
bash init-project.sh
```

Respond to the queries when prompted

