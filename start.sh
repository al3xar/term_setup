#!/bin/bash

echo "Setting up al3xar terminal stuff"
# Install warp terminal
sudo apt install warp-terminal oh-my-posh

# Copy nord.yaml file
cp ./warp/nord.yaml $HOME/.warp/themes
cp ./ohmyposh/nord.omp.json $HOME/.config/oh-my-posh/themes

# Install LazyLua if not install
git clone https://github.com/al3xar/lazy_starter ~/.config/nvim

# reload zshrc
source $HOME/.zshrc

# Install font FiraCode
oh-my-posh font install FiraCode
# Install on oh-my-posh theme on zsh
echo "eval \"\$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/themes/nord.omp.json)\"" >> $HOME/.zshrc
