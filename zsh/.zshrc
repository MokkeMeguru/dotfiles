# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/bin/zsh
# source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
source "${ZDOTDIR:-$HOME}/.zplug/init.zsh"
# utils
zplug "zsh-users/zsh-history-substring-search"
zplug "plugins/git",   from:oh-my-zsh
zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "stedolan/jq", \
    from:gh-r, \
    as:command, \
    rename-to:jq
zplug "b4b4r07/emoji-cli", \
    on:"stedolan/jq"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# theme
zplug "modules/osx", from:prezto, if:"[[ $OSTYPE == *darwin* ]]"
zplug "modules/prompt", from:prezto
zstyle ':prezto:module:prompt' theme 'powerlevel10x'

if ! zplug check --verbose; then
  echo; zplug install
fi

# コマンドをリンクして、PATH に追加し、プラグインは読み込む
zplug load --verbose

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
