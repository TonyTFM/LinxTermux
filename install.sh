#!/data/data/com.termux/files/usr/bin/bash

echo "=================================="
echo "        LINX INSTALLER"
echo "=================================="

BIN="$HOME/.local/bin"
mkdir -p "$BIN"

echo "📦 Installing LINX..."

cp linxtermux.sh "$BIN/linx" 2>/dev/null
chmod +x "$BIN/linx"

# PATH fix (safe, no duplicates)
if ! echo "$PATH" | grep -q ".local/bin"; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
  export PATH="$HOME/.local/bin:$PATH"
fi

echo "=================================="
echo "✅ LINX READY"
echo "👉 run: linx"
echo "=================================="
