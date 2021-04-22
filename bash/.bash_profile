if [ -f ~/.bashrc ]; then
    
    source ~/.bashrc
fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH="/Applications/MacPorts/Emacs.app/Contents/MacOS:$PATH"
alias py3=python

export PATH=/usr/local/bin:$PATH
eval "$(rbenv init -)"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
source "$HOME/.cargo/env"

