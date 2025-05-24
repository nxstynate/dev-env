#!/bin/bash

package="Neovim"
echo "Copying $package files... "
cp "$HOME/projects/dev-env/files/nvim/" "$HOME/.config/." -rf
echo "Copying $package files Complete."
