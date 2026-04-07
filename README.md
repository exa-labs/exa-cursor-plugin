# Exa Cursor Plugin

Web search and content extraction for Cursor — powered by [Exa](https://exa.ai).

## Install

Install from the [Cursor Marketplace](https://cursor.com/marketplace), or add to `.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "exa": {
      "url": "https://mcp.exa.ai/mcp"
    }
  }
}
```

[Get your API key](https://dashboard.exa.ai/api-keys) — when you first connect, Cursor will prompt you to authenticate via Exa's OAuth flow. Your API key is linked automatically.

## What's Included

### Tools (via MCP)

- `web_search_exa` — search the web
- `web_fetch_exa` — read a webpage's full content

### Commands

- `/exa-search <query>` — web search
- `/exa-company <query>` — company research
- `/exa-fetch <url>` — read a URL

### Skills

- `exa-web-search` — how to search the web with Exa
- `exa-company-research` — how to research companies
- `exa-fetch` — how to read URLs
- `exa-best-practices` — general tips

### Rules

- `exa-awareness` — tells the agent to use Exa when it makes sense

## Local Development

To test the plugin locally without installing from the marketplace:

1. Clone and open in Cursor:

```bash
git clone https://github.com/exa-labs/exa-cursor-plugin.git
```

Open the `exa-cursor-plugin` folder in Cursor (File → Open Folder).

2. Symlink skills, rules, and commands into the `.cursor/` directory so Cursor discovers them:

```bash
ln -s ../skills .cursor/skills
ln -s ../rules .cursor/rules
ln -s ../commands .cursor/commands
```

3. Reload the window (`Cmd+Shift+P` → "Reload Window"), then type `/` in the chat — the `exa-*` skills and commands should appear.

4. The MCP server config is in `.cursor/mcp.json`. Go to Cursor Settings → MCP, connect the "exa" server, and authenticate with your Exa API key.

## Plugin Structure

```
.cursor-plugin/plugin.json   Plugin manifest
.cursor/mcp.json             MCP server config (remote)
skills/                      4 skills
commands/                    3 slash commands
rules/                       Awareness rule
```

## Links

- [Docs](https://docs.exa.ai)
- [API Keys](https://dashboard.exa.ai/api-keys)
- [MCP Server](https://github.com/exa-labs/exa-mcp-server)

## License

MIT
