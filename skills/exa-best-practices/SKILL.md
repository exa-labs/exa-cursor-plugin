---
name: exa-best-practices
description: "General best practices for using Exa search tools. Covers citation standards, tool selection, and search optimization."
---

# Exa Best Practices

## Tool Selection

| Need | Tool | When |
|------|------|------|
| Web search | `web_search_exa` | Current info, news, research, general questions, code examples |
| Read a URL | `crawling_exa` | Extract content from a known URL |

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

- **Tools not available**: Exa MCP is not connected. Run `/exa-setup` to add the MCP server, then enable it in Cursor Settings → Tools & MCP.
- **No results**: Try rephrasing the query or broadening search terms
