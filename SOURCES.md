# Skill sources and licenses

Each row is one folder under `.cursor/skills/`. Upstream URLs point at the version this pack was derived from (October 2026). Where we changed wording (Claude → Cursor agent, paths, subagent instructions), the **workflow** is unchanged; see git history.

| Skill folder | Upstream source | License |
|--------------|-----------------|--------|
| `skill-creator` | [anthropics/skills — skill-creator](https://github.com/anthropics/skills/tree/main/skills/skill-creator) | Apache-2.0 (`LICENSE.txt`) |
| `frontend-design` | [anthropics/skills — frontend-design](https://github.com/anthropics/skills/tree/main/skills/frontend-design) | Apache-2.0 (`LICENSE.txt`) |
| `webapp-testing` | [anthropics/skills — webapp-testing](https://github.com/anthropics/skills/tree/main/skills/webapp-testing) | Apache-2.0 (`LICENSE.txt`) |
| `mcp-builder` | [anthropics/skills — mcp-builder](https://github.com/anthropics/skills/tree/main/skills/mcp-builder) | Apache-2.0 (`LICENSE.txt`) |
| `pdf` | [anthropics/skills — pdf](https://github.com/anthropics/skills/tree/main/skills/pdf) | Anthropic proprietary / source-available (`LICENSE.txt`; see restrictions) |
| `docx` | [anthropics/skills — docx](https://github.com/anthropics/skills/tree/main/skills/docx) | Anthropic proprietary / source-available (`LICENSE.txt`) |
| `pptx` | [anthropics/skills — pptx](https://github.com/anthropics/skills/tree/main/skills/pptx) | Anthropic proprietary / source-available (`LICENSE.txt`) |
| `xlsx` | [anthropics/skills — xlsx](https://github.com/anthropics/skills/tree/main/skills/xlsx) | Anthropic proprietary / source-available (`LICENSE.txt`) |
| `doc-coauthoring` | [anthropics/skills — doc-coauthoring](https://github.com/anthropics/skills/tree/main/skills/doc-coauthoring) | See upstream repo (no separate `LICENSE.txt` in skill folder) |
| `web-artifacts-builder` | [anthropics/skills — web-artifacts-builder](https://github.com/anthropics/skills/tree/main/skills/web-artifacts-builder) | Apache-2.0 (`LICENSE.txt`) |
| `internal-comms` | [anthropics/skills — internal-comms](https://github.com/anthropics/skills/tree/main/skills/internal-comms) | Apache-2.0 (`LICENSE.txt`) |
| `test-driven-development` | [obra/superpowers — test-driven-development](https://github.com/obra/superpowers/tree/main/skills/test-driven-development) | MIT (`LICENSE.txt`) |
| `systematic-debugging` | [obra/superpowers — systematic-debugging](https://github.com/obra/superpowers/tree/main/skills/systematic-debugging) | MIT (`LICENSE.txt`) |
| `requesting-code-review` | [obra/superpowers — requesting-code-review](https://github.com/obra/superpowers/tree/main/skills/requesting-code-review) | MIT (`LICENSE.txt`; includes `code-reviewer.md`) |
| `receiving-code-review` | [obra/superpowers — receiving-code-review](https://github.com/obra/superpowers/tree/main/skills/receiving-code-review) | MIT (`LICENSE.txt`) |
| `finishing-a-development-branch` | [obra/superpowers — finishing-a-development-branch](https://github.com/obra/superpowers/tree/main/skills/finishing-a-development-branch) | MIT (`LICENSE.txt`) |
| `using-git-worktrees` | [obra/superpowers — using-git-worktrees](https://github.com/obra/superpowers/tree/main/skills/using-git-worktrees) | MIT (`LICENSE.txt`) |
| `brainstorming` | [obra/superpowers — brainstorming](https://github.com/obra/superpowers/tree/main/skills/brainstorming) | MIT (`LICENSE.txt`) |
| `writing-plans` | [obra/superpowers — writing-plans](https://github.com/obra/superpowers/tree/main/skills/writing-plans) | MIT (`LICENSE.txt`) |
| `executing-plans` | [obra/superpowers — executing-plans](https://github.com/obra/superpowers/tree/main/skills/executing-plans) | MIT (`LICENSE.txt`) |
| `subagent-driven-development` | [obra/superpowers — subagent-driven-development](https://github.com/obra/superpowers/tree/main/skills/subagent-driven-development) | MIT (`LICENSE.txt`; includes prompt templates) |
| `dispatching-parallel-agents` | [obra/superpowers — dispatching-parallel-agents](https://github.com/obra/superpowers/tree/main/skills/dispatching-parallel-agents) | MIT (`LICENSE.txt`) |
| `short-form-video` | [iart-ai/tiktok-video-skills — short-form-video](https://github.com/iart-ai/tiktok-video-skills/tree/main/skills/short-form-video) | MIT (`LICENSE.txt`; repo `LICENSE`) |
| `caption-animation` | [iart-ai/tiktok-video-skills — caption-animation](https://github.com/iart-ai/tiktok-video-skills/tree/main/skills/caption-animation) | MIT (`LICENSE.txt`; repo `LICENSE`) |
| `git-pushing` | [mhattingpete/claude-skills-marketplace — git-pushing](https://github.com/mhattingpete/claude-skills-marketplace/tree/main/engineering-workflow-plugin/skills/git-pushing) | Apache-2.0 (repo `LICENSE`; copied as `LICENSE.txt`) |
| `test-fixing` | [mhattingpete/claude-skills-marketplace — test-fixing](https://github.com/mhattingpete/claude-skills-marketplace/tree/main/engineering-workflow-plugin/skills/test-fixing) | Apache-2.0 (repo `LICENSE`) |
| `review-implementing` | [mhattingpete/claude-skills-marketplace — review-implementing](https://github.com/mhattingpete/claude-skills-marketplace/tree/main/engineering-workflow-plugin/skills/review-implementing) | Apache-2.0 (repo `LICENSE`) |
| `security-best-practices` | [openai/skills — security-best-practices](https://github.com/openai/skills/tree/main/skills/.curated/security-best-practices) | Apache-2.0 (`LICENSE.txt`; includes `references/`) |
| `bulletproof-payment-gateway` | **Original to this pack** | MIT ([LICENSE](LICENSE)) |
| `production-ai-engineering` | **Original to this pack** | MIT ([LICENSE](LICENSE)) |
| `token-budget` | **Original to this pack** | MIT ([LICENSE](LICENSE)) |

## Index repos used for curation (not copied wholesale)

- [ComposioHQ/awesome-claude-skills](https://github.com/ComposioHQ/awesome-claude-skills) — Apache-2.0 (index + some bundled examples; we did not vendor Composio app-automation or paid-funnel skills).
- [VoltAgent/awesome-agent-skills](https://github.com/VoltAgent/awesome-agent-skills) — curated links only (README); individual skills fetched from their upstream repos above.

## Skills intentionally omitted

- Anthropic **brand-guidelines** and pure art/toy skills (algorithmic-art, canvas-design, slack-gif-creator, theme-factory, etc.).
- Vendor-CLI-only skills (e.g. CodeRabbit CLI, Composio `connect-apps`) unless you install those tools separately.
- Bulk marketing / course-funnel skills from awesome lists.
- **obra/superpowers** `using-superpowers` (meta skill oriented at the Superpowers plugin workflow; use `token-budget` + per-skill descriptions instead).
- **iart-ai/tiktok-video-skills** `countdown-video` and `lower-thirds` (not included in this pack).

## Anthropic document skills notice

The `pdf`, `docx`, `pptx`, and `xlsx` skills are **source-available** reference implementations. Redistribution is subject to Anthropic’s skill `LICENSE.txt` (no competing service, attribution, etc.). Read each file before use in a commercial product.
