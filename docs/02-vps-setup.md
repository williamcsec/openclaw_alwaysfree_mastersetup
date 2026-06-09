# Phase 1 - VPS Foundation Setup

## Objective
Create a reliable, portable, low-cost OpenClaw server that can later be migrated between VPS providers.

---

## Recommended VPS Specs

Minimum:
- 2 vCPU
- 4 GB RAM
- 40 GB SSD

Preferred:
- 4 vCPU
- 8 GB RAM
- 80+ GB SSD

Providers:
- Oracle Cloud Free Tier
- AWS EC2
- Hetzner
- Contabo
- Railway (limited for persistent workloads)

---

## Initial Ubuntu Setup

Update packages:

```bash
sudo apt update
sudo apt upgrade -y
```

Install utilities:

```bash
sudo apt install -y \
  curl \
  wget \
  git \
  jq \
  unzip \
  htop \
  tmux \
  build-essential
```

---

## NodeJS Installation

```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs
```

Verify:

```bash
node -v
npm -v
```

---

## OpenClaw Installation

```bash
npm install -g openclaw
```

Verify:

```bash
openclaw --version
```

---

## Performance Optimizations

Add:

```bash
export NODE_COMPILE_CACHE=/var/tmp/openclaw-compile-cache
mkdir -p /var/tmp/openclaw-compile-cache
export OPENCLAW_NO_RESPAWN=1
```

Add to ~/.bashrc.

---

## Security Hardening

Recommended:

```bash
chmod 700 ~/.openclaw
```

Run:

```bash
openclaw doctor
```

Review warnings before continuing.

---

## Backup Strategy

Backup entire OpenClaw directory:

```bash
tar -czvf openclaw-backup.tar.gz ~/.openclaw
```

Restore:

```bash
tar -xzvf openclaw-backup.tar.gz
```

---

## VPS Migration Strategy

To migrate providers:

1. Backup ~/.openclaw
2. Backup environment variables
3. Export API keys
4. Reinstall OpenClaw on target VPS
5. Restore backup
6. Verify with openclaw doctor

This allows near-complete migration between VPS providers.
