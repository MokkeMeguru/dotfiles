#!/bin/bash
if [ ! -d $HOME/Github ]; then
	mkdir $HOME/Github
fi

echo "install hackgen font"
sh ./fonts/hackgen/install.sh $1


# echo "install zprezto"
# if [ ! -e ${ZDOTDIR:-$HOME}/.zprezto ]; then
# 	git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
# fi

echo "install zplug"
if ! [ -x "$(command -v zplug)" ]; then
   curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi

echo "install bundle for vim"
if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi
