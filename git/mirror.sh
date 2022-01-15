#!/bin/sh

NUM_PARAMS=3

# Check number of parameters:
## 1 - GitHub user
## 2 - Origin GitHub repo name
## 3 - New GitHub repo name
if [ "$#" -ne $NUM_PARAMS ]; then
    echo "[ERROR] Invalid number of parameters. Found $#, expected $NUM_PARAMS."
    exit 1
fi

username=$1
old_repo=$2
new_repo=$3

# Check if directories exists.
if [ -d "$old_repo" ]; then
    echo "[ERROR] Directory $old_repo already exists."
    exit 1
fi
if [ -d "$new_repo" ]; then
    echo "[ERROR] Directory $new_repo already exists."
    exit 1
fi

##Create a new repository on the command line
echo "[INFO] Creating new repository: $new_repo"
gh repo create $new_repo --private

# Clone git repo to be mirrorred
echo "[INFO] Cloning git repo ($old_repo) to be mirrorred"
git clone --bare https://github.com/$username/$old_repo.git
cd $old_repo.git

# Mirror to GitHub as a new repository
echo "[INFO] Mirroring to GitHub as the new repo ($new_repo)"
git push --mirror https://github.com/$username/$new_repo.git

# Remove folder
echo "[INFO] Cleaning..."
cd ..
rm -rf $old_repo.git
