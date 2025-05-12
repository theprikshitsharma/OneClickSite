#!/bin/bash

while true; do
    CHOICE=$(whiptail --title "Website Deployment Menu" --menu "Choose an option:" 20 60 10 \
    "1" "Install Prerequisites" \
    "2" "Check Website Status" \
    "3" "Show Website URL" \
    "4" "Cleanup" \
        "5" "Exit" 3>&1 1>&2 2>&3)


    case $CHOICE in
        1)
    GIT_REPO=$(whiptail --inputbox "Enter the GitHub repository link you want to host:" 10 60 3>&1 1>&2 2>&3)

    if [ -n "$GIT_REPO" ]; then
        ./install_apache_and_deploy.sh "$GIT_REPO"
    else
        whiptail --title "Error" --msgbox "❗ No link provided. Aborting installation." 10 50
    fi
    ;;

        2)
            BRIDGED_IP=$(ip -4 addr show enp0s8 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
            HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" --max-time 3 "http://$BRIDGED_IP")
            if [[ "$HTTP_CODE" == "200" ]]; then
                whiptail --title "Status" --msgbox "✅ Website is accessible!" 10 40
            else
                whiptail --title "Status" --msgbox "🚫 Website not accessible. Make sure Apache is running and site is deployed." 10 60
            fi
            ;;
        3)
            BRIDGED_IP=$(ip -4 addr show enp0s8 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
            HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" --max-time 3 "http://$BRIDGED_IP")
            if [[ "$HTTP_CODE" == "200" ]]; then
                whiptail --title "Website URL" --msgbox "🌐 Website is hosted at:\n\nhttp://$BRIDGED_IP" 12 50
            else
	 whiptail --title "Website URL" --msgbox "🚫 Website not accessible. Make sure Apache is installed and running." 12 50
            fi
            ;;
        4)
            ./cleanup.sh
            ;;
        5) break
            ;;

        *)
            break
            ;;
    esac
done

