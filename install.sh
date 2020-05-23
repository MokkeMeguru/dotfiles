#!/bin/bash
if [ $# -ne 2 ]; then
	echo "please input the argument" 1>&2
	echo "1. OS [arch, ubuntu]" 1>&2
	echo "2. Complexity [simple, deep]" 1>$2
	exit 1
fi

if [ $1 = "arch" ]; then
	sh $HOME/dotfiles/OS/arch.sh
elif [ $1 = "ubuntu" ]; then
	echo "not implement error" 1>&2
	exit 1
fi

sh $HOME/dotfiles/dotfilesDepends.sh
sh $HOME/dotfiles/dotfilesLink.sh $2
sh $HOME/dotfiles/dotfilesAfter.sh
