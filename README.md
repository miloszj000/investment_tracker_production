# 📊 Investment Tracker - Deployment Guide

> A professional ETF, ETC, and stock portfolio tracker with real-time pricing and analytics.  
> **Your data stays on your computer - 100% local, never in the cloud!**
> Updated: January 2026 - v2.1

---

## 🚀 Quick Start (30 seconds)

### Prerequisites
- Docker Desktop ([download](https://www.docker.com/products/docker-desktop))

### Optional: Configure Your Existing Database

If you already have a `portfolio.duckdb` file:

1. Copy `.env.example` to `.env`
2. Edit `.env` and set `DB_LOCATION` to your database directory

**Example:**
```env
DB_LOCATION=C:/Users/YourName/my-portfolio
```

If you don't have an existing database, skip this step - a new one will be created automatically!

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
etf_trucker/
├── docker-compose.yml
├── .env.example           # Configuration template
├── .env                   # Your custom config (optional)
├── start-docker.bat
├── start-docker.sh
├── DOCKER_SETUP.md
└── data/
    └── portfolio.duckdb   # Your database (created automatically)
```

**Data Persistence:**
- ✅ Data survives container restart and upgrades
- ✅ Database file stays on disk even if container is removed
- ✅ No cloud storage - everything local
- ✅ Safe backup: copy `data/portfolio.duckdb` to backup
- ✅ You can point to an existing database via `.env` configuration

**Using Your Existing Database:**

1. Create `.env` file: `cp .env.example .env`
2. Set `DB_LOCATION` to your database directory:
   ```env
   DB_LOCATION=C:/Users/YourName/my-etf-data  # Windows
   DB_LOCATION=/home/user/my-etf-data         # Linux/Mac
   ```
3. Make sure your `portfolio.duckdb` file is in that directory
4. Start the application - it will use your existing data!

See `DOCKER_SETUP.md` for more details.

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

**Your data is ALWAYS preserved across updates!** The database is stored outside the container, so upgrading will never delete your portfolio data.

---

## 📧 Support

For issues or questions, please refer to `DOCKER_SETUP.md` for advanced configuration options.

---

**Last Updated:** January 2026

