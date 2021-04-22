if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi


# emacs
export PATH="/Applications/MacPorts/Emacs.app/Contents/MacOS:$PATH"

# python
export PIPENV_PYTHON="$HOME/.pyenv/shims/python"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin;$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
PIPENV_VENV_IN_PROJECT=1
export WORKON_HOME="$HOME/Github/virtualenvs"

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# rust
source "$HOME/.cargo/env"

# go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin;

# cuda
export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=/opt/cuda/lib64:${LD_LIBRARY_PATH}
export PATH=/opt/cuda/bin:l${PATH}

# gcloud
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi
