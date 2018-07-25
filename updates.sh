#!/bin/bash

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
}


if [ -e ~/.gitconfig ]
then
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



