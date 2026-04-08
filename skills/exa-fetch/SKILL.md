---
name: exa-fetch
description: "URL content extraction using Exa. Gets clean markdown text from any webpage. Use when you have a specific URL and need its contents — articles, docs, blog posts, PDFs, or any web page. Triggers on: 'read this page', 'fetch this URL', 'extract content from', 'grab the text from', 'get the page at', 'what does this link say', or when a user shares a URL. Supports batching multiple URLs in a single call. Use exa-web-search instead when you don't have a URL yet."
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

## Before You Start

Check if Exa MCP is installed by confirming `web_fetch_exa` is available in your tool list.

## If the MCP Server Is Not Connected

### You (the AI) must:

1. **Stop immediately** — do NOT try to fetch the URL yourself, do NOT use websearch, and do NOT try to answer from your own knowledge.
2. Inform the user that Exa MCP is not connected.

### Request the user to:

1. Run the `/exa-setup` command in Cursor to add the Exa MCP server.
2. Go to **Cursor Settings → Tools & MCP** and make sure Exa is toggled **on** (green).
3. Retry their fetch after completing the above steps.
