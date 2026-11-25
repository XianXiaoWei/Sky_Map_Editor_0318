0x1001add30: push rbp
0x1001add31: mov rbp, rsp
0x1001add34: push rbx
0x1001add35: push rax
0x1001add36: mov rbx, qword ptr [rdi + 0x12010]
0x1001add3d: test rbx, rbx
0x1001add40: je 0x1001ade89
0x1001add46: mov rax, qword ptr [rbx]
0x1001add49: mov qword ptr [rdi + 0x12010], rax
0x1001add50: call 0x1007abc10 ; 0x1007abc10
0x1001add55: mov rax, qword ptr [rip + 0x1c2d0a4] ; 0x101ddae00
0x1001add5c: mov eax, dword ptr [rax + 0x38]
0x1001add5f: mov dword ptr [rbx], eax
0x1001add61: mov dword ptr [rbx + 0x78], 0
0x1001add68: mov byte ptr [rbx + 0x7c], 0
0x1001add6c: vxorps xmm0, xmm0, xmm0
0x1001add70: vmovaps xmmword ptr [rbx + 0x80], xmm0
0x1001add78: mov word ptr [rbx + 0x90], 0
0x1001add81: mov dword ptr [rbx + 0x94], 0x3dcccccd
0x1001add8b: mov word ptr [rbx + 0x98], 1
0x1001add94: mov qword ptr [rbx + 0x100], 0
0x1001add9f: vmovss xmm0, dword ptr [rip + 0x8f7319] ; 0x100aa50c0
0x1001adda7: vmovaps xmmword ptr [rbx + 0x10], xmm0
0x1001addac: vmovaps xmm0, xmmword ptr [rip + 0x8fa2ec] ; 0x100aa80a0
0x1001addb4: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x1001addb9: vmovaps xmm0, xmmword ptr [rip + 0x8fac6f] ; 0x100aa8a30
0x1001addc1: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x1001addc6: vmovaps xmm0, xmmword ptr [rip + 0x8fac32] ; 0x100aa8a00
0x1001addce: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x1001addd3: mov dword ptr [rbx + 0x68], 0xffffffff
0x1001addda: mov qword ptr [rbx + 0xcc], 0
0x1001adde5: mov qword ptr [rbx + 0xa8], 0
0x1001addf0: mov dword ptr [rbx + 0xb0], 0
0x1001addfa: mov byte ptr [rbx + 0x56], 0
0x1001addfe: mov byte ptr [rbx + 0xc8], 0
0x1001ade05: mov byte ptr [rbx + 0xc9], 0
0x1001ade0c: mov word ptr [rbx + 0xa4], 0
0x1001ade15: mov qword ptr [rbx + 0x9c], 0
0x1001ade20: mov eax, dword ptr [rip + 0xb76176] ; 0x100d23f9c
0x1001ade26: mov dword ptr [rbx + 0x50], eax
0x1001ade29: mov qword ptr [rbx + 0xe0], 0
0x1001ade34: movabs rax, 0x3dcccccd00000000
0x1001ade3e: mov qword ptr [rbx + 0xd4], rax
0x1001ade45: movabs rax, 0x3f80000000000000
0x1001ade4f: mov qword ptr [rbx + 0xb4], rax
0x1001ade56: mov qword ptr [rbx + 0xc0], 0
0x1001ade61: mov byte ptr [rbx + 0xca], 0
0x1001ade68: vmovaps xmm0, xmmword ptr [rip + 0x8fca50] ; 0x100aaa8c0
0x1001ade70: vmovaps xmmword ptr [rbx + 0xf0], xmm0
0x1001ade78: mov byte ptr [rbx + 0xa1], 1
0x1001ade7f: mov rax, rbx
0x1001ade82: add rsp, 8
0x1001ade86: pop rbx
0x1001ade87: pop rbp
0x1001ade88: ret 
0x1001ade89: lea rdi, [rip + 0x9ca169] ; 0x100b77ff9 b
0x1001ade90: lea rsi, [rip + 0x9c9ff4] ; 0x100b77e8b Blaze.cpp
0x1001ade97: mov edx, 0x419
0x1001ade9c: mov ecx, 3
0x1001adea1: call 0x1007e5f70 ; 0x1007e5f70
0x1001adea6: ud2 
0x1001adea8: nop dword ptr [rax + rax]
