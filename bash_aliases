#
# enable bash_aliases in bash_profile
#
# if [ -f ~/.bash_aliases ]; then
# . ~/.bash_aliases
# fi
#

# Commons
alias p='cd $OLDPWD'
alias l="ls -lah"
alias ll="ls -lah"
alias cls="clear;ls"
alias grep="grep --color=always"

# PHP & Symfony2
alias c="app/console"
alias php.ini="sudo subl /opt/local/etc/php5/php.ini"
alias getcomposer="curl -s http://getcomposer.org/installer | php"
alias sf_entities="app/console generate:doctrine:entities"
alias sf_update="app/console doctrine:schema:update"
alias console="open -a Console"
alias ap="app/console"

# Subversion
alias svndiff="svn diff --diff-cmd=\"colordiff\""
alias svnst="svn status --ignore-externals"
# Display a list of committers sorted by the frequency of commits
alias svncommiters='svn log -q|grep "|"|awk "{print \$3}"|sort|uniq -c|sort -nr'

# Git
#git diff -U10|dwdiff --diff-input -c|less -R
#git remove files which have been deleted
#git rm $(git ls-files --deleted)

# http://www.commandlinefu.com/commands/view/3086/search-commandlinefu.com-from-the-command-line-using-the-api
cmdfu(){ curl "http://www.commandlinefu.com/commands/matching/$@/$(echo -n $@ | openssl base64)/plaintext"; }

