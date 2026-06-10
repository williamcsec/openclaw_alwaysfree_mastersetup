# Release Notes v1.0.0 (Release Candidate)

## Executive summary
This release candidate hardens repository governance and documentation structure for `copilot/harden-v1-release` compared to `main`. It introduces CI checks for markdown and shell scripts, formal release metadata, architecture diagrams, and normalized document indexing/numbering.

## Comparison
- Base: `main`
- Candidate: `copilot/harden-v1-release`
- Net impact: governance/CI/docs hardening with no application runtime code changes.

## Files added
- `.github/ISSUE_TEMPLATE/bug_report.md`
- `.github/ISSUE_TEMPLATE/feature_request.md`
- `.github/pull_request_template.md`
- `.github/workflows/markdown.yml`
- `.github/workflows/shellcheck.yml`
- `CHANGELOG.md`
- `LICENSE`
- `VERSION`
- `architecture/diagrams.md`
- `docs/AUDIT_REPORT.md`
- `docs/FINAL_RELEASE_AUDIT.md`
- `docs/INDEX.md`

## Files modified
- `README.md`
- `README-INDEX.md`
- Renamed/normalized docs:
  - `docs/12-provider-routing-architecture.md` -> `docs/13-provider-routing-architecture.md`
  - `docs/13-monitoring-and-observability.md` -> `docs/14-monitoring-and-observability.md`
  - `docs/14-roadmap-and-future-expansion.md` -> `docs/15-roadmap-and-future-expansion.md`
  - `docs/14-vps-migration.md` -> `docs/16-vps-migration.md`
  - `docs/15-security-hardening.md` -> `docs/17-security-hardening.md`
  - `docs/15-version-compatibility-matrix.md` -> `docs/18-version-compatibility-matrix.md`
  - `docs/16-disaster-recovery.md` -> `docs/19-disaster-recovery.md`
  - `docs/16-secret-management-and-rotation.md` -> `docs/20-secret-management-and-rotation.md`
  - `docs/17-cost-optimization-playbook.md` -> `docs/21-cost-optimization-playbook.md`
  - `docs/17-troubleshooting.md` -> `docs/22-troubleshooting.md`
  - `docs/18-openclaw-production-readiness-checklist.md` -> `docs/23-openclaw-production-readiness.md`

## Security improvements
- Added security-oriented CI hygiene for shell and markdown changes.
- Added explicit least-privilege workflow permissions (`contents: read`) in GitHub Actions workflows.
- Added release/governance documents (`CHANGELOG.md`, `VERSION`, `LICENSE`) for traceability.
- Added `SECURITY.md` and `CONTRIBUTING.md` to satisfy repository governance requirements.

## CI improvements
- Added markdown lint workflow: `.github/workflows/markdown.yml`.
- Added shell script lint workflow: `.github/workflows/shellcheck.yml`.
- Verified workflow YAML syntax validity.

## Documentation improvements
- Added `docs/INDEX.md` for centralized docs navigation.
- Added audit artifacts: `docs/AUDIT_REPORT.md`, `docs/FINAL_RELEASE_AUDIT.md`.
- Normalized numbered docs sequence without duplicates.
- Updated root readmes to reflect repository structure and release metadata.

## Architecture improvements
- Added `architecture/diagrams.md` with Mermaid diagrams for:
  - High-level system interactions
  - Provider failover flow

## Validation status
- README renders and links resolve: PASS
- Mermaid blocks syntax/structure: PASS
- GitHub Actions YAML validity: PASS
- Internal markdown links: PASS
- Duplicate numbered documents: PASS
- `VERSION` matches `CHANGELOG`: PASS
- `LICENSE` exists: PASS
- `SECURITY.md` exists: PASS
- `CONTRIBUTING.md` exists: PASS

## Known limitations
- Mermaid rendering is syntax-validated; no CI render artifact check is enforced yet.
- No dedicated CI job currently verifies markdown link integrity across all docs.
- Existing shellcheck warning remains in `scripts/provider-benchmark.sh` (SC2046), predating this release-note update.
