#!/bin/bash
set -xe
STANDALONE_ZSH_PATH=~/.standalone/zsh
mkdir $STANDALONE_ZSH_PATH -p
cp zsh $STANDALONE_ZSH_PATH
cp zsh-bin $STANDALONE_ZSH_PATH
cp lib $STANDALONE_ZSH_PATH -r
cp functions $STANDALONE_ZSH_PATH -r
cp site-functions $STANDALONE_ZSH_PATH -r
cp libncursesw.so.6 $STANDALONE_ZSH_PATH
cp libm.so.6 $STANDALONE_ZSH_PATH
tar xvf ohmyzsh.tar.gz
if [[ ! -d ~/.oh-my-zsh ]]; then
    cp -r .oh-my-zsh ~
fi
mkdir ~/.terminfo/x -p
cp xterm-256color ~/.terminfo/x/
cat <<EOT > ~/.zshrc
export TERM="xterm-256color"
export ZSH="~/.oh-my-zsh"
export FPATH="\$FPATH:export FPATH="/home/ccsss/.oh-my-zsh/plugins/zsh-autosuggestions:/home/ccsss/.oh-my-zsh/plugins/z:/home/ccsss/.oh-my-zsh/functions:/home/ccsss/.oh-my-zsh/completions:/home/ccsss/.standalone/zsh/site-functions:/home/ccsss/.standalone/zsh/site-functions:/home/ccsss/.standalone/zsh/functions/Calendar:/home/ccsss/.standalone/zsh/functions/Chpwd:/home/ccsss/.standalone/zsh/functions/Completion:/home/ccsss/.standalone/zsh/functions/Completion/Base:/home/ccsss/.standalone/zsh/functions/Completion/Linux:/home/ccsss/.standalone/zsh/functions/Completion/Unix:/home/ccsss/.standalone/zsh/functions/Completion/X:/home/ccsss/.standalone/zsh/functions/Completion/Zsh:/home/ccsss/.standalone/zsh/functions/Exceptions:/home/ccsss/.standalone/zsh/functions/Math:/home/ccsss/.standalone/zsh/functions/MIME:/home/ccsss/.standalone/zsh/functions/Misc:/home/ccsss/.standalone/zsh/functions/Newuser:/home/ccsss/.standalone/zsh/functions/Prompts:/home/ccsss/.standalone/zsh/functions/TCP:/home/ccsss/.standalone/zsh/functions/VCS_Info:/home/ccsss/.standalone/zsh/functions/VCS_Info/Backends:/home/ccsss/.standalone/zsh/functions/Zftp:/home/ccsss/.standalone/zsh/functions/Zle"
export PATH=$PATH:~/.standalone/zsh
#ZSH_THEME="alien-minimal/alien-minimal"
ZSH_THEME="3den"
plugins=(
  z
  zsh-autosuggestions
)
#source ~/.oh-my-zsh/oh-my-zsh.sh
stty -ixon
source ~/.aliases
EOT
cat <<EOT > ~/.zshenv
MODULE_PATH=~/.standalone/zsh/lib
EOT
