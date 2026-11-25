#!/usr/bin/env python3
"""SHA-gated evidence for Objects.level.bin FlowerPatch/CandleObject/Water."""
import json,sys
from pathlib import Path
from native import Native
n=Native(sys.argv[1])
functions={
 'FlowerBarn.CreateFlowerPatch':0x10034f110,
 'FlowerBarn.OnLevelUnload':0x10034f050,
 'CandleBarn.CreateCandleObject':0x1001ea9e0,
 'CandleObject.SetTransform':0x1001e8c10,
 'CandleObject.GetTransform':0x1001e8c40,
 'CandleObject.SetEnabled':0x1001e8cb0,
 'CandleObject.GetEnabled':0x1001e8cd0,
 'Ocean.CreateWater':0x1004d5eb0,
}
for name,a in functions.items():Path('evidence/object-effects-'+name+'.asm').write_text(n.annotated(a))
# Save registration owners: the serialized classes delegate to these Barns.
for name,a in [('Flower',0x100353900),('Candle',0x1001ee240),('Ocean',0x1004d82c0)]:
 Path('evidence/object-effects-'+name+'-registration.asm').write_text(n.annotated(a))
report={'executableSha256':n.digest,'functions':{k:hex(v) for k,v in functions.items()},
 'owners':{'FlowerPatch':{'owner':'FlowerBarn','Initialize':'0x10034e2b0','Update':'0x10034e530','OnLevelLoad':'0x10034f030','OnLevelUnload':'0x10034f050','BuildScene':'0x10034f090','RenderFlush':'0x10034f0e0','Create':'0x10034f110'},
 'CandleObject':{'owner':'CandleBarn','Initialize':'0x1001e8d00','Create':'0x1001ea9e0','Update':'0x1001e9ba0','OnLevelLoad':'0x1001e9320','OnLevelUnload':'0x1001e99c0','RenderFlush':'0x1001ea220'},
 'Water':{'owner':'Ocean','Initialize':'0x1004d4270','OnLevelLoad':'0x1004d4910','OnLevelUnload':'0x1004d50e0','Update':'0x1004d5190','BuildScene':'0x1004d5e50','RenderFlush':'0x1004d5e80','Create':'0x1004d5eb0'}},
 'scope':'Checked native Barn allocation kernels and Candle matrix/enabled accessors; TGCL metadata/defaults, resources, full owner construction and actual effect drawing remain separate.'}
Path('docs/object-effects-native.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({'functions':len(functions),'executableSha256':n.digest}))
