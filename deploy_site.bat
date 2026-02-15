@echo off
setlocal enabledelayedexpansion
echo ============================================
echo SAFE Secure Build and Deploy
echo ============================================
echo.

:: Safety Check: Make sure we're on main branch
for /f "tokens=*" %%i in ('git branch --show-current') do set CURRENT_BRANCH=%%i

if not "%CURRENT_BRANCH%"=="main" (
    echo [ERROR] You must be on 'main' branch to deploy!
    echo Current branch: %CURRENT_BRANCH%
    pause
    exit /b 1
)

echo [OK] Starting from main branch...
echo.

:: 1. Build and Encrypt (Advanced Self-Healing)
echo [STEP 1] Checking Virtual Environment...

set "VENV_DIR=%~dp0venv"
set "ACTIVATE_PATH=%VENV_DIR%\Scripts\activate.bat"
set "REQ_FILE=%~dp0requirements.txt"

:: 1a. Rebuild if activate.bat is missing
if not exist "%ACTIVATE_PATH%" (
    echo [WARNING] Environment corrupted or missing. Rebuilding...
    if exist "%VENV_DIR%" rd /s /q "%VENV_DIR%"
    python -m venv venv || (echo [ERROR] Python not found! & pause & exit /b 1)
    set "NEEDS_INSTALL=1"
)

:: 1b. Check if requirements.txt exists
if not exist "%REQ_FILE%" (
    echo [ERROR] requirements.txt not found in project root!
    pause
    exit /b 1
)

:: 1c. Install or Update
if "%NEEDS_INSTALL%"=="1" (
    echo [ACTION] Installing all plugins...
    "%VENV_DIR%\Scripts\pip" install -r "%REQ_FILE%" || (echo [ERROR] Installation failed! & pause & exit /b 1)
)

:: Activate the environment
call "%ACTIVATE_PATH%" || (echo [ERROR] Activation failed! & pause & exit /b 1)

:: Run the publisher
python "%~dp0publish.py" || (echo [ERROR] publish.py failed! & pause & exit /b 1)

echo [OK] Build successful!

:: 2. Verify site folder exists
if not exist "%~dp0site" (
    echo [ERROR] site folder not found!
    pause
    exit /b 1
)

echo [STEP 2] Preparing Deployment...

:: 3. Create a temporary folder
set "TEMP_DEPLOY=%TEMP%\mkdocs_deploy_%RANDOM%"
mkdir "%TEMP_DEPLOY%"

:: 4. Copy built site and essential configs to temp location
xcopy "%~dp0site" "%TEMP_DEPLOY%\site\" /E /I /Q /Y || (echo [ERROR] Copy failed! & pause & exit /b 1)

if exist "%~dp0vercel.json" copy "%~dp0vercel.json" "%TEMP_DEPLOY%\" /Y
if exist "%~dp0mkdocs_base.yml" copy "%~dp0mkdocs_base.yml" "%TEMP_DEPLOY%\" /Y

echo [OK] Files backed up to temp location
echo.

:: 5. Switch to deploy branch
echo [STEP 3] Switching to deploy branch...
git checkout deploy || (echo [ERROR] Could not switch to deploy & rd /s /q "%TEMP_DEPLOY%" & pause & exit /b 1)

:: 6. Clean and Update
echo [STEP 4] Updating deployment branch...
if exist site rd /s /q site
xcopy "%TEMP_DEPLOY%\site" site\ /E /I /Q /Y
if exist "%TEMP_DEPLOY%\vercel.json" copy "%TEMP_DEPLOY%\vercel.json" . /Y
if exist "%TEMP_DEPLOY%\mkdocs_base.yml" copy "%TEMP_DEPLOY%\mkdocs_base.yml" . /Y

:: 7. Clean up temp
rd /s /q "%TEMP_DEPLOY%"

:: 8. Git operations
echo [STEP 5] Committing and Pushing...
git add -A
git commit --allow-empty -m "Deploy: %date% %time%"
git push origin deploy || (echo [ERROR] Push failed! & git checkout main & pause & exit /b 1)

echo [OK] Pushed to deploy branch
echo.

:: 9. Return to main branch
echo [STEP 6] Returning to main branch...
git checkout main

echo ============================================
echo DEPLOYMENT SUCCESSFUL!
echo ============================================
pause