#!/bin/bash
set -xe
STANDALONE_HYPERFINE_PATH=~/.standalone/hyperfine
mkdir $STANDALONE_HYPERFINE_PATH -p
cp standalone-hyperfine.sh $STANDALONE_HYPERFINE_PATH
cp hyperfine $STANDALONE_HYPERFINE_PATH
echo alias hyperfine=~/.standalone/hyperfine/standalone-hyperfine.sh >> ~/.zsh_aliases
