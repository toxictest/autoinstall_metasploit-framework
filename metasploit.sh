#!/bin/bash

output_figlet=$(figlet -c Script  Written by Dada)
echo "\033[0;032m ${output_figlet}"
echo "#################################################################"
echo "##### THIS IS THE SCRIPT OF Reinstall Metasploit-Framework ######"
echo "#################################################################"

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root"
  exit
fi

# Update package lists
apt update

# Install dependencies
apt install -y curl gnupg

# Add the Metasploit repository and key
curl https://apt.metasploit.com/metasploit-framework.gpg.key | gpg --dearmor > /usr/share/keyrings/metasploit-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/metasploit-archive-keyring.gpg] https://apt.metasploit.com/ trusty main" > /etc/apt/sources.list.d/metasploit-framework.list

# Update package lists again
apt update

# Install Metasploit Framework
apt install -y metasploit-framework

# Display installation completion message
echo "Metasploit Framework has been successfully installed."
