#!/usr/bin/env python3
"""Lower the original fixed inverse instruction stream to scalar float32 DAG.
Generated TS is standalone math, with no runtime instruction interpreter.
"""
import json
import pathlib
import sys
from native import Native
from capstone.x86 import X86_OP_REG, X86_OP_MEM, X86_OP_IMM, X86_REG_RSI, X86_REG_RDI, X86_REG_RBP, X86_REG_RIP

n=Native(sys.argv[1]); regs={};stack={};output={};reciprocal=None
zero=('const','0');nodes={};ordered=[]
def op(kind,a,b):
    key=(kind,a,b)
    if key not in nodes:nodes[key]='t'+str(len(nodes));ordered.append(key)
    return key
def memory(ins,operand,count):
    m=operand.mem
    if m.base==X86_REG_RSI:return [('arg',str((m.disp+i*4)//4)) for i in range(count)]
    if m.base==X86_REG_RBP:return [stack[m.disp+i*4] for i in range(count)]
    if m.base==X86_REG_RIP:
        import struct
        return [('const',repr(v)) for v in struct.unpack('<'+'f'*count,n.read(ins.address+ins.size+m.disp,count*4))]
    raise ValueError('Unsupported memory '+ins.op_str)
def read(ins,operand,count=4):
    if operand.type==X86_OP_REG:return regs[ins.reg_name(operand.reg)][:count]
    if operand.type==X86_OP_MEM:return memory(ins,operand,count)
    raise ValueError('Unsupported operand '+ins.op_str)
def store(ins,operand,values):
    if operand.type==X86_OP_REG:regs[ins.reg_name(operand.reg)]=list(values);return
    m=operand.mem;target=stack if m.base==X86_REG_RBP else output if m.base==X86_REG_RDI else None
    if target is None:raise ValueError('Unsupported store '+ins.op_str)
    for i,value in enumerate(values):target[m.disp+i*4]=value
for ins in n.instructions(0x100076940):
    if ins.address>=0x100076dc6:break
    ops=ins.operands;mn=ins.mnemonic
    if mn in ['push','pop','sub','add','mov','ret','vucomiss','jp']:continue
    if mn in ['vmovaps','vmovapd']:store(ins,ops[0],read(ins,ops[1]));continue
    if mn=='vmovss':
        values=read(ins,ops[1],1)
        store(ins,ops[0],values+[zero]*3 if ops[0].type==X86_OP_REG else values);continue
    if mn in ['vmulss','vaddss','vsubss','vdivss','vmulps','vaddps','vsubps']:
        a=read(ins,ops[1]);b=read(ins,ops[2],1 if mn.endswith('ss') else 4);kind={'mul':'mul','add':'add','sub':'sub','div':'div'}[mn[1:4]]
        values=[op(kind,a[i],b[i]) for i in range(len(b))]+a[len(b):]
        store(ins,ops[0],values)
        if ins.address==0x100076afb:reciprocal=values[0]
        continue
    a=read(ins,ops[1])
    if mn=='vmovshdup':values=[a[1],a[1],a[3],a[3]]
    elif mn=='vpermilpd':
        imm=ops[2].imm;values=a[(imm&1)*2:(imm&1)*2+2]+a[((imm>>1)&1)*2:((imm>>1)&1)*2+2]
    elif mn=='vpermilps':values=[a[(ops[2].imm>>(i*2))&3] for i in range(4)]
    elif mn in ['vunpckhps','vunpcklps']:
        b=read(ins,ops[2]);j=2 if mn=='vunpckhps' else 0;values=[a[j],b[j],a[j+1],b[j+1]]
    elif mn=='vshufps':
        b=read(ins,ops[2]);imm=ops[3].imm;values=[a[imm&3],a[(imm>>2)&3],b[(imm>>4)&3],b[(imm>>6)&3]]
    elif mn=='vinsertps':
        b=read(ins,ops[2]);imm=ops[3].imm;values=list(a);values[(imm>>4)&3]=b[(imm>>6)&3]
        values=[zero if imm&(1<<i) else v for i,v in enumerate(values)]
    else:raise ValueError('Unsupported instruction '+hex(ins.address)+' '+ins.mnemonic+' '+ins.op_str)
    store(ins,ops[0],values)
assert reciprocal is not None and set(output)==set(range(0,64,4))
needed=set()
def visit(node):
    if node[0] in ['arg','const'] or node in needed:return
    visit(node[1]);visit(node[2]);needed.add(node)
for node in list(output.values())+[reciprocal]:visit(node)
def name(node):return 'a['+node[1]+']' if node[0]=='arg' else node[1] if node[0]=='const' else nodes[node]
text=['// Generated from original 0x100076940..0x100076dc5; do not hand edit.',
      '// SHA256 '+n.digest,'const f = Math.fround;',
      'export function cloudCardInverse(world: number[]): number[] {',
      "  if (world.length !== 16 || !world.every(v => Number.isFinite(f(v)))) throw new Error('CloudCard 世界矩阵无效');",
      '  const a = world.map(f);']
symbols={'mul':'*','add':'+','sub':'-','div':'/'}
for node in ordered:
    if node in needed:text.append(f'  const {nodes[node]} = f({name(node[1])} {symbols[node[0]]} {name(node[2])});')
    if node==reciprocal:text.append(f"  if (Number.isNaN({name(node)})) throw new Error('CloudCard 原矩阵求逆断言失败');")
text.extend(['  const inverse = ['+', '.join(name(output[i]) for i in range(0,64,4))+'];',
             "  if (!inverse.every(Number.isFinite)) throw new Error('CloudCard 求逆结果不能用于渲染');",'  return inverse;','}',''])
pathlib.Path('src/core/cloud-card-inverse.ts').write_text('\n'.join(text))
pathlib.Path('evidence/cloud-card-inverse.asm').write_text(n.annotated(0x100076940))
print(json.dumps({'function':'0x100076940','scalarOperations':len(needed),'executableSha256':n.digest}))
