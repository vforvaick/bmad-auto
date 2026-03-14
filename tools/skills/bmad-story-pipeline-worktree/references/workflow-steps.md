# BMAD Story Pipeline Workflow Steps

## Pipeline Configuration

Execute the following steps in order using the BMAD skills already installed in the current project.
Each step should run in a fresh subagent or isolated execution context when practical.

### Step 1: Create User Story
- Skill: `bmad-create-story {STORY_ID}`
- Description: Creates or refreshes the story file with planning context
- Return: Story ID, title, created or updated files

### Step 2: Generate ATDD Tests
- Skill: `bmad-tea-testarch-atdd {STORY_ID}`
- Description: Generate failing acceptance tests or ATDD artifacts
- Return: ATDD checklist and test files

### Step 3: Development
- Skill: `bmad-dev-story {STORY_ID}`
- Description: Implement the story and satisfy the generated tests
- Return: Modified files, change summary

### Step 4: Code Review
- Skill: `bmad-code-review {STORY_ID}`
- Description: Run adversarial code review for issues
- Return: Conclusion, issue list, blocking findings

### Step 5: Trace Test Coverage
- Skill: `bmad-tea-testarch-trace {STORY_ID}`
- Description: Generate traceability matrix and quality gate decision
- Return: Coverage percentage, gate decision, gaps

## Post-Pipeline

After all steps complete:
1. Update sprint-status.yaml: story status -> done
2. Update story document: Status: done, tasks complete if applicable
