#!/usr/bin/env bash

set -Eeuo pipefail

# Install oh-my-zsh with oh-my-zsh installtion script
([[ -d ~/.oh-my-zsh ]] && echo ".oh-my-zsh already installed") || \
(echo "installing oh-my-zsh" && sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)")
