#!/bin/bash
set -xe
STANDALONE_FISH_PATH=~/.standalone/fish
mkdir $STANDALONE_FISH_PATH -p
cp standalone-fish.sh $STANDALONE_FISH_PATH
cp libncursesw.so.6 $STANDALONE_FISH_PATH
cp fish $STANDALONE_FISH_PATH
echo alias fish=~/.standalone/fish/standalone-fish.sh >> ~/.aliases
