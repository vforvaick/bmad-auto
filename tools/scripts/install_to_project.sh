#!/usr/bin/env bash
set -euo pipefail

project_root="${1:-}"
if [[ -z "$project_root" ]]; then
  echo "usage: $0 <project-root>" >&2
  exit 1
fi

if [[ ! -d "$project_root/_bmad/bmm" ]]; then
  echo "missing $project_root/_bmad/bmm" >&2
  echo "run 'npx bmad-method install' with the BMM module first" >&2
  exit 1
fi

if [[ ! -d "$project_root/_bmad/tea" ]]; then
  echo "missing $project_root/_bmad/tea" >&2
  echo "run 'npx bmad-method install' with the TEA module first" >&2
  exit 1
fi

required_skills=(
  bmad-create-story
  bmad-dev-story
  bmad-code-review
  bmad-tea-testarch-atdd
  bmad-tea-testarch-trace
)

for skill in "${required_skills[@]}"; do
  if [[ ! -f "$project_root/.agents/skills/$skill/SKILL.md" ]]; then
    echo "missing required project skill: $project_root/.agents/skills/$skill/SKILL.md" >&2
    echo "re-run BMAD bootstrap or refresh the BMAD install first" >&2
    exit 1
  fi
done

skills_root="$project_root/.agents/skills"
source_root="$(cd "$(dirname "$0")/../skills" && pwd)"

for skill in bmad-story-pipeline bmad-story-pipeline-worktree bmad-epic-pipeline-worktree bmad-autonomous-epic-worktree; do
  rm -rf "$skills_root/$skill"
  cp -R "$source_root/$skill" "$skills_root/$skill"
done

echo "installed BMAD pipeline skills into $skills_root"
