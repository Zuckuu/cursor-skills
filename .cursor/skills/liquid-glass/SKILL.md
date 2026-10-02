---
name: liquid-glass
description: Use when the user wants Apple-style frosted liquid glass UI (refraction, blur, nested glass) and you need to explain dashersw/liquid-glass-js — not copy its source into their project.
---

# Liquid Glass JS (reference)

Upstream: [dashersw/liquid-glass-js](https://github.com/dashersw/liquid-glass-js) (**MIT**). Demo: [dashersw.github.io/liquid-glass-js](https://dashersw.github.io/liquid-glass-js/).

WebGL-based **`Container`** and **`Button`** classes for vanilla JavaScript — no React required. The demo uses **html2canvas** to sample page content behind the glass (typically loaded from a CDN in upstream examples).

## Install path

There is **no official npm package** for this library in the upstream README. Upstream distribution is **source files in the GitHub repo** (`container.js`, `button.js`, `glass.css`, `styles.css`, plus optional `controls.js` for the demo).

**Do not copy those files into the user's project.** If the user needs this exact effect without vendoring upstream source themselves, options are:

- Use the **[live demo](https://dashersw.github.io/liquid-glass-js/)** as reference and build a similar effect with their stack, or
- Pick a **maintained npm alternative** (frosted glass via CSS `backdrop-filter`, a WebGL UI library, or React component libraries) via **`find-a-repo`**, or
- Have the user **manually** download upstream files outside agent-driven copying — this skill does not instruct the agent to write upstream JS/CSS into the repo.

## What the API looks like (for evaluation only)

Summarized from upstream docs so the user knows what they're evaluating:

**Glass button:** `new Button({ text, size, type: 'pill'|'rounded'|'circle', tintOpacity, onClick })` → append `button.element`.

**Nested container:** `new Container({ borderRadius, type, tintOpacity })`, `addChild(buttonInstance)`, append `container.element`.

**Container options:** `borderRadius`, `type`, `tintOpacity` (0–1). **Button adds:** `text`, `size`, `onClick`, optional `warp`.

## When not to use

- React/Vue SPA where a component library or CSS glass is enough
- No WebGL (very old browsers)
- Strict CSP blocking WebGL or html2canvas
- Accessibility-critical controls where custom WebGL replaces native `<button>` without a fallback
- Many glass instances on low-end mobile (performance)

## Integration in this pack

Use **`borrow-a-repo`** to confirm MIT fits the user's use case and explain that integration is **npm/alternatives or user-managed upstream download** — not agent file copy from [dashersw/liquid-glass-js](https://github.com/dashersw/liquid-glass-js).
