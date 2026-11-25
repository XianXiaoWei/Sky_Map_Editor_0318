#!/usr/bin/env python3
"""Narrow, fail-closed translator for recovered Sky cloud and depth AIR stages.

Preserves SSA operations, explicit half conversions, uniform field casts and
parallel phi assignments. This is a reconstruction, not Metal GPU acceptance.
External interfaces stay float32; half SSA results are explicitly rounded.
"""
import argparse, collections, hashlib, json, pathlib, re, struct

PROGRAM_PAIRS = {
    'CloudCore': ('CloudCore0', 'CloudCore0'),
    'CloudFluffy': ('CloudFluffy0', 'CloudFluffy0'),
    'CloudFluffySuperCoarse': ('CloudFluffy54734', 'CloudFluffy54734'),
    'CloudFluffyCoarse': ('CloudFluffy62865', 'CloudFluffy62865'),
    'DepthDownsample': ('Fullscreen45204', 'DepthDownsample45204'),
    'DepthDownsampleGather': ('Fullscreen3593', 'DepthDownsample3593'),
    'DepthDownsampleQuarter': ('Fullscreen5322', 'DepthDownsample5322'),
    'CloudCard': ('CloudCard0', 'CloudCard0'),
    'CloudQuadParticleFluffy': ('FlatCloud11244', 'FlatCloud11244'),
}
VARYING_LOCATIONS = {'v_rayVecSize': 0, 'v_bMinU': 1, 'v_bMaxV': 2, 'v_uv': 0,
    'v_color': 3, 'v_eye': 4, 'v_norm': 5, 'v_worldPos': 6, 'v_alphaMult': 7, 'v_closenessToSurface': 8,
    'v_frame2Weight': 9, 'v_radius': 10, 'v_fragDepth': 11, 'v_softParticleScale': 12, 'v_uvVel': 13, 'v_externalLighting': 14}

# Recovered CloudBarn/Noise texture descriptors: original bytes/formats stay
# bound. Explicit float32 filtering avoids software-driver UNORM8 lerp truncation.
CLOUD_SAMPLERS = {
    'u_cloudSparse': (False, False), 'u_cloudDist': (True, False),
    'u_cloudAmb0': (True, False), 'u_cloudAmb1': (True, False),
    'u_cloudAmb2': (True, False), 'u_cloudNoise3D': (True, True),
}
SAMPLER_SOURCE = '''
ivec3 air_texel_coord(ivec3 p, ivec3 size, bool repeat) {
  // The only recovered repeating cloud resource is the power-of-two 64^3
  // CloudFluffy volume. Integer masking also handles its negative coordinates.
  return repeat ? (p & (size-1)) : clamp(p,ivec3(0),size-1);
}
vec4 air_sample3d(sampler3D image,vec3 uv,ivec3 offset,bool linear,bool repeat) {
  ivec3 size=textureSize(image,0);
  precise vec3 p=uv*vec3(size)+vec3(offset)-(linear?vec3(0.5):vec3(0.0));
  ivec3 base=ivec3(floor(p));
  if(!linear) return texelFetch(image,air_texel_coord(base,size,repeat),0);
  precise vec3 f=p-vec3(base);
  vec4 a000=texelFetch(image,air_texel_coord(base,size,repeat),0);
  vec4 a100=texelFetch(image,air_texel_coord(base+ivec3(1,0,0),size,repeat),0);
  vec4 a010=texelFetch(image,air_texel_coord(base+ivec3(0,1,0),size,repeat),0);
  vec4 a110=texelFetch(image,air_texel_coord(base+ivec3(1,1,0),size,repeat),0);
  vec4 a001=texelFetch(image,air_texel_coord(base+ivec3(0,0,1),size,repeat),0);
  vec4 a101=texelFetch(image,air_texel_coord(base+ivec3(1,0,1),size,repeat),0);
  vec4 a011=texelFetch(image,air_texel_coord(base+ivec3(0,1,1),size,repeat),0);
  vec4 a111=texelFetch(image,air_texel_coord(base+ivec3(1,1,1),size,repeat),0);
  precise vec4 x00=a000*(1.0-f.x)+a100*f.x;
  precise vec4 x10=a010*(1.0-f.x)+a110*f.x;
  precise vec4 x01=a001*(1.0-f.x)+a101*f.x;
  precise vec4 x11=a011*(1.0-f.x)+a111*f.x;
  precise vec4 y0=x00*(1.0-f.y)+x10*f.y;
  precise vec4 y1=x01*(1.0-f.y)+x11*f.y;
  precise vec4 z=y0*(1.0-f.z)+y1*f.z;
  return z;
}
'''


