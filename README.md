# Raid Report — Capacitor Android Project

## Requirements
- Node.js 20+
- npm
- Android Studio (latest stable)
- Android SDK + Android SDK Platform Tools
- JDK 17

## Build APK

1. Extract this project.
2. Open a terminal in the project folder.
3. Run:
   npm install
   npx cap add android
   npx cap sync android
   npx cap open android

4. In Android Studio, wait for Gradle sync.
5. Build > Build APK(s).

Debug APK is normally generated at:
android/app/build/outputs/apk/debug/app-debug.apk

## Command line build
npm install
npx cap add android
npx cap sync android
npm run build:android

## Features
- Mobile-friendly New Entry form
- Date and text fields
- Gallery/camera photo input
- Save entries locally
- Entries list
- Delete individual/all entries
- CSV export

Note: entries are stored locally on the device/browser WebView. They are not automatically synchronized to another phone or cloud.


## Export
The app now includes:
- Export to Excel (.xlsx)
- Export to PDF (.pdf)
- Export to CSV (.csv)

Excel/PDF export uses browser-side libraries loaded from jsDelivr when the app has internet access.
