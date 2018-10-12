#!/bin/bash

#######################################
# Bash script to update apps on a new system (Ubuntu)
# Written by @ Paulo Lopes
#######################################


echo ' _________________________________________________________________________________ '
echo ' _________________________________________________________________________________ '
echo '                                                                                   '
echo '  _____            _      _           _             _             _ _     _        '
echo ' /__   \___   ___ | | ___| |__   __ _(_)_ __       /_\  _ __  ___(_) |__ | | ___   '
echo '   / /\/ _ \ / _ \| |/ __| '_ \ / _` | | '_ \     //_\\| '_ \/ __| | '_ \| |/ _ \  '
echo '  / / | (_) | (_) | | (__| | | | (_| | | | | |   /  _  \ | | \__ \ | |_) | |  __/  '
echo '  \/   \___/ \___/|_|\___|_| |_|\__,_|_|_| |_|___\_/ \_/_| |_|___/_|_.__/|_|\___|  '
echo '                                            |_____|                                '
echo '                                                                                   '
echo ' _________________________________________________________________________________ '
echo ' _________________________________________________________________________________ '



execut_ansible () {
    if [ -e ~/.npmrc ]
    then
        rm -rf ~/.npmrc
    fi

    if [ -e ~/.curlrc ]
    then
        rm -rf ~/.curlrc
    fi

    if [ -e ~/.curlrc ]
    then
        rm -rf ~/.curlrc
    fi

    echo "###Remove Intellij"
    rm -rf ~/.idea/

    echo "###Remove Intellij"
    rm -rf ~/development/ide/

    echo "###Remove java"
    rm -rf ~/development/java/

    echo "###Remove kitematic"
    rm -rf ~/development/kitematic/

    echo "###Remove maven"
    rm -rf ~/development/maven/

    echo "###Remove sqlDeveloper"
    rm -rf ~/development/sqlDeveloper/

    echo "###Remove tomcat"
    rm -rf ~/development/tomcat/

    echo "###Remove tomcat"
    rm -rf ~/.cache/vmware

    echo "###Sqldeveloper.desktop"
    rm -rf /usr/share/applications/sqldeveloper.desktop

    echo "###Sqldeveloper.desktop"
    rm -rf /usr/share/applications/sqldeveloper.desktop

    echo "###ReInit to install your desktop"
    ansible-playbook playbook.yml --connection=local -become-method=sudo   --extra-vars "ansible_sudo_pass=secret"
    exit 1
}


#!/bin/bash

#######################################
# Bash script to install apps on a new system (Ubuntu)
# Written by @PauloLopes
#######################################

execut_jeap () {
    echo '###Start jeap_ansible'
    if [ -d .git ]; then
        echo '###Update Project'
    git fetch --all
    git pull
    git reset --hard origin/master
    if [ $? = 0 ] ; then
       echo '###Excute ansible ...'
        execut_ansible
    else
        echo "Git failed. Contact Your System Administrator"
    fi
    else
        execut_ansible
    fi;
}

configure_git() {

#   Check if .gitconfig existe
  	if ! [ -e ~/.gitconfig ]
		then

        echo '###Congigure Git..'

    echo "Enter the Global Username for Git:";
    read GITUSER;
    git config --global user.name "${GITUSER}"
    echo "Enter the Global Email for Git:";
    read GITEMAIL;
    git config --global user.email "${GITEMAIL}"

	else
		echo 'git alreedy configuraded'
	fi
}

install_and_configure_git() {

#     Check if git is installed
	if [ -x "$(command -v git)" ]; then
	   echo '###Installing Git..'
       sudo apt-get install git -y
	   configure_git
    else
		configure_git
    fi
	echo '###Git is installed and configured'
}

install_and_configure_ansible () {
    echo '###Installing software-properties-common ...'
    sudo apt-get install software-properties-common

    echo '###Installing ppa:ansible ...'
    sudo apt-add-repository ppa:ansible/ansible

    echo '###Installing update ...'
    sudo apt-get update

    echo '###Installing ansible ...'
    sudo apt-get install ansible

    echo '###Installing curl ...'
    sudo apt-get install curl

    echo '###Installing configure ansible module ...'
    mkdir -p /home/dev/.ansible/plugins/modules

    echo '###Installing gsetting on ansible module ...'
    sudo curl https://raw.githubusercontent.com/jistr/ansible-gsetting/master/gsetting.py > /home/dev/.ansible/plugins/modules/gsetting
}

#Check if ansible exit
if  [ -x "$(command -v ansible)" ]; then
	echo '###Cool ! Ansible work ... We can start'
	install_and_configure_git
	execut_jeap
	exit 1
else
	echo 'Ready:ansible is  installed.' >&2
	install_and_configure_ansible
	install_and_configure_git
	execut_jeap
	exit 1
fi

