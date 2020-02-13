# Use colors in coreutils utilities output
alias ls='ls --color=auto'
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


# custom user aliases
alias c='clear'
alias p='ping'

# for linux subsystem on win10
alias npm='/usr/bin/npm'

# function aliases

# create dir and cd into it
mcd() {
  mkdir "${1}" && cd "${1}"
}

