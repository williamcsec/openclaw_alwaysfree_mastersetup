# 25. Zero to Production

This repository adopts a "Zero to Production" philosophy.

## The Old Way vs The New Way

**Old Way:**
1. Clone repo
2. Run bash script to install system packages
3. Globally install npm packages
4. Manually copy `.env.example`
5. Manually copy `configs/*.json`
6. Start process manually

**New Way (v1.1+):**
1. Clone repo
2. Run `./install.sh`
3. Answer prompts

Everything is handled automatically, resulting in a production-ready, containerized OpenClaw instance wrapped in systemd with active monitoring and backup schedules.
