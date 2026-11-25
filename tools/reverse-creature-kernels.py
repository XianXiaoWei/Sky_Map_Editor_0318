#!/usr/bin/env python3
import json,sys
from pathlib import Path
from native import Native
n=Native(sys.argv[1])
functions={'BirdFlocks.CreateFlock':0x10019bb70,'DarkCreatureBarn.CreateDarkCreature':0x10026c330,'DarkCreatureBarn.CreateSmallDarkCreature':0x10026c370,'DarkCreatureBarn.CreateSmallDarkCreatureZone':0x10026c3c0,'BirdV2.SetEnabled':0x10019feb0,'BirdV2.GetEnabled':0x10019fec0,'BirdFlock.SetEnabled':0x10019b500,'BirdFlock.GetEnabled':0x10019b510,'Crab.SetEnabled':0x100258270,'Crab.GetEnabled':0x100258280,'BirdV2Barn.OnLevelLoad':0x10019ff10,'CrabBarn.Initialize':0x10025ed50,'CrabBarn.OnLevelUnload':0x10025ed70,'DarkCreatureBarn.OnLevelUnload':0x10026c310}
functions.update({'Flame.SetEnabled':0x10033ac40,'Flame.GetEnabled':0x100340c10})
for name,a in functions.items():Path('evidence/creature-kernel-'+name+'.asm').write_text(n.annotated(a))
report={'executableSha256':n.digest,'functions':{name:hex(a) for name,a in functions.items()},'scope':'Complete four allocation kernels, six creature enabled accessors, four specified Barn reset bodies and Flame enabled accessors including disable/lit fade stores. Original bzero import bound to zeroing service; allocation bytes and exhaustion diagnostics preserved. No complete Barn initialization/resource load, gameplay, animation, AI, drawing or unload ownership claim.'}
Path('docs/creature-kernels-native.json').write_text(json.dumps(report,indent=2)+'\n')
