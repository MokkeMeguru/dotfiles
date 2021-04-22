#!/usr/bin/env bash
hack_gen_nerd=HackGenNerd_v2.3.2
font_dir=$HOME/dotfiles
asset_dir=$font_dir/assets

if [ $# != 1 ]; then
    echo "invalid args $*"
    exit 1
elif [ $1 = "macos" ]; then
    install_dir=$HOME/Library/Fonts
elif [ $1 = "arch" ]; then
    install_dir=$HOME/.local/share/fonts
    if [ ! -d $install_dir ]; then
        mkdir -p $install_dir
    fi
fi

run_install=true
if [ -d "$install_dir/${hack_gen_nerd}" ]; then
    run_install=false
fi

if [ ! -d $font_dir ] && "${run_install}"; then
    echo "make dir to install HackGenNerd fonts"
    mkdir -p $font_dir
fi

if [ ! -f "${hack_gen_nerd}.zip" ] && "${run_install}"; then
    curl -LO "https://github.com/yuru7/HackGen/releases/download/v2.3.2/${hack_gen_nerd}.zip" 
fi

if "${run_install}"; then
    unzip -d $install_dir "${hack_gen_nerd}.zip" 
    fc-cache -fv $install_dir
fi

cat <<EOM
Please set your font as "HackGen35Nerd Console" (macos) or "HackGenNerd" 
EOM
