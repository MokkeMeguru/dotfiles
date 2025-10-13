#!/usr/bin/env bash
DOTPATH=${DOTPATH:-"${HOME}/dotfiles"}

echo $DOTPATH
function usage {
    cat <<EOM
Usage: $(basename "$0") [OPTION] ...
please input the argument
    --help/-h  Display help
    -o VALUE   os [arch, osx, ubuntu]
    -l         load dotfile's bashrc/bash_profile
EOM
    exit 2
}

OS="osx"
LOAD_BASH="false"
no_args="true"

while getopts "o:lh-:" opt; do
    case $opt in
        -)
            case "${OPTARG}" in
                help)
                    usage
                    ;;
            esac
            ;;
        o)
            OS=${OPTARG}
            ;;
        l)
            LOAD_BASH="true"
            ;;
        h)
            usage
            ;;
        *)
            usage
            ;;
    esac
    no_args="false"
done

if [ $no_args == "true" ]; then
    usage
    exit 1
fi

if [ $OS == "arch" ] || [ $OS == "osx" ] || [ $OS == "ubuntu" ]; then
    echo "--os = ${OS}"
else
    echo "os is choices from [arch, osx, ubuntu]"
    exit 1
fi

cat <<EOM
install settings
	   your os                             : ${OS}
	   load dotfile's bashrc/bash_profile? : ${LOAD_BASH}
EOM

if [ "$OS" = "arch" ]; then
    sh $DOTPATH/etc/init/arch/init.sh
elif [ "$OS" = "osx" ]; then
    sh $DOTPATH/etc/init/osx/init.sh
elif [ "$OS" = "ubuntu" ]; then
    sh $DOTPATH/etc/init/ubuntu/init.sh
fi

OS=${OS} sh $DOTPATH/dotfilesDepends.sh
OS=${OS} LOAD_BASH=${LOAD_BASH} sh $DOTPATH/dotfilesLink.sh
sh $HOME/dotfiles/dotfilesAfter.sh

cat <<EOM

TOOD: 
      1. run chsh to set default shell

          chsh -s $(which zsh)

      2. set your font as "HackGen35Nerd Console" (macos) or "HackGenNerd"

      3. open new term and wait a minute to install plugin install

      3. if you want to use gcloud, install gcloud

EOM
