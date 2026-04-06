# Exa Cursor Plugin

Web search, code search, and content extraction for Cursor — powered by [Exa](https://exa.ai).

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

[Get your API key](https://dashboard.exa.ai/api-keys)

## What's Included

### Tools (via MCP)

- `web_search_exa` — search the web
- `get_code_context_exa` — find code examples from GitHub, Stack Overflow, docs
- `crawling_exa` — get the contents of a URL

### Commands

- `/exa-search <query>` — web search
- `/exa-code <query>` — code search
- `/exa-company <query>` — company research
- `/exa-crawl <url>` — read a URL
- `/exa-setup` — set up the MCP connection
- `/exa-status` — check if it's working

### Skills

- `exa-web-search` — how to search the web with Exa
- `exa-code-search` — how to find code examples
- `exa-company-research` — how to research companies
- `exa-crawl` — how to read URLs
- `exa-best-practices` — general tips

### Rules

- `exa-awareness` — tells the agent to use Exa when it makes sense

## Links

- [Docs](https://docs.exa.ai)
- [API Keys](https://dashboard.exa.ai/api-keys)
- [MCP Server](https://github.com/exa-labs/exa-mcp-server)

## License

MIT
