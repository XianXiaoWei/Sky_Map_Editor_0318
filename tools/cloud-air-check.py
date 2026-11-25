#!/usr/bin/env python3
"""Execute the original AIR instruction bodies on CPU and compare Vulkan.

Only target/entry names are changed in the IR; original SSA/branches/casts are
compiled directly by LLVM. Intrinsics use explicit CPU math/sampler helpers.
This isolates translator bugs; it is not original Metal/game acceptance.
"""
import argparse, array, ctypes as C, hashlib, importlib.util, json, math, pathlib, re, struct, subprocess, tempfile

ROOT = pathlib.Path(__file__).resolve().parent.parent
module = importlib.util.spec_from_file_location('air_translator', ROOT / 'tools/air-to-vulkan.py')
air = importlib.util.module_from_spec(module); module.loader.exec_module(air)
F32 = C.c_float


def ctype(t):
    n, scalar = air.vector(t)
    if t.startswith('ptr'): return 'void*'
    if scalar == 'float': return 'float' if n == 1 else 'F' + str(n)
    if scalar == 'half': return '_Float16' if n == 1 else 'H' + str(n)
    if scalar == 'i1': return 'bool' if n == 1 else 'B' + str(n)
    if scalar == 'i32': return 'int' if n == 1 else 'I' + str(n)
    raise ValueError('Unsupported intrinsic C type ' + t)


def information(file):
    source = pathlib.Path(file).read_text(); stage = 'vert' if '.vert.' in file else 'frag'
    # Metadata parsing is shared; CPU never executes translator-generated math.
    samplers = re.findall(r'!"air.texture".*?!"air.arg_name", !"([^"]+)"', source)
    t = air.Translator(source, stage, {n: i + 1 for i, n in enumerate(sorted(samplers))})
    fields = t.structs[t.return_type][0]
    names = [t.input_names.get(ident, t.values.get(ident)) for _, ident in t.args]
    return {'source': source, 'stage': stage, 'args': t.args, 'names': names, 'fields': fields, 'packedReturn': t.structs[t.return_type][1], 'uniforms': t.uniforms, 'outputs': t.outputs, 'textures': sorted(samplers)}


def intrinsic(name, result, params):
    args = [p.strip().split(' ', 1)[0] if p.startswith('ptr') else p.strip().removeprefix('zeroext ') for p in air.split(params)]
    proto = ', '.join(ctype(t) + f' a{i}' for i, t in enumerate(args))
    declaration = f'{ctype(result)} fn_{name.replace(".", "_")}({proto}) __asm__("{name}");\n'
    header = f'{ctype(result)} fn_{name.replace(".", "_")}({proto}) {{ '
    n, scalar = air.vector(result)
    operation = name.split('.')[1].removeprefix('fast_')
    if operation.startswith('sample_texture_'):
        dimensions = 2 if '2d' in operation else 3
        uv = '(F3){a2[0],a2[1],0}' if dimensions == 2 else 'a2'
        offset = '(I3){a4[0],a4[1],0}' if dimensions == 2 else 'a4'
        body = f'F4 v = sample((Texture*)a0, {uv}, {offset}, {dimensions}); return '
        body += '(H4){(_Float16)v[0],(_Float16)v[1],(_Float16)v[2],(_Float16)v[3]};' if scalar == 'half' else 'v;'
    elif operation == 'any': body = 'return a0[0] || a0[1];'
    elif operation == 'dot':
        count, st = air.vector(args[0]); terms = [f'(a0[{i}] * a1[{i}])' for i in range(count)]
        body = f'return ({ctype(result)})(' + ' + '.join(terms) + ');'
    else:
        expressions = []
        for lane in range(n):
            vs = [f'a{i}[{lane}]' if air.vector(t)[0] > 1 else f'a{i}' for i, t in enumerate(args)]
            op = {'fmin':'fminf','fmax':'fmaxf','floor':'floorf','fabs':'fabsf','sin':'sinf','cos':'cosf','pow':'powf','sqrt':'sqrtf','log':'logf','log2':'log2f','exp2':'exp2f'}.get(operation)
            if op: expression = op + '(' + ', '.join(vs) + ')'
            elif operation == 'rsqrt': expression = f'(1.f / sqrtf({vs[0]}))'
            elif operation == 'fract': expression = f'({vs[0]} - floorf({vs[0]}))'
            elif operation == 'clamp': expression = f'fminf(fmaxf({vs[0]}, {vs[1]}), {vs[2]})'
            elif operation == 'mix': expression = f'({vs[0]} * (1.f - {vs[2]}) + {vs[1]} * {vs[2]})'
            elif name == 'air.convert.f.f32.u.i1': expression = f'({vs[0]} ? 1.f : 0.f)'
            else: raise ValueError('Unsupported CPU AIR intrinsic ' + name)
            expressions.append(f'({ctype(scalar)})({expression})')
        body = 'return ' + (expressions[0] if n == 1 else f'({ctype(result)})' + '{' + ','.join(expressions) + '}') + ';'
    return declaration + header + body + ' }\n'


