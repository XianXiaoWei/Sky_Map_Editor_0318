# GitHub 源码说明

仓库发布可编译的 Windows 源码，不包含 Data、原游戏程序、node_modules、dist、release 或预编译着色器缓存。编译和外部资源配置见 [纯净源码编译说明](纯净源码编译说明.md)。

为遵守 GitHub 的 100 MiB 单文件上限，生成的完整模型材质报告以 `model-material-dependencies.json.gz` 保存，报告内容未删减。运行依赖该报告的研究工具前，在仓库根目录执行：

```bash
python3 -c "import gzip,pathlib; p=pathlib.Path('docs/model-material-dependencies.json'); p.write_bytes(gzip.decompress(pathlib.Path(str(p)+'.gz').read_bytes()))"
```

解压出的报告已加入 .gitignore。测试目录中的 JSON 和 JSON.gz 是数值回归样例；模型数值查找表及作者图片是源码所需的静态输入。部分原程序对照、地图验收和研究脚本仍需要外部 Data、原程序或指定环境，报告记载的是既有实测结果。

版权与用途见根目录 LICENSE.md 和 GitHub声明.md。问题和建议请自行发送至 **3661380498@qq.com**。
