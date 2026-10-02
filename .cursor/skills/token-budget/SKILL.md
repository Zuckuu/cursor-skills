---
name: token-budget
description: Use when adding or curating Agent Skills, always-on rules, or AGENTS.md so context cost stays predictable and skills trigger correctly.
---

# Token budget for skills and rules

Skills are progressive disclosure: cheap metadata up front, expensive instructions only when relevant. Rules and AGENTS.md are not — they tend to load on **every** message. Optimize the catalog before writing another paragraph of prompt.

## How loading works

- **Every installed skill** exposes its `name` and `description` to the agent on **every turn**, before the user’s new message is handled.
- In a measured case, **117 skills** cost on the order of **~7,300 tokens** of context **before any user text** — descriptions add up linearly.
- The full **`SKILL.md` body** loads only when the agent decides the skill is relevant.
- Files under **`scripts/`** are meant to be **executed**, not read into context. Put long prose in **`references/`** and link from a short `SKILL.md` so detail loads on demand.

## Curate the catalog

1. **Prefer a short list.** Install only skills you will actually use in that repo (or copy folders à la carte from a pack).
2. **One sentence per description** that states **when** to use the skill — not what it is in the abstract.
3. **Avoid overlap.** Two skills with similar descriptions cause wrong triggering; a mistaken activation costs more than the extra frontmatter bytes (wrong body + rework).
4. **Before adding a skill**, search existing skills in `.cursor/skills/` (and user-level `~/.cursor/skills/`) for duplicate intent. Merge or narrow instead of duplicating.
5. **Keep `SKILL.md` short** (spec recommends staying well under ~500 lines). Move checklists, examples, and API dumps to `references/`.

## Cursor-specific knobs

- **Path globs:** For skills that apply only in part of a repo, use nested `.cursor/skills/` under that subtree (monorepo scoping) or document path constraints in the description so the agent does not apply them globally.
- **`disable-model-invocation: true`** (when supported): Use for rare, destructive, or compliance-sensitive flows so the skill runs only when the user explicitly invokes it (e.g. `/skill-name`), not from automatic matching.
- **Do not put long standing instructions in always-on project rules or `AGENTS.md`.** Those tokens are paid every message. A skill is the cheaper place for specialized workflows.

## Rules vs skills (cost mental model)

| Mechanism | Typical cost | Best for |
|-----------|--------------|----------|
| Skill description | Every turn (all skills) | Specialized workflows, optional domains |
| Skill body | When triggered | Steps, checklists, edge cases |
| Project rules / AGENTS.md | Every turn | Short, non-negotiable guardrails only |

## Checklist before shipping a new skill

- [ ] Description starts with or clearly includes **“Use when …”**
- [ ] No duplicate of an existing skill in this pack
- [ ] Long content moved to `references/`; scripts stay in `scripts/`
- [ ] User-level install considered: global skills tax **all** repos on that machine
