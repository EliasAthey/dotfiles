# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load p10k 
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme


# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles


# Setup auto-complete
autoload -Uz compinit
compinit


# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS


# Load p10k config
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh


# Setup node
export NVM_DIR="$HOME/.nvm"
# Lazy load nvm - only runs when you first call nvm, node, npm, npx, etc.
if [ -s "$NVM_DIR/nvm.sh" ]; then
  nvm() {
    unset -f nvm node npm npx
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm "$@"
  }
  node() { unset -f nvm node npm npx; \. "$NVM_DIR/nvm.sh"; node "$@"; }
  npm() { unset -f nvm node npm npx; \. "$NVM_DIR/nvm.sh"; npm "$@"; }
  npx() { unset -f nvm node npm npx; \. "$NVM_DIR/nvm.sh"; npx "$@"; }
fi


# Aliases
[[ -f ~/.aliases ]] && source ~/.aliases
