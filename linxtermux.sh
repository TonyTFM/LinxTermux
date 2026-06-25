#!/data/data/com.termux/files/usr/bin/bash

clear

echo "=========================="
echo "       LINX TERMINAL"
echo "=========================="
echo ""

echo "1) Debian"
echo "2) Ubuntu"
echo "3) System Info"
echo "4) Repair"
echo "q) Exit"
echo ""

read -p "Select: " c

repair() {
  unset PROOT_INFO PROOT_LOADER
  hash -r
  echo "✅ repaired"
}

case $c in
1)
  proot-distro login debian
  ;;
2)
  proot-distro login ubuntu
  ;;
3)
  echo "User: $(whoami)"
  echo "Home: $HOME"
  echo "Prefix: $PREFIX"
  ;;
4)
  repair
  ;;
q)
  exit
  ;;
esac
