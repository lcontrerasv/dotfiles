# Use colors in coreutils utilities output
if [[ "$(uname -s)" == "Darwin" ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

alias grep='grep --color'

# ls aliases
alias ll='ls -laht'
alias la='ls -A'
alias l='ll'

# aliases to protect agaist overwriting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# git aliases
alias gc='git commit -v -m'
alias gla='git pull --recurse-submodules'

# custom user aliases
alias c='clear'
alias p='ping'

# for linux subsystem on win10
if ! [[ "$(uname)" == "Darwin" ]]; then
  alias npm='/usr/bin/npm'
fi

# function aliases

# create dir and cd into it
mcd() {
  mkdir "${1}" && cd "${1}"
}

