---
name: liquid-glass
description: Use when the user wants Apple-style frosted liquid glass UI (refraction, blur, nested glass) in vanilla JavaScript without a React build step.
---

# Liquid Glass JS

Upstream: [dashersw/liquid-glass-js](https://github.com/dashersw/liquid-glass-js) (**MIT**). Demo: [dashersw.github.io/liquid-glass-js](https://dashersw.github.io/liquid-glass-js/).

WebGL-based **`Container`** and **`Button`** classes — no bundler required. Depends on **html2canvas** for sampling page content behind glass (load from CDN).

## Quick setup (static HTML)

```html
<link rel="stylesheet" href="styles.css" />
<link rel="stylesheet" href="glass.css" />
<script src="https://cdn.jsdelivr.net/npm/html2canvas@1.4.1/dist/html2canvas.min.js"></script>
<script src="container.js"></script>
<script src="button.js"></script>
```

Copy **`container.js`**, **`button.js`**, **`glass.css`**, and **`styles.css`** from the repo release/tag you audited (only these files — not the whole repo). Or serve them from your static assets folder.

## Minimal API

**Glass button:**

```javascript
const button = new Button({
  text: 'Save',
  size: 28,
  type: 'pill', // 'rounded' | 'circle' | 'pill'
  tintOpacity: 0.3,
  onClick: () => { /* ... */ },
})
document.body.appendChild(button.element)
```

**Nested glass container:**

```javascript
const container = new Container({
  borderRadius: 24,
  type: 'pill',
  tintOpacity: 0.3,
})
container.addChild(someButtonInstance)
document.body.appendChild(container.element)
```

**Container options:** `borderRadius`, `type` (`rounded` | `circle` | `pill`), `tintOpacity` (0–1).  
**Button adds:** `text`, `size` (font px), `onClick`, optional `warp` (center distortion).

Live demo uses **`controls.js`** to tweak edge/rim/blur parameters — optional; start with defaults.

## When not to use

- React/Vue SPA where a component library fits better (unless you wrap these classes in a thin adapter)
- No WebGL (very old browsers)
- Strict CSP blocking inline WebGL or html2canvas
- Accessibility-critical controls where custom WebGL buttons replace native `<button>` without a fallback plan
- Performance-sensitive pages with many glass instances on low-end mobile

## Integration

Use **`borrow-a-repo`**: copy only the JS/CSS listed above into `public/` or static assets; wire one page section; verify in target browsers. Do not vendor `demo.gif` or the full repo.
