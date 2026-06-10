# 26. Post-Install Maintenance

After running the installer, your system is monitored and managed automatically. However, you may need to perform certain administrative tasks.

## Managing the Service
OpenClaw runs as a systemd service managing a Docker Compose workload.

**Check status:**
`sudo systemctl status openclaw`

**Restart OpenClaw:**
`sudo systemctl restart openclaw`

**View Logs:**
`docker logs -f openclaw-master`

## Backups
Backups are automatically taken every day at 2:00 AM and stored in the `backups/` directory.

To manually trigger a backup:
`./scripts/automated_backup.sh`

## Monitoring
The system performs health checks every 5 minutes.
Check the log:
`cat /var/log/openclaw_monitor.log`

## Upgrading
1. `git pull origin main`
2. `docker compose pull`
3. `sudo systemctl restart openclaw`
