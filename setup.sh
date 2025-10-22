#!/bin/bash

set -e 

HRTNS_PATH="$HOME/.local/share/hrtns"
HRTNS_GIT="https://github.com/ahartness/hrtns"

echo "HRTNS Setup Script"

if [ -d "$HRTNS_PATH"]; then
    echo "ERROR: $HRTNS_PATH alread exists"
    echo "If you want to reinstall, please remove or backup the existing directory first:"
    echo "  mv ~/.local/share/dotfiles ~/.local/share/dotfiles.backup"
    exit 1
fi

if ! command -v git &> /dev/null; then
    echo "Git is not installed. Installing Git....."
    sudo pacman -S --noconfirm git
    echo "Git installed successfully"
fi

# Create the config directory if one does not exist
mkdir -p "$HOME/.config"

# Create the Repo Directory if one does not exist
mkdir -p "$HOME/.local/share/hrtns"

echo "Cloning hrtns repository"
git clone "$HRTNS_GIT" "$HRTNS_PATH"

echo
echo "Repo Clone Successful"
echo "Starting Installation"
echo

bash "$HRTNS_PATH/install/install"


