#!/bin/sh

# vim
if [ $1 = "simple" ]; then
    ln -snf ~/dotfiles/vim/.vimrc_simple ~/.vimrc
else
    ln -snf ~/dotfiles/vim/.vimrc ~/.vimrc 
fi
ln -snf ~/dotfiles/vim/.vimrc.keymap ~/.vimrc.keymap

# emacs 
ln -snf ~/dotfiles/.doom.d ~/.doom.d
ln -snf ~/dotfiles/spacemacs/.spacemacs ~/.spacemacs

# alacritty
if [ ! -d = "$HOME/.config/alacritty" ]; then
	mkdir $HOME/.config/alacritty
fi
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -sf ~/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -sf ~/dotfiles/zsh/.zpreztorc ~/.zpreztorc
