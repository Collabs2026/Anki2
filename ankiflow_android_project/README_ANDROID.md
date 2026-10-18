# AnkiFlow Mobile — Android APK 安装包工程指南

本工程已将 **AnkiFlow 移动版 (SM-2 智能闪卡)** 完整封装为原生 Android 工程（包名 `com.ankiflow.mobile`），内含全屏 `WebView` 容器、离线 `localStorage` 数据库支持、自适应矢量图标以及云端自动编译配置。

---

## 方法一：免安装环境 — GitHub Actions 云端自动打包 `.apk`（最省心）

无需在电脑上安装几 GB 的 Android Studio 或配置 Java/SDK：
1. 在 GitHub 新建一个仓库（公开或私有均可），将解压后的全部文件上传并提交（确保包含 `.github/workflows/build-apk.yml`）。
2. 点击仓库顶部的 **Actions** 选项卡，工作流 `Build Android APK` 会自动启动编译（约 1~2 分钟）。
3. 编译完成后，在任务底部的 **Artifacts** 区域点击下载 **`AnkiFlow-Android-APK`**，解压即可获得可直接安装到安卓手机的 `app-debug.apk` 与 `app-release.apk`。

---

## 方法二：使用 Android Studio 本地一键生成 `.apk`

1. 解压本压缩包，打开 **Android Studio** -> 选择 **Open** -> 选中解压后的目录。
2. 等待 Gradle 同步完成（约几十秒）。
3. 点击顶部菜单栏：**Build** -> **Build Bundle(s) / APK(s)** -> **Build APK(s)**。
4. 右下角弹窗点击 **locate**，即可拿到编译好的安装包：
   `app/build/outputs/apk/debug/app-debug.apk`
5. 若电脑已 installed Gradle，也可以直接在终端运行：
   - macOS / Linux: `./build_apk.sh`
   - Windows: 双击 `build_apk.bat`

---

## 方法三：安卓手机直接免编译安装 (PWA / WebAPK)

工程内的 `www/`（或 `app/src/main/assets/`）已内置 `manifest.json` 与离线缓存 `sw.js`：
- 将 `www` 文件夹托管至任意静态页面（如 GitHub Pages / Vercel / Cloudflare Pages），用安卓手机 **Chrome / Edge** 打开后点击提示栏 **「安装应用 (Install App)」**，安卓系统会自动生成原生级 WebAPK 桌面图标并支持全屏离线运行。

---

## 工程目录结构

```text
ankiflow_android_project/
├── .github/workflows/build-apk.yml  # GitHub Actions 云端自动构建 APK 工作流
├── app/
│   ├── build.gradle                 # Android App 模块构建配置 (SDK 24~34)
│   └── src/main/
│       ├── AndroidManifest.xml      # 应用权限、硬件加速与全屏 Activity 声明
│       ├── assets/index.html        # 已开启原生全屏模式的 AnkiFlow 移动版核心应用
│       ├── java/com/ankiflow/mobile/MainActivity.java  # 原生 WebView 容器与返回键栈管理
│       └── res/                     # 矢量自适应桌面图标 (ic_launcher) 与资源配置
├── www/                             # Capacitor & PWA 标准静态资源目录
├── capacitor.config.json            # Capacitor 跨平台打包配置文件
├── build_apk.sh / build_apk.bat     # 本地命令行一键打包脚本
└── settings.gradle / build.gradle   # 根项目 Gradle 配置
```
