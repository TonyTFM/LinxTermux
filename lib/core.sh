#!/data/data/com.termux/files/usr/bin/bash

CONFIG="$HOME/LinxMint/config/linx.conf"

load_config() {
    if [ -f "$CONFIG" ]; then
        source "$CONFIG"
    else
        echo "Konfiguration fehlt."
        exit 1
    fi
}

header() {
    clear
    echo "===================================="
    echo "        $NAME $VERSION"
    echo "===================================="
    echo
}
