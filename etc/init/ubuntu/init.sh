#!/usr/bin/env bash

# Update package lists
sudo apt update

# Install basic packages
sudo apt install -y git curl vim python3 build-essential cmake libtool

# Install Emacs
sudo apt install -y emacs

# Install lsd (modern ls alternative)
LSD_VERSION="1.0.0"
if ! command -v lsd &> /dev/null; then
    LSD_DEB="lsd_${LSD_VERSION}_amd64.deb"
    curl -sLO "https://github.com/Peltoche/lsd/releases/download/${LSD_VERSION}/${LSD_DEB}"
    sudo dpkg -i "${LSD_DEB}"
    rm "${LSD_DEB}"
fi

# Install fzf (fuzzy finder)
sudo apt install -y fzf

# Install direnv
sudo apt install -y direnv

# Install GitHub CLI
if ! command -v gh &> /dev/null; then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update
    sudo apt install -y gh
fi

# Install Go
if ! command -v go &> /dev/null; then
    GO_VERSION="1.19"
    curl -sLO "https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz"
    sudo tar -C /usr/local -xzf "go${GO_VERSION}.linux-amd64.tar.gz"
    rm "go${GO_VERSION}.linux-amd64.tar.gz"
fi

# Create cache directory
mkdir -p $HOME/.cache/tmp