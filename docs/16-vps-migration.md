# VPS Migration Guide

## Purpose

This document explains how to migrate the complete OpenClaw environment from one VPS provider to another with minimal downtime.

Supported examples:

- AWS EC2 → Oracle Cloud
- AWS EC2 → Contabo
- AWS EC2 → Hetzner
- Oracle → Contabo
- Any Linux VPS → Any Linux VPS

---

# Migration Strategy

The safest migration process is:

```text
Backup
→ Export Configs
→ Export Secrets
→ Export Workspace
→ Provision New VPS
→ Restore
→ Verify
→ Switch Traffic
```

Never shut down the old VPS before validation.

---

# Inventory Checklist

Before migration collect:

```text
OpenClaw Version
Node Version
NPM Version
Python Version
Telegram Bot Token
OpenRouter Keys
Gemini Keys
NVIDIA Keys
Exa Keys
Gateway Token
SSH Keys
Workspace Data
Logs
Custom Scripts
```

---

# Backup OpenClaw

Create archive:

```bash
tar -czvf openclaw-backup.tar.gz ~/.openclaw
```

Backup workspace:

```bash
tar -czvf workspace-backup.tar.gz ~/.openclaw/workspace
```

Backup user files:

```bash
tar -czvf home-backup.tar.gz ~/
```

---

# Transfer Backups

Using rsync:

```bash
rsync -avz openclaw-backup.tar.gz user@NEW_VPS_IP:/home/user/
```

Using SCP:

```bash
scp openclaw-backup.tar.gz user@NEW_VPS_IP:/home/user/
```

---

# Provision New VPS

Update packages:

```bash
sudo apt update
sudo apt upgrade -y
```

Install essentials:

```bash
sudo apt install -y git curl wget unzip jq build-essential
```

Install Node:

```bash
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs
```

Verify:

```bash
node -v
npm -v
```

---

# Install OpenClaw

```bash
npm install -g openclaw
```

Verify:

```bash
openclaw doctor
```

---

# Restore Configuration

Extract backup:

```bash
tar -xzvf openclaw-backup.tar.gz -C ~/
```

Verify:

```bash
ls ~/.openclaw
```

---

# Restore Workspace

```bash
tar -xzvf workspace-backup.tar.gz -C ~/.openclaw/
```

---

# Restore Secrets

Verify:

```bash
cat ~/.openclaw/openclaw.json
```

Check:

- Telegram token
- Exa key
- Gateway token
- Model configuration

---

# Validate Models

Check:

```bash
openclaw models status
```

Scan:

```bash
openclaw models scan
```

Doctor:

```bash
openclaw doctor
```

---

# Validate Telegram

Start OpenClaw.

Send:

```text
/status
```

Confirm:

- Bot replies
- Models work
- Search works
- Browser tools work

---

# DNS Migration

If using a domain:

1. Lower TTL before migration.
2. Update DNS records.
3. Wait for propagation.
4. Validate connectivity.

---

# Zero-Downtime Method

Keep old VPS online.

Process:

```text
Old VPS Running
↓
New VPS Restored
↓
Testing Complete
↓
Switch DNS
↓
Switch Traffic
↓
Observe 24 Hours
↓
Destroy Old VPS
```

---

# Rollback Plan

If migration fails:

1. Keep old VPS active.
2. Revert DNS.
3. Re-enable old services.
4. Investigate logs.

Never delete the original VPS before validation.

---

# Common Problems

## OpenClaw Missing

Reinstall:

```bash
npm install -g openclaw
```

## Browser Automation Broken

Install Chromium dependencies.

## Telegram Not Responding

Verify bot token.

## Search Fails

Verify Exa API key.

## Model Errors

Verify provider auth profiles.

---

# Migration Validation Checklist

- OpenClaw launches
- Telegram responds
- Search works
- Browser automation works
- Workspace restored
- Secrets restored
- Backups verified
- Logs healthy

Only after completing this checklist should the original VPS be decommissioned.

---

# Recommended Future Architecture

Primary VPS:

- Production OpenClaw

Secondary VPS:

- Cold standby backup

Backups:

- Daily config backup
- Weekly full backup
- Monthly archive

This architecture minimizes downtime and allows complete recovery from provider failures.