def split(text):
    result, start, depth, quoted = [], 0, 0, False
    for i, c in enumerate(text):
        if c == '"': quoted = not quoted
        if quoted: continue
        if c in '<[({': depth += 1
        if c in '>])}': depth -= 1
        if c == ',' and depth == 0: result.append(text[start:i].strip()); start = i + 1
    result.append(text[start:].strip())
    return result


def typed(text):
    m = re.match(r'(<\d+ x \w+>|\[\d+ x \w+\]|ptr(?: addrspace\(\d+\))?|%"[^"]+"|%[\w.]+|half|float|i\d+)\s+(.+)$', text)
    if not m: raise ValueError('Unsupported typed operand: ' + text)
    t, value = m.groups()
    if t.startswith('ptr'): t = 'ptr'; value = re.sub(r'^(?:(?:readonly|readnone|captures\(none\))\s+)+', '', value)
    return t, value


def vector(t):
    m = re.fullmatch(r'<(\d+) x (\w+)>', t)
    return (int(m[1]), m[2]) if m else (1, t)


def gltype(t):
    n, scalar = vector(t)
    names = {'float': ('float', 'vec'), 'half': ('float16_t', 'f16vec'), 'i1': ('bool', 'bvec'), 'i32': ('int', 'ivec'), 'i64': ('int', 'ivec')}
    if scalar not in names or n > 4: raise ValueError('Unsupported GLSL type ' + t)
    return names[scalar][0] if n == 1 else names[scalar][1] + str(n)


def float_type(t):
    n, _ = vector(t)
    return 'float' if n == 1 else 'vec' + str(n)


def literal(t, value):
    n, scalar = vector(t)
    if value in ('undef', 'poison', 'zeroinitializer'): return gltype(t) + '(0)' if scalar != 'i1' else gltype(t) + '(false)'
    if n > 1:
        if value.startswith('splat ('):
            st, sv = typed(value[7:-1]); assert st == scalar
            return gltype(t) + '(' + literal(st, sv) + ')'
        if not value.startswith('<') or not value.endswith('>'): raise ValueError('Unsupported vector constant ' + value)
        lanes = [typed(v) for v in split(value[1:-1])]
        if len(lanes) != n or any(st != scalar for st, _ in lanes): raise ValueError('Vector constant type mismatch')
        return gltype(t) + '(' + ', '.join(literal(st, v) for st, v in lanes) + ')'
    if scalar == 'i1':
        if value not in ('true', 'false', '0', '1'): raise ValueError('Unsupported bool ' + value)
        return 'true' if value in ('true', '1') else 'false'
    if scalar in ('i32', 'i64'):
        number = int(value)
        if not -2147483648 <= number <= 2147483647: raise ValueError('64-bit integer outside the supported loop-index range')
        return str(number)
    if value.startswith('0xH'): number = struct.unpack('>e', bytes.fromhex(value[3:]))[0]
    elif value.startswith('0x'): number = struct.unpack('>d', bytes.fromhex(value[2:]))[0]
    else: number = float(value)
    if scalar == 'float': number = struct.unpack('f', struct.pack('f', number))[0]
    raw = repr(number)
    return 'float16_t(' + raw + ')' if scalar == 'half' else raw


