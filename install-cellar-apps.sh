#!/usr/bin/env bash

set -Eeuo pipefail

([[ -f $(brew --prefix)/bin/brew ]] && echo "Homebrew already present") || \
(echo "installing Homebrew" && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")

echo

echo "installing packages from Cellar"
for package in \
    ansible \
    autoenv \
    awscli \
    bash-completion \
    coreutils \
    curl \
    docker \
    fzf \
    gnu-sed \
    golang \
    gpg \
    helm \
    jq \
    kubectl \
    nmap \
    rsync \
    shellcheck \
    tig \
    vim \
    wget \
    yq \
    wireshark \
    wireguard-go \
    zsh \
    packer \
    watch \
    transmission-cli \
    docker-completion \
    k9s \
    nvm \
    jenv \
    tfenv \
    virtualenv \
    python \
    autojump \
    gitmoji \
    arp-scan \ 
    maven \
    pandoc \
    fq \
    bitwarden-cli \
    htop \
    graphviz
do \
    (brew list "$package" >/dev/null 2>&1 && echo "$package already installed") || \
    (echo "installing $package" && brew install $package && echo "$package installed")
done