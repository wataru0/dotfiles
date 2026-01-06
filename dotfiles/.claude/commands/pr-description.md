---
allowed-tools: Bash(gh pr:*)
description: Generate PR description from existing GitHub PR URL
---

## Context

- PR URL: $1
- PR basic info: !`gh pr view $1 --json title,body,author,baseRefName,headRefName,number`
- PR file changes: !`gh pr diff $1`
- PR commit history: !`gh pr view $1 --json commits --jq '.commits[] | "\(.oid[0:7]) \(.messageHeadline)"'`

## Your task

Based on the above existing PR information and file changes, generate an improved PR description.
**Do NOT execute any git commands or make any changes to the PR.**
Only provide the suggested PR description text.
**Do NOT include any Claude Code signatures or co-author credits.**

Format the description using this structure:

[what]
- (Brief summary of what this PR accomplishes)
- (What problem does it solve or what feature does it add)

[how]
- (Key implementation details)
- (Technical approach or methods used)
- (Any breaking changes or important notes)

## How to use
```
/pr-description https://your-PR-url
```
