# Nyi Nyi Zaw — AI Agent Skill

An AI agent that knows **Nyi Nyi Zaw** — Lead Mobile Engineer (Bangkok) — his skills, experience, working style, and how he fits a job description. Install it into any AI agent and you get a recruiter-friendly profile on demand, with personality.

**Portfolio:** [nyinyizaw.dev](https://nyinyizaw.dev) · **LinkedIn:** [nyinyiz](https://www.linkedin.com/in/nyinyiz/) · **GitHub:** [@nyinyiz](https://github.com/nyinyiz)

> This is the *agent*. The human is better. If a conversation matters, talk to the real Nyi Nyi — the agent just answers questions about him.

---

## Quickstart

One command — auto-detects your agent (Claude Code, Cursor, Windsurf, Codex, Zed):

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/nyinyiz/nyi-agent/main/install.sh)"
```

Manual install:

```bash
# 1 — install the skill context
npx skills add nyinyiz/nyi-agent --skill nyi-agent

# 2 — enable slash commands (Claude Code)
mkdir -p ~/.claude/commands && cp .agents/skills/nyi-agent/commands/*.md ~/.claude/commands/
```

## Usage

After install, trigger the agent with a slash command or natural language:

| Command | What it does |
|---------|-------------|
| `/fitcheck <JD>` | Scores a job description against his profile — fit score, matched skills, gaps, one-line verdict |
| `/asknyi <question>` | Anything about his skills, experience, or availability |
| `/workwithnyi <question>` | Working style, team fit, preferred setup, remote vs on-site |
| `/talkwithnyi <message>` | Open conversation — first person, with personality |
| `/codereview <code>` | Reviews code in his voice — pragmatic, mobile-aware |
| `/compare <a> vs <b>` | Contrasts two JDs, or a JD against his profile |
| `/interview <topic>` | Generates role-specific interview questions |
| `/draft-email <context>` | Writes outreach email in his voice |
| `/availability <question>` | Timezone, working hours, overlap windows, response speed |
| `/resume` | Full structured profile — roles, projects, speaking, education, contact |
| `/onboard <question>` | Setup + troubleshooting guide |

Natural language also works in any agent: *"is Nyi Nyi a good fit for this role?"*, *"tell me about Nyi Nyi"*, *"evaluate this candidate"*.

## How it scores a JD

1. Separates must-haves from nice-to-haves
2. Categorises each skill: **Perfect Fit / Adjacent / Will Learn / Out of Scope**
3. Weights Perfect Fit high, penalises Out of Scope gaps
4. Flags must-have gaps plainly — no spin
5. Returns a one-line verdict, because recruiters are busy

```
Fit score: 82/100
✓ Perfect match: Kotlin, Android, React Native, TypeScript, CI/CD
~ Adjacent: Node.js backend, team leadership
✗ Gap: AWS infrastructure (flagged as must-have)
Verdict: Strong fit for the mobile scope. The AWS gap is real but learnable.
```

## Contents

| Path | Purpose |
|------|---------|
| `nyi-agent/SKILL.md` | Skill manifest — full profile, voice, JD-evaluation workflow |
| `nyi-agent/commands/*.md` | 11 slash commands |
| `nyi-agent.json` | Machine-readable profile manifest (versioned) |
| `install.sh` | One-line installer |

## About Nyi Nyi

10+ years building mobile apps people actually use. Android-first, equally at home on iOS and cross-platform. Currently leading PassKit's loyalty scanner app (NFC, CameraX, cross-platform). Previously True Digital (TrueID, 10M+ users), Thonburi Hospital healthcare platform, fractional CTO for an EdTech startup, and ride-hailing apps across Myanmar, Singapore, and Thailand.

**Contact:** [nyinyizaw.dev@gmail.com](mailto:nyinyizaw.dev@gmail.com) · [LinkedIn](https://www.linkedin.com/in/nyinyiz/) · [nyinyizaw.dev](https://nyinyizaw.dev)

---

> **Auto-synced:** `nyi-agent/SKILL.md`, `nyi-agent/commands/*`, and `nyi-agent.json` are synced from the private portfolio repo and overwritten on push — edit those upstream. The `README.md` and `install.sh` live here.
