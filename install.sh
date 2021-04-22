#!/usr/bin/env bash
function usage {
    cat <<EOM
Usage: $(basename "$0") [OPTION] ...
please input the argument
    --help          Display help
    --os VALUE      os [arch, osx]
    --load_bash load dotfile's bashrc/bash_profile
EOM
    exit 2
}

OS="osx"
LOAD_BASH=false

while getopts ":h-:" opt; do
    case "$opt" in
        -)
            case "${OPTARG}" in
                help)
                    usage
                    ;;
                os)
                    echo "--os = ${OPTARG}"
                    ;;
                load_bash)
                    LOAD_BASH=true
                    ;;
            esac
            ;;
        h)
            help
            ;;
    esac
done

cat <<EOM
install settings
	   your os                             : ${OS}
	   load dotfile's bashrc/bash_profile? : ${LOAD_BASH}
EOM




# if [ $1 = "arch" ]; then
# 	sh $HOME/dotfiles/etc/arch/init.sh
# elif [ $1 = "osx" ]; then
# 	sh $HOME/dotfiles/etc/osx/init.sh
# fi

# sh $HOME/dotfiles/dotfilesDepends.sh $1
# sh $HOME/dotfiles/dotfilesLink.sh $1 $2
# sh $HOME/dotfiles/dotfilesAfter.sh

# # prezto
# setopt EXTENDED_GLOB
# for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
# 	ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
# done

cat <<EOM

Please run chsh to set default shell

	   chsh -s $(which zsh)

EOM
