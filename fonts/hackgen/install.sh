#!/usr/bin/env bash
OS=${OS:-"arch"}

hack_gen_nerd=HackGenNerd_v2.3.2
font_dir=$HOME/dotfiles
asset_dir=$font_dir/assets
install_dir=""

if [ $OS=="macos" ]; then
    install_dir=$HOME/Library/Fonts
elif [ $OS=="arch" ]; then
    install_dir=$HOME/.local/share/fonts
    if [ ! -d $install_dir ]; then
        mkdir -p $install_dir
    fi
fi

run_install=true
if [ $install_dir=="" ] || [ -d "$install_dir/${hack_gen_nerd}" ]; then
    run_install=false
fi

if [ ! -d $font_dir ] && "${run_install}"; then
    echo "make dir to install HackGenNerd fonts ${font_dir}"
    mkdir -p $font_dir
fi

if [ ! -f "${hack_gen_nerd}.zip" ] && "${run_install}"; then
    curl -LO "https://github.com/yuru7/HackGen/releases/download/v2.3.2/${hack_gen_nerd}.zip" 
fi

if "${run_install}"; then
    echo $install_dir
    echo "${hack_gen_nerd}.zip" 
    unzip -d $install_dir "${hack_gen_nerd}.zip" 
    fc-cache -f $install_dir
fi
