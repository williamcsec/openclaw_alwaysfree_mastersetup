# Model Orchestration Strategy

## Objective

Build the strongest possible OpenClaw deployment using primarily free providers while maintaining reliability, speed, and scalability.

## Architecture

User -> Telegram -> OpenClaw -> Orchestrator Model -> Subagents -> Tools

## Primary Orchestrator

Recommended:

```text
openrouter/google/gemma-4-31b-it:free
```

Reasons:
- Fast
- Good tool use
- Large context
- Reliable free availability

## Fallback Chain

```text
1. openrouter/google/gemma-4-31b-it:free
2. openrouter/openai/gpt-oss-120b:free
3. openrouter/free
4. openrouter/openai/gpt-oss-20b:free
5. openrouter/google/gemma-4-26b-a4b-it:free
```

## OpenClaw Configuration

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

## NVIDIA NIM Strategy

NVIDIA NIM provides rate limits per API key.

Recommended:

- Multiple NVIDIA accounts
- Multiple API keys
- Dedicated keys for specialist agents

Example:

```text
Key 1 -> Research Agent
Key 2 -> Coding Agent
Key 3 -> Browser Agent
Key 4 -> Backup Agent
```

This distributes requests across quotas.

## Google Gemini Strategy

User owns multiple Google AI Pro accounts.

Recommended:

- Create Gemini API key from each account
- Store separately
- Rotate when limits are reached

Suggested usage:

```text
Gemini Key 1 -> Primary
Gemini Key 2 -> Backup
Gemini Key 3 -> Backup
Gemini Key 4 -> Backup
```

## Subagent Design

OpenClaw can launch multiple specialist agents.

Suggested structure:

- Planner Agent
- Research Agent
- Coding Agent
- Browser Agent
- Memory Agent
- Validation Agent

Planner delegates tasks.

Specialists execute tasks.

## Cost Optimization

Priority order:

1. NVIDIA NIM
2. Gemini Free
3. OpenRouter Free Models
4. Paid models only when absolutely necessary

## Scaling Strategy

As workload increases:

- Add more Gemini keys
- Add more NVIDIA keys
- Increase subagent count
- Upgrade orchestration model only if required

## Long-Term Goal

Create an autonomous OpenClaw deployment capable of:

- Research
- Coding
- Telegram operations
- Browser automation
- Memory management
- Multi-agent execution

while remaining nearly free to operate.
