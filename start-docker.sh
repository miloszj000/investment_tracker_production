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
echo "[*] Checking for updates..."
echo ""

# Stop old container (keeps data!)
docker-compose down 2>/dev/null

# Pull latest image
echo "[*] Pulling latest version..."
docker-compose pull

# Cleanup old images only if pull was successful
if [ $? -eq 0 ]; then
    echo "[*] Cleaning up old Docker images to save space..."
    docker image prune -af --filter "label=com.example.description=ETF Portfolio Tracker" 2>/dev/null
fi

echo ""
echo "[*] Starting ETF Portfolio Tracker..."
echo ""

# Start containers
docker-compose up

echo ""
echo "[!] Application stopped."
