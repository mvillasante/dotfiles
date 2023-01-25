#!/usr/bin/env bash
#
# Install latest Neovim from GitHub

# Set strict mode (http://redsymbol.net/articles/unofficial-bash-strict-mode)
set -euo pipefail

# Install latest Neovim from GitHub
cd "$HOME"
wget --directory-prefix="$HOME" https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
sudo apt remove neovim neovim-runtime --yes
sudo apt install unzip --yes
sudo apt install ./nvim-linux64.deb

# Install packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/packer/start/packer.nvim
