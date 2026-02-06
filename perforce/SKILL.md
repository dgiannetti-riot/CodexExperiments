---
name: perforce
description: Safe Perforce operations for editing files in a P4 workspace using the workspace's p4config.txt via P4CONFIG. Use when files need to be opened for edit, added, deleted, or moved between changelists. Provides read-only status and diff operations. NEVER submits changelists and NEVER runs p4 commands outside the explicit allowlist in this skill.
---

# Perforce

Safe P4 operations for unblocking file edits. This skill restricts operations to prevent destructive actions.

## Environment

All Perforce operations must resolve configuration via the workspace `p4config.txt`.

- `P4CONFIG` is expected to already be set to `p4config.txt` by the IDE or
  shell environment.
- **Always run commands from the repo/workspace root** (the directory
  containing `p4config.txt`).
- **Always verify config was applied** by running `p4 info` and ensuring
  the reported `User name`, `Client name`, and `Server address` match the
  workspace.

## Allowed Operations

Only use these `p4` CLI commands:

- `p4 status`
- `p4 info`
- `p4 add`
- `p4 edit`
- `p4 delete`
- `p4 diff`
- `p4 change -o` / `p4 change -i`
- `p4 reopen -c`

## Forbidden Operations

**NEVER execute these commands:**
- `p4 submit` - Submitting changelists
- `p4 obliterate` - Destroying depot history
- `p4 revert -a` - Mass reverting files
- `p4 sync -f` - Force syncing (data loss risk)
- Any submit/obliterate operations
- Any `p4` CLI command not listed under "Allowed Operations"

## Workflow

### Check Status First

Before editing files, check workspace status:
```powershell
p4 status
```

### Validate P4CONFIG Resolution

Call `p4 info` from the repo/workspace root:
```powershell
p4 info
```

If the output does not reflect the expected workspace config, stop and ask the
user to ensure `P4CONFIG=p4config.txt` is set for the agent session.

### Open Files for Edit

Before modifying existing depot files:
```powershell
p4 edit <file1> <file2> ...
```

### Add New Files

For files not yet in the depot:
```powershell
p4 add <file1> <file2> ...
```

### Create Changelist

Create a numbered changelist with description:
```powershell
p4 change -o | ForEach-Object { $_ -replace '<enter description here>', 'Your description' } | p4 change -i
```

### Move Files to Changelist

Move opened files to a specific changelist:
```powershell
p4 reopen -c <changelist_number> <file1> <file2> ...
```

### View Differences

Check what changed before requesting review:
```powershell
p4 diff <file>
```

## Notes

- Always create a changelist with a descriptive message before making changes
- Never submit changelists directly; create Perforce reviews for all changes
- If a file edit fails with "not on client", use `p4 edit` first
- Use `p4 info` to verify workspace configuration if operations fail
