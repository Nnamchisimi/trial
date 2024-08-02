@echo off

REM Set code page to UTF-8 to handle special characters
chcp 65001 > nul

REM Verify drive access
if exist Z:\ (
    echo Z: drive is accessible.
) else (
    echo Z: drive is not accessible. Ensure it is mapped correctly.
    pause
    exit /b 1
)

REM Attempt to navigate to the directory
cd /d "Z:\YEDEK PARÇA\simi\trial"
if %errorlevel% neq 0 (
    echo Failed to change directory to Z:\YEDEK PARÇA\simi\trial
    pause
    exit /b 1
)

REM Verify directory change
echo Current Directory: %cd%
if not "%cd%"=="Z:\YEDEK PARÇA\simi\trial" (
    echo Directory does not match expected path.
    pause
    exit /b 1
)

REM Check if app.py exists
if not exist app.py (
    echo app.py not found in the current directory.
    pause
    exit /b 1
)

REM Run the Flask app
python app.py
pause
