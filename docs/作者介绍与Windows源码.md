# 作者介绍与 Windows 源码

右上角“作者介绍”按钮打开县小威的介绍页。五个平台提供“打开主页”和“复制链接”，通过独立桌面 IPC 在系统浏览器打开，编辑器保留当前地图。复制支持 Clipboard API 和回退路径，结果显示在页面底部。

| 平台 | 主页 |
| --- | --- |
| 抖音 | https://v.douyin.com/bND5tY3shLY/ |
| 快手 · 小威呀 | https://v.kuaishou.com/n7yZI5Xw |
| 哔哩哔哩 · 县小威 | https://b23.tv/h075pRB |
| 小红书 | https://xhslink.cn/o/5oNuwxXZexs |
| GitHub | https://github.com/XianXiaoWei |

赞赏码使用用户原始 1040×1040 PNG，未重画或重新编码，SHA-256 为 `997d97003c39e89b3f654659fa4173b7fdd894c77fa6494eb7496baf7a1ec4fd`。点击缩略图进入同一窗口的大图界面，可以返回作者介绍。支持关闭按钮和 Escape，关闭后焦点回到作者按钮。

生产 Electron、preload、IPC 的窗口检查通过：五项精确跳转、两种复制路径、图片原尺寸／原字节、1500×940 与最小 1000×680 窗口无横向溢出、放大／返回、关闭／焦点恢复，以及编辑器状态和原地图保持不变。系统浏览器调用在测试边界捕获；这是 Linux 上的共享桌面检查，尚未运行 Windows 真机检查。详情见 [窗口检查](author-profile-smoke.json)，截图见 [作者页](../evidence/author-profile-1500.png) 和 [赞赏大图](../evidence/author-appreciation.png)。

用户最新要求：以后不维护安卓版，运行包与源码包仅打包 Windows。默认 `npm run build` 已改为桌面构建，`npm run build:windows` 构建 Windows 原生程序；不再使用 Android 默认构建或 APK 打包脚本。

按用户最新要求，Windows 源码脚本不读取或归档 Data 和 reference。包含源码、原生代码、测试、证据、文档与编译必需的静态参数；排除原游戏程序／资源、Android host／工具、dist、release、node_modules、编译产物、缓存、临时备份、日志和签名文件。共享桌面模块仍保留已有平台兼容代码，旧工作区文件没有被删除。编译步骤见 [纯净源码编译说明](纯净源码编译说明.md)。

```bash
# 只检查源码清单，不创建压缩包
npm run package:windows:source -- --plan

# 生成不含 Data 的 Windows 源码 ZIP
npm run package:windows:source
```

打包器使用独立新文件名，归档完成后逐文件检查 SHA-256，并输出归档校验文件。授权与反馈信息见根目录 [GitHub 项目声明](../GitHub声明.md) 和 [禁止商用版权许可](../LICENSE.md)，联系邮箱为 **3661380498@qq.com**。
