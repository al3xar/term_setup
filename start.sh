#!/bin/bash
echo "Setting up al3xar terminal stuff"
# If MacOS then install with brew
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Install oh-my-posh
    brew tap jandedobbeleer/oh-my-posh
    brew install oh-my-posh
    # Install warp terminal
    brew install --cask warp
else
    # Install oh-my-posh
    sudo apt install -y oh-my-posh
    # Install warp terminal
    sudo apt install -y warp-terminal
fi

# Copy nord.yaml file
cp ./warp/nord.yaml $HOME/.warp/themes
cp ./ohmyposh/nord.omp.json $HOME/.config/ohmyposh/themes

# Install LazyLua if not exists
if [ ! -d "$HOME/.config/nvim" ]; then
    mkdir -p $HOME/.config/nvim
fi
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# Install LazyLua
git clone https://github.com/al3xar/lazy_starter $HOME/.config/nvim

# Install font FiraCode
oh-my-posh font install FiraCode
# Install on oh-my-posh theme on zsh
echo "eval \"\$(oh-my-posh init zsh --config ~/.config/ohmyposh/nord.omp.json)\"" >> ~/.zshrc
