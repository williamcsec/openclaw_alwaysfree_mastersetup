#!/usr/bin/env bash
set -e

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

mkdir -p reports
REPORT_FILE="reports/install-report.md"

echo "Running System Verification..."

cat <<EOF > "$REPORT_FILE"
# OpenClaw Installation Report
Date: $(date)

## Subsystem Status

EOF

check_service() {
    local name="$1"
    local command="$2"
    if eval "$command" &> /dev/null; then
        echo "- **$name**: ✅ PASS" >> "$REPORT_FILE"
        echo -e "${GREEN}[PASS]${NC} $name"
    else
        echo "- **$name**: ❌ FAIL" >> "$REPORT_FILE"
        echo -e "${RED}[FAIL]${NC} $name"
    fi
}

check_service "Docker Daemon" "docker info"
check_service "OpenClaw Container" "docker ps | grep openclaw-master"
check_service "Systemd Service" "systemctl is-active openclaw.service"

# Check required API keys in .env
if [ -f .env ]; then
    echo -e "\n## API Configuration Status\n" >> "$REPORT_FILE"
    for key in GEMINI_API_KEY OPENROUTER_API_KEY NVIDIA_NIM_API_KEY EXA_API_KEY TELEGRAM_BOT_TOKEN; do
        if grep -q "^${key}=." .env; then
            echo "- **$key**: Configured" >> "$REPORT_FILE"
        else
            echo "- **$key**: MISSING" >> "$REPORT_FILE"
        fi
    done
fi

echo -e "\n## Automation Status\n" >> "$REPORT_FILE"
if crontab -l 2>/dev/null | grep -q "health_monitor.sh"; then
    echo "- **Monitoring Cron**: ✅ Installed" >> "$REPORT_FILE"
else
    echo "- **Monitoring Cron**: ❌ Missing" >> "$REPORT_FILE"
fi

if crontab -l 2>/dev/null | grep -q "automated_backup.sh"; then
    echo "- **Backup Cron**: ✅ Installed" >> "$REPORT_FILE"
else
    echo "- **Backup Cron**: ❌ Missing" >> "$REPORT_FILE"
fi

echo -e "\nVerification complete. Report saved to ${GREEN}$REPORT_FILE${NC}"
