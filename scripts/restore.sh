#!/usr/bin/env bash
set -e

ARCHIVE=${1}

if [ -z "$ARCHIVE" ]; then
  echo 'Usage: restore.sh <backup-file.tar.gz>'
  exit 1
fi

if [ ! -f "$ARCHIVE" ]; then
  echo 'Backup file not found.'
  exit 1
fi

echo 'Restoring OpenClaw configuration...'
mkdir -p ~/.openclaw

tar -xzf "$ARCHIVE" -C /

echo 'Restore completed.'
echo 'Run: openclaw doctor'
echo 'Run: openclaw models status'
echo 'Restart OpenClaw services if applicable.'
