# Ansible Ubuntu setup
Ansible roles to setup Ubuntu desktop 18 This playbook is focused on quickly deploying a "ready to use" dev machine.


## Ansible on Ubuntu 18.04

To begin exploring Ansible as a means of managing our various servers, we need to install the Ansible software on at least one machine. We will be using an Ubuntu 14.04 VPS instance for this section.

The best way to get Ansible for Ubuntu is to add the project's PPA (personal package archive) to your system.

To do this effectively, we need to install the software-properties-common package, which will give us the ability to work with PPAs easily. (This package was called python-software-properties on older versions of Ubuntu.)


## Installation

1) Open a unix terminal

2) In terminal, go to the Ansible project folder. (copy paste the following command)
	cd Desktop/IEW_Toolchain_Ansible/

3) Run the 'install.sh' script. (copy paste the following command)
	./install.sh

4) Set your name and email infos


5) Wait until the end 
   WARNING: The full installation can be 20 minutes long

Then you need to customize the playbook `ansible-desktop.yml` (or create a new one) to suit your needs. Every roles are disabled by default.

Run `ansible-playbook ansible-desktop.yml --ask-become-pass` and enter your sudo password to run the playbook

## Roles included


| Role                     | Description                                                                                                                                                                                                                                                                                                                           |
| ------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| | **General** |
| proxy                   | Install a lot of usefull packages (curl, htop, less, zip ... see [corresponding task file](https://github.com/Benoth/ansible-ubuntu/blob/master/roles/common/tasks/main.yml))                                                                                                                                                         |
| locales                  | Configure system locales and timezone                                                                                                                                                                                                                                                                                                 |
| java                     | Install Default Java JDK                                                                                                                                                                                                                                                                                                              |
| | **Desktop tools** |
| atom                     | Install [Atom](https://atom.io/) from [WebUpd8 PPA](https://launchpad.net/~webupd8team/+archive/ubuntu/atom) and [Sync Settings](https://atom.io/packages/sync-settings) plugin                                                                                                                                                       |
| notepad ++               | Install [notepad++](https://notepad-plus-plus.org/) from [WebUpd8 PPA](https://notepad-plus-plus.org/download/v7.5.8.html)                                                                                                                                                       |
| chromium                 | Install [Chromium](https://www.chromium.org/). May also install plugins and set policies                                                                                                                                                                                                                                              |
| desktop                  | Install a lot of usefull packages (meld, tilda, vlc, xclip)                                                                                                                                                                                                                                                                           |
| desktop-cleanup          | Remove Unity sh... integrations and install Nautilus plugins                                                                                                                                                                                                                                                                          |
| desktop-preferences-unity | This one is very personal. Imports all my Unity preferences                                                                                                                                                                                                                                                                          |                                                                                                                                                                                                                                                        |
| | **bspwm** |
| bspwm                    | Compile [bspwm binary tree tiling window manager](https://github.com/baskerville/bspwm) from source.                                                                                                                                                                                                                                  |
| bspwm-environment        | Install [various packages](https://github.com/Benoth/ansible-ubuntu/blob/master/roles/bspwm-environment/tasks/main.yml) to create a desktop environment                                                                                                                                                                               |
| bspwm-panel              | Compile [lemonbar, xdo, xtitle, etc](https://github.com/Benoth/ansible-ubuntu/blob/master/roles/bspwm-panel/tasks/main.yml) from source to handle a panel                                                                                                                                                                             |
| sxhkd                    | Compile [sxhkd keyboard events daemon](https://github.com/baskerville/sxhkd) from source.                                                                                                                                                                                                                                             |
| | **Dev tools** |
| composer                 | Install [Composer](https://getcomposer.org/), PHP Dependency Manager                                                                                                                                                                                                                                                                  |
| angular-cli                  | Install [angular-cli](https://cli.angular.io/) as a global package                                                                                                                                                                                                                                                      |
| | **Services & server tools** |
| docker                   | Install [Docker](https://www.docker.com/) and Docker compose from Docker deb repository                                                                                                                                                                                                                                               |
| nodejs                   | Install [NodeJS](https://nodejs.org/en/) from Node deb repository                                                                                                                                                                                                                                                                     |
| python                   | Install [Python](https://www.python.org/)                                                                                                                                                                                                                                                                                             |
| redis                    | Install [Redis](http://redis.io/)                                                                                                                                                                                                                                                                                                     |
| | **Others** |
| dotfiles                 | Clone my personal [dotfiles](https://github.com/Benoth/dotfiles) Git repository and their dependencies                                                                                                                                                                                                                                |
| projects-installer       | Clone my repository [projects-installer](https://github.com/Benoth/projects-installer), used to deploy my personal and clients projects (Ansible based)                                                                                                                                                                               |
