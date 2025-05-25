#
# ~/.bashrc
#

[[ $- != *i* ]] && return

# Source shell-agnostic aliases and exports
if [ -f "$HOME/.bash_aliases" ]; then
    source "$HOME/.bash_aliases"
fi

# Bash-specific configurations
bind '"\e[H": beginning-of-line'
bind '"\e[F": end-of-line'
bind '"\e[3~": delete-char'
