---
name: bmad-epic-pipeline-worktree
description: Deliver all incomplete stories in one BMAD epic by running bmad-story-pipeline-worktree sequentially per story. Use when the user wants batch epic execution with worktree isolation.
---

# BMAD Epic Pipeline Worktree

Deliver all incomplete stories in one epic through the BMAD story pipeline worktree flow.

## Inputs

- Epic number such as `1`, `2`, `3`
- If omitted, try to infer the smallest epic number that still has stories not marked `done` in `_bmad-output/implementation-artifacts/sprint-status.yaml` or `docs/sprint/sprint-status.yaml`.
- If neither status file exists, do not guess; ask the user for an explicit epic number.

## Preconditions

- The current project must be a git repository.
- If `git rev-parse --is-inside-work-tree` fails, stop and tell the user this skill requires a git repo.

## Workflow

1. Verify the project is a git repository before doing anything else.
2. Read the sprint status file and collect all incomplete stories for the chosen epic.
3. Sort stories by story number ascending.
4. For each story, invoke `bmad-story-pipeline-worktree {STORY_ID}` sequentially.
5. Stop immediately if any story fails, and preserve that story worktree state for manual handling.
6. After all stories succeed, ensure story artifacts and epic status are synchronized and report epic completion.
7. Invoke `bmad-retrospective {EPIC_ID}` to close the epic cycle, extract lessons learned, and update the roadmap with any discovered technical debt.

## Behavior rules

- Run stories strictly sequentially; never overlap worktree deliveries.
- Reuse the same story selection and status source throughout one epic run.
- If no incomplete stories exist, say so explicitly and stop.
- If there is no usable sprint status file, require an explicit epic number and do not auto-select.
- Keep a running completion table after each story.
