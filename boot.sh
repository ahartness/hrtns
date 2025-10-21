#!/bin/bash

# Set install mode to online since boot.sh is used for curl installations
export HRTNS_ONLINE_INSTALL=true

ansi_art='
   ▄█    █▄       ▄████████    ▄████████     ███     ███▄▄▄▄      ▄████████    ▄████████    ▄████████ 
  ███    ███     ███    ███   ███    ███ ▀█████████▄ ███▀▀▀██▄   ███    ███   ███    ███   ███    ███ 
  ███    ███     ███    ███   ███    ███    ▀███▀▀██ ███   ███   ███    █▀    ███    █▀    ███    █▀  
 ▄███▄▄▄▄███▄▄   ███    ███  ▄███▄▄▄▄██▀     ███   ▀ ███   ███  ▄███▄▄▄       ███          ███        
▀▀███▀▀▀▀███▀  ▀███████████ ▀▀███▀▀▀▀▀       ███     ███   ███ ▀▀███▀▀▀     ▀███████████ ▀███████████ 
  ███    ███     ███    ███ ▀███████████     ███     ███   ███   ███    █▄           ███          ███ 
  ███    ███     ███    ███   ███    ███     ███     ███   ███   ███    ███    ▄█    ███    ▄█    ███ 
  ███    █▀      ███    █▀    ███    ███    ▄████▀    ▀█   █▀    ██████████  ▄████████▀   ▄████████▀  
                              ███    ███                                                            '

clear
echo -e "\n$ansi_art\n"

sudo pacman -Syu --noconfirm --needed git

# Use custom repo if specified, otherwise default to basecamp/omarchy
HRTNS_REPO="${HRTNS_REPO:-ahartness/hrtns}"

echo -e "\nCloning Omarchy from: https://github.com/${HRTNS_REPO}.git"
rm -rf ~/.local/share/omarchy/
git clone "https://github.com/${HRTNS_REPO}.git" ~/.local/share/hrtns >/dev/null

# Use custom branch if instructed, otherwise default to master
HRTNS_REF="${HRTNS_REF:-main}"
if [[ $HRTNS_REF != "master" ]]; then
  echo -e "\e[32mUsing branch: $HRTNS_REF\e[0m"
  cd ~/.local/share/hrtns
  git fetch origin "${HRTNS_REF}" && git checkout "${HRTNS_REF}"
  cd -
fi

echo -e "\nInstallation starting..."
source ~/.local/share/hrtns/install.sh
