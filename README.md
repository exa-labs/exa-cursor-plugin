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

To test the plugin locally without installing from the marketplace:

1. Clone and open in Cursor:

```bash
git clone https://github.com/exa-labs/exa-cursor-plugin.git
cursor exa-cursor-plugin
```

2. Skills and rules are auto-discovered from the standard directories. Type `/` in the chat to verify the `exa-*` skills are listed.

3. Commands are not auto-discovered when testing locally. Symlink them into Cursor's project commands directory:

```bash
ln -s ../commands .cursor/commands
```

Type `/` again — the `exa-*` commands should now appear alongside the skills.

4. The MCP server config is in `.cursor/mcp.json`. Cursor will prompt you to authenticate with Exa on first use.

## Plugin Structure

```
.cursor-plugin/plugin.json   Plugin manifest
.cursor/mcp.json             MCP server config (remote)
skills/                      3 skills (auto-discovered)
commands/                    3 slash commands
rules/                       Awareness rule
```

## Links

- [Docs](https://docs.exa.ai)
- [API Keys](https://dashboard.exa.ai/api-keys)
- [MCP Server](https://github.com/exa-labs/exa-mcp-server)

## License

MIT
