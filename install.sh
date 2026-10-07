#!/usr/bin/env bash
set -euo pipefail

echo "nyi-agent installer · Nyi Nyi Zaw profile"

if ! command -v npx >/dev/null 2>&1; then
  echo "✗ npx not found — install Node.js first: https://nodejs.org" >&2
  exit 1
fi

echo "→ npx skills add nyinyiz/nyi-agent --skill nyi-agent"
npx -y skills add nyinyiz/nyi-agent --skill nyi-agent

# Collect every agent commands directory present, not just the first match.
# Picking the first meant anyone who had ever run Claude Code got the commands
# in ~/.claude/commands even when the agent they actually use is Cursor.
COMMAND_DIRS=(
  "${CLAUDE_CONFIG_DIR:-$HOME/.claude}/commands"
  "$HOME/.claude/commands"
  "$HOME/.cursor/commands"
  "$HOME/.codeium/windsurf/commands"
  "$HOME/.codex/commands"
  "$HOME/.config/zed/commands"
)

targets=()
for d in "${COMMAND_DIRS[@]}"; do
  [ -d "$(dirname "$d")" ] || continue
  # CLAUDE_CONFIG_DIR often resolves to the default path, so drop duplicates.
  for seen in ${targets[@]+"${targets[@]}"}; do
    [ "$seen" = "$d" ] && continue 2
  done
  targets+=("$d")
done

# Find where the skill landed (project-level first, then user-level).
SOURCE_DIRS=(
  ".agents/skills/nyi-agent/commands"
  "$HOME/.agents/skills/nyi-agent/commands"
  "$HOME/.claude/skills/nyi-agent/commands"
  "$HOME/.config/opencode/skills/nyi-agent/commands"
)

source_dir=""
for src in "${SOURCE_DIRS[@]}"; do
  # Test for .md files specifically. A merely non-empty directory left the
  # glob below unexpanded, so cp failed and `set -e` aborted the installer
  # after the skill itself had already been added.
  if [ -d "$src" ] && compgen -G "$src/*.md" >/dev/null; then
    source_dir="$src"
    break
  fi
done

if [ -z "$source_dir" ]; then
  echo "! skill files not found — run npx skills add manually, or re-run this installer from your project root"
elif [ ${#targets[@]} -eq 0 ]; then
  echo "! could not detect your agent's commands folder — npx skills add already handles supported tools"
else
  for target in "${targets[@]}"; do
    mkdir -p "$target"
    cp "$source_dir"/*.md "$target"/
    echo "→ commands installed to $target (from $source_dir)"
  done
fi

echo ""
echo "Done. Try: /fitcheck <job description>"
echo "More: https://github.com/nyinyiz/nyi-agent"
