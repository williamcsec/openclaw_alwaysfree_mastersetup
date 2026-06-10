# OpenClaw Always Free Master Setup

Production-oriented setup and operations guide for deploying OpenClaw with a resilient multi-provider model routing strategy, focused on low-cost and always-free-friendly infrastructure.

## What this repository provides

- End-to-end OpenClaw setup documentation
- Multi-provider architecture guidance (Gemini, NVIDIA NIM, OpenRouter)
- Provider routing and failover strategy examples
- Operational scripts for install, backup/restore, health checks, and failover testing
- Security, disaster recovery, and production-readiness playbooks

## Repository structure

- `docs/` — step-by-step setup and operations guides
- `architecture/` — system design, provider matrix, subagent and workflow architecture
- `configs/` — example configuration files for OpenClaw and model routing
- `scripts/` — automation helpers for install and operations
- `templates/` — template environment/secrets file
- `.github/workflows/` — CI checks for markdown and shell scripts

## Quick start

1. Read `docs/01-overview.md`
2. Complete infrastructure prep in `docs/02-vps-setup.md`
3. Install OpenClaw using `docs/03-openclaw-installation.md`
4. Configure providers in `docs/04-*` through `docs/08-*`
5. Validate routing and production readiness with `docs/09-*` onward

## Documentation index

Use [`README-INDEX.md`](README-INDEX.md) for centralized navigation across all repository documents.

## Automation scripts

- `scripts/install.sh`
- `scripts/backup.sh`
- `scripts/restore.sh`
- `scripts/healthcheck.sh`
- `scripts/provider-benchmark.sh`
- `scripts/provider-failover-test.sh`

## Versioning

- Current version: `1.0.0` (see [`VERSION`](VERSION))
- Change history: [`CHANGELOG.md`](CHANGELOG.md)

## License

This project is licensed under the MIT License. See [`LICENSE`](LICENSE).
