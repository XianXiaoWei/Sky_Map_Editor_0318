#!/usr/bin/env python3
"""SHA/boundary-gated registered resource name/type selection evidence."""
import json,pathlib,sys
from native import Native
from capstone.x86 import X86_OP_MEM,X86_OP_IMM,X86_REG_RIP
root=pathlib.Path(__file__).resolve().parent.parent;n=Native(sys.argv[1])
functions={'nameRange':0x1007c5970,'lookup':0x1007c4360,'typeById':0x1007abd30}
for name,address in functions.items():
 assert n.bounds(address)[0]==address
 (root/'evidence'/f'resource-lookup-{name}.asm').write_text(n.annotated(address))
address=functions['lookup'];length=18;instructions=[i for i in n.instructions(address) if i.address<address+length]
assert instructions[-1].address+instructions[-1].size==address+length
assert not any(op.type==X86_OP_MEM and op.mem.base==X86_REG_RIP or op.type==X86_OP_IMM and (i.mnemonic.startswith('j') or i.mnemonic=='call') for i in instructions for op in i.operands)
report={'executableSha256':n.digest,'functions':{k:hex(v) for k,v in functions.items()},'manager':{'nameTree':1064,'endSentinel':1072},'treeNode':{'left':0,'right':8,'parent':16,'namePointer':32,'resourcePointer':40},'selection':'Case-sensitive C-string equal range; iterate in tree order, compare exact asClass/fallback pointer, return freshly reloaded node resource. Null resource uses void metadata and can terminate with null on a class match. No subclass or filename extension matching.','lookupTracingPrefix':{'start':hex(address),'length':length,'bytes':n.read(address,length).hex(),'continuation':hex(address+length)},'scope':'Standalone complete nameRange/lookup/ID getter run unchanged; Model registry variant copies the PC-independent lookup prefix for call tracing and retains original tails/branches. Actual registration/allocation/bootstrap, metadata asClass/void/fallback internals, loading and full game remain open.'}
(root/'docs'/'resource-lookup-native.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report))
