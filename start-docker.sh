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

# Set database location to Documents folder (outside repo)
export ETF_DATA_PATH="$HOME/Documents/ETF_Tracker"

# Create database directory if it doesn't exist
if [ ! -d "$ETF_DATA_PATH" ]; then
    mkdir -p "$ETF_DATA_PATH"
fi

# Check if database exists
if [ -f "$ETF_DATA_PATH/portfolio.duckdb" ]; then
    echo "[+] Found existing database: $ETF_DATA_PATH/portfolio.duckdb"
else
    echo "[!] Database not found. A new database will be initialized in:"
    echo "    $ETF_DATA_PATH/portfolio.duckdb"
fi
echo ""

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
    docker image prune -a -f 2>/dev/null
fi

echo ""
echo "[*] Starting ETF Portfolio Tracker..."
echo ""

# Start containers
docker-compose up

echo ""
echo "[!] Application stopped."
