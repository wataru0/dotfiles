---
allowed-tools: Read, Glob, Bash(ls:*), AskUserQuestion
description: Read a handover document and start a new session with full context
---

## Context

- Handover directory: `.claude/tmp/handover/`
- User argument: $ARGUMENTS

## Your task

Start this session by reading and understanding a handover document from a previous session.

**Steps**:

1. **Determine which handover file to use**:

   **If `$ARGUMENTS` is provided** (not empty):
   - The argument is the filename (e.g., `handover-auth-2025-02-03.md`)
   - Read directly from `.claude/tmp/handover/$ARGUMENTS`
   - If the file doesn't exist, inform the user and list available files

   **If `$ARGUMENTS` is empty**:
   - Use Glob to find all handover files in `.claude/tmp/handover/handover-*.md`
   - If no files exist, inform the user and end
   - Use AskUserQuestion to let the user choose which handover document to load
   - Display files sorted by date (newest first), showing full filenames

2. **Read and understand the handover document**:
   - Read the selected file completely
   - Internalize all the context: summary, discoveries, decisions, current state, next steps, conversation context, technical notes, and open questions

3. **Acknowledge the handover**:
   - Greet the user in the same language used in the handover document
   - Provide a brief summary of what you understood from the handover
   - Mention the key next steps that were identified
   - Ask if the user wants to continue with the planned next steps or has something else in mind

**Output format**:

```
## Session Takeover Complete

I've read the handover from: [filename]

### Quick Recap
(2-3 sentences summarizing the previous session's context)

### Where We Left Off
(Current state at the end of the previous session)

### Planned Next Steps
(List the prioritized next steps from the handover)

### Ready to Continue
(Ask the user how they'd like to proceed)
```

**Instructions**:
- Be warm but concise in your acknowledgment
- Show that you truly understand the context, not just listing facts
- Match the language and communication style noted in the handover
- Be ready to immediately dive into the work

## How to use
```
# Select from list interactively
/takeover

# Specify file directly
/takeover handover-auth-refactoring-2025-02-03.md
```
