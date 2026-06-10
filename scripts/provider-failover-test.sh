#!/usr/bin/env bash
set -e

echo '=== Provider Failover Test ==='

echo '[1] Testing OpenRouter'
curl -s https://openrouter.ai/api/v1/models >/dev/null && echo 'OpenRouter OK' || echo 'OpenRouter FAILED'

echo '[2] Testing Gemini Endpoint'
curl -s https://generativelanguage.googleapis.com >/dev/null && echo 'Gemini Reachable' || echo 'Gemini FAILED'

echo '[3] Testing NVIDIA NIM'
curl -s https://integrate.api.nvidia.com >/dev/null && echo 'NIM Reachable' || echo 'NIM FAILED'

echo '[4] Recommended Failover Order'
echo 'Gemini -> NVIDIA NIM -> OpenRouter -> Local Model'

echo 'Failover test completed.'
