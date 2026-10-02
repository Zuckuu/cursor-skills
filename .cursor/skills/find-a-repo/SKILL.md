---
name: find-a-repo
description: Use when the user describes an effect, library, or feature they want but has not named a GitHub repository to use as reference.
---

# Find a fitting reference repo

Help the user pick **one or two maintained GitHub repos** to study — then adapt the smallest piece using **`borrow-a-repo`** and the matching library skill if this pack includes it (`shader-gradient`, `liquid-logo`, `liquid-glass`, `react-three-fiber`).

**Do not** clone or copy a whole repository into the user’s project.

## Steps

1. **Restate the ask** — Effect, framework (React, vanilla JS, Vue, mobile), constraints (SSR, no WebGL, commercial use).

2. **Search GitHub** (use `gh search repos`, GitHub web search, or web search with `site:github.com`):
   - Query = effect keywords + stack (e.g. `react three gradient stars language:TypeScript`)
   - Sort by **recently updated** or **stars**; open the top 5–10 candidates

3. **Filter each candidate**
   - **License:** MIT/Apache/BSD usually OK for study + npm use; read custom licenses (PolyForm, BSL, “non-commercial”) and reject if incompatible
   - **Maintenance:** Commits or releases in the last ~12 months; README install steps work
   - **Scope:** Library or focused demo — not a 500-star “awesome list”, course repo, or marketing funnel
   - **Stack:** Matches the user’s project (React 18/19, R3F version, etc.)

4. **Prefer pack skills when they fit**
   - Moving 3D gradient background → **`shader-gradient`**
   - Liquid metal logo → **`liquid-logo`**
   - Frosted glass UI, no build step → **`liquid-glass`**
   - General React 3D → **`react-three-fiber`**

5. **Present 1–2 winners** to the user:

```text
Recommendation:
1. <owner/repo> — <URL>
   Why: <license>, <last activity>, <matches stack>, <implements the effect>
2. (optional alternate)

Next: I can open a disposable branch and port the smallest API using borrow-a-repo + <skill-name>.
```

6. **If nothing passes filters** — say what failed (license, stale, wrong stack) and ask one clarifying question (framework or “npm-only ok?”).

## Reject

- Abandoned repos (no commits >2 years, broken README)
- License forbids your use case
- “Install our CLI / join Discord to unlock” funnels
- Repos that are entire alternate products (TokPortal-style account farming, paid coaching shells)
- Copying monorepo demo apps when an npm package exists (`npm i` first)

## After the user picks a repo

Load **`borrow-a-repo`** and the relevant effect skill; implement the **smallest** integration on a branch; run build/tests before merge.
