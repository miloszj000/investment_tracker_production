@echo off
REM ETF Portfolio Tracker - Docker Launcher for Windows

echo.
echo ============================================
echo  ETF Portfolio Tracker - Docker Launcher
echo ============================================
echo.

REM Check if Docker is running
docker ps >nul 2>&1
if errorlevel 1 (
    echo ERROR: Docker is not running!
    echo.
    echo Please start Docker Desktop and try again.
    echo.
    pause
    exit /b 1
)

echo [*] Docker is running...
echo [*] Checking for updates...
echo.

REM Stop old container (keeps data!)
docker-compose down 2>nul

REM Pull latest image and check if updated
echo [*] Pulling latest version...
docker-compose pull

if %errorlevel% equ 0 (
    echo [*] Cleaning up old Docker images to save space...
    docker image prune -af --filter "label=com.example.description=ETF Portfolio Tracker" 2>nul
)

echo.
echo [*] Starting ETF Portfolio Tracker...
echo.

REM Start containers
docker-compose up

echo.
echo [!] Application stopped.
pause