class Translator:
    def __init__(self, source, stage, sampler_bindings, contract_fast='none'):
        self.source, self.stage, self.bindings = source, stage, sampler_bindings
        self.types, self.values, self.pointers, self.aggregates = {}, {}, {}, {}
        self.input_names = {}
        self.declarations, self.interfaces, self.uniforms, self.outputs = [], [], {}, []
        self.opcodes, self.padding_loads = collections.Counter(), []
        self.contract_fast = contract_fast
        self.fast_products, self.contractions = {}, []
        self.structs = {}
        for name, members in re.findall(r'^(%[^=]+?) = type (.+)$', source, re.M):
            packed = members.startswith('<{'); members = members[2:-2] if packed else members[1:-1]
            self.structs[name.strip()] = (split(members), packed)
        self.metadata = dict(re.findall(r'^!(\d+) = !\{(.*)\}$', source, re.M))
        match = re.search(r'^define (.+?) @\w+\((.*)\) #\d+ \{\n(.*?)^}', source, re.M | re.S)
        if not match: raise ValueError('Missing AIR entry point')
        self.return_type, args, self.body = match.groups()
        self.uses = collections.Counter(re.findall(r'%\d+', '\n'.join(line.split('=',1)[-1].split(';',1)[0] for line in self.body.splitlines())))
        self.args = [typed(a) for a in split(args)]
        self.entry_block = str(len(self.args))
        # AIR's metadata is authoritative for argument ordering and field names.
        entry = re.search(r'!air\.(?:vertex|fragment) = !\{!(\d+)\}', source)
        _, outs, ins = split(self.metadata[entry[1]])
        for out in split(self.metadata[outs[1:]]):
            row = self.metadata[out[1:]]; name = re.search(r'!"air.arg_name", !"([^"]+)"', row)[1]
            typ = re.search(r'!"air.arg_type_name", !"([^"]+)"', row)[1]
            slot = re.search(r'!"air.render_target", i32 (\d+)', row)
            self.outputs.append((name, typ, int(slot[1]) if slot else None))
        for inp in split(self.metadata[ins[1:]]):
            row = self.metadata[inp[1:]]; index = int(re.match(r'i32 (\d+)', row)[1])
            t, ident = self.args[index]; name = re.search(r'!"air.arg_name", !"([^"]+)"', row)[1]
            self.types[ident] = t
            if '!"air.buffer"' in row:
                layout = self.metadata[re.search(r'!"air.struct_type_info", !(\d+)', row)[1]]
                fields = split(layout) if layout.strip() else []
                if len(fields) % 5: raise ValueError('Invalid AIR uniform metadata layout')
                for at in range(0, len(fields), 5):
                    offset, size, _, kind, field = fields[at:at+5]
                    self.uniforms[int(offset.split()[-1])] = (kind[2:-1], field[2:-1], int(size.split()[-1]))
                self.pointers[ident] = ('uniform', 0, None)
            elif '!"air.texture"' in row:
                dimension = re.search(r'texture([23])d', row)[1]
                self.interfaces.append(f'layout(set=0,binding={self.bindings[name]}) uniform sampler{dimension}D {name};')
                self.values[ident] = name
            elif '!"air.sampler"' in row: self.values[ident] = name
            elif '!"air.vertex_id"' in row:
                if stage != 'vert' or t != 'i32' or name != 'gl_VertexID': raise ValueError('Unsupported vertex builtin')
                self.values[ident] = 'gl_VertexIndex'
            else:
                self.values[ident] = name
                if name != 'gl_FragCoord':
                    location = int(re.search(r'!"air.location_index", i32 (\d+)', row)[1]) if stage == 'vert' else VARYING_LOCATIONS[name]
                    external = float_type(t) if vector(t)[1] == 'half' else gltype(t)
                    self.interfaces.append(f'layout(location={location}) in {external} {name};')
                    if vector(t)[1] == 'half':
                        self.input_names[ident] = name
                        self.values[ident] = f'{gltype(t)}(air_quantize({name}))'
        self.constants = {}
        for name, count, vals in re.findall(r'^@(\w+) = .*?constant \[(\d+) x float\] \[(.*?)\], align', source, re.M):
            self.constants[name] = [literal(*typed(v)) for v in split(vals)]
            if len(self.constants[name]) != int(count): raise ValueError('Constant array size mismatch')
            self.pointers['@' + name] = ('constant', name, None)

    def layout(self, typ):
        n, scalar = vector(typ)
        sizes = {'i8': 1, 'i16': 2, 'i32': 4, 'i64': 8, 'float': 4, 'half': 2}
        if scalar in sizes:
            size = sizes[scalar] * (4 if n == 3 else n)
            return size, size
        arr = re.fullmatch(r'\[(\d+) x (.+)\]', typ)
        if arr:
            size, align = self.layout(arr[2]); return int(arr[1]) * size, align
        members, packed = self.structs[typ]; end, alignment = 0, 1
        for member in members:
            size, align = self.layout(member); align = 1 if packed else align
            end = (end + align - 1) // align * align + size; alignment = max(alignment, align)
        return (end + alignment - 1) // alignment * alignment, alignment

    def struct_offset(self, typ, index):
        members, packed = self.structs[typ]; at = 0
        for i, member in enumerate(members):
            size, align = self.layout(member); align = 1 if packed else align
            at = (at + align - 1) // align * align
            if i == index: return at, member
            at += size
        raise ValueError('GEP struct index out of bounds')

    def value(self, typ, val):
        if val.startswith('%'):
            if self.types.get(val) != typ: raise ValueError('SSA type mismatch ' + val + ': ' + typ)
            return self.values[val]
        return literal(typ, val)

    def operand(self, text):
        t, v = typed(text); return t, self.value(t, v)

    def declare(self, dest, typ):
        if dest in self.types and self.types[dest] != typ: raise ValueError('SSA definition type mismatch ' + dest)
        self.types[dest] = typ; self.values[dest] = 'r' + dest[1:]
        self.declarations.append(f'{gltype(typ)} {self.values[dest]};')

    def load(self, typ, ident):
        root, offset, index = self.pointers[ident]
        if root == 'constant': return 'c_' + offset + '[' + index + ']'
        kind, name, size = self.uniforms[offset]
        count = vector(typ)[0]
        if 'x' in kind:
            if index is None or typ != '<4 x float>': raise ValueError('Unsupported matrix load')
            return name + '[' + index + ']'
        components = int(kind[-1]) if kind[-1].isdigit() else 1
        expr = name
        if count > components:
            if components != 3 or count != 4: raise ValueError('Unsupported padding load')
            self.padding_loads.append({'offset': offset, 'uniform': name, 'type': typ, 'paddingLane': 3})
            expr = 'vec4(' + name + ', 0.0)'
        return expr

    def instruction(self, line):
        m = re.match(r'(%\d+) = (.*)', line); dest, text = m.groups() if m else (None, line)
        text = re.sub(r', !\w+ !\d+', '', text)
        text = re.sub(r'^(?:tail )?call ', 'call ', text)
        op, rest = text.split(' ', 1); self.opcodes[op] += 1
        if op == 'getelementptr':
            operands = split(rest.removeprefix('inbounds ')); typ = operands[0]; _, ident = typed(operands[1]); indices = [typed(x)[1] for x in operands[2:]]
            if indices.pop(0) != '0': raise ValueError('Nonzero GEP root')
            root, offset, index = self.pointers[ident]
            for at in indices:
                if typ in self.structs:
                    delta, typ = self.struct_offset(typ, int(at)); offset += delta
                else:
                    arr = re.fullmatch(r'\[(\d+) x (.+)\]', typ)
                    if not arr or index is not None: raise ValueError('Unsupported nested GEP')
                    index = self.value('i64' if at.startswith('%') else 'i32', at); typ = arr[2]
            self.pointers[dest] = (root, offset, index); self.types[dest] = 'ptr'; return []
        if op == 'bitcast':
            src, dst = rest.split(' to '); t, ident = typed(src)
            if t != 'ptr' or not dst.startswith('ptr'): raise ValueError('Unsupported nonpointer bitcast')
            self.pointers[dest] = self.pointers[ident]; self.types[dest] = 'ptr'; return []
        if op == 'load':
            typ, pointer, *_ = split(rest); _, ident = typed(pointer); expr = self.load(typ, ident)
        elif op in ('shl', 'ashr'):
            left, right = split(rest.removeprefix('exact ')); typ, lv = self.operand(left)
            if typ != 'i32' or right.startswith('%') or not 0 <= int(right) < 32: raise ValueError('Unsupported shift type/count')
            expr = f'int(uint({lv}) << {right}u)' if op == 'shl' else f'({lv} >> {right})'
        elif op in ('fmul', 'fadd', 'fsub', 'fdiv', 'add', 'and', 'or'):
            fast = rest.startswith('fast ')
            rest = re.sub(r'^(?:(?:fast|nuw|nsw) )+', '', rest)
            left, right = split(rest); typ, lv = self.operand(left); rv = self.value(typ, right)
            if vector(typ)[1] == 'half': lv, rv = float_type(typ) + '(' + lv + ')', float_type(typ) + '(' + rv + ')'
            sign = {'fmul':'*', 'fadd':'+', 'fsub':'-', 'fdiv':'/', 'add':'+', 'and':'&&' if typ == 'i1' else '&', 'or':'||' if typ == 'i1' else '|'}[op]
            expr = f'({lv} {sign} {rv})'
            if fast and op == 'fmul': self.fast_products[dest] = (typ, lv, rv)
            if fast and op in ('fadd','fsub') and (self.contract_fast == 'all' or vector(typ)[1] == self.contract_fast):
                for ident, other, left_side in [(typed(left)[1],rv,True),(right,lv,False)]:
                    product = self.fast_products.get(ident)
                    if product and product[0] == typ and self.uses[ident] == 1:
                        _, a, b = product
                        if op == 'fsub':
                            if left_side: other = '-(' + other + ')'
                            else: a = '-(' + a + ')'
                        expr = f'fma({a}, {b}, {other})'
                        self.contractions.append({'product':ident,'consumer':dest,'type':typ,'operation':op})
                        break
        elif op in ('fptrunc', 'fpext', 'sext'):
            src, typ = rest.split(' to '); _, val = self.operand(src); expr = val if vector(typ)[1] == 'half' else gltype(typ) + '(' + val + ')'
        elif op in ('fcmp', 'icmp'):
            predicate, operands = rest.split(' ', 1); left, right = split(operands); operand_type, lv = self.operand(left); rv = self.value(operand_type, right)
            cmp = {'olt':'<', 'ult':'<', 'slt':'<', 'ogt':'>', 'ugt':'>', 'sgt':'>', 'ole':'<=', 'ule':'<=', 'sle':'<=', 'oge':'>=', 'uge':'>=', 'sge':'>=', 'oeq':'==', 'eq':'==', 'one':'!=', 'une':'!=', 'ne':'!='}
            if predicate not in cmp: raise ValueError('Unsupported comparison ' + predicate)
            n, _ = vector(operand_type); typ = 'i1' if n == 1 else f'<{n} x i1>'
            if n == 1: expr = f'({lv} {cmp[predicate]} {rv})'
            else: expr = {'<':'lessThan', '>':'greaterThan', '<=':'lessThanEqual', '>=':'greaterThanEqual', '==':'equal', '!=':'notEqual'}[cmp[predicate]] + f'({lv}, {rv})'
            # AIR fast-math explicitly excludes NaNs; ordered/unordered forms
            # agree for those valid inputs. Infinity/NaN inputs aren't accepted.
        elif op == 'select':
            condition, yes, no = split(rest); ct, cv = self.operand(condition); typ, yv = self.operand(yes); nt, nv = self.operand(no)
            if nt != typ or ct != 'i1': raise ValueError('Unsupported vector select')
            expr = f'({cv} ? {yv} : {nv})'
        elif op == 'extractelement':
            src, lane = split(rest); vt, val = self.operand(src); typ = vector(vt)[1]; _, idx = self.operand(lane); expr = val + '[' + idx + ']'
        elif op == 'insertelement':
            src, val, lane = split(rest); typ, old = self.operand(src); st, value = self.operand(val); _, idx = self.operand(lane)
            if st != vector(typ)[1]: raise ValueError('Insert type mismatch')
            self.declare(dest, typ); return [f'{self.values[dest]} = {old};', f'{self.values[dest]}[{idx}] = {value};']
        elif op == 'shufflevector':
            first, second, mask = split(rest); vt, av = self.operand(first); st, bv = self.operand(second); mt, mv = typed(mask)
            if vt != st: raise ValueError('Shuffle type mismatch')
            n, scalar = vector(vt); m, _ = vector(mt); typ = f'<{m} x {scalar}>'
            indices = ['0'] * m if mv == 'zeroinitializer' else [typed(x)[1] for x in split(mv[1:-1])]
            if len(indices) != m: raise ValueError('Shuffle mask mismatch')
            lanes = [literal(scalar, '0') if i in ('poison', 'undef') else f'{av if int(i) < n else bv}[{int(i) % n}]' for i in indices]
            expr = gltype(typ) + '(' + ', '.join(lanes) + ')'
        elif op == 'phi':
            typ, entries = typed(rest)
            pairs = [split(x[1:-1]) for x in split(entries)]
            seen = {}
            for value, block in pairs:
                if block in seen and seen[block] != value: raise ValueError('Conflicting phi values for one predecessor')
                seen[block] = value
            if typ == 'ptr':
                pointers = [self.pointers[value] for value, block in pairs]
                if any(p != pointers[0] for p in pointers): raise ValueError('Nonaliasing pointer phi')
                self.pointers[dest] = pointers[0]; self.types[dest] = 'ptr'; return []
            expr = self.value(typ, pairs[-1][0])
            for value, block in reversed(pairs[:-1]): expr = f'(_prev == {block[1:]} ? {self.value(typ, value)} : {expr})'
            return [('phi', dest, typ, expr)]
        elif op == 'call':
            call = re.match(r'(.+?) @(air\.[\w.]+)\((.*)\)(?: #\d+)?$', rest)
            if not call: raise ValueError('Unsupported call ' + rest)
            typ, name, params = call.groups(); typ = typ.removeprefix('zeroext '); rawargs = split(params)
            if name.startswith('air.sample_texture_'):
                _, tex = typed(rawargs[0]); _, smp = typed(rawargs[1]); _, uv = self.operand(rawargs[2])
                if self.values[smp] != '_mtlsmp_' + self.values[tex]: raise ValueError('Independent AIR sampler unsupported')
                tail = rawargs[3:]
                if len(tail) != 4 or typed(tail[0])[1] != 'true' or typed(tail[2])[1] not in ('true', 'false') or float(typed(tail[3])[1]) != 0: raise ValueError('Unsupported sample mode')
                # Implicit vertex sampling uses LOD zero; GLSL's optional
                # texture bias overload only exists in fragment stages.
                function = 'textureLod' if self.stage == 'vert' or typed(tail[2])[1] == 'true' else 'texture'
                if self.values[tex] in CLOUD_SAMPLERS:
                    if 'texture_3d' not in name: raise ValueError('Cloud texture dimension mismatch')
                    linear, repeat = CLOUD_SAMPLERS[self.values[tex]]
                    offset = literal(*typed(tail[1])); function = 'air_sample3d'
                    args = f'{self.values[tex]}, {uv}, {offset}, {str(linear).lower()}, {str(repeat).lower()}'
                elif typed(tail[1])[1] == 'zeroinitializer': args = f'{self.values[tex]}, {uv}, 0.0'
                else:
                    ot, ov = typed(tail[1])
                    if ov.startswith('%'): raise ValueError('Dynamic sample offset unsupported')
                    offset = literal(ot, ov); function += 'Offset'
                    args = f'{self.values[tex]}, {uv}, 0.0, {offset}' if function == 'textureLodOffset' else f'{self.values[tex]}, {uv}, {offset}, 0.0'
                expr = float_type(typ) + f'({function}({args}))'
            else:
                args = [self.operand(x)[1] for x in rawargs]
                if vector(typ)[1] == 'half': args = [float_type(typed(x)[0]) + '(' + v + ')' for x, v in zip(rawargs, args)]
                intrinsic = name.split('.')[1].removeprefix('fast_')
                functions = {'dot':'dot', 'rsqrt':'inversesqrt', 'sqrt':'sqrt', 'sin':'sin', 'cos':'cos', 'pow':'pow', 'fmin':'min', 'fmax':'max', 'clamp':'clamp', 'floor':'floor', 'fract':'fract', 'fabs':'abs', 'log':'log', 'log2':'log2', 'exp2':'exp2', 'mix':'mix', 'any':'any', 'all':'all'}
                if name == 'air.convert.f.f32.u.i1': functions['convert'] = 'float'
                if intrinsic not in functions: raise ValueError('Unsupported AIR intrinsic ' + name)
                expr = functions[intrinsic] + '(' + ', '.join(args) + ')'
        elif op == 'insertvalue':
            aggregate, field, index = split(rest); _, base = typed(aggregate); ft, value = self.operand(field)
            values = list(self.aggregates[base]) if base != 'undef' else [None] * len(self.outputs)
            values[int(index)] = value; self.aggregates[dest] = values; return []
        elif op == 'ret':
            _, ident = typed(rest); values = self.aggregates[ident]
            if any(v is None for v in values): raise ValueError('Undefined output')
            return [f'{name} = {self.external_type(kind)}({value});' for (name, kind, _), value in zip(self.outputs, values)] + ['return;']
        elif op == 'br':
            parts = split(rest)
            if len(parts) == 1: target = parts[0].removeprefix('label %')
            else:
                _, cond = self.operand(parts[0]); target = f'({cond} ? {parts[1].removeprefix("label %")} : {parts[2].removeprefix("label %")})'
            return [f'_prev = _block; _block = {target}; break;']
        elif op == 'switch':
            match = re.fullmatch(r'(i32\s+[^,]+), label %(\d+) \[(.*)\]', rest)
            if not match: raise ValueError('Unsupported switch')
            selector, default, cases = match.groups(); _, value = self.operand(selector)
            rows = re.findall(r'i32 (-?\d+), label %(\d+)', cases)
            if re.sub(r'i32 -?\d+, label %\d+', '', cases).strip() or len({int(n) for n, _ in rows}) != len(rows): raise ValueError('Invalid switch cases')
            target = default
            for number, block in reversed(rows): target = f'({value} == {literal("i32",number)} ? {block} : {target})'
            return [f'_prev = _block; _block = {target}; break;']
        else: raise ValueError('Unsupported instruction ' + line)
        # Explicit bit rounding happens before assigning to the half register.
        # A pack/unpack around an already-half value is optimized away by some
        # software drivers, which promote half registers without quantization.
        if vector(typ)[1] == 'half': expr = gltype(typ) + '(air_quantize(' + float_type(typ) + '(' + expr + ')))'
        self.declare(dest, typ); return [f'{self.values[dest]} = {expr};']

    @staticmethod
    def external_type(kind):
        if 'x' in kind: return 'mat4'
        return 'vec' + kind[-1] if kind[-1].isdigit() else 'float'

    def translate(self):
        # Predeclare SSA registers so backedges and loop phi values can refer
        # to later definitions. Pointer/aggregate definitions stay symbolic.
        saved_value = self.value
        def forward_value(typ, val):
            if val.startswith('%') and val not in self.types:
                self.types[val] = typ; self.values[val] = 'r' + val[1:]
            return saved_value(typ, val)
        self.value = forward_value
        blocks, current = collections.OrderedDict(), self.entry_block
        blocks[current] = []
        pending = []
        for line in self.body.splitlines():
            line = line.split(';', 1)[0].strip()
            if not line: continue
            if pending or line.startswith('switch '):
                pending.append(line)
                if not line.endswith(']'): continue
                line = ' '.join(pending); pending = []
            if line.endswith(':'): current = line[:-1]; blocks[current] = []; continue
            try: blocks[current].extend(self.instruction(line))
            except Exception as e: raise ValueError(line + '\n' + str(e)) from e
        if pending: raise ValueError('Unterminated switch')
        for name, kind, location in self.outputs:
            if name != 'gl_Position':
                loc = location if self.stage == 'frag' else VARYING_LOCATIONS[name]
                self.interfaces.append(f'layout(location={loc}) out {self.external_type(kind)} {name};')
        lines = ['#version 450', '#extension GL_EXT_shader_explicit_arithmetic_types_float16 : require', '// Generated from original Metal AIR. GPU equivalence remains unverified.']
        lines += ['''float air_quantize(float v) {
  uint bits = floatBitsToUint(v), magnitude = bits & 0x7fffffffu;
  if (magnitude >= 0x7f800000u) return v;
  if (magnitude < 0x38800000u) {
    float q = roundEven(abs(v) * 16777216.0) * 0.000000059604644775390625;
    return uintBitsToFloat((bits & 0x80000000u) | floatBitsToUint(q));
  }
  uint rounded = magnitude + 0xfffu + ((magnitude >> 13u) & 1u);
  if (rounded >= 0x47800000u) rounded = 0x7f800000u;
  return uintBitsToFloat((bits & 0x80000000u) | (rounded & 0x7fffe000u));
}''']
        for n in range(2, 5): lines.append(f'vec{n} air_quantize(vec{n} v) {{ return vec{n}(' + ', '.join(f'air_quantize(v[{c}])' for c in range(n)) + '); }')
        lines.append(SAMPLER_SOURCE)
        lines += self.interfaces
        lines += [f'uniform {self.external_type(kind)} {name};' for kind, name, _ in self.uniforms.values()]
        lines += [f'const float c_{name}[{len(vals)}] = float[]({", ".join(vals)});' for name, vals in self.constants.items()]
        for instructions in blocks.values():
            for instruction in instructions:
                if isinstance(instruction, tuple):
                    _, dest, typ, _ = instruction; self.declare(dest, typ); self.declarations.append(f'{gltype(typ)} p{dest[1:]};')
        lines += ['void main() {'] + ['  ' + line for line in self.declarations]
        lines += [f'  int _block = {self.entry_block}; int _prev = -1;', '  for (;;) {', '    switch (_block) {']
        for block, instructions in blocks.items():
            lines.append(f'    case {block}: {{')
            phis = [i for i in instructions if isinstance(i, tuple)]
            for _, dest, _, expr in phis: lines.append(f'      p{dest[1:]} = {expr};')
            for _, dest, _, _ in phis: lines.append(f'      {self.values[dest]} = p{dest[1:]};')
            lines.extend('      ' + i for i in instructions if isinstance(i, str))
            lines.append('    }')
        lines += ['    default: return;', '    }', '  }', '}']
        return '\n'.join(lines) + '\n'


