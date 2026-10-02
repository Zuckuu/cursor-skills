---
name: production-ai-engineering
description: Use when building or reviewing RAG, an agent, or a model feature so it is production retrieval and controlled state, not a chunk-and-loop demo.
---

# Production AI engineering

Demos optimize for a flashy answer. Production systems optimize for **correct context**, **controlled behavior**, and **measurable failure** when context or data is wrong.

## When to use

- Retrieval-augmented generation (RAG) over docs, tickets, or code
- Tool-using agents with multiple steps
- Model features embedded in a product (support bot, codegen assistant, search)
- Reviewing PRs that add embeddings, vector stores, or agent loops

## Rules (in priority order)

### 1. Retrieval before generation

- Use **hybrid search** (lexical + vector) where the corpus supports it; add **reranking** when precision matters.
- **Rewrite or expand the query** (HyDE, sub-queries, metadata filters) before hitting the index — do not send raw user text as the only retrieval query.
- **Measure retrieval** (recall@k, nDCG, or human-labeled “gold doc in top k”) before trusting end-to-end answer quality. If retrieval fails, prompt tweaks will not fix it.

### 2. Controlled state, not an open LLM loop

- **Scope tools per step** (read-only retrieval vs mutating tools). Do not give every tool on every turn unless the task truly requires it.
- Represent state explicitly: current plan, retrieved doc ids, pending user confirmations, tool results. Avoid unbounded chat history as the only memory.
- Prefer **finite workflows** (retrieve → draft → verify → respond) over “loop until done” unless you have stop conditions, max steps, and escalation.

### 3. Evals that fail when context is wrong

- Build evals with **fixed inputs and expected citations** (or expected tool calls), not only “sounds good”.
- Include cases where the **correct answer is “not in corpus”** or **requires refusing** — measure hallucination and overconfidence.
- Run evals in CI or on a schedule when the index or prompts change.

### 4. Prompt wording is a last tweak

- After retrieval, tool boundaries, and evals are in place, tune prompts for tone and format.
- Do not use prompt changes to compensate for missing documents, wrong chunking, or missing access control on the index.

## Architecture checklist

| Area | Production pattern | Demo smell |
|------|-------------------|------------|
| Chunks | Size/overlap tuned per doc type; metadata (source, ACL) on every chunk | Fixed 512 tokens everywhere |
| Index | Versioned index builds; rollback path | Re-embed on every deploy with no version |
| Agent | Step budget, tool allowlists, human gates for writes | Single ReAct loop with all tools |
| Safety | Filter retrieved content by user ACL before LLM | One global index for all tenants |
| Ops | Logging of retrieval ids + model version | Only log final answer |

## Review questions

1. What happens if the gold document is not retrieved? Is that measured?
2. Can two tenants ever see each other’s chunks?
3. What is the max cost/latency path (steps × tools × context size)?
4. If the model returns garbage, does the product degrade safely?
