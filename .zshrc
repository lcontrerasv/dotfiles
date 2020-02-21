# External plugins (initialized before)
source ~/.zsh/plugins_before.zsh

# Settings
source ~/.zsh/settings.zsh

export ZSH=~/.oh-my-zsh

ZSH_THEME="robbyrussell"

# Internal oh-My-ZSH Plugins
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
)

source $ZSH/oh-my-zsh.sh

source ~/.shell/aliases.sh

# External plugins (initialized after)
source ~/.zsh/plugins_after.zsh
