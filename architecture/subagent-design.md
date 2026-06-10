# OpenClaw Subagent Design

## Objective

Design OpenClaw so large tasks are decomposed into specialized parallel workers instead of being executed by a single model.

---

## Core Principle

One orchestrator.
Many workers.

The orchestrator plans.
Workers execute.
Validator verifies.

---

## Agent Hierarchy

User

↓

Orchestrator Agent

├── Research Agent
├── Coding Agent
├── Browser Agent
├── Analysis Agent
├── Search Agent
└── Validation Agent

---

## Research Agent

Responsibilities:

- Exa search
- Information gathering
- Source collection
- Citation extraction

Recommended models:

- Gemini Flash
- Gemma

---

## Coding Agent

Responsibilities:

- Code generation
- Refactoring
- Repository modifications
- Script creation

Recommended models:

- Qwen Coder
- GPT-OSS

---

## Browser Agent

Responsibilities:

- Page navigation
- Form filling
- Data extraction
- Dynamic website interaction

Recommended tooling:

- Browser automation plugins
- Playwright

---

## Analysis Agent

Responsibilities:

- Summarization
- Comparison
- Decision support
- Report generation

---

## Validation Agent

Responsibilities:

- Verify outputs
- Detect hallucinations
- Check consistency
- Approve final responses

---

## Scaling Strategy

Small task:

1 orchestrator
1 worker

Medium task:

1 orchestrator
3-5 workers

Large task:

1 orchestrator
10+ workers

---

## Failure Handling

If a worker fails:

1. Retry
2. Switch provider
3. Reassign task
4. Escalate to orchestrator

---

## Expected Benefits

- Better parallelism
- Lower latency
- Better reliability
- Easier provider switching
- Improved scalability
