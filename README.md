# Nyi Nyi Zaw — Agent Skill

Public repo hosting the `nyi-agent` AI skill for **Nyi Nyi Zaw** (Lead Mobile Engineer, Bangkok).

Install it into any AI agent:

## Quickstart

One command:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/nyinyiz/nyi-agent/main/install.sh)"
```

Manual:

```bash
npx skills add nyinyiz/nyi-agent --skill nyi-agent
mkdir -p ~/.claude/commands && cp .agents/skills/nyi-agent/commands/*.md ~/.claude/commands/
```

## Contents

| Path | Purpose |
|------|---------|
| `nyi-agent/SKILL.md` | Skill manifest — full profile context |
| `nyi-agent/commands/*.md` | Slash commands: `/asknyi`, `/fitcheck`, `/workwithnyi`, `/talkwithnyi`, `/codereview` |
| `nyi-agent.json` | Machine-readable profile manifest |

> This repo is auto-synced from the private portfolio repo. Do not edit directly — changes are overwritten on push.
