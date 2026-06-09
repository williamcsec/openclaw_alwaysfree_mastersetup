# OpenRouter Setup Guide

## Purpose

OpenRouter is the primary model aggregation layer for this OpenClaw deployment.

It provides:

- Free models
- Fallback routing
- Multiple providers
- Tool-capable models
- Large context windows

## Account Setup

1. Create OpenRouter account
2. Generate API key
3. Add minimum balance if desired
4. Save API key securely

## Configure Authentication

Run:

```bash
openclaw models auth paste-api-key
```

Provider:

```text
openrouter
```

Verify:

```bash
openclaw models auth list
```

Expected:

```text
openrouter:default
```

## Scan Free Models

Run:

```bash
openclaw models scan
```

Purpose:

- Detect tool-capable models
- Detect usable free models
- Measure latency
- Build fallback chain

## Working Models Discovered

Based on actual scan results.

### Best Overall

```text
openrouter/google/gemma-4-31b-it:free
```

### Strong Alternatives

```text
openrouter/openai/gpt-oss-120b:free
openrouter/openai/gpt-oss-20b:free
openrouter/google/gemma-4-26b-a4b-it:free
openrouter/free
```

## Recommended Production Configuration

```json
"model": {
  "primary": "openrouter/google/gemma-4-31b-it:free",
  "fallbacks": [
    "openrouter/openai/gpt-oss-120b:free",
    "openrouter/free",
    "openrouter/openai/gpt-oss-20b:free",
    "openrouter/google/gemma-4-26b-a4b-it:free"
  ]
}
```

## Why Not Use openrouter/free As Primary

Advantages:

- Automatic routing
- No manual model selection

Disadvantages:

- Inconsistent model selection
- Can become rate limited
- Less predictable behavior

Recommended:

Use Gemma 4 31B as orchestrator.

## Model Commands

View status:

```bash
openclaw models status
```

View configured models:

```bash
openclaw models list
```

Scan models:

```bash
openclaw models scan
```

## Rate Limit Handling

If model becomes unavailable:

1. Retry
2. Fall back automatically
3. Switch provider
4. Rotate API key

## Troubleshooting

### Invalid auth profile

Run:

```bash
openclaw doctor --fix
```

### Models not detected

Verify:

```bash
openclaw models auth list
```

### Authentication issues

Re-add API key:

```bash
openclaw models auth paste-api-key
```

## Production Recommendation

Use OpenRouter as:

- Main orchestration provider
- Fallback provider
- Backup inference layer

while NVIDIA and Gemini handle specialist workloads.
