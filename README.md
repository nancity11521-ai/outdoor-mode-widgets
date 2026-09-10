# 户外模式 · 可交互原型（Outdoor Mode Interactive Prototype）

三防机「户外模式」主屏小组件的 **单文件可交互原型**。纯 HTML / CSS / JS，无任何外部依赖，双击即可在浏览器打开。

## 在线预览

| 入口 | 链接 |
| --- | --- |
| 首页（自动跳转） | https://nancity11521-ai.github.io/outdoor-mode-widgets/ |
| 原型直达 | https://nancity11521-ai.github.io/outdoor-mode-widgets/outdoor-mode-interactive.html |

## 交互说明

| 操作 | 效果 |
| --- | --- |
| 单击小组件 | 打开对应详情面板（天气 / 今日步行 / 指南针 / 音乐 / SOS） |
| 长按小组件（480ms） | 进入编辑态：所有组件轻微抖动，右上角出现「更换 / 删除」控件 |
| 点击「更换」 | 打开**部件库**，以真实渲染缩略图展示全部可换部件 |
| 点击「删除」 | 移除该小组件，空调位显示「+」添加位 |
| 点击文件夹 | 展开文件夹面板，超过 9 个应用自动分页 |
| 点击 Dock / 桌面图标 | Toast 提示 |

退出编辑态：点击空白处或按 `Esc`。

## 小组件清单

| 尺寸 | 组件 |
| --- | --- |
| 4×2（宽卡） | 天气 |
| 2×2（方卡） | 今日步行、指南针、音乐、SOS |
| 2×1（半高卡） | 今日步行、SOS |

全部小组件基于同一套视觉语言：黑色底 + 橙色主色 `#ff7a1a`，圆角 / 渐变 / 柔和阴影 / 顶部高光。

## 兼容性

- **iOS 27 squircle 圆角**：`corner-shape: squircle` 仅 Chrome / Edge 139+ 支持。
- 不支持该特性的浏览器（Safari、旧版 Chromium）会自动命中 `@supports not (corner-shape: squircle)` 回退分支，使用 `半径 ÷ 1.45` 的普通圆角，视觉上尽量对齐。
- 目标画布 440×1002（手机外框），主屏内容区 390 宽。

## 目录

```
outdoor-mode-interactive.html   # 原型主体（单文件，可直接打开）
index.html                      # GitHub Pages 入口（自动跳转到原型）
*.png                           # 各状态设计截图
```

## 本地运行

```bash
# 方式一：直接打开
open outdoor-mode-interactive.html

# 方式二：起本地服务
python3 -m http.server 8080
# 然后访问 http://localhost:8080/outdoor-mode-interactive.html
```

## 修改后同步上线

改完 `outdoor-mode-interactive.html` 后，一条命令完成提交 + 推送 + 上线校验：

```bash
bash deploy.sh "本次修改说明"
```

脚本会自动推送、轮询 Pages 上线状态，并比对线上与本地文件哈希是否一致。
