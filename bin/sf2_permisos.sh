#!/bin/bash

echo

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

set -o verbose

rm -rf app/cache/*
rm -rf app/logs/*

OS=`uname -s`
if [[ "$OS" == "Linux" ]]; then
	sudo setfacl -R -m u:$APACHE:rwx -m u:$WHOAMI:rwx app/cache app/logs
    sudo setfacl -dR -m u:$APACHE:rwx -m u:$WHOAMI:rwx app/cache app/logs
else 
	sudo /bin/chmod +a "$APACHE_USER allow delete,write,append,file_inherit,directory_inherit" app/cache app/logs
	sudo /bin/chmod +a "$WHOAMI allow delete,write,append,file_inherit,directory_inherit" app/cache app/logs
fi

