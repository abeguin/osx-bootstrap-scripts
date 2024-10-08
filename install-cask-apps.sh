#!/usr/bin/env bash

set -Eeuo pipefail

([[ -f $(brew --prefix)/bin/brew ]] && echo "Homebrew already present") || \
(echo "installing Homebrew" && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)")

echo

echo "installing packages from Cask"
for package in \
    firefox \
    arc \
    google-cloud-sdk \
    iterm2 \
    jumpcut \
    keepassxc \
    menumeters \
    bruno \
    rancher \
    flutter \
    nextcloud \
    vlc \
    xmind \
    visual-studio-code \
    intellij-idea \
    google-drive \
    google-chrome \
    homebrew/cask-fonts/font-fira-code \
    bitwarden \
    background-music
do \
    (brew list "$package" --cask >/dev/null 2>&1 && echo "$package already installed") || \
    (echo "installing $package" && brew install $package && echo "$package installed")
done

echo