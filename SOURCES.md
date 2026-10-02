# Skill sources and licenses

Each row is one folder under `.cursor/skills/` with a `SKILL.md`. Upstream URLs point at the version this pack was derived from (October 2026). Where we changed wording (Cursor agent, paths, safety rules), the **workflow** intent is unchanged unless noted.

| Skill folder | Upstream source | License |
|--------------|-----------------|--------|
| `skill-creator` | [anthropics/skills — skill-creator](https://github.com/anthropics/skills/tree/main/skills/skill-creator) (rewritten for Cursor; Claude eval scripts removed) | Apache-2.0 (`LICENSE.txt`) |
| `frontend-design` | [anthropics/skills — frontend-design](https://github.com/anthropics/skills/tree/main/skills/frontend-design) | Apache-2.0 (`LICENSE.txt`) |
| `webapp-testing` | [anthropics/skills — webapp-testing](https://github.com/anthropics/skills/tree/main/skills/webapp-testing) | Apache-2.0 (`LICENSE.txt`) |
| `mcp-builder` | [anthropics/skills — mcp-builder](https://github.com/anthropics/skills/tree/main/skills/mcp-builder) | Apache-2.0 (`LICENSE.txt`) |
| `pdf` | [anthropics/skills — pdf](https://github.com/anthropics/skills/tree/main/skills/pdf) | Anthropic proprietary / source-available (`LICENSE.txt`) |
| `docx` | [anthropics/skills — docx](https://github.com/anthropics/skills/tree/main/skills/docx) | Anthropic proprietary / source-available (`LICENSE.txt`) |
| `pptx` | [anthropics/skills — pptx](https://github.com/anthropics/skills/tree/main/skills/pptx) | Anthropic proprietary / source-available (`LICENSE.txt`) |
| `xlsx` | [anthropics/skills — xlsx](https://github.com/anthropics/skills/tree/main/skills/xlsx) | Anthropic proprietary / source-available (`LICENSE.txt`) |
| `doc-coauthoring` | [anthropics/skills — doc-coauthoring](https://github.com/anthropics/skills/tree/main/skills/doc-coauthoring) | See upstream repo |
| `shared-ooxml` | Same OOXML tree as anthropic document skills (deduplicated) | Same as docx/pptx/xlsx validators |
| `test-driven-development` | [obra/superpowers — test-driven-development](https://github.com/obra/superpowers/tree/main/skills/test-driven-development) | MIT (`LICENSE.txt`) |
| `systematic-debugging` | [obra/superpowers — systematic-debugging](https://github.com/obra/superpowers/tree/main/skills/systematic-debugging) | MIT (`LICENSE.txt`) |
| `requesting-code-review` | [obra/superpowers — requesting-code-review](https://github.com/obra/superpowers/tree/main/skills/requesting-code-review) | MIT (`LICENSE.txt`) |
| `receiving-code-review` | [obra/superpowers — receiving-code-review](https://github.com/obra/superpowers/tree/main/skills/receiving-code-review) | MIT (`LICENSE.txt`) |
| `finishing-a-development-branch` | [obra/superpowers — finishing-a-development-branch](https://github.com/obra/superpowers/tree/main/skills/finishing-a-development-branch) | MIT (`LICENSE.txt`) |
| `using-git-worktrees` | [obra/superpowers — using-git-worktrees](https://github.com/obra/superpowers/tree/main/skills/using-git-worktrees) | MIT (`LICENSE.txt`) |
| `brainstorming` | [obra/superpowers — brainstorming](https://github.com/obra/superpowers/tree/main/skills/brainstorming) | MIT (`LICENSE.txt`) |
| `writing-plans` | [obra/superpowers — writing-plans](https://github.com/obra/superpowers/tree/main/skills/writing-plans) | MIT (`LICENSE.txt`) |
| `executing-plans` | [obra/superpowers — executing-plans](https://github.com/obra/superpowers/tree/main/skills/executing-plans) | MIT (`LICENSE.txt`) |
| `subagent-driven-development` | [obra/superpowers — subagent-driven-development](https://github.com/obra/superpowers/tree/main/skills/subagent-driven-development) | MIT (`LICENSE.txt`) |
| `dispatching-parallel-agents` | [obra/superpowers — dispatching-parallel-agents](https://github.com/obra/superpowers/tree/main/skills/dispatching-parallel-agents) | MIT (`LICENSE.txt`) |
| `git-pushing` | [mhattingpete/claude-skills-marketplace — git-pushing](https://github.com/mhattingpete/claude-skills-marketplace/tree/main/engineering-workflow-plugin/skills/git-pushing) (rewritten for explicit staging/push) | Apache-2.0 (`LICENSE.txt`) |
| `test-fixing` | [mhattingpete/claude-skills-marketplace — test-fixing](https://github.com/mhattingpete/claude-skills-marketplace/tree/main/engineering-workflow-plugin/skills/test-fixing) | Apache-2.0 (`LICENSE.txt`) |
| `review-implementing` | [mhattingpete/claude-skills-marketplace — review-implementing](https://github.com/mhattingpete/claude-skills-marketplace/tree/main/engineering-workflow-plugin/skills/review-implementing) | Apache-2.0 (`LICENSE.txt`) |
| `security-best-practices` | [openai/skills — security-best-practices](https://github.com/openai/skills/tree/main/skills/.curated/security-best-practices) | Apache-2.0 (`LICENSE.txt`; `agents/openai.yaml` removed — not used by Cursor) |
| `short-form-video` | [iart-ai/tiktok-video-skills — short-form-video](https://github.com/iart-ai/tiktok-video-skills/tree/main/skills/short-form-video) | MIT (`LICENSE.txt`) |
| `caption-animation` | [iart-ai/tiktok-video-skills — caption-animation](https://github.com/iart-ai/tiktok-video-skills/tree/main/skills/caption-animation) | MIT (`LICENSE.txt`) |
| `bulletproof-payment-gateway` | **Original to this pack** | MIT ([LICENSE](LICENSE)) |
| `production-ai-engineering` | **Original to this pack** | MIT ([LICENSE](LICENSE)) |
| `token-budget` | **Original to this pack** | MIT ([LICENSE](LICENSE)) |
| `borrow-a-repo` | **Original to this pack** (evaluate upstream repos: license summary, npm path; no copying source into projects) | MIT ([LICENSE](LICENSE)) |
| `find-a-repo` | **Original to this pack** | MIT ([LICENSE](LICENSE)) |
| `shader-gradient` | How-to derived from [ruucm/shadergradient](https://github.com/ruucm/shadergradient) README/npm (`@shadergradient/react`); **MIT** upstream | MIT ([LICENSE](LICENSE)) for skill text |
| `liquid-logo` | Reference summary of [paper-design/liquid-logo](https://github.com/paper-design/liquid-logo) effect; upstream **PolyForm Shield 1.0.0** (not MIT/Apache) — agent must not copy upstream code | MIT ([LICENSE](LICENSE)) for skill text only |
| `liquid-glass` | Reference summary of [dashersw/liquid-glass-js](https://github.com/dashersw/liquid-glass-js); upstream **MIT** but no npm package — agent must not copy upstream JS/CSS into projects | MIT ([LICENSE](LICENSE)) for skill text |
| `react-three-fiber` | How-to derived from [pmndrs/react-three-fiber](https://github.com/pmndrs/react-three-fiber) readme/npm; upstream **MIT** | MIT ([LICENSE](LICENSE)) for skill text |

## Removed from this pack (vs earlier snapshots)

| Former skill | Reason |
|--------------|--------|
| `internal-comms` | Anthropic-specific comms templates / product flow — not portable |
| `web-artifacts-builder` | claude.ai HTML artifact workflow — not Cursor-shaped |

## Index repos used for curation (not copied wholesale)

- [ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) — Apache-2.0
- [VoltAgent/awesome-agent-skills](https://github.com/VoltAgent/awesome-agent-skills) — link index

## Skills intentionally omitted

- Anthropic **brand-guidelines** and pure art/toy skills
- Vendor-CLI-only skills (CodeRabbit CLI, Composio `connect-apps`, etc.)
- Marketing / course-funnel skills
- **obra/superpowers** `using-superpowers`, `verification-before-completion` (not shipped; verification inlined in `systematic-debugging` / `executing-plans`)
- **iart-ai/tiktok-video-skills** `countdown-video`, `lower-thirds`

## Anthropic document skills notice

The `pdf`, `docx`, `pptx`, and `xlsx` skills are **source-available** reference implementations. Redistribution is subject to each skill’s `LICENSE.txt`. Read before commercial use.
