---
description: "Check if your Exa MCP connection is active"
---

# Exa Status

Check the Exa MCP connection status.

1. Try calling `web_search_exa` with query `"status check"` and `numResults: 1`.

2. **If it works**: Report that Exa is connected and list available tools:
   - `web_search_exa` ✓
   - `get_code_context_exa` ✓
   - `crawling_exa` ✓

3. **If it fails**: Tell the user the Exa MCP server is not connected and suggest running `/exa-setup` to configure it.
