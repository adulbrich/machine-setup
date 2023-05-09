# Personal Machine Setup

This repository helps quickly setup a new machine running Windows, macOS, or Ubuntu/Debian with my favorite programs.

Leverages:

- powershell and chocolatey on Windows, and
- bash, ansible, and brew on macOS, and
- bash, ansible, apt, and snap on Ubuntu/Debian.

For Windows, you can use Ansible through WSL, but it requires a little more setup to make it work.

## Windows local script setup

Run `./windows/standalone_windows_setup.ps1` in PowerShell. This checks and install [chocolatey](https://chocolatey.org/) then installs packages (applications) with it. Packages are listed in `./windows/packages.yml`. The packages' names come from the [chocolatey package repository](https://community.chocolatey.org/packages).

## macOS local script setup

Run `./macos/standalone_macos_setup.sh`. It will check and install [brew](https://brew.sh/) and `yq`. It will then proceed to install packages with brew (macOS). Brew packages (taps, formulae, and casks) are defined in `./macos/packages.yml`.

## macOS local Ansible setup

An alternative to the above, you can use [Ansible](https://docs.ansible.com/). to configure your machine. Install brew, then install Ansible with `brew install ansible`. You can then run the playbook using `ansible-playbook ./macos/playbook.yml`. You don't need to specify an inventory file because the `hosts` is set to `localhost` in the playbook.

The playbook will read the `./macos/packages.yml` to find the lists of packages. There is a pre-task configured to check the brew installation (which is redundant for localhost but can be useful if configuring remote macOS hosts).

In order to properly catch errors and avoid the configuration to stop when encountering errors, I've encapstulated my three main tasks in separate YAML files. The post-task reports any errors encountered.

## Ubuntu/Debian local Ansible setup

A simple version of the macOS Ansible configuration, using `apt` and `snap` to install packages an Ubuntu or Debian host. Two tasks are defined, one for `apt` packages and one for `snap` packages. The playbook will read the `./ubuntu/packages.yml` to find the lists of packages. Not tested yet.

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
