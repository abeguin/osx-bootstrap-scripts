#!/usr/bin/env bash

set -Eeuo pipefail

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
    intellij-idea \
    google-drive \
    google-chrome \
    font-fira-code \
    bitwarden \
    background-music
do \
    (echo "upgrading $package" && brew upgrade --cask $package && echo "$package installed")
done

echo
