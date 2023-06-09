#!/usr/bin/env bash
#
# Install latest Neovim from GitHub

# Set strict mode (http://redsymbol.net/articles/unofficial-bash-strict-mode)
set -euo pipefail

# Install latest Neovim from GitHub
cd "$HOME"
wget --directory-prefix="$HOME" https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x "$HOME"/nvim.appimage
"$HOME"/nvim.appimage --appimage-extract
sudo mv squashfs-root /
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim

# Install packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/packer/start/packer.nvim
