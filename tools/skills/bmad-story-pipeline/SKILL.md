---
name: bmad-story-pipeline
description: Run configurable BMAD story delivery using the BMAD/BMM/TEA skills already installed in the current project. Use when the user wants to deliver one story through create-story, ATDD, dev, review, and traceability in sequence.
---

# BMAD Story Pipeline

Complete the delivery pipeline for one story using the BMAD skills already available in the current project.

## Inputs

- Story id format: `X-Y` such as `1-1` or `2-3`
- If no story id is provided, try to infer it from `_bmad-output/implementation-artifacts/sprint-status.yaml` or `docs/sprint/sprint-status.yaml` by choosing the first story not marked `done`.
- If neither status file exists, do not guess; ask the user for an explicit story id.

## Workflow

1. Locate the sprint status file if it exists.
2. Read `references/workflow-steps.md`.
3. For each step, invoke the named BMAD skill in the current project, in order.
4. Stop immediately if any step fails or produces a blocking result.
5. After all steps succeed, update the story status to `done` in the sprint status file and in the story doc if it exists.
6. If status or story docs are missing, report that explicitly and finish without fabricating updates.

## Skill mapping

- `bmad-create-story {STORY_ID}`
- `bmad-tea-testarch-atdd {STORY_ID}`
- `bmad-dev-story {STORY_ID}`
- `bmad-code-review {STORY_ID}`
- `bmad-tea-testarch-trace {STORY_ID}`

## Behavior rules

- Use the project-local BMAD skills; do not substitute global wrappers.
- Keep progress explicit after each step.
- If sprint status files are missing, require an explicit story id and skip automatic status updates.
- If the story document path cannot be determined safely, report it instead of guessing.
- Before finalizing, verify that every configured step actually ran or was reported blocked.
