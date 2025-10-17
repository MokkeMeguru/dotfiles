if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# emacs
export PATH="/Applications/MacPorts/Emacs.app/Contents/MacOS:$PATH"

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv >/dev/null; then eval "$(rbenv init -)"; fi

# rust
export PATH="$HOME/.cargo/bin:$PATH"

# cuda
export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=/opt/cuda/lib64:${LD_LIBRARY_PATH}
export PATH=/opt/cuda/bin:${PATH}

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin;$PATH"
if which pyenv >/dev/null; then eval "$(pyenv init --path)"; fi

# gcloud
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi

if which direnv >/dev/null; then eval "$(direnv hook bash)"; fi
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export PATH="$HOME/Github/graalvm-ce-java16-21.1.0/bin:$PATH"

export PGROOT="/var/lib/postgres"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f "/opt/homebrew/bin/brew" ]; then eval "$(/opt/homebrew/bin/brew shellenv)" ]; fi
