---
name: exa-setup
description: Set up the Exa plugin — add the MCP server and connect it in Cursor
---

# Exa Plugin Setup

## You (the AI) must:

1. Add the following MCP config to the project's `.cursor/mcp.json` file (create it if it doesn't exist):

```json
{
  "mcpServers": {
    "exa": {
      "url": "https://mcp.exa.ai/mcp"
    }
  }
}
```

2. After adding the config, verify setup by checking if `web_search_exa` is available in your tool list.

## Request the user to:

1. Open **Cursor Settings → Tools & MCP**.
2. Find **exa** in the list.
3. Toggle it **on** (click the green enable button).

## Troubleshooting

If `web_search_exa` is still not available after setup:

### You (the AI) must:

- Stop and do not attempt to use fallback tools or answer from your own knowledge.

### Request the user to:

- Confirm the MCP server shows as enabled (green) in **Cursor Settings → Tools & MCP**.
- Restart Cursor if the MCP server was just added.