def entry_bridge(info, name, ident):
    # AIR direct aggregate/vector calls differ from Clang's C ABI lowering,
    # including both packed float4/float2 and single half2 return structures.
    # Only four pointers cross the FFI. Reconstruct arguments and extract the
    # untouched entry's results in LLVM with its exact signature.
    source = info['source']
    return_type, args = re.search(r'^define (.+?) @\w+\((.*)\) #\d+ \{', source, re.M).groups()
    abi_types = [re.match(r'(ptr(?: addrspace\(\d+\))?|<\d+ x \w+>|half|float|i\d+)', a)[1] for a in air.split(args)]
    lines = re.findall(r'^%[^=]+ = type .+$', source, re.M)
    lines += [f'declare {return_type} @{name}(' + ', '.join(abi_types) + ')',
              f'define void @run_{ident}(ptr %inputs, ptr %uniforms, ptr %textures, ptr %out) {{']
    call_args, at = [], 0
    for i, ((typ, _), arg, abi) in enumerate(zip(info['args'], info['names'], abi_types)):
        if typ == 'ptr':
            value = '%uniforms'
            if arg is not None:
                index = info['textures'].index(arg.removeprefix('_mtlsmp_'))
                lines += [f'  %texAt{i} = getelementptr ptr, ptr %textures, i32 {index}', f'  %tex{i} = load ptr, ptr %texAt{i}, align 8']
                value = f'%tex{i}'
            if abi != 'ptr':
                lines.append(f'  %arg{i} = addrspacecast ptr {value} to {abi}'); value = f'%arg{i}'
        else:
            count, scalar = air.vector(typ); value = 'poison'
            for lane in range(count):
                lines += [f'  %inAt{at} = getelementptr float, ptr %inputs, i32 {at}', f'  %in{at} = load float, ptr %inAt{at}, align 4']
                lane_value = f'%in{at}'
                if scalar != 'float':
                    if scalar == 'half': operation = f'fptrunc float {lane_value} to half'
                    elif scalar in ('i32', 'i64'): operation = f'fptosi float {lane_value} to {scalar}'
                    elif scalar == 'i1': operation = f'fcmp une float {lane_value}, 0.0'
                    else: raise ValueError('Unsupported AIR bridge argument ' + typ)
                    lane_value = f'%converted{at}'; lines.append(f'  {lane_value} = {operation}')
                if count > 1:
                    lines.append(f'  %arg{i}_{lane} = insertelement {typ} {value}, {scalar} {lane_value}, i32 {lane}'); value = f'%arg{i}_{lane}'
                else: value = lane_value
                at += 1
        call_args.append(f'{abi} {value}')
    lines.append(f'  %result = call {return_type} @{name}(' + ', '.join(call_args) + ')')
    at = 0
    for i, typ in enumerate(info['fields']):
        lines.append(f'  %field{i} = extractvalue {return_type} %result, {i}')
        count, scalar = air.vector(typ)
        for lane in range(count):
            value = f'%field{i}'
            if count > 1:
                value = f'%lane{at}'; lines.append(f'  {value} = extractelement {typ} %field{i}, i32 {lane}')
            if scalar == 'half':
                lines.append(f'  %extended{at} = fpext half {value} to float'); value = f'%extended{at}'
            elif scalar != 'float': raise ValueError('Unsupported AIR bridge result ' + typ)
            lines += [f'  %outAt{at} = getelementptr float, ptr %out, i32 {at}', f'  store float {value}, ptr %outAt{at}, align 4']; at += 1
    info['resultCount'] = at
    return '\n'.join(lines + ['  ret void', '}']) + '\n'


