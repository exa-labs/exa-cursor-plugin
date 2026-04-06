---
name: exa-web-search
description: "Web search using Exa. Finds current information, news, articles, and answers from across the web. Use when the user needs up-to-date information, fact-checking, research, or any question requiring live web data."
allowed-tools: mcp(exa:web_search_exa)
---

# Web Search (Exa)

Search the web for: $ARGUMENTS

## Tool

Use `web_search_exa` for all web search requests.

## When to Use

- Current events, news, recent developments
- Fact-checking or verifying claims
- Finding articles, blog posts, documentation
- Any question where the answer may have changed since training data cutoff
- General research and information gathering

Use `get_code_context_exa` instead for programming-related queries (see exa-code-search skill).

## How to Search

`web_search_exa` accepts:
- `query` (string, required) — natural language search query
- `numResults` (number, optional) — how many results to return

### Query Tips

- Write queries as natural language statements, not keywords
- Be specific: "latest React 19 server components changes" beats "react updates"
- Include time context when relevant: "2026 AI regulation proposals"
- For broad topics, run 2-3 queries with different phrasings and merge results

### Tuning Results

- Quick lookup → `numResults: 3-5`
- Standard research → `numResults: 5-10` (default)
- Deep dive → `numResults: 10-20`

## Output Format

For every claim or fact, cite the source inline:

1. Lead with the direct answer
2. Support with specific facts, numbers, dates
3. Cite every fact with its source URL
4. End with a Sources section listing all URLs used

## If the MCP Server Is Not Connected

If `web_search_exa` is unavailable, tell the user to run `/exa-setup` to configure the connection.
