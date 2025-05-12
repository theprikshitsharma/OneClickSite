#!/bin/bash

# Display large text
display_large_text() {
    echo -e "\n\e[1;32m#########################################################\e[0m"
    echo -e "\e[1;32m# $1\e[0m"
    echo -e "\e[1;32m#########################################################\e[0m\n"
}

# Header
header() {
    echo -e "\e[1;34m"
    figlet "Starting Installation!" | lolcat
    echo -e "\e[0m"
    echo -e "##############################################################################################################" | lolcat
}

# Footer
footer() {
    echo -e "\e[1;34m"
    figlet "Installation Done!" | lolcat
    echo -e "\e[0m"
    echo -e "##############################################################################################################" | lolcat
}

# Check input
if [ -z "$1" ]; then
    echo "[ERROR] No GitHub link provided."
    exit 1
fi

GIT_REPO="$1"
LOG_FILE="install.log"

header
display_large_text "Installing Apache & Cloning: $GIT_REPO"
# Install packages (log only errors)
sudo apt update 2>> "$LOG_FILE"
sudo apt install -y apache2 git 2>> "$LOG_FILE"
sudo systemctl enable apache2 2>> "$LOG_FILE"

# Clone repo and deploy (log only errors)
sudo rm -rf /opt/website
sudo git clone "$GIT_REPO" /opt/website 2>> "$LOG_FILE"

sudo rm -rf /var/www/html/*
sudo cp -r /opt/website/* /var/www/html/

sudo systemctl restart apache2 2>> "$LOG_FILE"

# Show website URL
IP=$(hostname -I | awk '{print $1}')
echo -e "\n\e[1;36m[INFO] Website is live at: http://$IP\e[0m"

footer

