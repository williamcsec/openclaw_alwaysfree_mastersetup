# Browser Automation & Web Scraping Master Guide

## Purpose

This document explains how to give OpenClaw the ability to:

- Open websites
- Navigate pages
- Click buttons
- Fill forms
- Extract data
- Scroll dynamically loaded pages
- Login to websites
- Capture screenshots
- Run research workflows
- Perform influencer discovery
- Build lead lists

This is the foundation for advanced AI agent workflows.

---

# Architecture

Recommended Flow

User
→ Telegram
→ OpenClaw
→ Exa Search
→ Browser Automation
→ Data Extraction
→ Report Generation
→ Telegram

Exa should be used for discovery.

Browser automation should be used only when page interaction is required.

---

# Why Not Use Browser Automation For Everything

Browser automation is:

- Slower
- More expensive
- More fragile
- Easier to block

Exa search is:

- Faster
- Cheaper
- More scalable

Use browser automation only when necessary.

---

# Ubuntu Dependencies

Install:

```bash
sudo apt update
sudo apt install -y \
  chromium-browser \
  xvfb \
  fonts-liberation \
  libatk-bridge2.0-0 \
  libgtk-3-0 \
  libnss3 \
  libx11-xcb1 \
  libxcomposite1 \
  libxdamage1 \
  libxrandr2 \
  xdg-utils
```

---

# Verify Browser Availability

```bash
which chromium
chromium --version
```

Expected:

```bash
Chromium xxx
```

---

# OpenClaw Browser Skill

Check:

```bash
openclaw skills info browser-automation
```

Expected:

```bash
browser-automation ✓ Ready
```

---

# Typical Tasks

Examples:

- Open website
- Search site
- Scroll page
- Click buttons
- Extract text
- Download files
- Fill forms
- Compare pages
- Collect contact information

---

# Dynamic Page Handling

Modern websites often load content dynamically.

Examples:

- Instagram
- LinkedIn
- X
- TikTok
- YouTube

The browser must:

1. Open page
2. Wait for content
3. Scroll
4. Wait again
5. Extract data

---

# Infinite Scroll Strategy

For discovery:

1. Search
2. Scroll
3. Capture new records
4. Repeat
5. Deduplicate

Avoid unlimited scrolling.

Set page limits.

---

# Form Filling

Supported workflows:

- Contact forms
- Research portals
- Directories
- Public submission forms

Do NOT automate:

- Spam
- Mass abuse
- Credential harvesting

---

# Screenshots

Useful for:

- Verification
- Reports
- QA
- Evidence collection

Store screenshots separately from extracted data.

---

# Influencer Discovery Workflow

Goal:

Find influencers in a city or niche.

Workflow:

Exa Search
↓
Candidate URLs
↓
Browser Visit
↓
Extract:
- Name
- Handle
- Website
- Contact
- Bio
↓
Structured Dataset

---

# Local Business Lead Generation

Example:

Restaurants
↓
Search
↓
Website Visit
↓
Extract:
- Name
- Location
- Email
- Phone
- Socials
↓
Lead Sheet

---

# Anti-Bot Systems

Common protections:

- Cloudflare
- CAPTCHA
- Login walls
- Rate limiting

Expect failures.

Not every site can be automated.

---

# Resource Requirements

Recommended:

2 vCPU minimum
4 GB RAM minimum

Better:

4 vCPU
8 GB RAM

For heavy automation:

8+ GB RAM

---

# Long Running Jobs

Examples:

- Influencer scraping
- Competitor analysis
- Lead generation
- Research collection

Run asynchronously.

Do not keep browser sessions open unnecessarily.

---

# Error Recovery

Common failures:

Timeouts
Page crashes
CAPTCHA
Navigation failures
Session expiry

Recovery:

Retry
↓
New browser session
↓
Continue from checkpoint

---

# Security

Never store:

- Passwords in prompts
- Tokens in reports
- API keys in screenshots

Rotate credentials regularly.

---

# Recommended Workflow

Discovery Layer:

Exa

Extraction Layer:

Browser Automation

Reasoning Layer:

Gemini / OpenRouter / NVIDIA

Control Layer:

Telegram

This architecture provides scalable, low-cost automation while minimizing browser overhead.
