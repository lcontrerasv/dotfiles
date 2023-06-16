#!/bin/bash

#if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  
#elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew tap homebrew/cask-fonts
  brew install -q --cask font-iosevka
  brew install -q --cask font-iosevka-comfy
  brew install -q --cask font-icomoon
  brew install -q --cask font-jetbrains-mono-nerd-font
  brew install -q --cask font-fontawesome
  brew install -q --cask font-material-design-icons-webfont
  brew install -q --cask font-hack-nerd-font
#else
#  info "OS not detected!"
#fi
