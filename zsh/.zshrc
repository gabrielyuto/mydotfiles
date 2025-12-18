#!/bin/zsh

# ==================== CONFIGURAÇÕES ZSH ====================
eval "$(mise activate zsh)"
source $HOME/.oh-my-zsh/oh-my-zsh.sh
source $HOME/powerlevel10k/powerlevel10k.zsh-theme

## GITHUB
unalias gps 2>/dev/null
unalias gpl 2>/dev/null
unalias gc 2>/dev/null
unalias ga 2>/dev/null

gps() {
  if [ -n "$1" ]; then
    git push origin "$1"
  else
    git push
  fi
}

gpl() {
  if [ -n "$1" ]; then
    git pull origin "$1"
  else
    git pull
  fi
}

gc() {
  if [ -n "$1" ]; then
    git commit -m "$1"
  else
    git commit
  fi
}

ga() {
  if [ -n "$1" ]; then
    git add "$1"
  else
    git add .
  fi
}

alias gs="git status"

## KUBERNETES
source <(kubectl completion zsh)
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

alias k="kubectl" 

export PATH="$HOME/.local/bin:$PATH"
# ==================== PRECISAM ESTAR NO FINAL ====================
# POWERLEVEL
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
