# Ansible Ubuntu setup
Ansible roles to setup Ubuntu desktop 18 This playbook is focused on quickly deploying a "ready to use" dev machine.


## Ansible on Ubuntu 18.04

To begin exploring Ansible as a means of managing our various servers, we need to install the Ansible software on at least one machine. We will be using an Ubuntu 14.04 VPS instance for this section.

The best way to get Ansible for Ubuntu is to add the project's PPA (personal package archive) to your system.

To do this effectively, we need to install the software-properties-common package, which will give us the ability to work with PPAs easily. (This package was called python-software-properties on older versions of Ubuntu.)


## Installation

1) Open a unix terminal

2) In terminal, go to the Ansible project folder. (copy paste the following command)
	cd Desktop/jeap-ansible/

3) Run the 'desktop_install.sh' script. (copy paste the following command)
	./desktop_install.sh

4) Set your name and email infos


5) Wait until the Virtual Machine reboot (20 minu)
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
| ripgrep                  | Install [ripgrep](https://github.com/jimhester/ripgrep) (grep++)                            |
| sift                     | Install [Sift](https://sift-tool.org/) tool, a fast and powerful alternative to grep                                                                                                                                                                                                                                                  |
| zsh                      | Install [ZSH](http://www.zsh.org/) and create a [zshrc file](https://github.com/Benoth/ansible-ubuntu/blob/master/roles/zsh/files/zshrc) for the current user / root                                                                                                                                                                  |
| | **Desktop tools** |
| Unity Teak Tool          | Install [Unity Teak Tool ](https://www.fossmint.com/best-ubuntu-apps/ ) from source and apply some gsettings                                                         |
| adapta-theme             | Install [Adapta Theme](https://github.com/tista500/Adapta/) from source and apply some gsettings                                                         |
| arc-theme                | Install [Arc Theme](https://github.com/horst3180/arc-theme) from source and apply some gsettings                                                         |
| atom                     | Install [Atom](https://atom.io/) from [WebUpd8 PPA](https://launchpad.net/~webupd8team/+archive/ubuntu/atom) and [Sync Settings](https://atom.io/packages/sync-settings) plugin                                                                                                                                                       |
| chromium                 | Install [Chromium](https://www.chromium.org/). May also install plugins and set policies                                                                                                                                                                                                                                              |
| desktop                  | Install a lot of usefull packages (meld, tilda, vlc, xclip)                                                                                                                                                                                                                                                                           |
| desktop-autostart        | Update autostart handling (unhide all apps, create, remove...)                                                                                                                                                                                                                                                                        |
| desktop-cleanup          | Remove Unity sh... integrations and install Nautilus plugins                                                                                                                                                                                                                                                                          |
| desktop-preferences-unity | This one is very personal. Imports all my Unity preferences                                                                                                                                                                                                                                                                          |
| indicator-sysmonitor     | Install [indicator-sysmonitor](https://github.com/fossfreedom/indicator-sysmonitor) from [FOSSFreedom PPA](https://launchpad.net/~fossfreedom/+archive/ubuntu/indicator-sysmonitor)                                                                                                                                                   |
| vagrant                  | Install [Vagrant](https://www.vagrantup.com/) from online deb file                                                                                                                                                                                                                                                                    |
| min                      | Install [Min browser](https://minbrowser.github.io/min/) from online deb file                                                                                                                                                                                                                                                         |
| | **bspwm** |
| bspwm                    | Compile [bspwm binary tree tiling window manager](https://github.com/baskerville/bspwm) from source.                                                                                                                                                                                                                                  |
| bspwm-environment        | Install [various packages](https://github.com/Benoth/ansible-ubuntu/blob/master/roles/bspwm-environment/tasks/main.yml) to create a desktop environment                                                                                                                                                                               |
| bspwm-panel              | Compile [lemonbar, xdo, xtitle, etc](https://github.com/Benoth/ansible-ubuntu/blob/master/roles/bspwm-panel/tasks/main.yml) from source to handle a panel                                                                                                                                                                             |
| sxhkd                    | Compile [sxhkd keyboard events daemon](https://github.com/baskerville/sxhkd) from source.                                                                                                                                                                                                                                             |
| | **Dev tools** |
| composer                 | Install [Composer](https://getcomposer.org/), PHP Dependency Manager                                                                                                                                                                                                                                                                  |
| gulp                     | Install [Gulp](http://gulpjs.com/) as a global package using NPM                                                                                                                                                                                                                                                                      |
| webpack                  | Install [webpack](https://webpack.github.io/docs/) as a global package using NPM                                                                                                                                                                                                                                                      |
| | **Services & server tools** |
| docker                   | Install [Docker](https://www.docker.com/) and Docker compose from Docker deb repository                                                                                                                                                                                                                                               |
| nodejs                   | Install [NodeJS](https://nodejs.org/en/) from Node deb repository                                                                                                                                                                                                                                                                     |
| phantomjs                | Install [PhantomJS](http://phantomjs.org/)                                                                                                                                                                                                                                                                                            |
| python                   | Install [Python](https://www.python.org/)                                                                                                                                                                                                                                                                                             |
| redis                    | Install [Redis](http://redis.io/)                                                                                                                                                                                                                                                                                                     |
| ssh                      | Install [OpenSSH Server](http://www.openssh.com/)                                                                                                                                                                                                                                                                                     |
| | **Others** |
| dotfiles                 | Clone my personal [dotfiles](https://github.com/Benoth/dotfiles) Git repository and their dependencies                                                                                                                                                                                                                                |
| projects-installer       | Clone my repository [projects-installer](https://github.com/Benoth/projects-installer), used to deploy my personal and clients projects (Ansible based)                                                                                                                                                                               |
