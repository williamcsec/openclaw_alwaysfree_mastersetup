# OpenClaw Installation Guide

## Fresh Ubuntu Installation

### Update System
```bash
sudo apt update
sudo apt upgrade -y
```

### Install Dependencies
```bash
sudo apt install -y curl wget git jq unzip build-essential tmux htop
```

### Install Node.js
```bash
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs
```

Verify:
```bash
node -v
npm -v
```

### Install OpenClaw
```bash
npm install -g openclaw
openclaw --version
```

## Common Issues

### PATH Warning
Add:
```bash
export PATH="$HOME/.npm-global/bin:$PATH"
```

### Invalid Config
```bash
openclaw doctor --fix
```

### PEP668 Error
```bash
python3 -m venv venv
source venv/bin/activate
pip install litellm
```

## Verification
```bash
openclaw doctor
openclaw models list
```
