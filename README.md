# Install BMAD Auto Skill

A specialized skill for **Codex CLI** and **Gemini CLI** designed to automate the installation of Terryso-style BMAD pipeline skills into your project. Dual-Support, Self-Contained, dan Project-Oriented.

## 🚀 Overview

This skill transforms a basic BMAD/BMM/TEA setup into a high-performance autonomous development environment by installing four advanced pipeline skills:

1.  **`bmad-story-pipeline`**: Standardized workflow for delivering a single story.
2.  **`bmad-story-pipeline-worktree`**: Isolated, safe story delivery using git worktrees.
3.  **`bmad-epic-pipeline-worktree`**: Orchestration for delivering multiple stories in an epic.
4.  **`bmad-autonomous-epic-worktree`**: Full end-to-end autonomous epic delivery (Epic Pipeline + Retrospective).

## 🛠 Prerequisites

Before using this skill, ensure your project has:
- **BMAD Core**: `_bmad/bmm` and `_bmad/tea` directories (installed via `npx bmad-method install`).
- **Bootstrap Skills**: The following skills must exist in `.agents/skills/`:
  - `bmad-create-story`
  - `bmad-dev-story`
  - `bmad-code-review`
  - `bmad-tea-testarch-atdd`
  - `bmad-tea-testarch-trace`

## 📦 Installation (Global for CLI Agents)

This skill is compatible with both **Gemini CLI** and **Codex CLI**. To make this skill available to your agent, clone this repository into your local skills directory:

**For Gemini CLI / Cross-Compatibility (Preferred):**
```bash
cd ~/.agents/skills
git clone https://github.com/your-username/install-bmad-auto-skill.git
```

**For Codex CLI:**
```bash
cd ~/.codex/skills
git clone https://github.com/your-username/install-bmad-auto-skill.git
```

## 📋 Usage

Once installed, you can trigger the installation in any active project by asking your CLI agent (Gemini or Codex):

> "@install-bmad-auto-skill install the pipeline skills here"

The agent will:
1.  Verify the project core and bootstrap skills.
2.  Execute the internal installation script.
3.  Confirm the new pipeline skills are ready to use in `.agents/skills/`.

## 📁 Structure

This skill is fully self-contained:
- `SKILL.md`: Core logic and instructions for the AI Agent.
- `agents/`: Interface definitions.
- `tools/scripts/`: The execution engine.
- `tools/skills/`: The template skills to be deployed.

## ❤️ Inspiration & Credits

This skill is heavily inspired by and adapted from [terryso/claude-bmad-skills](https://github.com/terryso/claude-bmad-skills). It bridges those powerful BMAD patterns into the **Gemini CLI** ecosystem.

## 📄 License

MIT License - feel free to use and contribute!
