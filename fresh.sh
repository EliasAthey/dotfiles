#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -sw $HOME/dotfiles/.zshrc $HOME/.zshrc

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Create a projects directories
mkdir $HOME/Code

# Check for nvm and install if we don't have it
# https://nodejs.org/en/download/package-manager
if test ! $(nvm -v); then
  /bin/bash -c "$(curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh)"
  nvm install node
fi

# Set macOS preferences - we will run this last because this will reload the shell
source ./.macos

echo "...Mac setup complete"
echo ""
echo "Install manually:"
echo "1. EVO (audio interface driver)"
echo ""
echo "Configure manually:"
echo "1. ssh key (/bin/sh ssh.sh)"
echo "2. OBS profiles"
echo "3. tailscale connection"