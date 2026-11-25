"""SHA-gated call-body evidence; runtime translations are checked separately."""
import hashlib
import json
import pathlib
import sys
from native import Native

exe = sys.argv[1] if len(sys.argv) > 1 else '/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/MacOS/Sky'
n = Native(exe)
functions = {
    'Critter_Shout.OnEnabled': 0x100266350,
    'Critter_SendMsg.Update': 0x100264fd0,
    'SetDarkCreaturesMusicFloat.Update': 0x1002744a0,
    'BirdV2ParamSwap.OnEnabled': 0x1001aa160,
    'SetBirdGuidesEnabled.OnEnabled': 0x1001a99e0,
    'SetDarkCreaturesNetworked.OnEnabled': 0x100274080,
    'BirdV2AiSwap.OnEnabled': 0x1001a9dc0,
    'BirdV2AiSwap.Update': 0x1001a9df0,
    'AwakenDarkCreatures.Update': 0x100273c50,
    'SetFlame.OnEnabled': 0x100343270,
    'SetFlame.Update': 0x100343280,
    'OnFlame.Update': 0x100342910,
    'SetFlameOccIntensity.Update': 0x1003439a0,
}
rows = {}
for name, address in functions.items():
    start, end = n.bounds(address)
    evidence = 'evidence/nature-event-' + name + '.asm'
    pathlib.Path(evidence).write_text(n.annotated(address))
    rows[name] = {'address': hex(address), 'end': hex(end), 'sha256': hashlib.sha256(n.read(start, end-start)).hexdigest(), 'evidence': evidence}
services = {}
for name, address in {'Meta.SetEnabled': 0x1004d1f60, 'Flame.Extinguish': 0x10033a780}.items():
    evidence = 'evidence/nature-event-' + name + '.asm'
    pathlib.Path(evidence).write_text(n.annotated(address))
    services[name] = {'address': hex(address), 'evidence': evidence, 'scope': 'Explicit injected service in event oracle; full original implementation/integration is separate'}
report = {'executableSha256': n.digest, 'functions': rows, 'services': services,
          'constants': {hex(a): n.read(a, 4).hex() for a in [0x100aa50c0, 0x100aa50c4, 0x100aa6a9c, 0x100aa6aa0, 0x100aa70e4, 0x100aa77e8, 0x100aa77f0, 0x100aaa4a8]},
          'scope': 'Whole normal call bodies, with original metadata/reflection/Event.Start/authority/extinguish boundaries. Barn and prepared shared storage are separately validated; full creature/Flame/Candle rendering and gameplay are not established.'}
pathlib.Path('docs/nature-events-native.json').write_text(json.dumps(report, indent=2) + '\n')
print(json.dumps({'functions': len(rows), 'executableSha256': n.digest}))
