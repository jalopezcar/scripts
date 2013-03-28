## Install ##

# Linux
sudo apt-get install ccze colordiff pv

# MAC
sudo port install pv colordiff

# Common
sudo easy_install Pygments
ln -s scripts/colorizrc .colorizrc

# include in .gitconfig
[include]
    path = scripts/gitconfig	


# Enable .aliases in bash_profile
if [ -f ~/scripts/aliases ]; then
 . ~/scripts/aliases
fi
