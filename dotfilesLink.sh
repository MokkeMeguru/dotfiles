#!/bin/sh
DOTPATH=${DOTPATH:-"${HOME}/dotfiles"}
LOAD_BASH=${LOAD_BASH:-"false"}
OS=${OS:-"arch"}

# bash
if [ "$LOAD_BASH" = "true" ]; then
  echo "Sync bash settings"
  ln -sf $DOTPATH/bash/.bashrc $HOME/.bashrc
  ln -sf $DOTPATH/bash/.bash_profile $HOME/.bash_profile
fi

# zsh
ln -sf $DOTPATH/zsh/.zshrc $HOME/.zshrc
ln -sf $DOTPATH/zsh/.zshenv $HOME/.zshenv
ln -sf $DOTPATH/bash/.bash_profile $HOME/.zprofile
ln -sf $HOME/dotfiles/zsh/.zpreztorc $HOME/.zpreztorc

# sheldon
mkdir -p $HOME/.config/sheldon
ln -sf $DOTPATH/sheldon/plugins.toml $HOME/.config/sheldon/plugins.toml

# wezterm
mkdir -p $HOME/.config/wezterm
ln -sf $DOTPATH/wezterm/wezterm.lua $HOME/.config/wezterm/wezterm.lua

# starship
ln -sf $DOTPATH/starship/starship.toml $HOME/.config/starship.toml

# vim
ln -snf $DOTPATH/vim/.vimrc $HOME/.vimrc
ln -snf $DOTPATH/vim/.vimrc.keymap $HOME/.vimrc.keymap
ln -snf $DOTPATH/vim/.ideavimrc $HOME/.ideavimrc

# emacs
ln -snf $DOTPATH/doom.d $HOME/.doom.d

# p10k
ln -snf $DOTPATH/p10k/.p10k.zsh $HOME/.p10k.zsh

# textlint
ln -snf $DOTPATH/textlint/.textlintrc.json $HOME/.textlintrc.json

# tmux
ln -snf $DOTPATH/tmux/.tmux.conf $HOME/.tmux.conf

# 1password
ln -snf $DOTPATH/op/plugins.sh $HOME/.config/op/plugins.sh
