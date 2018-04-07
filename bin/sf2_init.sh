#!/bin/bash
# Install and configure Symfony2

echo

FILE="Symfony_Standard_2.2.0.tgz"

OS=$(uname)
case "$OS" in
"Linux")
    echo "O.S. detected: Linux"    
    ;;
"Darwin")    
    echo "O.S. detected: Mac"    
    ;;    
*)    
    echo "O.S. detected: $OS Not supported yet"
    exit;
    ;;     
esac


APACHE_USER=$(ps axho user,comm|grep -E "httpd|apache"|uniq|grep -v "root"|awk 'END {print $1}')
if test -z "$APACHE_USER"
then
    echo "Error: apache user not found "$APACHE_USER
    exit
else
    echo "Apache user: "$APACHE_USER
fi

WHOAMI=$(whoami)
if test -z "$WHOAMI"
then
    echo "Error: whoami fails"
    exit
else
    echo "Default user "$WHOAMI
fi


if [[ ! -z `ls -A` ]]; then 
    echo "Error: directory not empty"
    echo
    exit
fi

echo "Directory: "$(pwd)
set -o verbose

wget -O ${FILE} http://symfony.com/download?v=${FILE}
tar xvfz ${FILE}
shopt -s dotglob nullglob
mv Symfony/* .
rmdir Symfony
rm ${FILE}
mkdir -p app/cache
mkdir -p app/logs
rm -rf app/cache/*
rm -rf app/logs/*
sf2_permisos.sh
sudo chmod 777 app/config/parameters.yml
wget --no-check-certificate https://raw.github.com/phpjal/scripts/master/gitignore
git init .
git add .
git commit -m "initial commit"
composer.phar install



