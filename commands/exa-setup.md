---
name: exa-setup
description: Set up the Exa plugin — add the MCP server and connect it in Cursor
---

# Exa Plugin Setup

## Step 1: Add the MCP server

Add this to your Cursor MCP config (`.cursor/mcp.json` or via Cursor Settings → MCP):

```json
{
  "mcpServers": {
    "exa": {
      "url": "https://mcp.exa.ai/mcp"
    }
  }
}
```

## Step 2: Enable the MCP server

1. Navigate to **Cursor Settings → Tools & MCP**
2. Find **exa** in the list
3. Toggle it **on** (click the green enable button)

## Step 3: Verify

Try calling `web_search_exa` with any query. If it returns results, you're all set.

If it fails, check:
- The MCP server is enabled (green) in Cursor Settings → Tools & MCP
