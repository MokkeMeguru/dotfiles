#!/bin/zsh

source $HOME/.bashrc

eval "$(sheldon source)"
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

# gcc-13
if [[ $OSTYPE == darwin* ]]; then
  export CPPFLAGS="-I/opt/homebrew/opt/gcc@13/include"
  export PATH="/opt/homebrew/opt/gcc@13/bin:$PATH"
fi

# ruby
eval "$(rbenv init -)"
export PATH="$PATH:$HOME/.rbenv/bin"
export LIBRARY_PATH=$LIBRARY_PATH:$(brew --prefix zstd)/lib/

# go
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
export PATH="$GOROOT/bin:$PATH"
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/.goenv/shims:$PATH"

function gotools() {
  go install golang.org/x/tools/gopls@latest
  go install golang.org/x/tools/cmd/goimports@latest
}

# mysql
export PATH="/opt/homebrew/opt/mysql@5.7/bin:$PATH"

# completion
autoload -Uz compinit && compinit
[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

# gcloud
if [[ $OSTYPE == darwin* ]]; then
  source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
  source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
fi

# gnubin
if [ -d "$(brew --prefix)/opt/grep/libexec/gnubin" ]; then
  PATH="$(brew --prefix)/opt/grep/libexec/gnubin:$PATH"
fi

# swift
if [[ $OSTYPE == darwin* ]]; then
  alias clean='rm -rf ~/Library/Developer/Xcode/DerivedData'
fi

# java
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# ai tools
export AIRULE_CLEAN=false
alias claude="~/.claude/local/claude"

function serenamcp() {
  claude mcp add serena -s project -- uv run --directory ~/.claude/local/serena serena-mcp-server --context ide-assistant --project .
}

function githubmcp() {
  claude mcp add --transport http github https://api.githubcopilot.com/mcp -H "Authorization: Bearer ${GITHUB_PAT}"
}

# 1password
source $HOME/.config/op/plugins.sh
