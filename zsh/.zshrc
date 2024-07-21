# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

#!/bin/zsh
# load bash settings
source $HOME/.bashrc

# zplug ----------------------------------
# source "${ZDOTDIR:-$HOME}/.zplug/init.zsh"
# # utils
# zplug "zsh-users/zsh-autosuggestions"
# zplug "zsh-users/zsh-completions"
# zplug "chrissicool/zsh-256color"

# zplug "zsh-users/zsh-history-substring-search"
# zplug "plugins/git", from:oh-my-zsh
# if [[ $OSTYPE == darwin* ]]; then
#   zplug "lib/clipboard", from:oh-my-zsh
#   zplug "modules/osx", from:prezto
# fi

# zplug "b4b4r07/emoji-cli", \
#   on:"stedolan/jq"
# zplug "zsh-users/zsh-syntax-highlighting", defer:2

# # theme
# zplug "modules/prompt", from:prezto

# if ! zplug check --verbose; then
#   echo
#   zplug install
# fi

# zplug load

# # zprompt
# autoload -Uz promptinit
# promptinit
# prompt powerlevel10k
# # ------------------------------------------

# xhost +local:root >/dev/null 2>&1

# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(sheldon source)"
eval "$(starship init zsh)"

eval "$(direnv hook zsh)"

eval "$(rbenv init -)"
export PATH="$PATH:$HOME/.rbenv/bin"

# go
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/.goenv/shims:$PATH"

export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"
autoload -Uz compinit && compinit
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

if [[ $OSTYPE == darwin* ]]; then
  source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
  source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
fi

# gnubin
if [ -d "$(brew --prefix)/opt/grep/libexec/gnubin" ]; then
    PATH="$(brew --prefix)/opt/grep/libexec/gnubin:$PATH"
fi
