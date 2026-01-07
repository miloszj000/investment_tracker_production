# 📊 Investment Tracker - Deployment Guide

> A professional ETF, ETC, and stock portfolio tracker with real-time pricing and analytics.  
> **Your data stays on your computer - 100% local, never in the cloud!**
> Updated: January 2026 - v2.1

---

## 🚀 Quick Start (30 seconds)

### Prerequisites
- Docker Desktop ([download](https://www.docker.com/products/docker-desktop))

### Run the Application

**Windows:**
```bash
start-docker.bat
```

**Linux/Mac:**
```bash
./start-docker.sh
```

**Or manually:**
```bash
docker-compose up
```

Then open: **http://localhost:8501**

---

## 📦 What's Inside

This repository contains a pre-built Docker application. The source code is private.

### Included Files
- **`docker-compose.yml`** - Docker configuration
- **`start-docker.bat`** - Windows launcher
- **`start-docker.sh`** - Linux/Mac launcher
- **`DOCKER_SETUP.md`** - Advanced Docker setup guide

---

## 🐳 Docker Information

**Image:** `ghcr.io/miloszj000/etf-tracker:latest`

The application runs as a containerized service with:
- Python 3.13
- Streamlit web framework
- Real-time market data (yfinance)
- Local DuckDB database
- Automatic data persistence

---

## 💾 Data Storage

Your investment data is stored in **`portfolio.duckdb`** - a local database file on your computer.

```
investment_tracker_production/
├── docker-compose.yml
├── start-docker.bat
├── start-docker.sh
├── DOCKER_SETUP.md
└── data/
    └── (created automatically)
```

**Data Persistence:**
- ✅ Data survives container restart
- ✅ Database file stays on disk even if container is removed
- ✅ No cloud storage - everything local
- ✅ Safe backup: copy `portfolio.duckdb` to backup

---

## 🔧 Troubleshooting

### Application won't start
```bash
# Check if Docker is running
docker ps

# View logs
docker-compose logs -f

# Restart
docker-compose down
docker-compose up
```

### Port 8501 already in use
Edit `docker-compose.yml` and change the port:
```yaml
ports:
  - "8502:8501"  # External: 8502, Internal: 8501
```

### Delete everything and start fresh
```bash
docker-compose down -v      # Remove containers and volumes
rm portfolio.duckdb         # Delete database
docker-compose up           # Fresh start
```

---

## 📋 Features

- **Real-time Pricing**: Automatic price updates from market data
- **Portfolio Analytics**: Gain/loss calculations, asset allocation
- **Investment Tracking**: Support for ETF, ETC, Stock
- **Multi-currency**: USD, EUR, GBP, CHF, JPY, PLN
- **Tax Tracking**: Track and manage investment taxes
- **Historical Charts**: Visualize price movements and performance
- **Local-first**: All data stays on your machine
- **Docker Deployment**: Single command startup

---

## 🔄 Updates

This application is automatically updated. When new versions are released:

```bash
docker pull ghcr.io/miloszj000/etf-tracker:latest
docker-compose up
```

Your data (`portfolio.duckdb`) is preserved across updates.

---

## 📧 Support

For issues or questions, please refer to `DOCKER_SETUP.md` for advanced configuration options.

---

**Last Updated:** January 2026

