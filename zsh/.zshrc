# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/bin/zsh

# ==================== CONFIGURAÇÕES ZSH ====================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
#ZSH_THEME="robbyrussell"
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(/opt/homebrew/bin/brew shellenv)"


# MISE
eval "$(mise activate zsh)"
