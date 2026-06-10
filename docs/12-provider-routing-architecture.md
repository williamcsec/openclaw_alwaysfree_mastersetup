# Provider Routing Architecture

## Goal

Create an OpenClaw deployment that remains usable even when one provider is rate limited, unavailable, or changes its free-tier limits.

---

## Design Philosophy

Never depend on a single model provider.

The stack should be able to survive:

- OpenRouter outages
- Gemini quota exhaustion
- NVIDIA NIM throttling
- VPS migration
- API key rotation

---

## Recommended Architecture

User

↓

Telegram

↓

OpenClaw

↓

Primary Orchestrator

↓

Specialist Providers

- Gemini
- NVIDIA NIM
- OpenRouter

↓

Tools

- Exa Search
- Browser Tools
- Memory
- Subagents

---

## Provider Responsibilities

### Gemini

Best for:

- Fast orchestration
- Planning
- Task decomposition
- Long conversations

### NVIDIA NIM

Best for:

- Specialist workers
- Classification
- Structured extraction
- Parallel subagent workloads

### OpenRouter

Best for:

- Fallback models
- Experimental models
- Emergency redundancy

---

## Failover Chain

1. Gemini
2. NVIDIA NIM
3. OpenRouter Auto
4. OpenRouter Free Pool
5. Local Model

---

## Multi-Agent Pattern

Main Agent

├── Research Agent
├── Coding Agent
├── Analysis Agent
├── Search Agent
└── Validation Agent

Each agent should be able to use a different provider.

---

## Operational Rules

1. Never hardcode a single provider.
2. Maintain multiple API keys.
3. Test failover monthly.
4. Monitor latency.
5. Keep backup configurations.

---

## Expected Result

High availability.
Low operating cost.
Maximum flexibility.
Provider independence.
