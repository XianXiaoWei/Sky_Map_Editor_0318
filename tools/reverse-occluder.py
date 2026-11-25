#!/usr/bin/env python3
"""Recover Visibility registration, geometry submission and normal reads.

Disassembly establishes field use. Full software occlusion execution is not
claimed by this extractor; the fourth packed byte remains preserved/open.
"""
import json
import pathlib
import struct
import sys
from native import Native

n = Native(sys.argv[1])
functions = {'visibility-registration': 0x1007236a0,
             'visibility-initialize': 0x10071d660,
             'visibility-terminate': 0x10071d9b0,
             'visibility-resize': 0x10071d9f0,
             'visibility-update': 0x10071e020,
             'visibility-render-flush': 0x10071e7e0,
             'visibility-geometry-submit': 0x100720250,
             'visibility-transform-vertices': 0x10071e7f0,
             'visibility-triangle-depth': 0x10071ee60,
             'visibility-selected-triangles': 0x10071f790,
             'visibility-depth-mips': 0x100720560,
             'visibility-spheres': 0x100720dd0,
             'visibility-aabbs': 0x100721ce0,
             'visibility-depth-debug-upload': 0x100720a40}
for name, address in functions.items():
    pathlib.Path('evidence', name + '.asm').write_text(n.annotated(address))
report = {'executableSha256': n.digest, 'functions': {k: hex(v) for k, v in functions.items()},
          'scope': 'Complete bounded disassembly of registered Visibility methods and direct geometry/depth dependencies; runtime evidence records explicit original numeric and lifecycle snapshots, not actual loaders/game/GPU restoration.',
          'registration': {'Initialize': '0x10071d660', 'Terminate': '0x10071d9b0', 'Resize': '0x10071d9f0', 'Update': '0x10071e020', 'RenderFlush': '0x10071e7e0'},
          'levelData': {'countOffset': 220, 'recordsPointerOffset': 256,
                        'record': {'vertexCount': 0, 'indexCount': 4, 'vertices': 8, 'indices': 16},
                        'entry': '0x10071e418..0x10071e453 checks count and submits first record'},
          'vertex': {'stride': 16, 'position': {'offset': 0, 'float32Components': 3},
                     'signedNormalBytes': {'offset': 12, 'components': 3,
                                           'scalarReads': ['0x10071ecd0', '0x10071ecdd', '0x10071ecea'],
                                           'selectedTriangleReads': ['0x10071f8d2', '0x10071f8e1', '0x10071f8f0']},
                     'normalUse': 'raw signed integers multiplied by clip-depth-dependent bias before transformation; diagnostic /127 view is not the CPU algorithm',
                     'fourthByte': {'offset': 15, 'semantic': None, 'preserved': True}},
          'biasConstant': {'address': '0x100abcce0', 'float32': struct.unpack('<f', n.read(0x100abcce0, 4))[0]},
          'floatEnvironment': {'mxcsrOrMask': '0xe040', 'rounding': 'toward zero', 'ftz': True, 'daz': True,
                               'clearDepthPattern': [1.0, 1.0, 1.0, 1.0]},
          'runtimeEvidence': {},
          'unresolved': ['original hardware RCPPS and MIN/MAX denormal/payload behavior',
                         'actual Visibility loaded-resource loader/virtual services, Camera producer/defaults/module scheduling and query inputs/callers',
                         'diagnostic logging/rendering branches and actual scratch/heap lifetime',
                         'fourth normal-slot byte semantics, full LevelData loaded state and object DropOcclusion dependencies',
                         'real model/terrain/cloud culling, geometry generation and game validation']}
for label, file in [('floatTransformMip', 'visibility-oracle.json'), ('triangleRaster', 'visibility-raster-oracle.json'),
                    ('triangleClip', 'visibility-clip-oracle.json'), ('geometrySubmit', 'visibility-submit-oracle.json'),
                    ('sphereQuery', 'visibility-spheres-oracle.json'), ('aabbQuery', 'visibility-aabbs-oracle.json'),
                    ('lifecycle', 'visibility-lifecycle-oracle.json'), ('terrainFrustum', 'terrain-frustum-oracle.json'),
                    ('terrainBinLod', 'terrain-lod-oracle.json'), ('terrainBinDraw', 'terrain-bin-draw-oracle.json'),
                    ('terrainBinGeometry', 'terrain-bin-geometry-oracle.json'),
                    ('terrainBinLifecycle', 'terrain-bin-lifecycle-oracle.json')]:
    path = pathlib.Path('docs', file)
    if path.exists():
        evidence = json.loads(path.read_text())
        if evidence['executableSha256'] != n.digest: raise ValueError('Mismatched occluder oracle executable')
        report['runtimeEvidence'][label] = {'report': file, 'passed': evidence.get('passed') is True, 'scope': evidence['scope']}
pathlib.Path('docs/occluder-native.json').write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n')
print(json.dumps({'functions': len(functions), 'vertexStride': 16, 'signedNormalBytes': 3, 'fourthBytePreserved': True}))
