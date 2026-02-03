---
allowed-tools: Write, Bash(date:*), Bash(mkdir:*)
description: Create a handover document to pass session context to the next session
---

## Context

- Today's date: !`date +%Y-%m-%d`

## Your task

This session is ending. Create a comprehensive handover document for the next session.

**Output file**: Create a markdown file at `.claude/tmp/handover/handover-[session-title]-[today's-date].md`
- Generate a brief descriptive title based on the main topic of this session (e.g., "auth-refactoring", "api-debugging", "new-feature-planning")
- Sanitize the title for filename use (lowercase, hyphens instead of spaces, no special characters)
- Create the `.claude/tmp/handover/` directory if it doesn't exist

**Document structure**:

```markdown
# Handover: [Session Title]

Date: [Today's date]

## Summary
(Brief 2-3 sentence overview of what this session accomplished)

## What We Discussed
(Main topics and questions that came up during the conversation)

## What Was Discovered
(Key findings, insights, and learnings from investigation or exploration)
- Important file locations, code patterns, or architectural decisions found
- Any "aha" moments or non-obvious discoveries
- Things that didn't work and why

## Decisions Made
(Any choices or decisions that were made during the session)
- What was decided and the reasoning behind it
- Alternatives that were considered but rejected

## Current State
(Where things stand at the end of the session)
- What was completed
- What is partially done
- What was planned but not started

## Next Steps
(Concrete actionable items for the next session to pick up)
- Prioritized list of what should be done next
- Any blockers or dependencies to be aware of

## Conversation Context
(Helpful context about the session dynamics)
- The user's working style or preferences observed
- Communication patterns (e.g., prefers Japanese, likes detailed explanations, etc.)
- Any frustrations or concerns expressed
- The overall tone and flow of the conversation

## Technical Notes
(Specific technical details that would be useful to remember)
- Commands that were run
- Configuration changes made
- Environment-specific information
- Useful file paths or references

## Open Questions
(Unresolved questions or uncertainties)
- Things that still need clarification
- Areas that need further investigation
```

**Instructions**:
1. Review the entire conversation history
2. Extract all relevant information fitting the structure above
3. Write in a tone as if you're briefing your future self - be specific and actionable
4. Include both factual content AND subjective observations about the interaction
5. The goal is to enable the next session to immediately continue where this one left off
6. Write in the same language the user primarily used during the session

## How to use
```
/handover
```
