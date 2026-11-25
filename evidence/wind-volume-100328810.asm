0x100328810: push rbp
0x100328811: mov rbp, rsp
0x100328814: push r15
0x100328816: push r14
0x100328818: push r13
0x10032881a: push r12
0x10032881c: push rbx
0x10032881d: sub rsp, 0x148
0x100328824: mov r15, rcx
0x100328827: mov qword ptr [rbp - 0x38], rdx
0x10032882b: mov rbx, rsi
0x10032882e: mov r14, rdi
0x100328831: vmovss xmm1, dword ptr [rbx + 0x58]
0x100328836: vxorps xmm0, xmm0, xmm0
0x10032883a: vucomiss xmm1, xmm0
0x10032883e: jne 0x100328990
0x100328844: jp 0x100328990
0x10032884a: vmovss xmm1, dword ptr [rip + 0x77c86e] ; 0x100aa50c0
0x100328852: cmp byte ptr [rbx + 0x50], 0
0x100328856: vxorps xmm2, xmm2, xmm2
0x10032885a: je 0x100328860
0x10032885c: vmovaps xmm2, xmm1
0x100328860: vucomiss xmm2, xmm0
0x100328864: jbe 0x100328951
0x10032886a: vmovss dword ptr [rbp - 0x2c], xmm2
0x10032886f: mov rdi, qword ptr [rbx + 0x70]
0x100328873: test rdi, rdi
0x100328876: je 0x1003289af
0x10032887c: lea rdx, [rbp - 0x90]
0x100328883: mov r12, qword ptr [rbp - 0x38]
0x100328887: mov rsi, r12
0x10032888a: call 0x10055d820 ; 0x10055d820
0x10032888f: mov rsi, qword ptr [rbx + 0x70]
0x100328893: lea rdi, [rbp - 0xf0]
0x10032889a: call 0x100560b40 ; 0x100560b40
0x10032889f: vmovaps xmm0, xmmword ptr [r12]
0x1003288a5: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x90]
0x1003288ad: vmulps xmm0, xmm0, xmm0
0x1003288b1: vmovshdup xmm1, xmm0
0x1003288b5: vaddss xmm1, xmm0, xmm1
0x1003288b9: vpermilpd xmm0, xmm0, 1
0x1003288bf: vaddss xmm0, xmm0, xmm1
0x1003288c3: vsqrtss xmm0, xmm0, xmm0
0x1003288c7: vmovaps xmm1, xmmword ptr [rbp - 0xf0]
0x1003288cf: vmovaps xmm2, xmmword ptr [rbp - 0xe0]
0x1003288d7: vmulps xmm1, xmm1, xmm1
0x1003288db: vmovshdup xmm3, xmm1
0x1003288df: vaddss xmm3, xmm1, xmm3
0x1003288e3: vpermilpd xmm1, xmm1, 1
0x1003288e9: vaddss xmm1, xmm1, xmm3
0x1003288ed: vsqrtss xmm1, xmm1, xmm1
0x1003288f1: vmulps xmm2, xmm2, xmm2
0x1003288f5: vmovshdup xmm3, xmm2
0x1003288f9: vaddss xmm3, xmm2, xmm3
0x1003288fd: vpermilpd xmm2, xmm2, 1
0x100328903: vaddss xmm2, xmm2, xmm3
0x100328907: vsqrtss xmm2, xmm2, xmm2
0x10032890b: vmaxss xmm3, xmm2, xmm1
0x10032890f: vcmpunordss xmm1, xmm1, xmm1
0x100328914: vblendvps xmm1, xmm3, xmm2, xmm1
0x10032891a: vmovss xmm3, dword ptr [rbx + 0x54]
0x10032891f: vxorps xmm2, xmm2, xmm2
0x100328923: vucomiss xmm3, xmm2
0x100328927: jne 0x100328b5c
0x10032892d: jp 0x100328b5c
0x100328933: vcmpltss xmm0, xmm0, xmm1
0x100328938: vmovss xmm1, dword ptr [rip + 0x77c780] ; 0x100aa50c0
0x100328940: vandps xmm0, xmm0, xmm1
0x100328944: vmovaps xmm2, xmmword ptr [rbp - 0xd0]
0x10032894c: jmp 0x100328ba7 ; 0x100328ba7
0x100328951: vmovaps xmm1, xmmword ptr [rip + 0x7800d7] ; 0x100aa8a30
0x100328959: vmulss xmm0, xmm2, xmm0
0x10032895d: test r15, r15
0x100328960: je 0x100328967
0x100328962: vmovss dword ptr [r15], xmm0
0x100328967: vmulss xmm0, xmm0, dword ptr [rbx + 0x5c]
0x10032896c: vpermilps xmm0, xmm0, 0xc0
0x100328972: vmulps xmm0, xmm1, xmm0
0x100328976: vmovaps xmmword ptr [r14], xmm0
0x10032897b: mov rax, r14
0x10032897e: add rsp, 0x148
0x100328985: pop rbx
0x100328986: pop r12
0x100328988: pop r13
0x10032898a: pop r14
0x10032898c: pop r15
0x10032898e: pop rbp
0x10032898f: ret 
0x100328990: vmovss xmm2, dword ptr [rbx + 0xc8]
0x100328998: vdivss xmm1, xmm2, xmm1
0x10032899c: cmp byte ptr [rbx + 0x50], 0
0x1003289a0: vxorps xmm2, xmm2, xmm2
0x1003289a4: jne 0x10032885c
0x1003289aa: jmp 0x100328860 ; 0x100328860
0x1003289af: mov qword ptr [rbp - 0x50], r14
0x1003289b3: lea rsi, [rbx + 0x10]
0x1003289b7: vmovss xmm0, dword ptr [rip + 0x77bbf9] ; 0x100aa45b8
0x1003289bf: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x1003289c7: vmovaps xmm0, xmmword ptr [rip + 0x77ef21] ; 0x100aa78f0
0x1003289cf: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1003289d4: vmovaps xmm0, xmmword ptr [rip + 0x789c04] ; 0x100ab25e0
0x1003289dc: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1003289e1: vmovaps xmm0, xmmword ptr [rip + 0x780017] ; 0x100aa8a00
0x1003289e9: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1003289ee: lea r14, [rbp - 0xf0]
0x1003289f5: lea rdx, [rbp - 0x90]
0x1003289fc: mov rdi, r14
0x1003289ff: call 0x100076df0 ; 0x100076df0
0x100328a04: mov rax, qword ptr [rbp - 0x38]
0x100328a08: vmovaps xmm0, xmmword ptr [rax]
0x100328a0c: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x100328a14: lea rdi, [rbp - 0xb0]
0x100328a1b: mov rsi, r14
0x100328a1e: call 0x10078ce10 ; 0x10078ce10
0x100328a23: vmovaps xmm2, xmm0
0x100328a27: mov rax, qword ptr [rbx + 0x68]
0x100328a2b: test rax, rax
0x100328a2e: mov qword ptr [rbp - 0x48], r15
0x100328a32: je 0x100328b31
0x100328a38: cmp dword ptr [rax + 0x10], 0
0x100328a3c: je 0x100328b31
0x100328a42: mov r13b, 1
0x100328a45: nop word ptr cs:[rax + rax]
0x100328a50: vmovss dword ptr [rbp - 0x3c], xmm2
0x100328a55: mov r14, rbx
0x100328a58: mov ecx, r13d
0x100328a5b: dec cl
0x100328a5d: mov rax, qword ptr [rax + 8]
0x100328a61: movzx ecx, cl
0x100328a64: mov rax, qword ptr [rax + rcx*8]
0x100328a68: mov qword ptr [rbp - 0x130], rax
0x100328a6f: call 0x1007abc10 ; 0x1007abc10
0x100328a74: mov r12, rax
0x100328a77: mov qword ptr [rbp - 0x90], 0
0x100328a82: call 0x10043ccc0 ; 0x10043ccc0
0x100328a87: mov rbx, qword ptr [rax]
0x100328a8a: mov rdi, rax
0x100328a8d: lea rsi, [rbp - 0x90]
0x100328a94: lea rdx, [rbp - 0x130]
0x100328a9b: mov rcx, r12
0x100328a9e: call qword ptr [rbx + 0x40]
0x100328aa1: mov r12, qword ptr [rbp - 0x90]
0x100328aa8: test r12, r12
0x100328aab: je 0x100328bf4
0x100328ab1: mov rax, qword ptr [rbp - 0x38]
0x100328ab5: vmovaps xmm0, xmmword ptr [rax]
0x100328ab9: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x100328ac1: mov rax, qword ptr [r12]
0x100328ac5: lea r15, [rbp - 0x170]
0x100328acc: mov rdi, r15
0x100328acf: mov rsi, r12
0x100328ad2: call qword ptr [rax + 0x18]
0x100328ad5: mov rax, qword ptr [r12]
0x100328ad9: lea r15, [rbp - 0x130]
0x100328ae0: mov rdi, r15
0x100328ae3: mov rsi, r12
0x100328ae6: call qword ptr [rax + 0x20]
0x100328ae9: lea rbx, [rbp - 0x90]
0x100328af0: mov rdi, rbx
0x100328af3: lea rsi, [rbp - 0x170]
0x100328afa: mov rdx, r15
0x100328afd: call 0x100076df0 ; 0x100076df0
0x100328b02: lea rdi, [rbp - 0xa0]
0x100328b09: mov rsi, rbx
0x100328b0c: call 0x10078ce10 ; 0x10078ce10
0x100328b11: vmovss xmm2, dword ptr [rbp - 0x3c]
0x100328b16: vminss xmm2, xmm0, xmm2
0x100328b1a: movzx ecx, r13b
0x100328b1e: mov rbx, r14
0x100328b21: mov rax, qword ptr [rbx + 0x68]
0x100328b25: inc r13b
0x100328b28: cmp dword ptr [rax + 0x10], ecx
0x100328b2b: ja 0x100328a50
0x100328b31: vmovss xmm1, dword ptr [rbx + 0x54]
0x100328b36: vxorps xmm0, xmm0, xmm0
0x100328b3a: vucomiss xmm1, xmm0
0x100328b3e: jne 0x100328b82
0x100328b40: jp 0x100328b82
0x100328b42: vucomiss xmm2, xmm0
0x100328b46: mov r14, qword ptr [rbp - 0x50]
0x100328b4a: mov r15, qword ptr [rbp - 0x48]
0x100328b4e: jne 0x100328ba2
0x100328b50: jp 0x100328ba2
0x100328b52: vmovss xmm0, dword ptr [rip + 0x77c566] ; 0x100aa50c0
0x100328b5a: jmp 0x100328ba2 ; 0x100328ba2
0x100328b5c: vsubss xmm0, xmm1, xmm0
0x100328b60: vdivss xmm0, xmm0, xmm3
0x100328b64: vmovss xmm1, dword ptr [rip + 0x77c554] ; 0x100aa50c0
0x100328b6c: vaddss xmm0, xmm0, xmm1
0x100328b70: vmaxss xmm0, xmm2, xmm0
0x100328b74: vminss xmm0, xmm1, xmm0
0x100328b78: vmovaps xmm2, xmmword ptr [rbp - 0xd0]
0x100328b80: jmp 0x100328ba7 ; 0x100328ba7
0x100328b82: vdivss xmm1, xmm2, xmm1
0x100328b86: vmovss xmm2, dword ptr [rip + 0x77c532] ; 0x100aa50c0
0x100328b8e: vsubss xmm1, xmm2, xmm1
0x100328b92: vmaxss xmm0, xmm0, xmm1
0x100328b96: vminss xmm0, xmm2, xmm0
0x100328b9a: mov r14, qword ptr [rbp - 0x50]
0x100328b9e: mov r15, qword ptr [rbp - 0x48]
0x100328ba2: vmovaps xmm2, xmmword ptr [rbx + 0x30]
0x100328ba7: vxorps xmm1, xmm2, xmmword ptr [rip + 0x77ed51] ; 0x100aa7900
0x100328baf: vmulps xmm2, xmm2, xmm2
0x100328bb3: vmovshdup xmm3, xmm2
0x100328bb7: vaddss xmm3, xmm2, xmm3
0x100328bbb: vpermilpd xmm2, xmm2, 1
0x100328bc1: vaddss xmm2, xmm2, xmm3
0x100328bc5: vsqrtss xmm2, xmm2, xmm2
0x100328bc9: vucomiss xmm2, dword ptr [rip + 0x77ecf3] ; 0x100aa78c4
0x100328bd1: jbe 0x100328bdd
0x100328bd3: vpermilps xmm2, xmm2, 0xc0
0x100328bd9: vdivps xmm1, xmm1, xmm2
0x100328bdd: vmovss xmm2, dword ptr [rbp - 0x2c]
0x100328be2: vmulss xmm0, xmm2, xmm0
0x100328be6: test r15, r15
0x100328be9: jne 0x100328962
0x100328bef: jmp 0x100328967 ; 0x100328967
0x100328bf4: lea rdi, [rip + 0x838efd] ; 0x100b61af8 ret
0x100328bfb: lea rsi, [rip + 0x838d61] ; 0x100b61963 ./Clump.h
0x100328c02: mov edx, 0x47
0x100328c07: mov ecx, 3
0x100328c0c: call 0x1007e5f70 ; 0x1007e5f70
0x100328c11: ud2 
0x100328c13: nop word ptr cs:[rax + rax]
