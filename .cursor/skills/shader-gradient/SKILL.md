---
name: shader-gradient
description: Use when the user wants a moving 3D gradient background in React (hero, landing page, Framer/Figma-adjacent workflows) via ShaderGradient.
---

# Shader Gradient (`@shadergradient/react`)

Animated 3D mesh gradients for React. Upstream: [ruucm/shadergradient](https://github.com/ruucm/shadergradient) (MIT). Customize visually at [shadergradient.co/customize](https://www.shadergradient.co/customize), then paste the query URL or props.

Also available as [Figma plugin](https://www.figma.com/community/plugin/1203016883447870818) and [Framer component URL](https://framer.com/m/ShaderGradient-oWuS.js) — use those when the deliverable is design-tool native, not app code.

## Install (React app)

```bash
npm i @shadergradient/react @react-three/fiber three three-stdlib camera-controls
npm i -D @types/three
```

**Version pairing (important):**

| Environment | React | @react-three/fiber | three |
|-------------|-------|-------------------|-------|
| Next 15 App Router | ^19 | ^9 | >=0.158 |
| Vite / Next Pages / most SPAs | ^18 or ^19 | 8.x or 9.x matching React | >=0.158 |

Next 15 App Router requires **R3F v9 + React 19** (R3F v8 breaks against App Router’s React 19).

## Minimal API (effect in two components)

```tsx
import { ShaderGradientCanvas, ShaderGradient } from '@shadergradient/react'

export function HeroBackground() {
  return (
    <ShaderGradientCanvas style={{ position: 'absolute', inset: 0 }} pixelDensity={1.5} fov={45}>
      <ShaderGradient cDistance={32} cPolarAngle={125} />
    </ShaderGradientCanvas>
  )
}
```

**Load a preset from the customize site:**

```tsx
<ShaderGradientCanvas>
  <ShaderGradient control="query" urlString="https://www.shadergradient.co/customize?animate=on&..." />
</ShaderGradientCanvas>
```

Props that most often change the look: `color1`–`color3`, `uSpeed`, `uStrength`, `uFrequency`, `type` (`plane` | `sphere` | `waterPlane`), `lightType`, `cDistance`, `cPolarAngle`, `animate` (`on` | `off`).

Controls/UI live in **`@shadergradient/ui`** (not always on npm as a full package) — for app work, drive **`ShaderGradient` props** or a customize URL; do not pull the whole monorepo.

## When not to use

- Non-React stack (use Vue package `@shadergradient/vue` from upstream docs, or pick another skill)
- Strict CSP with no WebGL / no client bundle
- You only need a static CSS gradient (use CSS; save WebGL cost)
- Legacy `shadergradient-old` v1 unless you explicitly depend on the old bundled store

## Integrating in the host project

Add npm deps only, one background component, client-only boundary in SSR apps (`'use client'` in Next). Do not copy the upstream monorepo or vend source from GitHub.
