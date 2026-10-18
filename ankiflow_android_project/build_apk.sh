#!/usr/bin/env bash
set -e
echo "=== [1/4] 安装 Capacitor 依赖 ==="
npm install
echo "=== [2/4] 初始化并同步 Android 工程 ==="
if [ ! -d "android" ]; then
  npx cap add android
fi
npx cap sync android
echo "=== [3/4] 使用 Gradle 编译 APK ==="
cd android
chmod +x gradlew
./gradlew assembleDebug
echo "=== [4/4] 编译完成！APK 路径： ==="
echo "android/app/build/outputs/apk/debug/app-debug.apk"
