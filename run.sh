#!/bin/bash

# Check if a filename is provided as an argument
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

filename="$1"

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "Error: File '$filename' not found."
    exit 1
fi

# Display current domains
echo "Current domains in '$filename':"
cat "$filename"

# Prompt user to choose a domain to keep
echo -n "Enter the domain name you want to keep: "
read chosen_domain

# Validate if the chosen domain exists in the file
grep -q "$chosen_domain" "$filename"
if [ $? -eq 0 ]; then
    # Remove unwanted domains
    grep "$chosen_domain" "$filename" > filterdomains.txt
    echo "Domains updated. Only '$chosen_domain' is kept."
else
    echo "Error: Chosen domain not found in '$filename'. No changes made."
fi
