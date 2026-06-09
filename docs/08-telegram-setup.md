# Telegram Integration Setup Guide

## Purpose

Telegram is the primary control interface for this OpenClaw deployment.

Architecture:

User
→ Telegram
→ OpenClaw Gateway
→ Models
→ Tools
→ Response
→ Telegram

This allows full remote operation of the VPS from any device.

---

# Why Telegram

Advantages:

- Free
- Fast
- Mobile friendly
- Works globally
- Supports long conversations
- Easy bot management
- Supports groups and private chats

---

# Create Telegram Bot

1. Open BotFather.
2. Run:

/newbot

3. Choose:

- Bot name
- Username

4. Save the token.

Example:

123456789:ABCDEFxxxxxxxxxxxxxxxxxx

Treat this token like a password.

---

# Find Your Telegram User ID

Methods:

- @userinfobot
- @getmyid_bot
- Telegram API tools

Example:

8005045722

---

# Owner Access Configuration

In OpenClaw:

{
  "commands": {
    "ownerAllowFrom": [
      "telegram:8005045722"
    ]
  }
}

This restricts administrative control.

---

# Basic Telegram Configuration

{
  "channels": {
    "telegram": {
      "enabled": true,
      "botToken": "YOUR_TOKEN"
    }
  }
}

---

# Group Configuration

Recommended:

{
  "groups": {
    "*": {
      "requireMention": true
    }
  }
}

Benefits:

- Prevents accidental activation
- Reduces spam
- Improves reliability

---

# Telegram Security

Never expose:

- Bot token
- Gateway token
- OpenRouter API keys
- Gemini keys
- NVIDIA keys
- Exa keys

If leaked:

1. Open BotFather.
2. Revoke token.
3. Generate new token.
4. Update OpenClaw.
5. Restart services.

---

# Verify Telegram Connectivity

Commands:

openclaw doctor

Verify:

telegram plugin enabled

and

telegram channel enabled

---

# Common Telegram Problems

## Bot Not Responding

Check:

- Token valid
- Gateway running
- Telegram plugin enabled
- VPS online

---

## Wrong User Cannot Execute Commands

Check:

ownerAllowFrom

Verify user ID.

---

## Group Messages Ignored

If requireMention=true:

Mention the bot.

Example:

@yourbot summarize this page

---

## Token Changed

Update:

channels.telegram.botToken

Restart OpenClaw.

---

# Operational Best Practices

Recommended:

Private bot for admin operations.

Separate bots for:

- production
- testing
- experiments

---

# Telegram + Research Workflow

Example:

User request
↓
Telegram
↓
OpenClaw
↓
Exa Search
↓
Browser Automation
↓
Report Generation
↓
Telegram Response

---

# Telegram + Long Running Tasks

Use Telegram to launch:

- research jobs
- lead generation
- scraping pipelines
- influencer discovery
- website analysis

OpenClaw executes remotely while user remains mobile.

---

# Recommended Final Configuration

Telegram:
✓ enabled
✓ owner restricted
✓ requireMention enabled
✓ token rotated if leaked
✓ separate test and production bots

This provides a secure and reliable control plane for the entire OpenClaw stack.
