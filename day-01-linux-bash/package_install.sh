#!/bin/bash
# ============================================
# Server Bootstrap Script v1.0
# Author: ubada-devops
# Day 1 - 21 Day DevOps Challenge
# Date: February 21, 2025
# ============================================

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${YELLOW}================================${NC}"
echo -e "${YELLOW}   SERVER BOOTSTRAP STARTING    ${NC}"
echo -e "${YELLOW}================================${NC}"
echo ""

print_status() {
    echo -e "${GREEN}[DONE]${NC} $1"
}

echo "--- Updating system ---"
sudo apt update -y > /dev/null 2>&1
print_status "System updated"

echo "--- Installing Git ---"
sudo apt install -y git > /dev/null 2>&1
print_status "Git: $(git --version)"

echo "--- Installing curl and wget ---"
sudo apt install -y curl wget > /dev/null 2>&1
print_status "curl and wget installed"

echo "--- Installing htop ---"
sudo apt install -y htop > /dev/null 2>&1
print_status "htop installed"

echo "--- Installing tree ---"
sudo apt install -y tree > /dev/null 2>&1
print_status "tree installed"

echo "--- Installing Docker ---"
sudo apt install -y docker.io > /dev/null 2>&1
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
print_status "Docker: $(docker --version)"

echo ""
echo -e "${GREEN}================================${NC}"
echo -e "${GREEN}   BOOTSTRAP COMPLETE!          ${NC}"
echo -e "${GREEN}================================${NC}"
echo ""
echo "Installed: git, curl, wget, htop, tree, docker"
echo "NOTE: Log out and back in for Docker to work"
