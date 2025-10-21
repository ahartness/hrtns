#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -eEo pipefail

# Define Localtions
export HRTNS_PATH="$HOME/.local/share/hrtns"
export HRTNS_INSTALL="$HRTNS_PATH/install"
export HRTNS_INSTALL_LOG_FILE="/var/log/hrtns-install.log"
export PATH="$HRTNS_PATH/bin:$PATH"

# Install
# scripts will go here