def build_reference(temp, files, instrument=None, support_code=''):
    code = (ROOT / 'tools/air-reference-sampler.c').read_text() + support_code; objects, intrinsics, infos = [], {}, {}
    for file in sorted(files):
        info = information(file); ident = pathlib.Path(file).name.replace('.air.ll', '').replace('.', '_')
        infos[file] = (ident, info); source = info['source']
        name = 'sky_' + ident
        retargeted = re.sub(r'^target .*\n', '', source, flags=re.M)
        retargeted = retargeted.replace('@vsMain', '@' + name).replace('@fsMain', '@' + name)
        retargeted = retargeted.replace(' "target-features"="-fp16"', '')
        body = lambda text: re.search(r'^define .*?\n(.*?)^}', text, re.M | re.S)[1]
        if body(source) != body(retargeted): raise ValueError('Retargeting changed original AIR instructions')
        info['instructionBodySha256'] = hashlib.sha256(body(source).encode()).hexdigest()
        if instrument is not None: retargeted = instrument(retargeted, info)
        ll = temp / (ident + '.ll'); ll.write_text(retargeted); obj = temp / (ident + '.o')
        subprocess.run(['clang', '--target=aarch64-linux-gnu', '-Wno-override-module', '-fPIC', '-O0', '-c', str(ll), '-o', str(obj)], check=True, capture_output=True, timeout=30)
        objects.append(str(obj))
        for result, symbol, params in re.findall(r'^declare (.+?) @(air\.[\w.]+)\((.*?)\)', source, re.M):
            # Parameter pointer attributes include parentheses; parse the whole
            # declaration by matching through its final closing parenthesis.
            declaration = next(line for line in source.splitlines() if line.startswith('declare ') and '@' + symbol + '(' in line)
            result, params = declaration.split('@' + symbol + '(', 1); result = result.removeprefix('declare ').removeprefix('zeroext ').strip()
            params = params.rsplit(')', 1)[0]
            # C coerces ext_vector_type(bool,2) to an i32 argument on AArch64,
            # while untouched AIR calls <2 x i1>. Define the reduction in LLVM
            # with its exact AIR ABI; a C bool-vector wrapper reads stale GPRs.
            intrinsics[symbol] = None if symbol in ('air.any.v2i1', 'air.all.v3i1', 'air.fmin.v2f16') else intrinsic(symbol, result, params)
        ll = temp/(ident+'-bridge.ll'); obj = temp/(ident+'-bridge.o')
        ll.write_text(entry_bridge(info, name, ident))
        subprocess.run(['clang','--target=aarch64-linux-gnu','-Wno-override-module','-fPIC','-O0','-c',str(ll),'-o',str(obj)],check=True,capture_output=True,timeout=30)
        objects.append(str(obj))
    if 'air.fmin.v2f16' in intrinsics:
        # AArch64 C coerces half2 arguments to i32. This original AIR call
        # takes real <2 x half> vectors; lower only the helper to scalar libc.
        lines = ['declare float @fminf(float, float)', 'define <2 x half> @air.fmin.v2f16(<2 x half> %a, <2 x half> %b) {']
        previous = 'poison'
        for i in range(2):
            lines += [f'  %a{i} = extractelement <2 x half> %a, i32 {i}', f'  %b{i} = extractelement <2 x half> %b, i32 {i}',
                f'  %af{i} = fpext half %a{i} to float', f'  %bf{i} = fpext half %b{i} to float',
                f'  %min{i} = call float @fminf(float %af{i}, float %bf{i})', f'  %half{i} = fptrunc float %min{i} to half',
                f'  %out{i} = insertelement <2 x half> {previous}, half %half{i}, i32 {i}']
            previous = f'%out{i}'
        lines += ['  ret <2 x half> %out1', '}']
        ll = temp/'half2-intrinsics.ll'; obj = temp/'half2-intrinsics.o'; ll.write_text('\n'.join(lines)+'\n')
        subprocess.run(['clang','--target=aarch64-linux-gnu','-Wno-override-module','-fPIC','-O0','-c',str(ll),'-o',str(obj)],check=True,capture_output=True,timeout=30)
        objects.append(str(obj))
    if 'air.any.v2i1' in intrinsics:
        ll = temp/'boolean-intrinsics.ll'; obj = temp/'boolean-intrinsics.o'
        ll.write_text('define zeroext i1 @air.any.v2i1(<2 x i1> %values) {\n  %a = extractelement <2 x i1> %values, i32 0\n  %b = extractelement <2 x i1> %values, i32 1\n  %result = or i1 %a, %b\n  ret i1 %result\n}\n')
        subprocess.run(['clang','--target=aarch64-linux-gnu','-Wno-override-module','-fPIC','-O0','-c',str(ll),'-o',str(obj)],check=True,capture_output=True,timeout=30)
        objects.append(str(obj))
    if 'air.all.v3i1' in intrinsics:
        ll = temp/'all-intrinsics.ll'; obj = temp/'all-intrinsics.o'
        ll.write_text('define zeroext i1 @air.all.v3i1(<3 x i1> %values) {\n  %a = extractelement <3 x i1> %values, i32 0\n  %b = extractelement <3 x i1> %values, i32 1\n  %c = extractelement <3 x i1> %values, i32 2\n  %ab = and i1 %a, %b\n  %result = and i1 %ab, %c\n  ret i1 %result\n}\n')
        subprocess.run(['clang','--target=aarch64-linux-gnu','-Wno-override-module','-fPIC','-O0','-c',str(ll),'-o',str(obj)],check=True,capture_output=True,timeout=30)
        objects.append(str(obj))
    code += '\n' + '\n'.join(v for v in intrinsics.values() if v is not None)
    c = temp / 'reference.c'; c.write_text(code); obj = temp / 'reference.o'
    subprocess.run(['clang', '--target=aarch64-linux-gnu', '--sysroot=/', '--gcc-toolchain=/usr', '-I/usr/include/aarch64-linux-gnu', '-fPIC', '-O0', '-ffp-contract=off', '-c', str(c), '-o', str(obj)], check=True, capture_output=True, timeout=30)
    library = temp / 'reference.so'
    subprocess.run(['gcc', '-shared', *objects, str(obj), '-lm', '-o', str(library)], check=True, capture_output=True, timeout=30)
    return C.CDLL(str(library)), infos


