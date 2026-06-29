#!/bin/bash
set -e

echo "========================================="
echo "  AI for Research Workshop - Setup"
echo "========================================="

# Install Claude Code CLI
echo "[1/3] Installing Claude Code CLI..."
npm install -g @anthropic-ai/claude-code

# Verify installation
echo "[2/3] Verifying installation..."
claude --version

# Setup API key if provided via Codespace secret
if [ -n "$DEEPSEEK_API_KEY" ]; then
  echo "[3/3] Configuring DeepSeek API key..."
  export ANTHROPIC_AUTH_TOKEN="$DEEPSEEK_API_KEY"
  echo "export ANTHROPIC_AUTH_TOKEN=\"$DEEPSEEK_API_KEY\"" >> ~/.bashrc
  echo "API key configured from Codespace secret."
else
  echo "[3/3] No DEEPSEEK_API_KEY secret found."
  echo ""
  echo "  To configure, run:"
  echo "  export ANTHROPIC_AUTH_TOKEN=\"your-deepseek-api-key\""
  echo ""
fi

# Write env vars to bashrc for persistence
cat >> ~/.bashrc << 'EOF'
# AI Research Workshop - DeepSeek via Anthropic format
export ANTHROPIC_BASE_URL="https://api.deepseek.com/anthropic"
export ANTHROPIC_MODEL="deepseek-v4-pro[1m]"
export ANTHROPIC_DEFAULT_OPUS_MODEL="deepseek-v4-pro[1m]"
export ANTHROPIC_DEFAULT_SONNET_MODEL="deepseek-v4-pro[1m]"
export ANTHROPIC_DEFAULT_HAIKU_MODEL="deepseek-v4-flash"
export CLAUDE_CODE_SUBAGENT_MODEL="deepseek-v4-flash"
EOF

echo ""
echo "========================================="
echo "  Setup complete!"
echo "  Run: claude    to start Claude Code"
echo "========================================="
