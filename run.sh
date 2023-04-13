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
        sudo apt update
        sudo apt install software-properties-common
        sudo add-apt-repository --yes --update ppa:ansible/ansible
        sudo apt install ansible
    fi
elif [[ "$(uname -a)" == *"Darwin"* ]]; 
then
    # Check if Homebrew is installed
    if ! command -v ansible &>/dev/null; 
    then
        # Install Homebrew
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    # Check if Ansible is installed
    if ! command -v ansible &>/dev/null; 
    then
        # Install Ansible
        brew install ansible
        brew install ansible-lint
    fi
else
    echo "Unsupported operating system."
fi

ansible-playbook playbook.yml