---
name: exa-best-practices
description: "Reference guide for Exa search tools. Covers tool selection, citation standards, search optimization, and troubleshooting. Also useful as background context for improving search quality."
---

# Exa Best Practices

## Tool Selection

| Need | Tool | When |
|------|------|------|
| Web search | `web_search_exa` | Current info, news, research, general questions, code examples |
| Read a URL | `web_fetch_exa` | Extract content from a known URL |

## Citation Standards

When using Exa search results, always cite sources:

- **Inline citations**: Every fact or claim should reference its source
- **Source URLs**: Include the actual URL, not just the title
- **Sources section**: End responses with a list of all sources used
- **Never fabricate URLs**: Only cite URLs that appear in search results

## Search Quality Tips

1. **Natural language queries** work better than keyword stuffing
2. **Be specific** — include dates, names, versions when relevant
3. **Multiple queries** with different phrasings improve coverage
4. **Adjust result count** to match the depth needed (3-5 quick, 10-20 deep)

## Getting Started

1. Get your API key at https://dashboard.exa.ai/api-keys
2. Add the MCP server in Cursor Settings → MCP
3. Start searching with `/exa-search` or `/exa-fetch`

## Troubleshooting

- **Tools not available**: Check if the Exa MCP server is installed. If `web_search_exa` or `web_fetch_exa` are not in your tool list, stop and request the user to: (1) run `/exa-setup` in Cursor to add the MCP server, and (2) go to **Cursor Settings → Tools & MCP** and make sure Exa is toggled **on** (green).
- **No results**: Try rephrasing the query or broadening search terms
