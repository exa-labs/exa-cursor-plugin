---
name: exa-crawl
description: "Content extraction using Exa. Gets the full text content of a specific webpage from a known URL. Use when you have a URL and need to read its contents."
allowed-tools: mcp(exa:crawling_exa)
---

# Crawl URL (Exa)

Extract content from: $ARGUMENTS

## Tool

Use `crawling_exa` to get the full text of a webpage.

## When to Use

- You have a specific URL and need its contents
- Reading documentation pages, blog posts, or articles
- Extracting data from a known webpage
- Following up on a search result to get full content

Use `web_search_exa` instead when you don't have a URL and need to find pages first.

## How to Crawl

`crawling_exa` accepts:
- `url` (string, required) — the URL to extract content from
- `maxCharacters` (number, optional) — max characters to return (default: 3000)

### Character Limits

- Quick summary → `maxCharacters: 1000-2000`
- Standard read → `maxCharacters: 3000` (default)
- Full page content → `maxCharacters: 5000-10000`

## Output Format

1. Present the key information from the page
2. If the user asked a specific question, answer it using the page content
3. Include the source URL

## If the MCP Server Is Not Connected

If `crawling_exa` is unavailable, tell the user to run `/exa-setup` to configure the connection.
