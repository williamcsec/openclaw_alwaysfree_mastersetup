#!/usr/bin/env bash
set -e

echo '[1/8] Updating system'
sudo apt update && sudo apt upgrade -y

echo '[2/8] Installing dependencies'
sudo apt install -y curl git jq unzip build-essential

echo '[3/8] Installing Node.js LTS'
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

echo '[4/8] Installing OpenClaw'
npm install -g openclaw

echo '[5/8] Creating OpenClaw directories'
mkdir -p ~/.openclaw
mkdir -p ~/.openclaw/workspace

echo '[6/8] Optimizing runtime'
echo 'export NODE_COMPILE_CACHE=/var/tmp/openclaw-compile-cache' >> ~/.bashrc
echo 'export OPENCLAW_NO_RESPAWN=1' >> ~/.bashrc
sudo mkdir -p /var/tmp/openclaw-compile-cache

echo '[7/8] Verifying installation'
openclaw --version || true
openclaw doctor || true

echo '[8/8] Complete'
echo 'Next: Configure OpenRouter, Exa, Telegram, Gemini, and NVIDIA NIM credentials.'
