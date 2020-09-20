#!/bin/zsh
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias more=less

xhost +local:root > /dev/null 2>&1


alias pyton="python3"
export PIPENV_PYTHON="$HOME/.pyenv/shims/python"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH

export LD_LIBRARY_PATH=/opt/cuda/lib64:${LD_LIBRARY_PATH}
export PATH=/opt/cuda/bin:l${PATH}
export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export WORKON_HOME="$HOME/Github/virtualenvs"
eval "$(pyenv init -)"
#if [ -x "$(command -v fish)" ]; then
#	exec fish
#fi

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin;
