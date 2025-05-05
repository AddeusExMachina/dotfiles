#!/bin/bash

# Start a new terminal after having launched this script to actually see the
# expected configuration take place. This stands expecially for fonts.

# Download lua language server
echo "downloading lua language server"
wget https://github.com/LuaLS/lua-language-server/releases/download/3.14.0/lua-language-server-3.14.0-linux-x64.tar.gz
mkdir -p $HOME/.local/share/nvim/language-servers/luals
tar -xvzf lua-language-server-3.14.0-linux-x64.tar.gz -C $HOME/.local/share/nvim/language-servers/luals
rm lua-language-server-3.14.0-linux-x64.tar.gz 

# Download go language server
echo "downloading go language server"
go install golang.org/x/tools/gopls@latest
mkdir -p $HOME/.local/share/nvim/language-servers/gopls/bin
mv $HOME/go/bin/gopls $HOME/.local/share/nvim/language-servers/gopls/bin

DIRECTORIES=(fonts nvim tmux zsh)

for DIR in ${DIRECTORIES[@]}; do
    echo "stowing "$DIR
    stow -t ~ -D $DIR
    stow -t ~ $DIR
done

echo "updating dconf settings"
dconf load / < gnome/dconf-settings.ini
