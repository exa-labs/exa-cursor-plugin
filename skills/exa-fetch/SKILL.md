---
name: exa-fetch
description: "Read a webpage's full content using Exa. Gets clean markdown text from a specific URL. Use when you have a URL and need to read its contents."
allowed-tools: mcp(exa:web_fetch_exa)
---

# Fetch URL (Exa)

Extract content from: $ARGUMENTS

## Tool

Use `web_fetch_exa` to get the full text of a webpage.

## When to Use

- You have a specific URL and need its contents
- Reading documentation pages, blog posts, or articles
- Extracting data from a known webpage
- Following up on a search result to get full content

Use `web_search_exa` instead when you don't have a URL and need to find pages first.

## How to Fetch

`web_fetch_exa` accepts:
- `urls` (array of strings, required) — the URLs to extract content from
- `maxCharacters` (number, optional) — max characters to return per page (default: 3000)

### Character Limits

- Quick summary → `maxCharacters: 1000-2000`
- Standard read → `maxCharacters: 3000` (default)
- Full page content → `maxCharacters: 5000-10000`

### Batching

You can fetch multiple URLs in a single call:

```
web_fetch_exa({
  "urls": ["https://example.com/page1", "https://example.com/page2"],
  "maxCharacters": 3000
})
```

## Output Format

1. Present the key information from the page
2. If the user asked a specific question, answer it using the page content
3. Include the source URL

## If the MCP Server Is Not Connected

If `web_fetch_exa` is unavailable, tell the user to check their MCP connection in Cursor Settings → MCP.
