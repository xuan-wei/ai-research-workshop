# AI for Research Workshop

> 90-minute hands-on workshop: From web chat to harness engineering

## Quick Start (GitHub Codespaces)

1. Click the green **"Code"** button → **"Codespaces"** → **"Create codespace on main"**
2. Wait ~2 minutes for environment setup
3. In the terminal, set your API key:
   ```bash
   export ANTHROPIC_API_KEY="your-deepseek-api-key"
   ```
4. Start Claude Code:
   ```bash
   claude
   ```

> **Get your DeepSeek API key**: https://platform.deepseek.com/api_keys  
> Cost: ~$0.14/M input tokens, ~$0.28/M output tokens (very cheap!)

## Workshop Levels

| Level | Directory | What You Learn | Time |
|-------|-----------|---------------|------|
| 1 | `demos/01-basics/` | CLI fundamentals: prompts, file I/O, piping | 15 min |
| 2 | `demos/02-mcp/` | Connect external tools (web fetch, APIs) | 20 min |
| 3 | `demos/03-skills/` | Create reusable research workflow commands | 25 min |
| 4 | `demos/04-harness/` | Multi-agent orchestration for complex tasks | 30 min |

## Architecture

```
Claude Code CLI
    ├── DeepSeek API (via Anthropic-compatible endpoint)
    ├── MCP Servers (external tool access)
    ├── Skills (reusable slash commands)
    └── Workflows (multi-agent orchestration)
```

## For Instructors

### Unified API Key Setup

If providing a shared API key, set it as a Codespace secret:

1. Go to repo **Settings** → **Secrets and variables** → **Codespaces**
2. Add secret: `DEEPSEEK_API_KEY` = `your-key`
3. Students' Codespaces will auto-configure

### Local Setup (Alternative)

```bash
git clone https://github.com/<your-org>/ai-research-workshop.git
cd ai-research-workshop
bash setup.sh <your-deepseek-api-key>
claude
```

## Model Info

| Model | Use | Cost (per 1M tokens) |
|-------|-----|---------------------|
| `deepseek-v4-pro` | Main model (complex tasks) | $0.435 input / $0.87 output |
| `deepseek-v4-flash` | Sub-agents (fast tasks) | $0.14 input / $0.28 output |

Both accessed via DeepSeek's Anthropic-compatible endpoint: `https://api.deepseek.com/anthropic`
