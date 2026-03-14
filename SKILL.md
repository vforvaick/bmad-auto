---
name: install-bmad-auto-skill
description: "Install Terryso-style BMAD pipeline skills (story-pipeline, worktree, epic, autonomous-epic) into a project that already has BMAD/BMM/TEA bootstrap skills."
---

# Install BMAD Auto Skill

Install the Terryso-style BMAD pipeline skills into the current project, adapted for the current BMAD/BMM/TEA skill names. This skill is compatible with both **Gemini CLI** and **Codex CLI**.

## Prerequisites

Before installation, the agent MUST verify:
1.  **Project Core:** The active project directory contains `_bmad/bmm` and `_bmad/tea`.
2.  **Bootstrap Skills:** The project's `.agents/skills/` directory contains:
    - `bmad-create-story`
    - `bmad-dev-story`
    - `bmad-code-review`
    - `bmad-tea-testarch-atdd`
    - `bmad-tea-testarch-trace`

If any of these are missing, abort and report the specific missing prerequisite.

## Workflow

1.  **Locate Script:** Find the installation script within the skill's own `tools/scripts/install_to_project.sh` path.
2.  **Execute:** Run the script using the current project path:
    ```bash
    bash <skill_path>/tools/scripts/install_to_project.sh "$PWD"
    ```
3.  **Validate:** After execution, verify that the following new directories exist in `.agents/skills/`:
    - `bmad-story-pipeline`
    - `bmad-story-pipeline-worktree`
    - `bmad-epic-pipeline-worktree`
    - `bmad-autonomous-epic-worktree`
4.  **Report:** Confirm successful installation or detailed failure reasons.

## Behavior Rules

- **Strictly Project-Local:** Never install these pipeline skills globally.
- **Agent Self-Correction:** If the script execution fails, provide the full error output from the shell.
- **Concise Reporting:** Maintain a brief but informative final status.
