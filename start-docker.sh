#!/bin/bash

# ETF Portfolio Tracker - Docker Launcher for Linux/Mac

echo ""
echo "============================================"
echo "  ETF Portfolio Tracker - Docker Launcher"
echo "============================================"
echo ""

# Check if Docker is running
if ! docker ps > /dev/null 2>&1; then
    echo "ERROR: Docker is not running!"
    echo ""
    echo "Please start Docker and try again."
    echo ""
    exit 1
fi

echo "[*] Docker is running..."
echo "[*] Starting ETF Portfolio Tracker..."
echo ""

# Build and start containers
docker-compose up

echo ""
echo "[!] Application stopped."
