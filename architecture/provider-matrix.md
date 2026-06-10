# Provider Matrix

## Purpose

This document defines the recommended role of each provider in the OpenClaw Always-Free architecture.

---

## Provider Comparison

| Provider | Cost | Context | Speed | Reliability | Best Use |
|----------|------|---------|--------|------------|----------|
| Gemini Flash | Very Low | High | Very Fast | High | Orchestration |
| OpenRouter Free | Free | Medium-High | Variable | Medium | Fallback |
| GPT-OSS | Free/Low | High | Medium | High | Coding |
| Gemma | Free | High | Fast | High | General Tasks |
| NVIDIA NIM | Free Tier | Medium | Fast | High | Worker Agents |

---

## Recommended Roles

### Orchestrator

Primary:
- Gemini Flash

Fallbacks:
- Gemma
- GPT-OSS

---

### Research Workers

Primary:
- Gemini Flash

Fallbacks:
- OpenRouter Free

---

### Coding Workers

Primary:
- Qwen Coder

Fallbacks:
- GPT-OSS

---

### Validation Workers

Primary:
- Gemini Flash

Fallbacks:
- GPT-OSS

---

## Failover Order

1. Gemini
2. NVIDIA NIM
3. OpenRouter
4. Local Models

---

## Operational Guidance

Use premium providers only when:

- Free providers fail repeatedly
- Context requirements exceed free limits
- Critical tasks require higher reliability

Otherwise prioritize free providers.

---

## Goal

Maximize completion rate while minimizing operational cost and dependence on any single AI provider.
