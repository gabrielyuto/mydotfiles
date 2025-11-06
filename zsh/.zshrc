#!/bin/zsh

# ==================== CONFIGURAÇÕES ZSH ====================
export ZSH="$HOME/.config/oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh

# ==================== CONFIGURAÇÕES BÁSICAS ====================
export XDG_CONFIG_HOME="$HOME/.config/"
export DOTFILES_DIR="$HOME/.config/"
export ZSH_CONFIG_DIR="$$HOME/.config/zsh"
export EDITOR="nvim"
export VISUAL="nvim"
export HISTFILE="$HOME/.config/zsh/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
export EDITOR="nvim"
export LANG="en_US.UTF-8"

setopt appendhistory
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space

# Carregar configurações modularizadas
ZSH_CONFIG_DIR="$HOME/.config/zsh/config"  # Pega o diretório deste arquivo

# Carregar todos os arquivos de configuração
for config_file in $ZSH_CONFIG_DIR/*.zsh; do
    if [ -f "$config_file" ]; then
        source "$config_file"
    fi
done

# Carregar configurações específicas do sistema
if [ -f "$ZSH_CONFIG_DIR/$(uname -s).zsh" ]; then
    source "$ZSH_CONFIG_DIR/$(uname -s).zsh"
fi

# Arquivo de aliases
if [ -f ~/.config/dotfiles/zsh/aliases.zsh ]; then
  source ~/.config/zsh/aliases.zsh
fi

eval "$(/opt/homebrew/bin/brew shellenv)" # Homebrew
eval "$(mise activate zsh)" # Mise



