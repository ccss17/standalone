#!/bin/bash
set -xe
STANDALONE_FISH_PATH=~/.standalone/fish
mkdir $STANDALONE_FISH_PATH -p
cp standalone-fish.sh $STANDALONE_FISH_PATH
cp libncursesw.so.6 $STANDALONE_FISH_PATH
cp fish $STANDALONE_FISH_PATH
tar xvf ohmyfish.tar.gz
if [[ ! -d ~/.oh-my-fish ]]; then
    cp -r .oh-my-fish ~
fi
mkdir ~/.terminfo/x -p
cp xterm-256color ~/.terminfo/x/
