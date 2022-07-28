#!/usr/bin/env bash

set -Eeuo pipefail

([[ -f $(brew --prefix)/bin/brew ]] && echo "Homebrew already present") || \
(echo "installing Homebrew" && /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)")

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
    google-drive
do \
    (brew list "$package" --cask >/dev/null 2>&1 && echo "$package already installed") || \
    (echo "installing $package" && brew install $package && echo "$package installed")
done

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
    terraform \
    tig \
    vim \
    wget \
    yq \
    wireshark \
    wireguard-go \
    zsh \
    packer \
    watch \
    font-fira-code \
    transmission-cli \
    docker-completion \
    k9s \
    nvm \
    jenv \
    tfenv \ 
    virtualenv \
    python \
    autojump
do \
    (brew list "$package" >/dev/null 2>&1 && echo "$package already installed") || \
    (echo "installing $package" && brew install $package && echo "$package installed")
done

echo "configuring ZSH"

# Install oh-my-zsh with oh-my-zsh installtion script
([[ -d ~/.oh-my-zsh ]] && echo ".oh-my-zsh already installed") || (echo "installing oh-my-zsh" && sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)")

# Install custom theme from github
([[ -d ~/.oh-my-zsh/custom/themes/spaceship-prompt ]] && echo "spaceship-prompt custom theme already installed") || \
(echo "installing spaceship-prompt theme" && sh -c "$(git clone https://github.com/spaceship-prompt/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt --depth=1)" && \
sh -c "$(ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme)")

# Install custom plugins from github
([[ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]] && echo "zsh-users/zsh-autosuggestions custom plugin already installed") || \
(echo "installing plugin zsh-users/zsh-autosuggestions" && sh -c "$(git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions --depth=1)")

([[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]] && echo "zsh-users/zsh-syntax-highlighting custom plugin already installed") || \
(echo "installing plugin zsh-users/zsh-syntax-highlighting" && sh -c "$(git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting --depth=1)")

([[ -d ~/.oh-my-zsh/custom/plugins/zsh-completions ]] && echo "zsh-users/zsh-completions custom plugin already installed") || \
(echo "installing plugin zsh-users/zsh-completions" && sh -c "$(git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions --depth=1)")

([[ -d ~/.oh-my-zsh/custom/plugins/autojump ]] && echo "wting/autojump custom plugin already installed") || \
(echo "installing plugin wting/autojump" && sh -c "$(git clone https://github.com/wting/autojump.git ~/.oh-my-zsh/custom/plugins/autojump --depth=1)")

([[ -d ~/.oh-my-zsh/custom/plugins/notes ]] && echo "aperezdc/zsh-notes custom plugin already installed") || \
(echo "installing plugin aperezdc/zsh-notes" && sh -c "$(git clone https://github.com/aperezdc/zsh-notes.git ~/.oh-my-zsh/custom/plugins/notes --depth=1)")

([[ -d ~/.oh-my-zsh/custom/plugins/autoenv ]] && echo "Tarrasch/zsh-autoenv custom plugin already installed") || \
(echo "installing plugin Tarrasch/zsh-autoenv" && sh -c "$(git clone https://github.com/Tarrasch/zsh-autoenv.git ~/.oh-my-zsh/custom/plugins/autoenv --depth=1)")

# Copy configuration file 
cp .zshrc.local ~/.

# Add zsh to trusted shells list
(grep -q "/bin/zsh" /etc/shells && echo "ZSH is already a trusted shell") || \
(echo "setting ZSH as trusted shell" && sudo bash -c "echo /bin/zsh >> /etc/shells")

# Set zsh as an active shell
([[ $SHELL == "/bin/zsh" ]] && echo "ZSH is already the active shell") || \
(echo "changing default shell for ZSH" && chsh -s "/bin/zsh")

echo