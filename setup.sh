#!/bin/bash
# Script for install dotFiles


AUTHOR="lcontrerasv"
URL=""
VERSION="1.2"

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DEPS=(git 
  curl 
  yarn
  node
#  barn
)

check_prg() {
  PRG_NAME=$1

  if command -v $PRG_NAME > /dev/null; then
      return 0
  else
      return 1
  fi
}

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

check_deps(){

  DEPS=$1

  info "checking dependencies"

  #check if oh-my-zsh is installed
  if [ -d ~/.oh-my-zsh ]; then
    success "Oh My ZSH! installed"
  else
    fail "Oh My ZSH! not found"
  fi

  for dep in "${DEPS[@]}"
  do
     info  "checking $dep ..."
     check_prg $dep
     if [ $? -eq 0 ]; then
         success "$dep installed"
     else
         fail "$dep not found"
     fi
  done
}

# Copy dotfiles
copy_dots_files(){
  info "Installing dotfiles"

  for dot in $(find -H . -maxdepth 1 -iname '.*' -not -regex '.*\.git.*' -not -regex '\.')
  do

    # verify if $dot already exists as symbolic link
    if [ -h ~/${dot} ]; then
      # delete symbolic link
      rm -f ~/${dot}
    fi

    # verify if $dot already exists as file
    if [ -f ~/${dot} ]; then
      # rename file as backup
      mv ~/${dot} ~/${dot}`date +%Y_%m_%d_%H:%M:%S`
    fi 

    # create symbolic link
    info "Installing $dot"
    ln -s ${BASEDIR}/${dot} ~/${dot}
    if [ $? -eq 0 ]; then
      success "$dot installed"
    else
      fail "Error while instaling $dot"
    fi
  done

  success "Finished! Please run: source ~/.zshrc"
}

# Install dotfiles
install_dots(){
  info "Installing dotfiles"
  check_deps ${DEPS}
  copy_dots_files
  custom_oh_my_zsh
}

# Update dotfiles
update_dots(){
  info "Updating dotfiles"
  #update repo
  cd ${BASEDIR} && git pull
  #copy only new files
  copy_dots_files
}

# Custom Oh My ZSH themes and plugins
custom_oh_my_zsh(){
  #Install themes
  cp -rf ${BASEDIR}/themes/oh-my-zsh/* ~/.oh-my-zsh/custom/themes/
}

# Version of this script
version(){
  echo ""
  echo "Script : $0"
  echo "Author : ${AUTHOR}"
  echo "Url    : ${URL}"
  echo "version: ${VERSION}"
  echo ""
}

usage() {
   echo "Usage: $0 [option]"
   echo ""
   echo "OPTIONS:"
   echo ""
   echo " -i  | --install         Install dotfiles"
   echo " -u  | --update          Update dotfiles"
   echo " -c  | --check           Check for dependencies"
   echo " -v  | --version         Show version information and exit"
   echo " -h  | --help            Show this message"
   echo ""
   echo "EXAMPLE:"
   echo ""
   echo "   Install dotfiles on current user session"
   echo "     $0 -i "
   echo ""
   echo "   Update dotfiles on current user session"
   echo "     $0 -u "
   echo ""
   echo "   Check for dependencies"
   echo "     $0 -c "
   echo ""
}

main(){
  if [ $# -gt 0 ]; then
    while [ "$1" != "" ]; do
      case $1 in
        -i  | --install ) install_dots
                          exit 0
                          ;;
        -u | --update ) update_dots
                        exit 0
                        ;;
        -c | --check ) check_deps ${DEPS}
                       exit
                       ;;
        -v | --version ) version
                        exit 0
                        ;;
        -h | --help ) usage
                      exit 0
                      ;;
        * ) usage
            exit 0
            ;;
      esac
      shift
    done
  else
    usage
  fi
}

main $@
