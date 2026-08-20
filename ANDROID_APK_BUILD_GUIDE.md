# Raid Report Android App

यह Capacitor project Android APK बनाने के लिए तैयार है।

## Build करने के चरण

1. Node.js LTS और Android Studio इंस्टॉल करें।
2. इस project folder को खोलें।
3. Terminal में चलाएँ:
   npm install
   npx cap sync android
   npx cap open android
4. Android Studio में:
   Build → Build Bundle(s) / APK(s) → Build APK(s)
5. APK `android/app/build/outputs/apk/debug/` में मिलेगा।

## यदि Android folder मौजूद नहीं है

चलाएँ:
npx cap add android
npx cap sync android

फिर:
npx cap open android

## मुख्य सुविधाएँ
- New Entry
- Mobile-friendly form
- Photo selection
- Excel export
- PDF export
- Entry management
