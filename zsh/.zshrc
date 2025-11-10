#!/bin/zsh

# ==================== CONFIGURAÇÕES ZSH ====================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh


# ============================= ALIASES ==========================
## ALIASES GITHUB
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

## ALIASES KUBERNETES
alias k="kubectl" 


# ==================== CONFIGURAÇÕES BÁSICAS ====================

# MISE
eval "$(mise activate zsh)"
