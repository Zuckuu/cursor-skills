---
name: borrow-a-repo
description: Use when the user points at a GitHub repo, a visual effect, or a library and wants that behavior in their own project.
---

# Borrow a repo (reference, not vendoring)

A public repository is **reference code** — a pattern to study and reimplement in your stack — not a dependency to copy wholesale into the product tree.

## Before you adapt anything

1. **License** — Read `LICENSE` (or the repo’s license file). Confirm commercial use, attribution, and modification are allowed for your use case. If unclear, stop and tell the user.
2. **Maintenance** — Skim recent commits, open issues, and whether the README matches current APIs. Avoid building on abandoned experiments unless the user accepts that risk.
3. **Stack fit** — Match framework and runtime to the target project (React vs vanilla JS, build tool, SSR, mobile, design-tool plugins). Do not force a React Three Fiber pattern into a static site without an explicit decision.

## How to work

1. **Isolate the smallest unit** — One effect, one component, one shader pass — not the whole monorepo, docs site, or example gallery.
2. **Disposable branch** — Do exploration and porting on a branch meant for throwaway tries; keep `main` clean until the integration is proven.
3. **Port, don’t paste** — Re-type or minimally adapt the logic into your project’s conventions (paths, naming, types, tests). Do not commit upstream `node_modules`, vendored forks, or unused demo assets.
4. **Prove it** — Build/run the host app; add or run a focused test or manual check for the effect. **Do not merge** until the project builds and no unused upstream tree was copied in.
5. **Attribute** — In code comments, PR description, or `NOTICES` as appropriate: name the source repo, license, and what was adapted.

## Example reference repos (what each is for)

| Repo | Good for |
|------|----------|
| [ruucm/shadergradient](https://github.com/ruucm/shadergradient) | Moving 3D gradient backgrounds; React plus Framer and Figma plugin ecosystem |
| [paper-design/liquid-logo](https://github.com/paper-design/liquid-logo) | Logo → animated “liquid metal” treatment (see also [liquid.paper.design](https://liquid.paper.design) for the demo) |
| [dashersw/liquid-glass-js](https://github.com/dashersw/liquid-glass-js) | Apple-style frosted glass UI; vanilla JS, no build step |
| [pmndrs/react-three-fiber](https://github.com/pmndrs/react-three-fiber) | Interactive 3D scenes as React components (Three.js via R3F) |

Use these as starting points when the user names an effect similar to the above — still apply license, maintenance, and stack checks before porting.

## Attribution for this workflow

Method inspired by **Cindy Zhu’s** public reel guidance ([cindyzhu.com.au](https://cindyzhu.com.au), September 2026). This skill does not reproduce her page text; follow her themes (reference repos, minimal port, verify before ship) in your own words when explaining steps to the user.

## Red flags — stop and clarify

- User asked to “copy the whole repo” into `vendor/` or submodule without a scoped feature goal
- License is non-commercial, SSPL, or “all rights reserved” with no grant
- Effect requires a stack the project does not use and migration cost was not discussed
- Upstream repo is mostly marketing site, course funnel, or account-farming tooling
