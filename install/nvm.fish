#!/usr/bin/env fish

# Install Fisher (Fish plugin manager)
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher

# Install nvm.fish
fisher install jorgebucaran/nvm.fish

echo "✅ Install complete for Node Version Manager (nvm.fish)."

echo ""
echo "👉 To install the latest version of Node:"
echo "nvm install latest"

echo "👉 To install the latest LTS version of Node:"
echo "nvm install lts"

echo "👉 To install a specific version of Node:"
echo "nvm install v15.3.0"
