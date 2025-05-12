#!/bin/bash

# Function to display fancy large text
display_large_text() {
    echo -e "\n\e[1;31m#########################################################\e[0m"
    echo -e "\e[1;31m# $1\e[0m"
    echo -e "\e[1;31m#########################################################\e[0m\n"
}

# Function to show cool ASCII Art Logo
header() {
    echo -e "\e[1;31m"
    figlet "Cleanup Process Started !!!" | lolcat
    echo -e "\e[0m"
    echo -e "##############################################################################################################" | lolcat
}

footer() {
    echo -e "\e[1;31m"
    figlet "Cleanup Process Ended !!!" | lolcat
    echo -e "\e[0m"
    echo -e "##############################################################################################################"| lolcat
}


# Start of cleanup process
header

# Stop Apache service
sudo systemctl stop apache2

# Disable Apache service from starting on boot
sudo systemctl disable apache2

# Remove the portfolio directory
sudo rm -rf /opt/portfolio

# Remove contents of Apache's web root
sudo rm -rf /var/www/html/*

# Optional: Uninstall Apache and Git
sudo apt remove --purge -y apache2 git
sudo apt autoremove -y

# End of the script
footer
