#!/bin/bash
echo "Setting up al3xar terminal stuff"
# If MacOS then install with brew
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Install oh-my-posh
    brew tap jandedobbeleer/oh-my-posh
    brew install oh-my-posh
    # Install warp terminal
    brew install --cask warp
    # Install lazyvimm deps
    brew install neovim git fzf fd ripgrep luarocks curl lazygit
else
    # Install oh-my-posh
    curl -s https://ohmyposh.dev/install.sh | bash -s
    # Install warp terminal
    sudo apt install -y warp-terminal
    # Install lazyvimm deps
    sudo apt install -y neovim git fzf fd ripgrep luarocks curl lazygit

    # Install warp terminal
    sudo apt install wget gpg
    wget -qO- https://releases.warp.dev/linux/keys/warp.asc | gpg --dearmor > warpdotdev.gpg
    sudo install -D -o root -g root -m 644 warpdotdev.gpg /etc/apt/keyrings/warpdotdev.gpg
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/warpdotdev.gpg] https://releases.warp.dev/linux/deb stable main" > /etc/apt/sources.list.d/warpdotdev.list'
    rm warpdotdev.gpg
    sudo apt update && sudo apt install warp-terminal
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
