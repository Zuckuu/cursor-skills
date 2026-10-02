---
name: react-three-fiber
description: Use when the user wants interactive 3D in React (Three.js scenes as components, Canvas, useFrame) via React Three Fiber.
---

# React Three Fiber (R3F)

Upstream: [pmndrs/react-three-fiber](https://github.com/pmndrs/react-three-fiber) (**MIT**). Docs: [docs.pmnd.rs/react-three-fiber](https://docs.pmnd.rs/react-three-fiber/getting-started/introduction).

R3F is a **React renderer for Three.js** — JSX like `<mesh />` maps to `THREE.Mesh`. Pairs with **`three`**; version must match **React major**.

## Install

```bash
npm install three @types/three @react-three/fiber
```

| React | @react-three/fiber |
|-------|-------------------|
| 18 | 8.x |
| 19 | 9.x |

Mismatch causes runtime errors (same rule as `react-dom` pairing).

## Smallest interactive scene

```jsx
import { Canvas, useFrame } from '@react-three/fiber'
import { useRef, useState } from 'react'

function Box(props) {
  const ref = useRef()
  const [hovered, hover] = useState(false)
  useFrame((_, delta) => {
    ref.current.rotation.x += delta
  })
  return (
    <mesh {...props} ref={ref} onPointerOver={() => hover(true)} onPointerOut={() => hover(false)}>
      <boxGeometry args={[1, 1, 1]} />
      <meshStandardMaterial color={hovered ? 'hotpink' : 'orange'} />
    </mesh>
  )
}

export function Scene() {
  return (
    <Canvas>
      <ambientLight intensity={Math.PI / 2} />
      <pointLight position={[10, 10, 10]} intensity={Math.PI} />
      <Box position={[0, 0, 0]} />
    </Canvas>
  )
}
```

**Core pieces:**

- **`Canvas`** — creates renderer, camera, scene loop; size follows parent DOM
- **`useFrame`** — run code every frame (animation, sync)
- **Three primitives as JSX** — `<mesh>`, `<boxGeometry>`, lights, materials

Add **`@react-three/drei`** only when you need helpers (controls, loaders, environments) — not required for the minimal effect.

## SSR / Next.js

- Mark the scene **`'use client'`** (App Router) or dynamic-import with `ssr: false`
- Do not import `Canvas` in server components

## When not to use

- Non-React app (use Three.js directly or another renderer)
- Static 3D with no interaction (might use simpler asset/embed)
- User needs only a **2D shader background** — consider **`shader-gradient`** instead
- React version cannot be aligned with required R3F major

## Integration

npm deps only, one `Canvas` subtree, no copy of the upstream monorepo. For gradients-on-mesh backgrounds, combine with `@shadergradient/react` (see **`shader-gradient`**) instead of duplicating shader code from GitHub.
