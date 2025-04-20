#!/bin/bash

update_nvim() {
    echo "📦 Verificando si Neovim ya está instalado..."

    # Remove apt neovim if exists
    apt list --installed 2>/dev/null | grep -q '^neovim/' && sudo apt remove -y neovim

    # Comprobar si /opt/nvim existe
    if [ ! -d "/opt/nvim-linux-x86_64" ]; then
        echo "🔧 No se encontró Neovim en /opt, instalando desde cero..."
    else
        echo "🧹 Borrando instalación anterior..."
        sudo rm -rf /opt/nvim-linux-x86_64
    fi

    echo "📦 Descargando la última versión de Neovim..."
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

    echo "📦 Instalando nueva versión en /opt..."
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

    # Limpiar el archivo descargado
    echo "🧹 Limpiando archivo descargado..."
    rm nvim-linux-x86_64.tar.gz

    echo "✅ Neovim instalado o actualizado correctamente!"
}
