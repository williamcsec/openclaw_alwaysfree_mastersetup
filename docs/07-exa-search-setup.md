# Exa Search Setup & Research Architecture

## Overview

Exa is the primary search provider for this OpenClaw deployment.

Why Exa:

- Better than traditional keyword search for AI agents
- Semantic search capabilities
- Fast results
- Strong web discovery performance
- Works well for research and lead generation workflows

---

# Architecture

Telegram
↓
OpenClaw
↓
Exa Search
↓
Page Discovery
↓
Browser Automation
↓
Extraction
↓
Reports

---

# Obtain Exa API Key

1. Create account
2. Generate API key
3. Copy key

Store securely.

---

# OpenClaw Configuration

Example:

{
  "tools": {
    "web": {
      "search": {
        "provider": "exa",
        "enabled": true
      }
    }
  }
}

Plugin configuration:

{
  "plugins": {
    "entries": {
      "exa": {
        "enabled": true,
        "config": {
          "webSearch": {
            "apiKey": "YOUR_EXA_KEY"
          }
        }
      }
    }
  }
}

---

# Verification

Run:

openclaw doctor

Verify:

Search provider: exa

No plugin errors.

---

# Common Problems

## Invalid API Key

Symptoms:

- Search returns empty
- Search tool errors

Fix:

Replace key.

Restart OpenClaw.

---

## Search Provider Not Active

Verify:

provider = exa

enabled = true

---

# Research Workflows

## Market Research

Examples:

- competitor analysis
- startup research
- niche mapping
- pricing analysis

---

## Influencer Discovery

Example requests:

Find influencers in Jaipur interested in motorcycles.

Find food creators near Chandigarh.

Find travel creators with under 50k followers.

Workflow:

Search
→ Extract
→ Categorize
→ Report

---

# Lead Generation

Possible targets:

- cafés
- hotels
- Airbnbs
- creators
- startups

Exa identifies targets.

Browser automation gathers details.

---

# Combining Exa with Browser Automation

Exa finds pages.

Browser automation:

- opens pages
- navigates sites
- fills forms
- extracts content
- follows pagination

Together they create a powerful research stack.

---

# Cost Optimization

Recommended:

Use Exa only for discovery.

Use browser automation for extraction.

Avoid repeatedly searching identical topics.

Cache results whenever possible.

---

# Scaling Strategy

Level 1:

Single search request.

Level 2:

Search + extraction.

Level 3:

Search + extraction + subagents.

Level 4:

Multi-agent lead generation pipeline.

---

# Recommended Usage in This Repository

Exa = discovery engine.

OpenRouter/Gemini/NVIDIA = reasoning layer.

Browser automation = execution layer.

Telegram = control interface.

This architecture gives the highest capability while remaining extremely low-cost.
