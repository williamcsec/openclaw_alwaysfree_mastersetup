# OpenClaw Master Setup v1.1.0 Release Notes

## Major Features
- **Interactive Installer (`install.sh`)**: The installation flow is now entirely automated. The wizard guides users through API key input and environment setup.
- **Docker Integration**: Replaced raw global npm installations with isolated, reproducible Docker Compose deployments.
- **Systemd Management**: Added `openclaw.service` for resilient execution, ensuring automatic restarts and start-on-boot.
- **Automated Monitoring & Backups**: Cron jobs are automatically provisioned for daily backups and real-time health checks.
- **Verification System**: Added `verify_install.sh` which generates comprehensive post-install reports.

## Enhancements
- Security Hardening: Ensured all API keys use placeholders (`${API_KEY}`) and improved `.env` permission handling.
- Documentation: Added new zero-to-production deployment guides and maintenance documentation.
- CI Cleanup: Introduced relaxed markdownlint rules to prioritize actionable feedback.
