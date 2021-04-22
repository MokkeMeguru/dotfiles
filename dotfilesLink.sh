#!/bin/sh

# bash
if [ $1 = "w_bash" ]; then
    
    ln -sf $HOME/dotfiles/.bashrc $HOME/.bashrc
    ln -sf $HOME/dotfiles/.bash_profile $HOME/.bash_profile
fi

# zsh
ln -sf $HOME/dotfiles/zsh/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/zsh/.zpreztorc $HOME/.zpreztorc

# vim
ln -snf $HOME/dotfiles/vim/.vimrc $HOME/.vimrc 
ln -snf $HOME/dotfiles/vim/.vimrc.keymap $HOME/.vimrc.keymap

# emacs 
ln -snf $HOME/dotfiles/.doom.d $HOME/.doom.d

# p10k
if [ $2 = "osx" ]; then
    ln -snf $HOME/dotfiles/p10k $HOME/osx/.p10k.zsh
elif [ $2 = "arch" ]; then
    ln -snf $HOME/dotfiles/p10k $HOME/arch/.p10k.zsh
fi
