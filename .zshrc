# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load p10k 
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme


# Path to your dotfiles.
export DOTFILES=$HOME/dotfiles


# Setup auto-complete in the way that Oh-My-Zsh did
autoload -Uz compinit
compinit

# Load completion list module
zmodload -i zsh/complist

# Options
setopt auto_menu         # show menu on tab
setopt complete_in_word  # complete from cursor
setopt always_to_end     # cursor to end after complete

# Menu selection with highlighting
zstyle ':completion:*' menu select

# Completers
zstyle ':completion:*' completer _expand _complete _ignored _approximate

# Case-insensitive, partial-word, substring completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'

# Caching
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache



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
[[ -f "$DOTFILES/.zsh_aliases" ]] && source "$DOTFILES/.zsh_aliases"
