---
name: borrow-a-repo
description: Use when the user points at a GitHub repo, a visual effect, or a library and wants that behavior in their own project.
---

# Borrow a repo (method only)

A repository is **reference**, not a dependency to drop in whole. Use the **library-specific skills** in this pack (`shader-gradient`, `liquid-logo`, `liquid-glass`, `react-three-fiber`) when they match; otherwise apply this method.

## Before adapting

1. **License** — Read the repo `LICENSE`. Stop if the grant does not cover your use (commercial, modification, SaaS, competing product).
2. **Maintenance** — Prefer repos with commits in the last ~12 months and README that matches current install steps.
3. **Stack fit** — Match React vs vanilla JS, SSR, bundler, and design-tool plugins to the host project.

## How to integrate

1. **Smallest effect** — One component, one shader, one API surface — not the demo site, docs, or monorepo apps folder.
2. **Disposable branch** — Port on a throwaway branch; do not merge until the host app builds cleanly.
3. **Port, don’t vendor** — Add normal npm dependencies where they exist; re-type adapted code into project conventions. Do not commit upstream trees, `node_modules`, or unused assets.
4. **Prove** — Run build/tests; confirm no bulk copy of unrelated upstream files.
5. **Attribute** — Name source repo, license, and what was adapted (PR, `NOTICES`, or comment).

## Workflow credit

Method inspired by **Cindy Zhu’s** public reel guidance ([cindyzhu.com.au](https://cindyzhu.com.au), September 2026). Wording here is original; do not paste her site text.

## Red flags

- “Copy the whole repo into `vendor/`” without a scoped goal
- License incompatible with your product
- Effect needs a stack the project does not use (discuss cost first)
- Repo is mostly marketing, courses, or account-farming tooling
