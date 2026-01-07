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
echo [*] Starting ETF Portfolio Tracker...
echo.

REM Build and start containers
docker-compose up

echo.
echo [!] Application stopped.
pause
