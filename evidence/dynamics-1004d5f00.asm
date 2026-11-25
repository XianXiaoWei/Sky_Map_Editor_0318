0x1004d5f00: push rbp
0x1004d5f01: mov rbp, rsp
0x1004d5f04: push r15
0x1004d5f06: push r14
0x1004d5f08: push r13
0x1004d5f0a: push r12
0x1004d5f0c: push rbx
0x1004d5f0d: sub rsp, 0xc8
0x1004d5f14: mov qword ptr [rbp - 0x48], rdx
0x1004d5f18: mov qword ptr [rbp - 0x40], rsi
0x1004d5f1c: mov rbx, rdi
0x1004d5f1f: cmp dword ptr [rbx + 0x13c8], 0
0x1004d5f26: je 0x1004d60de
0x1004d5f2c: mov al, byte ptr [rip + 0x7fd4eb] ; 0x100cd341d
0x1004d5f32: and al, 1
0x1004d5f34: je 0x1004d60de
0x1004d5f3a: xor ecx, ecx
0x1004d5f3c: mov qword ptr [rbp - 0x38], rbx
0x1004d5f40: mov ecx, ecx
0x1004d5f42: mov qword ptr [rbp - 0x60], rcx
0x1004d5f46: imul r12, rcx, 0x5d0
0x1004d5f4d: lea rsi, [rbx + r12 + 0x13e0]
0x1004d5f55: vmovss xmm0, dword ptr [rip + 0x5ce65b] ; 0x100aa45b8
0x1004d5f5d: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x1004d5f65: vmovaps xmm0, xmmword ptr [rip + 0x5d1983] ; 0x100aa78f0
0x1004d5f6d: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x1004d5f75: vmovaps xmm0, xmmword ptr [rip + 0x5dc663] ; 0x100ab25e0
0x1004d5f7d: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1004d5f82: vmovaps xmm0, xmmword ptr [rip + 0x5d2a76] ; 0x100aa8a00
0x1004d5f8a: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1004d5f8f: lea r14, [rbp - 0xf0]
0x1004d5f96: mov rdi, r14
0x1004d5f99: lea r15, [rbp - 0xa0]
0x1004d5fa0: mov rdx, r15
0x1004d5fa3: call 0x100076df0 ; 0x100076df0
0x1004d5fa8: lea r13, [rbp - 0xb0]
0x1004d5faf: mov rdi, r13
0x1004d5fb2: mov rsi, qword ptr [rbp - 0x40]
0x1004d5fb6: call 0x10076be90 ; 0x10076be90
0x1004d5fbb: mov rdi, r13
0x1004d5fbe: mov rsi, r14
0x1004d5fc1: call 0x10078ce10 ; 0x10078ce10
0x1004d5fc6: vucomiss xmm0, dword ptr [rip + 0x5d0ada] ; 0x100aa6aa8
0x1004d5fce: setbe byte ptr [rbp - 0x29]
0x1004d5fd2: vmovaps xmm0, xmmword ptr [rbx + r12 + 0x1470]
0x1004d5fdc: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x1004d5fe4: lea r13, [rbx + r12 + 0x1970]
0x1004d5fec: lea r9, [rbx + r12 + 0x1980]
0x1004d5ff4: lea r8, [rbx + r12 + 0x1990]
0x1004d5ffc: xor eax, eax
0x1004d5ffe: cmp byte ptr [rbx + 0x1391], 0
0x1004d6005: sete al
0x1004d6008: lea rcx, [rip + 0x5e6201] ; 0x100abc210
0x1004d600f: vmovss xmm0, dword ptr [rcx + rax*4]
0x1004d6014: mov rdi, qword ptr [rbp - 0x48]
0x1004d6018: mov rsi, r15
0x1004d601b: mov rdx, r13
0x1004d601e: mov qword ptr [rbp - 0x50], r9
0x1004d6022: mov rcx, r9
0x1004d6025: mov qword ptr [rbp - 0x58], r8
0x1004d6029: call 0x100328050 ; 0x100328050
0x1004d602e: cmp byte ptr [rbx + r12 + 0x1968], 0
0x1004d6037: je 0x1004d60f0
0x1004d603d: lea r15, [rbx + r12 + 0x1968]
0x1004d6045: lea r14, [rbx + r12 + 0x16a0]
0x1004d604d: mov rdi, r14
0x1004d6050: lea rsi, [rip + 0x6aae9a] ; 0x100b80ef1 u_windScroll0
0x1004d6057: mov rdx, r13
0x1004d605a: call 0x1007be5e0 ; 0x1007be5e0
0x1004d605f: cmp byte ptr [r15], 0
0x1004d6063: je 0x1004d60f0
0x1004d6069: mov rdi, r14
0x1004d606c: lea rsi, [rip + 0x6aae8c] ; 0x100b80eff u_windScroll1
0x1004d6073: mov rdx, qword ptr [rbp - 0x50]
0x1004d6077: call 0x1007be5e0 ; 0x1007be5e0
0x1004d607c: cmp byte ptr [r15], 0
0x1004d6080: je 0x1004d60f0
0x1004d6082: mov rdi, r14
0x1004d6085: lea rsi, [rip + 0x6aae81] ; 0x100b80f0d u_windScroll2
0x1004d608c: mov rdx, qword ptr [rbp - 0x58]
0x1004d6090: call 0x1007be5e0 ; 0x1007be5e0
0x1004d6095: mov rbx, qword ptr [rbp - 0x38]
0x1004d6099: cmp byte ptr [rbx + r12 + 0x195a], 1
0x1004d60a2: je 0x1004d610f
0x1004d60a4: xor eax, eax
0x1004d60a6: movzx ecx, byte ptr [rbp - 0x29]
0x1004d60aa: mov al, cl
0x1004d60ac: lea rdi, [rbx + r12 + 0x1430]
0x1004d60b4: mov dword ptr [rbx + r12 + 0x1938], eax
0x1004d60bc: call 0x1007f6540 ; 0x1007f6540
0x1004d60c1: mov rcx, qword ptr [rbp - 0x60]
0x1004d60c5: inc ecx
0x1004d60c7: cmp ecx, dword ptr [rbx + 0x13c8]
0x1004d60cd: jae 0x1004d60de
0x1004d60cf: movzx eax, byte ptr [rip + 0x7fd347] ; 0x100cd341d
0x1004d60d6: and al, 1
0x1004d60d8: jne 0x1004d5f40
0x1004d60de: add rsp, 0xc8
0x1004d60e5: pop rbx
0x1004d60e6: pop r12
0x1004d60e8: pop r13
0x1004d60ea: pop r14
0x1004d60ec: pop r15
0x1004d60ee: pop rbp
0x1004d60ef: ret 
0x1004d60f0: lea rdi, [rip + 0x6a0bf3] ; 0x100b76cea IsInitialized()
0x1004d60f7: lea rsi, [rip + 0x68c17d] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1004d60fe: mov edx, 0xa8
0x1004d6103: mov ecx, 3
0x1004d6108: call 0x1007e5f70 ; 0x1007e5f70
0x1004d610d: ud2 
0x1004d610f: lea rdi, [rip + 0x68c15b] ; 0x100b62271 !m_queued
0x1004d6116: lea rsi, [rip + 0x68c15e] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1004d611d: lea r8, [rip + 0x68c173] ; 0x100b62297 VertexRender has already been committed!
0x1004d6124: mov edx, 0x8e
0x1004d6129: mov ecx, 4
0x1004d612e: xor eax, eax
0x1004d6130: call 0x1007e6030 ; 0x1007e6030
0x1004d6135: ud2 
0x1004d6137: nop word ptr [rax + rax]
