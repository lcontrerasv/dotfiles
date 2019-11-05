#!/bin/sh

if [ "$(uname -s)" = "Darwin" ]; then
   brew install git
elif [ "$(uname -s)" = "Linux" ]; then
   apt-get install git
fi
