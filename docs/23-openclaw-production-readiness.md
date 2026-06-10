# OpenClaw Production Readiness Checklist

## Purpose

Use this checklist before declaring an OpenClaw deployment production-ready.

---

## Infrastructure

- [ ] Ubuntu fully updated
- [ ] Time synchronization enabled
- [ ] Firewall configured
- [ ] SSH hardened
- [ ] Non-root administration configured
- [ ] Automatic security updates enabled

---

## OpenClaw

- [ ] OpenClaw installed successfully
- [ ] OpenClaw doctor passes
- [ ] Config validated
- [ ] Required plugins enabled
- [ ] Unused plugins disabled
- [ ] Required skills verified

---

## Providers

### Gemini

- [ ] API keys configured
- [ ] Model tested
- [ ] Rate limits understood

### OpenRouter

- [ ] Authentication verified
- [ ] Fallback chain tested
- [ ] Free models validated

### NVIDIA NIM

- [ ] API keys configured
- [ ] Worker model tested
- [ ] Throughput validated

---

## Telegram

- [ ] Bot token validated
- [ ] Commands working
- [ ] Group permissions tested
- [ ] Message delivery verified

---

## Search

- [ ] Exa configured
- [ ] Search requests successful
- [ ] Search results validated

---

## Long Running Tasks

- [ ] Multi-hour workflow tested
- [ ] Recovery tested
- [ ] Checkpointing verified
- [ ] Failover verified

---

## Security

- [ ] Secrets removed from repository
- [ ] Credentials rotated if exposed
- [ ] Backups encrypted
- [ ] SSH keys secured

---

## Backup & Recovery

- [ ] Backup script tested
- [ ] Restore script tested
- [ ] VPS snapshot created
- [ ] Disaster recovery documented

---

## Monitoring

- [ ] Healthcheck script working
- [ ] Logs reviewed
- [ ] Failure alerts configured
- [ ] Provider monitoring enabled

---

## Final Validation

- [ ] Research task completed
- [ ] Coding task completed
- [ ] Browser task completed
- [ ] Multi-agent task completed
- [ ] Provider failover tested

---

## Production Approval

Deployment is considered production-ready only after every section above has been completed and documented.
