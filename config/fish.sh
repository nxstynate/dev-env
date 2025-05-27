#!/bin/bash

package="Fish Shell"
echo "Copying $package files... "
cp "$HOME/projects/dev-env/files/fish/" "$HOME/.config/" -rf
echo "Copying $package files Complete."
