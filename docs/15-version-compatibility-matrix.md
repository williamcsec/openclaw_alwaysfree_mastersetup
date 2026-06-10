# Version Compatibility Matrix

## Purpose

Track known-good versions for the OpenClaw Always-Free deployment.

---

## Core Components

| Component | Recommended Version | Notes |
|------------|-------------------|-------|
| Ubuntu | 24.04 LTS | Preferred VPS OS |
| Node.js | 22 LTS | Stable runtime |
| npm | Latest compatible | Keep updated |
| OpenClaw | 2026.6.x | Current documented baseline |

---

## Provider Integrations

| Provider | Status | Notes |
|-----------|--------|-------|
| OpenRouter | Supported | Primary fallback provider |
| Gemini | Supported | Recommended orchestrator |
| NVIDIA NIM | Supported | Worker provider |
| Exa | Supported | Search provider |

---

## Tested Features

- Telegram integration
- Exa web search
- OpenRouter authentication
- Multi-provider routing
- Backup and restore scripts
- Monitoring scripts

---

## Upgrade Procedure

1. Backup OpenClaw config.
2. Export secrets.
3. Snapshot VPS.
4. Upgrade OpenClaw.
5. Run diagnostics.
6. Validate providers.
7. Validate Telegram.
8. Run failover tests.

---

## Validation Checklist

After upgrades verify:

- Models load correctly
- Providers authenticate
- Subagents spawn correctly
- Memory functions operate
- Telegram responses work
- Search integrations work

---

## Known Risk Areas

- Provider API changes
- Model deprecations
- OpenRouter routing updates
- OpenClaw config schema changes
- Authentication plugin changes

---

## Recommendation

Avoid upgrading production environments immediately after major OpenClaw releases. Test on a secondary VPS first.
