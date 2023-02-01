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
    docker \
    wireshark \
    discord \
    flutter \
    fork \
    nextcloud \
    signal \
    spotify \
    vlc \
    xmind \
    rambox \
    synology-drive \
    visual-studio-code \
    intellij-idea \
    google-drive \
    homebrew/cask-fonts/font-fira-code
do \
    (echo "upgrading $package" && brew upgrade --cask $package && echo "$package installed")
done

echo