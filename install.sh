## Install ##

# Common
sudo easy_install Pygments

# Linux
sudo apt-get install ccze colordiff pv

# MAC
sudo port install pv colordiff

# include in .gitconfig
[include]
    path = scripts/gitconfig	


# Enable .aliases in bash_profile
if [ -f ~/scripts/aliases ]; then
 . ~/scripts/aliases
fi
