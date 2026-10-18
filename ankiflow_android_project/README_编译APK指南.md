# AnkiFlow v2.0 安卓 APK 打包工程包（含最新全功能）

本压缩包已内置更新后的 `www/index.html`（默认真机全屏无边框模式），包含以下全部新增特性：
1. **牌组编辑与删除**：首页牌组支持修改名称/图标/简介，以及带安全确认弹窗的删除牌组功能。
2. **卡片库按牌组分类**：支持顶部横向牌组胶囊筛选与可折叠的按牌组分组视图。
3. **复习中随时编辑卡片**：复习界面顶部和卡片右上角均配有「✏️ 编辑」按钮，保存后原位实时刷新，不打断复习进度。
4. **卡片库点击预览**：在卡片库点击任意卡片即可弹出完整详情预览面板（支持挖空遮挡自测、正反面独立发音、SM-2 参数查看、上下翻页与收藏）。

## 方法一：如果你之前已经配置过 GitHub 仓库（最快，仅需 1 分钟）
如果你之前已经按照教程在 GitHub 创建过仓库并成功打包过 APK，**无需重新配置工作流**，只需替换一个文件即可自动重新编译新 APK：
1. 解压本压缩包，找到里面的 `www/index.html` 文件。
2. 打开你之前的 GitHub 仓库页面，点击进入 `www` 文件夹。
3. 点击右上角的 `Add file` -> `Upload files`，把新的 `index.html` 拖进去替换原文件，点击底部绿色按钮 **Commit changes**。
4. 点击仓库顶部的 **Actions** 标签页，你会看到 GitHub 已经自动开始编译新版本！等待约 1~2 分钟变成绿色勾号 `✅` 后，点击进入并在底部 **Artifacts** 下载最新的 `AnkiFlow-Android-APK` 即可。

## 方法二：全新 GitHub Actions 云端自动编译（免装环境）
1. 在 GitHub 新建一个仓库，将本压缩包解压后的所有文件（`www/`、`package.json`、`capacitor.config.json`）上传并 Commit。
2. 点击顶部 **Actions** -> **New workflow** -> **set up a workflow yourself**。
3. 将本包内 `.github/workflows/build-apk.yml` 的内容粘贴进去，点击右上角 **Commit changes**。
4. 切回 **Actions** 页面，等待运行完毕后在页面最下方 **Artifacts** 区域点击 `AnkiFlow-Android-APK` 下载 ZIP，解压即得 `app-debug.apk`。
