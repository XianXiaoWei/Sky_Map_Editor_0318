#!/usr/bin/env python3
"""Recover actual TGCL missing-property defaults from native tag construction.

Tracks scalar and packed pointer stores in straight-line registration code.
Unknown bytes/instructions do not contribute values. The full native loader
explicitly searches Tool_DefaultValue only when a property is absent from the
serialized class declaration (0x10040c820..0x10040cf30).
"""
import json
import pathlib
import re
import struct
import sys
import subprocess
import tempfile
from capstone import CS_AC_WRITE
from capstone.x86 import X86_OP_IMM, X86_OP_MEM, X86_OP_REG, X86_REG_RIP
from native import Native

n = Native(sys.argv[1])
props = json.loads(pathlib.Path('docs/native-properties.json').read_text())
memory, provenance = {}, {}

def track(start):
    regs = {'rsp': list((0x700000000000).to_bytes(8, 'little'))}
    def canonical(name):
        if name.startswith(('xmm', 'ymm')): return 'xmm' + name[3:]
        aliases = {'eax':'rax', 'ecx':'rcx', 'edx':'rdx', 'ebx':'rbx', 'esp':'rsp', 'ebp':'rbp', 'esi':'rsi', 'edi':'rdi', 'al':'rax', 'cl':'rcx', 'dl':'rdx', 'bl':'rbx'}
        return aliases.get(name, name[:-1] if re.fullmatch(r'r\d+d', name) else name)
    def read(addr, size):
        if addr is None: return [None]*size
        try: original = list(n.read(addr, size))
        except StopIteration: original = [None]*size
        return [memory.get(addr+i, original[i]) for i in range(size)]
    def number(value):
        return int.from_bytes(bytes(value), 'little') if value and all(v is not None for v in value) else None
    def address(ins, op):
        if op.mem.base == X86_REG_RIP: return ins.address + ins.size + op.mem.disp
        base = number(regs.get(canonical(ins.reg_name(op.mem.base)), []))
        if base is None or op.mem.index: return None
        return base + op.mem.disp
    def value(ins, op, size):
        if op.type == X86_OP_IMM: return list((op.imm & ((1 << (8*size))-1)).to_bytes(size, 'little'))
        if op.type == X86_OP_REG: return (regs.get(canonical(ins.reg_name(op.reg)), []) + [None]*size)[:size]
        if op.type == X86_OP_MEM: return read(address(ins, op), size)
        return [None]*size
    def assign(ins, op, data):
        if op.type == X86_OP_REG:
            name = ins.reg_name(op.reg); data = data[:op.size]
            if name.startswith(('xmm', 'ymm')): data = (data + [0]*16)[:16]
            elif op.size == 4: data += [0]*4
            regs[canonical(name)] = data
        elif op.type == X86_OP_MEM:
            at = address(ins, op)
            if at is not None:
                for i, byte in enumerate(data): memory[at+i] = byte; provenance[at+i] = hex(ins.address)
    instructions=n.instructions(start)
    for instruction_index,ins in enumerate(instructions):
        ops = ins.operands
        if ins.mnemonic == 'lea' and len(ops)==2:
            at=address(ins, ops[1]); assign(ins, ops[0], list(at.to_bytes(8, 'little')) if at is not None else [None]*8)
        elif ins.mnemonic in ('mov', 'vmovaps', 'vmovups', 'vmovdqa', 'vmovdqu', 'vmovq', 'vmovd') and len(ops)==2:
            size = min(ops[0].size, ops[1].size) if ins.mnemonic in ('vmovq', 'vmovd') else ops[0].size
            assign(ins, ops[0], value(ins, ops[1], size))
        elif ins.mnemonic == 'vpunpcklqdq' and len(ops)==3:
            assign(ins, ops[0], value(ins, ops[1], 8) + value(ins, ops[2], 8))
        elif ins.mnemonic in ('add', 'sub') and len(ops)==2 and ops[0].type==X86_OP_REG:
            a,b=number(value(ins,ops[0],ops[0].size)),number(value(ins,ops[1],ops[0].size))
            v=None if a is None or b is None else ((a+b if ins.mnemonic=='add' else a-b) & ((1 << (ops[0].size*8))-1))
            assign(ins,ops[0],[None]*ops[0].size if v is None else list(v.to_bytes(ops[0].size,'little')))
        elif ins.mnemonic in ('xor','vxorps') and len(ops)>=2 and all(op.type==X86_OP_REG for op in ops) and ops[-1].reg==ops[-2].reg:
            assign(ins,ops[0],[0]*ops[0].size)
        elif ins.mnemonic == 'call':
            for reg in ['rax','rcx','rdx','rsi','rdi','r8','r9','r10','r11'] + [f'xmm{i}' for i in range(16)]: regs.pop(reg,None)
        elif ins.mnemonic == 'push':
            rsp=number(regs['rsp'])-8; regs['rsp']=list(rsp.to_bytes(8,'little'))
            for i,byte in enumerate(value(ins,ops[0],8)): memory[rsp+i]=byte
        elif ins.mnemonic == 'pop':
            rsp=number(regs['rsp']); assign(ins,ops[0],read(rsp,8)); regs['rsp']=list((rsp+8).to_bytes(8,'little'))
        elif ins.mnemonic.startswith('j'):
            if ins.mnemonic=='jmp' and all(i.mnemonic=='nop' for i in instructions[instruction_index+1:]):break
            raise ValueError('Registration extractor requires straight-line code')
        else:
            for op in ops:
                if op.access & CS_AC_WRITE: assign(ins,op,[None]*op.size)
    def integer(at): return number(read(at,8))
    return integer

