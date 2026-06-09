# NVIDIA NIM Setup & Scaling Guide

## Purpose

This document covers the NVIDIA NIM strategy discussed for OpenClaw.

The objective is not to replace OpenRouter, but to create a high-throughput specialist model layer that can absorb large numbers of subagent requests.

---

# Why NVIDIA NIM

Benefits:

- Free developer access available
- Fast inference
- Good tool-calling support on selected models
- Separate rate limits from OpenRouter
- Can act as specialist execution models

Use NIM as:

- Coding specialist
- Research specialist
- Summarization specialist
- Data extraction specialist

Not necessarily as the primary orchestrator.

---

# Recommended Architecture

User
↓
OpenClaw
↓
Gemma 4 31B (Orchestrator)
↓
Subagents

├── NVIDIA NIM
├── OpenRouter Free
├── Gemini Flash
└── GPT-OSS

---

# Account Strategy

Create multiple NVIDIA developer accounts if permitted by NVIDIA terms.

For each account:

1. Create developer account
2. Generate API key
3. Label key
4. Store securely

Example:

NIM_KEY_01
NIM_KEY_02
NIM_KEY_03
NIM_KEY_04

---

# Important Reality Check

NVIDIA NIM is NOT unlimited.

Limits may include:

- Requests per minute
- Concurrent requests
- Burst limits
- Daily quotas
- Account-level protections

These limits can change.

Design assuming limits exist.

---

# Why NIM Helps OpenClaw

Your workload often includes:

- Long-running tasks
- Research chains
- Recursive planning
- Multi-agent execution
- Browser automation
- Web extraction

These workloads generate many model calls.

Distributing requests across providers reduces bottlenecks.

---

# OpenClaw Provider Layout

Primary:

openrouter/google/gemma-4-31b-it:free

Fallbacks:

openrouter/openai/gpt-oss-120b:free
openrouter/openai/gpt-oss-20b:free
openrouter/free

Specialists:

Gemini Flash
NVIDIA NIM

---

# Multi-Key Concept

Instead of:

Agent Pool
↓
One API Key

Use:

Agent Pool
↓
Key Pool

Key 1
Key 2
Key 3
Key 4

Benefits:

- Better distribution
- Reduced bottlenecks
- More resilient execution

---

# LiteLLM Future Design

When scaling becomes necessary:

OpenClaw
↓
LiteLLM
↓
NIM Keys
Gemini Keys
OpenRouter

LiteLLM can become a routing layer.

This is optional.

Do not start here.

---

# Orchestrator vs Worker Models

Best practice:

Orchestrator:

- Large context
- Strong planning

Workers:

- Fast
- Cheap
- Disposable

Your architecture should keep expensive reasoning concentrated in the orchestrator.

---

# Failure Recovery

If NIM fails:

1. Retry
2. Switch provider
3. Continue workflow

Never build a system dependent on a single provider.

---

# Monitoring

Track:

- Latency
- Rate-limit errors
- Failure percentage
- Cost
- Token consumption

Create provider-specific logs.

---

# Production Recommendation

Use NVIDIA NIM as:

- Specialist execution layer
- Overflow capacity
- Backup provider

Keep OpenRouter as the primary ecosystem because it offers the largest model diversity.
