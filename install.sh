#!/usr/bin/env bash
# install.sh — install or uninstall the Exa Cursor plugin locally
#
# Usage:
#   bash install.sh              # install plugin
#   bash install.sh --uninstall  # remove plugin
#
# 1. Copies plugin files to ~/.cursor/plugins/local/exa/
# 2. Registers the plugin in ~/.claude/plugins/installed_plugins.json
# 3. Enables it in ~/.claude/settings.json
#
# Requires python3 for JSON merging (ships with macOS/most Linux).

set -euo pipefail

PLUGIN_NAME="exa"
PLUGIN_ID="${PLUGIN_NAME}@local"
PLUGIN_DIR="${HOME}/.cursor/plugins/local/${PLUGIN_NAME}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

CLAUDE_DIR="${HOME}/.claude"
CLAUDE_PLUGINS="${CLAUDE_DIR}/plugins/installed_plugins.json"
CLAUDE_SETTINGS="${CLAUDE_DIR}/settings.json"

# Components to copy (relative to repo root)
COMPONENTS=(
  ".cursor-plugin"
  "skills"
  "commands"
  "rules"
  "mcp.json"
)

register_plugin() {
  # Register in ~/.claude/plugins/installed_plugins.json (upsert, don't clobber)
  python3 - "$CLAUDE_PLUGINS" "$PLUGIN_ID" "$PLUGIN_DIR" <<'PY'
import json, os, sys
path, pid, ipath = sys.argv[1], sys.argv[2], sys.argv[3]
data = {}
if os.path.exists(path):
    try:
        data = json.load(open(path))
    except (json.JSONDecodeError, IOError):
        data = {}
plugins = data.get("plugins", {})
entries = [e for e in plugins.get(pid, [])
           if not (isinstance(e, dict) and e.get("scope") == "user")]
entries.insert(0, {"scope": "user", "installPath": ipath})
plugins[pid] = entries
data["plugins"] = plugins
os.makedirs(os.path.dirname(path), exist_ok=True)
json.dump(data, open(path, "w"), indent=2)
PY

  # Enable in ~/.claude/settings.json (upsert, don't clobber)
  python3 - "$CLAUDE_SETTINGS" "$PLUGIN_ID" <<'PY'
import json, os, sys
path, pid = sys.argv[1], sys.argv[2]
data = {}
if os.path.exists(path):
    try:
        data = json.load(open(path))
    except (json.JSONDecodeError, IOError):
        data = {}
data.setdefault("enabledPlugins", {})[pid] = True
os.makedirs(os.path.dirname(path), exist_ok=True)
json.dump(data, open(path, "w"), indent=2)
PY
}

unregister_plugin() {
  # Remove from installed_plugins.json
  if [ -f "$CLAUDE_PLUGINS" ]; then
    python3 - "$CLAUDE_PLUGINS" "$PLUGIN_ID" <<'PY'
import json, os, sys
path, pid = sys.argv[1], sys.argv[2]
try:
    data = json.load(open(path))
except (json.JSONDecodeError, IOError, FileNotFoundError):
    sys.exit(0)
plugins = data.get("plugins", {})
plugins.pop(pid, None)
data["plugins"] = plugins
json.dump(data, open(path, "w"), indent=2)
PY
  fi

  # Remove from settings.json
  if [ -f "$CLAUDE_SETTINGS" ]; then
    python3 - "$CLAUDE_SETTINGS" "$PLUGIN_ID" <<'PY'
import json, os, sys
path, pid = sys.argv[1], sys.argv[2]
try:
    data = json.load(open(path))
except (json.JSONDecodeError, IOError, FileNotFoundError):
    sys.exit(0)
data.get("enabledPlugins", {}).pop(pid, None)
json.dump(data, open(path, "w"), indent=2)
PY
  fi
}

uninstall() {
  if [ -d "$PLUGIN_DIR" ]; then
    rm -rf "$PLUGIN_DIR"
    echo "Removed ${PLUGIN_DIR}"
  else
    echo "Plugin files not found — skipping."
  fi
  unregister_plugin
  echo "Unregistered from Cursor."
  echo "Restart Cursor to apply."
}

install() {
  command -v python3 >/dev/null || { echo "python3 is required but not found."; exit 1; }

  # Clean previous install
  [ -d "$PLUGIN_DIR" ] && rm -rf "$PLUGIN_DIR"
  mkdir -p "$PLUGIN_DIR"

  for component in "${COMPONENTS[@]}"; do
    src="${SCRIPT_DIR}/${component}"
    [ -e "$src" ] && cp -R "$src" "$PLUGIN_DIR/${component}"
  done

  register_plugin

  echo "Installed to ${PLUGIN_DIR}"
  echo "Registered in ${CLAUDE_PLUGINS}"
  echo ""
  echo "Next steps:"
  echo "  1. Restart Cursor (or Cmd/Ctrl+Shift+P → 'Reload Window')"
  echo "  2. Check Settings → Plugins — 'Exa' should be listed"
  echo "  3. Check Settings → Tools & MCP — toggle Exa on"
}

case "${1:-}" in
  --uninstall) uninstall ;;
  *)           install ;;
esac
