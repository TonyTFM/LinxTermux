#!/data/data/com.termux/files/usr/bin/bash

echo "================================"
echo "      LINX INSTALLER"
echo "================================"

# Safety check
if [ "$(pwd)" = "/" ]; then
  echo "❌ Do not run in system root"
  exit 1
fi

# Install folder
INSTALL_DIR="$HOME/.local/bin"

mkdir -p "$INSTALL_DIR"

cp linxtermux.sh "$INSTALL_DIR/linx" 2>/dev/null
cp mint-terminal.sh "$INSTALL_DIR/mint" 2>/dev/null

chmod +x "$INSTALL_DIR/linx"
chmod +x "$INSTALL_DIR/mint"

# PATH fix
if ! echo "$PATH" | grep -q ".local/bin"; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
fi

echo "✅ LINX installed successfully"
echo "👉 restart terminal and type: linx"
