#!/bin/bash
# Script for install dotFiles

# common functions
. ./common.lib

CHECK_DEPS=true

while [ "$1" != "" ]; do
  case $1 in
    -nc | --no-check ) CHECK_DEPS=false
                       ;;
    -h | --help ) usage
                  exit
                  ;;
  esac
  shift
done

DEPS=(git curl yarn)

if $CHECK_DEPS; then
   check_deps
fi
# Install dotfiles
info "Installing dotfiles"

for dot in $(find -H . -maxdepth 1 -iname '.*' -not -path '*.git*' )
do
  if [ -f "${dot}" ]; then
    info "Installing file $dot"
    cp -f $dot ~/
		if [ $? -eq 0 ]; then
				success "file $dot installed"
		else
				fail "Error while instaling $dot"
		fi 
	elif [ -d "${dot}" ]; then
		info "Installing dir $dot"
		#cp -rf $dot ~/
		info "Not yet implemented"
  fi
done

success "Finished! Please run: source ~/.zshrc"
