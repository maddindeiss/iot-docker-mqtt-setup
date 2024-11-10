#!/bin/bash

echo "Setup IoT environment"

echo "Create default folders"
bash ./scripts/dirFixSetup.sh

echo "Update and upgrade sources"
sudo apt update && sudo apt full-upgrade && sudo rpi-update -y ;


echo "Install rclone"
curl https://rclone.org/install.sh | sudo bash
echo "Please run 'rclone config' to configure the rclone onedrive backup"

echo "Install Packages (git, build-essential, python3, python3-pi,p gcc, libffi-dev, libssl-dev, python3-dev)"
PACKAGES="git build-essential python3 python3-pip gcc libffi-dev libssl-dev python3-dev"
sudo apt install $PACKAGES -qy

echo "Install Docker and Docker-Compose"

if command_exists docker; then
    echo "Docker already installed" >&2
else
    echo "Install Docker" >&2
    curl -fsSL https://get.docker.com | sh
    
    RESTART_REQUIRED="true"
    
    sudo usermod -aG docker $(id -un)
fi

if command_exists docker-compose; then
    echo "docker-compose already installed" >&2
else
    echo "Install docker-compose" >&2

    RESTART_REQUIRED="true"

    sudo apt install -y docker-compose
    sudo usermod -aG docker $(id -un)
fi

echo "Setup finished"

if [ "$RESTART_REQUIRED" == "true" ]; then
    if (whiptail --title "Restart Required" --yesno "It is recommended that you restart your device now. Select yes to do so now" 20 78); then
      sudo reboot
    fi
fi


function command_exists() {
    command -v "$@" >/dev/null 2>&1
}
