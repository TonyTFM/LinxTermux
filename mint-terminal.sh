#!/data/data/com.termux/files/usr/bin/bash

# ==============================
# Linux Mint Terminal Look (Linx)
# ==============================

clear

# Farben
GREEN="\e[32m"
RESET="\e[0m"
CYAN="\e[36m"
BOLD="\e[1m"

echo -e "${GREEN}${BOLD}"
echo "########################################"
echo "#        Linux Mint Terminal           #"
echo "#        (Linx Edition)                #"
echo "########################################"
echo -e "${RESET}"

echo -e "${CYAN}System:${RESET} $(uname -o 2>/dev/null || uname -s)"
echo -e "${CYAN}User:${RESET} $USER"
echo -e "${CYAN}Host:${RESET} $(hostname)"
echo -e "${CYAN}Time:${RESET} $(date)"
echo ""
echo "----------------------------------------"
echo "Mint-like Terminal gestartet..."
echo "Tippe 'exit' zum Beenden"
echo "----------------------------------------"
echo ""

# Mint-style Prompt nur für diese Session
export PS1="\[\e[32m\]\u@\h:\w\$ \[\e[0m\]"

bash
