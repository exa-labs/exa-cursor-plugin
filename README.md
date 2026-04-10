# Exa Cursor Plugin

[Exa](https://exa.ai) is the fastest and most accurate web search API. This plugin has Exa's web search and crawling tools so the AI can search the web for you while you code.

## Features

| Capability | Skill | Command |
| --- | --- | --- |
| **Web Search** | `exa-web-search` | `/exa-search <query>` |
| **Content Extraction** | `exa-fetch` | `/exa-fetch <url>` |

Additional: `/exa-setup` (install the MCP server), `exa-best-practices` (search tips and citation guide), `exa-awareness` (rule that nudges the agent to use Exa when it makes sense).

## Installation

Install it from the [Cursor Marketplace](https://cursor.com/marketplace/exa).

### MCP Only

If you just want the search tools without skills, commands, or rules, add this to `.cursor/mcp.json`:

```json
{
  "mcpServers": {
    "exa": {
      "url": "https://mcp.exa.ai/mcp"
    }
  }
}
```

No API key needed. You'll be prompted to log in when you first use a tool.

## Quick Start

**Search the web:**

```
/exa-search latest developments in quantum computing
```

**Read a webpage:**

```
/exa-fetch https://example.com/article
```

**Set up the MCP server (first time only):**

```
/exa-setup
```

## Local Development

To test the plugin from source:

1. Clone and open in Cursor:

```bash
git clone https://github.com/exa-labs/exa-cursor-plugin.git
cursor exa-cursor-plugin
```

2. Skills, rules, and MCP config are auto-discovered from the repo's standard directories. Type `/` in the chat to verify the `exa-*` commands are listed.

3. To test as a full plugin (with commands), run the install script:

```bash
bash install.sh
```

Re-run after each change to push updates. Restart Cursor to pick up changes.

## Links

- [Exa Docs](https://docs.exa.ai)
- [Get an API Key](https://dashboard.exa.ai/api-keys)
- [Exa MCP Server](https://github.com/exa-labs/exa-mcp-server)
