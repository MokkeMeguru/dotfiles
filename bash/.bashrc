#
# ~/.bashrc
#

[[ $- != *i* ]] && return

# aliases
alias np='nano -w PKGBUILD'
alias ls=lsd
alias cp="cp -i"     # confirm before overwriting something
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB
alias more=less
# alias pyton="python3"
alias bb="$HOME/.bbsk/bb"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="$PATH:$GEM_HOME/bin"

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char

alias pbcopy='xsel --clipboard --input'
export PATH="$HOME/.local/bin:$PATH"

alias local-permission='find ./ -user root -type d -print | sudo xargs chown meguru:meguru'
alias git-now='git rev-parse --abbrev-ref HEAD'
alias git-now-hash='git rev-parse HEAD'

# markdownlint
alias markdownlint=markdownlint-cli2

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

export SWIFT_POST_PROCESS_FILE=/usr/local/bin/swiftformat