def main():
    parser = argparse.ArgumentParser(); parser.add_argument('--output', type=pathlib.Path, default=pathlib.Path('evidence/cloud-air-vulkan'))
    parser.add_argument('--data', type=pathlib.Path)
    parser.add_argument('--contract-fast', choices=['none','half','float','all'], default='half', help='Contraction permitted by original AIR fast flags; half is validated with full cloud stages and LLVM FMA probes')
    args = parser.parse_args(); root = pathlib.Path(__file__).resolve().parent.parent
    args.output.mkdir(parents=True, exist_ok=True)
    rows = []
    for name, pair in PROGRAM_PAIRS.items():
        sources = {stage: (root / 'evidence' / f'{program}.{stage}.air.ll').read_text() for stage, program in zip(['vert', 'frag'], pair)}
        samplers = sorted(set(re.findall(r'!"air.texture".*?!"air.arg_name", !"([^"]+)"', '\n'.join(sources.values()))))
        bindings = {name: i + 1 for i, name in enumerate(samplers)}
        for stage, source in sources.items():
            program = pair[0 if stage == 'vert' else 1]
            translator = Translator(source, stage, bindings, args.contract_fast); text = translator.translate(); file = args.output / f'{program}.{stage}'
            file.write_text(text)
            rows.append({'program': program, 'stage': stage, 'source': f'evidence/{program}.{stage}.air.ll', 'sourceSha256': hashlib.sha256(source.encode()).hexdigest(), 'generatedSha256': hashlib.sha256(text.encode()).hexdigest(), 'opcodes': dict(translator.opcodes), 'paddingLoads': translator.padding_loads, 'bindings': bindings, 'contractions': translator.contractions})
    report = {'scope': 'AIR SSA operation/type reconstruction. Half operations evaluated in float32 and explicitly rounded RTE using bits before each float16 SSA assignment; original float32 operations unchanged. Original CloudBarn 3D nearest/linear clamp/repeat descriptors implemented with float32 texelFetch interpolation over unchanged R8/RGBA8 bytes, avoiding software-driver UNORM8 filter truncation. Parallel phi; original Metal projection; float32 external interfaces. Undef/poison and uniform padding use deterministic zero; unused padding requires separate liveness verification. Fast math intrinsics use Vulkan builtins, whose hardware approximation is not guaranteed equal to Metal. Original Metal hardware interpolation and game images remain separate acceptance checks.', 'stages': rows, 'gpuParityVerified': False}
    report['contractFast'] = args.contract_fast
    report['scope'] = 'AIR operation/type reconstruction. Half arithmetic uses float32 and explicit RTE before half assignments. Recorded single-use fast multiply followed by fast add/sub uses FMA when enabled, skipping intermediate product rounding as permitted by original fast flags. Original cloud 3D descriptors use float32 texelFetch interpolation over unchanged upload bytes. Parallel phi, Metal projection and float32 external interfaces retained. Undef/poison and padding use deterministic zero. Vulkan fast intrinsics and contraction choices are not guaranteed equal to original Metal hardware or game images.'
    (args.output / 'manifest.json').write_text(json.dumps(report, indent=2) + '\n')
    data = args.data or next((p for p in [root/'reference/Sky.app/Contents/Data', pathlib.Path('/storage/emulated/0/Download/地图编辑器/sky-map-editor/reference/Sky.app/Contents/Data')] if p.is_dir()), None)
    if data is None: raise ValueError('Original Data is required to hash the GLES program pair for the embedded AIR runtime bundle; provide --data')
    runtime = {}
    for name, pair in PROGRAM_PAIRS.items():
        runtime[name] = {stage: {'file': f'{prefix}.{stage}',
            'glesSha256': hashlib.sha256((data/'Shaders/Bin'/f'{prefix}.{stage}').read_bytes()).hexdigest(),
            'generatedSha256': hashlib.sha256((args.output/f'{prefix}.{stage}').read_bytes()).hexdigest(),
            'text': (args.output/f'{prefix}.{stage}').read_text()} for stage, prefix in zip(['vert','frag'],pair)}
    (args.output/'runtime.json').write_text(json.dumps(runtime,indent=2)+'\n')
    print(json.dumps({'translatedStages': len(rows), 'instructions': sum(sum(r['opcodes'].values()) for r in rows), 'output': str(args.output), 'gpuParityVerified': False}))


if __name__ == '__main__': main()
