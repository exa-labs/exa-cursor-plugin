#!/usr/bin/env bash
# install.sh — install or uninstall the Exa Cursor plugin locally
#
# Usage:
#   bash install.sh              # install plugin
#   bash install.sh --uninstall  # remove plugin
#
# Copies the plugin to ~/.cursor/plugins/local/exa/ so Cursor loads it
# as a first-party plugin. No symlinks, no clobbering existing config.

set -euo pipefail

PLUGIN_NAME="exa"
PLUGIN_DIR="${HOME}/.cursor/plugins/local/${PLUGIN_NAME}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Components to copy (relative to repo root)
COMPONENTS=(
  ".cursor-plugin"
  ".cursor"
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
    echo "Nothing to remove — plugin not installed."
  fi
  echo "Restart Cursor to apply changes."
}

install() {
  # Clean previous install
  if [ -d "$PLUGIN_DIR" ]; then
    rm -rf "$PLUGIN_DIR"
  fi

  mkdir -p "$PLUGIN_DIR"

  for component in "${COMPONENTS[@]}"; do
    src="${SCRIPT_DIR}/${component}"
    if [ -e "$src" ]; then
      cp -R "$src" "$PLUGIN_DIR/${component}"
    fi
  done

  echo "Installed to ${PLUGIN_DIR}"
  echo ""
  echo "Next steps:"
  echo "  1. Restart Cursor (or Cmd/Ctrl+Shift+P → 'Reload Window')"
  echo "  2. Go to Cursor Settings → Plugins and confirm 'Exa' is listed"
  echo "  3. Go to Cursor Settings → Tools & MCP and toggle Exa on"
}

case "${1:-}" in
  --uninstall) uninstall ;;
  *)           install ;;
esac
