# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path configuration
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Custom setting
[[ ! -f ~/.custom.sh ]] || source ~/.custom.sh

# External plugins (initialized before)
source ~/.zsh/plugins_before.zsh

# oh-My-ZSH config
export ZSH=~/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

# Internal oh-My-ZSH Plugins
plugins=(
   brew
   dotenv
   extract
   fzf
   git
   github
   httpie
   history
   iterm2
   jira
   last-working-dir
   node
   npm
   macos
   sudo
   web-search
   z
)

source $ZSH/oh-my-zsh.sh

# Settings
source ~/.zsh/settings.zsh

# Aliases
source ~/.shell/aliases.sh

# External plugins (initialized after)
source ~/.zsh/plugins_after.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
