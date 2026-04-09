#!/usr/bin/env bash
# install.sh — copy the Exa plugin into Cursor's local plugin directory
#
# Usage:
#   bash install.sh              # install
#   bash install.sh --uninstall  # remove
#
# This is a convenience wrapper around Cursor's native local plugin path:
#   ~/.cursor/plugins/local/exa/
#
# Prefer the native methods when possible:
#   /add-plugin exa-labs/exa-cursor-plugin    (in Cursor chat)
#   Settings → Plugins → Add plugin           (paste the GitHub URL)

set -euo pipefail

PLUGIN_NAME="exa"
PLUGIN_DIR="${HOME}/.cursor/plugins/local/${PLUGIN_NAME}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

COMPONENTS=(
  ".cursor-plugin"
  "skills"
  "commands"
  "rules"
  "mcp.json"
)

uninstall() {
  if [ -d "$PLUGIN_DIR" ]; then
    rm -rf "$PLUGIN_DIR"
    echo "Removed ${PLUGIN_DIR}"
  else
    echo "Plugin not found at ${PLUGIN_DIR} — nothing to remove."
  fi
  echo "Restart Cursor to apply."
}

install() {
  [ -d "$PLUGIN_DIR" ] && rm -rf "$PLUGIN_DIR"
  mkdir -p "$PLUGIN_DIR"

  for component in "${COMPONENTS[@]}"; do
    src="${SCRIPT_DIR}/${component}"
    [ -e "$src" ] && cp -R "$src" "$PLUGIN_DIR/${component}"
  done

  echo "Installed to ${PLUGIN_DIR}"
  echo ""
  echo "Next steps:"
  echo "  1. Restart Cursor (or Cmd/Ctrl+Shift+P → Reload Window)"
  echo "  2. The plugin should appear under Settings → Plugins"
}

case "${1:-}" in
  --uninstall) uninstall ;;
  *)           install ;;
esac
