# Security Hardening Guide

## Purpose

This document defines the security baseline for the OpenClaw Always-Free architecture.

Goals:

- Protect API keys
- Protect Telegram bots
- Protect VPS access
- Prevent accidental leaks
- Secure browser automation
- Secure AI orchestration
- Secure backups

---

# Threat Model

Assets:

- OpenRouter API keys
- Gemini API keys
- NVIDIA NIM API keys
- Exa API keys
- Telegram Bot Tokens
- Gateway Tokens
- SSH Keys
- Session Memory
- Research Data

If any of these leak:

- Bots can be hijacked
- API credits can be consumed
- VPS can be compromised

---

# Never Commit Secrets

Never commit:

```text
API Keys
Bot Tokens
Gateway Tokens
SSH Keys
Cookies
Session Files
.env files
```

Always add:

```gitignore
.env
*.key
*.pem
secrets/
credentials/
```

---

# OpenClaw Secret Management

Recommended:

```bash
openclaw secrets configure
```

Audit:

```bash
openclaw secrets audit --check
```

Verify:

```bash
openclaw security audit --deep
```

---

# Telegram Security

Treat Telegram Bot Tokens as passwords.

If exposed:

1. Revoke bot token
2. Generate new token
3. Update OpenClaw config
4. Restart services

---

# Gateway Security

The gateway token provides control access.

Rotate immediately if exposed.

Store outside public repositories.

---

# VPS SSH Hardening

Disable password login.

Use SSH keys only.

Recommended:

```bash
sudo nano /etc/ssh/sshd_config
```

Set:

```text
PasswordAuthentication no
PermitRootLogin no
PubkeyAuthentication yes
```

Restart:

```bash
sudo systemctl restart ssh
```

---

# Firewall

Install:

```bash
sudo apt install ufw -y
```

Enable:

```bash
sudo ufw allow ssh
sudo ufw enable
```

Verify:

```bash
sudo ufw status
```

---

# File Permissions

Recommended:

```bash
chmod 700 ~/.openclaw
```

Protect secrets:

```bash
chmod 600 ~/.openclaw/openclaw.json
```

---

# Browser Automation Risks

Never:

- Store passwords in prompts
- Save cookies publicly
- Share browser profiles

Keep automation isolated.

---

# Public Repository Safety

Before making a repo public:

Checklist:

- Remove tokens
- Remove API keys
- Remove session data
- Remove screenshots containing credentials
- Remove backup configs

Run searches:

```bash
grep -Ri "token"
grep -Ri "apiKey"
grep -Ri "secret"
```

---

# Credential Rotation Schedule

Recommended:

- Telegram: every 3 months
- Exa: every 3 months
- OpenRouter: every 3 months
- SSH keys: every 6 months

Immediately rotate after suspected exposure.

---

# Backup Encryption

Encrypt backups before transfer.

Example:

```bash
tar -czf backup.tar.gz ~/.openclaw
```

Encrypt:

```bash
gpg -c backup.tar.gz
```

---

# Monitoring

Check:

```bash
openclaw doctor
```

Security:

```bash
openclaw security audit --deep
```

System:

```bash
journalctl -xe
```

---

# Incident Response

If credentials leak:

1. Revoke credentials
2. Generate replacements
3. Update configs
4. Restart services
5. Audit logs
6. Rotate all related credentials

---

# Recommended Security Baseline

Minimum:

- SSH Keys
- Firewall
- Secret storage
- Private repository
- Token rotation

Advanced:

- Encrypted backups
- Separate automation accounts
- Secret vaults
- Dedicated research VPS

Following this baseline significantly reduces the chance of losing control of your OpenClaw infrastructure.