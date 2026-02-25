#!/bin/bash
# ============================================
# Website Uptime Monitor v1.0
# Author: ubada-devops
# Day 1 - 21 Day DevOps Challenge
# Date: February 21, 2025
# ============================================

WEBSITES=("https://google.com" "https://github.com" "https://linkedin.com")
LOG_FILE="$HOME/uptime_log.txt"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

echo "[$TIMESTAMP] --- Uptime Check Started ---" >> "$LOG_FILE"

for site in "${WEBSITES[@]}"; do
    STATUS=$(curl -o /dev/null -s -w "%{http_code}" --max-time 5 "$site")

    if [ "$STATUS" -eq 200 ] || [ "$STATUS" -eq 301 ] || [ "$STATUS" -eq 302 ]; then
        echo "[$TIMESTAMP] UP   $site (HTTP $STATUS)" >> "$LOG_FILE"
        echo "  UP   $site (HTTP $STATUS)"
    else
        echo "[$TIMESTAMP] DOWN $site (HTTP $STATUS)" >> "$LOG_FILE"
        echo "  DOWN $site (HTTP $STATUS)"
    fi
done

echo "[$TIMESTAMP] --- Check Complete ---" >> "$LOG_FILE"
echo ""
echo "Log saved to: $LOG_FILE"
