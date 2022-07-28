#!/usr/bin/env bash

set -Eeuo pipefail

([[ -f /usr/local/bin/brew ]] && echo "Homebrew already present") || \
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

echo

echo "configuring ZSH"
([[ -f ~/.zshrc ]] && echo ".zshrc already present") || (echo "fetching GRML .zshrc" && wget -O ~/.zshrc https://git.grml.org/f/grml-etc-core/etc/zsh/zshrc)

([[ -f ~/.zshrc.local ]] && echo ".zshrc.local already present") || \
(echo "creating .zshrc.local" && cat > ~/.zshrc.local <<EOF
export LANG=en_US.UTF-8

PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"
PATH="$(brew --prefix)/bin:$(brew --prefix)/sbin:$PATH"
export PATH

# FZF
FZF_BASE="$(brew --prefix)/opt/fzf"
export FZF_BASE

# SPACESHIP THEME
SPACESHIP_TIME_SHOW=true
SPACESHIP_USER_SHOW=always
SPACESHIP_USER_COLOR=14
SPACESHIP_TIME_COLOR=14

alias compopt=complete
autoload -U +X bashcompinit && bashcompinit

[[ -f "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc" ]] && \
source "$(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

source "$(brew --prefix)/share/antigen/antigen.zsh"

antigen use oh-my-zsh

antigen bundle git
antigen bundle ansible
antigen bundle aws
antigen bundle docker
antigen bundle fzf
antigen bundle gcloud
antigen bundle helm
antigen bundle terraform
antigen bundle golang
antigen bundle jenv
antigen bundle ng
antigen bundle colored-man-pages
antigen bundle mvn
antigen bundle kubectl
antigen bundle gnu-utils
antigen bundle macos
antigen bundle gpg-agent
antigen bundle iterm2
antigen bundle nmap
antigen bundle rsync
antigen bundle tig
antigen bundle brew

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

antigen bundle wting/autojump
antigen bundle aperezdc/zsh-notes
antigen bundle Tarrasch/zsh-autoenv

antigen theme spaceship-prompt/spaceship-prompt

antigen apply

bindkey "\eOA" history-beginning-search-backward
bindkey "\eOB" history-beginning-search-forward

# JENV
eval "$(jenv init -)"
export JAVA_HOME="$HOME/.jenv/versions/`jenv version-name`"

# Fast copy/paste
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need .url-quote-magic?
}
pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# ZSH Notes plugin
bindkey '^N' notes-edit-widget

([[ -f "$(~)/SynologyDrive/Notes" ]] && echo "$(~)/SynologyDrive/Notes exists") || (echo "Creating home folder for zsh-notes plugin" && mkdir -p "$(~)/SynologyDrive/Notes")
zstyle :notes home '$(~/SynologyDrive/Notes)'

zstyle :notes:widget once no
zstyle :notes:widget:preview enabled yes
zstyle :notes:widget picker fzf
zstyle 'omz:update' mode reminder

# Node version manager
# nvm lazy loading to prevent zsh loading delays on macOS (inspired by @insidewhy)
# Add this to the end of your ~/.zshrc but make sure to remove all existing nvm.sh related code from ~/.zshrc first.
NVM_SH=""
# nvm.sh location depends on installation method
if [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ]; then # Homebrew installer location
  NVM_SH="(brew --prefix)/opt/nvm/nvm.sh"
elif [ -s " ~/.nvm/nvm.sh" ]; then # Direct installer location
  NVM_SH="~/.nvm/nvm.sh"
fi
if [ ! -z "$NVM_SH" ]; then
  export NVM_DIR="~/.nvm"
  nvm_cmds=(nvm node npm)
  for cmd in $nvm_cmds ; do
    alias $cmd="unalias $nvm_cmds && unset nvm_cmds && . $NVM_SH && $cmd"
  done
fi

eval export NVM_DIR="/Users/abe/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

EOF
)

(grep -q "$(brew --prefix)/bin/zsh" /etc/shells && echo "ZSH is already a trusted shell") || \
(echo "setting ZSH as trusted shell" && sudo bash -c "echo $(brew --prefix)/bin/zsh >> /etc/shells")

([[ "$SHELL" == "$(brew --prefix)/bin/zsh" ]] && echo "ZSH is already the active shell") || \
(echo "changing default shell for ZSH" && chsh -s "$(brew --prefix)/bin/zsh")

echo