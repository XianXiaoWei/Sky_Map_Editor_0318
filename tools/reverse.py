#!/usr/bin/env python3
"""Reproducible evidence extraction for the supplied Mac executable, not a game runtime.
Usage: python3 tools/reverse.py /path/to/Sky.app/Contents/MacOS/Sky
Requires capstone only for disassembly. Mach-O symbols are parsed directly here.
"""
import hashlib, json, pathlib, re, struct, sys
import capstone
from capstone.x86 import X86_OP_IMM, X86_OP_MEM, X86_OP_REG, X86_REG_RIP

binary_path = pathlib.Path(sys.argv[1])
data = binary_path.read_bytes()
if struct.unpack_from('<I', data)[0] != 0xfeedfacf:
    raise ValueError('Expected little-endian Mach-O 64')
segments, table, at = [], None, 32
for _ in range(struct.unpack_from('<I', data, 16)[0]):
    cmd, size = struct.unpack_from('<II', data, at)
    if cmd == 0x19:
        vm, vs, fo, fs = struct.unpack_from('<4Q', data, at + 24)
        segments.append((vm, fo, fs))
    if cmd == 2:
        table = struct.unpack_from('<4I', data, at + 8)
    at += size

def file_offset(address):
    for vm, fo, fs in segments:
        if vm <= address < vm + fs:
            return fo + address - vm
    return None

def string_at(address):
    p = file_offset(address)
    if p is None:
        return None
    s = data[p:data.find(b'\0', p, min(p + 4096, len(data)))]
    if s and len(s) < 4096 and all(32 <= c < 127 for c in s):
        return s.decode('ascii')
    return None

symbols, by_address = {}, {}
symoff, count, stroff, strsize = table
for i in range(count):
    strx, typ, sec, desc, value = struct.unpack_from('<IBBHQ', data, symoff + i * 16)
    end = data.index(0, stroff + strx)
    name = data[stroff + strx:end].decode('utf8', errors='replace')
    if value:
        symbols[name] = value
        by_address[value] = name

out = pathlib.Path('docs'); evidence = pathlib.Path('evidence')
out.mkdir(exist_ok=True); evidence.mkdir(exist_ok=True)
catalog = []
for name, addr in symbols.items():
    m = re.fullmatch(r'__ZTI13MetaClassImplI(\d+)([\w]+)E', name)
    if m and len(m[2]) == int(m[1]):
        catalog.append({'name': m[2], 'rttiAddress': hex(addr), 'behavior': '未复刻', 'evidence': 'Mac executable RTTI'})
catalog.sort(key=lambda x: x['name'])
categories = [('模型、资源与渲染', r'Mesh|Model|Material|Shader|Texture|Image|Compositor|Render|Resource|Sprite'), ('地形、云、水和环境', r'Terrain|Cloud|Ambience|Env|Fog|Water|Wind|Sky|Lighting|PointLight|Sun|Probe'), ('场景与路径基础', r'Marker|Rail|Clump|Transform|Level|WorldObject|Scene|Camera|AABB|Path'), ('交互、事件与任务', r'Event|Trigger|Quest|Door|Checkpoint|Candle|Action|Hint|Button|Interact|Play|Set|On|Spawn'), ('玩家、角色与动画', r'Avatar|Character|Anim|Creature|Bird|Fish|Crab|Skeleton|IK|Bone|Cloth'), ('物理与碰撞', r'Collision|Physics|Collider|Octree|Ray|Tess|Nav|Dimple'), ('网络、账号与平台', r'Net|Account|Friend|Social|Server|Http|Socket|Packet|Auth|Store|Purchase'), ('音频与特效', r'Sound|Audio|Emitter|Particle|Flame|Vfx|Fmod'), ('系统和其余类型', r'.')]
for item in catalog:
    item['category'] = next(label for label, regex in categories if re.search(regex, item['name'], re.I))
(out / 'classes.json').write_text(json.dumps(catalog, ensure_ascii=False, indent=2))

cs = capstone.Cs(capstone.CS_ARCH_X86, capstone.CS_MODE_64); cs.detail = True
for name, lo, hi in [('tgcl-loader', 0x40bc00, 0x40d470), ('level-writer', 0x3f1450, 0x3f3d00), ('serializer-bool', 0x76aae0, 0x76ac00)]:
    (evidence / (name + '.asm')).write_text('\n'.join(f'{i.address:#x}: {i.mnemonic} {i.op_str}' for i in cs.disasm(data[lo:hi], 0x100000000 + lo)))

# Locate the global MetaClass pointer returned by each type getter.
getters, globals_to_classes = {}, {}
for name, addr in symbols.items():
    m = re.fullmatch(r'__Z18GetMetaClassByTypeIP(\d+)([\w]+)ERK9MetaClassv', name)
    if not m or len(m[2]) != int(m[1]):
        continue
    p = file_offset(addr)
    for inst in list(cs.disasm(data[p:p + 16], addr))[:4]:
        if inst.mnemonic == 'mov' and len(inst.operands) == 2 and inst.operands[1].type == X86_OP_MEM and inst.operands[1].mem.base == X86_REG_RIP:
            target = inst.address + inst.size + inst.operands[1].mem.disp
            getters[addr] = m[2]; globals_to_classes[target] = m[2]

