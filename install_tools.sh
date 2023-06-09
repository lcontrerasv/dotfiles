#!/bin/bash
# Script for install tools
#
# This script is make for automate the installation of:
#
# - Oh my ZSH!
# - kitty
# - bat
# - fzf
# - lsd
# - neovim with nvchad
#

# 0.- Check ZSH
if zsh --version > /dev/null; then
  success("ZSH found! setting as default shell")
  chsh -s $(which zsh)
else
  fail("ZSH NOT found!")

# 1.- Install Oh my ZSH
info("Installing Oh my ZSH!...")
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
success("Oh my ZSH Installed")

# 2.- kitty
info("Installing Kitty...")
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
success("Kitty Installed")

# 3.- bat
info("Installing BAT...")
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  sudo apt install bat
  success("BAT Installed")
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew install -q bat
  success("BAT Installed")
else
  info("OS not detected! BAT is not installed!")
fi

# 4.- fzf
info("Installing FZF...")
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
success("FZF Installed")

# 5.- lsd
info("Installing LSD...")
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  sudo apt install lsd
  success("LSD Installed")
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew install -q lsd
  success("LSD Installed")
else
  info("OS not detected! LSD is not installed!")
fi

# 6.- neovim & nvchad
info("Installing NeoVim...")
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  sudo apt install neovim
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
  success("NeoVim Installed")
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew install -q neovim
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
  success("NeoVim Installed")
else
  info("OS not detected! NeoVim is not installed!")
fi

success("Finish!")

msg() {
  printf "\r$1\n"
}

info() {
  msg "  [ \033[00;34m..\033[0m ] $1"
}

success() {
  msg "\033[2K  [ \033[00;32mOK\033[0m ] $1"
}

fail() {
  msg "\033[2K  [\033[0;31mFAIL\033[0m] $1"
  echo ''
  exit 1
}
