---
name: security-best-practices
description: Use before a merge or when someone asks for a security pass — review auth, secrets in the tree, injection, access control, and dependency risk; report findings only (no exploit steps or attack procedures).
---

# Security pass (findings only)

Defensive review for the current branch or scoped paths. **Report findings** with severity and remediation guidance at a high level. **Do not** write exploit steps, attack payloads, reproduction scripts aimed at breaking production, or step-by-step intrusion procedures — even if the user asks. Describe risk and where to fix; let the team validate in a controlled environment.

Supported stacks for deep reference material: **Python**, **JavaScript/TypeScript**, **Go** (see `references/`). For other stacks, apply the review areas below from general secure-coding knowledge.

## When to use

- Before merging a feature branch or release candidate
- When the user asks for a security review, security pass, or “check this for vulnerabilities”
- After large auth, payment, or data-handling changes (same pass, scoped paths)

## When not to use

- General code style or non-security refactors
- Penetration testing, red-team exercises, or “show me how to hack this”
- Replacing legal/compliance review for privacy or licensing (`legal-compliance` skill)

## Review areas (always cover)

1. **Authentication and session management** — How users prove identity; session/token lifetime; logout and rotation; OAuth/OIDC callback and state handling; password reset flows; MFA gaps if the product claims it.

2. **Secrets in the tree** — API keys, tokens, private keys, `.env` committed, hardcoded credentials, overly broad CI secrets, logs printing secrets. Prefer secret managers and env vars; flag anything that should be rotated.

3. **Injection and unsafe parsing** — SQL/NoSQL/command/OS injection surfaces; template injection; unsafe `eval`, dynamic code, or deserializing untrusted data; XSS (stored/reflected/DOM) in web UIs; SSRF when the server fetches URLs from users.

4. **Access control** — Authorization on every sensitive action (IDOR, missing server-side checks, “hidden UI only” security); role/tenant boundaries; admin routes; file upload/download paths; GraphQL/API field exposure.

5. **Dependency risk** — Known-vulnerable packages (note package name and advisory ID if found via lockfile/audit tools); unpinned or git-fork dependencies; abandoned critical deps; supply-chain red flags (install scripts, postinstall hooks) at a summary level.

Add framework-specific checks by loading matching files from `references/` when the project uses those stacks (read **all** relevant `references/*` for frontend and backend if both exist).

## Workflow

1. Identify languages and primary frameworks in scope; list evidence (manifests, entrypoints).
2. Load applicable `references/<language>-<framework>-*-security.md` files (and general variants, e.g. `javascript-general-web-frontend-security.md` when frontend stack is unclear).
3. Scan the scoped code and config against the five areas above plus reference rules.
4. Produce a **findings report** only — do not change code unless the user explicitly asks for fixes in a **separate** follow-up.

## Report format

Write markdown (default: `security_best_practices_report.md` unless the user names another path).

- Short executive summary
- Findings grouped by severity (Critical / High / Medium / Low / Informational)
- Each finding: numeric ID, location (file and line when possible), **what is wrong**, **impact in plain language**, **recommended fix direction** (no exploit recipe)
- For Critical/High: one-sentence impact statement

Deliver a concise summary in chat and the report path. **Do not** include payloads, curl one-liners against production, or “run this to exfiltrate …” content.

## Overrides

Project docs may document intentional exceptions. Note them as accepted risk or document gaps; do not argue with explicit user policy.

## General notes

- Do not treat missing local TLS as a finding; consider production deployment context.
- Prefer UUIDs/opaque IDs for public resource identifiers over small incrementing IDs.
- Be cautious recommending HSTS or `Secure` cookies when the app is not actually served over HTTPS in the environment under review.

## Fixes

**Out of scope for this skill by default.** After the report, the user may request remediations in a normal development task. This skill ends at the report unless they clearly ask you to implement fixes next.
