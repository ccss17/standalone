#!/bin/bash
set -xe
STANDALONE_CLANGFORAMT_PATH=~/.standalone/clang-format
mkdir $STANDALONE_CLANGFORAMT_PATH -p
cp standalone-clang-format.sh $STANDALONE_CLANGFORAMT_PATH
cp libclang-cpp.so.10 $STANDALONE_CLANGFORAMT_PATH
cp clang-format $STANDALONE_CLANGFORAMT_PATH
cp .clang-format ~
echo alias clang-format=~/.standalone/clang-format/standalone-clang-format.sh >> ~/.zsh_aliases
