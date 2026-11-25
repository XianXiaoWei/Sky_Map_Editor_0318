#!/usr/bin/env python3
"""SHA-gated direct native owner discovery for the pending dark-plant chain."""
import bisect,json,re,sys
from pathlib import Path
import capstone
from native import Native
n=Native(sys.argv[1])
terms=[b'Darkshroom',b'Darkstone.cpp',b'darkstoneLevel',b'darkstoneCount <= kMaxDarkStones',b'darkstoneCount < kMaxDarkstones',b'darkstoneBarn']
strings={}
for term in terms:
 at=0
 while True:
  at=n.data.find(term,at)
  if at<0:break
  vm=next(vm+at-fo for _,vm,fo,size in n.segments if fo<=at<fo+size)
  text=n.data[at:n.data.index(0,at)].decode(errors='replace')
  strings[vm]=text;at+=len(term)
_,start,size=next(s for s in n.sections if s[0]=='__text')
cs=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_64);cs.skipdata=True
refs=[]
for address,length,mnemonic,op in cs.disasm_lite(n.read(start,size),start):
 match=re.search(r'\[rip ([+-]) (0x[0-9a-f]+)\]',op)
 if not match:continue
 disp=int(match[2],16)*(1 if match[1]=='+' else -1);target=address+length+disp
 if target in strings:
  entry,end=n.bounds(address)
  refs.append({'instruction':hex(address),'function':hex(entry),'end':hex(end),'target':hex(target),'text':strings[target]})
files=[]
for address in sorted({int(r['function'],16) for r in refs}):
 file=f'evidence/dark-plant-owner-{address:x}.asm'
 Path(file).write_text(n.annotated(address));files.append(file)
report={'executableSha256':n.digest,'strings':{hex(a):s for a,s in strings.items()},'references':refs,'assembly':files,'scope':'Direct RIP-relative references to original Darkshroom/Darkstone owner strings and function boundaries; discovery only, no Darkstone load/update/plant-burning implementation claim.'}
Path('docs/dark-plant-owner-native-discovery.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps(report))