wind_mode = '--wind' in sys.argv
beamo_mode = '--beamo' in sys.argv
all_environment_mode = '--all-environment' in sys.argv
creature_mode = '--creatures' in sys.argv
item_mode = '--items' in sys.argv
scene_mode = '--scene-events' in sys.argv
move_mode = '--move-rail' in sys.argv
registration = 0x10019a320 if beamo_mode else 0x10032ca80 if wind_mode else 0x10031e7c0
class_names = ['Beamo','BeamoDecal'] if beamo_mode else ['Wind'] if wind_mode else ['EnvNode','SetEnvDefault','SetEnvHull']
if all_environment_mode or creature_mode or item_mode or scene_mode or move_mode:
    class_names = ['MoveObjectAlongRail'] if move_mode else ['OnRegion', 'PlayAnimation', 'Delay', 'Enable'] if scene_mode else list(json.loads(pathlib.Path('docs/'+('object-item' if item_mode else 'creature' if creature_mode else 'environment')+'-construction.json').read_text())['classes'])
    registrations = sorted({int(prop['registrationFunction'],16) for name in class_names for prop in props[name].values()})
    for address in registrations:
        integer = track(address)
else:
    registrations = [registration]
    integer = track(registration)
classes={}
for name in class_names:
    defaults={}
    for field,prop in props[name].items():
        property_addr=int(prop['propertyAddress'],16); at=integer(property_addr+8); seen=set()
        while at:
            if at in seen: raise ValueError('Cyclic tag list')
            seen.add(at); key=integer(at); val=integer(at+8)
            if key and n.string(key)=='Tool_DefaultValue':
                if not val or n.string(val) is None: raise ValueError(f'Unresolved default {name}.{field}')
                text=n.string(val); getter=prop['typeGetter']
                if getter.endswith('TypeIbERK8MetaTypev') and text in ('true','false'):
                    encoded=struct.pack('B',int(text=='true'))
                elif getter.endswith('TypeIfERK8MetaTypev') and re.fullmatch(r'[+-]?\d+(?:\.\d+)?f?',text):
                    # strtod in 0x10040cabd consumes the numeric prefix of
                    # original tags such as Darkstone's "0.05f".
                    encoded=struct.pack('<f',float(text.removesuffix('f')))
                elif (all_environment_mode or creature_mode or item_mode or scene_mode or move_mode) and 'TypeIP' in getter and text in ('null','NULL'):
                    # 0x10040ca60..0x10040ca93 accepts these exact spellings
                    # and zeros the cached pointer payload before size-8 copy.
                    encoded=bytes(8)
                elif getter.endswith('TypeIjERK8MetaTypev') and re.fullmatch(r'\d+',text):
                    encoded=struct.pack('<I',int(text))
                elif getter.endswith('TypeIhERK8MetaTypev') and re.fullmatch(r'\d+',text) and 0<=int(text)<=255:
                    encoded=struct.pack('B',int(text))
                elif getter.endswith('TypeIiERK8MetaTypev') and re.fullmatch(r'[+-]?\d+(?:\.0+)?',text):
                    # Original scalar loader first parses strtod. Limit this
                    # extractor to integral decimal values, including "0.0".
                    encoded=struct.pack('<i',int(float(text)))
                elif getter.endswith('TypeI14CandleMeshTypeERK8MetaTypev') and text=='kCandleMesh_Default':
                    # Original enum registration at 0x1001ee7ef..0x1001ee842
                    # pairs this exact name with an allocated 4-byte zero. Reject
                    # a changed table rather than infer an enum from its name.
                    enum_entry=0x101ddeb78
                    if n.string(integer(enum_entry))!=text: raise ValueError('Candle mesh enum identity differs')
                    store=next(i for i in n.instructions(0x1001ee240) if i.address==0x1001ee82e)
                    if store.mnemonic!='mov' or store.op_str!='dword ptr [rax], 0': raise ValueError('Candle mesh enum value differs')
                    encoded=struct.pack('<i',store.operands[1].imm)
                elif 'TypeI5ColorE' in getter or 'Vector3E' in getter:
                    values=[float(v) for v in text.translate(str.maketrans('(),{}','     ')).split()]
                    if not 1<=len(values)<=4: raise ValueError('Unresolved native vector default')
                    encoded=struct.pack('<4f',*(values+[0]*(4-len(values))))
                elif wind_mode or beamo_mode or all_environment_mode or creature_mode or item_mode or move_mode:
                    # Retain NULL/reference or other native tags as unresolved;
                    # a tag string does not prove runtime reference resolution.
                    encoded=None
                else: raise ValueError(f'Unsupported default representation {name}.{field}: {text}')
                defaults[field]={'text':text,'encodedHex':encoded.hex() if encoded is not None else None,'nativeOffset':prop['nativeOffset'],'typeGetter':getter,
                    'defaultConversionResolved':encoded is not None,
                    'propertyAddress':prop['propertyAddress'],'tagAddress':hex(at),'valuePointer':hex(val),'storeInstruction':provenance[at+8]}
                if getter.endswith('TypeI14CandleMeshTypeERK8MetaTypev') and encoded is not None:
                    defaults[field].update(enumValueStore='0x1001ee82e',enumNameStore='0x1001ee7f6')
                break
            at=integer(at+16)
    classes[name]=defaults
