# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path configuration
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/opt/homebrew/bin:$PATH

[[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)" > /dev/null 2>&1

# Custom shell setting
[[ -f ~/.config/custom_shell.sh ]] && source ~/.config/custom_shell.sh

# External plugins (initialized before)
source ~/.config/zsh/plugins_before.zsh

# Settings
source ~/.config/zsh/settings.zsh

# External plugins (initialized after)
source ~/.config/zsh/plugins_after.zsh

# Aliases
source ~/.config/shell/aliases.sh

# Custom Aliases
[[ -f ~/.config/shell/custom_alias.sh ]] && source ~/.config/shell/custom_alias.sh

source ~/.config/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# enable fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
 
#For Intel
NVM_HOME="/usr/local/opt/nvm"

if [[ -d "/opt/homebrew/opt/nvm" ]]; then
  #For Apple
  NVM_HOME="/opt/homebrew/opt/nvm"
fi

[[ -f "$NVM_HOME/nvm.sh" ]] && \. "$NVM_HOME/nvm.sh"  # This loads nvm
[[ -f "$NVM_HOME/etc/bash_completion.d/nvm" ]] && \. "$NVM_HOME/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
