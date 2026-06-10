#!/usr/bin/env bash
set -e

BACKUP_DIR=${1:-$HOME/openclaw-backups}
TIMESTAMP=$(date +%Y%m%d-%H%M%S)
ARCHIVE="$BACKUP_DIR/openclaw-$TIMESTAMP.tar.gz"

mkdir -p "$BACKUP_DIR"

echo 'Backing up OpenClaw configuration...'
tar -czf "$ARCHIVE" \
  ~/.openclaw \
  2>/dev/null || true

echo 'Backup created:'
echo "$ARCHIVE"

echo 'Recommended: copy archive to cloud storage or another VPS.'
