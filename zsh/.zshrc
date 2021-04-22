# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/bin/zsh
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias more=less

xhost +local:root > /dev/null 2>&1


# alias pyton="python3"
export PIPENV_PYTHON="$HOME/.pyenv/shims/python"
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

export LD_LIBRARY_PATH=$HOME/.local/lib:$LD_LIBRARY_PATH
export PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig:$PKG_CONFIG_PATH

export LD_LIBRARY_PATH=/opt/cuda/lib64:${LD_LIBRARY_PATH}
export PATH=/opt/cuda/bin:l${PATH}
# export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# export WORKON_HOME="$HOME/Github/virtualenvs"
# eval "$(pyenv init -)"
#if [ -x "$(command -v fish)" ]; then
#	exec fish
#fi

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin;

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/takuya.ebata/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/takuya.ebata/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/takuya.ebata/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/takuya.ebata/google-cloud-sdk/completion.zsh.inc'; fi

export PATH=/usr/local/bin:$PATH
eval "$(rbenv init - zsh)"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
