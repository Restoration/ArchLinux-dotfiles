#!/bin/bash

# Get packages
#---------------------------------------------------
# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Setup dotfiles
#---------------------------------------------------
DOT_FILES=(
  .bashrc
  .bash_profile
  .zshrc
  .vimrc
  .vim
  .xinitrc
  .Xdefaults
  .tmux.conf
  .fehbg
)

for file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done


mkdir -p $HOME/.config

CONFIG_DOT_FILES=(
  awesome
  nvim
  roxterm.sourceforge.net
  ranger
)

for file in ${CONFIG_DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/.config/$file $HOME/.config/$file
done

# urxvt setup
#---------------------------------------------------
xrdb -m ~/.Xdefaults

# Change my default shell for zsh
#---------------------------------------------------
chsh -s /bin/zsh

