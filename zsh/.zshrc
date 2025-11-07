#!/bin/zsh

# ==================== CONFIGURAÇÕES ZSH ====================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# ==================== CONFIGURAÇÕES BÁSICAS ====================

# MISE
eval "$(mise activate zsh)"
