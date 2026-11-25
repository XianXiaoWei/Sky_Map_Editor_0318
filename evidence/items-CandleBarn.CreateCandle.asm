0x1001eab70: push rbp
0x1001eab71: mov rbp, rsp
0x1001eab74: push r15
0x1001eab76: push r14
0x1001eab78: push r13
0x1001eab7a: push r12
0x1001eab7c: push rbx
0x1001eab7d: sub rsp, 0xc8
0x1001eab84: mov r12, rdi
0x1001eab87: mov eax, dword ptr [r12 + 0xf988]
0x1001eab8f: cmp eax, dword ptr [r12 + 0xf980]
0x1001eab97: jae 0x1001eae2a
0x1001eab9d: inc eax
0x1001eab9f: mov dword ptr [r12 + 0xf988], eax
0x1001eaba7: mov rdx, qword ptr [r12 + 0xf990]
0x1001eabaf: xor ecx, ecx
0x1001eabb1: mov eax, 0xffffffe0
0x1001eabb6: nop word ptr cs:[rax + rax]
0x1001eabc0: mov esi, ecx
0x1001eabc2: mov edi, dword ptr [rdx + rsi*4]
0x1001eabc5: inc ecx
0x1001eabc7: add eax, 0x20
0x1001eabca: cmp edi, -1
0x1001eabcd: je 0x1001eabc0
0x1001eabcf: mov ecx, edi
0x1001eabd1: not ecx
0x1001eabd3: bsf ecx, ecx
0x1001eabd6: mov ebx, 1
0x1001eabdb: shl ebx, cl
0x1001eabdd: or ebx, edi
0x1001eabdf: mov dword ptr [rdx + rsi*4], ebx
0x1001eabe2: or eax, ecx
0x1001eabe4: mov r14, qword ptr [r12 + 0xf998]
0x1001eabec: imul rbx, rax, 0x570
0x1001eabf3: lea rdi, [r14 + rbx]
0x1001eabf7: mov esi, 0x570
0x1001eabfc: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x1001eac01: lea rdi, [r14 + rbx + 0x20]
0x1001eac06: call 0x1007f5d80 ; 0x1007f5d80
0x1001eac0b: mov dword ptr [r14 + rbx + 0x564], 0xffffffff
0x1001eac17: mov r13, qword ptr [r12 + 0xf998]
0x1001eac1f: mov byte ptr [r13 + rbx + 0x568], 0
0x1001eac28: mov rdi, qword ptr [r12 + 0x669c0]
0x1001eac30: xor esi, esi
0x1001eac32: call 0x10033f470 ; 0x10033f470
0x1001eac37: mov r14, rax
0x1001eac3a: mov qword ptr [r13 + rbx + 0x10], r14
0x1001eac3f: vmovss xmm0, dword ptr [rip + 0x8ba479] ; 0x100aa50c0
0x1001eac47: vmovaps xmmword ptr [rbp - 0xf0], xmm0
0x1001eac4f: vmovaps xmm0, xmmword ptr [rip + 0x8bd449] ; 0x100aa80a0
0x1001eac57: vmovaps xmmword ptr [rbp - 0xe0], xmm0
0x1001eac5f: vmovaps xmm0, xmmword ptr [rip + 0x8bddc9] ; 0x100aa8a30
0x1001eac67: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x1001eac6f: vmovaps xmm1, xmmword ptr [rip + 0x8bdd89] ; 0x100aa8a00
0x1001eac77: vmovaps xmmword ptr [rbp - 0xc0], xmm1
0x1001eac7f: vmovss xmm0, dword ptr [rip + 0x8bcb61] ; 0x100aa77e8
0x1001eac87: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x1001eac8f: vmovaps xmm0, xmmword ptr [rip + 0x8be599] ; 0x100aa9230
0x1001eac97: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x1001eac9f: vmovaps xmm0, xmmword ptr [rip + 0x8c02f9] ; 0x100aaafa0
0x1001eaca7: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x1001eacaf: vmovaps xmmword ptr [rbp - 0x80], xmm1
0x1001eacb4: lea r15, [rbp - 0x70]
0x1001eacb8: lea rsi, [rbp - 0xf0]
0x1001eacbf: lea rdx, [rbp - 0xb0]
0x1001eacc6: mov rdi, r15
0x1001eacc9: call 0x100076df0 ; 0x100076df0
0x1001eacce: mov rdi, r14
0x1001eacd1: mov rsi, r15
0x1001eacd4: call 0x10033abc0 ; 0x10033abc0
0x1001eacd9: mov rdi, qword ptr [r13 + rbx + 0x10]
0x1001eacde: mov rsi, qword ptr [r12 + 0x669d8]
0x1001eace6: mov rdx, qword ptr [r12 + 0x669e0]
0x1001eacee: call 0x10033afa0 ; 0x10033afa0
0x1001eacf3: mov rdi, qword ptr [r13 + rbx + 0x10]
0x1001eacf8: mov esi, 1
0x1001eacfd: call 0x10033a780 ; 0x10033a780
0x1001ead02: mov rdi, qword ptr [r13 + rbx + 0x10]
0x1001ead07: xor esi, esi
0x1001ead09: call 0x10033ac40 ; 0x10033ac40
0x1001ead0e: mov rax, qword ptr [r13 + rbx + 0x10]
0x1001ead13: mov byte ptr [rax + 0x13f], 1
0x1001ead1a: mov dword ptr [rax + 0xa4], 0x3f800000
0x1001ead24: mov byte ptr [rax + 0xb5], 0
0x1001ead2b: lea rdi, [r13 + rbx + 0x20]
0x1001ead30: mov r8, qword ptr [r12 + 0x669c8]
0x1001ead38: mov rdx, qword ptr [r12 + 0x669d0]
0x1001ead40: lea rsi, [r12 + 0x669e8]
0x1001ead48: add r8, 0x10
0x1001ead4c: lea rcx, [rip + 0x98d1ed] ; 0x100b77f40 Candle
0x1001ead53: mov r9d, 1
0x1001ead59: call 0x1007f5d90 ; 0x1007f5d90
0x1001ead5e: mov dword ptr [r13 + rbx + 0x560], 0
0x1001ead6a: mov rax, qword ptr [rip + 0x1bf398f] ; 0x101dde700
0x1001ead71: lea rcx, [rax + 0xf6e0]
0x1001ead78: mov qword ptr [r13 + rbx + 0x18], rcx
0x1001ead7d: mov rcx, qword ptr [r13 + rbx + 0x10]
0x1001ead82: mov eax, dword ptr [rax + 0xf74c]
0x1001ead88: mov dword ptr [rcx + 0x11c], eax
0x1001ead8e: cmp byte ptr [r13 + rbx + 0x54a], 1
0x1001ead97: je 0x1001eae46
0x1001ead9d: lea r14, [r13 + rbx]
0x1001eada2: mov dword ptr [r13 + rbx + 0x528], 0
0x1001eadae: vmovss xmm0, dword ptr [rip + 0x8ba30a] ; 0x100aa50c0
0x1001eadb6: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1001eadbb: vmovaps xmm0, xmmword ptr [rip + 0x8bd2dd] ; 0x100aa80a0
0x1001eadc3: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001eadc8: vmovaps xmm0, xmmword ptr [rip + 0x8bdc60] ; 0x100aa8a30
0x1001eadd0: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1001eadd5: vmovaps xmm0, xmmword ptr [rip + 0x8bdc23] ; 0x100aa8a00
0x1001eaddd: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1001eade2: lea rsi, [rbp - 0x70]
0x1001eade6: mov rdi, r14
0x1001eade9: call 0x1001eaf00 ; 0x1001eaf00
0x1001eadee: cmp byte ptr [r13 + rbx + 0x558], 0
0x1001eadf7: je 0x1001eae6e
0x1001eadf9: lea rdi, [r13 + rbx + 0x290]
0x1001eae01: lea rsi, [rip + 0x98d13f] ; 0x100b77f47 u_color
0x1001eae08: call 0x1007bdb60 ; 0x1007bdb60
0x1001eae0d: mov dword ptr [r13 + rbx + 0x564], eax
0x1001eae15: mov rax, r14
0x1001eae18: add rsp, 0xc8
0x1001eae1f: pop rbx
0x1001eae20: pop r12
0x1001eae22: pop r13
0x1001eae24: pop r14
0x1001eae26: pop r15
0x1001eae28: pop rbp
0x1001eae29: ret 
0x1001eae2a: lea rdi, [rip + 0x98ca01] ; 0x100b77832 m_count < kCapacity
0x1001eae31: lea rsi, [rip + 0x989141] ; 0x100b73f79 ../../../Code/Base/ObjectPool.h
0x1001eae38: lea r8, [rip + 0x98ca07] ; 0x100b77846 ObjectPool exceeded maximum capacity
0x1001eae3f: mov edx, 0x47
0x1001eae44: jmp 0x1001eae60 ; 0x1001eae60
0x1001eae46: lea rdi, [rip + 0x977424] ; 0x100b62271 !m_queued
0x1001eae4d: lea rsi, [rip + 0x977427] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1001eae54: lea r8, [rip + 0x97743c] ; 0x100b62297 VertexRender has already been committed!
0x1001eae5b: mov edx, 0x8e
0x1001eae60: mov ecx, 4
0x1001eae65: xor eax, eax
0x1001eae67: call 0x1007e6030 ; 0x1007e6030
0x1001eae6c: ud2 
0x1001eae6e: lea rdi, [rip + 0x98be75] ; 0x100b76cea IsInitialized()
0x1001eae75: lea rsi, [rip + 0x9773ff] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1001eae7c: mov edx, 0xa8
0x1001eae81: mov ecx, 3
0x1001eae86: call 0x1007e5f70 ; 0x1007e5f70
0x1001eae8b: ud2 
0x1001eae8d: nop dword ptr [rax]
