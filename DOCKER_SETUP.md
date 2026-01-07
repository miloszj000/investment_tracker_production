# 🐳 Docker Setup - ETF Portfolio Tracker

## Requirements

- Docker ([download here](https://www.docker.com/products/docker-desktop))
- Docker Compose (usually included with Docker Desktop)

## Quick Start (3 steps!)

### Windows

1. **Download and install Docker Desktop**: https://www.docker.com/products/docker-desktop
2. **Run Docker Desktop** (wait until it says "running")
3. **Double-click `start-docker.bat`** - the app will open automatically! 🚀

### Mac/Linux

```bash
# 1. Make sure Docker is installed
docker --version

# 2. Navigate to project directory
cd etf_trucker

# 3. Run the script
chmod +x start-docker.sh
./start-docker.sh
```

## Manual Installation (alternative)

### Docker Compose (RECOMMENDED)

```bash
# Navigate to project directory
cd etf_trucker

# Start the application
docker-compose up
```

Application will automatically open at: **http://localhost:8501**

### Docker (without compose)

```bash
# Build image
docker build -t etf-tracker .

# Run container
docker run -p 8501:8501 \
  -v ./data:/app/data \
  -v ./portfolio.duckdb:/app/portfolio.duckdb \
  etf-tracker
```

## Stopping the Application

Press `CTRL+C` in the terminal or close the terminal window.

## Data and Persistence ✅

The **portfolio.duckdb** database is automatically mapped as a **volume**, which means:
- ✅ Data is saved to your hard disk
- ✅ Data persists across container restarts
- ✅ You can backup your data: `cp portfolio.duckdb portfolio.duckdb.backup`
- ✅ You can change the port in `docker-compose.yml`

## Troubleshooting

### ❌ "Docker is not running"
**Solution:** Start Docker Desktop (Windows/Mac) or Docker daemon (Linux)

```bash
# Linux - check status
sudo systemctl status docker
```

### ❌ Port 8501 is already in use
**Solution:** Change the port in `docker-compose.yml`:
```yaml
ports:
  - "8502:8501"  # Change 8502 to another free port
```

### ❌ "Permission denied while trying to connect to Docker daemon"
**Linux solution:**
```bash
sudo usermod -aG docker $USER
# Log out and log back in
```

### ❌ Data is not being saved
**Solution:** Check if volume exists:
```bash
docker-compose logs etf-tracker
docker volume ls
```

### ❌ Application won't start
**Check logs:**
```bash
docker-compose logs -f etf-tracker
```

### ✅ Rebuild image after code changes
```bash
docker-compose up --build
```

## Advanced Configuration

### Change Port

Edit `docker-compose.yml`:
```yaml
ports:
  - "YOUR_PORT:8501"  # Change YOUR_PORT to your desired port
```

### Stop container without losing data

```bash
docker-compose down
# Data stays! You can restart:
docker-compose up
```

### SSH into container (debugging)

```bash
docker-compose exec etf-tracker bash
```

### Full cleanup (WARNING: DELETES DATA!)

```bash
docker-compose down -v
# -v removes volumes too!
```

## Directory Structure

```
etf_trucker/
├── Dockerfile              # Image build instructions
├── docker-compose.yml      # Docker Compose configuration
├── .dockerignore           # Files ignored in image
├── start-docker.bat        # Windows launcher
├── start-docker.sh         # Linux/Mac launcher
├── DOCKER_SETUP.md         # This guide
├── app.py                  # Main Streamlit application
├── requirements.txt        # Python dependencies
├── modules/                # Application modules
│   ├── analytics.py
│   ├── database.py
│   └── market_data.py
├── portfolio.duckdb        # Database (persistent)
└── data/                   # Additional data
```

## Support

If you encounter issues:
1. ✅ Is Docker Desktop running?
2. ✅ Is port 8501 not already in use?
3. ✅ Do you have at least 1GB of free disk space?
4. ✅ Check logs: `docker-compose logs -f`
