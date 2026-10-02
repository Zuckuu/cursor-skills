---
name: liquid-logo
description: Use when the user wants a logo or mark to look like animated liquid metal (WebGL refraction stripes) similar to liquid.paper.design — explain the effect and licensing only.
---

# Liquid metal logo (Paper demo — reference only)

**Live reference:** [liquid.paper.design](https://liquid.paper.design)  
**Upstream repo:** [paper-design/liquid-logo](https://github.com/paper-design/liquid-logo)

## What the effect is

The demo shows a **liquid metal** look on a logo or mark:

- The logo is rasterized to **`ImageData`** (PNG/SVG; transparent or white backgrounds work best).
- That image is uploaded as a **WebGL2 texture**.
- A **fragment shader** animates refractive, striped distortion over the logo alpha with tunable parameters (pattern scale, refraction/chromatic offset, edge falloff, blur, liquid wobble, animation speed).
- The reference app is **Next.js 15 + React 19** with a client-only canvas and `requestAnimationFrame`.

Visually, it reads as flowing metallic stripes and glass-like refraction tied to the logo silhouette — not a simple CSS filter.

## License — not a normal open-source grant

Upstream is **PolyForm Shield 1.0.0**, not MIT/Apache/BSD. Read the upstream [LICENSE](https://github.com/paper-design/liquid-logo/blob/main/LICENSE) before any commercial or product use. It includes restrictions (including on competing products/services) that typical permissive licenses do not.

**Do not copy, port, or merge shader or app source from this repo into the user's project.** This skill does not provide integration steps that transplant upstream GLSL or React code. If the user needs this exact look in production, they should:

- Use **[liquid.paper.design](https://liquid.paper.design)** or Paper's official offerings where applicable,
- Choose a **different effect** with a permissive license (`find-a-repo`, CSS/WebGL alternatives),
- Or obtain **legal review** for PolyForm Shield terms.

Summarize license impact in chat; link to upstream LICENSE — **do not paste** upstream LICENSE text into the project.

## Related npm (different product)

**`@paper-design/shaders-react`** on npm is **Apache-2.0** and covers other Paper mesh shaders — it is **not** a drop-in for this specific liquid-logo demo shader. Mention it only if the user wants generic Paper shader components, not as permission to copy liquid-logo source.

## When not to use (as a copy target)

- User expects `npm i` one-liner for this exact demo (there is no supported "copy the shader" path in this pack)
- SSR-only pages without a client WebGL mount
- No WebGL2
- PolyForm Shield incompatible with the product — stop and suggest alternatives

## Agent role

Describe the effect, link the repo and demo, state **PolyForm Shield 1.0.0** and that code must not be copied by the agent. For permissive integrations elsewhere, use **`shader-gradient`** or **`react-three-fiber`** when those match the ask.
