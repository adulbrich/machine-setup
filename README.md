# Personal Machine Setup

This repository helps quickly setup a new machine running Windows, macOS, or Ubuntu/Debian with my favorite programs.

Leverages:

- powershell and chocolatey on Windows, and
- bash, ansible, and brew on macOS.

## Windows local setup

Run `./windows/local_setup.ps1` in PowerShell. This checks and install [chocolatey](https://chocolatey.org/) then installs packages (applications) with it.

## macOS and Linux setup with Ansible

Run `run.sh`. It will check and install [brew](https://brew.sh/) (macOS) and [Ansible](https://docs.ansible.com/).

It will then proceed to install packages with brew (macOS).

## Ansible Manual Installation

You can check if the installation is successful by running `ansible --version`.

### Install with brew (macOS)

```bash
brew install ansible
brew install ansible-lint
brew link ansible
```

### Install with pip

```bash
sudo -H pip3 install ansible
```
