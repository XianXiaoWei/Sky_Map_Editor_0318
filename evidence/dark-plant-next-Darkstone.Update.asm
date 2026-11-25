0x10027b7f0: push rbp
0x10027b7f1: mov rbp, rsp
0x10027b7f4: push r15
0x10027b7f6: push r14
0x10027b7f8: push r13
0x10027b7fa: push r12
0x10027b7fc: push rbx
0x10027b7fd: and rsp, 0xffffffffffffffe0
0x10027b801: sub rsp, 0x8c0
0x10027b808: vmovsd qword ptr [rsp + 0x60], xmm1
0x10027b80e: vmovss dword ptr [rsp + 0xbc], xmm0
0x10027b817: mov qword ptr [rsp + 0xd8], r8
0x10027b81f: mov qword ptr [rsp + 0x148], rcx
0x10027b827: mov qword ptr [rsp + 0x40], rdx
0x10027b82c: mov qword ptr [rsp + 0x100], rsi
0x10027b834: mov r13, rdi
0x10027b837: mov rax, qword ptr [rip + 0x99209a] ; 0x100c0d8d8
0x10027b83e: mov rax, qword ptr [rax]
0x10027b841: mov qword ptr [rsp + 0x8a0], rax
0x10027b849: vmovaps xmm0, xmmword ptr [r13 + 0xb0]
0x10027b852: vmovaps xmmword ptr [rsp + 0x90], xmm0
0x10027b85b: mov rsi, qword ptr [r13 + 0x170]
0x10027b862: test rsi, rsi
0x10027b865: je 0x10027b8c9
0x10027b867: mov rax, qword ptr [rbp + 0x28]
0x10027b86b: mov rdi, qword ptr [rax + 0xe8]
0x10027b872: test byte ptr [rsi + 0x50], 1
0x10027b876: jne 0x10027b881
0x10027b878: add rsi, 0x50
0x10027b87c: inc rsi
0x10027b87f: jmp 0x10027b885 ; 0x10027b885
0x10027b881: mov rsi, qword ptr [rsi + 0x60]
0x10027b885: mov r15, qword ptr [rbp + 0x30]
0x10027b889: call 0x100238690 ; 0x100238690
0x10027b88e: mov rbx, rax
0x10027b891: mov rsi, qword ptr [r13 + 0x170]
0x10027b898: test byte ptr [rsi + 0x50], 1
0x10027b89c: jne 0x10027b8a7
0x10027b89e: add rsi, 0x50
0x10027b8a2: inc rsi
0x10027b8a5: jmp 0x10027b8ab ; 0x10027b8ab
0x10027b8a7: mov rsi, qword ptr [rsi + 0x60]
0x10027b8ab: mov rdi, r15
0x10027b8ae: call 0x100238a70 ; 0x100238a70
0x10027b8b3: test rax, rax
0x10027b8b6: je 0x10027b8c9
0x10027b8b8: test rbx, rbx
0x10027b8bb: je 0x10027b8d3
0x10027b8bd: mov eax, dword ptr [rbx + 0x28]
0x10027b8c0: test eax, eax
0x10027b8c2: je 0x10027b8c9
0x10027b8c4: cmp eax, dword ptr [rbx + 0x24]
0x10027b8c7: jae 0x10027b8d3
0x10027b8c9: mov dword ptr [rsp + 0x28], 0
0x10027b8d1: jmp 0x10027b8d9 ; 0x10027b8d9
0x10027b8d3: mov al, 1
0x10027b8d5: mov dword ptr [rsp + 0x28], eax
0x10027b8d9: mov rcx, qword ptr [rbp + 0x48]
0x10027b8dd: cmp byte ptr [rip + 0x1b6c674], 0 ; 0x101de7f58
0x10027b8e4: mov qword ptr [rsp + 0x80], r13
0x10027b8ec: je 0x10027bb91
0x10027b8f2: mov ebx, dword ptr [r13 + 0x104]
0x10027b8f9: mov r15, qword ptr [r13 + 0x18]
0x10027b8fd: mov rax, qword ptr [r13]
0x10027b901: lea rdi, [rsp + 0x260]
0x10027b909: mov rsi, r13
0x10027b90c: call qword ptr [rax + 0x28]
0x10027b90f: vmovaps xmm0, xmmword ptr [rsp + 0x290]
0x10027b918: vmovaps xmmword ptr [rsp + 0x660], xmm0
0x10027b921: mov eax, dword ptr [r15 + 0x1b220]
0x10027b928: xor ecx, ecx
0x10027b92a: nop word ptr [rax + rax]
0x10027b930: mov esi, dword ptr [r13 + 0xe0]
0x10027b937: imul rdx, rsi, 0x1a0
0x10027b93e: inc ecx
0x10027b940: lea r13, [r15 + rdx + 0x1220]
0x10027b948: cmp eax, esi
0x10027b94a: ja 0x10027b930
0x10027b94c: cmp ecx, 9
0x10027b94f: ja 0x10027b961
0x10027b951: movsxd rcx, ecx
0x10027b954: lea rdx, [rip + 0x9989e5] ; 0x100c14340
0x10027b95b: mov rcx, qword ptr [rdx + rcx*8]
0x10027b95f: jmp 0x10027b968 ; 0x10027b968
0x10027b961: lea rcx, [rip + 0x1dc3d58] ; 0x10203f6c0
0x10027b968: vmovaps xmm0, xmmword ptr [rcx]
0x10027b96c: vmovaps xmmword ptr [rsp + 0x820], xmm0
0x10027b975: test ebx, ebx
0x10027b977: je 0x10027ba16
0x10027b97d: mov rcx, qword ptr [rsp + 0x80]
0x10027b985: lea r13, [rcx + 0xe4]
0x10027b98c: jmp 0x10027b99b ; 0x10027b99b
0x10027b98e: nop 
0x10027b990: mov eax, dword ptr [r15 + 0x1b220]
0x10027b997: add r13, 4
0x10027b99b: dec rbx
0x10027b99e: mov ecx, dword ptr [r13]
0x10027b9a2: imul rdx, rcx, 0x1a0
0x10027b9a9: cmp eax, ecx
0x10027b9ab: lea r14, [r15 + rdx + 0x1220]
0x10027b9b3: mov eax, 0
0x10027b9b8: cmovbe r14, rax
0x10027b9bc: call 0x1002b9810 ; 0x1002b9810
0x10027b9c1: mov r12, rax
0x10027b9c4: mov rax, qword ptr [r14]
0x10027b9c7: lea rdi, [rsp + 0x260]
0x10027b9cf: mov rsi, r14
0x10027b9d2: call qword ptr [rax + 0x28]
0x10027b9d5: vmovaps xmm0, xmmword ptr [rsp + 0x290]
0x10027b9de: vmovaps xmmword ptr [rsp + 0x250], xmm0
0x10027b9e7: mov r8d, 1
0x10027b9ed: mov rdi, r12
0x10027b9f0: lea rsi, [rsp + 0x660]
0x10027b9f8: lea rdx, [rsp + 0x250]
0x10027ba00: lea rcx, [rsp + 0x820]
0x10027ba08: call 0x1002b9d50 ; 0x1002b9d50
0x10027ba0d: test rbx, rbx
0x10027ba10: jne 0x10027b990
0x10027ba16: mov rcx, qword ptr [rbp + 0x48]
0x10027ba1a: mov rax, qword ptr [rcx + 0x18]
0x10027ba1e: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x10027ba23: vsubps xmm0, xmm0, xmmword ptr [rsp + 0x90]
0x10027ba2c: vmulps xmm0, xmm0, xmm0
0x10027ba30: vmovshdup xmm1, xmm0
0x10027ba34: vaddss xmm1, xmm0, xmm1
0x10027ba38: vpermilpd xmm0, xmm0, 1
0x10027ba3e: vaddss xmm0, xmm0, xmm1
0x10027ba42: vmovss xmm1, dword ptr [rip + 0x82bd92] ; 0x100aa77dc
0x10027ba4a: vucomiss xmm1, xmm0
0x10027ba4e: mov r13, qword ptr [rsp + 0x80]
0x10027ba56: jbe 0x10027bb91
0x10027ba5c: mov ecx, dword ptr [r13 + 0x188]
0x10027ba63: vmovss xmm0, dword ptr [r13 + 0xd4]
0x10027ba6c: vmulss xmm0, xmm0, dword ptr [rip + 0x82cbfc] ; 0x100aa8670
0x10027ba74: vcvttss2si r8, xmm0
0x10027ba79: mov r10d, dword ptr [r13 + 0x104]
0x10027ba80: vxorps xmm0, xmm0, xmm0
0x10027ba84: vxorps xmm1, xmm1, xmm1
0x10027ba88: test r10, r10
0x10027ba8b: je 0x10027bb2f
0x10027ba91: mov rdx, qword ptr [r13 + 0x18]
0x10027ba95: mov esi, dword ptr [rdx + 0x1b220]
0x10027ba9b: mov r9d, r10d
0x10027ba9e: and r9d, 1
0x10027baa2: cmp r10d, 1
0x10027baa6: jne 0x10027bad1
0x10027baa8: vxorps xmm1, xmm1, xmm1
0x10027baac: xor ebx, ebx
0x10027baae: test r9, r9
0x10027bab1: je 0x10027bb26
0x10027bab3: mov eax, dword ptr [r13 + rbx*4 + 0xe4]
0x10027babb: cmp esi, eax
0x10027babd: jbe 0x10027bb26
0x10027babf: imul rax, rax, 0x1a0
0x10027bac6: vaddss xmm1, xmm1, dword ptr [rdx + rax + 0x12f0]
0x10027bacf: jmp 0x10027bb26 ; 0x10027bb26
0x10027bad1: mov rax, r10
0x10027bad4: sub rax, r9
0x10027bad7: vxorps xmm1, xmm1, xmm1
0x10027badb: xor ebx, ebx
0x10027badd: nop dword ptr [rax]
0x10027bae0: mov edi, dword ptr [r13 + rbx*4 + 0xe4]
0x10027bae8: cmp esi, edi
0x10027baea: jbe 0x10027bafc
0x10027baec: imul rdi, rdi, 0x1a0
0x10027baf3: vaddss xmm1, xmm1, dword ptr [rdx + rdi + 0x12f0]
0x10027bafc: mov edi, dword ptr [r13 + rbx*4 + 0xe8]
0x10027bb04: cmp esi, edi
0x10027bb06: jbe 0x10027bb18
0x10027bb08: imul rdi, rdi, 0x1a0
0x10027bb0f: vaddss xmm1, xmm1, dword ptr [rdx + rdi + 0x12f0]
0x10027bb18: add rbx, 2
0x10027bb1c: cmp rax, rbx
0x10027bb1f: jne 0x10027bae0
0x10027bb21: test r9, r9
0x10027bb24: jne 0x10027bab3
0x10027bb26: vcvtsi2ss xmm2, xmm2, r10
0x10027bb2b: vdivss xmm1, xmm1, xmm2
0x10027bb2f: vmaxss xmm0, xmm0, xmm1
0x10027bb33: vmovss xmm1, dword ptr [rip + 0x829585] ; 0x100aa50c0
0x10027bb3b: vminss xmm0, xmm1, xmm0
0x10027bb3f: vmulss xmm0, xmm0, dword ptr [rip + 0x82cb29] ; 0x100aa8670
0x10027bb47: vcvttss2si r9, xmm0
0x10027bb4c: lea rdx, [rip + 0x901567] ; 0x100b7d0ba waxm = %d, hp = %d, avCHp = %d
0x10027bb53: lea rbx, [rsp + 0x260]
0x10027bb5b: mov esi, 0xd7
0x10027bb60: xor eax, eax
0x10027bb62: mov rdi, rbx
0x10027bb65: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x10027bb6a: lea rcx, [rip + 0x1dc3b3f] ; 0x10203f6b0
0x10027bb71: lea rdx, [rsp + 0x90]
0x10027bb79: vmovss xmm0, dword ptr [rip + 0x82daef] ; 0x100aa9670
0x10027bb81: mov rdi, qword ptr [rbp + 0x38]
0x10027bb85: mov rsi, rbx
0x10027bb88: call 0x1002b2410 ; 0x1002b2410
0x10027bb8d: mov rcx, qword ptr [rbp + 0x48]
0x10027bb91: vmovss xmm0, dword ptr [r13 + 0xd0]
0x10027bb9a: vmovss dword ptr [rsp + 0x24], xmm0
0x10027bba0: mov rbx, qword ptr [rcx + 0xa0]
0x10027bba7: call 0x1007e8490 ; 0x1007e8490
0x10027bbac: mov r14, rax
0x10027bbaf: mov esi, dword ptr [r13 + 0x18c]
0x10027bbb6: mov rdi, rbx
0x10027bbb9: call 0x1000efb20 ; 0x1000efb20
0x10027bbbe: test rax, rax
0x10027bbc1: je 0x10027bbd7
0x10027bbc3: mov cl, byte ptr [rip + 0x1b6c31f] ; 0x101de7ee8
0x10027bbc9: test cl, cl
0x10027bbcb: jne 0x10027bbd7
0x10027bbcd: cmp qword ptr [rax + 8], r14
0x10027bbd1: jae 0x10027bdcf
0x10027bbd7: mov al, 1
0x10027bbd9: mov dword ptr [rsp + 0x5c], eax
0x10027bbdd: vmovss xmm0, dword ptr [rip + 0x832c9b] ; 0x100aae880
0x10027bbe5: vucomiss xmm0, dword ptr [rsp + 0x24]
0x10027bbeb: jb 0x10027bdeb
0x10027bbf1: mov rdi, qword ptr [r13 + 0x110]
0x10027bbf8: test rdi, rdi
0x10027bbfb: je 0x10027bc32
0x10027bbfd: mov rbx, qword ptr [r13 + 0x118]
0x10027bc04: test rbx, rbx
0x10027bc07: je 0x10027bc32
0x10027bc09: mov rax, qword ptr [rdi]
0x10027bc0c: call qword ptr [rax]
0x10027bc0e: vmovss xmm0, dword ptr [rip + 0x832c6a] ; 0x100aae880
0x10027bc16: cmp rbx, rax
0x10027bc19: jne 0x10027bc32
0x10027bc1b: mov rdi, qword ptr [r13 + 0x110]
0x10027bc22: mov rax, qword ptr [rdi]
0x10027bc25: xor esi, esi
0x10027bc27: call qword ptr [rax + 0x30]
0x10027bc2a: vmovss xmm0, dword ptr [rip + 0x832c4e] ; 0x100aae880
0x10027bc32: cmp byte ptr [r13 + 0x198], 0
0x10027bc3a: jne 0x10027c1d1
0x10027bc40: vxorps ymm0, ymm0, ymm0
0x10027bc44: vmovaps ymmword ptr [rsp + 0x660], ymm0
0x10027bc4d: vmovaps ymmword ptr [rsp + 0x6a0], ymm0
0x10027bc56: vmovaps ymmword ptr [rsp + 0x6c0], ymm0
0x10027bc5f: vmovaps ymmword ptr [rsp + 0x680], ymm0
0x10027bc68: mov byte ptr [rsp + 0x66d], 1
0x10027bc70: mov dword ptr [rsp + 0x660], 0x3f800000
0x10027bc7b: vmovaps xmm1, xmmword ptr [rsp + 0x90]
0x10027bc84: vmovaps xmmword ptr [rsp + 0x670], xmm1
0x10027bc8d: movabs rax, 0x41f0000040400000
0x10027bc97: mov qword ptr [rsp + 0x6a8], rax
0x10027bc9f: mov dword ptr [rsp + 0x6d0], 0xc31
0x10027bcaa: vmovups ymmword ptr [rsp + 0x3f0], ymm0
0x10027bcb3: vmovaps ymmword ptr [rsp + 0x3e0], ymm0
0x10027bcbc: vmovaps ymmword ptr [rsp + 0x3c0], ymm0
0x10027bcc5: vmovaps ymmword ptr [rsp + 0x3a0], ymm0
0x10027bcce: vmovaps ymmword ptr [rsp + 0x380], ymm0
0x10027bcd7: vmovaps ymmword ptr [rsp + 0x360], ymm0
0x10027bce0: vmovaps ymmword ptr [rsp + 0x340], ymm0
0x10027bce9: vmovaps ymmword ptr [rsp + 0x320], ymm0
0x10027bcf2: vmovaps ymmword ptr [rsp + 0x300], ymm0
0x10027bcfb: vmovaps ymmword ptr [rsp + 0x2e0], ymm0
0x10027bd04: vmovaps ymmword ptr [rsp + 0x2c0], ymm0
0x10027bd0d: vmovaps ymmword ptr [rsp + 0x2a0], ymm0
0x10027bd16: vmovaps ymmword ptr [rsp + 0x280], ymm0
0x10027bd1f: vmovaps ymmword ptr [rsp + 0x260], ymm0
0x10027bd28: lea rsi, [rip + 0x9013aa] ; 0x100b7d0d9 podsmash
0x10027bd2f: lea rdx, [rsp + 0x660]
0x10027bd37: lea rcx, [rsp + 0x260]
0x10027bd3f: mov rdi, qword ptr [rsp + 0xd8]
0x10027bd47: vzeroupper 
0x10027bd4a: call 0x1006018a0 ; 0x1006018a0
0x10027bd4f: vmovaps xmm0, xmmword ptr [rsp + 0x90]
0x10027bd58: vmovaps xmmword ptr [rsp + 0x240], xmm0
0x10027bd61: mov rbx, qword ptr [rip + 0x82c338] ; 0x100aa80a0
0x10027bd68: mov qword ptr [rsp + 0x160], rbx
0x10027bd70: mov dword ptr [rsp + 0x168], 0
0x10027bd7b: lea rax, [rip + 0x1dc395e] ; 0x10203f6e0
0x10027bd82: vmovaps xmm0, xmmword ptr [rax]
0x10027bd86: vmovaps xmmword ptr [rsp + 0x230], xmm0
0x10027bd8f: lea rsi, [rsp + 0x240]
0x10027bd97: lea rdx, [rsp + 0x160]
0x10027bd9f: lea r8, [rsp + 0x230]
0x10027bda7: mov ecx, 0x20
0x10027bdac: mov rdi, qword ptr [rsp + 0x100]
0x10027bdb4: call 0x1001bd8e0 ; 0x1001bd8e0
0x10027bdb9: cmp qword ptr [r13 + 0x170], 0
0x10027bdc1: je 0x10027bdf9
0x10027bdc3: cmp byte ptr [rsp + 0x28], 0
0x10027bdc8: jne 0x10027be12
0x10027bdca: jmp 0x10027c18d ; 0x10027c18d
0x10027bdcf: mov dword ptr [rsp + 0x5c], 0
0x10027bdd7: vmovss xmm0, dword ptr [rip + 0x832aa1] ; 0x100aae880
0x10027bddf: vucomiss xmm0, dword ptr [rsp + 0x24]
0x10027bde5: jae 0x10027bbf1
0x10027bdeb: lea r15, [r13 + 0x198]
0x10027bdf2: xor ebx, ebx
0x10027bdf4: jmp 0x10027c1ce ; 0x10027c1ce
0x10027bdf9: cmp byte ptr [rsp + 0x5c], 0
0x10027bdfe: je 0x10027bf72
0x10027be04: cmp dword ptr [r13 + 0x188], 0
0x10027be0c: je 0x10027bf64
0x10027be12: vmovaps xmm0, xmmword ptr [rsp + 0x90]
0x10027be1b: vmovaps xmmword ptr [rsp + 0x220], xmm0
0x10027be24: mov qword ptr [rsp + 0x150], rbx
0x10027be2c: mov dword ptr [rsp + 0x158], 0
0x10027be37: lea rax, [rip + 0x1b73aa2] ; 0x101def8e0
0x10027be3e: mov rcx, qword ptr [rax]
0x10027be41: vmovss xmm0, dword ptr [rip + 0x82b9ab] ; 0x100aa77f4
0x10027be49: lea rsi, [rsp + 0x220]
0x10027be51: lea rdx, [rsp + 0x150]
0x10027be59: xor r8d, r8d
0x10027be5c: mov rdi, qword ptr [rsp + 0x40]
0x10027be61: call 0x1002de9e0 ; 0x1002de9e0
0x10027be66: mov qword ptr [rsp + 0x260], rax
0x10027be6e: mov dword ptr [rsp + 0x268], edx
0x10027be75: lea rdi, [rsp + 0x260]
0x10027be7d: call 0x100316270 ; 0x100316270
0x10027be82: mov r15, rax
0x10027be85: test r15, r15
0x10027be88: je 0x10027bf64
0x10027be8e: vmovaps xmm0, xmmword ptr [r13 + 0x80]
0x10027be97: vmulps xmm0, xmm0, xmm0
0x10027be9b: vpermilpd xmm1, xmm0, 1
0x10027bea1: vaddps xmm0, xmm0, xmm1
0x10027bea5: vmovshdup xmm1, xmm0
0x10027bea9: vaddss xmm0, xmm0, xmm1
0x10027bead: vsqrtss xmm0, xmm0, xmm0
0x10027beb1: vmulss xmm0, xmm0, dword ptr [rip + 0x82b933] ; 0x100aa77ec
0x10027beb9: vmovss xmm1, dword ptr [rip + 0x82b233] ; 0x100aa70f4
0x10027bec1: vmaxss xmm0, xmm1, xmm0
0x10027bec5: vmovss dword ptr [r15 + 0x9c], xmm0
0x10027bece: mov dword ptr [r15 + 0x8c], 0x40200000
0x10027bed9: cmp qword ptr [r13 + 0x170], 0
0x10027bee1: lea rax, [rip + 0x1d883b8] ; 0x1020042a0
0x10027bee8: cmove rax, qword ptr [rip + 0x98e5d0] ; 0x100c0a4c0
0x10027bef0: vmovaps xmm0, xmmword ptr [rax]
0x10027bef4: vmulps xmm1, xmm0, xmmword ptr [rip + 0x82d764] ; 0x100aa9660
0x10027befc: vblendps xmm0, xmm1, xmm0, 8
0x10027bf02: vmovaps xmmword ptr [r15 + 0x120], xmm0
0x10027bf0b: vmovaps xmmword ptr [r15 + 0x110], xmm0
0x10027bf14: cmp qword ptr [r13 + 0x170], 0
0x10027bf1c: je 0x10027bf24
0x10027bf1e: mov rax, qword ptr [r13 + 0x28]
0x10027bf22: jmp 0x10027bf45 ; 0x10027bf45
0x10027bf24: mov rcx, qword ptr [rbp + 0x48]
0x10027bf28: mov rax, qword ptr [rcx + 0xa8]
0x10027bf2f: mov rdi, qword ptr [rax + 0x210]
0x10027bf36: cmp byte ptr [rdi + 0xc], 0
0x10027bf3a: je 0x10027e2ee
0x10027bf40: call 0x1003c62c0 ; 0x1003c62c0
0x10027bf45: lea rcx, [rax + 8]
0x10027bf49: test rax, rax
0x10027bf4c: cmove rcx, rax
0x10027bf50: mov byte ptr [r15 + 0x188], 1
0x10027bf58: mov byte ptr [r15 + 0xae], 1
0x10027bf60: mov qword ptr [r15 + 0x78], rcx
0x10027bf64: cmp qword ptr [r13 + 0x170], 0
0x10027bf6c: jne 0x10027c18d
0x10027bf72: cmp byte ptr [rip + 0x1b6bf6f], 0 ; 0x101de7ee8
0x10027bf79: setne al
0x10027bf7c: or al, byte ptr [rsp + 0x5c]
0x10027bf80: cmp al, 1
0x10027bf82: jne 0x10027c18d
0x10027bf88: mov al, byte ptr [rip + 0xaaf592] ; 0x100d2b520
0x10027bf8e: test al, al
0x10027bf90: jne 0x10027bfc6
0x10027bf92: lea rdi, [rip + 0xaaf587] ; 0x100d2b520
0x10027bf99: call 0x100aa24e0 ; 0x100aa24e0 ___cxa_guard_acquire
0x10027bf9e: test eax, eax
0x10027bfa0: je 0x10027bfc6
0x10027bfa2: mov rax, qword ptr [rip + 0x82b947] ; 0x100aa78f0
0x10027bfa9: mov qword ptr [rip + 0xaaf560], rax ; 0x100d2b510
0x10027bfb0: mov dword ptr [rip + 0xaaf55e], 0 ; 0x100d2b518
0x10027bfba: lea rdi, [rip + 0xaaf55f] ; 0x100d2b520
0x10027bfc1: call 0x100aa24e6 ; 0x100aa24e6 ___cxa_guard_release
0x10027bfc6: cmp dword ptr [r13 + 0x188], 0
0x10027bfce: je 0x10027c18d
0x10027bfd4: vmovaps xmm0, xmmword ptr [r13 + 0x80]
0x10027bfdd: vmovaps xmmword ptr [rsp + 0x70], xmm0
0x10027bfe3: vmovaps xmm0, xmmword ptr [r13 + 0x90]
0x10027bfec: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x10027bff2: vmovaps xmm0, xmmword ptr [r13 + 0xa0]
0x10027bffb: vmovaps xmmword ptr [rsp + 0x110], xmm0
0x10027c004: xor ebx, ebx
0x10027c006: nop word ptr cs:[rax + rax]
0x10027c010: call 0x10072d070 ; 0x10072d070
0x10027c015: mov rdi, qword ptr [rbp + 0x18]
0x10027c019: mov rsi, rax
0x10027c01c: call 0x100039f40 ; 0x100039f40
0x10027c021: mov r15, rax
0x10027c024: test ebx, ebx
0x10027c026: je 0x10027c100
0x10027c02c: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10027c031: vcvtsi2ss xmm0, xmm3, eax
0x10027c035: vmovss xmm1, dword ptr [rip + 0x82b0b3] ; 0x100aa70f0
0x10027c03d: vmulss xmm0, xmm0, xmm1
0x10027c041: vmovss xmm1, dword ptr [rip + 0x82eef7] ; 0x100aaaf40
0x10027c049: vmulss xmm0, xmm0, xmm1
0x10027c04d: vcvttss2si eax, xmm0
0x10027c051: lea eax, [rax + rax*2]
0x10027c054: cdqe 
0x10027c056: imul rax, rax, 0x14f8b589
0x10027c05d: mov rcx, rax
0x10027c060: sar rcx, 0x2d
0x10027c064: shr rax, 0x3f
0x10027c068: lea r14d, [rcx + rax - 1]
0x10027c06d: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10027c072: vcvtsi2ss xmm0, xmm3, eax
0x10027c076: vmulss xmm0, xmm0, dword ptr [rip + 0x82b072] ; 0x100aa70f0
0x10027c07e: vmulss xmm0, xmm0, dword ptr [rip + 0x82eeba] ; 0x100aaaf40
0x10027c086: vcvttss2si eax, xmm0
0x10027c08a: lea eax, [rax + rax*2]
0x10027c08d: cdqe 
0x10027c08f: imul rax, rax, 0x14f8b589
0x10027c096: mov rcx, rax
0x10027c099: sar rcx, 0x2d
0x10027c09d: shr rax, 0x3f
0x10027c0a1: lea r12d, [rcx + rax - 1]
0x10027c0a6: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10027c0ab: vcvtsi2ss xmm0, xmm3, eax
0x10027c0af: vmulss xmm0, xmm0, dword ptr [rip + 0x82b039] ; 0x100aa70f0
0x10027c0b7: vmulss xmm0, xmm0, dword ptr [rip + 0x82ee81] ; 0x100aaaf40
0x10027c0bf: vcvttss2si eax, xmm0
0x10027c0c3: lea eax, [rax + rax*2]
0x10027c0c6: cdqe 
0x10027c0c8: imul rax, rax, 0x14f8b589
0x10027c0cf: mov rcx, rax
0x10027c0d2: sar rcx, 0x2d
0x10027c0d6: shr rax, 0x3f
0x10027c0da: lea eax, [rcx + rax - 1]
0x10027c0de: vmovd xmm0, r14d
0x10027c0e3: vpinsrd xmm0, xmm0, r12d, 1
0x10027c0e9: vpinsrd xmm0, xmm0, eax, 2
0x10027c0ef: vcvtdq2ps xmm0, xmm0
0x10027c0f3: vmulps xmm0, xmm0, xmmword ptr [rip + 0x82bf95] ; 0x100aa8090
0x10027c0fb: jmp 0x10027c110 ; 0x10027c110
0x10027c0fd: nop dword ptr [rax]
0x10027c100: vmovaps xmm0, xmmword ptr [rsp + 0x40]
0x10027c106: vblendps xmm0, xmm0, xmmword ptr [rip + 0x828490], 7 ; 0x100aa45a0
0x10027c110: vmovaps xmmword ptr [rsp + 0x40], xmm0
0x10027c116: vaddps xmm0, xmm0, xmmword ptr [rip + 0xaaf3f2] ; 0x100d2b510
0x10027c11e: vpermilps xmm1, xmm0, 0xc0
0x10027c124: vmulps xmm1, xmm1, xmmword ptr [rsp + 0x70]
0x10027c12a: vpermilps xmm2, xmm0, 0xd5
0x10027c130: vmulps xmm2, xmm2, xmmword ptr [rsp + 0x30]
0x10027c136: vaddps xmm1, xmm2, xmm1
0x10027c13a: vpermilps xmm0, xmm0, 0xea
0x10027c140: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x110]
0x10027c149: vaddps xmm0, xmm0, xmm1
0x10027c14d: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x90]
0x10027c156: vmovaps xmmword ptr [r15 + 0x40], xmm0
0x10027c15c: test ebx, ebx
0x10027c15e: jne 0x10027c176
0x10027c160: movzx eax, byte ptr [rip + 0x1b6bd81] ; 0x101de7ee8
0x10027c167: test al, al
0x10027c169: jne 0x10027c176
0x10027c16b: mov eax, dword ptr [r13 + 0x18c]
0x10027c172: mov dword ptr [r15 + 0x50], eax
0x10027c176: mov rdi, r15
0x10027c179: call 0x10032e2f0 ; 0x10032e2f0
0x10027c17e: inc ebx
0x10027c180: cmp ebx, dword ptr [r13 + 0x188]
0x10027c187: jb 0x10027c010
0x10027c18d: lea r15, [r13 + 0x198]
0x10027c194: mov bl, 1
0x10027c196: cmp byte ptr [r13 + 0x199], 0
0x10027c19e: je 0x10027c1c6
0x10027c1a0: mov r14, qword ptr [rbp + 0x20]
0x10027c1a4: mov esi, 0x23
0x10027c1a9: mov rdi, r14
0x10027c1ac: call 0x1000438e0 ; 0x1000438e0
0x10027c1b1: vaddss xmm0, xmm0, dword ptr [rip + 0x828f07] ; 0x100aa50c0
0x10027c1b9: mov esi, 0x23
0x10027c1be: mov rdi, r14
0x10027c1c1: call 0x100044920 ; 0x100044920
0x10027c1c6: vmovss xmm0, dword ptr [rip + 0x8326b2] ; 0x100aae880
0x10027c1ce: mov byte ptr [r15], bl
0x10027c1d1: mov r8, qword ptr [rbp + 0x40]
0x10027c1d5: mov rax, r13
0x10027c1d8: sub rax, -0x80
0x10027c1dc: mov qword ptr [rsp + 0x110], rax
0x10027c1e4: mov byte ptr [r13 + 0x199], 0
0x10027c1ec: mov eax, dword ptr [r13 + 0x104]
0x10027c1f3: test eax, eax
0x10027c1f5: mov rbx, qword ptr [rbp + 0x48]
0x10027c1f9: je 0x10027c239
0x10027c1fb: mov rcx, qword ptr [r13 + 0x18]
0x10027c1ff: mov edx, dword ptr [rcx + 0x1b220]
0x10027c205: xor esi, esi
0x10027c207: vmovss xmm3, dword ptr [rip + 0x82b6a9] ; 0x100aa78b8
0x10027c20f: nop 
0x10027c210: mov edi, dword ptr [r13 + rsi*4 + 0xe4]
0x10027c218: cmp edx, edi
0x10027c21a: jbe 0x10027c232
0x10027c21c: imul rdi, rdi, 0x1a0
0x10027c223: vucomiss xmm0, dword ptr [rcx + rdi + 0x12f0]
0x10027c22c: jb 0x10027d21d
0x10027c232: inc rsi
0x10027c235: cmp eax, esi
0x10027c237: ja 0x10027c210
0x10027c239: mov eax, dword ptr [rbp + 0x58]
0x10027c23c: vmovsd xmm0, qword ptr [rsp + 0x60]
0x10027c242: vaddss xmm0, xmm0, dword ptr [rip + 0xaaf2de] ; 0x100d2b528
0x10027c24a: vmovss dword ptr [rip + 0xaaf2d6], xmm0 ; 0x100d2b528
0x10027c252: test eax, eax
0x10027c254: je 0x10027c90f
0x10027c25a: mov r14, qword ptr [rbp + 0x50]
0x10027c25e: lea rcx, [rip + 0x8455df] ; 0x100ac1844
0x10027c265: vmovss xmm1, dword ptr [rcx]
0x10027c269: vmulss xmm0, xmm1, xmm1
0x10027c26d: vmovss dword ptr [rsp + 0xe0], xmm0
0x10027c276: vmulss xmm0, xmm1, dword ptr [rip + 0x82c382] ; 0x100aa8600
0x10027c27e: vmovss dword ptr [rsp + 0xa0], xmm1
0x10027c287: vmulss xmm0, xmm1, xmm0
0x10027c28b: lea rcx, [rip + 0x8455a6] ; 0x100ac1838
0x10027c292: vmulss xmm0, xmm0, dword ptr [rcx]
0x10027c296: vmulss xmm0, xmm0, dword ptr [rip + 0x82c396] ; 0x100aa8634
0x10027c29e: vmovss dword ptr [rsp + 0x10c], xmm0
0x10027c2a7: mov r13d, eax
0x10027c2aa: vmovss xmm2, dword ptr [rip + 0x82b606] ; 0x100aa78b8
0x10027c2b2: xor r12d, r12d
0x10027c2b5: mov dword ptr [rsp + 0xc0], 0
0x10027c2c0: mov dword ptr [rsp + 0xf0], 0
0x10027c2cb: mov dword ptr [rsp + 0x2c], 0
0x10027c2d3: xor edx, edx
0x10027c2d5: vxorps xmm0, xmm0, xmm0
0x10027c2d9: vmovsd qword ptr [rsp + 0x68], xmm0
0x10027c2df: jmp 0x10027c6b0 ; 0x10027c6b0
0x10027c2e4: mov rcx, qword ptr [r15 + 0x38]
0x10027c2e8: mov rax, qword ptr [r15 + 0xa0]
0x10027c2ef: mov r8d, dword ptr [rax + 0xa20]
0x10027c2f6: test r8d, r8d
0x10027c2f9: mov edx, 1
0x10027c2fe: cmovg edx, r8d
0x10027c302: mov rdi, qword ptr [rsp + 0x80]
0x10027c30a: mov eax, dword ptr [rdi + 0x140]
0x10027c310: mov esi, 1
0x10027c315: sub esi, eax
0x10027c317: add esi, edx
0x10027c319: vcvtsi2ss xmm0, xmm6, rsi
0x10027c31e: vmovss xmm1, dword ptr [rip + 0x828d9e] ; 0x100aa50c4
0x10027c326: vaddss xmm1, xmm1, dword ptr [rdi + 0xd4]
0x10027c32e: vaddss xmm0, xmm0, xmm1
0x10027c332: cmp byte ptr [rcx + 0x3f4], 0
0x10027c339: vmovaps xmm1, xmm0
0x10027c33d: je 0x10027c347
0x10027c33f: vmaxss xmm1, xmm0, dword ptr [rcx + 0x3f0]
0x10027c347: vmovss dword ptr [rcx + 0x3f0], xmm1
0x10027c34f: mov byte ptr [rcx + 0x3f4], 1
0x10027c356: cmp byte ptr [r15 + 0x1ef8], 0
0x10027c35e: je 0x10027c3e7
0x10027c364: mov rcx, qword ptr [rbp + 0x10]
0x10027c368: mov dword ptr [rcx + 0xe0], 0
0x10027c372: mov dword ptr [rcx + 0xf0], 2
0x10027c37c: vmovss dword ptr [rcx + 0xec], xmm0
0x10027c384: vxorps xmm1, xmm1, xmm1
0x10027c388: vucomiss xmm1, xmm0
0x10027c38c: mov edx, dword ptr [rsp + 0x70]
0x10027c390: jbe 0x10027c3f8
0x10027c392: mov rbx, qword ptr [rsp + 0x80]
0x10027c39a: mov rcx, qword ptr [rbx + 0x178]
0x10027c3a1: test rcx, rcx
0x10027c3a4: jne 0x10027c4bb
0x10027c3aa: vmovss dword ptr [rsp + 0x120], xmm3
0x10027c3b3: vmovaps xmmword ptr [rsp + 0x130], xmm5
0x10027c3bc: mov r15d, r8d
0x10027c3bf: call 0x1002c6ff0 ; 0x1002c6ff0
0x10027c3c4: mov rdi, qword ptr [rbp + 0x18]
0x10027c3c8: mov rsi, rax
0x10027c3cb: call 0x100039f40 ; 0x100039f40
0x10027c3d0: mov qword ptr [rbx + 0x178], rax
0x10027c3d7: test byte ptr [rax + 0x48], 1
0x10027c3db: lea rdi, [rax + 0x48]
0x10027c3df: jne 0x10027c405
0x10027c3e1: lea rax, [rdi + 1]
0x10027c3e5: jmp 0x10027c447 ; 0x10027c447
0x10027c3e7: mov rbx, qword ptr [rsp + 0x80]
0x10027c3ef: mov edx, dword ptr [rsp + 0x70]
0x10027c3f3: jmp 0x10027c4d6 ; 0x10027c4d6
0x10027c3f8: mov rbx, qword ptr [rsp + 0x80]
0x10027c400: jmp 0x10027c4cf ; 0x10027c4cf
0x10027c405: mov rax, qword ptr [rdi]
0x10027c408: and rax, 0xfffffffffffffffe
0x10027c40c: lea rsi, [rax - 1]
0x10027c410: cmp rsi, 0x15
0x10027c414: jae 0x10027c443
0x10027c416: mov rcx, qword ptr [rdi + 8]
0x10027c41a: mov edx, 0x16
0x10027c41f: sub rdx, rax
0x10027c422: lea rax, [rip + 0x900cb9] ; 0x100b7d0e2 no_darkstone_level_00
0x10027c429: mov qword ptr [rsp + 8], rax
0x10027c42e: mov qword ptr [rsp], 0x15
0x10027c436: xor r8d, r8d
0x10027c439: mov r9, rcx
0x10027c43c: call 0x1000198c0 ; 0x1000198c0
0x10027c441: jmp 0x10027c477 ; 0x10027c477
0x10027c443: mov rax, qword ptr [rdi + 0x10]
0x10027c447: movabs rcx, 0x30305f6c6576656c
0x10027c451: mov qword ptr [rax + 0xd], rcx
0x10027c455: vmovups xmm0, xmmword ptr [rip + 0x900c85] ; 0x100b7d0e2 no_darkstone_level_00
0x10027c45d: vmovups xmmword ptr [rax], xmm0
0x10027c461: mov byte ptr [rax + 0x15], 0
0x10027c465: test byte ptr [rdi], 1
0x10027c468: jne 0x10027c46f
0x10027c46a: mov byte ptr [rdi], 0x2a
0x10027c46d: jmp 0x10027c477 ; 0x10027c477
0x10027c46f: mov qword ptr [rdi + 8], 0x15
0x10027c477: mov rbx, qword ptr [rsp + 0x80]
0x10027c47f: mov rdi, qword ptr [rbx + 0x178]
0x10027c486: mov dword ptr [rdi + 0x88], 0x5f5e0ff
0x10027c490: call 0x10032e2f0 ; 0x10032e2f0
0x10027c495: mov rcx, qword ptr [rbx + 0x178]
0x10027c49c: mov eax, dword ptr [rbx + 0x140]
0x10027c4a2: mov edx, dword ptr [rsp + 0x70]
0x10027c4a6: mov r8d, r15d
0x10027c4a9: vmovaps xmm5, xmmword ptr [rsp + 0x130]
0x10027c4b2: vmovss xmm3, dword ptr [rsp + 0x120]
0x10027c4bb: mov dword ptr [rcx + 0xb8], 0x40a00000
0x10027c4c5: mov dword ptr [rbx + 0x180], 0x40a00000
0x10027c4cf: mov byte ptr [rbx + 0x199], 1
0x10027c4d6: vmovaps xmm0, xmmword ptr [rbx + 0xc0]
0x10027c4de: mov ecx, r8d
0x10027c4e1: sub ecx, eax
0x10027c4e3: test ecx, ecx
0x10027c4e5: jle 0x10027c5c8
0x10027c4eb: vcvtsi2ss xmm1, xmm6, ecx
0x10027c4ef: vdivss xmm1, xmm1, dword ptr [rip + 0x82a5b1] ; 0x100aa6aa8
0x10027c4f7: vxorps xmm2, xmm2, xmm2
0x10027c4fb: vmaxss xmm1, xmm2, xmm1
0x10027c4ff: vmovss xmm2, dword ptr [rip + 0x828bb9] ; 0x100aa50c0
0x10027c507: vminss xmm1, xmm2, xmm1
0x10027c50b: vsubss xmm2, xmm2, xmm1
0x10027c50f: vaddss xmm1, xmm1, xmm1
0x10027c513: vaddss xmm1, xmm2, xmm1
0x10027c517: mov rbx, qword ptr [rbp + 0x48]
0x10027c51b: cmp byte ptr [rip + 0x1b6baa6], 0 ; 0x101de7fc8
0x10027c522: jne 0x10027c5e7
0x10027c528: vaddss xmm2, xmm3, dword ptr [rip + 0x82b2b0] ; 0x100aa77e0
0x10027c530: vdivss xmm2, xmm2, dword ptr [rip + 0x82f300] ; 0x100aab838
0x10027c538: vmovss xmm3, dword ptr [rip + 0x828b80] ; 0x100aa50c0
0x10027c540: vmovaps xmm4, xmm3
0x10027c544: vaddss xmm2, xmm2, xmm4
0x10027c548: vxorps xmm3, xmm3, xmm3
0x10027c54c: vmaxss xmm2, xmm3, xmm2
0x10027c550: vminss xmm2, xmm4, xmm2
0x10027c554: vmovshdup xmm3, xmm0
0x10027c558: vmulss xmm3, xmm0, xmm3
0x10027c55c: vpermilpd xmm0, xmm0, 1
0x10027c562: vmulss xmm0, xmm0, xmm3
0x10027c566: vmulss xmm0, xmm0, dword ptr [rip + 0x82b27a] ; 0x100aa77e8
0x10027c56e: vmovss xmm3, dword ptr [rsp + 0x10c]
0x10027c577: vdivss xmm0, xmm3, xmm0
0x10027c57b: vmovss xmm3, dword ptr [rip + 0x838b31] ; 0x100ab50b4
0x10027c583: vmaxss xmm0, xmm3, xmm0
0x10027c587: vmovss xmm3, dword ptr [rip + 0x82b261] ; 0x100aa77f0
0x10027c58f: vminss xmm0, xmm3, xmm0
0x10027c593: vaddss xmm0, xmm0, xmm0
0x10027c597: vmulss xmm0, xmm1, xmm0
0x10027c59b: vsubss xmm1, xmm4, xmm2
0x10027c59f: vmulss xmm1, xmm1, dword ptr [rip + 0x838b11] ; 0x100ab50b8
0x10027c5a7: vmulss xmm2, xmm2, dword ptr [rip + 0x838b0d] ; 0x100ab50bc
0x10027c5af: vaddss xmm1, xmm2, xmm1
0x10027c5b3: vmulss xmm0, xmm1, xmm0
0x10027c5b7: vmovss xmm2, dword ptr [rsp + 0x40]
0x10027c5bd: cmp edx, 3
0x10027c5c0: ja 0x10027c64f
0x10027c5c6: jmp 0x10027c5fa ; 0x10027c5fa
0x10027c5c8: vmovss xmm1, dword ptr [rip + 0x828af0] ; 0x100aa50c0
0x10027c5d0: mov rbx, qword ptr [rbp + 0x48]
0x10027c5d4: js 0x10027c669
0x10027c5da: cmp byte ptr [rip + 0x1b6b9e7], 0 ; 0x101de7fc8
0x10027c5e1: je 0x10027c528
0x10027c5e7: vmovss xmm0, dword ptr [rip + 0x82a4b9] ; 0x100aa6aa8
0x10027c5ef: vmovss xmm2, dword ptr [rsp + 0x40]
0x10027c5f5: cmp edx, 3
0x10027c5f8: ja 0x10027c64f
0x10027c5fa: mov eax, edx
0x10027c5fc: lea rax, [rax + rax*2]
0x10027c600: shl rax, 4
0x10027c604: vmovaps xmm1, xmmword ptr [rsp + 0x660]
0x10027c60d: vmovaps xmmword ptr [rsp + rax + 0x260], xmm1
0x10027c616: vxorps xmm1, xmm5, xmmword ptr [rip + 0x82b2e2] ; 0x100aa7900
0x10027c61e: vmovaps xmmword ptr [rsp + rax + 0x270], xmm1
0x10027c627: vmulss xmm1, xmm0, dword ptr [rip + 0x82c041] ; 0x100aa8670
0x10027c62f: vcvttss2si rcx, xmm1
0x10027c634: cmp ecx, 1
0x10027c637: mov esi, 1
0x10027c63c: cmovbe ecx, esi
0x10027c63f: cmp ecx, 0xa
0x10027c642: jb 0x10027c646
0x10027c644: mov cl, 0xa
0x10027c646: mov byte ptr [rsp + rax + 0x280], cl
0x10027c64d: inc edx
0x10027c64f: vmovsd xmm1, qword ptr [rsp + 0x68]
0x10027c655: vaddss xmm1, xmm1, xmm0
0x10027c659: vmovsd qword ptr [rsp + 0x68], xmm1
0x10027c65f: add dword ptr [rsp + 0x2c], r8d
0x10027c664: jmp 0x10027c89e ; 0x10027c89e
0x10027c669: vcvtsi2ss xmm1, xmm6, ecx
0x10027c66d: vdivss xmm1, xmm1, dword ptr [rip + 0x82bfeb] ; 0x100aa8660
0x10027c675: vxorps xmm2, xmm2, xmm2
0x10027c679: vmaxss xmm1, xmm2, xmm1
0x10027c67d: vmovss xmm2, dword ptr [rip + 0x828a3b] ; 0x100aa50c0
0x10027c685: vminss xmm1, xmm2, xmm1
0x10027c689: vsubss xmm2, xmm2, xmm1
0x10027c68d: vmulss xmm1, xmm1, dword ptr [rip + 0x827f23] ; 0x100aa45b8
0x10027c695: vaddss xmm1, xmm2, xmm1
0x10027c699: cmp byte ptr [rip + 0x1b6b928], 0 ; 0x101de7fc8
0x10027c6a0: jne 0x10027c5e7
0x10027c6a6: jmp 0x10027c528 ; 0x10027c528
0x10027c6ab: nop dword ptr [rax + rax]
0x10027c6b0: mov dword ptr [rsp + 0x70], edx
0x10027c6b4: vmovss dword ptr [rsp + 0x40], xmm2
0x10027c6ba: mov r15, qword ptr [r14]
0x10027c6bd: mov rax, qword ptr [r15 + 0x18]
0x10027c6c1: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x10027c6c6: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x10027c6cc: vmovaps xmmword ptr [rsp + 0x210], xmm0
0x10027c6d5: lea rdi, [rsp + 0x210]
0x10027c6dd: vmovss xmm0, dword ptr [rsp + 0xa0]
0x10027c6e6: mov rsi, qword ptr [rsp + 0x110]
0x10027c6ee: lea rdx, [rsp + 0x660]
0x10027c6f6: call 0x10078d250 ; 0x10078d250
0x10027c6fb: vmovaps xmm0, xmmword ptr [rsp + 0x660]
0x10027c704: vsubps xmm0, xmm0, xmmword ptr [rsp + 0x30]
0x10027c70a: vmulps xmm0, xmm0, xmm0
0x10027c70e: vmovshdup xmm1, xmm0
0x10027c712: vaddss xmm1, xmm0, xmm1
0x10027c716: vpermilpd xmm0, xmm0, 1
0x10027c71c: vaddss xmm0, xmm0, xmm1
0x10027c720: vsubss xmm1, xmm0, dword ptr [rsp + 0xe0]
0x10027c729: vmovss xmm0, dword ptr [rip + 0x83120f] ; 0x100aad940
0x10027c731: vucomiss xmm0, xmm1
0x10027c735: jbe 0x10027c771
0x10027c737: mov rax, r12
0x10027c73a: mov r12b, 1
0x10027c73d: cmp r15, rbx
0x10027c740: je 0x10027c745
0x10027c742: mov r12d, eax
0x10027c745: mov rax, qword ptr [r15 + 0xa0]
0x10027c74c: inc dword ptr [rsp + 0xc0]
0x10027c753: mov ecx, dword ptr [rsp + 0xf0]
0x10027c75a: add ecx, dword ptr [rax + 0xa20]
0x10027c760: mov dword ptr [rsp + 0xf0], ecx
0x10027c767: vucomiss xmm1, dword ptr [rip + 0x82a339] ; 0x100aa6aa8
0x10027c76f: jbe 0x10027c780
0x10027c771: vmovss xmm2, dword ptr [rsp + 0x40]
0x10027c777: mov edx, dword ptr [rsp + 0x70]
0x10027c77b: jmp 0x10027c8a4 ; 0x10027c8a4
0x10027c780: vmovss dword ptr [rsp + 0x30], xmm1
0x10027c786: mov rax, qword ptr [r15 + 0xa8]
0x10027c78d: mov rdi, qword ptr [rax + 0x210]
0x10027c794: call 0x1003c62c0 ; 0x1003c62c0
0x10027c799: mov rbx, rax
0x10027c79c: mov rax, qword ptr [rbx]
0x10027c79f: mov rdi, rbx
0x10027c7a2: call qword ptr [rax + 0x10]
0x10027c7a5: test al, al
0x10027c7a7: je 0x10027c890
0x10027c7ad: mov rax, qword ptr [r15 + 0x30]
0x10027c7b1: vmovss xmm0, dword ptr [rax + 8]
0x10027c7b6: vucomiss xmm0, dword ptr [rip + 0x82e572] ; 0x100aaad30
0x10027c7be: jbe 0x10027c890
0x10027c7c4: vmovaps xmm4, xmmword ptr [rbx + 0xc0]
0x10027c7cc: vmovaps xmmword ptr [rsp + 0x120], xmm4
0x10027c7d5: vmovss xmm0, dword ptr [rbx + 0x108]
0x10027c7dd: vcmpunordss xmm1, xmm0, xmm0
0x10027c7e2: vmovss xmm2, dword ptr [rip + 0x82bdc6] ; 0x100aa85b0
0x10027c7ea: vmovaps xmm3, xmm2
0x10027c7ee: vandps xmm2, xmm1, xmm3
0x10027c7f2: vmaxss xmm0, xmm3, xmm0
0x10027c7f6: vandnps xmm0, xmm1, xmm0
0x10027c7fa: vorps xmm0, xmm0, xmm2
0x10027c7fe: vmovss xmm1, dword ptr [rip + 0x82a8ee] ; 0x100aa70f4
0x10027c806: vmulss xmm1, xmm1, dword ptr [rbx + 0x10c]
0x10027c80e: vaddss xmm1, xmm1, dword ptr [rip + 0x8288aa] ; 0x100aa50c0
0x10027c816: vmulss xmm0, xmm0, xmm1
0x10027c81a: vmovss dword ptr [rsp + 0x130], xmm0
0x10027c823: vmovaps xmmword ptr [rsp + 0x200], xmm4
0x10027c82c: lea rdi, [rsp + 0x200]
0x10027c834: mov rsi, qword ptr [rsp + 0x110]
0x10027c83c: lea rdx, [rsp + 0x660]
0x10027c844: call 0x10078d250 ; 0x10078d250
0x10027c849: vmovaps xmm0, xmmword ptr [rsp + 0x660]
0x10027c852: vsubps xmm5, xmm0, xmmword ptr [rsp + 0x120]
0x10027c85b: vmulps xmm0, xmm5, xmm5
0x10027c85f: vmovshdup xmm1, xmm0
0x10027c863: vaddss xmm1, xmm0, xmm1
0x10027c867: vpermilpd xmm0, xmm0, 1
0x10027c86d: vaddss xmm0, xmm0, xmm1
0x10027c871: vsqrtss xmm0, xmm0, xmm0
0x10027c875: vsubss xmm3, xmm0, dword ptr [rsp + 0x130]
0x10027c87e: vucomiss xmm3, dword ptr [rip + 0x82bd6e] ; 0x100aa85f4
0x10027c886: jbe 0x10027c2e4
0x10027c88c: nop dword ptr [rax]
0x10027c890: mov rbx, qword ptr [rbp + 0x48]
0x10027c894: vmovss xmm2, dword ptr [rsp + 0x40]
0x10027c89a: mov edx, dword ptr [rsp + 0x70]
0x10027c89e: vmovss xmm1, dword ptr [rsp + 0x30]
0x10027c8a4: vminss xmm2, xmm1, xmm2
0x10027c8a8: add r14, 8
0x10027c8ac: dec r13
0x10027c8af: jne 0x10027c6b0
0x10027c8b5: vxorps xmm0, xmm0, xmm0
0x10027c8b9: vmovsd xmm1, qword ptr [rsp + 0x68]
0x10027c8bf: vucomiss xmm1, xmm0
0x10027c8c3: mov qword ptr [rsp + 0x30], r12
0x10027c8c8: vmovss dword ptr [rsp + 0x40], xmm2
0x10027c8ce: jbe 0x10027c955
0x10027c8d4: mov r13, qword ptr [rsp + 0x80]
0x10027c8dc: vmovss xmm1, dword ptr [r13 + 0x184]
0x10027c8e5: vsubss xmm1, xmm1, dword ptr [rsp + 0x60]
0x10027c8eb: vmaxss xmm0, xmm0, xmm1
0x10027c8ef: vmovss xmm1, dword ptr [rip + 0x82aef9] ; 0x100aa77f0
0x10027c8f7: vminss xmm0, xmm1, xmm0
0x10027c8fb: vmovss dword ptr [r13 + 0x184], xmm0
0x10027c904: mov al, 1
0x10027c906: mov dword ptr [rsp + 0xa0], eax
0x10027c90d: jmp 0x10027c968 ; 0x10027c968
0x10027c90f: vmovss xmm0, dword ptr [rip + 0x82afa1] ; 0x100aa78b8
0x10027c917: vmovss dword ptr [rsp + 0x40], xmm0
0x10027c91d: xor eax, eax
0x10027c91f: mov qword ptr [rsp + 0x30], rax
0x10027c924: vxorps xmm0, xmm0, xmm0
0x10027c928: vmovsd qword ptr [rsp + 0x68], xmm0
0x10027c92e: mov dword ptr [rsp + 0xc0], 0
0x10027c939: mov dword ptr [rsp + 0xf0], 0
0x10027c944: xor eax, eax
0x10027c946: xor edx, edx
0x10027c948: mov dword ptr [rsp + 0xa0], 0
0x10027c953: jmp 0x10027c96c ; 0x10027c96c
0x10027c955: mov dword ptr [rsp + 0xa0], 0
0x10027c960: mov r13, qword ptr [rsp + 0x80]
0x10027c968: mov eax, dword ptr [rsp + 0x2c]
0x10027c96c: mov dword ptr [rsp + 0x2c], eax
0x10027c970: cmp eax, dword ptr [r13 + 0x140]
0x10027c977: mov r14, qword ptr [rsp + 0x100]
0x10027c97f: jb 0x10027ca90
0x10027c985: mov rax, qword ptr [rsp + 0x80]
0x10027c98d: vmovss xmm0, dword ptr [rax + 0xd0]
0x10027c995: vsubss xmm0, xmm0, dword ptr [rsp + 0x68]
0x10027c99b: vmovss xmm1, dword ptr [rip + 0x83870d] ; 0x100ab50b0
0x10027c9a3: vmaxss xmm0, xmm1, xmm0
0x10027c9a7: vmovss xmm1, dword ptr [rip + 0x828711] ; 0x100aa50c0
0x10027c9af: vminss xmm0, xmm1, xmm0
0x10027c9b3: vmovss dword ptr [rax + 0xd0], xmm0
0x10027c9bb: test edx, edx
0x10027c9bd: je 0x10027ca90
0x10027c9c3: vmovsd xmm0, qword ptr [rsp + 0x68]
0x10027c9c9: vucomiss xmm0, dword ptr [rip + 0x82bbe3] ; 0x100aa85b4
0x10027c9d1: jbe 0x10027ca90
0x10027c9d7: vmovss xmm0, dword ptr [rip + 0x831ea1] ; 0x100aae880
0x10027c9df: vucomiss xmm0, dword ptr [rsp + 0x24]
0x10027c9e5: jae 0x10027ca90
0x10027c9eb: vmovss xmm0, dword ptr [rip + 0xaaeb35] ; 0x100d2b528
0x10027c9f3: vucomiss xmm0, dword ptr [rip + 0x82bc0d] ; 0x100aa8608
0x10027c9fb: jbe 0x10027ca90
0x10027ca01: mov dword ptr [rip + 0xaaeb1d], 0 ; 0x100d2b528
0x10027ca0b: xor ebx, ebx
0x10027ca0d: lea r12, [rsp + 0x1e0]
0x10027ca15: lea r13, [rsp + 0x1d0]
0x10027ca1d: nop dword ptr [rax]
0x10027ca20: movzx ebx, bl
0x10027ca23: lea rax, [rbx + rbx*2]
0x10027ca27: shl rax, 4
0x10027ca2b: vmovaps xmm0, xmmword ptr [rsp + rax + 0x260]
0x10027ca34: vmovaps xmm1, xmmword ptr [rsp + rax + 0x270]
0x10027ca3d: vmovaps xmmword ptr [rsp + 0x1f0], xmm0
0x10027ca46: vmovaps xmmword ptr [rsp + 0x1e0], xmm1
0x10027ca4f: movzx ecx, byte ptr [rsp + rax + 0x280]
0x10027ca57: lea rax, [rip + 0x1dc2c82] ; 0x10203f6e0
0x10027ca5e: vmovaps xmm0, xmmword ptr [rax]
0x10027ca62: vmovaps xmmword ptr [rsp + 0x1d0], xmm0
0x10027ca6b: mov rdi, r14
0x10027ca6e: lea rsi, [rsp + 0x1f0]
0x10027ca76: mov r15d, edx
0x10027ca79: mov rdx, r12
0x10027ca7c: mov r8, r13
0x10027ca7f: call 0x1001bd8e0 ; 0x1001bd8e0
0x10027ca84: mov edx, r15d
0x10027ca87: inc bl
0x10027ca89: movzx eax, bl
0x10027ca8c: cmp edx, eax
0x10027ca8e: ja 0x10027ca20
0x10027ca90: mov r13, qword ptr [rsp + 0x80]
0x10027ca98: vmovss xmm0, dword ptr [r13 + 0x180]
0x10027caa1: vxorps xmm1, xmm1, xmm1
0x10027caa5: vucomiss xmm0, xmm1
0x10027caa9: jae 0x10027cab8
0x10027caab: mov qword ptr [r13 + 0x178], 0
0x10027cab6: jmp 0x10027cac7 ; 0x10027cac7
0x10027cab8: vsubss xmm0, xmm0, dword ptr [rsp + 0x60]
0x10027cabe: vmovss dword ptr [r13 + 0x180], xmm0
0x10027cac7: mov r8, qword ptr [rbp + 0x40]
0x10027cacb: mov r12, qword ptr [rsp + 0x30]
0x10027cad0: vmovss xmm3, dword ptr [rsp + 0x40]
0x10027cad6: mov al, 1
0x10027cad8: mov dword ptr [rsp + 0x70], eax
0x10027cadc: cmp byte ptr [rsp + 0xa0], 0
0x10027cae4: vmovss xmm0, dword ptr [rip + 0x831d94] ; 0x100aae880
0x10027caec: mov r15d, dword ptr [rsp + 0x2c]
0x10027caf1: je 0x10027d243
0x10027caf7: vmovss xmm1, dword ptr [rip + 0x830e41] ; 0x100aad940
0x10027caff: vucomiss xmm1, xmm3
0x10027cb03: jbe 0x10027d3ee
0x10027cb09: vucomiss xmm0, dword ptr [rsp + 0x24]
0x10027cb0f: jae 0x10027cc4f
0x10027cb15: vmovapd xmm0, xmmword ptr [r13 + 0x70]
0x10027cb1b: vpermilpd xmm1, xmm0, 1
0x10027cb21: vmaxss xmm2, xmm1, xmm0
0x10027cb25: vcmpunordss xmm3, xmm0, xmm0
0x10027cb2a: vblendvps xmm1, xmm2, xmm1, xmm3
0x10027cb30: vmovshdup xmm0, xmm0
0x10027cb34: vcmpunordss xmm2, xmm1, xmm1
0x10027cb39: vmaxss xmm1, xmm0, xmm1
0x10027cb3d: vblendvps xmm0, xmm1, xmm0, xmm2
0x10027cb43: vucomiss xmm0, dword ptr [rip + 0x82bae9] ; 0x100aa8634
0x10027cb4b: jbe 0x10027cc4f
0x10027cb51: vxorps ymm0, ymm0, ymm0
0x10027cb55: vmovups ymmword ptr [rsp + 0x3ec], ymm0
0x10027cb5e: vmovaps ymmword ptr [rsp + 0x3e0], ymm0
0x10027cb67: vmovaps ymmword ptr [rsp + 0x3c0], ymm0
0x10027cb70: vmovaps ymmword ptr [rsp + 0x3a0], ymm0
0x10027cb79: vmovaps ymmword ptr [rsp + 0x380], ymm0
0x10027cb82: vmovaps ymmword ptr [rsp + 0x360], ymm0
0x10027cb8b: vmovaps ymmword ptr [rsp + 0x340], ymm0
0x10027cb94: vmovaps ymmword ptr [rsp + 0x320], ymm0
0x10027cb9d: vmovaps ymmword ptr [rsp + 0x300], ymm0
0x10027cba6: vmovaps ymmword ptr [rsp + 0x2e0], ymm0
0x10027cbaf: vmovaps ymmword ptr [rsp + 0x2c0], ymm0
0x10027cbb8: vmovaps ymmword ptr [rsp + 0x2a0], ymm0
0x10027cbc1: vmovaps ymmword ptr [rsp + 0x280], ymm0
0x10027cbca: vmovaps ymmword ptr [rsp + 0x260], ymm0
0x10027cbd3: mov eax, dword ptr [r13 + 0xd4]
0x10027cbda: mov word ptr [rsp + 0x260], 0x3b39
0x10027cbe4: mov dword ptr [rsp + 0x280], eax
0x10027cbeb: mov dword ptr [rsp + 0x284], eax
0x10027cbf2: mov dword ptr [rsp + 0x400], 3
0x10027cbfd: mov dword ptr [rsp + 0x40c], 2
0x10027cc08: mov rdi, qword ptr [r13 + 0x110]
0x10027cc0f: test rdi, rdi
0x10027cc12: je 0x10027ccb3
0x10027cc18: mov rbx, qword ptr [r13 + 0x118]
0x10027cc1f: test rbx, rbx
0x10027cc22: je 0x10027ccb3
0x10027cc28: mov rax, qword ptr [rdi]
0x10027cc2b: vzeroupper 
0x10027cc2e: call qword ptr [rax]
0x10027cc30: cmp rbx, rax
0x10027cc33: jne 0x10027ccb3
0x10027cc35: mov rdi, qword ptr [r13 + 0x110]
0x10027cc3c: mov rax, qword ptr [rdi]
0x10027cc3f: lea rsi, [rsp + 0x260]
0x10027cc47: call qword ptr [rax + 0x88]
0x10027cc4d: jmp 0x10027ccb3 ; 0x10027ccb3
0x10027cc4f: mov rdi, qword ptr [r13 + 0x110]
0x10027cc56: test rdi, rdi
0x10027cc59: je 0x10027ccb3
0x10027cc5b: mov rbx, qword ptr [r13 + 0x118]
0x10027cc62: test rbx, rbx
0x10027cc65: je 0x10027ccb3
0x10027cc67: mov rax, qword ptr [rdi]
0x10027cc6a: call qword ptr [rax]
0x10027cc6c: cmp rbx, rax
0x10027cc6f: jne 0x10027ccb3
0x10027cc71: mov rdi, qword ptr [r13 + 0x110]
0x10027cc78: mov rax, qword ptr [rdi]
0x10027cc7b: call qword ptr [rax + 0x10]
0x10027cc7e: test al, al
0x10027cc80: je 0x10027ccb3
0x10027cc82: mov rdi, qword ptr [r13 + 0x110]
0x10027cc89: test rdi, rdi
0x10027cc8c: je 0x10027ccb3
0x10027cc8e: mov rbx, qword ptr [r13 + 0x118]
0x10027cc95: test rbx, rbx
0x10027cc98: je 0x10027ccb3
0x10027cc9a: mov rax, qword ptr [rdi]
0x10027cc9d: call qword ptr [rax]
0x10027cc9f: cmp rbx, rax
0x10027cca2: jne 0x10027ccb3
0x10027cca4: mov rdi, qword ptr [r13 + 0x110]
0x10027ccab: mov rax, qword ptr [rdi]
0x10027ccae: xor esi, esi
0x10027ccb0: call qword ptr [rax + 0x30]
0x10027ccb3: vmovss xmm0, dword ptr [r13 + 0xd4]
0x10027ccbc: vmovss xmm1, dword ptr [r13 + 0xd8]
0x10027ccc5: vucomiss xmm0, dword ptr [rip + 0x82b8e3] ; 0x100aa85b0
0x10027cccd: jbe 0x10027cfeb
0x10027ccd3: vucomiss xmm1, xmm0
0x10027ccd7: jbe 0x10027cfeb
0x10027ccdd: mov rdi, qword ptr [r13 + 0x130]
0x10027cce4: test rdi, rdi
0x10027cce7: je 0x10027cd44
0x10027cce9: mov rbx, qword ptr [r13 + 0x138]
0x10027ccf0: test rbx, rbx
0x10027ccf3: je 0x10027cd44
0x10027ccf5: mov rax, qword ptr [rdi]
0x10027ccf8: vzeroupper 
0x10027ccfb: call qword ptr [rax]
0x10027ccfd: cmp rbx, rax
0x10027cd00: jne 0x10027cd44
0x10027cd02: mov rdi, qword ptr [r13 + 0x130]
0x10027cd09: mov rax, qword ptr [rdi]
0x10027cd0c: call qword ptr [rax + 0x10]
0x10027cd0f: test al, al
0x10027cd11: je 0x10027cd44
0x10027cd13: mov rdi, qword ptr [r13 + 0x130]
0x10027cd1a: test rdi, rdi
0x10027cd1d: je 0x10027cd44
0x10027cd1f: mov rbx, qword ptr [r13 + 0x138]
0x10027cd26: test rbx, rbx
0x10027cd29: je 0x10027cd44
0x10027cd2b: mov rax, qword ptr [rdi]
0x10027cd2e: call qword ptr [rax]
0x10027cd30: cmp rbx, rax
0x10027cd33: jne 0x10027cd44
0x10027cd35: mov rdi, qword ptr [r13 + 0x130]
0x10027cd3c: mov rax, qword ptr [rdi]
0x10027cd3f: xor esi, esi
0x10027cd41: call qword ptr [rax + 0x30]
0x10027cd44: mov byte ptr [r13 + 0x10d], 0
0x10027cd4c: cmp byte ptr [r13 + 0x10c], 0
0x10027cd54: jne 0x10027cfdc
0x10027cd5a: vxorps ymm0, ymm0, ymm0
0x10027cd5e: vmovups ymmword ptr [rsp + 0x3ec], ymm0
0x10027cd67: vmovaps ymmword ptr [rsp + 0x3e0], ymm0
0x10027cd70: vmovaps ymmword ptr [rsp + 0x3c0], ymm0
0x10027cd79: vmovaps ymmword ptr [rsp + 0x3a0], ymm0
0x10027cd82: vmovaps ymmword ptr [rsp + 0x380], ymm0
0x10027cd8b: vmovaps ymmword ptr [rsp + 0x360], ymm0
0x10027cd94: vmovaps ymmword ptr [rsp + 0x340], ymm0
0x10027cd9d: vmovaps ymmword ptr [rsp + 0x320], ymm0
0x10027cda6: vmovaps ymmword ptr [rsp + 0x300], ymm0
0x10027cdaf: vmovaps ymmword ptr [rsp + 0x2e0], ymm0
0x10027cdb8: vmovaps ymmword ptr [rsp + 0x2c0], ymm0
0x10027cdc1: vmovaps ymmword ptr [rsp + 0x2a0], ymm0
0x10027cdca: vmovaps ymmword ptr [rsp + 0x280], ymm0
0x10027cdd3: vmovaps ymmword ptr [rsp + 0x260], ymm0
0x10027cddc: vxorps ymm4, ymm4, ymm4
0x10027cde0: vmovapd xmm0, xmmword ptr [r13 + 0x70]
0x10027cde6: vpermilpd xmm1, xmm0, 1
0x10027cdec: vminss xmm2, xmm1, xmm0
0x10027cdf0: vcmpunordss xmm3, xmm0, xmm0
0x10027cdf5: vblendvps xmm1, xmm2, xmm1, xmm3
0x10027cdfb: vmovshdup xmm0, xmm0
0x10027cdff: vcmpunordss xmm2, xmm1, xmm1
0x10027ce04: vminss xmm1, xmm0, xmm1
0x10027ce08: vblendvps xmm0, xmm1, xmm0, xmm2
0x10027ce0e: mov byte ptr [rsp + 0x260], 0x5a
0x10027ce16: vmovss dword ptr [rsp + 0x280], xmm0
0x10027ce1f: mov dword ptr [rsp + 0x400], 1
0x10027ce2a: mov dword ptr [rsp + 0x40c], 1
0x10027ce35: vmovaps ymmword ptr [rsp + 0x6c0], ymm4
0x10027ce3e: vmovaps ymmword ptr [rsp + 0x6a0], ymm4
0x10027ce47: vmovaps ymmword ptr [rsp + 0x680], ymm4
0x10027ce50: vmovaps ymmword ptr [rsp + 0x660], ymm4
0x10027ce59: mov eax, dword ptr [r13 + 0xd4]
0x10027ce60: mov byte ptr [rsp + 0x66d], 1
0x10027ce68: mov dword ptr [rsp + 0x660], eax
0x10027ce6f: vmovaps xmm0, xmmword ptr [rsp + 0x90]
0x10027ce78: vmovaps xmmword ptr [rsp + 0x670], xmm0
0x10027ce81: mov r14, r12
0x10027ce84: movabs r12, 0x41a0000040400000
0x10027ce8e: mov qword ptr [rsp + 0x6a8], r12
0x10027ce96: mov dword ptr [rsp + 0x6d0], 0xc31
0x10027cea1: lea rsi, [rip + 0x900250] ; 0x100b7d0f8 DarkStoneMeltStart
0x10027cea8: lea rdx, [rsp + 0x660]
0x10027ceb0: lea rcx, [rsp + 0x260]
0x10027ceb8: mov rbx, qword ptr [rsp + 0xd8]
0x10027cec0: mov rdi, rbx
0x10027cec3: vzeroupper 
0x10027cec6: call 0x1006018a0 ; 0x1006018a0
0x10027cecb: vxorps ymm1, ymm1, ymm1
0x10027cecf: vmovaps ymmword ptr [rsp + 0x820], ymm1
0x10027ced8: vmovaps ymmword ptr [rsp + 0x860], ymm1
0x10027cee1: vmovaps ymmword ptr [rsp + 0x880], ymm1
0x10027ceea: vmovaps ymmword ptr [rsp + 0x840], ymm1
0x10027cef3: mov byte ptr [rsp + 0x82d], 1
0x10027cefb: mov dword ptr [rsp + 0x820], 0x3f800000
0x10027cf06: vmovaps xmm0, xmmword ptr [rsp + 0x90]
0x10027cf0f: vmovaps xmmword ptr [rsp + 0x830], xmm0
0x10027cf18: mov qword ptr [rsp + 0x868], r12
0x10027cf20: mov r12, r14
0x10027cf23: mov dword ptr [rsp + 0x890], 0xc31
0x10027cf2e: vmovups ymmword ptr [rsp + 0x7f0], ymm1
0x10027cf37: vmovaps ymmword ptr [rsp + 0x7e0], ymm1
0x10027cf40: vmovaps ymmword ptr [rsp + 0x7c0], ymm1
0x10027cf49: vmovaps ymmword ptr [rsp + 0x7a0], ymm1
0x10027cf52: vmovaps ymmword ptr [rsp + 0x780], ymm1
0x10027cf5b: vmovaps ymmword ptr [rsp + 0x760], ymm1
0x10027cf64: vmovaps ymmword ptr [rsp + 0x740], ymm1
0x10027cf6d: vmovaps ymmword ptr [rsp + 0x720], ymm1
0x10027cf76: vmovaps ymmword ptr [rsp + 0x700], ymm1
0x10027cf7f: vmovaps ymmword ptr [rsp + 0x6e0], ymm1
0x10027cf88: vmovaps ymmword ptr [rsp + 0x6c0], ymm1
0x10027cf91: vmovaps ymmword ptr [rsp + 0x6a0], ymm1
0x10027cf9a: vmovaps ymmword ptr [rsp + 0x680], ymm1
0x10027cfa3: vmovaps ymmword ptr [rsp + 0x660], ymm1
0x10027cfac: lea rsi, [rip + 0x900158] ; 0x100b7d10b DarkStoneMeltLP
0x10027cfb3: lea rdx, [rsp + 0x820]
0x10027cfbb: lea rcx, [rsp + 0x660]
0x10027cfc3: mov rdi, rbx
0x10027cfc6: vzeroupper 
0x10027cfc9: call 0x1006018a0 ; 0x1006018a0
0x10027cfce: mov qword ptr [r13 + 0x120], rax
0x10027cfd5: mov qword ptr [r13 + 0x128], rdx
0x10027cfdc: mov word ptr [r13 + 0x10c], 1
0x10027cfe6: jmp 0x10027d4df ; 0x10027d4df
0x10027cfeb: vmovss xmm2, dword ptr [rip + 0x82b5bd] ; 0x100aa85b0
0x10027cff3: vucomiss xmm2, xmm0
0x10027cff7: ja 0x10027d401
0x10027cffd: vucomiss xmm0, xmm1
0x10027d001: jne 0x10027d009
0x10027d003: jnp 0x10027d401
0x10027d009: vucomiss xmm0, dword ptr [rip + 0x82b59f] ; 0x100aa85b0
0x10027d011: jbe 0x10027d4df
0x10027d017: vucomiss xmm0, xmm1
0x10027d01b: jbe 0x10027d4df
0x10027d021: mov rdi, qword ptr [r13 + 0x120]
0x10027d028: test rdi, rdi
0x10027d02b: je 0x10027d088
0x10027d02d: mov rbx, qword ptr [r13 + 0x128]
0x10027d034: test rbx, rbx
0x10027d037: je 0x10027d088
0x10027d039: mov rax, qword ptr [rdi]
0x10027d03c: vzeroupper 
0x10027d03f: call qword ptr [rax]
0x10027d041: cmp rbx, rax
0x10027d044: jne 0x10027d088
0x10027d046: mov rdi, qword ptr [r13 + 0x120]
0x10027d04d: mov rax, qword ptr [rdi]
0x10027d050: call qword ptr [rax + 0x10]
0x10027d053: test al, al
0x10027d055: je 0x10027d088
0x10027d057: mov rdi, qword ptr [r13 + 0x120]
0x10027d05e: test rdi, rdi
0x10027d061: je 0x10027d088
0x10027d063: mov rbx, qword ptr [r13 + 0x128]
0x10027d06a: test rbx, rbx
0x10027d06d: je 0x10027d088
0x10027d06f: mov rax, qword ptr [rdi]
0x10027d072: call qword ptr [rax]
0x10027d074: cmp rbx, rax
0x10027d077: jne 0x10027d088
0x10027d079: mov rdi, qword ptr [r13 + 0x120]
0x10027d080: mov rax, qword ptr [rdi]
0x10027d083: xor esi, esi
0x10027d085: call qword ptr [rax + 0x30]
0x10027d088: mov byte ptr [r13 + 0x10c], 0
0x10027d090: cmp byte ptr [r13 + 0x10d], 0
0x10027d098: jne 0x10027d210
0x10027d09e: vxorps ymm0, ymm0, ymm0
0x10027d0a2: vmovups ymmword ptr [rsp + 0x3ec], ymm0
0x10027d0ab: vmovaps ymmword ptr [rsp + 0x3e0], ymm0
0x10027d0b4: vmovaps ymmword ptr [rsp + 0x3c0], ymm0
0x10027d0bd: vmovaps ymmword ptr [rsp + 0x3a0], ymm0
0x10027d0c6: vmovaps ymmword ptr [rsp + 0x380], ymm0
0x10027d0cf: vmovaps ymmword ptr [rsp + 0x360], ymm0
0x10027d0d8: vmovaps ymmword ptr [rsp + 0x340], ymm0
0x10027d0e1: vmovaps ymmword ptr [rsp + 0x320], ymm0
0x10027d0ea: vmovaps ymmword ptr [rsp + 0x300], ymm0
0x10027d0f3: vmovaps ymmword ptr [rsp + 0x2e0], ymm0
0x10027d0fc: vmovaps ymmword ptr [rsp + 0x2c0], ymm0
0x10027d105: vmovaps ymmword ptr [rsp + 0x2a0], ymm0
0x10027d10e: vmovaps ymmword ptr [rsp + 0x280], ymm0
0x10027d117: vmovaps ymmword ptr [rsp + 0x260], ymm0
0x10027d120: vmovapd xmm1, xmmword ptr [r13 + 0x70]
0x10027d126: vpermilpd xmm2, xmm1, 1
0x10027d12c: vminss xmm3, xmm2, xmm1
0x10027d130: vcmpunordss xmm4, xmm1, xmm1
0x10027d135: vblendvps xmm2, xmm3, xmm2, xmm4
0x10027d13b: vmovshdup xmm1, xmm1
0x10027d13f: vcmpunordss xmm3, xmm2, xmm2
0x10027d144: vminss xmm2, xmm1, xmm2
0x10027d148: vblendvps xmm1, xmm2, xmm1, xmm3
0x10027d14e: mov byte ptr [rsp + 0x260], 0x5a
0x10027d156: vmovss dword ptr [rsp + 0x280], xmm1
0x10027d15f: mov dword ptr [rsp + 0x400], 1
0x10027d16a: mov dword ptr [rsp + 0x40c], 1
0x10027d175: vmovaps ymmword ptr [rsp + 0x660], ymm0
0x10027d17e: vmovaps ymmword ptr [rsp + 0x6a0], ymm0
0x10027d187: vmovaps ymmword ptr [rsp + 0x6c0], ymm0
0x10027d190: vmovaps ymmword ptr [rsp + 0x680], ymm0
0x10027d199: mov byte ptr [rsp + 0x66d], 1
0x10027d1a1: mov dword ptr [rsp + 0x660], 0x3f800000
0x10027d1ac: vmovaps xmm0, xmmword ptr [rsp + 0x90]
0x10027d1b5: vmovaps xmmword ptr [rsp + 0x670], xmm0
0x10027d1be: movabs rax, 0x41a0000040400000
0x10027d1c8: mov qword ptr [rsp + 0x6a8], rax
0x10027d1d0: mov dword ptr [rsp + 0x6d0], 0xc31
0x10027d1db: lea rsi, [rip + 0x8fff39] ; 0x100b7d11b DarkStoneRegeneration
0x10027d1e2: lea rdx, [rsp + 0x660]
0x10027d1ea: lea rcx, [rsp + 0x260]
0x10027d1f2: mov rdi, qword ptr [rsp + 0xd8]
0x10027d1fa: vzeroupper 
0x10027d1fd: call 0x1006018a0 ; 0x1006018a0
0x10027d202: mov qword ptr [r13 + 0x130], rax
0x10027d209: mov qword ptr [r13 + 0x138], rdx
0x10027d210: mov byte ptr [r13 + 0x10d], 1
0x10027d218: jmp 0x10027d4df ; 0x10027d4df
0x10027d21d: xor r12d, r12d
0x10027d220: vxorps xmm1, xmm1, xmm1
0x10027d224: vmovsd qword ptr [rsp + 0x68], xmm1
0x10027d22a: mov dword ptr [rsp + 0xc0], 0
0x10027d235: mov dword ptr [rsp + 0xf0], 0
0x10027d240: xor r15d, r15d
0x10027d243: test r8, r8
0x10027d246: je 0x10027d260
0x10027d248: vmovss xmm0, dword ptr [r8 + 0xd0]
0x10027d251: vucomiss xmm0, dword ptr [rip + 0x827e67] ; 0x100aa50c0
0x10027d259: jae 0x10027d26c
0x10027d25b: jmp 0x10027d3cc ; 0x10027d3cc
0x10027d260: vucomiss xmm0, dword ptr [rsp + 0x24]
0x10027d266: jae 0x10027d3cc
0x10027d26c: vmovsd xmm0, qword ptr [rsp + 0x60]
0x10027d272: vaddss xmm0, xmm0, dword ptr [r13 + 0x184]
0x10027d27b: vxorps xmm1, xmm1, xmm1
0x10027d27f: vmaxss xmm0, xmm1, xmm0
0x10027d283: vmovss xmm1, dword ptr [rip + 0x82a565] ; 0x100aa77f0
0x10027d28b: vminss xmm2, xmm1, xmm0
0x10027d28f: vmovss dword ptr [r13 + 0x184], xmm2
0x10027d298: vmovss xmm1, dword ptr [r13 + 0xd0]
0x10027d2a1: vmovss xmm0, dword ptr [rip + 0x827e17] ; 0x100aa50c0
0x10027d2a9: vucomiss xmm0, xmm1
0x10027d2ad: jbe 0x10027d3cc
0x10027d2b3: vucomiss xmm2, dword ptr [rip + 0x82a535] ; 0x100aa77f0
0x10027d2bb: jb 0x10027d2f4
0x10027d2bd: vcvtss2sd xmm1, xmm1, xmm1
0x10027d2c1: vmovsd xmm2, qword ptr [rsp + 0x60]
0x10027d2c7: vcvtss2sd xmm2, xmm2, xmm2
0x10027d2cb: vmulsd xmm2, xmm2, qword ptr [rip + 0x837e8d] ; 0x100ab5160
0x10027d2d3: vaddsd xmm1, xmm2, xmm1
0x10027d2d7: vcvtsd2ss xmm1, xmm1, xmm1
0x10027d2db: vmovss xmm2, dword ptr [rip + 0x837dcd] ; 0x100ab50b0
0x10027d2e3: vmaxss xmm1, xmm2, xmm1
0x10027d2e7: vminss xmm1, xmm0, xmm1
0x10027d2eb: vmovss dword ptr [r13 + 0xd0], xmm1
0x10027d2f4: vmovss xmm1, dword ptr [r13 + 0xd4]
0x10027d2fd: vsubss xmm0, xmm0, xmm1
0x10027d301: vmulss xmm0, xmm0, dword ptr [rip + 0x82a4d3] ; 0x100aa77dc
0x10027d309: vaddss xmm0, xmm1, xmm0
0x10027d30d: vcvttss2si ecx, xmm0
0x10027d311: vmovaps xmm0, xmmword ptr [rsp + 0x90]
0x10027d31a: vmovaps xmmword ptr [rsp + 0x1c0], xmm0
0x10027d323: vmovaps xmm0, xmmword ptr [r13 + 0x90]
0x10027d32c: vmulps xmm1, xmm0, xmm0
0x10027d330: vmovshdup xmm2, xmm1
0x10027d334: vaddss xmm2, xmm1, xmm2
0x10027d338: vpermilpd xmm1, xmm1, 1
0x10027d33e: vaddss xmm1, xmm1, xmm2
0x10027d342: vsqrtss xmm1, xmm1, xmm1
0x10027d346: vucomiss xmm1, dword ptr [rip + 0x82a576] ; 0x100aa78c4
0x10027d34e: vmovss dword ptr [rsp + 0x40], xmm3
0x10027d354: jbe 0x10027d360
0x10027d356: vpermilps xmm1, xmm1, 0xc0
0x10027d35c: vdivps xmm0, xmm0, xmm1
0x10027d360: vmovaps xmmword ptr [rsp + 0x1b0], xmm0
0x10027d369: lea rax, [rip + 0x1dc22b0] ; 0x10203f620
0x10027d370: vmovaps xmm0, xmmword ptr [rax]
0x10027d374: vmovaps xmmword ptr [rsp + 0x1a0], xmm0
0x10027d37d: lea rsi, [rsp + 0x1c0]
0x10027d385: lea rdx, [rsp + 0x1b0]
0x10027d38d: lea r8, [rsp + 0x1a0]
0x10027d395: mov rdi, qword ptr [rsp + 0x100]
0x10027d39d: call 0x1001bd8e0 ; 0x1001bd8e0
0x10027d3a2: mov dword ptr [rsp + 0x70], 0
0x10027d3aa: vmovss xmm0, dword ptr [rip + 0x8314ce] ; 0x100aae880
0x10027d3b2: vmovss xmm3, dword ptr [rsp + 0x40]
0x10027d3b8: vmovss xmm1, dword ptr [rip + 0x830580] ; 0x100aad940
0x10027d3c0: vucomiss xmm1, xmm3
0x10027d3c4: ja 0x10027cb09
0x10027d3ca: jmp 0x10027d3ee ; 0x10027d3ee
0x10027d3cc: mov dword ptr [rsp + 0x70], 0
0x10027d3d4: vmovss xmm0, dword ptr [rip + 0x8314a4] ; 0x100aae880
0x10027d3dc: vmovss xmm1, dword ptr [rip + 0x83055c] ; 0x100aad940
0x10027d3e4: vucomiss xmm1, xmm3
0x10027d3e8: ja 0x10027cb09
0x10027d3ee: lea r14, [r13 + 0xd4]
0x10027d3f5: lea rcx, [r13 + 0xd8]
0x10027d3fc: jmp 0x10027e20d ; 0x10027e20d
0x10027d401: mov rdi, qword ptr [r13 + 0x130]
0x10027d408: test rdi, rdi
0x10027d40b: je 0x10027d468
0x10027d40d: mov rbx, qword ptr [r13 + 0x138]
0x10027d414: test rbx, rbx
0x10027d417: je 0x10027d468
0x10027d419: mov rax, qword ptr [rdi]
0x10027d41c: vzeroupper 
0x10027d41f: call qword ptr [rax]
0x10027d421: cmp rbx, rax
0x10027d424: jne 0x10027d468
0x10027d426: mov rdi, qword ptr [r13 + 0x130]
0x10027d42d: mov rax, qword ptr [rdi]
0x10027d430: call qword ptr [rax + 0x10]
0x10027d433: test al, al
0x10027d435: je 0x10027d468
0x10027d437: mov rdi, qword ptr [r13 + 0x130]
0x10027d43e: test rdi, rdi
0x10027d441: je 0x10027d468
0x10027d443: mov rbx, qword ptr [r13 + 0x138]
0x10027d44a: test rbx, rbx
0x10027d44d: je 0x10027d468
0x10027d44f: mov rax, qword ptr [rdi]
0x10027d452: call qword ptr [rax]
0x10027d454: cmp rbx, rax
0x10027d457: jne 0x10027d468
0x10027d459: mov rdi, qword ptr [r13 + 0x130]
0x10027d460: mov rax, qword ptr [rdi]
0x10027d463: xor esi, esi
0x10027d465: call qword ptr [rax + 0x30]
0x10027d468: mov byte ptr [r13 + 0x10d], 0
0x10027d470: mov rdi, qword ptr [r13 + 0x120]
0x10027d477: test rdi, rdi
0x10027d47a: je 0x10027d4d7
0x10027d47c: mov rbx, qword ptr [r13 + 0x128]
0x10027d483: test rbx, rbx
0x10027d486: je 0x10027d4d7
0x10027d488: mov rax, qword ptr [rdi]
0x10027d48b: vzeroupper 
0x10027d48e: call qword ptr [rax]
0x10027d490: cmp rbx, rax
0x10027d493: jne 0x10027d4d7
0x10027d495: mov rdi, qword ptr [r13 + 0x120]
0x10027d49c: mov rax, qword ptr [rdi]
0x10027d49f: call qword ptr [rax + 0x10]
0x10027d4a2: test al, al
0x10027d4a4: je 0x10027d4d7
0x10027d4a6: mov rdi, qword ptr [r13 + 0x120]
0x10027d4ad: test rdi, rdi
0x10027d4b0: je 0x10027d4d7
0x10027d4b2: mov rbx, qword ptr [r13 + 0x128]
0x10027d4b9: test rbx, rbx
0x10027d4bc: je 0x10027d4d7
0x10027d4be: mov rax, qword ptr [rdi]
0x10027d4c1: call qword ptr [rax]
0x10027d4c3: cmp rbx, rax
0x10027d4c6: jne 0x10027d4d7
0x10027d4c8: mov rdi, qword ptr [r13 + 0x120]
0x10027d4cf: mov rax, qword ptr [rdi]
0x10027d4d2: xor esi, esi
0x10027d4d4: call qword ptr [rax + 0x30]
0x10027d4d7: mov byte ptr [r13 + 0x10c], 0
0x10027d4df: lea rax, [r13 + 0xd8]
0x10027d4e6: vmovss xmm0, dword ptr [rip + 0x831392] ; 0x100aae880
0x10027d4ee: vucomiss xmm0, dword ptr [rsp + 0x24]
0x10027d4f4: mov qword ptr [rsp + 0x40], rax
0x10027d4f9: jb 0x10027d5a0
0x10027d4ff: vmovss xmm0, dword ptr [rax]
0x10027d503: vxorps xmm1, xmm1, xmm1
0x10027d507: vucomiss xmm0, xmm1
0x10027d50b: vmovss xmm0, dword ptr [rip + 0x83136d] ; 0x100aae880
0x10027d513: jbe 0x10027d5a0
0x10027d519: mov rdi, qword ptr [r13 + 0x120]
0x10027d520: test rdi, rdi
0x10027d523: je 0x10027d5a0
0x10027d525: mov rbx, qword ptr [r13 + 0x128]
0x10027d52c: test rbx, rbx
0x10027d52f: je 0x10027d5a0
0x10027d531: mov rax, qword ptr [rdi]
0x10027d534: vzeroupper 
0x10027d537: call qword ptr [rax]
0x10027d539: vmovss xmm0, dword ptr [rip + 0x83133f] ; 0x100aae880
0x10027d541: cmp rbx, rax
0x10027d544: jne 0x10027d5a0
0x10027d546: mov rdi, qword ptr [r13 + 0x120]
0x10027d54d: mov rax, qword ptr [rdi]
0x10027d550: call qword ptr [rax + 0x10]
0x10027d553: vmovss xmm0, dword ptr [rip + 0x831325] ; 0x100aae880
0x10027d55b: test al, al
0x10027d55d: je 0x10027d5a0
0x10027d55f: mov rdi, qword ptr [r13 + 0x120]
0x10027d566: test rdi, rdi
0x10027d569: je 0x10027d5a0
0x10027d56b: mov rbx, qword ptr [r13 + 0x128]
0x10027d572: test rbx, rbx
0x10027d575: je 0x10027d5a0
0x10027d577: mov rax, qword ptr [rdi]
0x10027d57a: call qword ptr [rax]
0x10027d57c: vmovss xmm0, dword ptr [rip + 0x8312fc] ; 0x100aae880
0x10027d584: cmp rbx, rax
0x10027d587: jne 0x10027d5a0
0x10027d589: mov rdi, qword ptr [r13 + 0x120]
0x10027d590: mov rax, qword ptr [rdi]
0x10027d593: xor esi, esi
0x10027d595: call qword ptr [rax + 0x30]
0x10027d598: vmovss xmm0, dword ptr [rip + 0x8312e0] ; 0x100aae880
0x10027d5a0: cmp dword ptr [rsp + 0xc0], 0
0x10027d5a8: setne al
0x10027d5ab: and r12b, al
0x10027d5ae: mov dword ptr [rsp + 0x2c], r15d
0x10027d5b3: je 0x10027d6fc
0x10027d5b9: mov eax, dword ptr [rsp + 0xf0]
0x10027d5c0: cmp eax, dword ptr [r13 + 0x140]
0x10027d5c7: jae 0x10027d704
0x10027d5cd: cmp byte ptr [r13 + 0x10e], 0
0x10027d5d5: jne 0x10027d704
0x10027d5db: vxorps ymm0, ymm0, ymm0
0x10027d5df: vmovaps ymmword ptr [rsp + 0x660], ymm0
0x10027d5e8: vmovaps ymmword ptr [rsp + 0x6a0], ymm0
0x10027d5f1: vmovaps ymmword ptr [rsp + 0x6c0], ymm0
0x10027d5fa: vmovaps ymmword ptr [rsp + 0x680], ymm0
0x10027d603: mov byte ptr [rsp + 0x66d], 1
0x10027d60b: mov dword ptr [rsp + 0x660], 0x3f800000
0x10027d616: vmovaps xmm1, xmmword ptr [rsp + 0x90]
0x10027d61f: vmovaps xmmword ptr [rsp + 0x670], xmm1
0x10027d628: movabs rax, 0x4170000040000000
0x10027d632: mov qword ptr [rsp + 0x6a8], rax
0x10027d63a: mov dword ptr [rsp + 0x6d0], 0xc31
0x10027d645: vmovups ymmword ptr [rsp + 0x3f0], ymm0
0x10027d64e: vmovaps ymmword ptr [rsp + 0x3e0], ymm0
0x10027d657: vmovaps ymmword ptr [rsp + 0x3c0], ymm0
0x10027d660: vmovaps ymmword ptr [rsp + 0x3a0], ymm0
0x10027d669: vmovaps ymmword ptr [rsp + 0x380], ymm0
0x10027d672: vmovaps ymmword ptr [rsp + 0x360], ymm0
0x10027d67b: vmovaps ymmword ptr [rsp + 0x340], ymm0
0x10027d684: vmovaps ymmword ptr [rsp + 0x320], ymm0
0x10027d68d: vmovaps ymmword ptr [rsp + 0x300], ymm0
0x10027d696: vmovaps ymmword ptr [rsp + 0x2e0], ymm0
0x10027d69f: vmovaps ymmword ptr [rsp + 0x2c0], ymm0
0x10027d6a8: vmovaps ymmword ptr [rsp + 0x2a0], ymm0
0x10027d6b1: vmovaps ymmword ptr [rsp + 0x280], ymm0
0x10027d6ba: vmovaps ymmword ptr [rsp + 0x260], ymm0
0x10027d6c3: lea rsi, [rip + 0x8ffa67] ; 0x100b7d131 UnmeltableDarkstone
0x10027d6ca: lea rdx, [rsp + 0x660]
0x10027d6d2: lea rcx, [rsp + 0x260]
0x10027d6da: mov rdi, qword ptr [rsp + 0xd8]
0x10027d6e2: vzeroupper 
0x10027d6e5: call 0x1006018a0 ; 0x1006018a0
0x10027d6ea: vmovss xmm0, dword ptr [rip + 0x83118e] ; 0x100aae880
0x10027d6f2: mov byte ptr [r13 + 0x10e], 1
0x10027d6fa: jmp 0x10027d704 ; 0x10027d704
0x10027d6fc: mov byte ptr [r13 + 0x10e], 0
0x10027d704: lea r14, [r13 + 0xd4]
0x10027d70b: xor esi, esi
0x10027d70d: vucomiss xmm0, dword ptr [rsp + 0x24]
0x10027d713: setb sil
0x10027d717: mov rdi, qword ptr [r13 + 0x28]
0x10027d71b: vzeroupper 
0x10027d71e: call 0x1003ffe50 ; 0x1003ffe50
0x10027d723: vmovss xmm0, dword ptr [rip + 0x831155] ; 0x100aae880
0x10027d72b: vucomiss xmm0, dword ptr [rsp + 0x24]
0x10027d731: jae 0x10027e208
0x10027d737: vmovss xmm0, dword ptr [r13 + 0xd8]
0x10027d740: vmovss xmm2, dword ptr [r13 + 0xd4]
0x10027d749: vsubss xmm1, xmm0, xmm2
0x10027d74d: vucomiss xmm1, dword ptr [rip + 0x829347] ; 0x100aa6a9c
0x10027d755: ja 0x10027d77c
0x10027d757: vmovss xmm0, dword ptr [rip + 0x837961] ; 0x100ab50c0
0x10027d75f: vucomiss xmm0, xmm1
0x10027d763: ja 0x10027d77c
0x10027d765: vmovaps xmm0, xmmword ptr [r13 + 0xc0]
0x10027d76e: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x10027d777: jmp 0x10027daeb ; 0x10027daeb
0x10027d77c: vxorps xmm0, xmm0, xmm0
0x10027d780: vucomiss xmm1, xmm0
0x10027d784: jbe 0x10027d8d7
0x10027d78a: vmovss dword ptr [rsp + 0xa0], xmm1
0x10027d793: vmovss xmm1, dword ptr [rip + 0x827925] ; 0x100aa50c0
0x10027d79b: vmovss xmm0, dword ptr [rip + 0x826e15] ; 0x100aa45b8
0x10027d7a3: vucomiss xmm0, xmm2
0x10027d7a7: jbe 0x10027d7cd
0x10027d7a9: vaddss xmm0, xmm2, xmm2
0x10027d7ad: vmovss xmm1, dword ptr [rip + 0x82790b] ; 0x100aa50c0
0x10027d7b5: vsubss xmm1, xmm1, xmm0
0x10027d7b9: vmulss xmm1, xmm1, dword ptr [rip + 0x8292e7] ; 0x100aa6aa8
0x10027d7c1: vmulss xmm0, xmm0, dword ptr [rip + 0x82a023] ; 0x100aa77ec
0x10027d7c9: vaddss xmm1, xmm0, xmm1
0x10027d7cd: vmovss dword ptr [rsp + 0xe0], xmm1
0x10027d7d6: vmovss xmm0, dword ptr [rsp + 0xbc]
0x10027d7df: vmulss xmm0, xmm0, dword ptr [rip + 0x829905] ; 0x100aa70ec
0x10027d7e7: vmovsd qword ptr [rsp + 0x30], xmm2
0x10027d7ed: call 0x100aa2bca ; 0x100aa2bca _sinf
0x10027d7f2: vmulss xmm0, xmm0, dword ptr [rsp + 0xa0]
0x10027d7fb: vmulss xmm0, xmm0, dword ptr [rip + 0x8378c1] ; 0x100ab50c4
0x10027d803: vmulss xmm0, xmm0, dword ptr [rsp + 0xe0]
0x10027d80c: vmulss xmm0, xmm0, dword ptr [rsp + 0x60]
0x10027d812: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x10027d817: vmovshdup xmm1, xmm0
0x10027d81b: vmovss xmm2, dword ptr [rip + 0x82789d] ; 0x100aa50c0
0x10027d823: vsubss xmm2, xmm2, xmm1
0x10027d827: vxorps xmm3, xmm3, xmm3
0x10027d82b: vmulss xmm4, xmm2, xmm3
0x10027d82f: vaddss xmm5, xmm1, xmm4
0x10027d833: vmulss xmm3, xmm0, xmm3
0x10027d837: vaddss xmm6, xmm3, xmm4
0x10027d83b: vsubss xmm7, xmm4, xmm0
0x10027d83f: vsubss xmm10, xmm4, xmm3
0x10027d843: vaddss xmm9, xmm1, xmm2
0x10027d847: vaddss xmm8, xmm0, xmm4
0x10027d84b: vmovaps xmm2, xmmword ptr [r13 + 0x40]
0x10027d851: vmovaps xmm4, xmmword ptr [r13 + 0x50]
0x10027d857: vmovaps xmm0, xmmword ptr [r13 + 0x60]
0x10027d85d: vpermilps xmm5, xmm5, 0
0x10027d863: vmulps xmm1, xmm2, xmm5
0x10027d867: vpermilps xmm6, xmm6, 0
0x10027d86d: vmulps xmm3, xmm4, xmm6
0x10027d871: vaddps xmm1, xmm3, xmm1
0x10027d875: vpermilps xmm3, xmm7, 0
0x10027d87b: vmulps xmm3, xmm0, xmm3
0x10027d87f: vaddps xmm1, xmm3, xmm1
0x10027d883: vmovaps xmmword ptr [rsp + 0xe0], xmm1
0x10027d88c: vpermilps xmm1, xmm10, 0
0x10027d892: vmulps xmm3, xmm2, xmm1
0x10027d896: vpermilps xmm7, xmm9, 0
0x10027d89c: vmulps xmm7, xmm4, xmm7
0x10027d8a0: vaddps xmm3, xmm7, xmm3
0x10027d8a4: vmulps xmm6, xmm0, xmm6
0x10027d8a8: vaddps xmm3, xmm6, xmm3
0x10027d8ac: vmovaps xmmword ptr [rsp + 0xc0], xmm3
0x10027d8b5: vpermilps xmm3, xmm8, 0
0x10027d8bb: vmulps xmm2, xmm2, xmm3
0x10027d8bf: vmulps xmm1, xmm4, xmm1
0x10027d8c3: vaddps xmm1, xmm1, xmm2
0x10027d8c7: vmovsd xmm2, qword ptr [rsp + 0x30]
0x10027d8cd: vmulps xmm0, xmm0, xmm5
0x10027d8d1: vaddps xmm0, xmm0, xmm1
0x10027d8d5: jmp 0x10027d8fb ; 0x10027d8fb
0x10027d8d7: vmovaps xmm0, xmmword ptr [r13 + 0x40]
0x10027d8dd: vmovaps xmmword ptr [rsp + 0xe0], xmm0
0x10027d8e6: vmovaps xmm0, xmmword ptr [r13 + 0x50]
0x10027d8ec: vmovaps xmmword ptr [rsp + 0xc0], xmm0
0x10027d8f5: vmovaps xmm0, xmmword ptr [r13 + 0x60]
0x10027d8fb: vmovaps xmmword ptr [rsp + 0x80], xmm0
0x10027d904: mov qword ptr [rsp + 0x30], r12
0x10027d909: vmovss xmm0, dword ptr [rip + 0x8277af] ; 0x100aa50c0
0x10027d911: vsubss xmm0, xmm0, xmm2
0x10027d915: vcvtss2sd xmm0, xmm0, xmm0
0x10027d919: vmulsd xmm0, xmm0, qword ptr [rip + 0x82cc6f] ; 0x100aaa590
0x10027d921: vcvtss2sd xmm1, xmm2, xmm2
0x10027d925: vaddsd xmm0, xmm0, xmm1
0x10027d929: vcvtsd2ss xmm0, xmm0, xmm0
0x10027d92d: vmovaps xmm1, xmmword ptr [r13 + 0x70]
0x10027d933: cmp qword ptr [rbp + 0x40], 0
0x10027d938: jne 0x10027d98b
0x10027d93a: mov al, byte ptr [r13 + 0xdc]
0x10027d941: test al, al
0x10027d943: jne 0x10027d98b
0x10027d945: mov eax, dword ptr [rsp + 0x70]
0x10027d949: vmovss xmm2, dword ptr [rip + 0x826c67] ; 0x100aa45b8
0x10027d951: vmulss xmm3, xmm1, xmm2
0x10027d955: vmovshdup xmm4, xmm1
0x10027d959: vmulss xmm4, xmm4, dword ptr [rip + 0x829793] ; 0x100aa70f4
0x10027d961: vinsertps xmm3, xmm3, xmm4, 0x10
0x10027d967: vpermilpd xmm4, xmm1, 1
0x10027d96d: vmulss xmm2, xmm4, xmm2
0x10027d971: vinsertps xmm2, xmm3, xmm2, 0x20
0x10027d977: vsubps xmm1, xmm1, xmm2
0x10027d97b: vpermilps xmm0, xmm0, 0xc0
0x10027d981: vmulps xmm0, xmm0, xmm1
0x10027d985: vaddps xmm0, xmm2, xmm0
0x10027d989: jmp 0x10027d999 ; 0x10027d999
0x10027d98b: mov eax, dword ptr [rsp + 0x70]
0x10027d98f: vpermilps xmm0, xmm0, 0xc0
0x10027d995: vmulps xmm0, xmm0, xmm1
0x10027d999: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x10027d9a2: mov dword ptr [rsp + 0x70], eax
0x10027d9a6: vmovaps xmmword ptr [r13 + 0xc0], xmm0
0x10027d9af: mov rax, qword ptr [r13]
0x10027d9b3: lea r15, [rsp + 0x260]
0x10027d9bb: mov rdi, r15
0x10027d9be: mov rsi, r13
0x10027d9c1: call qword ptr [rax + 0x18]
0x10027d9c4: vmovaps xmm7, xmmword ptr [rsp + 0xa0]
0x10027d9cd: vpermilps xmm0, xmm7, 0xc0
0x10027d9d3: vmovaps xmm4, xmmword ptr [rsp + 0xe0]
0x10027d9dc: vmulps xmm0, xmm4, xmm0
0x10027d9e0: vxorps xmm1, xmm1, xmm1
0x10027d9e4: vmovaps xmm5, xmmword ptr [rsp + 0xc0]
0x10027d9ed: vmulps xmm2, xmm5, xmm1
0x10027d9f1: vaddps xmm0, xmm2, xmm0
0x10027d9f5: vmovaps xmm6, xmmword ptr [rsp + 0x80]
0x10027d9fe: vmulps xmm3, xmm6, xmm1
0x10027da02: vaddps xmm0, xmm3, xmm0
0x10027da06: vmulps xmm1, xmm4, xmm1
0x10027da0a: vpermilps xmm4, xmm7, 0xd5
0x10027da10: vmulps xmm4, xmm5, xmm4
0x10027da14: vaddps xmm4, xmm4, xmm1
0x10027da18: vaddps xmm3, xmm3, xmm4
0x10027da1c: vaddps xmm1, xmm2, xmm1
0x10027da20: vpermilps xmm2, xmm7, 0xea
0x10027da26: vmulps xmm2, xmm6, xmm2
0x10027da2a: vaddps xmm1, xmm2, xmm1
0x10027da2e: vblendps xmm0, xmm0, xmmword ptr [rsp + 0x260], 8
0x10027da39: vmovaps xmmword ptr [rsp + 0x260], xmm0
0x10027da42: vblendps xmm0, xmm3, xmmword ptr [rsp + 0x270], 8
0x10027da4d: vmovaps xmmword ptr [rsp + 0x270], xmm0
0x10027da56: vblendps xmm0, xmm1, xmmword ptr [rsp + 0x280], 8
0x10027da61: vmovaps xmmword ptr [rsp + 0x280], xmm0
0x10027da6a: mov rdi, qword ptr [r13 + 0x28]
0x10027da6e: mov rsi, r15
0x10027da71: call 0x1003ffe10 ; 0x1003ffe10
0x10027da76: mov rax, qword ptr [r13]
0x10027da7a: lea rbx, [rsp + 0x820]
0x10027da82: mov rdi, rbx
0x10027da85: mov rsi, r13
0x10027da88: call qword ptr [rax + 0x20]
0x10027da8b: lea rdi, [rsp + 0x660]
0x10027da93: mov rsi, r15
0x10027da96: mov rdx, rbx
0x10027da99: call 0x100076df0 ; 0x100076df0
0x10027da9e: vmovaps xmm0, xmmword ptr [rsp + 0x660]
0x10027daa7: vmovaps xmmword ptr [r13 + 0x80], xmm0
0x10027dab0: vmovaps xmm0, xmmword ptr [rsp + 0x670]
0x10027dab9: vmovaps xmmword ptr [r13 + 0x90], xmm0
0x10027dac2: vmovaps xmm0, xmmword ptr [rsp + 0x680]
0x10027dacb: vmovaps xmmword ptr [r13 + 0xa0], xmm0
0x10027dad4: vmovaps xmm0, xmmword ptr [rsp + 0x690]
0x10027dadd: vmovaps xmmword ptr [r13 + 0xb0], xmm0
0x10027dae6: mov r12, qword ptr [rsp + 0x30]
0x10027daeb: vmovaps xmm1, xmmword ptr [rip + 0xaad99d] ; 0x100d2b490
0x10027daf3: test r12b, 1
0x10027daf7: vmovss xmm0, dword ptr [rip + 0x830d81] ; 0x100aae880
0x10027daff: je 0x10027db67
0x10027db01: mov eax, dword ptr [r13 + 0x104]
0x10027db08: test eax, eax
0x10027db0a: je 0x10027db45
0x10027db0c: mov rcx, qword ptr [r13 + 0x18]
0x10027db10: mov edx, dword ptr [rcx + 0x1b220]
0x10027db16: xor esi, esi
0x10027db18: nop dword ptr [rax + rax]
0x10027db20: mov edi, dword ptr [r13 + rsi*4 + 0xe4]
0x10027db28: cmp edx, edi
0x10027db2a: jbe 0x10027db3e
0x10027db2c: imul rdi, rdi, 0x1a0
0x10027db33: vucomiss xmm0, dword ptr [rcx + rdi + 0x12f0]
0x10027db3c: jb 0x10027db67
0x10027db3e: inc rsi
0x10027db41: cmp eax, esi
0x10027db43: ja 0x10027db20
0x10027db45: cmp byte ptr [r13 + 0xdc], 0
0x10027db4d: je 0x10027db67
0x10027db4f: mov eax, dword ptr [rsp + 0xf0]
0x10027db56: cmp eax, dword ptr [r13 + 0x140]
0x10027db5d: jae 0x10027db7a
0x10027db5f: vmovaps xmm1, xmmword ptr [rip + 0xaad979] ; 0x100d2b4e0
0x10027db67: cmp qword ptr [r13 + 0x170], 0
0x10027db6f: je 0x10027dbab
0x10027db71: cmp byte ptr [rsp + 0x28], 0
0x10027db76: jne 0x10027dbcc
0x10027db78: jmp 0x10027dbc4 ; 0x10027dbc4
0x10027db7a: lea rax, [rip + 0x1d8676f] ; 0x1020042f0
0x10027db81: vmovaps xmm0, xmmword ptr [rax]
0x10027db85: vmulps xmm1, xmm0, xmmword ptr [rip + 0x82b763] ; 0x100aa92f0
0x10027db8d: vpermilps xmm0, xmm0, 0xe7
0x10027db93: vmulss xmm0, xmm0, dword ptr [rip + 0x830e71] ; 0x100aaea0c
0x10027db9b: vinsertps xmm1, xmm1, xmm0, 0x30
0x10027dba1: cmp qword ptr [r13 + 0x170], 0
0x10027dba9: jne 0x10027db71
0x10027dbab: cmp byte ptr [rsp + 0x5c], 0
0x10027dbb0: je 0x10027dbc4
0x10027dbb2: cmp qword ptr [rbp + 0x40], 0
0x10027dbb7: jne 0x10027dbcc
0x10027dbb9: mov eax, dword ptr [r13 + 0x188]
0x10027dbc0: test eax, eax
0x10027dbc2: jne 0x10027dbcc
0x10027dbc4: vmulps xmm1, xmm1, xmmword ptr [rip + 0x837524] ; 0x100ab50f0
0x10027dbcc: vmovsd xmm0, qword ptr [rsp + 0x68]
0x10027dbd2: vucomiss xmm0, dword ptr [rip + 0x829cea] ; 0x100aa78c4
0x10027dbda: jbe 0x10027dc4b
0x10027dbdc: mov eax, dword ptr [rsp + 0x2c]
0x10027dbe0: cmp eax, dword ptr [r13 + 0x140]
0x10027dbe7: jb 0x10027dc4b
0x10027dbe9: vmovsd xmm0, qword ptr [rsp + 0x68]
0x10027dbef: vmulss xmm0, xmm0, dword ptr [rip + 0x82aa49] ; 0x100aa8640
0x10027dbf7: vmulss xmm0, xmm0, dword ptr [rsp + 0xbc]
0x10027dc00: call 0x100aa2bca ; 0x100aa2bca _sinf
0x10027dc05: vmovss xmm1, dword ptr [rip + 0x8269ab] ; 0x100aa45b8
0x10027dc0d: vmulss xmm0, xmm0, xmm1
0x10027dc11: vaddss xmm0, xmm0, xmm1
0x10027dc15: vxorps xmm1, xmm1, xmm1
0x10027dc19: vmaxss xmm0, xmm1, xmm0
0x10027dc1d: vmovss xmm1, dword ptr [rip + 0x82749b] ; 0x100aa50c0
0x10027dc25: vminss xmm0, xmm1, xmm0
0x10027dc29: vmovaps xmm1, xmmword ptr [rip + 0xaad89f] ; 0x100d2b4d0
0x10027dc31: vmovaps xmm2, xmmword ptr [rip + 0xaad887] ; 0x100d2b4c0
0x10027dc39: vsubps xmm1, xmm1, xmm2
0x10027dc3d: vpermilps xmm0, xmm0, 0
0x10027dc43: vmulps xmm0, xmm1, xmm0
0x10027dc47: vaddps xmm1, xmm2, xmm0
0x10027dc4b: vmovaps xmmword ptr [rsp + 0x30], xmm1
0x10027dc51: vmovsd xmm0, qword ptr [rsp + 0x60]
0x10027dc57: vmulss xmm0, xmm0, dword ptr [rip + 0x82d0e1] ; 0x100aaad40
0x10027dc5f: call 0x100aa2708 ; 0x100aa2708 _expf
0x10027dc64: vmovss xmm2, dword ptr [rip + 0x827454] ; 0x100aa50c0
0x10027dc6c: vsubss xmm0, xmm2, xmm0
0x10027dc70: vxorps xmm1, xmm1, xmm1
0x10027dc74: vmaxss xmm0, xmm1, xmm0
0x10027dc78: vminss xmm0, xmm2, xmm0
0x10027dc7c: vsubss xmm1, xmm2, xmm0
0x10027dc80: vpermilps xmm1, xmm1, 0
0x10027dc86: vmovaps xmmword ptr [rsp + 0xf0], xmm1
0x10027dc8f: vmulps xmm1, xmm1, xmmword ptr [r13 + 0x150]
0x10027dc98: vpermilps xmm0, xmm0, 0
0x10027dc9e: vmovaps xmmword ptr [rsp + 0xe0], xmm0
0x10027dca7: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x30]
0x10027dcad: vaddps xmm0, xmm0, xmm1
0x10027dcb1: vmovaps xmmword ptr [r13 + 0x150], xmm0
0x10027dcba: mov rdi, qword ptr [r13 + 0x28]
0x10027dcbe: mov qword ptr [rsp + 0x270], 0
0x10027dcca: mov byte ptr [rsp + 0x260], 0x1c
0x10027dcd2: movabs rax, 0x726f6c6f43657375
0x10027dcdc: mov qword ptr [rsp + 0x267], rax
0x10027dce4: movabs rax, 0x7375666669645f75
0x10027dcee: mov qword ptr [rsp + 0x261], rax
0x10027dcf6: mov byte ptr [rsp + 0x26f], 0
0x10027dcfe: vmovaps xmmword ptr [rsp + 0x190], xmm0
0x10027dd07: lea rdx, [rsp + 0x260]
0x10027dd0f: lea rcx, [rsp + 0x190]
0x10027dd17: xor esi, esi
0x10027dd19: vxorps xmm0, xmm0, xmm0
0x10027dd1d: call 0x1003fff20 ; 0x1003fff20
0x10027dd22: test byte ptr [rsp + 0x260], 1
0x10027dd2a: je 0x10027dd44
0x10027dd2c: mov rbx, qword ptr [rsp + 0x270]
0x10027dd34: call 0x1007e50d0 ; 0x1007e50d0
0x10027dd39: mov rdi, rax
0x10027dd3c: mov rsi, rbx
0x10027dd3f: call 0x1007e5db0 ; 0x1007e5db0
0x10027dd44: mov rbx, qword ptr [rbp + 0x48]
0x10027dd48: mov rax, qword ptr [rbx]
0x10027dd4b: mov rdi, rbx
0x10027dd4e: call qword ptr [rax + 0x10]
0x10027dd51: test al, al
0x10027dd53: vmovss xmm1, dword ptr [rip + 0x82fbe5] ; 0x100aad940
0x10027dd5b: je 0x10027de03
0x10027dd61: mov rax, qword ptr [rbx + 0x18]
0x10027dd65: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x10027dd6a: vmovaps xmmword ptr [rsp + 0xc0], xmm0
0x10027dd73: vmovaps xmmword ptr [rsp + 0x660], xmm0
0x10027dd7c: lea rax, [rip + 0x843ac1] ; 0x100ac1844
0x10027dd83: vmovss xmm0, dword ptr [rax]
0x10027dd87: vmovss dword ptr [rsp + 0x30], xmm0
0x10027dd8d: lea rdi, [rsp + 0x660]
0x10027dd95: lea rdx, [rsp + 0x260]
0x10027dd9d: mov rsi, qword ptr [rsp + 0x110]
0x10027dda5: call 0x10078d250 ; 0x10078d250
0x10027ddaa: vmovaps xmm0, xmmword ptr [rsp + 0x260]
0x10027ddb3: vsubps xmm0, xmm0, xmmword ptr [rsp + 0xc0]
0x10027ddbc: lea rax, [rsp + 0x820]
0x10027ddc4: mov qword ptr [rsp + 0x828], rax
0x10027ddcc: mov dword ptr [rsp + 0x820], 0
0x10027ddd7: vmulps xmm0, xmm0, xmm0
0x10027dddb: vmovshdup xmm1, xmm0
0x10027dddf: vaddss xmm1, xmm0, xmm1
0x10027dde3: vpermilpd xmm0, xmm0, 1
0x10027dde9: vaddss xmm0, xmm0, xmm1
0x10027dded: vmovss xmm1, dword ptr [rsp + 0x30]
0x10027ddf3: vmulss xmm1, xmm1, xmm1
0x10027ddf7: vsubss xmm0, xmm0, xmm1
0x10027ddfb: vxorps xmm1, xmm1, xmm1
0x10027ddff: vmaxss xmm1, xmm1, xmm0
0x10027de03: cmp byte ptr [r13 + 0x30], 0
0x10027de08: je 0x10027e192
0x10027de0e: vmovss dword ptr [rsp + 0x30], xmm1
0x10027de14: mov esi, dword ptr [r13 + 0x104]
0x10027de1b: vxorps xmm0, xmm0, xmm0
0x10027de1f: vxorps xmm2, xmm2, xmm2
0x10027de23: test rsi, rsi
0x10027de26: je 0x10027decf
0x10027de2c: mov rcx, qword ptr [r13 + 0x18]
0x10027de30: mov edx, dword ptr [rcx + 0x1b220]
0x10027de36: mov r8d, esi
0x10027de39: and r8d, 1
0x10027de3d: cmp esi, 1
0x10027de40: jne 0x10027de6b
0x10027de42: vxorps xmm1, xmm1, xmm1
0x10027de46: xor edi, edi
0x10027de48: test r8, r8
0x10027de4b: je 0x10027dec6
0x10027de4d: mov eax, dword ptr [r13 + rdi*4 + 0xe4]
0x10027de55: cmp edx, eax
0x10027de57: jbe 0x10027dec6
0x10027de59: imul rax, rax, 0x1a0
0x10027de60: vaddss xmm1, xmm1, dword ptr [rcx + rax + 0x12f0]
0x10027de69: jmp 0x10027dec6 ; 0x10027dec6
0x10027de6b: mov rax, rsi
0x10027de6e: sub rax, r8
0x10027de71: vxorps xmm1, xmm1, xmm1
0x10027de75: xor edi, edi
0x10027de77: nop word ptr [rax + rax]
0x10027de80: mov ebx, dword ptr [r13 + rdi*4 + 0xe4]
0x10027de88: cmp edx, ebx
0x10027de8a: jbe 0x10027de9c
0x10027de8c: imul rbx, rbx, 0x1a0
0x10027de93: vaddss xmm1, xmm1, dword ptr [rcx + rbx + 0x12f0]
0x10027de9c: mov ebx, dword ptr [r13 + rdi*4 + 0xe8]
0x10027dea4: cmp edx, ebx
0x10027dea6: jbe 0x10027deb8
0x10027dea8: imul rbx, rbx, 0x1a0
0x10027deaf: vaddss xmm1, xmm1, dword ptr [rcx + rbx + 0x12f0]
0x10027deb8: add rdi, 2
0x10027debc: cmp rax, rdi
0x10027debf: jne 0x10027de80
0x10027dec1: test r8, r8
0x10027dec4: jne 0x10027de4d
0x10027dec6: vcvtsi2ss xmm2, xmm8, rsi
0x10027decb: vdivss xmm2, xmm1, xmm2
0x10027decf: mov rax, qword ptr [r13 + 0x170]
0x10027ded6: test rax, rax
0x10027ded9: lea rcx, [rip + 0x1d863c0] ; 0x1020042a0
0x10027dee0: cmove rcx, qword ptr [rip + 0x98c5d8] ; 0x100c0a4c0
0x10027dee8: vmovaps xmm1, xmmword ptr [rcx]
0x10027deec: cmp byte ptr [rsp + 0x70], 0
0x10027def1: je 0x10027df2a
0x10027def3: vmovsd xmm0, qword ptr [rsp + 0x60]
0x10027def9: vcvtss2sd xmm0, xmm0, xmm0
0x10027defd: vmulsd xmm0, xmm0, qword ptr [rip + 0x82ebdb] ; 0x100aacae0
0x10027df05: vmovsd xmm2, qword ptr [rsp + 0x68]
0x10027df0b: vcvtss2sd xmm2, xmm2, xmm2
0x10027df0f: vaddsd xmm0, xmm0, xmm2
0x10027df13: lea rcx, [r13 + 0x34]
0x10027df17: vmovss xmm2, dword ptr [r13 + 0x34]
0x10027df1d: vcvtss2sd xmm2, xmm2, xmm2
0x10027df21: vsubsd xmm0, xmm2, xmm0
0x10027df25: jmp 0x10027dfe5 ; 0x10027dfe5
0x10027df2a: vmovss xmm4, dword ptr [rip + 0x82718e] ; 0x100aa50c0
0x10027df32: vucomiss xmm4, dword ptr [r14]
0x10027df37: jbe 0x10027df4d
0x10027df39: vmovsd xmm0, qword ptr [rsp + 0x60]
0x10027df3f: vcvtss2sd xmm0, xmm0, xmm0
0x10027df43: vmulsd xmm0, xmm0, qword ptr [rip + 0x82eb95] ; 0x100aacae0
0x10027df4b: jmp 0x10027dfb7 ; 0x10027dfb7
0x10027df4d: vmaxss xmm2, xmm0, xmm2
0x10027df51: vminss xmm2, xmm4, xmm2
0x10027df55: vmovss xmm3, dword ptr [rsp + 0x30]
0x10027df5b: vdivss xmm3, xmm3, dword ptr [rip + 0x837165] ; 0x100ab50c8
0x10027df63: vaddss xmm3, xmm3, xmm4
0x10027df67: vmaxss xmm0, xmm0, xmm3
0x10027df6b: vminss xmm0, xmm4, xmm0
0x10027df6f: vmulps xmm3, xmm1, xmmword ptr [rip + 0x82a059] ; 0x100aa7fd0
0x10027df77: vblendps xmm1, xmm3, xmm1, 8
0x10027df7d: vpermilps xmm0, xmm0, 0
0x10027df83: vmulps xmm0, xmm0, xmm1
0x10027df87: vsubss xmm1, xmm4, xmm2
0x10027df8b: vpermilps xmm1, xmm1, 0
0x10027df91: vmulps xmm1, xmm1, xmm0
0x10027df95: vxorps xmm0, xmm0, xmm0
0x10027df99: vucomiss xmm2, xmm0
0x10027df9d: vmovsd xmm0, qword ptr [rsp + 0x60]
0x10027dfa3: vcvtss2sd xmm0, xmm0, xmm0
0x10027dfa7: jbe 0x10027dfcb
0x10027dfa9: vucomiss xmm4, xmm2
0x10027dfad: jbe 0x10027dfcb
0x10027dfaf: vmulsd xmm0, xmm0, qword ptr [rip + 0x8330f9] ; 0x100ab10b0
0x10027dfb7: lea rcx, [r13 + 0x34]
0x10027dfbb: vmovss xmm2, dword ptr [r13 + 0x34]
0x10027dfc1: vcvtss2sd xmm2, xmm2, xmm2
0x10027dfc5: vaddsd xmm0, xmm0, xmm2
0x10027dfc9: jmp 0x10027dfe5 ; 0x10027dfe5
0x10027dfcb: vmulsd xmm0, xmm0, qword ptr [rip + 0x837195] ; 0x100ab5168
0x10027dfd3: lea rcx, [r13 + 0x34]
0x10027dfd7: vmovss xmm2, dword ptr [r13 + 0x34]
0x10027dfdd: vcvtss2sd xmm2, xmm2, xmm2
0x10027dfe1: vaddsd xmm0, xmm2, xmm0
0x10027dfe5: vcvtsd2ss xmm0, xmm0, xmm0
0x10027dfe9: vmovss dword ptr [rcx], xmm0
0x10027dfed: cmp qword ptr [rbp + 0x40], 0
0x10027dff2: je 0x10027e007
0x10027dff4: vmovss xmm0, dword ptr [r14]
0x10027dff9: vmulss xmm0, xmm0, xmm0
0x10027dffd: vpermilps xmm0, xmm0, 0
0x10027e003: vmulps xmm1, xmm1, xmm0
0x10027e007: vmovaps xmm0, xmmword ptr [rsp + 0xf0]
0x10027e010: vmulps xmm0, xmm0, xmmword ptr [r13 + 0x160]
0x10027e019: vmulps xmm1, xmm1, xmmword ptr [rsp + 0xe0]
0x10027e022: vaddps xmm0, xmm1, xmm0
0x10027e026: vmovaps xmmword ptr [r13 + 0x160], xmm0
0x10027e02f: test rax, rax
0x10027e032: je 0x10027e03e
0x10027e034: cmp byte ptr [rsp + 0x28], 0
0x10027e039: setne al
0x10027e03c: jmp 0x10027e05e ; 0x10027e05e
0x10027e03e: cmp byte ptr [rsp + 0x5c], 0
0x10027e043: je 0x10027e05c
0x10027e045: cmp qword ptr [rbp + 0x40], 0
0x10027e04a: setne cl
0x10027e04d: cmp dword ptr [r13 + 0x188], 0
0x10027e055: setne al
0x10027e058: or al, cl
0x10027e05a: jmp 0x10027e05e ; 0x10027e05e
0x10027e05c: xor eax, eax
0x10027e05e: mov rdi, qword ptr [r13 + 0x28]
0x10027e062: vxorps xmm1, xmm1, xmm1
0x10027e066: vmovaps xmmword ptr [rsp + 0x260], xmm1
0x10027e06f: mov qword ptr [rsp + 0x270], 0
0x10027e07b: mov byte ptr [rsp + 0x260], 0x18
0x10027e083: movabs rcx, 0x4373746f70735f75
0x10027e08d: mov qword ptr [rsp + 0x261], rcx
0x10027e095: mov dword ptr [rsp + 0x269], 0x726f6c6f
0x10027e0a0: mov byte ptr [rsp + 0x26d], 0
0x10027e0a8: test al, al
0x10027e0aa: jne 0x10027e0b0
0x10027e0ac: vxorps xmm0, xmm0, xmm0
0x10027e0b0: vmovaps xmmword ptr [rsp + 0x180], xmm0
0x10027e0b9: lea rdx, [rsp + 0x260]
0x10027e0c1: lea rcx, [rsp + 0x180]
0x10027e0c9: xor esi, esi
0x10027e0cb: vxorps xmm0, xmm0, xmm0
0x10027e0cf: call 0x1003fff20 ; 0x1003fff20
0x10027e0d4: test byte ptr [rsp + 0x260], 1
0x10027e0dc: je 0x10027e0f6
0x10027e0de: mov rbx, qword ptr [rsp + 0x270]
0x10027e0e6: call 0x1007e50d0 ; 0x1007e50d0
0x10027e0eb: mov rdi, rax
0x10027e0ee: mov rsi, rbx
0x10027e0f1: call 0x1007e5db0 ; 0x1007e5db0
0x10027e0f6: vinsertps xmm0, xmm0, dword ptr [r13 + 0x34], 0x1d
0x10027e0fd: vxorps xmm1, xmm1, xmm1
0x10027e101: mov rdi, qword ptr [r13 + 0x28]
0x10027e105: vmovaps xmmword ptr [rsp + 0x260], xmm1
0x10027e10e: mov qword ptr [rsp + 0x270], 0
0x10027e11a: mov byte ptr [rsp + 0x260], 0x14
0x10027e122: movabs rax, 0x7366664f76755f75
0x10027e12c: mov qword ptr [rsp + 0x261], rax
0x10027e134: mov word ptr [rsp + 0x269], 0x7465
0x10027e13e: mov byte ptr [rsp + 0x26b], 0
0x10027e146: vmovaps xmmword ptr [rsp + 0x170], xmm0
0x10027e14f: lea rdx, [rsp + 0x260]
0x10027e157: lea rcx, [rsp + 0x170]
0x10027e15f: xor esi, esi
0x10027e161: vxorps xmm0, xmm0, xmm0
0x10027e165: call 0x1003fff20 ; 0x1003fff20
0x10027e16a: test byte ptr [rsp + 0x260], 1
0x10027e172: je 0x10027e18c
0x10027e174: mov rbx, qword ptr [rsp + 0x270]
0x10027e17c: call 0x1007e50d0 ; 0x1007e50d0
0x10027e181: mov rdi, rax
0x10027e184: mov rsi, rbx
0x10027e187: call 0x1007e5db0 ; 0x1007e5db0
0x10027e18c: vmovss xmm1, dword ptr [rsp + 0x30]
0x10027e192: vmovss xmm0, dword ptr [rip + 0x82f7a6] ; 0x100aad940
0x10027e19a: vucomiss xmm0, xmm1
0x10027e19e: vmovss xmm2, dword ptr [rip + 0x826f1a] ; 0x100aa50c0
0x10027e1a6: jbe 0x10027e208
0x10027e1a8: vaddss xmm0, xmm1, dword ptr [rip + 0x836f18] ; 0x100ab50c8
0x10027e1b0: vdivss xmm0, xmm0, dword ptr [rip + 0x836f14] ; 0x100ab50cc
0x10027e1b8: vxorps xmm1, xmm1, xmm1
0x10027e1bc: vmaxss xmm0, xmm1, xmm0
0x10027e1c0: vminss xmm1, xmm2, xmm0
0x10027e1c4: lea rsi, [rip + 0x1d86125] ; 0x1020042f0
0x10027e1cb: cmp byte ptr [rsp + 0x70], 0
0x10027e1d0: cmovne rsi, qword ptr [rip + 0x98c2e8] ; 0x100c0a4c0
0x10027e1d8: vpermilpd xmm0, xmmword ptr [rsp + 0xa0], 1
0x10027e1e3: vmulss xmm0, xmm0, dword ptr [rip + 0x82a409] ; 0x100aa85f4
0x10027e1eb: vaddss xmm1, xmm1, xmm1
0x10027e1ef: lea rdx, [rsp + 0x90]
0x10027e1f7: vxorps xmm2, xmm2, xmm2
0x10027e1fb: mov rdi, qword ptr [rsp + 0x148]
0x10027e203: call 0x100416140 ; 0x100416140
0x10027e208: mov rcx, qword ptr [rsp + 0x40]
0x10027e20d: mov eax, dword ptr [r14]
0x10027e210: mov dword ptr [rcx], eax
0x10027e212: cmp byte ptr [rip + 0x1b69e1f], 0 ; 0x101de8038
0x10027e219: je 0x10027e2cb
0x10027e21f: call 0x1002acd30 ; 0x1002acd30
0x10027e224: vmovss xmm0, dword ptr [rip + 0x830654] ; 0x100aae880
0x10027e22c: test rax, rax
0x10027e22f: je 0x10027e2cb
0x10027e235: vucomiss xmm0, dword ptr [rsp + 0x24]
0x10027e23b: mov r14d, dword ptr [r13 + 0x20]
0x10027e23f: vmovss xmm0, dword ptr [r13 + 0xd0]
0x10027e248: vcvtss2sd xmm0, xmm0, xmm0
0x10027e24c: vmovsd qword ptr [rsp + 0x40], xmm0
0x10027e252: lea r12, [rip + 0x8e0786] ; 0x100b5e9df true
0x10027e259: lea rbx, [rip + 0x924dcc] ; 0x100ba302c false
0x10027e260: mov r15, rbx
0x10027e263: cmovae r15, r12
0x10027e267: mov rdi, qword ptr [r13 + 0x28]
0x10027e26b: mov rax, qword ptr [rdi]
0x10027e26e: call qword ptr [rax + 0x10]
0x10027e271: test al, al
0x10027e273: cmovne rbx, r12
0x10027e277: lea rdx, [rip + 0x8feec7] ; 0x100b7d145
0x10027e27e: lea r12, [rsp + 0x260]
0x10027e286: mov esi, 0x400
0x10027e28b: mov al, 1
0x10027e28d: mov r8, r15
0x10027e290: mov rdi, r12
0x10027e293: mov ecx, r14d
0x10027e296: vmovsd xmm0, qword ptr [rsp + 0x40]
0x10027e29c: mov r9, rbx
0x10027e29f: call 0x100aa2bd6 ; 0x100aa2bd6 _snprintf
0x10027e2a4: call 0x1002acd30 ; 0x1002acd30
0x10027e2a9: lea rcx, [rip + 0x1dc1400] ; 0x10203f6b0
0x10027e2b0: lea rdx, [rsp + 0x90]
0x10027e2b8: vmovss xmm0, dword ptr [rip + 0x8287e4] ; 0x100aa6aa4
0x10027e2c0: mov rdi, rax
0x10027e2c3: mov rsi, r12
0x10027e2c6: call 0x1002b2410 ; 0x1002b2410
0x10027e2cb: mov rax, qword ptr [rip + 0x98f606] ; 0x100c0d8d8
0x10027e2d2: mov rax, qword ptr [rax]
0x10027e2d5: cmp rax, qword ptr [rsp + 0x8a0]
0x10027e2dd: jne 0x10027e319
0x10027e2df: lea rsp, [rbp - 0x28]
0x10027e2e3: pop rbx
0x10027e2e4: pop r12
0x10027e2e6: pop r13
0x10027e2e8: pop r14
0x10027e2ea: pop r15
0x10027e2ec: pop rbp
0x10027e2ed: ret 
0x10027e2ee: lea rax, [rcx + 8]
0x10027e2f2: mov byte ptr [r15 + 0x188], 1
0x10027e2fa: mov byte ptr [r15 + 0xae], 1
0x10027e302: mov qword ptr [r15 + 0x78], rax
0x10027e306: cmp qword ptr [r13 + 0x170], 0
0x10027e30e: jne 0x10027c18d
0x10027e314: jmp 0x10027bf72 ; 0x10027bf72
0x10027e319: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10027e31e: mov rdi, rax
0x10027e321: call 0x100011bf0 ; 0x100011bf0
0x10027e326: mov rbx, rax
0x10027e329: test byte ptr [rsp + 0x260], 1
0x10027e331: je 0x10027e3bd
0x10027e337: mov r14, qword ptr [rsp + 0x270]
0x10027e33f: call 0x1007e50d0 ; 0x1007e50d0
0x10027e344: mov rdi, rax
0x10027e347: mov rsi, r14
0x10027e34a: call 0x1007e5db0 ; 0x1007e5db0
0x10027e34f: jmp 0x10027e3bd ; 0x10027e3bd
0x10027e351: mov rdi, rax
0x10027e354: call 0x100011bf0 ; 0x100011bf0
0x10027e359: mov rdi, rax
0x10027e35c: call 0x100011bf0 ; 0x100011bf0
0x10027e361: mov rbx, rax
0x10027e364: test byte ptr [rsp + 0x260], 1
0x10027e36c: je 0x10027e3bd
0x10027e36e: mov r14, qword ptr [rsp + 0x270]
0x10027e376: call 0x1007e50d0 ; 0x1007e50d0
0x10027e37b: mov rdi, rax
0x10027e37e: mov rsi, r14
0x10027e381: call 0x1007e5db0 ; 0x1007e5db0
0x10027e386: jmp 0x10027e3bd ; 0x10027e3bd
0x10027e388: mov rdi, rax
0x10027e38b: call 0x100011bf0 ; 0x100011bf0
0x10027e390: mov rdi, rax
0x10027e393: call 0x100011bf0 ; 0x100011bf0
0x10027e398: mov rbx, rax
0x10027e39b: test byte ptr [rsp + 0x260], 1
0x10027e3a3: je 0x10027e3bd
0x10027e3a5: mov r14, qword ptr [rsp + 0x270]
0x10027e3ad: call 0x1007e50d0 ; 0x1007e50d0
0x10027e3b2: mov rdi, rax
0x10027e3b5: mov rsi, r14
0x10027e3b8: call 0x1007e5db0 ; 0x1007e5db0
0x10027e3bd: mov rdi, rbx
0x10027e3c0: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10027e3c5: mov rdi, rax
0x10027e3c8: call 0x100011bf0 ; 0x100011bf0
0x10027e3cd: nop dword ptr [rax]
