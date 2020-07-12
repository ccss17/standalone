#!/bin/bash
set -xe
STANDALONE_ZSH_PATH=~/.standalone/zsh
mkdir $STANDALONE_ZSH_PATH -p
cp standalone-zsh.sh $STANDALONE_ZSH_PATH
cp libncursesw.so.6 $STANDALONE_ZSH_PATH
cp zsh $STANDALONE_ZSH_PATH
echo alias zsh=~/.standalone/zsh/standalone-zsh.sh >> ~/.aliases
cat <<EOT > ~/.zshrc
export TERM="xterm-256color"
export ZSH="$HOME/.oh-my-zsh"
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
