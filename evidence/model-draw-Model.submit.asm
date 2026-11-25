0x10046b780: push rbp
0x10046b781: mov rbp, rsp
0x10046b784: push r15
0x10046b786: push r14
0x10046b788: push rbx
0x10046b789: sub rsp, 0x58
0x10046b78d: mov rbx, rdi
0x10046b790: cmp byte ptr [rbx + 0x227], 0
0x10046b797: je 0x10046b8ea
0x10046b79d: cmp byte ptr [rbx + 0x32d], 0
0x10046b7a4: je 0x10046b8ea
0x10046b7aa: lea rax, [rbx + 0x90]
0x10046b7b1: lea rcx, [rbx + 0x94]
0x10046b7b8: vmovss xmm0, dword ptr [rip + 0x638df8] ; 0x100aa45b8
0x10046b7c0: vucomiss xmm0, dword ptr [rbx + 0x98]
0x10046b7c8: cmova rcx, rax
0x10046b7cc: mov r14d, dword ptr [rcx]
0x10046b7cf: cmp r14d, dword ptr [rbx + 0x8c]
0x10046b7d6: jae 0x10046b8ea
0x10046b7dc: cmp dword ptr [rbx + 0x354], 2
0x10046b7e3: je 0x10046b811
0x10046b7e5: mov rax, qword ptr [rbx + 0x28]
0x10046b7e9: mov rdi, qword ptr [rax + r14*8]
0x10046b7ed: call 0x1007f6540 ; 0x1007f6540
0x10046b7f2: cmp byte ptr [rbx + 0x391], 0
0x10046b7f9: je 0x10046b808
0x10046b7fb: mov rax, qword ptr [rbx + 0x30]
0x10046b7ff: mov rdi, qword ptr [rax + r14*8]
0x10046b803: call 0x1007f6540 ; 0x1007f6540
0x10046b808: cmp dword ptr [rbx + 0x354], 0
0x10046b80f: je 0x10046b827
0x10046b811: mov rax, qword ptr [rbx + 0x40]
0x10046b815: mov rdi, qword ptr [rax + r14*8]
0x10046b819: cmp byte ptr [rdi + 0x538], 0
0x10046b820: je 0x10046b827
0x10046b822: call 0x1007f6540 ; 0x1007f6540
0x10046b827: cmp byte ptr [rip + 0x1b9bd6a], 0 ; 0x102007598
0x10046b82e: je 0x10046b8ea
0x10046b834: mov rax, qword ptr [rbx + 8]
0x10046b838: mov rax, qword ptr [rax + r14*8]
0x10046b83c: mov rcx, qword ptr [rax]
0x10046b83f: mov r14, qword ptr [rcx + 0x48]
0x10046b843: movsxd r15, dword ptr [rax + 0x10]
0x10046b847: cmp qword ptr [rbx + 0x68], 0
0x10046b84c: lea rax, [rip + 0x1bd3dcd] ; 0x10203f620
0x10046b853: cmove rax, qword ptr [rip + 0x79ec1d] ; 0x100c0a478
0x10046b85b: vmovaps xmm0, xmmword ptr [rax]
0x10046b85f: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x10046b864: call 0x1002b9810 ; 0x1002b9810
0x10046b869: imul rdx, r15, 0xb8
0x10046b870: mov rsi, qword ptr [r14 + rdx + 0x60]
0x10046b875: mov rcx, qword ptr [r14 + rdx + 0x80]
0x10046b87d: cmp byte ptr [rbx + 0x32e], 0
0x10046b884: mov r9d, dword ptr [r14 + rdx + 0x38]
0x10046b889: lea rdx, [rbx + 0x240]
0x10046b890: lea rdi, [rbx + 0x160]
0x10046b897: cmove rdx, rdi
0x10046b89b: vmovaps xmm0, xmmword ptr [rdx]
0x10046b89f: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x10046b8a4: vmovaps xmm0, xmmword ptr [rdx + 0x10]
0x10046b8a9: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x10046b8ae: vmovaps xmm0, xmmword ptr [rdx + 0x20]
0x10046b8b3: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x10046b8b8: vmovaps xmm0, xmmword ptr [rdx + 0x30]
0x10046b8bd: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10046b8c2: sub rsp, 8
0x10046b8c6: lea rbx, [rbp - 0x30]
0x10046b8ca: lea r10, [rbp - 0x70]
0x10046b8ce: mov edx, 0x10
0x10046b8d3: mov r8d, 4
0x10046b8d9: mov rdi, rax
0x10046b8dc: push 0
0x10046b8de: push rbx
0x10046b8df: push r10
0x10046b8e1: call 0x1002bd580 ; 0x1002bd580
0x10046b8e6: add rsp, 0x20
0x10046b8ea: add rsp, 0x58
0x10046b8ee: pop rbx
0x10046b8ef: pop r14
0x10046b8f1: pop r15
0x10046b8f3: pop rbp
0x10046b8f4: ret 
0x10046b8f5: nop word ptr cs:[rax + rax]
