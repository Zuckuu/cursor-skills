---
name: git-pushing
description: Use when the user explicitly asks to commit and/or push specific work to the remote, after you have confirmed which changes belong in that commit.
---

# Git commit and push (explicit scope)

Do **not** run `git add -A` or push by default. The user may have other local changes. Show what you will run and scope staging to the work they asked to ship.

## When to use

- User clearly asks to commit and/or push **this feature**, **these files**, or **the current branch**
- User names a commit message or says "commit and push" **for the work we just did**

## When not to use

- Vague "push this" while unrelated edits exist — run `git status` first and ask what to include
- User only wanted a local commit without push
- User did not ask to push — stop after commit unless they said push

## Workflow

1. **Inspect**

```bash
git status
git diff          # unstaged
git diff --cached # staged
```

2. **Confirm scope** with the user if more than one logical change appears, or if untracked files are unrelated.

3. **Stage only intended paths** (examples):

```bash
git add path/to/changed-file.ts path/to/other/
# not: git add -A
```

4. **Commit** (conventional message if the repo uses it):

```bash
git commit -m "feat: short description of this change only"
```

5. **Push only if the user asked to push**:

```bash
git push -u origin "$(git branch --show-current)"
```

If the branch has no upstream, `-u` sets it; otherwise a plain `git push` is enough.

## Safety rules

- Never push to `main`/`master` unless the user explicitly requested that branch
- Never force-push unless the user explicitly requests it and understands the risk
- If hooks or CI failed locally, do not push until the user wants to proceed anyway
- Prefer showing the exact commands above over hiding them in a script

## Optional helper script

`scripts/smart_commit.sh` stages **all** changes and pushes — **do not use**
unless the user explicitly wants every modified file committed and pushed.
Prefer the manual steps in this skill.
