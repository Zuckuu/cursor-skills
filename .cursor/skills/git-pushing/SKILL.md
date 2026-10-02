---
name: git-pushing
description: Stage, commit, and push git changes with conventional commit messages. Use when user wants to commit and push changes, mentions pushing to remote, or asks to save and push their work. Also activates when user says "push changes", "commit and push", "push this", "push to github", or similar git workflow requests.
---

# Git Push Workflow

Stage all changes, create a conventional commit, and push to the remote branch.

## When to Use

Automatically activate when the user:
- Explicitly asks to push changes ("push this", "commit and push")
- Mentions saving work to remote ("save to github", "push to remote")
- Completes a feature and wants to share it
- Says phrases like "let's push this up" or "commit these changes"

## Workflow

Run from the **repository root**. Prefer the bundled script for a consistent conventional commit and push:

```bash
bash .cursor/skills/git-pushing/scripts/smart_commit.sh
```

With a custom message:
```bash
bash .cursor/skills/git-pushing/scripts/smart_commit.sh "feat: add feature"
```

If the project uses a different skills path, adjust the path or copy the script locally. The script handles staging, conventional commit message generation, and `git push -u` when needed.

When the user only wants a commit without push, or needs a signed commit, use explicit git commands instead of the script.
