#!/bin/zsh

# ==================== CONFIGURAÇÕES ZSH ====================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# ==================== CONFIGURAÇÕES BÁSICAS ====================

# MISE
eval "$(mise activate zsh)"


# ============================= ALIASES ==========================
unalias gp 2>/dev/null
unalias gpl 2>/dev/null

gp() {
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


alias k="kubectl" 

