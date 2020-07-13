#!/bin/bash
set -xe
STANDALONE_LSD_PATH=~/.standalone/lsd
mkdir $STANDALONE_LSD_PATH -p
cp standalone-lsd.sh $STANDALONE_LSD_PATH
cp lsd $STANDALONE_LSD_PATH
echo alias lsd=~/.standalone/lsd/standalone-lsd.sh >> ~/.zsh_aliases
