# Exa Cursor Plugin

Web search and content extraction for Cursor — powered by [Exa](https://exa.ai).

## Install

### From GitHub (recommended)

In Cursor chat:

```
/add-plugin exa-labs/exa-cursor-plugin
```

Or go to **Settings → Plugins → Add plugin** and paste:

```
https://github.com/exa-labs/exa-cursor-plugin
```

### Local folder

Clone and copy into Cursor's local plugin directory:

```bash
git clone https://github.com/exa-labs/exa-cursor-plugin.git
cd exa-cursor-plugin
bash install.sh
```

This copies the plugin to `~/.cursor/plugins/local/exa/`. Restart Cursor afterward.

To uninstall: `bash install.sh --uninstall`

### MCP only

If you only want the MCP tools (no skills, commands, or rules), add to `.cursor/mcp.json`:

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

## Plugin Structure

```
.cursor-plugin/plugin.json   Plugin manifest
skills/                      3 skills (auto-discovered)
commands/                    3 slash commands (auto-discovered)
rules/                       Awareness rule
mcp.json                     MCP server config (remote)
install.sh                   Local install helper
```

## Local Development

To iterate on the plugin itself:

1. Clone and open in Cursor:

```bash
git clone https://github.com/exa-labs/exa-cursor-plugin.git
cursor exa-cursor-plugin
```

2. Skills, rules, and MCP config are auto-discovered from the repo's standard directories.

3. To test as a full plugin (with commands), copy to the local plugin dir:

```bash
bash install.sh
```

Re-run after each change to push updates.

## Links

- [Docs](https://docs.exa.ai)
- [API Keys](https://dashboard.exa.ai/api-keys)
- [MCP Server](https://github.com/exa-labs/exa-mcp-server)

## License

MIT
