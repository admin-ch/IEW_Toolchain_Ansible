#!/bin/bash

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

    echo '###Git has been configured!'
    git config --list


    echo '###Update Project'
    git fetch
    git pull
fi


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


 echo "###ReInit to install your desktop"
 ansible-playbook playbook.yml --connection=local -become-method=sudo   --extra-vars "ansible_sudo_pass=secret"
