#!/data/data/com.termux/files/usr/bin/bash
VERSION="1.0.0"
CONFIG="$HOME/LinxMint/config/linx.conf"
THEME=${THEME:-classic}

boot_logo() {
    clear
    echo -e "${LINX_PRIMARY}"
    echo "=================================="
    echo "        LinxMint v1"
    echo "     Dark Terminal OS"
    echo "=================================="
    echo -e "${LINX_RESET}"
    echo
}
boot_progress() {
    echo -n "["
    for i in {1..15}; do
        echo -n "█"
        sleep 0.05
    done
    echo "] READY"
    echo
}
boot_progress() {
    echo -n "["
    for i in {1..10}; do
        echo -n "█"
        sleep 0.1
    done
    echo "] 100%"
    echo
}
start_session() {
    clear
    echo -e "${LINX_ACCENT}LinxMint v1 - Session Start${LINX_RESET}"
    echo
    echo -e "User   : ${LINX_PRIMARY}$LINX_USER${LINX_RESET}"
    echo -e "System : ${LINX_PRIMARY}LinxMint OS${LINX_RESET}"
    echo -e "Theme  : ${LINX_PRIMARY}Dark ChatGPT Style${LINX_RESET}"
    echo
    echo "Session active..."
    echo
}
login_screen() {
    clear
    echo "===================================="
    echo "         LinxMint System"
    echo "===================================="
    echo
    echo "Version: $VERSION"
    echo "Distro : $DISTRO"
    echo
    echo "Logging in..."
    sleep 1
}
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
    echo "======================================"
    echo "           🌿 LinxMint"
    echo "======================================"
    echo
}
check_debian() {
    proot-distro list | grep -qi "debian"
}
load_theme() {
    THEME_FILE="$HOME/LinxMint/themes/${THEME}.sh"

    if [ -z "$THEME" ]; then
        THEME="classic"
    fi

    if [ -f "$THEME_FILE" ]; then
        source "$THEME_FILE"
    else
        source "$HOME/LinxMint/themes/classic.sh"
    fi
}
boot_sequence() {
    clear
    echo "Booting LinxMint..."
    echo
    sleep 1

    echo "[OK] Config geladen"
    sleep 0.5

    load_theme >/dev/null 2>&1
    echo "[OK] Theme geladen"
    sleep 0.5

    if check_debian; then
        echo "[OK] Debian erkannt"
    else
        echo "[FEHLER] Debian fehlt"
        exit 1
    fi

    echo
    echo "Starting system..."
    sleep 1
}
tty_login() {
    clear
    echo "LinxMint $VERSION"
    echo "---------------------"
    echo

    read -p "login: " USER

    if [ -z "$USER" ]; then
        echo "Login abgebrochen"
        exit 1
    fi

    export LINX_USER="$USER"

    echo "Willkommen, $LINX_USER"
    sleep 1
}
start_session() {
    clear

    echo "Booting LinxMint..."
    echo
    sleep 1

    echo "[OK] Config geladen"
    sleep 0.3
    echo "[OK] Theme geladen"
    sleep 0.3
    echo

    echo "Willkommen $LINX_USER"
    echo "System: LinxMint"
    echo "Distro: $DISTRO"
    echo

    echo "Session gestartet..."
    echo
}
