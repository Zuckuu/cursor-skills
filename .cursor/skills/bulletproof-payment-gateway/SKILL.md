---
name: bulletproof-payment-gateway
description: Use when building or reviewing a payment flow, checkout, charge, refund, or webhook so retries cannot double-charge and payment state is never overwritten.
---

# Bulletproof payment gateway

Payment integrations fail in predictable ways: clients retry, networks drop, webhooks arrive twice, and background jobs replay. Design every flow so **at-most-once money movement** and **auditable state** are guaranteed.

## When to use

- New checkout, subscription billing, or one-off charge endpoints
- Refunds, partial captures, or void flows
- Webhook handlers for Stripe, Adyen, PayPal, or similar providers
- Code review of anything that mutates `payment_status` on a single row

## Core rules

### 1. Idempotency key from the client

- The client generates a **UUID v4** idempotency key per payment attempt and sends it on every retry of that attempt (header or body field — pick one and document it).
- **Persist the payment intent before** calling the provider API (status `pending` or equivalent).
- If the same idempotency key arrives again, **return the stored result** (same HTTP status and body shape as the first successful response). Do not call the provider again for that key.

### 2. Append-only ledger, never overwrite status

- Model money movement as an **append-only ledger**: one row per meaningful event (`authorized`, `captured`, `refunded`, `failed`, `disputed`, etc.).
- Do **not** overwrite a prior row’s status in place. Derive current state from the latest ledger entry (or a read model built from the log).
- Reconciliation and support tooling should read the ledger chronology, not a single mutable column.

### 3. Webhook verification and deduplication

- **Verify webhook signatures** with the provider’s documented method before parsing the body.
- Store the provider’s **event id** (or equivalent unique id) in a dedupe table with a unique constraint.
- On duplicate delivery: **no-op the side effects**, still return **2xx** so the provider stops retrying.
- Process webhooks idempotently: applying the same event twice must not double-capture or double-refund.

### 4. Ambiguous provider responses

- **2xx with a provider payment/charge id** → treat as success; do not retry the same idempotency key with a new charge.
- **4xx (except rate limit)** → failed; surface to the user; do not blindly retry the same payload.
- **401 / invalid credentials** → stop the workflow; fix credentials.
- **429** → backoff and retry **the same** idempotency key (safe retry class).
- **Timeout / connection reset / no response** → **ambiguous**. Do not immediately place a second charge. Reconcile by querying provider state or reading your ledger, then decide whether to retry as a **new** attempt with a **new** idempotency key.

## Implementation checklist

1. DB unique constraint on `idempotency_key` (scoped per merchant/account if applicable).
2. Transaction: insert intent → call provider → append ledger row → commit.
3. Webhook handler: verify signature → dedupe by event id → append ledger → update read model.
4. Admin/support views show ledger timeline, not only “current status”.
5. Tests cover: duplicate idempotency key, duplicate webhook, out-of-order webhooks, ambiguous timeout then reconcile.

## Code review red flags

- Updating `payments.status = 'captured'` in place with no ledger row
- Calling `charge()` before persisting the intent
- Webhook handler that mutates state without signature verification or event-id dedupe
- Retry loops that mint a new idempotency key on every attempt for the same user action
