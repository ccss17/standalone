#!/bin/bash
set -xe
STANDALONE_ZSH_PATH=~/.standalone/zsh
mkdir $STANDALONE_ZSH_PATH -p
cp standalone-zsh.sh $STANDALONE_ZSH_PATH
cp libncursesw.so.6 $STANDALONE_ZSH_PATH
cp libm.so.6 $STANDALONE_ZSH_PATH
cp zle.so $STANDALONE_ZSH_PATH
cp zsh $STANDALONE_ZSH_PATH
# tar xvf ohmyzsh.tar.gz
# cp -r .oh-my-zsh ~
if [[ ! -d ~/.oh-my-zsh ]]; then
    wget -q -O install_ohmyzsh.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
    # CHSH=no RUNZSH=no sh install_ohmyzsh.sh
    sh install_ohmyzsh.sh --unattended
    rm install_ohmyzsh.sh
fi
# [[ -f ~/.zshrc ]] && mv ~/.zshrc ~/.zshrc.bak
# cp _zshrc ~/.zshrc
[[ ! -d ~/.oh-my-zsh/custom/themes/alien-minimal ]] && \
    git clone -q --recurse-submodules https://github.com/eendroroy/alien-minimal.git \
        ~/.oh-my-zsh/custom/themes/alien-minimal
[[ ! -d ~/.oh-my-zsh/plugins/zsh-autosuggestions ]] && \
    git clone -q https://github.com/zsh-users/zsh-autosuggestions \
        ~/.oh-my-zsh/plugins/zsh-autosuggestions

echo alias zsh=~/.standalone/zsh/standalone-zsh.sh >> ~/.aliases
cat <<EOT > ~/.zshrc
export TERM="xterm-256color"
export ZSH="~/.oh-my-zsh"
export INTERFACES="wlp0s20f0u11"
#ZSH_THEME="alien-minimal/alien-minimal"
ZSH_THEME="3den"
plugins=(
  z
  zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh
stty -ixon
source ~/.aliases
EOT
