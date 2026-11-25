#!/usr/bin/env python3
"""Diagnostic SSA/texture trace for one fixed fragment of original cloud AIR.
Instrumented original CPU instruction bodies and generated Vulkan statements.
Acceptance reports are not modified; trace shaders aren't used in the editor.
"""
import argparse, array, ctypes as C, importlib.util, json, math, pathlib, re, subprocess, tempfile

ROOT = pathlib.Path(__file__).resolve().parent.parent
module = importlib.util.spec_from_file_location('cloud_reference', ROOT / 'tools/cloud-air-check.py')
ref = importlib.util.module_from_spec(module); module.loader.exec_module(ref)
air = ref.air
SUPPORT = '''
static float trace_rows[200000][5]; static unsigned trace_count;
void sky_trace(int id, F4 values) {
  if(trace_count >= 200000) return;
  trace_rows[trace_count][0] = id;
  for(int i=0;i<4;i++) trace_rows[trace_count][i+1] = values[i];
  trace_count++;
}
void sky_trace_reset(void) { trace_count=0; }
unsigned sky_trace_count(void) { return trace_count; }
const float* sky_trace_rows(void) { return &trace_rows[0][0]; }
'''


def pack_trace(typ, value, ident):
    count, scalar = air.vector(typ); lines = []
    source = value
    ft = 'float' if count == 1 else f'<{count} x float>'
    if scalar != 'float':
        operation = 'fpext' if scalar == 'half' else 'uitofp' if scalar == 'i1' else 'sitofp'
        source = f'%trace_f_{ident}'; lines.append(f'  {source} = {operation} {typ} {value} to {ft}')
    packed = f'%trace_v_{ident}'
    if count == 1: lines.append(f'  {packed} = insertelement <4 x float> zeroinitializer, float {source}, i32 0')
    elif count != 4:
        mask = ', '.join(f'i32 {i if i < count else count}' for i in range(4))
        lines.append(f'  {packed} = shufflevector {ft} {source}, {ft} zeroinitializer, <4 x i32> <{mask}>')
    else: packed = source
    return lines, packed


def trace_definitions(source, contract_fast='none'):
    samplers = sorted(set(re.findall(r'!"air.texture".*?!"air.arg_name", !"([^"]+)"', source)))
    t = air.Translator(source, 'frag', {name: i+1 for i,name in enumerate(samplers)}, contract_fast); generated = t.translate()
    definitions = {}
    for line in t.body.splitlines():
        match = re.match(r'\s*%(\d+) = (.*)', line)
        if not match: continue
        ident, instruction = match.groups(); typ = t.types.get('%' + ident)
        texture = 'air.sample_texture_' in instruction
        if typ not in ('float', 'half', 'i1', 'i32', 'i64') and not texture: continue
        uv = None
        if texture:
            params = re.search(r'@air\.sample_texture_\w+\.v4f\d+\((.*)\)(?: #\d+)?',instruction)[1]
            uv = air.typed(air.split(params)[2])
        definitions[int(ident)] = {'type':typ,'instruction':instruction,'uv':uv}
    return t, generated, definitions


def instrument(source, info, contract_fast='none'):
    if info['stage'] != 'frag': return source
    _, _, definitions = trace_definitions(info['source'], contract_fast); lines, pending = [], []
    body_started = False
    for line in source.splitlines():
        if line.startswith('define '): body_started = True; lines.append(line); continue
        if not body_started: lines.append(line); continue
        match = re.match(r'\s*%(\d+) = (.*)',line); ident = int(match[1]) if match else None
        is_phi = match and match[2].startswith('phi ')
        if not is_phi and pending: lines.extend(pending); pending=[]
        definition = definitions.get(ident)
        if definition and definition['uv']:
            instructions, packed = pack_trace(*definition['uv'], f'uv_{ident}')
            lines.extend(instructions); lines.append(f'  call void @sky_trace(i32 {-ident}, <4 x float> {packed})')
        lines.append(line)
        if definition:
            instructions, packed = pack_trace(definition['type'], '%' + str(ident), str(ident))
            instructions.append(f'  call void @sky_trace(i32 {ident}, <4 x float> {packed})')
            if is_phi: pending.extend(instructions)
            else: lines.extend(instructions)
        if line == '}': body_started=False
    lines.append('declare void @sky_trace(i32, <4 x float>)')
    return '\n'.join(lines)+'\n'


def gpu_shader(source, t, definitions, inputs):
    for name in inputs:
        if name == 'gl_FragCoord': source = re.sub(r'\bgl_FragCoord\b','trace_coord',source)
        else:
            kind = 'float' if len(inputs[name]) == 1 else 'vec' + str(len(inputs[name]))
            source = re.sub(r'layout\(location=\d+\) in ' + kind + ' ' + name + ';', 'uniform ' + kind + ' trace_' + name + ';',source)
            source = re.sub(r'\b'+name+r'\b','trace_'+name,source)
    output_count = len(t.outputs)
    helper = f'''
uniform vec4 trace_coord;
uniform int trace_width;
layout(location={output_count}) out vec4 trace_values;
layout(location={output_count+1}) out vec4 trace_metadata;
int trace_counter=0,trace_id=0,trace_target=0;
vec4 trace_record=vec4(0.0);
void sky_trace(int ident,vec4 values) {{
  if(trace_counter==trace_target) {{trace_record=values;trace_id=ident;}}
  trace_counter++;
}}
'''
    source = source.replace('void main() {', helper + '\nvoid main() {\n  trace_target=int(gl_FragCoord.x)+int(gl_FragCoord.y)*trace_width;')
    lines=[]
    for line in source.splitlines():
        match = re.match(r'\s*r(\d+) = ',line); ident = int(match[1]) if match else None; definition = definitions.get(ident)
        if definition and definition['uv']:
            typ, value = definition['uv']; expression=t.values[value]; count=air.vector(typ)[0]
            for name in inputs: expression = re.sub(r'\b' + name + r'\b', 'trace_coord' if name == 'gl_FragCoord' else 'trace_' + name, expression)
            packed=f'vec4({expression},0.0)' if count==3 else f'vec4({expression},0.0,0.0)'
            lines.append(f'      sky_trace({-ident},{packed});')
        if line.strip() == 'return;': lines.extend(['      trace_values=trace_record;', '      trace_metadata=vec4(float(trace_id),float(trace_counter),0.0,1.0);'])
        lines.append(line)
        if definition:
            value = f'r{ident}'; typ=definition['type']
            expr=f'vec4({value})' if air.vector(typ)[0]==4 else f'vec4(float({value}),0.0,0.0,0.0)'
            lines.append(f'      sky_trace({ident},{expr});')
    return '\n'.join(lines)+'\n'


