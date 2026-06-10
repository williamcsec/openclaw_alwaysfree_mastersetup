# V1.1 Roadmap

## CI/CD Improvements
- Add markdown link-check workflow for all markdown files.
- Add release-gate workflow that validates VERSION/CHANGELOG and required governance docs.
- Add protected-branch-aware release checklist automation.

## Automated Testing
- Add smoke tests for `scripts/*.sh` with deterministic inputs.
- Add dry-run checks for backup/restore and failover scripts.
- Add regression checks for docs index consistency.

## Config Validation
- Add JSON schema validation for `configs/*.json` examples.
- Add placeholder-only enforcement for credential-bearing fields.
- Add pre-merge checks that fail on malformed example configs.

## Deployment Automation
- Add idempotent bootstrap script for fresh VPS setup.
- Add scripted rollout/rollback flow for config changes.
- Add automated post-deploy health validation.

## Monitoring Enhancements
- Define SLO-backed health metrics for provider availability.
- Add standardized alerting thresholds and escalation paths.
- Add provider latency/error trend reporting.

## Multi-VPS Failover
- Add scripted failover drills with verifiable success criteria.
- Add documented active-passive and active-active reference patterns.
- Add state synchronization checklist for migration and recovery.

## Cost Optimization Improvements
- Add monthly provider-cost audit checklist and reporting template.
- Add routing policy recommendations by cost/performance class.
- Add usage budget guardrails with threshold alerts.
