# OpenClaw Master Troubleshooting Guide

## Purpose

This document records the real issues encountered during deployment and operation of the OpenClaw Always-Free architecture.

It is intended to be the first place to check when something breaks.

---

# 1. OpenRouter HTTP 429 Errors

Symptoms:

- HTTP 429
- Provider returned error
- Requests stop unexpectedly
- Agent appears idle

Cause:

Most often caused by:

- Free model rate limits
- Shared public queues
- Too many concurrent subagents

Fix:

1. Configure fallback models.
2. Avoid relying on a single free model.
3. Use OpenRouter paid credits.
4. Add Gemini and NVIDIA providers.

Recommended:

Primary:
- Gemma 4 31B

Fallbacks:
- GPT OSS 120B
- GPT OSS 20B
- OpenRouter Free

---

# 2. Invalid Auth Profile

Symptoms:

OpenClaw reports:

Invalid config

or

provider invalid

Cause:

Incorrect auth profile structure.

Bad:

profiles.openrouter.default

Correct:

openrouter:default

Fix:

Run:

openclaw doctor --fix

Verify:

openclaw models auth list

---

# 3. Memory Search Provider Warning

Symptoms:

Memory search provider is set to openai but no API key found.

Cause:

Semantic memory configured without OpenAI key.

Options:

Disable:

openclaw config set agents.defaults.memorySearch.enabled false

or

Provide OpenAI API key.

---

# 4. npm Global Prefix Not Writable

Symptoms:

npm global prefix is not writable

Cause:

OpenClaw installed without root-owned npm location.

Resolution:

Use:

~/.npm-global

Add to PATH:

export PATH="$HOME/.npm-global/bin:$PATH"

---

# 5. OpenClaw Command Not Found

Symptoms:

openclaw: command not found

Cause:

PATH missing npm global bin directory.

Check:

which openclaw

echo $PATH

Fix:

export PATH="$HOME/.npm-global/bin:$PATH"

Reload:

source ~/.bashrc

---

# 6. Missing unzip

Symptoms:

env: unzip: No such file or directory

Cause:

Dependency missing.

Fix:

sudo apt update
sudo apt install unzip -y

Verify:

which unzip

---

# 7. Gog Installation Failure

Symptoms:

No available formula or cask.

Cause:

Formula removed or unavailable.

Resolution:

Disable skill.

Not required for core workflow.

---

# 8. Goplaces Installation Failure

Symptoms:

No available formula.

Cause:

Formula unavailable.

Resolution:

Disable skill.

Not required.

---

# 9. Telegram Message Tool Warning

Symptoms:

Agent routed from Telegram but message tool unavailable.

Cause:

Messaging tools not allowed.

Impact:

Reply functions may fail.

Fix:

Add:

message

group:messaging

to tool allowlist.

---

# 10. Browser Automation Not Working

Symptoms:

Agent cannot control pages.

Cause:

Playwright missing.

Fix:

Install Playwright browsers.

Verify:

openclaw skills info browser-automation

Expected:

browser-automation ✓ Ready

---

# 11. PEP 668 Python Error

Symptoms:

externally-managed-environment

Cause:

Ubuntu blocks system pip installs.

Fix:

python3 -m venv ~/venv
source ~/venv/bin/activate

Then:

pip install package_name

Alternative:

pipx install package_name

---

# 12. OpenClaw Config Corruption

Symptoms:

Doctor reports invalid configuration.

Fix:

Validate:

openclaw config validate

Repair:

openclaw doctor --fix

Restore:

~/.openclaw/openclaw.json.bak

---

# 13. Exa Search Broken

Symptoms:

Search requests fail.

Cause:

Invalid API key.

Check:

plugins.entries.exa.config.webSearch.apiKey

Verify:

openclaw doctor

---

# 14. Free Model Instability

Reality:

Free models can:

- disappear
- rate limit
- slow down
- change providers

Never depend on one free model.

Always maintain fallback chains.

---

# 15. VPS Migration Recovery

Critical files:

~/.openclaw
~/.npm-global
~/.bashrc

Backup:

tar -czf openclaw-backup.tar.gz ~/.openclaw ~/.npm-global ~/.bashrc

Restore on new VPS.

---

# Emergency Recovery Checklist

Run:

openclaw doctor
openclaw doctor --fix
openclaw models list
openclaw models status
openclaw skills check --agent main

Verify:

- OpenRouter auth
- Exa auth
- Telegram auth
- Browser automation
- Fallback models

If all pass, the system is generally recoverable.
