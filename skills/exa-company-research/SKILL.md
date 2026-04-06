---
name: exa-company-research
description: "Company research using Exa. Finds company info, competitors, news, funding, and LinkedIn profiles. Use when researching companies, doing competitor analysis, market research, or building company lists."
allowed-tools: mcp(exa:web_search_exa)
---

# Company Research (Exa)

Research: $ARGUMENTS

## Tool

Use `web_search_exa` with company-focused queries.

## When to Use

- Researching a specific company (funding, team, products, news)
- Competitor analysis and market landscapes
- Finding companies in a specific space or category
- Looking up company news and press coverage

## Research Strategy

### Discovery — find companies in a space

```
web_search_exa({
  "query": "AI infrastructure startups San Francisco Series A 2025",
  "numResults": 15
})
```

### Deep dive — research a specific company

```
web_search_exa({
  "query": "Anthropic funding rounds valuation revenue 2025",
  "numResults": 10
})
```

### News and press

```
web_search_exa({
  "query": "Stripe product launches announcements 2026",
  "numResults": 10
})
```

### Query Variation

Exa returns different results for different phrasings. For better coverage:
- Generate 2-3 query variations
- Run them separately
- Merge and deduplicate results

Example for researching a company:
1. `"Acme Corp funding valuation investors"`
2. `"Acme Corp product launches news 2026"`
3. `"Acme Corp competitors market share"`

## Output Format

1. Results — structured list, one company or fact per row
2. Sources — URLs with 1-line relevance each
3. Notes — flag any uncertainty or conflicting information

## If the MCP Server Is Not Connected

If `web_search_exa` is unavailable, tell the user to check their MCP connection in Cursor Settings → MCP.
