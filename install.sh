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
       ansible-playbook playbook.yml --connection=local -become-method=sudo   --extra-vars "ansible_sudo_pass=secret"
    else
        echo "Git failed. Contact Your System Administrator"
    fi
    else
        ansible-playbook playbook.yml --connection=local -become-method=sudo   --extra-vars "ansible_sudo_pass=secret"
    fi;
}

install_and_configure_git() {
    ## Git ##
    echo '###Installing Git..'
    sudo apt-get install git -y

    if [ -e ~/.gitconfig ]
    then
        git fetch
        git pull
    else
        # Git Configuration
        echo '###Congigure Git..'

        echo "Enter the Global Username for Git:";
        read GITUSER;
        git config --global user.name "${GITUSER}"

        echo "Enter the Global Email for Git:";
        read GITEMAIL;
        git config --global user.email "${GITEMAIL}"

        echo "###Set git configuration";

        git config --global url.https://.insteadOf git://

        git config --global http.proxy http://proxy-bvcol.admin.ch:8080

        git config --global http.sslVerify false

        git config --global https.proxy http://proxy-bvcol.admin.ch:8080

        git config --global http.http://stash.eap.bit.admin.ch.proxy ""

        git config --global http.https://stash.eap.bit.admin.ch.proxy ""

        echo '###Git has been configured!'
        git config --list
    fi

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

    echo '###Excute ansible ...'
    ansible-playbook playbook.yml --connection=local -become-method=sudo   --extra-vars "ansible_sudo_pass=secret"
}



if [[ $(ansible --version 2>&1) == *"ansible"* ]];
then
  echo '###Cool ! Ansible work ... We can start'
  install_and_configure_git
  execut_jeap
else
  echo '###Ansible is currently not install  ...'
 install_and_configure_ansible
 install_and_configure_git
 execut_jeap

fi
