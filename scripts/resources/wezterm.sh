WEZTERM_SYMLINK_DIR="$HOME/.config/wezterm/"
WEZTERM_CONFIG_DIR="$HOME/.config/dotfiles/wezterm"
WEZTERM_CONFIG_FILE="$WEZTERM_CONFIG_DIR/wezterm.lua"

# Verifica se o diretório existe, se não, cria
if [ ! -d "$WEZTERM_SYMLINK_DIR" ]; then
    echo "Criando diretório: $WEZTERM_SYMLINK_DIR"
    mkdir -p "$WEZTERM_SYMLINK_DIR"
fi

# Cria o symlink para a localização padrão
echo "Criando symlink..."
ln -sf "$WEZTERM_CONFIG_FILE" "$WEZTERM_SYMLINK_DIR"

echo "Configuração do WezTerm concluída! 🎉"