# Exa Cursor Plugin

Web search and content extraction for Cursor — powered by [Exa](https://exa.ai).

## Install

### Marketplace

Install from the [Cursor Marketplace](https://cursor.com/marketplace).

### Local install (script)

Clone the repo and run the install script:

```bash
git clone https://github.com/exa-labs/exa-cursor-plugin.git
cd exa-cursor-plugin
bash install.sh
```

This copies the plugin to `~/.cursor/plugins/local/exa/` and registers it in `~/.claude/` so Cursor discovers it. Restart Cursor, then enable Exa under **Settings → Plugins**.

To uninstall: `bash install.sh --uninstall`

### Manual (MCP only)

If you only need the MCP tools (no skills, commands, or rules), add to `.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "exa": {
      "url": "https://mcp.exa.ai/mcp"
    }
  }
}
```

## What's Included

### Tools (via MCP)

- `web_search_exa` — search the web
- `web_fetch_exa` — read a webpage's full content

### Commands

- `/exa-setup` — set up the Exa MCP server
- `/exa-search <query>` — web search
- `/exa-fetch <url>` — read a URL

### Skills

- `exa-web-search` — how to search the web with Exa
- `exa-fetch` — how to read URLs
- `exa-best-practices` — general tips

### Rules

- `exa-awareness` — tells the agent to use Exa when it makes sense

## Local Development

To iterate on the plugin itself:

1. Clone and open in Cursor:

```bash
git clone https://github.com/exa-labs/exa-cursor-plugin.git
cursor exa-cursor-plugin
```

2. Skills, rules, and MCP config are auto-discovered from the repo's standard directories.

3. To test as a real local plugin (with commands), install it:

```bash
bash install.sh
```

Re-run after each change to push updates to the local plugin directory.

## Plugin Structure

```
.cursor-plugin/plugin.json   Plugin manifest
.cursor/mcp.json             MCP server config (remote)
skills/                      3 skills (auto-discovered)
commands/                    3 slash commands
rules/                       Awareness rule
install.sh                   Local install/uninstall script
```

## Links

- [Docs](https://docs.exa.ai)
- [API Keys](https://dashboard.exa.ai/api-keys)
- [MCP Server](https://github.com/exa-labs/exa-mcp-server)

## License

MIT
