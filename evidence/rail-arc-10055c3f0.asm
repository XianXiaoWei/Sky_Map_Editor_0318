0x10055c3f0: push rbp
0x10055c3f1: mov rbp, rsp
0x10055c3f4: push r14
0x10055c3f6: push rbx
0x10055c3f7: mov r14, rdi
0x10055c3fa: mov rbx, qword ptr [r14 + 0xa010]
0x10055c401: test rbx, rbx
0x10055c404: je 0x10055c511
0x10055c40a: mov rax, qword ptr [rbx]
0x10055c40d: mov qword ptr [r14 + 0xa010], rax
0x10055c414: call 0x1007abc10 ; 0x1007abc10
0x10055c419: mov rax, qword ptr [rip + 0x1ac0468] ; 0x10201c888
0x10055c420: mov eax, dword ptr [rax + 0x38]
0x10055c423: mov dword ptr [rbx], eax
0x10055c425: mov qword ptr [rbx + 8], 0
0x10055c42d: mov dword ptr [rbx + 0x10], 0x10
0x10055c434: mov dword ptr [rbx + 0x18], 0
0x10055c43b: mov qword ptr [rbx + 0x20], 0
0x10055c443: mov byte ptr [rbx + 0x2c], 0
0x10055c447: lea rax, [rip + 0x1ae3212] ; 0x10203f660
0x10055c44e: vmovaps xmm0, xmmword ptr [rax]
0x10055c452: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x10055c457: vxorps ymm0, ymm0, ymm0
0x10055c45b: vmovups ymmword ptr [rbx + 0xa0], ymm0
0x10055c463: vmovups ymmword ptr [rbx + 0x90], ymm0
0x10055c46b: mov eax, dword ptr [r14 + 0xa018]
0x10055c472: lea ecx, [rax + 1]
0x10055c475: mov dword ptr [r14 + 0xa018], ecx
0x10055c47c: mov dword ptr [rbx + 0xec], eax
0x10055c482: mov byte ptr [rbx + 0x40], 0
0x10055c486: add r14, 0xa020
0x10055c48d: mov qword ptr [rbx + 0xf0], r14
0x10055c494: mov qword ptr [rbx + 8], 0
0x10055c49c: mov dword ptr [rbx + 0x14], 0
0x10055c4a3: mov byte ptr [rbx + 0x1c], 1
0x10055c4a7: mov byte ptr [rbx + 0xe0], 1
0x10055c4ae: mov qword ptr [rbx + 0xb8], 0
0x10055c4b9: mov dword ptr [rbx + 0x28], 0
0x10055c4c0: vmovups ymmword ptr [rbx + 0x90], ymm0
0x10055c4c8: vmovss xmm0, dword ptr [rip + 0x548bf0] ; 0x100aa50c0
0x10055c4d0: vmovaps xmmword ptr [rbx + 0x50], xmm0
0x10055c4d5: vmovaps xmm0, xmmword ptr [rip + 0x54bbc3] ; 0x100aa80a0
0x10055c4dd: vmovaps xmmword ptr [rbx + 0x60], xmm0
0x10055c4e2: vmovaps xmm0, xmmword ptr [rip + 0x54c546] ; 0x100aa8a30
0x10055c4ea: vmovaps xmmword ptr [rbx + 0x70], xmm0
0x10055c4ef: vmovaps xmm0, xmmword ptr [rip + 0x54c509] ; 0x100aa8a00
0x10055c4f7: vmovaps xmmword ptr [rbx + 0x80], xmm0
0x10055c4ff: mov byte ptr [rbx + 0xe8], 1
0x10055c506: mov rax, rbx
0x10055c509: pop rbx
0x10055c50a: pop r14
0x10055c50c: pop rbp
0x10055c50d: vzeroupper 
0x10055c510: ret 
0x10055c511: lea rdi, [rip + 0x63530a] ; 0x100b91822 newRail
0x10055c518: lea rsi, [rip + 0x63520d] ; 0x100b9172c Rail.cpp
0x10055c51f: mov edx, 0x514
0x10055c524: mov ecx, 3
0x10055c529: call 0x1007e5f70 ; 0x1007e5f70
0x10055c52e: ud2 
