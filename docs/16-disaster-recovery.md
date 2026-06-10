# Disaster Recovery Guide

## Purpose

This document is the complete recovery handbook for rebuilding the OpenClaw environment after catastrophic failures.

Scenarios covered:

- VPS destroyed
- Provider account lost
- Corrupted OpenClaw configuration
- Broken model configuration
- Lost Telegram integration
- Lost API keys
- Failed migration
- Accidental deletion
- Complete rebuild from scratch

---

# Recovery Philosophy

Always maintain:

```text
1 Production VPS
1 Backup Archive
1 Secret Inventory
1 Recovery Procedure
```

The goal is:

```text
Any failure
↓
Recovery in hours
Not days
```

---

# Critical Assets

Maintain backups of:

```text
~/.openclaw
~/.openclaw/workspace
Telegram Bot Token
Gateway Token
Exa API Key
OpenRouter API Key
Gemini API Keys
NVIDIA API Keys
SSH Keys
Custom Scripts
Documentation
```

---

# Secret Inventory Template

Store privately.

```text
Telegram Bot Token
OpenRouter API Key
Gemini Key #1
Gemini Key #2
Gemini Key #3
NVIDIA Key #1
NVIDIA Key #2
Exa API Key
Gateway Token
SSH Private Keys
SSH Public Keys
```

Never commit secrets into public repositories.

---

# VPS Lost Completely

## Step 1

Provision new VPS.

Recommended:

- Oracle Free Tier
- Hetzner
- AWS
- Contabo

---

## Step 2

Install dependencies:

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y git curl wget unzip jq build-essential
```

---

## Step 3

Install Node:

```bash
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs
```

---

## Step 4

Install OpenClaw:

```bash
npm install -g openclaw
```

---

## Step 5

Restore backups.

```bash
tar -xzvf openclaw-backup.tar.gz -C ~/
```

---

# Telegram Recovery

If bot token is lost:

1. Open BotFather.
2. Select bot.
3. Regenerate token.
4. Update:

```json
"channels": {
  "telegram": {
    "botToken": "NEW_TOKEN"
  }
}
```

Restart OpenClaw.

---

# OpenRouter Recovery

If API key compromised:

1. Revoke key.
2. Create new key.
3. Update auth profile.

Verify:

```bash
openclaw models list
```

---

# Exa Recovery

If search stops working:

Verify:

```bash
openclaw doctor
```

Check:

```json
"plugins": {
  "entries": {
    "exa": {
      "enabled": true
    }
  }
}
```

Replace key if necessary.

---

# Browser Automation Recovery

Symptoms:

```text
Browser tools fail
Pages do not load
Automation unavailable
```

Recovery:

Install dependencies.

Verify:

```bash
openclaw skills info browser-automation
```

---

# Model Routing Recovery

If models fail:

Check:

```bash
openclaw models status
```

Verify:

```bash
openclaw models scan
```

Reset fallback chain.

Recommended:

```text
Primary:
openrouter/free

Fallbacks:
gemma-4-31b-it:free
gpt-oss-120b:free
gpt-oss-20b:free
gemma-4-26b-a4b-it:free
```

---

# Corrupted Config Recovery

Backup existing file:

```bash
cp ~/.openclaw/openclaw.json broken-openclaw.json
```

Validate:

```bash
openclaw config validate
```

Repair:

```bash
openclaw doctor --fix
```

---

# Memory Search Recovery

If warning appears:

```text
Memory search provider is set to openai but no API key found
```

Disable:

```bash
openclaw config set agents.defaults.memorySearch.enabled false
```

Or configure OpenAI.

---

# Failed Migration Recovery

If migration breaks:

1. Keep old VPS online.
2. Restore DNS.
3. Restore traffic.
4. Investigate.
5. Retry migration.

Never destroy original infrastructure until validation completes.

---

# Full Rebuild Procedure

## Fresh VPS

```bash
sudo apt update
sudo apt upgrade -y
sudo apt install -y git curl wget unzip jq build-essential
```

Install Node.

Install OpenClaw.

Restore backups.

Restore secrets.

Run:

```bash
openclaw doctor
```

Run:

```bash
openclaw models scan
```

Run:

```bash
openclaw skills status
```

Validate Telegram.

Validate search.

Validate browser automation.

---

# Validation Checklist

```text
[ ] OpenClaw launches
[ ] Telegram responds
[ ] Search works
[ ] Browser automation works
[ ] Models work
[ ] Fallbacks work
[ ] Workspace restored
[ ] Secrets restored
[ ] Logs healthy
[ ] Backups recreated
```

---

# Backup Strategy

Daily:

```text
Configs
Secrets inventory
```

Weekly:

```text
Full ~/.openclaw
Workspace
```

Monthly:

```text
Full VPS archive
```

---

# Ultimate Recovery Goal

With proper backups, any OpenClaw deployment should be recoverable within:

```text
1–3 Hours
```

without loss of configuration, routing logic, search capability, Telegram integration, or orchestration settings.