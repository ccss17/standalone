#!/bin/bash
set -xe
STANDALONE_GOTOP_PATH=~/.standalone/gotop
mkdir $STANDALONE_GOTOP_PATH -p
cp standalone-gotop.sh $STANDALONE_GOTOP_PATH
cp gotop $STANDALONE_GOTOP_PATH
echo alias gotop=~/.standalone/gotop/standalone-gotop.sh >> ~/.zsh_aliases
