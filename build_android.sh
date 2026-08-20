#!/bin/sh
set -e
npm install
npx cap add android
npx cap sync android
cd android
./gradlew assembleDebug
echo "APK: android/app/build/outputs/apk/debug/app-debug.apk"
