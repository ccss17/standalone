#!/bin/bash
set -xe
STANDALONE_CURL_PATH=~/.standalone/curl
mkdir $STANDALONE_CURL_PATH -p
cp standalone-curl.sh $STANDALONE_CURL_PATH
cp libcurl.so.4 $STANDALONE_CURL_PATH
cp libssh2.so.1 $STANDALONE_CURL_PATH
cp curl $STANDALONE_CURL_PATH
echo alias curl=~/.standalone/curl/standalone-curl.sh >> ~/.bashrc
