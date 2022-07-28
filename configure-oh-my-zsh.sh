#!/usr/bin/env bash

set -Eeuo pipefail

echo "configuring ZSH"

# Install oh-my-zsh with oh-my-zsh installtion script
if [[ ! -d ~/.oh-my-zsh ]]
then 
    echo "please install oh-my-zsh first"
else
    # Install custom theme from github
    ([[ -d ~/.oh-my-zsh/custom/themes/spaceship-prompt ]] && echo "spaceship-prompt custom theme already installed") || \
    (echo "installing spaceship-prompt theme" && git clone https://github.com/spaceship-prompt/spaceship-prompt.git ~/.oh-my-zsh/custom/themes/spaceship-prompt --depth=1 && \
    ln -s ~/.oh-my-zsh/custom/themes/spaceship-prompt/spaceship.zsh-theme ~/.oh-my-zsh/custom/themes/spaceship.zsh-theme)

    # Install custom plugins from github
    ([[ -d ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions ]] && echo "zsh-users/zsh-autosuggestions custom plugin already installed") || \
    (echo "installing plugin zsh-users/zsh-autosuggestions" && git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions --depth=1)

    ([[ -d ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ]] && echo "zsh-users/zsh-syntax-highlighting custom plugin already installed") || \
    (echo "installing plugin zsh-users/zsh-syntax-highlighting" && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting --depth=1)

    ([[ -d ~/.oh-my-zsh/custom/plugins/zsh-completions ]] && echo "zsh-users/zsh-completions custom plugin already installed") || \
    (echo "installing plugin zsh-users/zsh-completions" && git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions --depth=1)

    ([[ -d ~/.oh-my-zsh/custom/plugins/autojump ]] && echo "wting/autojump custom plugin already installed") || \
    (echo "installing plugin wting/autojump" && git clone https://github.com/wting/autojump.git ~/.oh-my-zsh/custom/plugins/autojump --depth=1)

    ([[ -d ~/.oh-my-zsh/custom/plugins/notes ]] && echo "aperezdc/zsh-notes custom plugin already installed") || \
    (echo "installing plugin aperezdc/zsh-notes" && git clone https://github.com/aperezdc/zsh-notes.git ~/.oh-my-zsh/custom/plugins/notes --depth=1)

    ([[ -d ~/.oh-my-zsh/custom/plugins/autoenv ]] && echo "Tarrasch/zsh-autoenv custom plugin already installed") || \
    (echo "installing plugin Tarrasch/zsh-autoenv" && git clone https://github.com/Tarrasch/zsh-autoenv.git ~/.oh-my-zsh/custom/plugins/autoenv --depth=1)

    # Copy configuration file 
    cp .zshrc.local ~/.zshrc

    # Add zsh to trusted shells list
    (grep -q "/bin/zsh" /etc/shells && echo "ZSH is already a trusted shell") || \
    (echo "setting ZSH as trusted shell" && sudo bash -c "echo /bin/zsh >> /etc/shells")

    # Set zsh as an active shell
    ([[ $SHELL == "/bin/zsh" ]] && echo "ZSH is already the active shell") || \
    (echo "changing default shell for ZSH" && chsh -s "/bin/zsh")

    echo
fi