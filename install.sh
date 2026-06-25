#!/data/data/com.termux/files/usr/bin/bash

echo "=================================="
echo "     LINX ULTRA INSTALLER"
echo "=================================="

# --- SAFETY CHECK ---
if [ "$(pwd)" = "/" ]; then
  echo "❌ Do not run in system root"
  exit 1
fi

# --- INSTALL DIR ---
BIN="$HOME/.local/bin"
mkdir -p "$BIN"

# --- COPY FILES ---
echo "📦 Installing LINX..."

cp linxtermux.sh "$BIN/linx" 2>/dev/null
cp mint-terminal.sh "$BIN/mint" 2>/dev/null

chmod +x "$BIN/linx"
chmod +x "$BIN/mint"

# --- PATH FIX ---
if ! echo "$PATH" | grep -q ".local/bin"; then
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
  export PATH="$HOME/.local/bin:$PATH"
fi

# --- VERIFY ---
if command -v linx >/dev/null 2>&1; then
  echo "=================================="
  echo "✅ LINX INSTALLED SUCCESSFULLY"
  echo "👉 type: linx"
  echo "=================================="
else
  echo "⚠ install complete but PATH not active"
fi
