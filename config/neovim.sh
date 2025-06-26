#!/bin/bash

package="Neovim"
echo "Copying $package files... "
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
cp -f "$HOME/projects/dev-env/files/nvim/lua/plugins/colorscheme.lua" "$HOME/.config/nvim/lua/plugins/."
cp -f "$HOME/projects/dev-env/files/nvim/lua/config/keymaps.lua" "$HOME/.config/nvim/lua/config/."
cp -f "$HOME/projects/dev-env/files/nvim/lua/config/options.lua" "$HOME/.config/nvim/lua/config/."
echo "Copying $package files Complete."
