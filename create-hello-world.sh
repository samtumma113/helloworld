#!/bin/bash

echo "=============================="
echo " Creating Hello World Test Repo "
echo "=============================="

# 1. Create project directory
mkdir -p helloworld
cd helloworld || exit

# 2. Create Hello World files
echo "Creating Hello World files..."

# Text file
echo "Hello World!" > hello.txt

# Shell script
echo '#!/bin/bash' > hello.sh
echo 'echo "Hello World!"' >> hello.sh
chmod +x hello.sh

# Python file
echo 'print("Hello World from Python!")' > hello.py

# 3. Initialize Git repo
echo "Initializing Git repository..."
git init

# 4. Add all files
git add .

# 5. Make first commit
git commit -m "Initial commit - Hello World test repo"

echo "=============================="
echo " Local repo created successfully! "
echo "=============================="

# OPTIONAL: Push to GitHub
read -p "Do you want to connect to a GitHub repo? (y/n): " pushgithub

if [ "$pushgithub" = "y" ]; then
  read -p "Enter your GitHub repository URL (example: https://github.com/USER/helloworld.git): " repoURL
  
  git branch -M main
  git remote add origin "$repoURL"
  git push -u origin main
  
  echo "=============================="
  echo " Repo pushed to GitHub! "
  echo "=============================="
else
  echo "Skipping GitHub push. Local repository ready."
fi
