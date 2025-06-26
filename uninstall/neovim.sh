#!/bin/bash

sudo pacman -R neovim --noconfirm
echo "Removed Neovim files."
rm -rf "$HOME/.config/nvim"
rm -rf "$HOME/.local/share/nvim"
