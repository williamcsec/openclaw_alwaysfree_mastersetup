# 24. Interactive Installer

The OpenClaw Master Setup features a fully automated, interactive installer designed to minimize setup errors and accelerate deployment.

## Running the Installer
```bash
git clone https://github.com/williamcsec/openclaw_alwaysfree_mastersetup
cd openclaw_alwaysfree_mastersetup
chmod +x install.sh
sudo ./install.sh
```

## Phases of Installation
The `install.sh` script coordinates the entire setup process:
1. **System Checks**: Validates root privileges, OS compatibility, RAM, disk space, and network connectivity.
2. **Interactive Wizard**: Prompts the user for required API keys (Gemini, OpenRouter, NVIDIA NIM, Exa) and Telegram credentials. Keys are masked during entry.
3. **Configuration Generation**: Automatically writes the `.env` file and creates necessary `configs/*.json` configurations.
4. **Docker Automation**: Installs Docker and Docker Compose if absent.
5. **OpenClaw Deployment**: Pulls the Node.js container and launches OpenClaw.
6. **Systemd Automation**: Registers a systemd service (`openclaw.service`) to ensure OpenClaw restarts on failure and on server boot.
7. **Monitoring & Backups**: Installs cron jobs for daily automated backups and every-5-minute health checks.
8. **Verification**: Tests all subsystems and produces a report in `reports/install-report.md`.
