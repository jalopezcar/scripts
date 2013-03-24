#
# enable bash_aliases in bash_profile
#
# if [ -f ~/.bash_aliases ]; then
# . ~/.bash_aliases
# fi
#

# Start services
alias apache-start="sudo /opt/local/apache2/bin/apachectl start"
alias apache="sudo /opt/local/apache2/bin/apachectl restart"
alias apache-stop="sudo /opt/local/apache2/bin/apachectl stop"
alias mongo-start="mongod --dbpath /Users/jalopez/data/db"
alias mysql-start="sudo /opt/local/etc/LaunchDaemons/org.macports.mysql5/mysql5.wrapper start"
alias mysql-stop="sudo /opt/local/etc/LaunchDaemons/org.macports.mysql5/mysql5.wrapper stop"

alias lamp-start="apache-start && mysql-start"
alias lamp-stop="apache-stop && mysql-stop"
alias lamp="lamp-stop && lamp-start"
alias mysql="/opt/local/bin/mysql5"

# Commons
alias p='cd $OLDPWD'
alias ls="ls -G"
alias l="ls -lah"
alias loge="tail -n 5 -f /opt/local/apache2/logs/error_log"
alias loga="tail -n 5 -f /opt/local/apache2/logs/access_log"
alias php.ini="sudo subl /opt/local/etc/php5/php.ini"
alias apache.conf="sudo subl /opt/local/apache2/conf/httpd.conf"
alias hosts="sudo subl /etc/hosts"
alias bash_profile="subl /Users/jalopezcar/.bash_profile"
alias named='sudo subl /etc/named.conf && named-checkconf && sudo launchctl load -w /System/Library/LaunchDaemons/org.isc.named.plist'
alias getcomposer="curl -s http://getcomposer.org/installer | php"
alias puertos="netstat -plnt"

# Symfony2
alias sf_entities="app/console generate:doctrine:entities"
alias sf_update="app/console doctrine:schema:update"
alias console="open -a Console"
alias ap="app/console"

# Clear the screen and list files
alias cls="clear;ls"

