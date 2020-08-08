#!/bin/bash
set -xe
STANDALONE_NVTOP_PATH=~/.standalone/nvtop
mkdir $STANDALONE_NVTOP_PATH -p
cp standalone-nvtop.sh $STANDALONE_NVTOP_PATH
cp nvtop $STANDALONE_NVTOP_PATH
echo alias nvtop=~/.standalone/nvtop/standalone-nvtop.sh >> ~/.zsh_aliases
