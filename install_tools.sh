#!/bin/bash
# Script for install tools
#
# This script is make for automate the installation of:
#
# 0 - Brew (for macOS)
# 1 - Oh my ZSH!
# 2 - kitty
# 3 - bat
# 4 - fzf
# 5 - lsd
# 6 - neovim with nvchad
# 7 - atuin
# 8 - flameshot
# 9 - raycast
# 10 - the unarchiver

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

# Check ZSH
if zsh --version > /dev/null; then
  success "ZSH found! setting as default shell"
  chsh -s $(which zsh)
else
  fail "ZSH NOT found!"
  exit 1
fi

# 0.- Install Brew
if [[ "$OSTYPE" == "darwin"* ]]; then
  info "Installing Brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  success "Brew Installed"
else
  info "OS not detected! Brew is not installed!"
  exit 1
fi

# 1.- Install Oh my ZSH
info "Installing Oh my ZSH!..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
success "Oh my ZSH Installed"

# 2.- kitty
info "Installing Kitty..."
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
success "Kitty Installed"

# 3.- bat
info "Installing BAT..."
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  sudo apt install -q -y bat
  success "BAT Installed"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew install -q bat
  success "BAT Installed"
else
  info "OS not detected! BAT is not installed!"
fi

# 4.- fzf
info "Installing FZF..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
success "FZF Installed"

# 5.- lsd
info "Installing LSD..."
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  sudo apt install -q -y lsd
  success "LSD Installed"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew install -q lsd
  success "LSD Installed"
else
  info "OS not detected! LSD is not installed!"
fi

# 6.- neovim & nvchad
info "Installing NeoVim..."
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  sudo apt install -q -y neovim
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
  success "NeoVim Installed"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew install -q neovim
  git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 
  success "NeoVim Installed"
else
  info "OS not detected! NeoVim is not installed!"
fi

# 7 - atuin
info "Intalling Atuin..."
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  sudo apt install -q -y atuin
  success "Atuin Installed"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew install -q atuin
  success "Atuin Installed"
else
  info "OS not detected! Atuin is not installed!"
fi

# 8 - flameshot
info "Installing Flameshot..."
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  sudo apt install -q -y flameshot
  success "Flameshot Installed"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew install -q flameshot
  success "Flameshot Installed"
else
  info "OS not detected! Flameshot is not installed!"
fi

# 9 - raycast
info "Installing Raycast..."
if [[ "$OSTYPE" == "darwin"* ]]; then
  brew install --cask -q raycast
  success "Raycast Installed"
else
  info "OS not detected! Raycast is not installed!"
fi

# 10 - the unarchiver
info "Installing The Unarchiver..."
if [[ "$OSTYPE" == "darwin"* ]]; then 
  brew install --cask -q the-unarchiver
  success "The Unarchiver Installed"
else
  info "OS not detected! The Unarchiver is not installed!"
fi

success "Finish!"
