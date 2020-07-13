#!/bin/bash
set -xe
STANDALONE_FD_PATH=~/.standalone/fd
mkdir $STANDALONE_FD_PATH -p
cp standalone-fd.sh $STANDALONE_FD_PATH
cp fd $STANDALONE_FD_PATH
echo alias fd=~/.standalone/fd/standalone-fd.sh >> ~/.aliases
