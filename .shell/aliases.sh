# Use colors in coreutils utilities output
if [[ "$(uname -s)" == "Darwin" ]]; then
  alias ls='ls -G'
else
  alias ls='ls --color=auto'
fi

alias grep='grep --color'

# ls aliases
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd -lah --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'

# aliases to protect agaist overwriting
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# git aliases
alias gc='git commit -v -m'
alias gla='git pull --recurse-submodules'

# custom user aliases
alias c='clear'
alias p='ping -c 4'
alias p1='ping -c 1'
alias cat='bat'
alias catnl='bat --paging=never'
alias bwi='brew install'
alias bwic='brew install --cask'
alias bws='brew search'
alias bwif='brew info'
alias bwl='brew list'
alias ssh='TERM=xterm-256color ssh'


# for linux subsystem on win10
if ! [[ "$(uname)" == "Darwin" ]]; then
  alias npm='/usr/bin/npm'
fi

# function aliases

# create dir and cd into it
mcd() {
  mkdir "${1}" && cd "${1}"
}

# Set 'man' colors
function man() {
    env \
    LESS_TERMCAP_mb=$'\e[01;31m' \
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    man "$@"
}

# fzf improvement
function fzf-lovely(){

	if [ "$1" = "h" ]; then
		fzf -m --reverse --preview-window down:20 --preview '[[ $(file --mime {}) =~ binary ]] &&
 	                echo {} is a binary file ||
	                 (bat --style=numbers --color=always {} ||
	                  highlight -O ansi -l {} ||
	                  coderay {} ||
	                  rougify {} ||
	                  cat {}) 2> /dev/null | head -500'

	else
	        fzf -m --preview '[[ $(file --mime {}) =~ binary ]] &&
	                         echo {} is a binary file ||
	                         (bat --style=numbers --color=always {} ||
	                          highlight -O ansi -l {} ||
	                          coderay {} ||
	                          rougify {} ||
	                          cat {}) 2> /dev/null | head -500'
	fi
}

