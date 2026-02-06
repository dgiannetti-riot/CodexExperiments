---
name: perforce-cli
description: Use when working with Perforce Helix Core via the p4 CLI for basic source control tasks like sync, add, edit, delete, revert, submit, changelists, status, diff, and simple resolves.
---

# Perforce CLI

## Overview

Use this skill to guide basic Perforce (p4) command-line workflows for day-to-day version control tasks.

## Quick start workflow

1. Confirm workspace and server: `p4 info` (check Client name, Root, and Server address).
2. Sync latest files: `p4 sync` (or a narrower path like `p4 sync //depot/path/...`).
3. Open files:
   - Edit existing file: `p4 edit path\to\file`
   - Add new file: `p4 add path\to\file`
   - Delete file: `p4 delete path\to\file`
4. Review what is open: `p4 opened` and `p4 changelists`.
5. Diff your changes: `p4 diff` (use `p4 diff -du` for unified).
6. Submit: `p4 submit -c <changelist>`.

## Basic file operations

### Edit existing files

- Open for edit before changing: `p4 edit path\to\file`
- If you already edited without opening, use `p4 reconcile -n` to preview and `p4 reconcile` to open.

### Add new files

- Add and open for add: `p4 add path\to\file`
- Use `p4 add -n` to preview what would be added.

### Delete files

- Mark file for delete: `p4 delete path\to\file`
- To undo delete: `p4 revert path\to\file`

### Revert changes

- Revert a file: `p4 revert path\to\file`
- Revert unchanged files only: `p4 revert -a` (safe cleanup for opened files).

## Changelists and submit

- List pending changelists: `p4 changelists`
- Create/edit a changelist spec: `p4 change`
- Move files to a changelist: `p4 reopen -c <changelist> path\to\file`
- Submit a changelist: `p4 submit -c <changelist>`

## Inspect and diff

- Show opened files: `p4 opened`
- Show file history: `p4 filelog path\to\file`
- Diff all opened files: `p4 diff`
- Diff a specific file: `p4 diff path\to\file`

## Resolve conflicts (basic)

- When sync reports conflicts, run: `p4 resolve`
- If you only need a simple choice:
  - Accept yours: `p4 resolve -ay`
  - Accept theirs: `p4 resolve -at`
- Always re-run `p4 diff` after resolve and before submit.

## Troubleshooting basics

- If commands act on the wrong workspace, re-check `p4 info` (Client, Root, Server).
- If nothing is opened but you changed files, use `p4 reconcile -n` to preview.
