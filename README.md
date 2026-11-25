# Sky Map Editor

Sky 地图二进制编辑器（0.3.8），使用 Windows Electron／Vulkan 桌面视口。打开原资源目录后，可查看地图、模型、材质与原对象字段，并运行已接通的逻辑预览。

本项目采用 [禁止商用版权许可](LICENSE.md)，作者为县小威，详见 [GitHub 项目声明](GitHub声明.md)。问题和建议请自行发送至 **3661380498@qq.com**。当前交付纯净源码，不包含 Data 或编译产物，构建步骤见 [纯净源码编译说明](docs/纯净源码编译说明.md)。

右上角作者介绍已加入五个平台主页、复制链接和原始赞赏码，支持放大和返回。后续只维护与打包 Windows，源码包排除构建产物、缓存和 Android host，见 [作者介绍与 Windows 源码](docs/作者介绍与Windows源码.md)。

运行与构建：

```bash
npm install
npm run build
npx electron --no-sandbox .
npm test
npx tsc --noEmit
```

Windows 原生程序交叉构建使用 `python3 tools/build-vulkan.py --windows`。本次基础生物版的路径与载荷见 [打包记录](docs/basic-creature-package.json)，归档完整性见 [独立校验](docs/basic-creature-package-verification.json)；ZIP 包内根目录提供 `预览构建信息.json`。`npm run build:windows` 使用 Windows 交叉构建，`npm run package:windows:source -- --plan` 只检查干净源码清单。此前试用版记录保留于 `docs/preview-package.json`。

原地图和模型资源保持不变。独立原程序对照、视口验证及构建结果见 [本轮验证记录](docs/creature-animation-guide-verification.json)。

GitHub 发布范围及大报告解压方式见 [GitHub 源码说明](docs/GitHub源码说明.md)。
