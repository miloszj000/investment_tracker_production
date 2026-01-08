# 🐳 Docker Setup - ETF Portfolio Tracker

## Requirements

- Docker ([download here](https://www.docker.com/products/docker-desktop))
- Docker Compose (usually included with Docker Desktop)

## Quick Start (3 steps!)

### Windows

1. **Download and install Docker Desktop**: https://www.docker.com/products/docker-desktop
2. **Run Docker Desktop** (wait until it says "running")
3. **Configure database location (optional)**: Copy `.env.example` to `.env` and customize
4. **Double-click `start-docker.bat`** - the app will open automatically! 🚀

### Mac/Linux

```bash
# 1. Make sure Docker is installed
docker --version

# 2. Navigate to project directory
cd etf_trucker

# 3. Configure database location (optional)
cp .env.example .env
# Edit .env to point to your existing database if you have one

# 4. Run the script
chmod +x start-docker.sh
./start-docker.sh
```

## Database Configuration 🗄️

### First Time Setup

By default, the application will create a new database in `./data/portfolio.duckdb`.

### Using Your Existing Database

If you already have a `portfolio.duckdb` file on your computer:

1. **Create `.env` file:**
```bash
cp .env.example .env
```

2. **Edit `.env` and set your database location:**
```env
# Point to the directory containing your portfolio.duckdb file
DB_LOCATION=./data                        # Default - creates ./data/portfolio.duckdb
DB_LOCATION=C:/Users/YourName/my-etf-data # Windows - use your existing database folder
DB_LOCATION=/home/user/my-etf-data        # Linux/Mac - use your existing database folder
```

3. **Important:** The `DB_LOCATION` should point to the **directory** containing your `portfolio.duckdb` file, not the file itself.

4. **Start the application** - it will automatically use your existing database!

### Examples

**Example 1: Using existing database on Windows**
```env
DB_LOCATION=C:/Users/Milos/Documents/ETF_Data
```
(Your existing database should be at: `C:/Users/Milos/Documents/ETF_Data/portfolio.duckdb`)

**Example 2: Using existing database on Mac/Linux**
```env
DB_LOCATION=/home/user/portfolio-backup
```
(Your existing database should be at: `/home/user/portfolio-backup/portfolio.duckdb`)

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

Your database is **automatically persisted** and will **never be lost** when updating to new versions!

### How It Works:
- ✅ Database is saved to your hard disk (not inside the container)
- ✅ Data persists across container restarts and rebuilds
- ✅ Updating to new versions keeps your existing data
- ✅ You can point to an existing database using `.env` configuration
- ✅ You can backup your data: `cp data/portfolio.duckdb data/portfolio.duckdb.backup`

### Customizing Database Location:

Edit `.env` file (copy from `.env.example` first):
```env
DB_LOCATION=./data  # Change to your desired location
```

See "Database Configuration" section above for more details.

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
├── .env                    # Your database configuration (create from .env.example)
├── .env.example            # Example configuration file
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
└── data/                   # Database directory (configurable)
    └── portfolio.duckdb    # Your database (persistent)
```

## Support

If you encounter issues:
1. ✅ Is Docker Desktop running?
2. ✅ Is port 8501 not already in use?
3. ✅ Do you have at least 1GB of free disk space?
4. ✅ Check logs: `docker-compose logs -f`
