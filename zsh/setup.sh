#!/bin/bash
set -xe
STANDALONE_ZSH_PATH=~/.standalone/zsh
mkdir $STANDALONE_ZSH_PATH -p
cp standalone-zsh.sh $STANDALONE_ZSH_PATH
cp lib $STANDALONE_ZSH_PATH -r
cp libncursesw.so.6 $STANDALONE_ZSH_PATH
cp libm.so.6 $STANDALONE_ZSH_PATH
cp zsh $STANDALONE_ZSH_PATH
tar xvf ohmyzsh.tar.gz
if [[ ! -d ~/.oh-my-zsh ]]; then
    cp -r .oh-my-zsh ~
fi
mkdir ~/.terminfo/x -p
cp xterm-256color ~/.terminfo/x/
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
source ~/.oh-my-zsh/oh-my-zsh.sh
stty -ixon
source ~/.aliases
EOT
cat <<EOT > ~/.zshenv
MODULE_PATH=~/.standalone/zsh/lib
EOT
