"""SHA-gated cloud viewport bindings and original constructor defaults."""
import json,pathlib,struct,sys
from native import Native
n=Native(sys.argv[1]);root=pathlib.Path(__file__).resolve().parent.parent
for name,address in [('cloud-env-constructor',0x100215a20),('cloud-meta-and-tweaks',0x100215c10)]:
 (root/'evidence'/f'{name}.asm').write_text(n.annotated(address))
report={'executableSha256':n.digest,'cloudEnvConstructor':{'address':'0x100215a20','writes':'8 zero bytes at destination; undulationScale +4 = 0'},
 'tweaks':{name:{'address':hex(address),'value':struct.unpack('<f',n.read(address,4))[0]} for name,address in [('noiseDepth',0x100c95814),('sparkle',0x100c95818),('translucentDepth',0x100c9581c),('windMult',0x100c95824)]},
 'cloudMaterial':{'load':'0x100212a40','materialId':80,'rgb':'MaterialDefBarn.GetDef(0x50).color','alpha':'BstBaked.meshes sunOcclusionScale'},
 'screenNoise':{'u_texBlueNoise':{'resource':'NoiseBlue3Ch','resolve':'0x10023d67c','bind':'0x10023d81b','filter':'nearest','gamma':'ImageDefs default enabled; see original comment'},'u_texPerturb':{'resource':'HeatTex','source':'Heat.png','resolve':'0x10023d6e1','bind':'0x10023d855','gamma':False}},
 'cameraQuery':{'call':'0x100212722','mode':'r8=1','parameters':'[max(noiseDepth,.001), queryDistance + max(noiseDepth,.001), translucentDepth, sparkle]','parameterWrite':'0x10021277c','verification':'cloud-camera-query-oracle.json'},
 'scope':'Read-only original binding/constant/constructor evidence. Map CloudEnvParams uses spatial autoStart evaluation. Camera r8=1 and Update parameter bytes verified separately in cloud-camera-query-oracle.json. Original compositor luminance feedback remains unverified.'}
(root/'docs/cloud-preview-parameters.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n');print(json.dumps(report))
