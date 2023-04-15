#!/bin/sh
HOMEDIR=$HOME
USERNAME=$(whoami)

USE_SUDO=''
if [ $USERNAME != "root" ];
then
  USE_SUDO="sudo "
fi

if [[ "$(uname -a)" == *"Ubuntu"* || "$(uname -a)" == *"Debian"* ]]; 
then
    # Check if Ansible is installed
    if ! command -v ansible &>/dev/null; 
    then
        # Install Ansible
        echo "Ansible not found. Installing Ansible..."
        sudo apt update
        sudo apt install software-properties-common
        sudo add-apt-repository --yes --update ppa:ansible/ansible
        sudo apt install ansible
    fi
elif [[ "$(uname -a)" == *"Darwin"* ]]; 
then
    # Check if Homebrew is installed
    if ! command -v brew &>/dev/null; 
    then
        # Install Homebrew
        echo "Homebrew not found. Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    # Check if Ansible is installed
    if ! command -v ansible &>/dev/null; 
    then
        # Install Ansible
        echo "Ansible not found. Installing Ansible..."
        brew install ansible
        brew install ansible-lint
        # ansible-galaxy collection install community.general # if not already installed
    fi
else
    echo "Unsupported operating system."
fi

ansible-playbook playbook.yml

echo "Done."
read -n 1 -s -r -p "Press any key to close this terminal..."