#!/bin/bash

# Display 'get-hash-loki' ASCII art
echo -e "\e[34m
                ,                _           _         _      
  () |         /|   |           | |       \_|_)       | |  o  
  /\/| _ _|_    |___|  __,   ,  | |         |     __  | |     
 /   ||/  |-----|   |\/  |  / \_|/ \ ----- _|    /  \_|/_) |  
/(__/ |__/|_/   |   |/\_/|_/ \/ |   |_/   (/\___/\__/ | \_/|_/

\e[0m"

# Set the font color to yellow
tput setaf 3

echo "Simplifying the process"
echo "Author: bdorr1105"
echo "Version Date: 10 August 2023 (version 1)"
echo

# Reset the font color
tput sgr0

# Ask the user for the directory they want to scan
while true; do
    echo ""
    echo -e "\033[31mPlease type the full directory path you want to scan:\033[0m"
    echo ""
    read -p "Directory: " directory

    # Check if the directory exists
    if [ -d "$directory" ]; then
        break
    else
        echo -e "\e[34m
                ,                _           _         _      
  () |         /|   |           | |       \_|_)       | |  o  
  /\/| _ _|_    |___|  __,   ,  | |         |     __  | |     
 /   ||/  |-----|   |\/  |  / \_|/ \ ----- _|    /  \_|/_) |  
/(__/ |__/|_/   |   |/\_/|_/ \/ |   |_/   (/\___/\__/ | \_/|_/

\e[0m"

# Set the font color to yellow
tput setaf 3

echo "Simplifying the process"
echo "Author: bdorr1105"
echo "Version Date: 10 August 2023 (version 1)"
echo
        echo -e "\033[31mDirectory does not exist. Please try again.\033[0m"
    fi
done

# List the contents of the directory
clear
echo ""
echo -e "\033[31mContents of the directory:\033[0m"
echo ""
ls "$directory"

# Print the present directory in red
echo ""
echo -e "\033[31mPresent directory: $directory\033[0m"
echo ""

# Build a list of filenames in the directory
file_list=("$directory"/*)
file_names=()
for file_path in "${file_list[@]}"; do
  file_names+=("$(basename "$file_path")")
done

# Ask the user for the file they want to scan
echo -e "\033[31mPlease select the file you want to scan:\033[0m"
echo ""
select file_name in "${file_names[@]}"
do
  [ -n "$file_name" ] && break
  echo "Invalid selection. Please try again."
done

# Construct the full path to the file
file="$directory/$file_name"

# Check if the file exists
if [ ! -f "$file" ]; then
  echo "File does not exist. Exiting."
  exit 1
fi

# Calculate the hashes and print them in the required format
md5hash=$(md5sum "$file" | awk '{ print $1 }')
sha1hash=$(sha1sum "$file" | awk '{ print $1 }')
sha256hash=$(sha256sum "$file" | awk '{ print $1 }')
echo ""
echo -e "\033[31mYou can input these hashes in the iocs for Loki Scanner as they are pre-formatted\033[0m"
echo ""
echo -e "\033[33m$md5hash\033[0m;MD5"
echo -e "\033[33m$sha1hash\033[0m;SHA-1"
echo -e "\033[33m$sha256hash\033[0m;SHA-256"

# Ask the user if they would like to append these to a custom file
echo -e "\033[31m"
read -p "Would you like to append these to a custom file? (y/n): " response
echo -e "\033[0m"
if [[ $response =~ ^[Yy]$ ]]; then
  while true; do
    echo ""
    echo -e "\033[31mPlease enter the full path of the file you want to append the hash to:\033[0m"
    read -p "" custom_file
    if [ -f "$custom_file" ]; then
      break
    fi
    echo "File does not exist. Please try again."
  done
  echo ""
  echo -e "\033[31mPlease enter a description of the hash:\033[0m"
  read -p "" hash_description
  
  echo "# $hash_description" >> "$custom_file"
  echo "$md5hash;MD5" >> "$custom_file"
  echo "$sha1hash;SHA-1" >> "$custom_file"
  echo "$sha256hash;SHA-256" >> "$custom_file"
  echo ""
  echo -e "\033[31mHashes successfully appended.\033[0m"
fi
