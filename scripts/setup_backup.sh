#!/usr/bin/env bash
set -e

GREEN='\033[0;32m'
NC='\033[0m'

echo "Configuring backup system..."

mkdir -p backups

cat <<'EOF' > scripts/automated_backup.sh
#!/usr/bin/env bash
BACKUP_DIR="$(pwd)/backups"
TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
ARCHIVE_NAME="openclaw_backup_$TIMESTAMP.tar.gz"

echo "Creating backup $ARCHIVE_NAME..."
# Backup .env, configs, and volumes
tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" .env configs/ docker-compose.yml 2>/dev/null || true

# Rotate backups (keep last 7)
ls -t "$BACKUP_DIR"/openclaw_backup_*.tar.gz | tail -n +8 | xargs -r rm --

echo "Backup complete."
EOF

chmod +x scripts/automated_backup.sh

# Add to cron (Daily at 2 AM)
CRON_JOB="0 2 * * * $(pwd)/scripts/automated_backup.sh"
(crontab -l 2>/dev/null | grep -v "automated_backup.sh"; echo "$CRON_JOB") | crontab -

echo -e "${GREEN}Automated backup configured successfully (Daily at 2 AM).${NC}"
