#!/bin/bash
# ============================================
# System Health Monitor v1.0
# Author: ubada-devops
# Day 1 - 21 Day DevOps Challenge
# Date: February 21, 2025
# ============================================

echo "=========================================="
echo "        SYSTEM HEALTH REPORT"
echo "  Date : $(date '+%Y-%m-%d %H:%M:%S')"
echo "  Host : $(hostname)"
echo "  User : $(whoami)"
echo "=========================================="

echo ""
echo ">>> CPU USAGE"
top -bn1 | grep "Cpu(s)" | awk '{print "  Used: " $2 "%   Idle: " $8 "%"}'

echo ""
echo ">>> MEMORY USAGE"
free -h | awk '/^Mem/{print "  Used: "$3"  /  Total: "$2"  /  Free: "$4}'

echo ""
echo ">>> DISK USAGE"
df -h | grep -vE 'tmpfs|udev|Filesystem' | awk '{print "  "$6" -> "$3" used of "$2" ("$5")"}'

echo ""
echo ">>> SYSTEM UPTIME"
uptime -p

echo ""
echo ">>> TOP 5 PROCESSES BY MEMORY"
ps aux --sort=-%mem | awk 'NR<=6{printf "  %-20s %-6s %-5s\n", $11, $2, $4"%"}'

echo ""
echo "=========================================="
echo "     Report Complete. Server is healthy!"
echo "=========================================="
