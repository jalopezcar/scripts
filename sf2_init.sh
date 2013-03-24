#!/bin/bash
# Install and configure Symfony2

echo

VERSION=2.2.0

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

wget http://symfony.com/download?v=Symfony_Standard_Vendors_"$VERSION".tgz
tar xvfz Symfony_Standard_Vendors_"$VERSION".tgz
mv Symfony/* .
rmdir Symfony
rm Symfony_Standard_Vendors_"$VERSION".tgz
mkdir -p app/cache
mkdir -p app/logs
rm -rf app/cache/*
rm -rf app/logs/*
sudo chmod +a "$APACHE_USER allow delete,write,append,file_inherit,directory_inherit" app/cache app/logs
sudo chmod +a "$WHOAMI allow delete,write,append,file_inherit,directory_inherit" app/cache app/logs
sudo chmod 777 app/config/parameters.ini

cp ../scripts/gitignore .gitignore
git init .
git commit -m "initial commit"

bin/vendors install

echo 
echo 'Future steps..'
echo '- Add host to /etc/hosts'
echo '- app/console doctrine:database:create'
echo '- .gitignore'



