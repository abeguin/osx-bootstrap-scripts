#!/usr/bin/env bash

set -Eeuo pipefail

echo

echo "installing packages from Cask"
for package in \
    firefox \
    google-cloud-sdk \
    iterm2 \
    jumpcut \
    keepassxc \
    menumeters \
    postman \
    rancher-destkop \
    discord \
    flutter \
    fork \
    nextcloud \
    signal \
    spotify \
    vlc \
    xmind \
    rambox \
    visual-studio-code \
    intellij-idea \
    google-drive \
    google-chrome \
    slack \
    homebrew/cask-fonts/font-fira-code \
    bitwarden
do \
    (echo "upgrading $package" && brew upgrade --cask $package && echo "$package installed")
done

echo