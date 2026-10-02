---
name: legal-compliance
description: Use when adding a dependency, referencing someone else's repo, handling personal data, or shipping a feature that collects or sends user data.
---

# Legal and compliance checklist (not legal advice)

Help the user spot **license and data-handling issues early**. This skill is **informational only** — **not legal advice**. When terms are unclear, conflicting, or high-stakes, **stop and tell the user to consult a qualified lawyer** before proceeding.

**Do not** copy, port, merge, or vend upstream source from third-party repos into the project. Integration is via **declared package managers**, APIs, or user-owned downloads — same no-copy policy as `borrow-a-repo` and `find-a-repo`.

## When to use

- Adding or upgrading a **dependency** (npm, PyPI, Go module, etc.)
- **Referencing or studying** someone else's GitHub repo, demo, shader, or snippet
- **Personal data** — collecting, storing, processing, or sending PII, account data, health/financial fields, or behavioral telemetry
- Shipping a feature that **logs in users**, takes payments, or **exports data** to third parties (analytics, email, cloud storage)

## License check (dependencies and reference repos)

For each dependency or reference repo, state:

| Kind | Typical use | Agent action |
|------|-------------|--------------|
| **Permissive** (MIT, Apache-2.0, BSD) | Often OK for proprietary products when used as a dependency | Confirm license file matches; note attribution/NOTICE requirements |
| **Copyleft** (GPL, AGPL, etc.) | May require source disclosure or restrict linking in closed products | Flag **high risk**; stop short of recommending merge; user + lawyer decide |
| **PolyForm / BSL / NC / custom** | Often restrict commercial use, competing products, or redistribution | Read summary from upstream LICENSE; **stop** if user’s product competes with upstream or license forbids the use case |
| **No license or “all rights reserved”** | Not safe to use code | Do not copy; do not treat as OSS |

**Competing product:** If upstream license includes non-compete or “similar service” language (e.g. PolyForm Shield) and the user's product is in the same space, **stop**, explain the conflict in plain language, and **recommend legal review** — do not suggest copying or “porting the smallest slice.”

**No copying upstream source:** Even when a license permits use, this pack does **not** instruct agents to copy files from reference repos. Prefer `npm install` (or equivalent) and official docs; use `borrow-a-repo` / effect skills for evaluation only.

## Personal data and product features

Flag (do not resolve as law):

- What data is collected, from whom, and where it is sent (including subprocessors)
- Retention, deletion, and export — are they specified?
- Consent, privacy policy, and regional rules (GDPR, COPPA, etc.) — **user’s counsel** decides applicability
- Security baseline: encryption in transit, access control, secrets handling (pair with `security-best-practices` for technical findings)

If the feature **collects or sends user data** and the user has not mentioned privacy/terms, recommend they confirm requirements with counsel and product before launch.

## Output

Produce a short markdown note or chat summary:

1. **Items reviewed** (deps, repos, data flows)
2. **License summary** per item with links to upstream LICENSE
3. **Flags** — copyleft, PolyForm/competition, missing license, sensitive data without stated policy
4. **Stop conditions** — what needs a lawyer before merge or release
5. **Disclaimer** — this is not legal advice

Do not draft binding contracts, privacy policies, or DPA text unless the user explicitly asks for draft **starting points** and understands they must be reviewed by counsel.

## Related skills

- **`borrow-a-repo`** / **`find-a-repo`** — evaluate repos without copying source
- **`security-best-practices`** — technical security findings before merge
- **`liquid-logo`** — example of PolyForm Shield upstream; reference only, no code copy
