# Day 01 - Linux Bash Automation
**Date:** February 21, 2025
**Challenge:** 21-Day DevOps Challenge
**Projects:** #1 Bash Automation, #4 System Monitoring, #5 Package Install, #10 Uptime Monitor

## Scripts Built Today

| Script | Project | What It Does |
|--------|---------|--------------|
| system_health.sh | #1 #4 | Reports CPU, RAM, Disk, top processes |
| package_install.sh | #5 | Installs all DevOps tools on fresh server |
| uptime_monitor.sh | #10 | Checks 3 websites every 5 min via cron |

## How to Run
```bash
chmod +x system_health.sh && ./system_health.sh
chmod +x package_install.sh && ./package_install.sh
chmod +x uptime_monitor.sh && ./uptime_monitor.sh
```

## Cron Job Setup
```bash
*/5 * * * * /home/devops/21-Days-Devops-Challenge/day-01-linux-bash/uptime_monitor.sh
```

## What I Learned
- Linux system metrics: top, htop, df, free, ps, uptime
- Bash scripting: variables, loops, functions, colors, set -e
- Cron job scheduling for automation
- chmod permissions for executable scripts

## Tools Used
Bash, Linux CLI, cron, curl, htop, df, free, ps, top
