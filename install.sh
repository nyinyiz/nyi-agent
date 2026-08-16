#!/usr/bin/env bash
set -euo pipefail

echo "nyi-agent installer · Nyi Nyi Zaw profile"

if ! command -v npx >/dev/null 2>&1; then
  echo "✗ npx not found — install Node.js first: https://nodejs.org" >&2
  exit 1
fi

echo "→ npx skills add nyinyiz/nyi-agent --skill nyi-agent"
npx -y skills add nyinyiz/nyi-agent --skill nyi-agent

# Locate a known commands directory for the detected agent.
COMMAND_DIRS=(
  "${CLAUDE_CONFIG_DIR:-$HOME/.claude}/commands"
  "$HOME/.claude/commands"
  "$HOME/.cursor/commands"
  "$HOME/.codeium/windsurf/commands"
  "$HOME/.codex/commands"
  "$HOME/.config/zed/commands"
)

target=""
for d in "${COMMAND_DIRS[@]}"; do
  if [ -d "$(dirname "$d")" ]; then
    target="$d"
    break
  fi
done

# Find where the skill landed (project-level first, then user-level).
SOURCE_DIRS=(
  ".agents/skills/nyi-agent/commands"
  "$HOME/.claude/skills/nyi-agent/commands"
  "$HOME/.config/opencode/skills/nyi-agent/commands"
)

if [ -n "$target" ]; then
  mkdir -p "$target"
  copied=""
  for src in "${SOURCE_DIRS[@]}"; do
    if [ -d "$src" ] && [ -n "$(ls -A "$src" 2>/dev/null)" ]; then
      cp "$src"/*.md "$target"/
      copied="$src"
      break
    fi
  done
  if [ -n "$copied" ]; then
    echo "→ commands installed to $target (from $copied)"
  else
    echo "! skill files not found — run npx skills add manually, or re-run this installer from your project root"
  fi
else
  echo "! could not detect your agent's commands folder — npx skills add already handles supported tools"
fi

echo ""
echo "Done. Try: /fitcheck <job description>"
echo "More: https://github.com/nyinyiz/nyi-agent"
