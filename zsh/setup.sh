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
mkdir ~/.terminfo/x -p
cp xterm-256color ~/.terminfo/x/
cat <<EOT > ~/.zsh_aliases
alias src="source ~/.zshrc"
alias t=tmux
alias v=vim
alias rm=rm -i
alias c=clear
alias cs='cd ..'
alias ls='lsd --icon never'
alias cl='clear;ls'
alias l='ls'
alias la='ls -a'
alias ll='ls -la'
alias lt='ls --tree'
alias g=git
alias gdb='gdb -q'
alias py=python
alias py2=python2
alias py3=python3
alias q=exit
EOT
cat <<EOT > ~/.zshrc
export TERM="xterm-256color"
export ZSH="~/.oh-my-zsh"
export FPATH="\$HOME/.oh-my-zsh/plugins/zsh-autosuggestions:\$HOME/.oh-my-zsh/plugins/z:\$HOME/.oh-my-zsh/functions:\$HOME/.oh-my-zsh/completions:\$HOME/.standalone/zsh/site-functions:\$HOME/.standalone/zsh/site-functions:\$HOME/.standalone/zsh/functions/Calendar:\$HOME/.standalone/zsh/functions/Chpwd:\$HOME/.standalone/zsh/functions/Completion:\$HOME/.standalone/zsh/functions/Completion/Base:\$HOME/.standalone/zsh/functions/Completion/Linux:\$HOME/.standalone/zsh/functions/Completion/Unix:\$HOME/.standalone/zsh/functions/Completion/X:\$HOME/.standalone/zsh/functions/Completion/Zsh:\$HOME/.standalone/zsh/functions/Exceptions:\$HOME/.standalone/zsh/functions/Math:\$HOME/.standalone/zsh/functions/MIME:\$HOME/.standalone/zsh/functions/Misc:\$HOME/.standalone/zsh/functions/Newuser:\$HOME/.standalone/zsh/functions/Prompts:\$HOME/.standalone/zsh/functions/TCP:\$HOME/.standalone/zsh/functions/VCS_Info:\$HOME/.standalone/zsh/functions/VCS_Info/Backends:\$HOME/.standalone/zsh/functions/Zftp:\$HOME/.standalone/zsh/functions/Zle"
export PATH=\$PATH:~/.standalone/zsh
#ZSH_THEME="alien-minimal/alien-minimal"
#ZSH_THEME="3den"
plugins=(
  #z
  #zsh-autosuggestions
)
#source ~/.oh-my-zsh/oh-my-zsh.sh
stty -ixon
source ~/.zsh_aliases
EOT
cat <<EOT > ~/.zshenv
MODULE_PATH=~/.standalone/zsh/lib
EOT

wget -q -O install_ohmyzsh.sh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
$STANDALONE_ZSH_PATH/zsh install_ohmyzsh.sh --unattended

git clone -q --recurse-submodules https://github.com/eendroroy/alien-minimal.git ~/.oh-my-zsh/custom/themes/alien-minimal
git clone -q https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions

cat <<EOT > ~/.zshrc
export TERM="xterm-256color"
export ZSH="~/.oh-my-zsh"
export FPATH="\$HOME/.oh-my-zsh/plugins/zsh-autosuggestions:\$HOME/.oh-my-zsh/plugins/z:\$HOME/.oh-my-zsh/functions:\$HOME/.oh-my-zsh/completions:\$HOME/.standalone/zsh/site-functions:\$HOME/.standalone/zsh/site-functions:\$HOME/.standalone/zsh/functions/Calendar:\$HOME/.standalone/zsh/functions/Chpwd:\$HOME/.standalone/zsh/functions/Completion:\$HOME/.standalone/zsh/functions/Completion/Base:\$HOME/.standalone/zsh/functions/Completion/Linux:\$HOME/.standalone/zsh/functions/Completion/Unix:\$HOME/.standalone/zsh/functions/Completion/X:\$HOME/.standalone/zsh/functions/Completion/Zsh:\$HOME/.standalone/zsh/functions/Exceptions:\$HOME/.standalone/zsh/functions/Math:\$HOME/.standalone/zsh/functions/MIME:\$HOME/.standalone/zsh/functions/Misc:\$HOME/.standalone/zsh/functions/Newuser:\$HOME/.standalone/zsh/functions/Prompts:\$HOME/.standalone/zsh/functions/TCP:\$HOME/.standalone/zsh/functions/VCS_Info:\$HOME/.standalone/zsh/functions/VCS_Info/Backends:\$HOME/.standalone/zsh/functions/Zftp:\$HOME/.standalone/zsh/functions/Zle"
export PATH=\$PATH:~/.standalone/zsh
#ZSH_THEME="alien-minimal/alien-minimal"
ZSH_THEME="3den"
plugins=(
  z
  zsh-autosuggestions
)
source ~/.oh-my-zsh/oh-my-zsh.sh
stty -ixon
source ~/.zsh_aliases
EOT
