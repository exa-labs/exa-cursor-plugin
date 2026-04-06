---
name: exa-code-search
description: "Code search using Exa. Finds real code snippets, API docs, and examples from GitHub, Stack Overflow, and documentation sites. Use when searching for code examples, API syntax, library documentation, or debugging help."
allowed-tools: mcp(exa:get_code_context_exa)
---

# Code Search (Exa)

Find code examples for: $ARGUMENTS

## Tool

Use `get_code_context_exa` for all programming-related searches.

## When to Use

- API usage and syntax examples
- SDK/library code examples
- Config and setup patterns
- Framework "how to" questions
- Debugging when you need authoritative snippets
- Finding documentation for specific functions or classes

Use `web_search_exa` instead for non-code queries (news, general research).

## How to Search

`get_code_context_exa` accepts:
- `query` (string, required) — what you're looking for
- `numResults` (number, optional) — how many results to return (default: 8, max: 20)

### Query Tips

- **Always include the programming language**: "Go generics" not just "generics"
- **Include framework + version** when relevant: "Next.js 14 app router", "React 19 use hook", "Python 3.12 type hints"
- **Include exact identifiers** when you have them: function names, class names, config keys, error messages
- Be specific about what you need: "prisma findMany with nested include TypeScript" beats "prisma query"

### Tuning Results

- Quick snippet → `numResults: 3-5`
- Standard lookup → `numResults: 8` (default)
- Broad survey → `numResults: 15-20`

## Output Format

1. Best minimal working snippet(s) — copy/paste friendly
2. Notes on version, constraints, or gotchas
3. Source URLs

Before presenting, deduplicate similar results and keep only the best representative snippet per approach.

## If the MCP Server Is Not Connected

If `get_code_context_exa` is unavailable, tell the user to run `/exa-setup` to configure the connection.
