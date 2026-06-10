#!/usr/bin/env bash
set -e

echo '=== OpenClaw Health Check ==='

echo '[1] OpenClaw Version'
openclaw --version || echo 'FAILED'

echo '[2] Configuration Validation'
openclaw config validate || true

echo '[3] Doctor Check'
openclaw doctor || true

echo '[4] Models Status'
openclaw models status || true

echo '[5] Skills Status'
openclaw skills check || true

echo '[6] Gateway Port Check'
ss -tulpn | grep 18789 || echo 'Gateway not detected'

echo '[7] Memory Usage'
free -h

echo '[8] Disk Usage'
df -h /

echo 'Health check completed.'
