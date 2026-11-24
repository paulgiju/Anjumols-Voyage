# Anjumol's Voyage — Android app project

This project packages the game in a full-screen Android WebView app. It locks the device to landscape and bundles the game HTML and Ford Ranger GLB model inside the app.

## Traffic intensity in this version

Open **Settings → Traffic intensity** in the game:

- **Off (0%)**: no traffic vehicles
- **Light (5–24%)**: a few vehicles
- **Normal (25–49%)**: everyday traffic (default 40%)
- **Busy (50–74%)**: more vehicles
- **Heavy (75–100%)**: up to 22 moving vehicles

Traffic vehicles follow red/amber/green signals and slow down to maintain a gap behind vehicles in their lane. The setting is saved on the device.

## Build the APK on Windows

The APK binary is not included because the build environment used to prepare this project has no Android SDK, Gradle, AAPT2, or APK signing tools. The project contains the complete Android source, assets, and build script.

1. Install **Android Studio** and open **SDK Manager**.
2. Install **Android SDK Platform 35** and **Android SDK Build-Tools 35.0.0**.
3. Make sure Java 17 or newer is available. Android Studio includes a bundled Java runtime.
4. Extract this folder and open a Command Prompt in `AnjumolsVoyage-Android`.
5. Set the SDK path (the default Android Studio Windows path is shown here):

   ```bat
   set ANDROID_HOME=%LOCALAPPDATA%\Android\Sdk
   set ANDROID_SDK_ROOT=%ANDROID_HOME%
   ```

6. Run:

   ```bat
   BUILD_APK.bat
   ```

   The script uses an installed Gradle or downloads Gradle 8.9, then runs `:app:assembleDebug`.
7. Copy the generated file to your phone:

   `app\build\outputs\apk\debug\app-debug.apk`

8. Tap the APK on your phone and allow installation from that source when Android asks.

You can also open the project in Android Studio and run the `app` configuration after Gradle sync. For a shareable release build, use **Build → Generate Signed Bundle / APK** and create a release signing key.

## App details

- App name: **Anjumol's Voyage**
- Orientation: landscape locked
- Immersive full-screen gameplay; screen stays awake while playing
- Ford Ranger GLB and HTML included in app assets
- Sound effects generated with Web Audio; no external audio files or microphone permission
- Steering, sound volume, traffic intensity, credits, owned vehicles and odometer saved locally
- Minimum Android: 6.0 (API 23)
- Compile/target SDK: 35
- Android Gradle Plugin: 8.7.3
- Gradle: 8.9

## Internet requirement

The game and Ford Ranger model are bundled in the APK. At present, the game loads Three.js and GLTFLoader as ES modules from jsDelivr, so the phone needs an internet connection when launching the game. The app requests only the normal Internet permission and does not request location, contacts, camera, or microphone access.


## Custom app icon

The project now includes a custom teal pickup-and-mountain-road launcher icon in Android legacy density sizes and adaptive-icon resources (including Android 13 monochrome support). The icon is declared through `@mipmap/ic_launcher` and `@mipmap/ic_launcher_round`.

## Build and install the APK

This workspace does not contain the Android SDK, Gradle, AAPT2, or APK signing tools, so an APK binary cannot be generated inside this environment. To produce the installable debug APK on a PC:

1. Install Android Studio and its Android SDK Platform 35 / Build Tools 35.0.0.
2. Open this project folder in Android Studio and let Gradle sync.
3. Choose **Build → Build Bundle(s) / APK(s) → Build APK(s)**.
4. Find `app-debug.apk` under `app/build/outputs/apk/debug/`.
5. Copy the APK to your phone, open it, and approve installation from that source.

Alternatively, push this project to a GitHub repository and run the workflow **Build Anjumol's Voyage APK** from the Actions tab. Download the `anjumols-voyage-debug-apk` artifact.


## Three-car garage update

This version keeps the game title **Anjumol's Voyage** and includes three free selectable vehicles: the existing Ford Ranger 2024 SuperCrew, the supplied 1994 Toyota Supra MK IV, and the supplied Toyota Sprinter Trueno AE86. The two added GLB files are bundled under `app/src/main/assets/www/`, so the models are packaged with the Android app. The added vehicle files increase the APK size substantially.
