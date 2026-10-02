---
name: skill-creator
description: Use when creating or editing a Cursor Agent Skill (a folder with SKILL.md) so frontmatter, naming, and structure match the Agent Skills spec and stay cheap to load.
license: Complete terms in LICENSE.txt
---

# Create or update a Cursor skill

A skill is a directory with a **`SKILL.md`** file. Cursor loads every skill’s **`name`** and **`description`** on each turn; the markdown body loads only when the skill is relevant. Keep descriptions short and specific about **when** to use the skill.

## When to use this skill

- User asks to add a skill, author a skill, or improve skill triggering
- You are splitting a long rule into an on-demand skill (see also `token-budget`)
- You need to validate frontmatter before committing `.cursor/skills/`

## Create a new skill

1. **Pick a folder name** — lowercase, hyphens only; must match frontmatter `name` (max 64 chars).
2. **Create** `.cursor/skills/<name>/SKILL.md` with YAML frontmatter:

```markdown
---
name: my-skill
description: Use when [specific situation the user or task matches].
---

# My skill title

Steps for the agent when this skill is active…
```

3. **Description rules**
   - One sentence; lead with **“Use when …”**
   - Include concrete triggers (file types, user phrases, task types)
   - Do not duplicate another skill already in `.cursor/skills/` (search names/descriptions first)
4. **Body rules**
   - Keep `SKILL.md` focused (under ~200 lines when possible)
   - Put long references in `references/`; runnable helpers in `scripts/` (execute scripts, do not paste them into chat)
5. **Optional layout**

```text
my-skill/
├── SKILL.md
├── references/   # loaded on demand
└── scripts/      # executed, not read into context
```

## Edit an existing skill

- Change behavior in the **body**; change **when it triggers** in the **description** only
- If two skills overlap, narrow descriptions or merge folders — overlapping descriptions waste tokens and misfire

## Validate locally

From the repo root (requires Python 3 + PyYAML):

```bash
python .cursor/skills/skill-creator/scripts/quick_validate.py .cursor/skills/my-skill
```

Fix any reported frontmatter or naming errors before committing.

## Package for sharing (optional)

Zip a skill folder for handoff (excludes caches):

```bash
python .cursor/skills/skill-creator/scripts/package_skill.py .cursor/skills/my-skill ./dist
```

## Install location

- **Project:** commit under `.cursor/skills/` (or `.agents/skills/`)
- **User-wide:** copy only skills you need into `~/.cursor/skills/` — every description loads on every chat

## Checklist before finish

- [ ] `name` matches directory name
- [ ] `description` starts with or clearly states **Use when**
- [ ] No duplicate of an existing skill in this pack
- [ ] No vendor-specific CLI requirements unless the user has that tool
- [ ] Long content moved to `references/`
