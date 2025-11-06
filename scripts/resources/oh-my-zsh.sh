#!/bin/zsh

CONFIG_DIR="$HOME/.config/"
ZSH_TEMPLATE="$CONFIG_DIR/zsh/config/zshrc-template"
ZSH_BACKUP_DIR="$CONFIG_DIR/zsh/backups"
OH_MY_ZSH_DIR="$HOME/.oh-my-zsh"

# ==================== FUNÇÕES ====================
function install_oh_my_zsh() {
    echo "🚀 Iniciando instalação do Oh My Zsh..."

    # Verificar se o curl está instalado
    if ! command -v curl &> /dev/null; then
        echo "❌ curl não encontrado. Instalando..."
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
            sudo apt update && sudo apt install -y curl
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            # macOS
            if command -v brew &> /dev/null; then
                brew install curl
            else
                echo "❌ Homebrew não encontrado. Instale o curl manualmente."
                exit 1
            fi
        else
            echo "❌ Sistema não suportado. Instale o curl manualmente."
            exit 1
        fi
    fi

    # Verificar se o zsh está instalado
    if ! command -v zsh &> /dev/null; then
        echo "❌ zsh não encontrado. Instalando..."
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
            sudo apt install -y zsh
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            # macOS já vem com zsh, mas vamos verificar
            echo "ℹ️  macOS geralmente já tem zsh instalado"
        fi
    fi

    # Mudar para o diretório dotfiles (opcional)
    if [ -d "$CONFIG_DIR" ]; then
        cd "$CONFIG_DIR"
        echo "📁 Diretório alterado para: $CONFIG_DIR"
    fi

    # Instalar Oh My Zsh
    echo "📦 Instalando Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

    # Verificar se a instalação foi bem-sucedida
    if [ -d "$HOME/.config/dotfiles/oh-my-zsh" ]; then
        echo "✅ Oh My Zsh instalado com sucesso!"
        
        # Configurações adicionais opcionais
        echo "⚙️  Configurações adicionais..."
        
        # Backup do zshrc original se existir
        if [ -f "$HOME/.zshrc" ]; then
            cp "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date +%Y%m%d_%H%M%S)"
            echo "📋 Backup do .zshrc criado"
        fi
        
        # Link simbólico para seu zshrc personalizado (se você tiver um)
        if [ -f "$CONFIG_DIR/.zshrc" ]; then
            ln -sf "$CONFIG_DIR/.zshrc" "$HOME/.zshrc"
            echo "🔗 .zshrc personalizado linkado"
        fi
        
        echo ""
        echo "🎉 Instalação concluída!"
        echo ""
    else
        echo "❌ Falha na instalação do Oh My Zsh"
        exit 1
    fi
}

function clean_oh_my_zsh_backups() {
    local backup_patterns=(
        ".zshrc.pre-oh-my-zsh"
        ".zshrc.pre-oh-my-zsh-*"
        ".zshrc.pre-oh-my-zsh.*"
    )
    
    local removed_count=0
    
    for pattern in "${backup_patterns[@]}"; do
        for file in "$CONFIG_DIR"/zsh/$pattern; do
            if [ -f "$file" ] || [ -e "$file" ]; then
                rm -f "$file"
                echo "🗑️  Removido: $file"
                ((removed_count++))
            fi
        done
    done
    
    if [ $removed_count -eq 0 ]; then
        echo "✅ Nenhum backup antigo encontrado"
    else
        echo "🗑️  Total de backups removidos: $removed_count"
    fi
}

function substitute_zshrc() {
    if [ -f "$ZSH_TEMPLATE" ]; then
        cp "$ZSH_TEMPLATE" "$CONFIG_DIR/zsh/.zshrc"
        echo "🔄 .zshrc substituído pelo template"
    else
        echo "❌ Template de zshrc não encontrado em $ZSH_TEMPLATE"
    fi
}

# ==================== FUNÇÃO MAIN ====================
function main() {
  install_oh_my_zsh
  clean_oh_my_zsh_backups
  substitute_zshrc
}

main "$@"
