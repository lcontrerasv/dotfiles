# External plugins (initialized after)

if [ "$color_prompt" = yes ]; then
  # override default virtualenv indicator in prompt
  VIRTUAL_ENV_DISABLE_PROMPT=1

  # Syntax highlighting
  source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
  ZSH_HIGHLIGHT_STYLES[default]=none
  ZSH_HIGHLIGHT_STYLES[unknown-token]=underline
  ZSH_HIGHLIGHT_STYLES[reserved-word]=fg=cyan,bold
  ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
  ZSH_HIGHLIGHT_STYLES[global-alias]=fg=green,bold
  ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
  ZSH_HIGHLIGHT_STYLES[commandseparator]=fg=blue,bold
  ZSH_HIGHLIGHT_STYLES[autodirectory]=fg=green,underline
  ZSH_HIGHLIGHT_STYLES[path]=bold
  ZSH_HIGHLIGHT_STYLES[path_pathseparator]=
  ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]=
  ZSH_HIGHLIGHT_STYLES[globbing]=fg=blue,bold
  ZSH_HIGHLIGHT_STYLES[history-expansion]=fg=blue,bold
  ZSH_HIGHLIGHT_STYLES[command-substitution]=none
  ZSH_HIGHLIGHT_STYLES[command-substitution-delimiter]=fg=magenta,bold
  ZSH_HIGHLIGHT_STYLES[process-substitution]=none
  ZSH_HIGHLIGHT_STYLES[process-substitution-delimiter]=fg=magenta,bold
  ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=fg=green
  ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=fg=green
  ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=none
  ZSH_HIGHLIGHT_STYLES[back-quoted-argument-delimiter]=fg=blue,bold
  ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=fg=yellow
  ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=fg=yellow
  ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=fg=yellow
  ZSH_HIGHLIGHT_STYLES[rc-quote]=fg=magenta
  ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=fg=magenta,bold
  ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]=fg=magenta,bold
  ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]=fg=magenta,bold
  ZSH_HIGHLIGHT_STYLES[assign]=none
  ZSH_HIGHLIGHT_STYLES[redirection]=fg=blue,bold
  ZSH_HIGHLIGHT_STYLES[comment]=fg=black,bold
  ZSH_HIGHLIGHT_STYLES[named-fd]=none
  ZSH_HIGHLIGHT_STYLES[numeric-fd]=none
  ZSH_HIGHLIGHT_STYLES[arg0]=fg=cyan
  ZSH_HIGHLIGHT_STYLES[bracket-error]=fg=red,bold
  ZSH_HIGHLIGHT_STYLES[bracket-level-1]=fg=blue,bold
  ZSH_HIGHLIGHT_STYLES[bracket-level-2]=fg=green,bold
  ZSH_HIGHLIGHT_STYLES[bracket-level-3]=fg=magenta,bold
  ZSH_HIGHLIGHT_STYLES[bracket-level-4]=fg=yellow,bold
  ZSH_HIGHLIGHT_STYLES[bracket-level-5]=fg=cyan,bold
  ZSH_HIGHLIGHT_STYLES[cursor-matchingbracket]=standout
else
  PROMPT='${debian_chroot:+($debian_chroot)}%n@%m:%~%(#.#.$) '
fi
unset color_prompt force_color_prompt

# enable auto-suggestions based on the history
if [ -f ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  . ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
  # change suggestion color
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#999'
fi

# enable sudo plugin
if [ -f ~/.config/zsh/plugins/zsh-sudo/sudo.plugin.zsh ]; then
  source ~/.config/zsh/plugins/zsh-sudo/sudo.plugin.zsh
fi

# enable git plugin
if [ -f ~/.config/zsh/plugins/zsh-git/git.plugin.zsh ]; then
  source ~/.config/zsh/plugins/zsh-git/git.plugin.zsh
fi

# enable z plugin
if [ -f ~/.config/zsh/plugins/zsh-z/z.plugin.zsh ]; then
  source ~/.config/zsh/plugins/zsh-z/z.plugin.zsh
fi

# enable command-not-found if installed
if [ -f /etc/zsh_command_not_found ]; then
  . /etc/zsh_command_not_found
fi
