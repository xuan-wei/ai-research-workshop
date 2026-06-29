# Demo 2: MCP - Connecting External Research Tools

## What You'll Learn

Use Model Context Protocol (MCP) to give Claude Code access to external research databases and tools.

## Setup

This demo comes with a pre-configured `.mcp.json` that connects to:
- **Semantic Scholar** - Search and retrieve academic papers
- **fetch** - Read any web page or API

The MCP config is already in this directory. To use it, start Claude Code from here:

```bash
cd demos/02-mcp
claude
```

## Exercises

### Exercise 2.1: Search for Papers

```
Search Semantic Scholar for papers about "chain-of-thought prompting" published after 2022. 
Show me the top 5 most cited papers with title, authors, year, citation count, and abstract.
```

### Exercise 2.2: Analyze a Specific Paper

```
Find the paper "Tree of Thoughts: Deliberate Problem Solving with Large Language Models" on Semantic Scholar.
Get its full details including references and citations.
Summarize: what papers does it build on, and what papers cite it?
```

### Exercise 2.3: Literature Comparison

```
Search for papers on "LLM evaluation benchmarks" from 2023-2024.
Create a comparison table with columns: Benchmark Name, What it Tests, Number of Tasks, Key Finding, Limitations.
```

### Exercise 2.4: Fetch and Analyze a Web Resource

```
Fetch the content from https://arxiv.org/abs/2201.11903 and summarize:
1. What is the paper about?
2. What methodology do they use?
3. What are the main results?
```

## How MCP Works

```
You (prompt) → Claude Code → MCP Server → External API → Results back to Claude
```

MCP servers are configured in `.mcp.json`. Each server provides "tools" that Claude Code can call.
Claude Code decides WHEN to call them based on your request.

## Key Takeaways

- MCP extends Claude Code's capabilities to any external service
- `.mcp.json` in project root configures available MCP servers
- Claude Code automatically discovers and uses MCP tools when relevant
- You can chain multiple MCP tools in a single conversation
