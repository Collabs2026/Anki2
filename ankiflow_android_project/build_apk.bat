@echo off
echo ==================================================
echo   AnkiFlow Mobile - Android APK 一键编译脚本
echo ==================================================
where gradle >nul 2>nul
if %errorlevel%==0 (
    gradle assembleDebug
    echo [完成] APK 安装包已生成于: app\build\outputs\apk\debug\app-debug.apk
) else (
    echo 未检测到全局 Gradle，请使用 Android Studio 打开本文件夹点击 Build -^> Build APK(s)
)
pause
