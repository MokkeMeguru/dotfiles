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
source "${ZDOTDIR:-$HOME}/.zplug/init.zsh"
# utils
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"

zplug "zsh-users/zsh-history-substring-search"
zplug "plugins/git",   from:oh-my-zsh
if [[ $OSTYPE == darwin* ]]; then
  zplug "lib/clipboard", from:oh-my-zsh
  zplug "modules/osx", from:prezto
fi 
zplug "stedolan/jq", \
    from:gh-r, \
    as:command, \
    rename-to:jq
zplug "b4b4r07/emoji-cli", \
    on:"stedolan/jq"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# theme
zplug "modules/prompt", from:prezto

if ! zplug check --verbose; then
  echo; zplug install
fi

zplug load

# zprompt
autoload -Uz promptinit
promptinit
prompt powerlevel10k
# ------------------------------------------

xhost +local:root > /dev/null 2>&1

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
