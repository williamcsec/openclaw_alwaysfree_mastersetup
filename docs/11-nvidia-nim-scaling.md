# NVIDIA NIM Scaling Guide

## Purpose

Leverage multiple NVIDIA NIM API keys and endpoints as specialist workers behind OpenClaw.

## Important Reality

NVIDIA NIM free access is governed by request limits and platform policies.

Do not assume:

- Unlimited usage
- Infinite parallelism
- Permanent free quotas

Always design fallback paths.

## Recommended Usage

### Orchestrator

Use a reasoning/orchestration model:

- Gemini 2.5 Flash
- OpenRouter Auto
- Gemma 4

### Specialists

Use NVIDIA NIM for:

- Code generation
- Summarization
- Classification
- Structured extraction

## Scaling Pattern

User
 -> OpenClaw
 -> Orchestrator
 -> Subagent A (NIM Key 1)
 -> Subagent B (NIM Key 2)
 -> Subagent C (NIM Key 3)
 -> Subagent D (NIM Key 4)

## Monitoring

Track:

- RPM
- Error rate
- Latency
- Key health

## Failover

Primary: Gemini
Fallback: NIM
Fallback: OpenRouter
Fallback: Local model

## Testing

Run stress tests gradually.
Never assume provider limits remain unchanged.
