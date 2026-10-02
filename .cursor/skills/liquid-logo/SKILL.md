---
name: liquid-logo
description: Use when the user wants a logo or mark to look like animated liquid metal (WebGL refraction stripes) similar to liquid.paper.design.
---

# Liquid metal logo (Paper demo pattern)

Upstream demo app: [paper-design/liquid-logo](https://github.com/paper-design/liquid-logo) (**PolyForm Shield 1.0.0** — read [LICENSE](https://github.com/paper-design/liquid-logo/blob/main/LICENSE) before commercial use; restrictions include competing products/services). Live reference: [liquid.paper.design](https://liquid.paper.design).

The repo is a **Next.js 15 + React 19** WebGL2 demo, not a single npm import. The effect is: rasterize the logo to **`ImageData`**, upload as a texture, run a **fragment shader** with tunable uniforms. Do **not** copy the whole repo — port the smallest slice on a branch (`borrow-a-repo`).

## Stack in the reference app

- React 19, Next 15, WebGL2 (`canvas.getContext('webgl2')`)
- Logo → `ImageData` via `parseLogoImage` (PNG/SVG; transparent or white background works best)
- **`Canvas`** component drives `requestAnimationFrame`, sets uniforms each frame

## Shader parameters (what to expose in UI)

These map to the demo controls (defaults from upstream `params`):

| Param | Role | Typical default |
|-------|------|-----------------|
| `patternScale` | Stripe scale | ~2 |
| `refraction` | Dispersion / chromatic offset | ~0.015 |
| `edge` | Edge falloff from logo alpha | ~0.4 |
| `patternBlur` | Stripe softness | ~0.005 |
| `liquid` | Noise wobble on edges | ~0.07 |
| `speed` | Animation rate multiplier | ~0.3 |

Background in the demo: `metal` | `white` | `black` | custom CSS color.

## Integration steps (agent)

1. Confirm **WebGL2** in target browsers.
2. Add a **client-only** React component with a full-screen `<canvas ref={...} />`.
3. On logo change: produce **`ImageData`** (draw SVG/image to offscreen canvas, `getImageData`).
4. Compile vertex + fragment shaders (upstream uses GLSL 300 es); bind **`u_image_texture`**, **`u_time`**, and the params above.
5. Animation loop: `u_time += delta * speed`, `drawArrays`.
6. Tune params; match [liquid.paper.design](https://liquid.paper.design) by eye.

## Related npm package (different license)

The demo also depends on **`@paper-design/shaders-react`** (Apache-2.0 on npm) for other Paper shaders — **not** a drop-in replacement for this exact liquid-logo shader. If the user only needs generic Paper mesh shaders, consider that package instead of porting the logo shader.

## When not to use

- SSR-only pages without a client WebGL mount
- No WebGL2 (older browsers, locked-down WebViews)
- PolyForm Shield incompatible with your product (use a different effect or get legal review)
- User expects “install one line from npm” — this effect requires a deliberate port or using the hosted tool for exports

## License note

Summarized from public repo metadata only; **do not paste** upstream LICENSE text into the project. Link: [github.com/paper-design/liquid-logo](https://github.com/paper-design/liquid-logo).
