## Install ##


# Linux
sudo apt-get install ccze colordiff pv

# MAC
export PATH="$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH"
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

brew install pv
brew install colordiff
brew install coreutils
brew install binutils
brew install diffutils
brew install ed --default-names
brew install findutils --default-names
brew install gawk
brew install gnu-indent --default-names
brew install gnu-sed --default-names
brew install gnu-tar --default-names
brew install gnu-which --default-names
brew install gnutls --default-names
brew install grep --default-names
brew install gzip
brew install screen
brew install watch
brew install wdiff --with-gettext
brew install wget
brew install bash

brew install emacs
#brew install gdb  # gdb requires further actions to make it work. See `brew info gdb`.
brew install gpatch
brew install m4
brew install make
brew install nano

brew install file-formula
brew install git
brew install less
brew install openssh
#brew install perl518   # must run "brew tap homebrew/versions" first!
brew install python
brew install rsync
brew install svn
brew install unzip
brew install vim macvim
brew install zsh
brew install bash-completion


chsh -s /usr/local/bin/bash
source ~/scripts/symfony2-autocomplete/symfony2-autocomplete.bash



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
