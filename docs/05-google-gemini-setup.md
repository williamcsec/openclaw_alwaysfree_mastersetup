# Google Gemini Setup (Multi-Account Architecture)

## Objective

This guide documents the architecture discussed for using multiple Google AI Studio accounts as a low-cost and high-throughput inference layer for OpenClaw.

Goals:

- Lowest possible cost
- High request capacity
- Multiple API key rotation
- Backup provider when OpenRouter free models fail
- Long-term scalability

---

# Understanding Gemini vs Gemini Pro Subscription

Important:

Google AI Pro subscription and Google AI Studio API access are different things.

Having multiple Google AI Pro subscriptions does NOT automatically provide unlimited API usage.

OpenClaw uses API keys.

The relevant service is:

Google AI Studio

Generate API Key:

https://aistudio.google.com

---

# Recommended Architecture

User
↓
OpenClaw
↓
Gemma 4 31B (Orchestrator)
↓
Specialist Models

Providers:

1. OpenRouter
2. Google Gemini
3. NVIDIA NIM

This creates provider redundancy.

---

# Multi-Account Strategy

Create:

- Account 1
- Account 2
- Account 3
- Account 4

For each account:

1. Login to AI Studio
2. Generate API Key
3. Label key clearly
4. Store securely

Example:

GEMINI_KEY_01
GEMINI_KEY_02
GEMINI_KEY_03
GEMINI_KEY_04

---

# Key Rotation Concept

Instead of using one API key:

Bad:

Key 1 → all traffic

Good:

Key 1
Key 2
Key 3
Key 4

Traffic distributed across keys.

Benefits:

- Higher aggregate throughput
- Better reliability
- Reduced rate-limit impact

---

# OpenClaw Integration Options

Option A

Direct Gemini provider.

Option B

LiteLLM proxy.

Option C

Custom load balancer.

Recommended:

Start with direct provider.

Move to LiteLLM only after scale requires it.

---

# Installing LiteLLM (Optional)

Ubuntu may show:

externally-managed-environment

Use virtual environment.

```bash
sudo apt update
sudo apt install python3-venv -y

python3 -m venv ~/litellm-env
source ~/litellm-env/bin/activate

pip install --upgrade pip
pip install litellm
```

Verify:

```bash
litellm --help
```

---

# Gemini Models To Monitor

Check latest AI Studio availability.

Generally prioritize:

- Gemini Flash models
- Gemini Flash Lite models

Reasons:

- Faster
- Cheaper
- Excellent orchestration support

Avoid using expensive flagship models for every request.

---

# Orchestration Recommendation

Best architecture discussed:

Orchestrator:

openrouter/google/gemma-4-31b-it:free

Specialists:

Gemini Flash
NVIDIA NIM models
OpenRouter fallbacks

This minimizes cost while preserving quality.

---

# Rate Limit Reality

Important:

Multiple API keys do NOT create unlimited usage.

Google can enforce:

- Per-key limits
- Per-project limits
- Per-account limits
- Abuse detection

Design assuming limits exist.

Do not rely on unlimited throughput.

---

# Best Practices

- Keep API keys separate
- Rotate keys carefully
- Monitor failures
- Log provider latency
- Use fallbacks
- Keep OpenRouter configured

---

# Disaster Recovery

If Gemini becomes unavailable:

Fallback chain:

1. OpenRouter Gemma
2. OpenRouter GPT-OSS
3. OpenRouter Free
4. NVIDIA NIM

OpenClaw should continue functioning.

---

# Production Recommendation

Use Gemini as:

- Fast specialist model
- Secondary provider
- Burst-capacity provider

Not as the only provider.

Multi-provider architecture is significantly more reliable than single-provider architecture.
