# osx-bootstrap-scripts

## Description

This script aims to bootstrap a new macosx some applications, oh-my-zsh configuration, theme and plugins

## Usage

### Install cellar applications (with homebrew)

``./install-cellar-apps.sh``

Will install (remove from the script applications you don't want):
- ansible
- autoenv
- awscli
- bash-completion
- coreutils
- curl
- docker
- fzf
- gnu-sed
- golang
- gpg
- helm
- jq
- kubectl
- nmap
- rsync
- shellcheck
- tig
- vim
- wget
- yq
- wireshark
- wireguard-go
- zsh
- packer
- watch
- font-fira-code
- transmission-cli
- docker-completion
- k9s
- nvm
- jenv
- tfenv
- virtualenv
- python
- autojump
- gitmoji

### Install cask applications

```./install-cask-apps.sh```

Will install (remove from the script applications you don't want):
- Firefox
- Google cloud sdk
- Iterm2
- Jumpcut
- KeepassXC
- MenuMeters
- Postman
- Docker
- Wireshark
- Discord
- Flutter
- Fork
- Nextcloud
- Signal
- Spotify
- VLC
- Xmind
- Rambox
- Synology Drive
- Visual Studio Code
- Intellij idea
- Google Drive

### Upgrade casks

As of today, the command `brew upgrade` doesn't upgrade casks and `brew upgrade --casks` doesn't work very well

Keep the list of applications you've installed with homebrew in the ``upgrade-casks.sh`` if you want to upgrade all your casks application at once. 


### Install Oh my zsh
 
```./install-oh-my-zsh.sh```

### Configure Oh my zsh

```./configure-oh-my-zsh.sh```

It will configure oh-my-zsh with : 

- [Oh my zsh plugins](https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins)
  - git
  - ansible
  - aws
  - docker
  - fzf
  - gcloud
  - helm
  - terraform
  - golang
  - jenv
  - ng
  - colored-man-pages
  - mvn
  - kubectl
  - gnu-utils
  - macos
  - gpg-agent
  - iterm2
  - nmap
  - rsync
  - tig
  - brew
- Third party plugins
  - [zsh-users/zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
  - [zsh-users/zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
  - [zsh-users/zsh-completions](https://github.com/zsh-users/zsh-completions)
  - [wting/autojump](https://github.com/wting/autojump)
  - [aperezdc/zsh-notes](https://github.com/aperezdc/zsh-notes)
  - [Tarrasch/zsh-autoenv](https://github.com/Tarrasch/zsh-autoenv)

### Theme

- [spaceship-prompt/spaceship-prompt](https://github.com/spaceship-prompt/spaceship-prompt)

