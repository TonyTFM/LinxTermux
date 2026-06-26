#!/data/data/com.termux/files/usr/bin/bash

REGISTRY="$HOME/LinxMint/packages/registry.conf"

LOG_FILE="$HOME/LinxMint/install.log"

install_pkg() {
    PKG="$1"

    if [ -z "$PKG" ]; then
        echo "Usage: linx install <package>"
        return 1
    fi

    LINE=$(grep "^$PKG=" "$REGISTRY")

    if [ -z "$LINE" ]; then
        echo "[ERROR] Package nicht gefunden: $PKG"
        return 1
    fi

    CMD="${LINE#*=}"

    echo "[INSTALL] $PKG"
    echo "$(date) Installing $PKG" >> "$LOG_FILE"

    if eval "$CMD"; then
        echo "[OK] $PKG installiert"
        echo "$(date) SUCCESS $PKG" >> "$LOG_FILE"
    else
        echo "[FAIL] Installation fehlgeschlagen: $PKG"
        echo "$(date) FAIL $PKG" >> "$LOG_FILE"
        return 1
    fi
}
resolve_deps() {
    PKG="$1"

    case "$PKG" in
        git)
            echo "Checking dependencies for git..."
            ;;
        nano)
            echo "No dependencies"
            ;;
    esac
}
info_pkg() {
    PKG="$1"

    echo "Package info: $PKG"
    grep "$PKG" "$REGISTRY"
}
remove_pkg() {
    PKG="$1"

    echo "Removing $PKG..."
    pkg uninstall "$PKG" -y
}

list_pkgs() {
    echo "Available packages:"
    cut -d= -f1 "$REGISTRY"
}

search_pkg() {
    grep "$1" "$REGISTRY" | cut -d= -f1
}
