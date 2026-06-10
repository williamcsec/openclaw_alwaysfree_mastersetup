# Cost Optimization Playbook

## Objective

Run OpenClaw for long-duration autonomous workloads while minimizing operational costs and avoiding unnecessary premium model usage.

---

## Cost Hierarchy

Preferred order:

1. Free Gemini models
2. NVIDIA NIM free endpoints
3. OpenRouter free models
4. Paid OpenRouter models
5. Self-hosted models

---

## Orchestrator Strategy

Recommended:

- Gemini Flash as planner/orchestrator
- Use strongest model only when planning is required
- Avoid using premium models for repetitive execution tasks

---

## Worker Strategy

Assign inexpensive models to:

- Extraction
- Classification
- Summarization
- Formatting
- Research collection

Reserve stronger models for:

- Architecture decisions
- Code review
- Validation
- Final synthesis

---

## Token Efficiency

Guidelines:

- Compress context aggressively
- Summarize completed steps
- Archive old task history
- Use checkpoints
- Avoid repeatedly sending identical context

---

## Long Running Tasks

For multi-hour workflows:

1. Plan once
2. Execute many times
3. Validate periodically

Avoid re-planning every iteration.

---

## Provider Failover Economics

Preferred fallback chain:

Gemini
↓
NVIDIA NIM
↓
OpenRouter Free
↓
Paid OpenRouter
↓
Local Models

---

## VPS Optimization

Recommendations:

- Use low-cost VPS for orchestration
- Offload inference to APIs
- Keep storage lean
- Snapshot before upgrades

---

## Monitoring Metrics

Track:

- Requests per provider
- Tokens consumed
- Failures per provider
- Average latency
- Task completion rate

---

## Goal

Achieve the highest task completion rate at the lowest sustainable operating cost.
