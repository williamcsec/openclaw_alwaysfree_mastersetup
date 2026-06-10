# Gemini Multi-Key Rotation

## Objective

Use multiple Google AI Studio API keys to increase aggregate throughput while staying within provider limits.

## Architecture

- Key 1 -> Worker Pool A
- Key 2 -> Worker Pool B
- Key 3 -> Worker Pool C
- Key 4 -> Worker Pool D

OpenClaw orchestration remains centralized while requests are distributed across workers.

## Recommendations

1. Keep orchestration separate from worker models.
2. Track failures per key.
3. Remove throttled keys automatically.
4. Rotate keys using environment variables.

## Validation

- Confirm each key works independently.
- Measure requests per minute.
- Monitor error rates.
- Maintain fallback providers.

## Notes

Google limits can change at any time. Design for graceful degradation rather than assuming unlimited capacity.
