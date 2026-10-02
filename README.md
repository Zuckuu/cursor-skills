# Portable Cursor Agent Skills pack

**Token cost:** Installing this entire pack into `~/.cursor/skills/` puts **every skill’s description** into **every** chat on that machine. Copy only the skill folders you will actually use, or install per-repo under `.cursor/skills/`, instead of dropping all **36** skills globally.

Drop-in **Agent Skills** for Cursor: each skill is a folder under `.cursor/skills/<skill-name>/` with a `SKILL.md` (YAML frontmatter + markdown instructions). Cursor loads skill **names and descriptions** at startup; when a task matches a description, the agent reads that skill’s full body.

This repo’s main deliverable is the [`.cursor/skills/`](.cursor/skills/) tree. See [SOURCES.md](SOURCES.md) for upstream attribution and licenses.

## Install in any project

Pick one approach:

### Option A — Copy (best for teams)

1. Clone or download this repository.
2. Copy the whole skills tree into your project:

   ```bash
   cp -R /path/to/this-repo/.cursor/skills /path/to/your-project/.cursor/skills
   ```

   Document skills (`docx`, `pptx`, `xlsx`) symlink `scripts/office` to [`shared-ooxml/`](.cursor/skills/shared-ooxml/) — keep that folder when copying those skills.

   If your project already has `.cursor/skills/`, copy individual skill **folders** instead of overwriting the entire directory.

3. Commit `.cursor/skills/` so everyone (and Cloud Agents) get the same skills from git.

### Option B — Symlink (best for one machine, many repos)

From your project root:

```bash
mkdir -p .cursor
ln -s /absolute/path/to/this-repo/.cursor/skills .cursor/skills
```

Use an **absolute** path so the symlink survives editor and agent cwd changes. Committing symlinks works on Unix; Windows contributors may prefer Option A or a junction they create locally.

### Option C — User-level (all repos on one machine)

Cursor also discovers **global** skills on your machine:

| Location | Scope |
|----------|--------|
| `~/.cursor/skills/` | User-level (global) |
| `~/.agents/skills/` | User-level (global) |

Copy or symlink this pack’s `.cursor/skills/*` into one of those directories if you want the same skills in **every** repo without per-project copies.

Per [Cursor’s Agent Skills docs](https://cursor.com/docs/skills), **only `~/.cursor/skills/` is synced for Cloud Agents**; project skills from the repo are used in cloud runs when committed. User-level `~/.agents/skills/` and other local-only paths stay on your machine unless you bake them into a custom environment.

## Where Cursor looks (project + global)

Documented discovery paths ([Agent Skills reference](https://cursor.com/docs/skills), [Skills help](https://cursor.com/help/customization/skills)):

| Path | Scope |
|------|--------|
| `.cursor/skills/` | Project |
| `.agents/skills/` | Project |
| `~/.cursor/skills/` | User (global) |
| `~/.agents/skills/` | User (global) |

For compatibility, Cursor also loads `.claude/skills/`, `.codex/skills/`, and the same under `~/`.

**Nested repos:** a `.cursor/skills/` folder anywhere under the repository is discovered (for example `apps/web/.cursor/skills/` in a monorepo). Skills in a nested folder can be scoped to files under that subdirectory.

**Category folders:** you may group skills as `.cursor/skills/category/my-skill/SKILL.md`; Cursor walks the tree recursively. The skill **name** comes from the folder that directly contains `SKILL.md`.

**Viewing loaded skills:** open **Customize** in the sidebar → **Skills** (installed project, user, and plugin skills appear there).

Skills are **not** imported by pasting a GitHub URL alone; for marketplace-style distribution you package skills in a [Cursor plugin](https://cursor.com/docs/plugins). For most teams, committing `.cursor/skills/` is enough.

## What’s in this pack (36 skills)

- **Anthropic official examples** (documents, MCP, testing, frontend design) — adapted for Cursor where noted; shared OOXML tooling under `shared-ooxml/`.
- **Skill authoring:** `skill-creator` (Cursor-focused), `token-budget` (context cost).
- **Reference-repo workflow:** `borrow-a-repo`, `find-a-repo`, plus effect guides `shader-gradient`, `liquid-logo`, `liquid-glass`, `react-three-fiber` (how-to only — no upstream source vendored).
- **Superpowers workflow** (brainstorming, plans, execution, subagents, parallel dispatch, TDD, debugging, code review, git worktrees) from [obra/superpowers](https://github.com/obra/superpowers).
- **Curated engineering skills** (git push hygiene, test fixing, security review) from community repos listed in SOURCES.md.
- **Short-form video** (TikTok/Reels/Shorts retention + caption animation) from [iart-ai/tiktok-video-skills](https://github.com/iart-ai/tiktok-video-skills).
- **Original:** `bulletproof-payment-gateway`, `production-ai-engineering`, `token-budget`, `borrow-a-repo`, `find-a-repo`, `legal-compliance`, and the four effect guide skills (derived from public READMEs/APIs; see SOURCES.md).

## Format

Skills follow the [Agent Skills specification](https://agentskills.io/specification): required frontmatter `name` (matches folder name) and `description` (must say **when** to use the skill). Optional `scripts/`, `references/`, and `assets/` subfolders are supported.

## License

Original skills in this pack (`bulletproof-payment-gateway`, `production-ai-engineering`, `token-budget`, `borrow-a-repo`, `find-a-repo`, `legal-compliance`, `shader-gradient`, `liquid-logo`, `liquid-glass`, `react-three-fiber`) are MIT — see [LICENSE](LICENSE). Effect guides summarize upstream projects; upstream licenses still apply to their code when you install or port from them. Upstream skills retain their own licenses; see [SOURCES.md](SOURCES.md) and each skill’s `LICENSE.txt` where present.
