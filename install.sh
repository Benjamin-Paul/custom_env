#!/bin/bash

# Ask Y/n
function ask() {
    read -p "$1 [Y/n] : " resp
    if [ -z "$resp" ]; then
        response_lc="y" # empty is Yes
    else
        response_lc=$(echo "$resp" | tr '[:upper:]' '[:lower:]') # case insensitive
    fi

    [ "$response_lc" = "y" ]
}

# Check if bashrc has been modified already
if grep -q "custom_env install" ~/.bashrc; then
    echo "It seems you already applied this installation... Check your .bashrc"
    exit     
fi

SA="${HOME}/.bash_aliases"

echo '# ------------------- aliases custom_env' >> $SA

# Ask which files should be sourced
echo "Do you want $SA to include : "
for file in aliases/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        if ask "${filename} ?"; then
            cat "$(realpath "$file")" >> "$SA"
        fi
    fi
done

echo '# ------------------- aliases custom_env' >> $SA

# Check what shell is being used
SH="${HOME}/.bashrc"
# ZSHRC="${HOME}/.zshrc"
# if [ -f "$ZSHRC" ]; then
# 	SH="$ZSHRC"
# fi

echo '# ------------------- install custom_env' >> $SH

# Ask which files should be sourced
echo "Do you want $SH to source : "
for file in shell/*; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        if ask "${filename} ?"; then
            echo "source $(realpath "$file")" >> "$SH"
        fi
    fi
done

echo '# ------------------- install custom_env' >> $SH

# Tmux conf	
if ask "Do you want to install .tmux.conf?"; then
    ln -s "$(realpath ".tmux.conf")" ~/.tmux.conf
fi

# Vim conf
if ask "Do you want to install .vimrc?"; then
    ln -s "$(realpath ".vimrc")" ~/.vimrc
fi

# Nvim conf
if ask "Do you want to install .config/nvim ?"; then
    ln -s "$(realpath "./nvim")" ~/.config/nvim
fi

# Lvim conf
if ask "Do you want to install .config/lvim ?"; then
    ln -s "$(realpath "./lvim")" ~/.config/lvim
fi

# Packages installation
if ask "Install required packages ?"; then
    for i in $(cat packages); 
        do sudo apt install $i;
    done
fi
