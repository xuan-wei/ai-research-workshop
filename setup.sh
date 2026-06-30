#!/bin/bash
# Quick setup script for students who want to configure locally
# Usage: bash setup.sh <your-deepseek-api-key>

set -e

API_KEY="${1:-}"

if [ -z "$API_KEY" ]; then
  echo "Usage: bash setup.sh <your-deepseek-api-key>"
  echo ""
  echo "Get your API key at: https://platform.deepseek.com/api_keys"
  exit 1
fi

echo "Configuring Claude Code with DeepSeek API..."

export ANTHROPIC_BASE_URL="https://api.deepseek.com/anthropic"
export ANTHROPIC_API_KEY="$API_KEY"
export ANTHROPIC_MODEL="deepseek-v4-pro[1m]"
export ANTHROPIC_DEFAULT_OPUS_MODEL="deepseek-v4-pro[1m]"
export ANTHROPIC_DEFAULT_SONNET_MODEL="deepseek-v4-pro[1m]"
export ANTHROPIC_DEFAULT_HAIKU_MODEL="deepseek-v4-flash"
export CLAUDE_CODE_SUBAGENT_MODEL="deepseek-v4-flash"

# Write to shell profile
SHELL_RC="$HOME/.bashrc"
[ -f "$HOME/.zshrc" ] && SHELL_RC="$HOME/.zshrc"

cat >> "$SHELL_RC" << EOF

# AI Research Workshop - DeepSeek via Claude Code
export ANTHROPIC_BASE_URL="https://api.deepseek.com/anthropic"
export ANTHROPIC_API_KEY="$API_KEY"
export ANTHROPIC_MODEL="deepseek-v4-pro[1m]"
export ANTHROPIC_DEFAULT_OPUS_MODEL="deepseek-v4-pro[1m]"
export ANTHROPIC_DEFAULT_SONNET_MODEL="deepseek-v4-pro[1m]"
export ANTHROPIC_DEFAULT_HAIKU_MODEL="deepseek-v4-flash"
export CLAUDE_CODE_SUBAGENT_MODEL="deepseek-v4-flash"
EOF

echo "Done! Configuration written to $SHELL_RC"
echo ""
echo "Now run:  source $SHELL_RC && claude"
