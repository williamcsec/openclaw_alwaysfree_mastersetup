# Monitoring and Observability

## Purpose

A production OpenClaw deployment should be monitored continuously.

The objective is to detect:

- Model failures
- API quota exhaustion
- Telegram outages
- Search provider failures
- VPS resource bottlenecks
- Memory corruption
- Configuration drift

---

## Health Checks

Run regularly:

```bash
openclaw doctor
```

Verify:

- Models load correctly
- Plugins load correctly
- Memory works
- Channels work
- Skills work

---

## Resource Monitoring

### CPU

```bash
top
```

or

```bash
htop
```

### RAM

```bash
free -h
```

### Disk

```bash
df -h
```

### Open Files

```bash
lsof | wc -l
```

---

## Log Monitoring

OpenClaw logs should be reviewed after:

- Upgrades
- Provider changes
- Plugin additions
- Agent modifications

Useful commands:

```bash
journalctl -xe
```

```bash
pm2 logs
```

---

## API Monitoring

Track:

### OpenRouter

- Request failures
- Model deprecations
- Latency spikes

### Gemini

- Quota consumption
- Key rotation status
- Response latency

### NVIDIA NIM

- Requests per minute
- Rate limiting events
- Provider availability

---

## Alert Conditions

Investigate immediately when:

- Response latency exceeds 30 seconds
- Multiple provider failures occur
- Telegram stops responding
- Disk usage exceeds 85%
- RAM exceeds 90%

---

## Monthly Maintenance Checklist

- Run doctor
- Verify backups
- Test restore procedure
- Rotate credentials
- Audit permissions
- Review logs
- Review provider availability

---

## Expected Outcome

A stable deployment that can detect issues before they become outages.
