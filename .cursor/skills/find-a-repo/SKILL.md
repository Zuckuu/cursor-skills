---
name: find-a-repo
description: Use when the user describes an effect, library, or feature they want but has not named a GitHub repository — you search and recommend options, not copy code.
---

# Find a fitting reference repo

Help the user pick **one or two maintained GitHub repos** to **evaluate** — with URL, license, and why each fits. Stop at recommendation; **do not** clone, copy, port, merge, or hand off to a "copy smallest slice" step.

If a match exists in this pack, mention the corresponding skill for **npm-safe** integration only (`shader-gradient`, `react-three-fiber`, `liquid-glass`, `liquid-logo`).

## Steps

1. **Restate the ask** — Effect, framework (React, vanilla JS, Vue, mobile), constraints (SSR, no WebGL, commercial use).

2. **Search GitHub** (use `gh search repos`, GitHub web search, or web search with `site:github.com`):
   - Query = effect keywords + stack (e.g. `react three gradient stars language:TypeScript`)
   - Sort by **recently updated** or **stars**; open the top 5–10 candidates

3. **Filter each candidate**
   - **License:** MIT/Apache/BSD often OK for npm dependency use; flag PolyForm, BSL, NC licenses and explain impact
   - **Maintenance:** Commits or releases in the last ~12 months; README install steps plausible
   - **Scope:** Library or focused demo — not an awesome-list, course repo, or marketing funnel
   - **Stack:** Matches the user's project when possible

4. **Map to pack skills (when relevant)**
   - Moving 3D gradient → **`shader-gradient`** (npm)
   - General React 3D → **`react-three-fiber`** (npm)
   - Frosted glass UI → **`liquid-glass`** (see that skill — may be no npm)
   - Liquid metal logo aesthetic → **`liquid-logo`** (reference + license warning only)

5. **Present 1–2 winners**

```text
Recommendation:
1. <owner/repo> — <URL>
   License: <SPDX or name> — <one-line fit for user's use case>
   Why: <maintenance>, <stack match>, <implements the effect>
   Use via: <npm package name if any, or "no npm; see liquid-glass / liquid-logo skill">
2. (optional alternate)

Next: User can install via npm where available, or read upstream README/demo. I will not copy upstream source into this project.
```

6. **If nothing passes filters** — Say what failed (license, stale, wrong stack) and ask one clarifying question (framework or "npm-only ok?").

## Reject

- Abandoned repos (no commits >2 years, broken README)
- License forbids the user's stated use case
- "Install our CLI / join Discord to unlock" funnels
- Repos that are entire alternate products unrelated to the effect
- Recommending "copy the demo app" when an npm package exists — prefer **`npm i <package>`** and the matching pack skill

## After the user picks a repo

Load **`borrow-a-repo`** to summarize license and install path, or the relevant effect skill if they want to integrate via **npm only**. Do **not** copy or merge upstream files into the project.
