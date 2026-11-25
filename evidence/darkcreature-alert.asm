0x10026d2a0: push rbp
0x10026d2a1: mov rbp, rsp
0x10026d2a4: push r15
0x10026d2a6: push r14
0x10026d2a8: push r13
0x10026d2aa: push r12
0x10026d2ac: push rbx
0x10026d2ad: sub rsp, 0x28
0x10026d2b1: mov r13, r8
0x10026d2b4: mov r14, rcx
0x10026d2b7: mov r15, rdx
0x10026d2ba: mov r12, rsi
0x10026d2bd: mov rbx, rdi
0x10026d2c0: cmp byte ptr [rbx + 0x2c3], 0
0x10026d2c7: je 0x10026d3fc
0x10026d2cd: cmp byte ptr [rbx + 0x2c4], 0
0x10026d2d4: je 0x10026d3fc
0x10026d2da: cmp byte ptr [rbx + 0x2c5], 0
0x10026d2e1: je 0x10026d308
0x10026d2e3: vaddss xmm0, xmm0, dword ptr [rbx + 0x17c]
0x10026d2eb: vmovss dword ptr [rbx + 0x17c], xmm0
0x10026d2f3: mov rax, qword ptr [rbx + 0x50]
0x10026d2f7: vucomiss xmm0, dword ptr [rax + 8]
0x10026d2fc: jbe 0x10026d308
0x10026d2fe: xor esi, esi
0x10026d300: mov rdi, rbx
0x10026d303: call 0x10026d0f0 ; 0x10026d0f0
0x10026d308: mov eax, dword ptr [rbx + 0x2e0]
0x10026d30e: cmp eax, 2
0x10026d311: je 0x10026d3fc
0x10026d317: mov cl, byte ptr [rbx + 0x2d0]
0x10026d31d: cmp byte ptr [rbx + 0x2c5], 0
0x10026d324: je 0x10026d3a5
0x10026d326: lea rsi, [rbx + 0x2c7]
0x10026d32d: xor eax, eax
0x10026d32f: mov byte ptr [rsi], al
0x10026d331: test cl, cl
0x10026d333: jne 0x10026d3fc
0x10026d339: cmp byte ptr [rbx + 0x2d0], 0
0x10026d340: je 0x10026d3fc
0x10026d346: mov dword ptr [rbx + 0x180], 0x41200000
0x10026d350: mov rsi, qword ptr [rbx + 0x208]
0x10026d357: lea rdi, [rbp - 0x40]
0x10026d35b: call 0x1007f2a00 ; 0x1007f2a00
0x10026d360: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10026d365: vmovaps xmmword ptr [rbx + 0x190], xmm0
0x10026d36d: mov dword ptr [rbx + 0x140], 0
0x10026d377: mov dword ptr [rbx + 0x100], 0
0x10026d381: vmovaps xmm0, xmmword ptr [rbx + 0xa0]
0x10026d389: vmulps xmm0, xmm0, xmmword ptr [rip + 0x83abcf] ; 0x100aa7f60
0x10026d391: vmovaps xmmword ptr [rbx + 0xa0], xmm0
0x10026d399: mov dword ptr [rbx + 0x2e0], 4
0x10026d3a3: jmp 0x10026d3fc ; 0x10026d3fc
0x10026d3a5: cmp byte ptr [rbx + 0x1d4], 0
0x10026d3ac: je 0x10026d326
0x10026d3b2: lea rsi, [rbx + 0x2c7]
0x10026d3b9: cmp eax, 3
0x10026d3bc: je 0x10026d32d
0x10026d3c2: lea rdx, [rbx + 0x1b0]
0x10026d3c9: vmovss xmm0, dword ptr [rbx + 0x1d0]
0x10026d3d1: mov qword ptr [rsp], r13
0x10026d3d5: mov rdi, rbx
0x10026d3d8: mov r13, rsi
0x10026d3db: mov byte ptr [rbp - 0x29], cl
0x10026d3de: mov rcx, r12
0x10026d3e1: mov r8, r15
0x10026d3e4: mov r9, r14
0x10026d3e7: call 0x10026d410 ; 0x10026d410
0x10026d3ec: mov rsi, r13
0x10026d3ef: mov cl, byte ptr [rbp - 0x29]
0x10026d3f2: mov byte ptr [rsi], al
0x10026d3f4: test cl, cl
0x10026d3f6: je 0x10026d339
0x10026d3fc: add rsp, 0x28
0x10026d400: pop rbx
0x10026d401: pop r12
0x10026d403: pop r13
0x10026d405: pop r14
0x10026d407: pop r15
0x10026d409: pop rbp
0x10026d40a: ret 
0x10026d40b: nop dword ptr [rax + rax]
