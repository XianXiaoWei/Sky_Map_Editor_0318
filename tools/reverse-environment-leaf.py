#!/usr/bin/env python3
"""SHA-gated normal environment helper evidence for the independent oracle."""
import json
import sys
from pathlib import Path
from native import Native

n = Native(sys.argv[1])
functions = {
    'PointLightBarn.Initialize': 0x1005408d0,
    'PointLightBarn.Create': 0x100540a20,
    'PointLightBarn.Release': 0x100540a90,
    'PointLightBarn.ReleaseAll': 0x1005409b0,
    'PointLightBarn.Gather': 0x100540c10,
    'PointLight.Attenuation': 0x100540ac0,
    'SetEmitterFlowRail.OnEnabled': 0x10052b1a0,
    'SetEmitterFlowRail.Update': 0x10052b280,
    'Rail.Construct': 0x1005626b0,
    'Rail.AllocateDataPoints': 0x10055b4a0,
    'DropOcclusion.Load': 0x1002ce410,
    'DropOcclusion.Unload': 0x1002ce460,
    'DropOcclusion.OnEnabled': 0x1002ce490,
    'DropOcclusion.Update': 0x1002ce7b0,
    'ObjectBarn.AddDropOcclusion': 0x1004d3940,
    'CloudBarn.AddDrop': 0x100416140,
    'SpawnMotes.SetTransform': 0x10047b370,
    'SpawnMotes.GetTransform': 0x10047b3a0,
}
out = Path('evidence')
for name, address in functions.items():
    (out / ('environment-leaf-' + name + '.asm')).write_text(n.annotated(address))
(out / 'environment-leaf-Ambience.PointPrefix.asm').write_text(n.annotated(0x10005aa10, code_end=0x10005aa80))
report = {
    'executableSha256': n.digest,
    'railColorAddress': '0x10203f660',
    'railColorScope': 'Dynamic startup Color bytes are an explicit service; saved/default color overrides this during loading.',
    'functions': {name: hex(address) for name, address in functions.items()},
    'prefix': {'Ambience.PointUniform': {'entry': '0x10005aa10', 'end': '0x10005aa80', 'scope': 'Ordinary point-color/intensity prefix; later gameplay overrides remain separate.'}},
    'cloudDrop': {'capacity': 512, 'stride': 48, 'minimumBits': n.read(0x100aabf50, 4).hex(), 'intensityScaleBits': n.read(0x100aa8620, 4).hex(), 'luminanceWeightsHex': n.read(0x100abc8a0, 16).hex()},
}
Path('docs/environment-leaf-native.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps({'functions': len(functions), 'prefixes': 1, 'executableSha256': n.digest}))
