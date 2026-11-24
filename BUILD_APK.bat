@echo off
setlocal
set GRADLE_VERSION=8.9
set BOOTSTRAP_ROOT=%USERPROFILE%\.gradle\bootstrap
set GRADLE_HOME_BOOT=%BOOTSTRAP_ROOT%\gradle-%GRADLE_VERSION%

where gradle >nul 2>nul
if not errorlevel 1 (
  set GRADLE_CMD=gradle
) else (
  if not exist "%GRADLE_HOME_BOOT%\bin\gradle.bat" (
    echo Downloading Gradle %GRADLE_VERSION%...
    if not exist "%BOOTSTRAP_ROOT%" mkdir "%BOOTSTRAP_ROOT%"
    powershell -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference='SilentlyContinue'; Invoke-WebRequest 'https://services.gradle.org/distributions/gradle-%GRADLE_VERSION%-bin.zip' -OutFile '%BOOTSTRAP_ROOT%\gradle.zip'; Expand-Archive -Force '%BOOTSTRAP_ROOT%\gradle.zip' '%BOOTSTRAP_ROOT%'"
    if errorlevel 1 (
      echo Could not download Gradle. Install Gradle or build through Android Studio.
      pause
      exit /b 1
    )
  )
  set GRADLE_CMD="%GRADLE_HOME_BOOT%\bin\gradle.bat"
)

if "%ANDROID_HOME%"=="" if "%ANDROID_SDK_ROOT%"=="" (
  echo Android SDK was not found in environment variables.
  echo Install Android Studio and Android SDK Platform 35, then retry.
  echo Or open this project in Android Studio and build the APK there.
  pause
  exit /b 1
)

call %GRADLE_CMD% --no-daemon :app:assembleDebug
if errorlevel 1 exit /b %errorlevel%
echo.
echo APK output: app\build\outputs\apk\debug\app-debug.apk
pause
