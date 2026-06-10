# OpenClaw Always Free Master Setup

Production-oriented setup and operations guide for deploying OpenClaw
with a resilient multi-provider model routing strategy focused on
low-cost and always-free-friendly infrastructure.

## What this repository provides

- End-to-end OpenClaw setup documentation
- Multi-provider architecture guidance
  (Gemini, NVIDIA NIM, OpenRouter)
- Provider routing and failover strategy examples
- Operational scripts for install, backup and restore,
  health checks, and failover testing
- Security, disaster recovery, and production-readiness playbooks

## Repository structure

- `docs/` — step-by-step setup and operations guides
- `architecture/` — system design, provider matrix,
  subagent and workflow architecture
- `configs/` — example configuration files for OpenClaw
  and model routing
- `scripts/` — automation helpers for install and operations
- `templates/` — template environment and secrets file
- `.github/workflows/` — CI checks for markdown and shell scripts

## Quick start

```bash
git clone https://github.com/williamcsec/openclaw_alwaysfree_mastersetup
cd openclaw_alwaysfree_mastersetup
chmod +x install.sh
sudo ./install.sh
```

The interactive installer will guide you through provider setup, environment generation, and Docker-based deployment.

## Documentation index

Use `README-INDEX.md` for centralized navigation across all
repository documentation.

## Automation scripts

- `scripts/install.sh`
- `scripts/backup.sh`
- `scripts/restore.sh`
- `scripts/healthcheck.sh`
- `scripts/provider-benchmark.sh`
- `scripts/provider-failover-test.sh`

## Versioning

- Current version: `1.0.0`
- Change history: `CHANGELOG.md`

## License

This project is licensed under the MIT License.
See `LICENSE`.
