#!/usr/bin/env bash
set -e
echo "=================================================="
echo "  AnkiFlow Mobile — Android APK 一键编译脚本"
echo "=================================================="
if command -v ./gradlew &> /dev/null; then
  ./gradlew assembleDebug
elif command -v gradle &> /dev/null; then
  gradle assembleDebug
else
  echo "未检测到本地 gradle，请使用 Android Studio 打开本项目目录，或上传至 GitHub Actions 自动云端打包。"
  exit 1
fi
echo "✅ 编译完成！APK 安装包路径："
echo "   app/build/outputs/apk/debug/app-debug.apk"
