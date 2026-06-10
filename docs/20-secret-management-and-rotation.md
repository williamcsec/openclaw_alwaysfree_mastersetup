# Secret Management and Rotation

## Purpose

Define how API keys, tokens, credentials, and sensitive configuration should be handled within the OpenClaw Always-Free architecture.

---

## Sensitive Assets

Examples:

- OpenRouter API keys
- Gemini API keys
- NVIDIA NIM API keys
- Exa API keys
- Telegram bot tokens
- Gateway tokens
- SSH keys
- VPS provider credentials

---

## Storage Rules

Never store secrets:

- In public repositories
- In screenshots
- In documentation examples
- In issue comments
- In pull requests

Store secrets:

- Environment variables
- Secret managers
- Encrypted backups

---

## Repository Strategy

Repository contains:

- Templates
- Examples
- Placeholders

Repository should never contain:

- Real API keys
- Real tokens
- Real passwords

---

## Rotation Policy

Rotate immediately if:

- Repository becomes public
- Credential is exposed
- VPS compromise suspected
- Team member loses access

Recommended schedule:

- Critical credentials: 30-90 days
- General API keys: 90-180 days

---

## Incident Response

1. Revoke exposed credential.
2. Generate replacement.
3. Update VPS configuration.
4. Test integrations.
5. Audit logs.
6. Document incident.

---

## Backup Security

Encrypted backups should contain:

- Configuration
- Templates
- Documentation

Avoid storing live credentials in backup archives whenever possible.

---

## Validation Checklist

Before making repository public:

- Remove secrets file
- Remove tokens
- Remove API keys
- Remove screenshots containing secrets
- Rotate previously exposed credentials

---

## Goal

Maintain provider access and operational security while minimizing risk from accidental credential disclosure.