def main():
    parser=argparse.ArgumentParser();parser.add_argument('--spec',type=pathlib.Path,required=True);parser.add_argument('--program',default='CloudFluffySuperCoarse');parser.add_argument('--camera',default='outside');parser.add_argument('--pixel',type=int,default=95);parser.add_argument('--output',type=pathlib.Path,required=True);args=parser.parse_args()
    spec=json.loads(args.spec.read_text());p=next(p for p in spec['programs'] if p['name']==args.program and p['cameraCase']==args.camera)
    contract_fast = (spec.get('airManifest') or {}).get('contractFast', 'none')
    args.output.mkdir(parents=True,exist_ok=True)
    with tempfile.TemporaryDirectory(prefix='sky-air-trace-') as temporary:
        temp=pathlib.Path(temporary);library,infos=ref.build_reference(temp,set(p['airFiles'].values()),lambda source,info:instrument(source,info,contract_fast),SUPPORT)
        vname,vi=infos[p['airFiles']['vert']];fname,fi=infos[p['airFiles']['frag']]
        vr=ref.Reference(library,vname,vi,p['uniforms'],p['textures']);fr=ref.Reference(library,fname,fi,p['uniforms'],p['textures'])
        vertices=[vr.run(ref.vertex_inputs(p,i)) for i in range(4)]
        coordinate,varying=ref.interpolate(p,vertices,args.pixel%p['width']+.5,args.pixel//p['width']+.5)
        inputs=ref.fragment_inputs(vi,fi,coordinate,varying)
        library.sky_trace_reset();result=fr.run(inputs);library.sky_trace_count.restype=C.c_uint;count=library.sky_trace_count()
        library.sky_trace_rows.restype=C.POINTER(C.c_float);data=library.sky_trace_rows();cpu=[[int(data[i*5]),*[float(data[i*5+c]) for c in range(1,5)]] for i in range(count)]
        t,generated,definitions=trace_definitions(fi['source'],contract_fast);fragment=gpu_shader(generated,t,definitions,inputs)
        vertex='#version 450\nin vec2 a_position;void main(){gl_Position=vec4(a_position,0.0,1.0);}\n'
        (args.output/'trace.vert').write_text(vertex);(args.output/'trace.frag').write_text(fragment)
        width=64;height=math.ceil((count+128)/width)
        uniforms={**p['uniforms'],'trace_coord':coordinate,'trace_width':width,**{'trace_'+name:v for name,v in inputs.items() if name!='gl_FragCoord'}}
        task={'vert':str((args.output/'trace.vert').resolve()),'frag':str((args.output/'trace.frag').resolve()),'width':width,'height':height,'uniforms':uniforms,'textures':p['textures']}
        (args.output/'input.json').write_text(json.dumps(task))
        subprocess.run(['node_modules/.bin/tsx','tools/cloud-air-trace-inputs.ts',str((args.output/'input.json').resolve())],cwd=ROOT,check=True,timeout=60)
        outputs=[]
        for index in [len(t.outputs),len(t.outputs)+1]:
            a=array.array('f');a.frombytes((args.output/f'trace-{index}.f32').read_bytes());outputs.append(a)
        gpu_count=int(outputs[1][1]);gpu=[[int(outputs[1][i*4]),*outputs[0][i*4:i*4+4]] for i in range(min(gpu_count,width*height))]
        first_path=next((i for i,(a,b) in enumerate(zip(cpu,gpu)) if a[0]!=b[0]),None)
        first_value=next((i for i,(a,b) in enumerate(zip(cpu,gpu)) if a[0]==b[0] and any(abs(x-y)>1e-6+1e-5*abs(x) for x,y in zip(a[1:],b[1:]))),None)
        report={'scope':'Instrumented original CPU AIR and generated Vulkan scalar/texture trace for one fixed fragment input; diagnostic only. Inserted trace calls can prevent CPU fast FMA contraction and change rounding relative to the untouched acceptance entry. No acceptance reports altered.','contractFast':contract_fast,'program':args.program,'camera':args.camera,'pixel':args.pixel,'inputs':inputs,'referenceOutput':result,'cpuEvents':len(cpu),'gpuEvents':gpu_count,'firstValueDifference':first_value,'firstPathDifference':first_path,'definitions':definitions,'cpu':cpu,'gpu':gpu}
        (args.output/'trace.json').write_text(json.dumps(report,indent=2))
        for label,position in [('value',first_value),('path',first_path)]:
            if position is not None:
                print(json.dumps({'difference':label,'event':position,'beforeAndAfter':list(zip(cpu[max(0,position-8):position+8],gpu[max(0,position-8):position+8]))}))
        print(json.dumps({'cpuEvents':len(cpu),'gpuEvents':gpu_count,'firstValueDifference':first_value,'firstPathDifference':first_path}))

if __name__=='__main__':main()
