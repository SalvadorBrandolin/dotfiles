burniso() {
    if [ $# -ne 2 ]; then
        echo "Uso: burniso <ruta_al_iso> <dispositivo>"
        echo "Ejemplo: burniso ~/Descargas/mint.iso /dev/sdb"
        return 1
    fi

    iso="$1"
    device="$2"

    # Confirmación antes de borrar el dispositivo
    echo "⚠️  Esto va a borrar TODO en $device"
    read -q "REPLY?¿Seguro que querés continuar? [y/N] "
    echo ""
    if [[ ! "$REPLY" =~ ^[Yy]$ ]]; then
        echo "Cancelado."
        return 1
    fi

    echo "Desmontando particiones de $device..."
    sudo umount ${device}?* 2>/dev/null

    echo "Grabando ISO en $device..."
    sudo dd if="$iso" of="$device" bs=4M status=progress conv=fsync

    echo "Sincronizando..."
    sync
    echo "✅ ISO grabada correctamente en $device"
}