pathlib.Path('evidence/tgcl-loader-complete.asm').write_text(n.annotated(0x10040bc00))
report={'executableSha256':n.digest,'registrationFunction':hex(registration),'loaderFunction':'0x10040bc00',
    'absentPropertySearch':'0x10040c820..0x10040c8e1','scalarParse':'0x10040ca9f..0x10040cc73',
    'vectorParse':'0x10040cc78..0x10040cec3','classes':classes,
    'rule':'apply tags only to native properties absent from serialized class; serialized bytes always win',
    'scope':'raw public-field Tool_DefaultValue tags of '+', '.join(class_names)+'; not a complete constructor, private-state initialization or enabled-event lifecycle'}
prefix = 'beamo' if beamo_mode else 'wind' if wind_mode else 'environment'
if all_environment_mode or creature_mode or item_mode or scene_mode or move_mode:
    prefix = 'move-object-along-rail' if move_mode else 'scene-event' if scene_mode else 'object-item' if item_mode else 'creature-objects' if creature_mode else 'environment-objects'
    report['registrationFunctions'] = [hex(address) for address in registrations]
    del report['registrationFunction']
pathlib.Path(f'docs/{prefix}-defaults.json').write_text(json.dumps(report,ensure_ascii=False,indent=2)+'\n')
if '--oracle' in sys.argv:
    vector_defaults={v['text']:v['encodedHex'] for defaults in classes.values() for v in defaults.values() if v['encodedHex'] is not None and len(v['encodedHex'])==32}
    for stub,expected in [(0x100aa2c90,0x100c0ef40),(0x100aa2c7e,0x100c0ef28),(0x100aa2cba,0x100c0ef78)]:
        ins=next(n.cs.disasm(n.read(stub,6),stub))
        if ins.address+ins.size+ins.operands[0].mem.disp!=expected: raise ValueError('Unexpected native import binding')
    records=b''.join(text.encode().ljust(128,b'\0') for text in vector_defaults)
    with tempfile.TemporaryDirectory(prefix='sky-defaults-') as temp:
        runner=pathlib.Path(temp,'oracle')
        subprocess.run(['x86_64-linux-gnu-gcc','-O2','-static','tools/native-env-default-oracle.c','-o',str(runner)],check=True)
        result=subprocess.run(['qemu-x86_64','-cpu','max',str(runner),sys.argv[1]],input=records,capture_output=True,check=True)
    if len(result.stdout)!=16*len(vector_defaults): raise ValueError('Default parser output length mismatch')
    for i,(text,encoded) in enumerate(vector_defaults.items()):
        if result.stdout[i*16:(i+1)*16].hex()!=encoded: raise ValueError(f'Native vector default differs: {text}')
    pathlib.Path(f'docs/{prefix}-default-oracle.json').write_text(json.dumps({'executableSha256':n.digest,'functionRange':'0x10040cc78..0x10040cec3',
        'cases':len(vector_defaults),'vectors':vector_defaults,'runtime':'QEMU x86_64 -cpu max; unmodified original vector default parsing instructions',
        'dependencies':'original macOS strncpy/strlen/strtof imports bound to Linux libc; synthetic metadata size and parser escape callbacks; no complete TGCL load'},indent=2)+'\n')
print(json.dumps({name:{f:v['text'] for f,v in defaults.items()} for name,defaults in classes.items()},ensure_ascii=False))
