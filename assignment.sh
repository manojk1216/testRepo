#!/bin/bash

# Create the package file
echo "telnet" > packages.txt
echo "ntp" >> packages.txt
echo "httpd" >> packages.txt

# Read the operating system information
os_info=$(uname -a | awk '{print $1}')

# Check if the OS is from the Red Hat Linux family and version 7
if [[ $os_info == *"Linux"* ]]; then
    echo "Installing packages..."

    # Read the package names from the file and install them using a for loop
    while IFS= read -r package; do
        echo "Installing $package..."
        yum install -y "$package"
    done < packages.txt

    echo "Package installation complete."
else
    echo "This script is only compatible with Red Hat Linux family and version 7."
fi
