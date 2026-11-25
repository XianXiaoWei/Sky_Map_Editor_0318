0x10055d310: push rbp
0x10055d311: mov rbp, rsp
0x10055d314: mov esi, dword ptr [rdi + 0x28]
0x10055d317: cmp rsi, 2
0x10055d31b: jb 0x10055d403
0x10055d321: mov ecx, esi
0x10055d323: not ecx
0x10055d325: mov rax, qword ptr [rdi + 0xb8]
0x10055d32c: vmovss xmm0, dword ptr [rax]
0x10055d330: and ecx, 1
0x10055d333: cmp esi, 2
0x10055d336: jne 0x10055d34a
0x10055d338: mov edx, 1
0x10055d33d: test ecx, ecx
0x10055d33f: jne 0x10055d3cf
0x10055d345: jmp 0x10055d403 ; 0x10055d403
0x10055d34a: sub rsi, rcx
0x10055d34d: mov edx, 1
0x10055d352: vmovss xmm1, dword ptr [rip + 0x54b2a6] ; 0x100aa8600
0x10055d35a: vmovss xmm2, dword ptr [rip + 0x54b656] ; 0x100aa89b8
0x10055d362: nop word ptr cs:[rax + rax]
0x10055d370: vmovss xmm3, dword ptr [rax + rdx*4]
0x10055d375: vmovss xmm4, dword ptr [rax + rdx*4 + 4]
0x10055d37b: vsubss xmm3, xmm3, xmm0
0x10055d37f: vaddss xmm5, xmm3, xmm1
0x10055d383: vdivss xmm5, xmm5, xmm2
0x10055d387: vroundss xmm5, xmm5, xmm5, 9
0x10055d38d: vmulss xmm5, xmm5, xmm2
0x10055d391: vsubss xmm3, xmm3, xmm5
0x10055d395: vaddss xmm0, xmm0, xmm3
0x10055d399: vmovss dword ptr [rax + rdx*4], xmm0
0x10055d39e: vsubss xmm3, xmm4, xmm0
0x10055d3a2: vaddss xmm4, xmm3, xmm1
0x10055d3a6: vdivss xmm4, xmm4, xmm2
0x10055d3aa: vroundss xmm4, xmm4, xmm4, 9
0x10055d3b0: vmulss xmm4, xmm4, xmm2
0x10055d3b4: vsubss xmm3, xmm3, xmm4
0x10055d3b8: vaddss xmm0, xmm0, xmm3
0x10055d3bc: vmovss dword ptr [rax + rdx*4 + 4], xmm0
0x10055d3c2: add rdx, 2
0x10055d3c6: cmp rsi, rdx
0x10055d3c9: jne 0x10055d370
0x10055d3cb: test ecx, ecx
0x10055d3cd: je 0x10055d403
0x10055d3cf: vmovss xmm1, dword ptr [rax + rdx*4]
0x10055d3d4: vsubss xmm1, xmm1, xmm0
0x10055d3d8: vaddss xmm2, xmm1, dword ptr [rip + 0x54b220] ; 0x100aa8600
0x10055d3e0: vmovss xmm3, dword ptr [rip + 0x54b5d0] ; 0x100aa89b8
0x10055d3e8: vdivss xmm2, xmm2, xmm3
0x10055d3ec: vroundss xmm2, xmm2, xmm2, 9
0x10055d3f2: vmulss xmm2, xmm2, xmm3
0x10055d3f6: vsubss xmm1, xmm1, xmm2
0x10055d3fa: vaddss xmm0, xmm0, xmm1
0x10055d3fe: vmovss dword ptr [rax + rdx*4], xmm0
0x10055d403: pop rbp
0x10055d404: ret 
0x10055d405: nop word ptr cs:[rax + rax]