class Texture(C.Structure):
    _fields_ = [('data', C.c_void_p), ('dimensions', C.c_int * 3), ('channels', C.c_int), ('kind', C.c_int), ('linear', C.c_int), ('repeat', C.c_int)]


class Reference:
    def __init__(self, library, ident, info, uniforms, textures):
        self.info = info; self.fn = getattr(library, 'run_' + ident)
        self.fn.argtypes = [C.POINTER(F32), C.c_void_p, C.POINTER(C.c_void_p), C.POINTER(F32)]; self.fn.restype = None
        self.buffers = []; pointers = []
        for name in info['textures']:
            t = textures[name]; raw = C.create_string_buffer(pathlib.Path(t['data']).read_bytes())
            channels = 4 if t['format'].startswith('rgba') else 2 if t['format'].startswith('rg') else 1
            texture = Texture(C.cast(raw, C.c_void_p), (C.c_int * 3)(*t['dimensions']), channels, 0 if t['format'].endswith('8') else 2 if t['format'].endswith('16f') else 1, t['linear'], t['repeat'])
            self.buffers.extend([raw, texture]); pointers.append(C.cast(C.pointer(texture), C.c_void_p))
        self.textures = (C.c_void_p * len(pointers))(*pointers)
        size = max((offset + length for offset, (_, _, length) in info['uniforms'].items()), default=1)
        self.uniforms = []
        for padding in (0., 7.25):
            raw = bytearray(struct.pack('<f', padding) * ((size + 3) // 4))
            for offset, (kind, name, length) in info['uniforms'].items():
                values = uniforms[name]; values = values if isinstance(values, list) else [values]
                fmt = 'e' if kind.startswith('half') else 'f'; packed = struct.pack('<' + fmt * len(values), *values)
                raw[offset:offset+len(packed)] = packed
                if kind == 'half3': raw[offset + 6:offset + 8] = struct.pack('<e', padding)
            self.uniforms.append(C.create_string_buffer(bytes(raw)))

    def run(self, inputs, padding=0):
        flat = [v for (t, _), name in zip(self.info['args'], self.info['names']) if t != 'ptr' for v in inputs[name]]
        result = (F32 * self.info['resultCount'])(); self.fn((F32 * len(flat))(*flat), self.uniforms[padding], self.textures, result)
        return list(result)


def vertex_inputs(p, index):
    raw = pathlib.Path(p['vertices']).read_bytes(); result = {'gl_VertexIndex': [index]}
    for name, a in p['attributes'].items():
        offset = p['stride'] * index + a['offset']
        if a['format'].startswith('vec'): result[name] = list(struct.unpack_from('<' + 'f' * int(a['format'][-1]), raw, offset))
        elif a['format'] == 'float': result[name] = [struct.unpack_from('<f', raw, offset)[0]]
        elif a['format'] == 'snorm4': result[name] = [max(-1., v / 127.) for v in struct.unpack_from('<4b', raw, offset)]
        elif a['format'] == 'unorm4': result[name] = [v / 255. for v in struct.unpack_from('<4B', raw, offset)]
        else: raise ValueError('Unsupported input ' + a['format'])
    return result


def interpolate(p, vertices, x, y):
    screen = [((v[0] / v[3] * .5 + .5) * p['width'], (v[1] / v[3] * .5 + .5) * p['height']) for v in vertices]
    for triangle in [(0, 1, 2), (0, 2, 3)]:
        a, b, c = [screen[i] for i in triangle]; determinant = (b[1]-c[1])*(a[0]-c[0])+(c[0]-b[0])*(a[1]-c[1])
        if determinant == 0: continue
        wa = ((b[1]-c[1])*(x-c[0])+(c[0]-b[0])*(y-c[1]))/determinant
        wb = ((c[1]-a[1])*(x-c[0])+(a[0]-c[0])*(y-c[1]))/determinant
        weights = [wa, wb, 1-wa-wb]
        if min(weights) < -1e-7: continue
        reciprocal = sum(w / vertices[i][3] for w, i in zip(weights, triangle))
        z = sum(w * vertices[i][2] / vertices[i][3] for w, i in zip(weights, triangle))
        if not 0 <= z <= 1: return None
        values = [sum(w / vertices[i][3] * vertices[i][lane] for w, i in zip(weights, triangle)) / reciprocal for lane in range(4, len(vertices[0]))]
        return [x, y, z, reciprocal], values
    return None


def fragment_inputs(vertex_info, fragment_info, coordinate, varying):
    # AIR fragment argument order need not match vertex output order (CloudCard
    # lists color before UV). Match the named interfaces, never positional lanes.
    if vertex_info['outputs'][0][0] != 'gl_Position' or air.vector(vertex_info['fields'][0])[0] != 4: raise ValueError('Unsupported vertex position layout')
    fields, at = {}, 0
    for (name, _, _), typ in zip(vertex_info['outputs'][1:], vertex_info['fields'][1:]):
        count = air.vector(typ)[0]; fields[name] = varying[at:at+count]; at += count
    if at != len(varying): raise ValueError('Varying component mismatch')
    inputs = {'gl_FragCoord': coordinate}
    for (typ, _), name in zip(fragment_info['args'], fragment_info['names']):
        if typ == 'ptr' or name == 'gl_FragCoord': continue
        if name not in fields or len(fields[name]) != air.vector(typ)[0]: raise ValueError('Missing or mismatched original varying ' + name)
        inputs[name] = fields[name]
    return inputs


def main():
    parser = argparse.ArgumentParser(); parser.add_argument('--spec', type=pathlib.Path); parser.add_argument('--report', type=pathlib.Path); args = parser.parse_args()
    report_path = args.report or ROOT / 'docs/cloud-air-vulkan-check.json'
    report_path.write_text(json.dumps({'passed': False, 'complete': False, 'status': 'Check started; no completed validation result yet'}) + '\n')
    with tempfile.TemporaryDirectory(prefix='sky-cloud-air-check-') as temporary:
        temp = pathlib.Path(temporary)
        if args.spec: spec = json.loads(args.spec.read_text())
        else:
            subprocess.run(['python3', 'tools/air-to-vulkan.py'], cwd=ROOT, check=True, timeout=30)
            subprocess.run(['node_modules/.bin/tsx', 'tools/cloud-vulkan-inputs.ts', str(temp), '--air'], cwd=ROOT, check=True, timeout=60)
            spec = json.loads((temp / 'spec.json').read_text())
        if spec.get('translation') != 'metal-air': raise ValueError('Only AIR-generated Vulkan inputs are valid here')
        files = {file for p in spec['programs'] for file in p['airFiles'].values()}
        try: library, infos = build_reference(temp, files)
        except subprocess.CalledProcessError as e: raise RuntimeError(e.stderr.decode()) from e
        rows = []
        for p in spec['programs']:
            vname, vi = infos[p['airFiles']['vert']]; fname, fi = infos[p['airFiles']['frag']]
            vr = Reference(library, vname, vi, p['uniforms'], p['textures']); fr = Reference(library, fname, fi, p['uniforms'], p['textures'])
            vertices = [vr.run(vertex_inputs(p, i)) for i in range(4)]
            padding_failures = sum(vertices[i] != vr.run(vertex_inputs(p, i), 1) for i in range(4))
            native = []
            for file in p['outputFiles']: a = array.array('f'); a.frombytes(pathlib.Path(file).read_bytes()); native.append(a)
            captured_varyings = {}
            for name, file in p.get('varyingFiles', {}).items():
                a = array.array('f'); a.frombytes(pathlib.Path(file).read_bytes()); captured_varyings[name] = a
            interpolation_failures, max_interpolation_difference = 0, 0.
            differences = [[] for _ in native]; failures = [[] for _ in native]; tested, nonzero, uncovered_failures = 0, 0, 0
            for y in range(p['height']):
                for x in range(p['width']):
                    sample = interpolate(p, vertices, x + .5, y + .5)
                    if sample is None:
                        if p.get('allowPartialCoverage'):
                            pixel = y * p['width'] + x
                            uncovered_failures += sum(native[i][pixel*4+c] != 0 for i,field in enumerate(fi['fields']) for c in range(air.vector(field)[0]))
                        continue
                    coordinate, varying = sample; inputs = fragment_inputs(vi, fi, coordinate, varying)
                    for t, name in zip([a[0] for a in fi['args']], fi['names']):
                        if t == 'ptr' or name == 'gl_FragCoord': continue
                        count = air.vector(t)[0]
                        if name in captured_varyings:
                            pixel = y * p['width'] + x
                            captured = list(captured_varyings[name][pixel * 4:pixel * 4 + count])
                            for expected, actual in zip(inputs[name], captured):
                                delta = abs(expected - actual); max_interpolation_difference = max(max_interpolation_difference, delta)
                                interpolation_failures += not math.isfinite(actual) or delta > 2e-6
                            inputs[name] = captured
                    reference = fr.run(inputs); padding_failures += reference != fr.run(inputs, 1); tested += 1
                    nonzero += any(v != 0 for v in reference); offset = 0; pixel = y * p['width'] + x
                    for attachment, field in enumerate(fi['fields']):
                        count = air.vector(field)[0]
                        for c in range(count):
                            expected, actual = reference[offset + c], native[attachment][pixel * 4 + c]
                            if p.get('colorFormats', [])[attachment:attachment+1] and p['colorFormats'][attachment].endswith('16f'):
                                try: expected = struct.unpack('<e', struct.pack('<e', expected))[0]
                                except OverflowError: expected = math.copysign(math.inf, expected)
                            delta = abs(expected - actual); differences[attachment].append(delta)
                            mismatched = struct.pack('<f', expected) != struct.pack('<f', actual) if spec.get('exactComparison') else delta > .025 + .01 * abs(expected)
                            if not math.isfinite(expected) or not math.isfinite(actual) or mismatched: failures[attachment].append([pixel, c, expected, actual])
                        offset += count
            coverage_passed = tested > 0 and uncovered_failures == 0 if p.get('allowPartialCoverage') else tested == p['width'] * p['height']
            attachments = [{'location': i, 'comparedComponents': len(d), 'maxAbsoluteDifference': max(d, default=0), 'failedComponents': len(failures[i]), 'firstFailures': failures[i][:5], 'passed': coverage_passed and not failures[i]} for i, d in enumerate(differences)]
            rows.append({'name': p['name'], 'cameraCase': p['cameraCase'], 'rasterSamples': tested, 'nonzeroReferencePixels': nonzero, 'uniformPaddingFailures': padding_failures,
              'varyingCaptureOutputMatches': p.get('varyingCaptureOutputMatches'), 'vertexInterpolationFailedComponents': interpolation_failures, 'maxVertexInterpolationDifference': max_interpolation_difference, 'attachments': attachments})
        passed = all(r['uniformPaddingFailures'] == 0 and r['vertexInterpolationFailedComponents'] == 0 and r['varyingCaptureOutputMatches'] is not False and all(a['passed'] for a in r['attachments']) for r in rows)
        comparison = 'Exact float32 bytes, including signed zero.' if spec.get('exactComparison') else 'Tolerance 0.025 + 1% magnitude.'
        report = {'passed': passed, 'complete': True, 'device': spec['device'], 'airManifest': spec.get('airManifest'),
          'generatedSources': [{'name': p['name'], 'cameraCase': p['cameraCase'], 'stages': {stage: hashlib.sha256(pathlib.Path(file).read_bytes()).hexdigest() for stage, file in p.get('vulkanFiles', {}).items()}} for p in spec['programs']],
          'reference': 'Original AIR SSA/branches/casts retargeted by LLVM to Linux AArch64 at O0, exact LLVM pointer-only entry bridges and small-vector intrinsic ABI, explicit CPU math and float32 sampler', 'referenceToolSha256': hashlib.sha256(pathlib.Path(__file__).read_bytes()).hexdigest(), 'scope': spec['fixture'] + ' Each CPU stage consumes the same Vulkan-produced input textures. CPU raster interpolation unless the stage declares captured varying inputs. ' + comparison + ' Tests two finite uniform padding patterns. No original Metal execution, hardware intrinsic/filter guarantee, complete Compositor, Windows or game-image parity.', 'sources': [{'file': str(pathlib.Path(file).relative_to(ROOT)), 'sha256': hashlib.sha256(pathlib.Path(file).read_bytes()).hexdigest(), 'instructionBodySha256': infos[file][1]['instructionBodySha256'], 'instructionBodyUnchanged': True} for file in sorted(files)], 'samplerSourceSha256': hashlib.sha256((ROOT / 'tools/air-reference-sampler.c').read_bytes()).hexdigest(), 'programs': rows}
        report_path.write_text(json.dumps(report, indent=2) + '\n')
        print(json.dumps({'programs': len(rows), 'attachments': sum(len(r['attachments']) for r in rows), 'rasterSamples': sum(r['rasterSamples'] for r in rows), 'uniformPaddingFailures': sum(r['uniformPaddingFailures'] for r in rows), 'passed': passed}))
        if not passed: raise SystemExit(1)


if __name__ == '__main__': main()
