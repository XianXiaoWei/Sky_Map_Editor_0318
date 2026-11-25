#!/usr/bin/env python3
"""SHA/boundary-gated ResourceRef normal execution and tracing prefixes."""
import json,pathlib,sys
from native import Native
from capstone.x86 import X86_OP_MEM,X86_OP_IMM,X86_REG_RIP
root=pathlib.Path(__file__).resolve().parent.parent;n=Native(sys.argv[1])
functions={'constructor':0x1007c2530,'observe':0x1007c2310,'destructor':0x1007c2570,'cleanup':0x1007c2600}
for name,address in functions.items():
 assert n.bounds(address)[0]==address
 (root/'evidence'/f'resource-ref-{name}.asm').write_text(n.annotated(address))
prefixes={}
for name,length in [('constructor',19),('observe',16),('destructor',16)]:
 address=functions[name];instructions=[i for i in n.instructions(address) if i.address<address+length]
 assert instructions[-1].address+instructions[-1].size==address+length
 assert not any(op.type==X86_OP_MEM and op.mem.base==X86_REG_RIP or op.type==X86_OP_IMM and (i.mnemonic.startswith('j') or i.mnemonic=='call') for i in instructions for op in i.operands)
 prefixes[name]={'start':hex(address),'bytes':n.read(address,length).hex(),'length':length,'continuation':None if name=='constructor' else hex(address+length)}
report={'executableSha256':n.digest,'functions':{k:hex(v) for k,v in functions.items()},'refLayout':{'requiredConstructorBytes':25,'handle':0,'next':8,'previous':16,'observed':24},'resourceLayout':{'embeddedHandle':64,'head':64,'tail':72,'resourcePointer':80},'virtualCallbacks':{'beforeDestroy':'0x30','afterObserveInsertion':'0x38','beforeReobserveRemoval':'0x40'},'connectedTracingPrefixes':prefixes,'scope':'Standalone original bodies execute unchanged at original addresses. Connected Model consumer traces calls using exact instruction-aligned PC-independent prefixes and original tails. Constructor writes 25 bytes; normal cleanup/destructor clear 24 and retain observed byte. Virtual callback implementations, resource allocation/manager lookup, concurrent state, unwind/terminate and full game remain open.'}
(root/'docs'/'resource-ref-native.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report))
