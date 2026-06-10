# Secret Exposure Audit

## Scope
Keyword scan for:
- `apiKey`
- `token`
- `botToken`
- `openrouter`
- `exa`
- `gemini`
- `nvidia`

Branch audited: `copilot/harden-v1-release`

## Real credentials found
- None.

## Placeholders found
- `configs/openclaw-alwaysfree.example.json`
  - `${EXA_API_KEY}`
  - `${GATEWAY_TOKEN}`
  - `${TELEGRAM_BOT_TOKEN}`
- `docs/07-exa-search-setup.md`
  - `"apiKey": "YOUR_EXA_KEY"`
- `docs/08-telegram-setup.md`
  - `"botToken": "YOUR_TOKEN"`
- `docs/19-disaster-recovery.md`
  - `"botToken": "NEW_TOKEN"`

## Files requiring review
These files include sensitive-field names and should stay placeholder-only:
- `configs/openclaw-alwaysfree.example.json`
- `docs/04-openrouter-setup.md`
- `docs/05-google-gemini-setup.md`
- `docs/06-nvidia-nim-setup.md`
- `docs/07-exa-search-setup.md`
- `docs/08-telegram-setup.md`
- `docs/17-security-hardening.md`
- `docs/19-disaster-recovery.md`
- `docs/20-secret-management-and-rotation.md`
- `docs/22-troubleshooting.md`

## Conclusion
No real secrets were identified from the requested keyword audit. Matches are provider references, configuration keys, and intentional documentation placeholders.
