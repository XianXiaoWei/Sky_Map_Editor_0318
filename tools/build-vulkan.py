#!/usr/bin/env python3
"""Compile the native Vulkan host and its diagnostic SPIR-V shaders.
Does not package or publish the editor.
"""
import argparse, pathlib, re, shutil, struct, subprocess, tempfile

p = argparse.ArgumentParser()
p.add_argument('--windows', action='store_true')
p.add_argument('--surface-test', action='store_true')
args = p.parse_args()
root = pathlib.Path(__file__).resolve().parent.parent
out = root / 'dist/native'
out.mkdir(parents=True, exist_ok=True)
with tempfile.TemporaryDirectory(prefix='sky-vulkan-') as temporary:
    tmp = pathlib.Path(temporary)
    arrays = []
    for shader, stages in [('diagnostic',[('vert','vertex'),('frag','fragment')]),('present',[('vert','vertex'),('frag','fragment')]),('canvas',[('comp','compute')]),('exposure',[('comp','compute')])]:
      for stage, name in stages:
        spv = tmp / f'{shader}.{stage}.spv'
        subprocess.run(['glslangValidator', '-V', '--target-env', 'vulkan1.1', str(root / f'native/shaders/{shader}.{stage}'), '-o', str(spv)], check=True)
        subprocess.run(['spirv-val', '--target-env', 'vulkan1.1', str(spv)], check=True)
        raw = spv.read_bytes(); words = struct.unpack(f'<{len(raw)//4}I', raw)
        arrays.append(f'static const uint32_t {shader}_{name}[] = {{' + ','.join(hex(w) for w in words) + '};\n')
    (tmp / 'diagnostic_spirv.hpp').write_text(''.join(arrays))
    if args.windows:
        include = tmp / 'include'; include.mkdir()
        for folder in ['vulkan', 'vk_video']:
            shutil.copytree(pathlib.Path('/usr/include') / folder, include / folder)
        # The system GPU driver supplies vulkan-1.dll. Build the import library
        # from the public Vulkan functions this host uses; no driver is bundled.
        native_source = '\n'.join(p.read_text() for p in (root / 'native').glob('*') if p.suffix in ['.cpp', '.hpp'])
        exports = sorted(set(re.findall(r'\b(vk[A-Z]\w+)\s*\(', native_source)))
        definition = tmp / 'vulkan-1.def'; definition.write_text('LIBRARY vulkan-1.dll\nEXPORTS\n' + '\n'.join(exports) + '\n')
        subprocess.run(['x86_64-w64-mingw32-dlltool', '-d', str(definition), '-l', str(tmp / 'libvulkan-1.a')], check=True)
        compiler, linker, target = 'x86_64-w64-mingw32-g++', '-lvulkan-1', out / 'sky-vulkan.exe'
        flags = ['-DSKY_WIN32_SURFACE', '-DVK_USE_PLATFORM_WIN32_KHR', '-DNOMINMAX', '-D_WIN32_WINNT=0x0A00', '-I', str(include), '-L', str(tmp), '-static', '-static-libgcc', '-static-libstdc++']
    else:
        compiler, linker, target = 'g++', '-lvulkan', out / 'sky-vulkan'
        flags = []
        if args.surface_test:
            flags=['-DSKY_XCB_SURFACE_TEST','-DVK_USE_PLATFORM_XCB_KHR'];target=out/'sky-vulkan-surface-test'
    subprocess.run([compiler, '-std=c++17', '-O2', '-Wall', '-Wextra', '-Wno-missing-field-initializers', '-I', str(tmp), *flags, str(root / 'native/vulkan-renderer.cpp'), linker, *(['-luser32'] if args.windows else ['-lxcb'] if args.surface_test else []), '-o', str(target)], check=True)
    print(target)