# RIP-relative stores reveal registration functions. Analyze only straight-line scalar
# assignments; unsupported instructions never contribute invented property types.
initializers = {}
for prefix in [b'\x48\x89\x05', b'\x48\x89\x0d', b'\x48\x89\x1d', b'\x4c\x89\x05']:
    p = 0
    while True:
        p = data.find(prefix, p + 1)
        if p < 0 or p >= 0xaa1d96:
            break
        address = 0x100000000 + p + 7 + struct.unpack_from('<i', data, p + 3)[0]
        if address in globals_to_classes:
            start = data.rfind(b'\x55\x48\x89\xe5', max(8592, p - 50000), p)
            if start >= 0:
                initializers.setdefault(start, set()).add(globals_to_classes[address])

def regname(inst, reg):
    name = inst.reg_name(reg)
    if name.startswith('e'):
        name = 'r' + name[1:]
    if re.fullmatch(r'r\d+d', name):
        name = name[:-1]
    return name

properties = {}
for start, class_names in initializers.items():
    regs, memory = {}, {}
    instructions = []
    def address(inst, op):
        if op.mem.base == X86_REG_RIP:
            return inst.address + inst.size + op.mem.disp
        base = regs.get(regname(inst, op.mem.base))
        if base is None or op.mem.index:
            return None
        return base + op.mem.disp
    def value(inst, op):
        if op.type == X86_OP_IMM:
            return op.imm
        if op.type == X86_OP_REG:
            return regs.get(regname(inst, op.reg))
        if op.type == X86_OP_MEM:
            addr = address(inst, op)
            if addr is None:
                return None
            if addr in memory:
                return memory[addr]
            p = file_offset(addr)
            if p is not None and p + op.size <= len(data):
                return int.from_bytes(data[p:p + op.size], 'little')
        return None
    for inst in cs.disasm(data[start:start + 150000], 0x100000000 + start):
        instructions.append(f'{inst.address:#x}: {inst.mnemonic} {inst.op_str}')
        ops = inst.operands
        if inst.mnemonic in ['mov', 'lea'] and len(ops) == 2:
            v = address(inst, ops[1]) if inst.mnemonic == 'lea' and ops[1].type == X86_OP_MEM else value(inst, ops[1])
            if ops[0].type == X86_OP_REG:
                reg = regname(inst, ops[0].reg)
                if v is None:
                    regs.pop(reg, None)
                else:
                    regs[reg] = v
            elif ops[0].type == X86_OP_MEM and v is not None:
                addr = address(inst, ops[0])
                if addr is not None:
                    memory[addr] = v
        elif inst.mnemonic == 'add' and len(ops) == 2 and ops[0].type == X86_OP_REG:
            reg = regname(inst, ops[0].reg); v = value(inst, ops[1])
            if reg in regs and v is not None:
                regs[reg] += v
            else:
                regs.pop(reg, None)
        elif inst.mnemonic == 'call':
            for reg in ['rax', 'rcx', 'rdx', 'rsi', 'rdi', 'r8', 'r9', 'r10', 'r11']:
                regs.pop(reg, None)
        elif inst.mnemonic == 'ret':
            break
    for addr, name_ptr in memory.items():
        class_name = getters.get(memory.get(addr + 48))
        type_getter = by_address.get(memory.get(addr + 40), '')
        name = string_at(name_ptr)
        offset = memory.get(addr + 32)
        if class_name and name and type_getter.startswith('__Z17GetMetaTypeByTypeI') and isinstance(offset, int) and 0 <= offset < 1000000:
            properties.setdefault(class_name, {})[name] = {'typeGetter': type_getter, 'nativeOffset': offset, 'registrationFunction': hex(0x100000000 + start), 'propertyAddress': hex(addr)}
    for name in class_names & {'Marker', 'LevelParameters', 'LevelMesh', 'Rail', 'Clump', 'LevelMaterial', 'EnvNode'}:
        (evidence / (name + '-registration.asm')).write_text('\n'.join(instructions))
(out / 'native-properties.json').write_text(json.dumps(properties, ensure_ascii=False, indent=2))
(out / 'binary-evidence.json').write_text(json.dumps({'sha256': hashlib.sha256(data).hexdigest(), 'architecture': 'Mach-O x86_64', 'rttiMetaClassCount': len(catalog), 'registrationFunctions': len(initializers), 'classesWithConfirmedPropertyTypes': len(properties), 'confirmedProperties': sum(map(len, properties.values())), 'warning': 'Property metadata is not executable class behavior. No unsupported instruction is treated as evidence.'}, ensure_ascii=False, indent=2))
print(f'{len(catalog)} RTTI classes; {len(properties)} classes / {sum(map(len, properties.values()))} confirmed registered properties')
