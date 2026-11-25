0x1004d2140: push rbp
0x1004d2141: mov rbp, rsp
0x1004d2144: push r15
0x1004d2146: push r14
0x1004d2148: push r12
0x1004d214a: push rbx
0x1004d214b: sub rsp, 0x60
0x1004d214f: mov rbx, rdi
0x1004d2152: mov qword ptr [rbp - 0x28], rsi
0x1004d2156: vmovss xmm0, dword ptr [rip + 0x5d2f62] ; 0x100aa50c0
0x1004d215e: vmovaps xmmword ptr [rbx], xmm0
0x1004d2162: vmovaps xmm0, xmmword ptr [rip + 0x5d5f36] ; 0x100aa80a0
0x1004d216a: vmovaps xmmword ptr [rbx + 0x10], xmm0
0x1004d216f: vmovaps xmm0, xmmword ptr [rip + 0x5d68b9] ; 0x100aa8a30
0x1004d2177: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x1004d217c: vmovaps xmm0, xmmword ptr [rip + 0x5d687c] ; 0x100aa8a00
0x1004d2184: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x1004d2189: test rsi, rsi
0x1004d218c: je 0x1004d2224
0x1004d2192: mov edi, dword ptr [rsi]
0x1004d2194: call 0x1007abd30 ; 0x1007abd30
0x1004d2199: mov rcx, qword ptr [rax]
0x1004d219c: mov rdi, rax
0x1004d219f: call qword ptr [rcx + 0x68]
0x1004d21a2: test rax, rax
0x1004d21a5: jne 0x1004d21ac
0x1004d21a7: call 0x1007abc60 ; 0x1007abc60
0x1004d21ac: movzx edx, byte ptr [rip + 0x800f6d] ; 0x100cd3120
0x1004d21b3: lea rsi, [rip + 0x6a10b2] ; 0x100b7326c GetObb
0x1004d21ba: mov rdi, rax
0x1004d21bd: call 0x1004d2330 ; 0x1004d2330
0x1004d21c2: mov r14, rax
0x1004d21c5: test r14, r14
0x1004d21c8: je 0x1004d2224
0x1004d21ca: call 0x1007abc10 ; 0x1007abc10
0x1004d21cf: mov r12, rax
0x1004d21d2: lea rdi, [rbp - 0x70]
0x1004d21d6: call 0x1007fa3b0 ; 0x1007fa3b0
0x1004d21db: mov r15, rax
0x1004d21de: mov qword ptr [rbp - 0x70], 0
0x1004d21e6: call qword ptr [r14 + 0x58]
0x1004d21ea: mov r8, qword ptr [rax]
0x1004d21ed: lea rsi, [rbp - 0x70]
0x1004d21f1: lea rdx, [rbp - 0x28]
0x1004d21f5: mov rdi, rax
0x1004d21f8: mov rcx, r12
0x1004d21fb: call qword ptr [r8 + 0x40]
0x1004d21ff: mov rdx, qword ptr [rbp - 0x70]
0x1004d2203: test rdx, rdx
0x1004d2206: je 0x1004d2234
0x1004d2208: mov rdi, qword ptr [r14 + 0x38]
0x1004d220c: mov rsi, qword ptr [r14 + 0x40]
0x1004d2210: mov dword ptr [rsp], 0
0x1004d2217: xor r9d, r9d
0x1004d221a: mov rcx, rbx
0x1004d221d: mov r8, r15
0x1004d2220: call qword ptr [r14 + 0x48]
0x1004d2224: mov rax, rbx
0x1004d2227: add rsp, 0x60
0x1004d222b: pop rbx
0x1004d222c: pop r12
0x1004d222e: pop r14
0x1004d2230: pop r15
0x1004d2232: pop rbp
0x1004d2233: ret 
0x1004d2234: lea rdi, [rip + 0x6a5c3b] ; 0x100b77e76 c
0x1004d223b: lea rsi, [rip + 0x68b396] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1004d2242: mov edx, 0x443
0x1004d2247: mov ecx, 3
0x1004d224c: call 0x1007e5f70 ; 0x1007e5f70
0x1004d2251: ud2 
0x1004d2253: nop word ptr cs:[rax + rax]
