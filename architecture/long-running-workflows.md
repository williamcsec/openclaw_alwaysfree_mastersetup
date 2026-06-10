# Long-Running Workflow Architecture

## Goal

Enable OpenClaw to execute tasks lasting from several minutes to multiple hours while maintaining state, recovering from failures, and coordinating multiple subagents.

---

## Typical Workloads

- Large codebase analysis
- Multi-step research projects
- Lead generation
- Influencer discovery
- Website crawling
- Browser automation sequences
- Content generation pipelines

---

## Workflow Lifecycle

1. Receive Task
2. Create Plan
3. Spawn Subagents
4. Execute Work
5. Validate Results
6. Aggregate Outputs
7. Deliver Final Result

---

## State Persistence

Store:

- Task ID
- Current Step
- Completed Steps
- Failed Steps
- Assigned Model
- Assigned Provider
- Outputs

This allows workflow recovery after:

- VPS reboot
- Process crash
- Provider outage

---

## Recommended Provider Allocation

Orchestrator:
- Gemini Flash

Research Workers:
- Gemini
- OpenRouter

Coding Workers:
- GPT-OSS
- Qwen Coder

Extraction Workers:
- NVIDIA NIM

Validation Workers:
- Gemini

---

## Checkpoint Strategy

Checkpoint every:

- Major task completion
- Provider switch
- Subagent completion
- File generation

---

## Failure Recovery

If a worker fails:

1. Retry once
2. Switch provider
3. Reassign task
4. Continue workflow

Avoid restarting the entire workflow.

---

## Cost Optimization

Use expensive models only for:

- Planning
- Validation

Use cheaper models for:

- Bulk processing
- Extraction
- Classification

---

## Success Criteria

- Resilient execution
- Multi-hour task support
- Provider independence
- Low operational cost
- High completion rate
