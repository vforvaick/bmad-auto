---
name: bmad-bmm-retrospective-lite
description: Pragmatic post-epic review to extract lessons and assess success without complex Party Mode or large payload triggers. Use to avoid AbortError during large epic reviews.
---

# BMAD BMM Retrospective Lite

This skill is a pragmatic, single-agent variant of the standard `bmad-bmm-retrospective`.
It focuses on direct synthesis of implementation artifacts to produce valid BMAD retrospective documents while minimizing context tokens and turn count to avoid `AbortError` timeouts.

## Goal
Close the epic cycle, extract lessons learned, and update the roadmap with any discovered technical debt or insights using a lean, focused approach.

## Inputs
- Epic number (e.g., `5`)
- If omitted, infer from the highest `done` epic in `sprint-status.yaml`.

## Workflow

1. **Context Analysis (Lean):**
   - Read `_bmad-output/implementation-artifacts/sprint-status.yaml` to verify completed stories for the target epic.
   - Quickly scan implementation artifacts for the epic (e.g., `X-Y-*.md`) to identify common themes, struggles, and technical debt.
   - Do NOT attempt to load full multi-agent personas or simulate complex "Party Mode" dialogues.

2. **Artifact Synthesis:**
   - Summarize delivery metrics (Stories completed, velocity).
   - Identify "What Went Well" based on successful story completion and test passes.
   - Extract "Challenges & Struggles" from implementation notes in story artifacts.
   - Document "Action Items" and "Key Insights".

3. **Documentation:**
   - Generate a retrospective summary file: `_bmad-output/implementation-artifacts/epic-{EPIC_ID}-retro-{DATE}.md`.
   - Use a concise, structured format (Metrics, Successes, Challenges, Insights, Actions).

4. **Status Synchronization:**
   - Update `sprint-status.yaml` to mark `epic-{EPIC_ID}-retrospective` as `done`.
   - Synchronize `CHANGELOG.md` and `docs/ROADMAP.md` with the epic completion and addressed/new technical debt.

## Behavior Rules
- **Direct Tone:** Adopt a professional, technical, and concise tone (Bob the Scrum Master in "Pragmatic Mode").
- **No Party Mode:** Focus on data-grounded synthesis instead of multi-agent roleplay to save context window.
- **Surgical Edits:** Use `replace` for `CHANGELOG.md` and `ROADMAP.md` to keep context usage low.
- **Verification:** Ensure all stories in the epic are truly `done` before finalizing.

## Completion Criteria
- Retrospective artifact created in `_bmad-output/implementation-artifacts/`.
- `sprint-status.yaml` reflects retrospective completion.
- `CHANGELOG.md` and `ROADMAP.md` are updated.
