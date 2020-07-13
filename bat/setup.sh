#!/bin/bash
set -xe
STANDALONE_BAT_PATH=~/.standalone/bat
mkdir $STANDALONE_BAT_PATH -p
cp standalone-bat.sh $STANDALONE_BAT_PATH
cp bat $STANDALONE_BAT_PATH
echo alias bat=~/.standalone/bat/standalone-bat.sh >> ~/.bashrc
