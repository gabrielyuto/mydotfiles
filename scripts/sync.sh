# sync.sh - Sincroniza configurações com os locais padrão

echo "🔄 Sincronizando dotfiles..."

DOTFILES_DIR="$HOME/.config/dotfiles"
ZSHENV_DIR="$HOME/.zshenv"

# Criar arquivo de configuracao .zshenv
cat > "$ZSHENV_DIR" << 'EOF'
export ZDOTDIR="$HOME/.config/dotfiles/zsh"
eval "$(/opt/homebrew/bin/brew shellenv)"
EOF

# Carregar scripts de setup
source ~/.config/dotfiles/setup-scripts/wezterm.sh

# Criar links simbólicos
# ln -sfn "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
# ln -sfn "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

echo "✅ Dotfiles sincronizados com sucesso!"
echo "📁 Pasta principal: $DOTFILES_DIR"
