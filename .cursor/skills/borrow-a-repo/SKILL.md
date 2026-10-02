---
name: borrow-a-repo
description: Use when the user names a GitHub repo or asks what a reference library does, whether its license fits their use, or how to install it via npm — not when they want its source copied into the project.
---

# Evaluate a reference repo (no copying)

When the user points at a GitHub repository, treat it as **documentation and licensing context**, not something to vend into their tree. Your job is to help them decide **if** and **how** they may use it legally and practically — then point at an install path or an in-pack effect skill.

**Do not** copy, port, merge, or cherry-pick files from the upstream repo into the user's project. **Do not** open disposable branches to transplant upstream code.

## Steps

1. **Restate the goal** — What effect or capability they want, and their stack (React, vanilla JS, commercial use, etc.).

2. **Read public metadata** — README, `LICENSE`, last commit/release date, npm package name if listed.

3. **License summary** — State the SPDX or license name, link to the repo LICENSE, and plain-language caveats (commercial OK?, modification OK?, competing-product clauses like PolyForm Shield). If the grant is unclear or restrictive for their stated use, say **stop** and suggest alternatives (`find-a-repo`, a different npm package, or legal review).

4. **Maintenance** — Note whether the repo looks actively maintained (~12 months) and whether install steps in the README still match reality.

5. **How to use it (allowed paths only)**
   - **npm (or yarn/pnpm)** — Give exact install and minimal usage from official docs; integrate only via declared dependencies in the host project.
   - **In-pack skill** — If this pack has a matching skill (`shader-gradient`, `react-three-fiber`, `liquid-glass`, `liquid-logo`, `find-a-repo`), load that skill for integration rules.
   - **No install path** — If upstream is source-only with no package and copying would be required, say that explicitly and **do not copy**. Offer: use the hosted demo, pick another library, or have the user clone upstream themselves outside this agent's file writes.

6. **Attribute in chat** — Name the repo URL, license, and what you recommended (npm install vs. "reference only").

## When this pack's effect skills apply

| User want | Skill |
|-----------|--------|
| Animated 3D gradient background | `shader-gradient` |
| React 3D scene | `react-three-fiber` |
| Frosted glass UI (vanilla JS) | `liquid-glass` |
| Liquid metal logo look | `liquid-logo` (license-limited; see that skill) |
| Unsure which repo | `find-a-repo` |

## Red flags (do not integrate by copying)

- Instructions to copy the whole repo, `vendor/`, or upstream JS/CSS/shader files into the project
- License incompatible with the user's stated use case
- Repo is a course, funnel, or unrelated product shell
- Effect requires a stack the project does not use — discuss cost; do not silently port code

## Workflow credit

Method inspired by **Cindy Zhu's** public reel guidance ([cindyzhu.com.au](https://cindyzhu.com.au), September 2026). Wording here is original; do not paste her site text.
