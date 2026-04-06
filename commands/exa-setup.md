---
description: "Configure and verify your Exa MCP connection"
---

# Exa Setup

Help the user verify their Exa MCP connection is working.

## Steps

1. Check if the Exa MCP tools are available by attempting to call `web_search_exa` with a simple test query like `"test"` and `numResults: 1`.

2. **If the tool works**: Tell the user their Exa connection is active and working. List the available tools:
   - `web_search_exa` — search the web
   - `get_code_context_exa` — find code examples
   - `crawling_exa` — extract content from URLs

3. **If the tool is not available**: Guide the user through setup:
   - Open **Cursor Settings** → **MCP** tab
   - Add a new MCP server with this config:
     ```json
     {
       "mcpServers": {
         "exa": {
           "url": "https://mcp.exa.ai/mcp"
         }
       }
     }
     ```
   - Click the connect button to authenticate
   - Get an API key at https://dashboard.exa.ai/api-keys if needed
   - Restart Cursor if the connection doesn't appear

4. After setup, run a test search to confirm everything works.
