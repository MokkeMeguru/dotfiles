#!/usr/bin/env bash
OS=${OS:-"arch"}

if [ ! -d $HOME/Github ]; then
	mkdir $HOME/Github
fi

echo "install hackgen font"
sh ./fonts/hackgen/install.sh

# echo "install zprezto"
# if [ ! -e ${ZDOTDIR:-$HOME}/.zprezto ]; then
# 	git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
# fi

echo "install zplug"
if [ ! -d $HOME/.zplug ]; then
	git clone https://github.com/zplug/zplug $HOME/.zplug
fi

echo "install bundle for vim"
if [ ! -e $HOME/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
fi

echo "install babashka"
if !(type "bb" > /dev/null 2>&1); then
	if [ ! -d $HOME/.bbsk ]; then
		mkdir $HOME/.bbsk
	fi
	bash <(curl -s https://raw.githubusercontent.com/babashka/babashka/master/install) $HOME/.bbsk/
fi

echo "install pyenv"
if [ ! -d $HOME/.pyenv ]; then
	git clone git://github.com/yyuu/pyenv.git ~/.pyenv
fi

echo "install rbenv"
if [ ! -d $HOME/.rbenv ]; then
	git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
fi
