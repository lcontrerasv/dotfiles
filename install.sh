#!/bin/sh

# Script for install dotFiles

deps=(
  git
  foobar
)

echo "checking dependencies..."

for i in "${deps[@]}"
do
  echo -n "cheking $i..."
  if command -v $i > /dev/null; then
     echo "ok"
  else
     echo "not found, please install it"
  fi
done

cp .zshrc ~
