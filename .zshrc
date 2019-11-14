export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(
  docker
  dotenv
  extract
  git
  httpie
  history
  iterm2
  last-working-dir
  mvn
  node
  npm
  osx
  postgres
  spring
  sudo
  web-search
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

## User Configuration

# custom aliases
alias c='clear'
alias gc='git commit -v -m'
alias p='ping'

# For linux subsystem on windows 10
alias npm='/usr/bin/npm'
