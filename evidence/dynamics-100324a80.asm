0x100324a80: push rbp
0x100324a81: mov rbp, rsp
0x100324a84: push r15
0x100324a86: push r14
0x100324a88: push r13
0x100324a8a: push r12
0x100324a8c: push rbx
0x100324a8d: and rsp, 0xffffffffffffffe0
0x100324a91: sub rsp, 0x420
0x100324a98: mov qword ptr [rsp + 0x90], rsi
0x100324aa0: mov r13, rdi
0x100324aa3: mov rax, qword ptr [rip + 0x8e8e2e] ; 0x100c0d8d8
0x100324aaa: mov rax, qword ptr [rax]
0x100324aad: mov qword ptr [rsp + 0x400], rax
0x100324ab5: mov rax, qword ptr [rsi + 0x160]
0x100324abc: lea rcx, [rip + 0x1cd660d] ; 0x101ffb0d0
0x100324ac3: cmp byte ptr [rcx], 0
0x100324ac6: je 0x100324ad5
0x100324ac8: lea rcx, [rip + 0x993a71] ; 0x100cb8540
0x100324acf: vmovss xmm0, dword ptr [rcx]
0x100324ad3: jmp 0x100324add ; 0x100324add
0x100324ad5: vmovss xmm0, dword ptr [rip + 0x7805e3] ; 0x100aa50c0
0x100324add: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x100324ae2: vmulss xmm0, xmm0, dword ptr [rax + 0x14]
0x100324ae7: vmovss xmm1, dword ptr [rip + 0x781fad] ; 0x100aa6a9c
0x100324aef: vmaxss xmm0, xmm1, xmm0
0x100324af3: vmovss xmm1, dword ptr [rip + 0x781fa5] ; 0x100aa6aa0
0x100324afb: vminss xmm0, xmm1, xmm0
0x100324aff: vmovss dword ptr [r13 + 0xc], xmm0
0x100324b05: cmp dword ptr [r13 + 0x48c0], 0
0x100324b0d: mov qword ptr [rsp + 0xd0], r13
0x100324b15: je 0x1003257bc
0x100324b1b: lea r14, [r13 + 0x4998]
0x100324b22: mov ebx, 1
0x100324b27: lea r12, [rsp + 0x1c0]
0x100324b2f: jmp 0x100324b55 ; 0x100324b55
0x100324b31: nop word ptr cs:[rax + rax]
0x100324b40: vmovss xmm0, dword ptr [r13 + 0xc]
0x100324b46: add r14, 0xd0
0x100324b4d: inc ebx
0x100324b4f: vmovaps xmmword ptr [rsp + 0x10], xmm1
0x100324b55: lea r15, [r14 - 0x20]
0x100324b59: lea rax, [r14 - 0x10]
0x100324b5d: mov qword ptr [rsp + 0x20], rax
0x100324b62: cmp byte ptr [r14 - 0x78], 0
0x100324b67: jne 0x100324b71
0x100324b69: vxorps xmm0, xmm0, xmmword ptr [rip + 0x782d8f] ; 0x100aa7900
0x100324b71: vaddss xmm0, xmm0, dword ptr [r14]
0x100324b76: vxorps xmm1, xmm1, xmm1
0x100324b7a: vmaxss xmm0, xmm1, xmm0
0x100324b7e: vmovss xmm1, dword ptr [r14 - 0x70]
0x100324b84: vminss xmm0, xmm1, xmm0
0x100324b88: vmovss dword ptr [r14], xmm0
0x100324b8d: jne 0x100324b9f
0x100324b8f: vucomiss xmm0, dword ptr [rip + 0x78254d] ; 0x100aa70e4
0x100324b97: jne 0x100324b9f
0x100324b99: jnp 0x100324d50
0x100324b9f: cmp byte ptr [r14 - 0x77], 0
0x100324ba4: je 0x100324d50
0x100324baa: mov rdi, r15
0x100324bad: call 0x100316270 ; 0x100316270
0x100324bb2: test rax, rax
0x100324bb5: jne 0x100324c34
0x100324bb7: mov rax, qword ptr [rsp + 0x90]
0x100324bbf: mov rdi, qword ptr [rax + 0x438]
0x100324bc6: vxorps xmm0, xmm0, xmm0
0x100324bca: vmovlps qword ptr [rsp + 0x190], xmm0
0x100324bd3: mov dword ptr [rsp + 0x198], 0
0x100324bde: mov rax, qword ptr [rip + 0x7834bb] ; 0x100aa80a0
0x100324be5: mov qword ptr [rsp + 0x180], rax
0x100324bed: mov dword ptr [rsp + 0x188], 0
0x100324bf8: lea rax, [rip + 0x1acaf59] ; 0x101defb58
0x100324bff: mov rcx, qword ptr [rax]
0x100324c02: xor r8d, r8d
0x100324c05: lea rsi, [rsp + 0x190]
0x100324c0d: lea rdx, [rsp + 0x180]
0x100324c15: call 0x1002de940 ; 0x1002de940
0x100324c1a: mov rdi, r12
0x100324c1d: mov rsi, rax
0x100324c20: call 0x100316250 ; 0x100316250
0x100324c25: vmovups xmm0, xmmword ptr [rsp + 0x1c0]
0x100324c2e: vmovups xmmword ptr [r14 - 0x20], xmm0
0x100324c34: mov rdi, qword ptr [rsp + 0x20]
0x100324c39: call 0x100316270 ; 0x100316270
0x100324c3e: test rax, rax
0x100324c41: jne 0x100324cc0
0x100324c43: mov rax, qword ptr [rsp + 0x90]
0x100324c4b: mov rdi, qword ptr [rax + 0x438]
0x100324c52: vxorps xmm0, xmm0, xmm0
0x100324c56: vmovlps qword ptr [rsp + 0x170], xmm0
0x100324c5f: mov dword ptr [rsp + 0x178], 0
0x100324c6a: mov rax, qword ptr [rip + 0x78342f] ; 0x100aa80a0
0x100324c71: mov qword ptr [rsp + 0x160], rax
0x100324c79: mov dword ptr [rsp + 0x168], 0
0x100324c84: lea rax, [rip + 0x1acaecd] ; 0x101defb58
0x100324c8b: mov rcx, qword ptr [rax]
0x100324c8e: xor r8d, r8d
0x100324c91: lea rsi, [rsp + 0x170]
0x100324c99: lea rdx, [rsp + 0x160]
0x100324ca1: call 0x1002de940 ; 0x1002de940
0x100324ca6: mov rdi, r12
0x100324ca9: mov rsi, rax
0x100324cac: call 0x100316250 ; 0x100316250
0x100324cb1: vmovups xmm0, xmmword ptr [rsp + 0x1c0]
0x100324cba: vmovups xmmword ptr [r14 - 0x10], xmm0
0x100324cc0: movzx eax, byte ptr [r14 - 0x40]
0x100324cc5: mov rcx, rax
0x100324cc8: shr rcx, 1
0x100324ccb: test al, 1
0x100324ccd: cmovne rcx, qword ptr [r14 - 0x38]
0x100324cd2: test rcx, rcx
0x100324cd5: je 0x100325008
0x100324cdb: vmovaps xmm1, xmmword ptr [r14 - 0x88]
0x100324ce4: mov rdi, qword ptr [r14 - 0x50]
0x100324ce8: test rdi, rdi
0x100324ceb: je 0x100324d24
0x100324ced: mov r13, qword ptr [r14 - 0x48]
0x100324cf1: test r13, r13
0x100324cf4: je 0x100324d24
0x100324cf6: mov rax, qword ptr [rdi]
0x100324cf9: vmovaps xmmword ptr [rsp + 0x40], xmm1
0x100324cff: call qword ptr [rax]
0x100324d01: vmovaps xmm1, xmmword ptr [rsp + 0x40]
0x100324d07: cmp r13, rax
0x100324d0a: jne 0x100324d24
0x100324d0c: mov rdi, qword ptr [r14 - 0x50]
0x100324d10: mov rax, qword ptr [rdi]
0x100324d13: call qword ptr [rax + 0x10]
0x100324d16: vmovaps xmm1, xmmword ptr [rsp + 0x40]
0x100324d1c: test al, al
0x100324d1e: jne 0x100324ef3
0x100324d24: mov rax, qword ptr [rsp + 0x90]
0x100324d2c: mov rdi, qword ptr [rax + 0x5c8]
0x100324d33: test byte ptr [r14 - 0x40], 1
0x100324d38: jne 0x100324dfb
0x100324d3e: lea rsi, [r14 - 0x3f]
0x100324d42: jmp 0x100324dff ; 0x100324dff
0x100324d47: nop word ptr [rax + rax]
0x100324d50: mov rdi, r15
0x100324d53: call 0x100316270 ; 0x100316270
0x100324d58: test rax, rax
0x100324d5b: je 0x100324d67
0x100324d5d: mov dword ptr [rax + 0x80], 0
0x100324d67: mov r15d, ebx
0x100324d6a: mov rdi, qword ptr [rsp + 0x20]
0x100324d6f: call 0x100316270 ; 0x100316270
0x100324d74: test rax, rax
0x100324d77: je 0x100324d83
0x100324d79: mov dword ptr [rax + 0x80], 0
0x100324d83: mov rdi, qword ptr [r14 - 0x50]
0x100324d87: test rdi, rdi
0x100324d8a: je 0x100324de0
0x100324d8c: mov rbx, qword ptr [r14 - 0x48]
0x100324d90: test rbx, rbx
0x100324d93: je 0x100324de0
0x100324d95: mov rax, qword ptr [rdi]
0x100324d98: call qword ptr [rax]
0x100324d9a: cmp rbx, rax
0x100324d9d: jne 0x100324de0
0x100324d9f: mov rdi, qword ptr [r14 - 0x50]
0x100324da3: mov rax, qword ptr [rdi]
0x100324da6: call qword ptr [rax + 0x10]
0x100324da9: test al, al
0x100324dab: mov ebx, r15d
0x100324dae: je 0x100325540
0x100324db4: mov rdi, qword ptr [r14 - 0x50]
0x100324db8: test rdi, rdi
0x100324dbb: je 0x100325540
0x100324dc1: mov rbx, qword ptr [r14 - 0x48]
0x100324dc5: test rbx, rbx
0x100324dc8: je 0x100324de0
0x100324dca: mov rax, qword ptr [rdi]
0x100324dcd: call qword ptr [rax]
0x100324dcf: cmp rbx, rax
0x100324dd2: jne 0x100324de0
0x100324dd4: mov rdi, qword ptr [r14 - 0x50]
0x100324dd8: mov rax, qword ptr [rdi]
0x100324ddb: xor esi, esi
0x100324ddd: call qword ptr [rax + 0x30]
0x100324de0: vmovaps xmm1, xmmword ptr [rsp + 0x10]
0x100324de6: mov ebx, r15d
0x100324de9: cmp dword ptr [r13 + 0x48c0], ebx
0x100324df0: ja 0x100324b40
0x100324df6: jmp 0x1003257bc ; 0x1003257bc
0x100324dfb: mov rsi, qword ptr [r14 - 0x30]
0x100324dff: vxorps ymm0, ymm0, ymm0
0x100324e03: vmovaps ymmword ptr [rsp + 0x3e0], ymm0
0x100324e0c: vmovaps ymmword ptr [rsp + 0x3c0], ymm0
0x100324e15: vmovaps ymmword ptr [rsp + 0x3a0], ymm0
0x100324e1e: vmovaps ymmword ptr [rsp + 0x380], ymm0
0x100324e27: mov rax, qword ptr [r14 - 0x28]
0x100324e2b: mov byte ptr [rsp + 0x38d], 1
0x100324e33: mov dword ptr [rsp + 0x380], 0x3f800000
0x100324e3e: vmovaps xmmword ptr [rsp + 0x390], xmm1
0x100324e47: mov qword ptr [rsp + 0x3c8], rax
0x100324e4f: mov dword ptr [rsp + 0x3f0], 0xc31
0x100324e5a: vmovups ymmword ptr [rsp + 0x350], ymm0
0x100324e63: vmovaps ymmword ptr [rsp + 0x340], ymm0
0x100324e6c: vmovaps ymmword ptr [rsp + 0x320], ymm0
0x100324e75: vmovaps ymmword ptr [rsp + 0x300], ymm0
0x100324e7e: vmovaps ymmword ptr [rsp + 0x2e0], ymm0
0x100324e87: vmovaps ymmword ptr [rsp + 0x2c0], ymm0
0x100324e90: vmovaps ymmword ptr [rsp + 0x2a0], ymm0
0x100324e99: vmovaps ymmword ptr [rsp + 0x280], ymm0
0x100324ea2: vmovaps ymmword ptr [rsp + 0x260], ymm0
0x100324eab: vmovaps ymmword ptr [rsp + 0x240], ymm0
0x100324eb4: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x100324ebd: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x100324ec6: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x100324ecf: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x100324ed8: lea rdx, [rsp + 0x380]
0x100324ee0: mov rcx, r12
0x100324ee3: vzeroupper 
0x100324ee6: call 0x1006018a0 ; 0x1006018a0
0x100324eeb: mov qword ptr [r14 - 0x50], rax
0x100324eef: mov qword ptr [r14 - 0x48], rdx
0x100324ef3: mov dword ptr [rsp + 0x40], ebx
0x100324ef7: vxorps ymm0, ymm0, ymm0
0x100324efb: vmovups ymmword ptr [rsp + 0x350], ymm0
0x100324f04: vmovaps ymmword ptr [rsp + 0x340], ymm0
0x100324f0d: vmovaps ymmword ptr [rsp + 0x320], ymm0
0x100324f16: vmovaps ymmword ptr [rsp + 0x300], ymm0
0x100324f1f: vmovaps ymmword ptr [rsp + 0x2e0], ymm0
0x100324f28: vmovaps ymmword ptr [rsp + 0x2c0], ymm0
0x100324f31: vmovaps ymmword ptr [rsp + 0x2a0], ymm0
0x100324f3a: vmovaps ymmword ptr [rsp + 0x280], ymm0
0x100324f43: vmovaps ymmword ptr [rsp + 0x260], ymm0
0x100324f4c: vmovaps ymmword ptr [rsp + 0x240], ymm0
0x100324f55: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x100324f5e: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x100324f67: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x100324f70: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x100324f79: vmovss xmm1, dword ptr [r14 - 0x70]
0x100324f7f: vmovss xmm0, dword ptr [r14 - 0x6c]
0x100324f85: vucomiss xmm1, dword ptr [rip + 0x782157] ; 0x100aa70e4
0x100324f8d: vmovss xmm2, dword ptr [rip + 0x78012b] ; 0x100aa50c0
0x100324f95: jne 0x100324f99
0x100324f97: jnp 0x100324fa2
0x100324f99: vmovss xmm2, dword ptr [r14]
0x100324f9e: vdivss xmm2, xmm2, xmm1
0x100324fa2: vmulss xmm0, xmm0, xmm2
0x100324fa6: mov byte ptr [rsp + 0x1c0], 0x43
0x100324fae: vmovss dword ptr [rsp + 0x1e0], xmm0
0x100324fb7: mov dword ptr [rsp + 0x360], 1
0x100324fc2: mov dword ptr [rsp + 0x36c], 1
0x100324fcd: mov rdi, qword ptr [r14 - 0x50]
0x100324fd1: test rdi, rdi
0x100324fd4: mov r13, qword ptr [rsp + 0xd0]
0x100324fdc: je 0x100325004
0x100324fde: mov rbx, qword ptr [r14 - 0x48]
0x100324fe2: test rbx, rbx
0x100324fe5: je 0x100325004
0x100324fe7: mov rax, qword ptr [rdi]
0x100324fea: vzeroupper 
0x100324fed: call qword ptr [rax]
0x100324fef: cmp rbx, rax
0x100324ff2: jne 0x100325004
0x100324ff4: mov rdi, qword ptr [r14 - 0x50]
0x100324ff8: mov rax, qword ptr [rdi]
0x100324ffb: mov rsi, r12
0x100324ffe: call qword ptr [rax + 0x88]
0x100325004: mov ebx, dword ptr [rsp + 0x40]
0x100325008: mov rsi, qword ptr [r14 - 0x58]
0x10032500c: test rsi, rsi
0x10032500f: je 0x1003250d7
0x100325015: vxorps xmm0, xmm0, xmm0
0x100325019: mov rdi, r12
0x10032501c: vzeroupper 
0x10032501f: call 0x100560b40 ; 0x100560b40
0x100325024: vmovaps xmm0, xmmword ptr [rsp + 0x1e0]
0x10032502d: vmovaps xmm1, xmmword ptr [rsp + 0x1f0]
0x100325036: vmovaps xmmword ptr [rsp + 0x70], xmm1
0x10032503c: vxorps xmm2, xmm0, xmmword ptr [rip + 0x7828bc] ; 0x100aa7900
0x100325044: vmulps xmm0, xmm0, xmm0
0x100325048: vmovshdup xmm1, xmm0
0x10032504c: vaddss xmm1, xmm0, xmm1
0x100325050: vpermilpd xmm0, xmm0, 1
0x100325056: vaddss xmm0, xmm0, xmm1
0x10032505a: vsqrtss xmm0, xmm0, xmm0
0x10032505e: vucomiss xmm0, dword ptr [rip + 0x78285e] ; 0x100aa78c4
0x100325066: jbe 0x100325072
0x100325068: vpermilps xmm0, xmm0, 0xc0
0x10032506e: vdivps xmm2, xmm2, xmm0
0x100325072: vmovaps xmmword ptr [rsp + 0x40], xmm2
0x100325078: mov rax, qword ptr [r14 - 0x58]
0x10032507c: vmovss xmm0, dword ptr [rax + 0x18]
0x100325081: vmovaps xmm1, xmmword ptr [rsp + 0x1c0]
0x10032508a: vmovaps xmm2, xmmword ptr [rsp + 0x1d0]
0x100325093: vmulps xmm1, xmm1, xmm1
0x100325097: vmovshdup xmm3, xmm1
0x10032509b: vaddss xmm3, xmm1, xmm3
0x10032509f: vpermilpd xmm1, xmm1, 1
0x1003250a5: vaddss xmm1, xmm1, xmm3
0x1003250a9: vmulps xmm2, xmm2, xmm2
0x1003250ad: vmovshdup xmm3, xmm2
0x1003250b1: vaddss xmm3, xmm2, xmm3
0x1003250b5: vpermilpd xmm2, xmm2, 1
0x1003250bb: vaddss xmm2, xmm2, xmm3
0x1003250bf: vmaxss xmm3, xmm2, xmm1
0x1003250c3: vcmpunordss xmm1, xmm1, xmm1
0x1003250c8: vblendvps xmm1, xmm3, xmm2, xmm1
0x1003250ce: vsqrtss xmm3, xmm1, xmm1
0x1003250d2: jmp 0x100325190 ; 0x100325190
0x1003250d7: vmovaps xmm2, xmmword ptr [r14 - 0xb8]
0x1003250e0: vmovaps xmm1, xmmword ptr [r14 - 0xa8]
0x1003250e9: vmovaps xmm0, xmmword ptr [r14 - 0x88]
0x1003250f2: vmovaps xmm3, xmmword ptr [rip + 0x782576] ; 0x100aa7670
0x1003250fa: vmulps xmm3, xmm3, xmmword ptr [r14 - 0x98]
0x100325103: vaddps xmm4, xmm0, xmm3
0x100325107: vsubps xmm0, xmm0, xmm3
0x10032510b: vmovaps xmmword ptr [rsp + 0x70], xmm4
0x100325111: vsubps xmm4, xmm0, xmm4
0x100325115: vmulps xmm0, xmm4, xmm4
0x100325119: vmovshdup xmm3, xmm0
0x10032511d: vaddss xmm3, xmm0, xmm3
0x100325121: vpermilpd xmm0, xmm0, 1
0x100325127: vaddss xmm0, xmm0, xmm3
0x10032512b: vsqrtss xmm0, xmm0, xmm0
0x10032512f: vucomiss xmm0, dword ptr [rip + 0x781fad] ; 0x100aa70e4
0x100325137: jbe 0x100325143
0x100325139: vpermilps xmm3, xmm0, 0xc0
0x10032513f: vdivps xmm4, xmm4, xmm3
0x100325143: vmovaps xmmword ptr [rsp + 0x40], xmm4
0x100325149: vmulps xmm2, xmm2, xmm2
0x10032514d: vmovshdup xmm3, xmm2
0x100325151: vaddss xmm3, xmm2, xmm3
0x100325155: vpermilpd xmm2, xmm2, 1
0x10032515b: vaddss xmm2, xmm2, xmm3
0x10032515f: vmulps xmm1, xmm1, xmm1
0x100325163: vmovshdup xmm3, xmm1
0x100325167: vaddss xmm3, xmm1, xmm3
0x10032516b: vpermilpd xmm1, xmm1, 1
0x100325171: vaddss xmm1, xmm1, xmm3
0x100325175: vminss xmm3, xmm1, xmm2
0x100325179: vcmpunordss xmm2, xmm2, xmm2
0x10032517e: vblendvps xmm1, xmm3, xmm1, xmm2
0x100325184: vsqrtss xmm1, xmm1, xmm1
0x100325188: vmulss xmm3, xmm1, dword ptr [rip + 0x77f428] ; 0x100aa45b8
0x100325190: vmovss xmm1, dword ptr [rip + 0x785310] ; 0x100aaa4a8
0x100325198: vmulss xmm1, xmm1, dword ptr [r14 - 0x6c]
0x10032519e: vmovss dword ptr [rsp + 0xe0], xmm1
0x1003251a7: vmulss xmm1, xmm1, dword ptr [rip + 0x7834bd] ; 0x100aa866c
0x1003251af: vmovaps xmmword ptr [rsp + 0xc0], xmm1
0x1003251b8: vdivss xmm1, xmm1, dword ptr [rip + 0x78f748] ; 0x100ab4908
0x1003251c0: vdivss xmm2, xmm0, xmm1
0x1003251c4: vmulss xmm1, xmm3, dword ptr [rip + 0x783434] ; 0x100aa8600
0x1003251cc: vmovss dword ptr [rsp + 0x80], xmm3
0x1003251d5: vmulss xmm1, xmm3, xmm1
0x1003251d9: vmulss xmm0, xmm0, xmm1
0x1003251dd: vmulss xmm0, xmm0, dword ptr [rip + 0x796f97] ; 0x100abc17c
0x1003251e5: vmovss dword ptr [rsp + 0x50], xmm2
0x1003251eb: vmulss xmm1, xmm2, dword ptr [rip + 0x796f8d] ; 0x100abc180
0x1003251f3: vdivss xmm0, xmm0, xmm1
0x1003251f7: vmovss dword ptr [rsp + 0x60], xmm0
0x1003251fd: mov rdi, r15
0x100325200: vzeroupper 
0x100325203: call 0x100316270 ; 0x100316270
0x100325208: test rax, rax
0x10032520b: je 0x100325248
0x10032520d: vmovss xmm0, dword ptr [rsp + 0x80]
0x100325216: vmovss dword ptr [rax + 0x9c], xmm0
0x10032521e: movsx ecx, byte ptr [r14 - 0x78]
0x100325223: vcvtsi2ss xmm0, xmm5, ecx
0x100325227: cmp qword ptr [r14 - 0x58], 0
0x10032522c: vmovss xmm1, dword ptr [rip + 0x77fe8c] ; 0x100aa50c0
0x100325234: je 0x10032523c
0x100325236: vmovss xmm1, dword ptr [rsp + 0x60]
0x10032523c: vmulss xmm0, xmm1, xmm0
0x100325240: vmovss dword ptr [rax + 0x80], xmm0
0x100325248: mov rdi, qword ptr [rsp + 0x20]
0x10032524d: call 0x100316270 ; 0x100316270
0x100325252: test rax, rax
0x100325255: vmovaps xmm2, xmmword ptr [rsp + 0x40]
0x10032525b: je 0x100325298
0x10032525d: vmovss xmm0, dword ptr [rsp + 0x80]
0x100325266: vaddss xmm0, xmm0, xmm0
0x10032526a: vmovss dword ptr [rax + 0x9c], xmm0
0x100325272: movsx ecx, byte ptr [r14 - 0x78]
0x100325277: vcvtsi2ss xmm0, xmm5, ecx
0x10032527b: cmp qword ptr [r14 - 0x58], 0
0x100325280: vxorps xmm1, xmm1, xmm1
0x100325284: je 0x10032528c
0x100325286: vmovss xmm1, dword ptr [rsp + 0x60]
0x10032528c: vmulss xmm0, xmm1, xmm0
0x100325290: vmovss dword ptr [rax + 0x80], xmm0
0x100325298: vmulps xmm0, xmm2, xmm2
0x10032529c: vmovshdup xmm1, xmm0
0x1003252a0: vaddss xmm1, xmm0, xmm1
0x1003252a4: vpermilpd xmm0, xmm0, 1
0x1003252aa: vaddss xmm0, xmm0, xmm1
0x1003252ae: vmovss dword ptr [rsp + 0x60], xmm0
0x1003252b4: vmovss xmm0, dword ptr [rsp + 0x50]
0x1003252ba: vdivss xmm0, xmm0, dword ptr [rip + 0x7817e6] ; 0x100aa6aa8
0x1003252c2: vmovss dword ptr [rsp + 0x50], xmm0
0x1003252c8: vpermilps xmm0, xmmword ptr [rsp + 0xc0], 0xc0
0x1003252d3: vmulps xmm0, xmm2, xmm0
0x1003252d7: vmovaps xmmword ptr [rsp + 0x80], xmm0
0x1003252e0: mov rdi, r15
0x1003252e3: vmovaps xmmword ptr [rsp + 0x40], xmm2
0x1003252e9: call 0x100316270 ; 0x100316270
0x1003252ee: test rax, rax
0x1003252f1: je 0x100325503
0x1003252f7: vmovaps xmm0, xmmword ptr [rsp + 0x70]
0x1003252fd: vmovaps xmmword ptr [rax + 0x20], xmm0
0x100325302: vmovss xmm0, dword ptr [rsp + 0x60]
0x100325308: vsqrtss xmm1, xmm0, xmm0
0x10032530c: vucomiss xmm1, dword ptr [rip + 0x7825b0] ; 0x100aa78c4
0x100325314: vmovaps xmm2, xmmword ptr [rsp + 0x40]
0x10032531a: vmovaps xmm0, xmm2
0x10032531e: jbe 0x10032532a
0x100325320: vpermilps xmm0, xmm1, 0xc0
0x100325326: vdivps xmm0, xmm2, xmm0
0x10032532a: vmovaps xmm1, xmmword ptr [rip + 0x78635e] ; 0x100aab690
0x100325332: vmovaps xmm2, xmmword ptr [rsp + 0x30]
0x100325338: vinsertps xmm2, xmm1, xmm2, 0xf3
0x10032533e: vmovaps xmmword ptr [rsp + 0x30], xmm2
0x100325344: vxorps xmm1, xmm0, xmmword ptr [rip + 0x7825b4] ; 0x100aa7900
0x10032534c: vmulps xmm2, xmm0, xmm0
0x100325350: vmovshdup xmm3, xmm2
0x100325354: vaddss xmm3, xmm2, xmm3
0x100325358: vpermilpd xmm2, xmm2, 1
0x10032535e: vaddss xmm2, xmm2, xmm3
0x100325362: vsqrtss xmm2, xmm2, xmm2
0x100325366: vucomiss xmm2, dword ptr [rip + 0x782556] ; 0x100aa78c4
0x10032536e: jbe 0x10032537a
0x100325370: vpermilps xmm2, xmm2, 0xc0
0x100325376: vdivps xmm1, xmm1, xmm2
0x10032537a: vmovaps xmm3, xmmword ptr [rsp + 0x30]
0x100325380: vmulps xmm1, xmm3, xmm1
0x100325384: vmovshdup xmm2, xmm1
0x100325388: vaddss xmm2, xmm1, xmm2
0x10032538c: vpermilpd xmm1, xmm1, 1
0x100325392: vaddss xmm1, xmm1, xmm2
0x100325396: vmulps xmm2, xmm3, xmm3
0x10032539a: vmovshdup xmm3, xmm2
0x10032539e: vaddss xmm3, xmm2, xmm3
0x1003253a2: vpermilpd xmm2, xmm2, 1
0x1003253a8: vaddss xmm2, xmm2, xmm3
0x1003253ac: vsubss xmm1, xmm1, xmm2
0x1003253b0: vandps xmm1, xmm1, xmmword ptr [rip + 0x782558] ; 0x100aa7910
0x1003253b8: vmovss xmm2, dword ptr [rip + 0x782504] ; 0x100aa78c4
0x1003253c0: vucomiss xmm2, xmm1
0x1003253c4: vmovaps xmm1, xmmword ptr [rip + 0x7862d4] ; 0x100aab6a0
0x1003253cc: jae 0x10032543a
0x1003253ce: vmulps xmm1, xmm0, xmmword ptr [rsp + 0x30]
0x1003253d4: vmovshdup xmm2, xmm1
0x1003253d8: vaddss xmm2, xmm1, xmm2
0x1003253dc: vpermilpd xmm1, xmm1, 1
0x1003253e2: vaddss xmm1, xmm1, xmm2
0x1003253e6: vmovss xmm2, dword ptr [rip + 0x77fcd2] ; 0x100aa50c0
0x1003253ee: vaddss xmm1, xmm1, xmm2
0x1003253f2: vaddss xmm1, xmm1, xmm1
0x1003253f6: vsqrtss xmm1, xmm1, xmm1
0x1003253fa: vdivss xmm2, xmm2, xmm1
0x1003253fe: vmovss xmm3, dword ptr [rip + 0x77fcbe] ; 0x100aa50c4
0x100325406: vmulps xmm3, xmm0, xmm3
0x10032540a: vpermilps xmm0, xmm0, 0xd2
0x100325410: vmulps xmm0, xmm0, xmmword ptr [rip + 0x786278] ; 0x100aab690
0x100325418: vsubps xmm0, xmm3, xmm0
0x10032541c: vpermilps xmm0, xmm0, 0xd2
0x100325422: vpermilps xmm2, xmm2, 0xc0
0x100325428: vmulps xmm0, xmm0, xmm2
0x10032542c: vmulss xmm1, xmm1, dword ptr [rip + 0x77f184] ; 0x100aa45b8
0x100325434: vinsertps xmm1, xmm0, xmm1, 0x30
0x10032543a: vmovaps xmmword ptr [rax + 0x30], xmm1
0x10032543f: vpermilps xmm0, xmm1, 0xe7
0x100325445: vucomiss xmm0, xmm0
0x100325449: jp 0x10032767c
0x10032544f: vmovshdup xmm0, xmm1
0x100325453: vucomiss xmm1, xmm0
0x100325457: jp 0x10032767c
0x10032545d: vpermilpd xmm0, xmm1, 1
0x100325463: vucomiss xmm0, xmm0
0x100325467: jp 0x10032767c
0x10032546d: vmovss xmm0, dword ptr [rsp + 0x50]
0x100325473: vmovss dword ptr [rax + 0x90], xmm0
0x10032547b: mov dword ptr [rax + 0x174], 0x41200000
0x100325485: cmp qword ptr [r14 - 0x58], 0
0x10032548a: vmovaps xmm0, xmmword ptr [rsp + 0x80]
0x100325493: je 0x1003254a5
0x100325495: vmovaps xmm0, xmmword ptr [rsp + 0x10]
0x10032549b: vblendps xmm0, xmm0, xmmword ptr [rip + 0x77f0fb], 7 ; 0x100aa45a0
0x1003254a5: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x1003254ab: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1003254b3: mov rcx, qword ptr [r14 - 0x58]
0x1003254b7: vmovss xmm0, dword ptr [rip + 0x77fc01] ; 0x100aa50c0
0x1003254bf: test rcx, rcx
0x1003254c2: jne 0x100325740
0x1003254c8: vmovss dword ptr [rax + 0x88], xmm0
0x1003254d0: vmovss xmm0, dword ptr [rip + 0x782304] ; 0x100aa77dc
0x1003254d8: jne 0x10032575f
0x1003254de: vmovss dword ptr [rax + 0x178], xmm0
0x1003254e6: vmovss xmm0, dword ptr [rip + 0x77fbd2] ; 0x100aa50c0
0x1003254ee: je 0x1003254f4
0x1003254f0: vxorps xmm0, xmm0, xmm0
0x1003254f4: vmovss dword ptr [rax + 0x17c], xmm0
0x1003254fc: mov qword ptr [rax + 0x190], rcx
0x100325503: mov rdi, qword ptr [rsp + 0x20]
0x100325508: call 0x100316270 ; 0x100316270
0x10032550d: test rax, rax
0x100325510: je 0x100325540
0x100325512: vmovaps xmm0, xmmword ptr [rsp + 0x70]
0x100325518: vmovaps xmmword ptr [rax + 0x20], xmm0
0x10032551d: vsqrtss xmm0, xmm5, dword ptr [rsp + 0x60]
0x100325523: vucomiss xmm0, dword ptr [rip + 0x782399] ; 0x100aa78c4
0x10032552b: jbe 0x100325558
0x10032552d: vpermilps xmm0, xmm0, 0xc0
0x100325533: vmovaps xmm3, xmmword ptr [rsp + 0x40]
0x100325539: vdivps xmm3, xmm3, xmm0
0x10032553d: jmp 0x10032555e ; 0x10032555e
0x10032553f: nop 
0x100325540: vmovaps xmm1, xmmword ptr [rsp + 0x10]
0x100325546: cmp dword ptr [r13 + 0x48c0], ebx
0x10032554d: ja 0x100324b40
0x100325553: jmp 0x1003257bc ; 0x1003257bc
0x100325558: vmovaps xmm3, xmmword ptr [rsp + 0x40]
0x10032555e: vmovaps xmm0, xmmword ptr [rip + 0x78612a] ; 0x100aab690
0x100325566: vmovaps xmm1, xmmword ptr [rsp + 0x30]
0x10032556c: vinsertps xmm1, xmm0, xmm1, 0xf3
0x100325572: vmovaps xmmword ptr [rsp + 0x30], xmm1
0x100325578: vxorps xmm0, xmm3, xmmword ptr [rip + 0x782380] ; 0x100aa7900
0x100325580: vmulps xmm1, xmm3, xmm3
0x100325584: vmovshdup xmm2, xmm1
0x100325588: vaddss xmm2, xmm1, xmm2
0x10032558c: vpermilpd xmm1, xmm1, 1
0x100325592: vaddss xmm1, xmm1, xmm2
0x100325596: vsqrtss xmm1, xmm1, xmm1
0x10032559a: vucomiss xmm1, dword ptr [rip + 0x782322] ; 0x100aa78c4
0x1003255a2: jbe 0x1003255ae
0x1003255a4: vpermilps xmm1, xmm1, 0xc0
0x1003255aa: vdivps xmm0, xmm0, xmm1
0x1003255ae: vmovaps xmm2, xmmword ptr [rsp + 0x30]
0x1003255b4: vmulps xmm0, xmm2, xmm0
0x1003255b8: vmovshdup xmm1, xmm0
0x1003255bc: vaddss xmm1, xmm0, xmm1
0x1003255c0: vpermilpd xmm0, xmm0, 1
0x1003255c6: vaddss xmm0, xmm0, xmm1
0x1003255ca: vmulps xmm1, xmm2, xmm2
0x1003255ce: vmovshdup xmm2, xmm1
0x1003255d2: vaddss xmm2, xmm1, xmm2
0x1003255d6: vpermilpd xmm1, xmm1, 1
0x1003255dc: vaddss xmm1, xmm1, xmm2
0x1003255e0: vsubss xmm0, xmm0, xmm1
0x1003255e4: vandps xmm0, xmm0, xmmword ptr [rip + 0x782324] ; 0x100aa7910
0x1003255ec: vmovss xmm1, dword ptr [rip + 0x7822d0] ; 0x100aa78c4
0x1003255f4: vucomiss xmm1, xmm0
0x1003255f8: vmovaps xmm0, xmmword ptr [rip + 0x7860a0] ; 0x100aab6a0
0x100325600: jae 0x10032566e
0x100325602: vmulps xmm0, xmm3, xmmword ptr [rsp + 0x30]
0x100325608: vmovshdup xmm1, xmm0
0x10032560c: vaddss xmm1, xmm0, xmm1
0x100325610: vpermilpd xmm0, xmm0, 1
0x100325616: vaddss xmm0, xmm0, xmm1
0x10032561a: vmovss xmm1, dword ptr [rip + 0x77fa9e] ; 0x100aa50c0
0x100325622: vaddss xmm0, xmm0, xmm1
0x100325626: vaddss xmm0, xmm0, xmm0
0x10032562a: vsqrtss xmm0, xmm0, xmm0
0x10032562e: vdivss xmm1, xmm1, xmm0
0x100325632: vmovss xmm2, dword ptr [rip + 0x77fa8a] ; 0x100aa50c4
0x10032563a: vmulps xmm2, xmm3, xmm2
0x10032563e: vpermilps xmm3, xmm3, 0xd2
0x100325644: vmulps xmm3, xmm3, xmmword ptr [rip + 0x786044] ; 0x100aab690
0x10032564c: vsubps xmm2, xmm2, xmm3
0x100325650: vpermilps xmm2, xmm2, 0xd2
0x100325656: vpermilps xmm1, xmm1, 0xc0
0x10032565c: vmulps xmm1, xmm2, xmm1
0x100325660: vmulss xmm0, xmm0, dword ptr [rip + 0x77ef50] ; 0x100aa45b8
0x100325668: vinsertps xmm0, xmm1, xmm0, 0x30
0x10032566e: vmovaps xmmword ptr [rax + 0x30], xmm0
0x100325673: vpermilps xmm1, xmm0, 0xe7
0x100325679: vucomiss xmm1, xmm1
0x10032567d: jp 0x10032767c
0x100325683: vmovshdup xmm1, xmm0
0x100325687: vucomiss xmm0, xmm1
0x10032568b: jp 0x10032767c
0x100325691: vpermilpd xmm0, xmm0, 1
0x100325697: vucomiss xmm0, xmm0
0x10032569b: jp 0x10032767c
0x1003256a1: vmovss xmm0, dword ptr [rsp + 0x50]
0x1003256a7: vmovss dword ptr [rax + 0x90], xmm0
0x1003256af: mov dword ptr [rax + 0x174], 0x41200000
0x1003256b9: cmp qword ptr [r14 - 0x58], 0
0x1003256be: vmovaps xmm1, xmmword ptr [rsp + 0x80]
0x1003256c7: je 0x1003256d9
0x1003256c9: vmovaps xmm0, xmmword ptr [rsp + 0x10]
0x1003256cf: vblendps xmm1, xmm0, xmmword ptr [rip + 0x77eec7], 7 ; 0x100aa45a0
0x1003256d9: vmovaps xmmword ptr [rax + 0xd0], xmm1
0x1003256e1: mov rcx, qword ptr [r14 - 0x58]
0x1003256e5: vmovss xmm0, dword ptr [rip + 0x77f9d3] ; 0x100aa50c0
0x1003256ed: test rcx, rcx
0x1003256f0: jne 0x10032577e
0x1003256f6: vmovss dword ptr [rax + 0x88], xmm0
0x1003256fe: vmovss xmm0, dword ptr [rip + 0x7820d6] ; 0x100aa77dc
0x100325706: jne 0x10032579d
0x10032570c: vmovss dword ptr [rax + 0x178], xmm0
0x100325714: vmovss xmm0, dword ptr [rip + 0x77f9a4] ; 0x100aa50c0
0x10032571c: je 0x100325722
0x10032571e: vxorps xmm0, xmm0, xmm0
0x100325722: vmovss dword ptr [rax + 0x17c], xmm0
0x10032572a: mov qword ptr [rax + 0x190], rcx
0x100325731: cmp dword ptr [r13 + 0x48c0], ebx
0x100325738: ja 0x100324b40
0x10032573e: jmp 0x1003257bc ; 0x1003257bc
0x100325740: vmovss xmm0, dword ptr [rsp + 0xe0]
0x100325749: vmovss dword ptr [rax + 0x88], xmm0
0x100325751: vmovss xmm0, dword ptr [rip + 0x782083] ; 0x100aa77dc
0x100325759: je 0x1003254de
0x10032575f: vxorps xmm0, xmm0, xmm0
0x100325763: vmovss dword ptr [rax + 0x178], xmm0
0x10032576b: vmovss xmm0, dword ptr [rip + 0x77f94d] ; 0x100aa50c0
0x100325773: jne 0x1003254f0
0x100325779: jmp 0x1003254f4 ; 0x1003254f4
0x10032577e: vmovss xmm0, dword ptr [rsp + 0xe0]
0x100325787: vmovss dword ptr [rax + 0x88], xmm0
0x10032578f: vmovss xmm0, dword ptr [rip + 0x782045] ; 0x100aa77dc
0x100325797: je 0x10032570c
0x10032579d: vxorps xmm0, xmm0, xmm0
0x1003257a1: vmovss dword ptr [rax + 0x178], xmm0
0x1003257a9: vmovss xmm0, dword ptr [rip + 0x77f90f] ; 0x100aa50c0
0x1003257b1: jne 0x10032571e
0x1003257b7: jmp 0x100325722 ; 0x100325722
0x1003257bc: mov ebx, 0xc0
0x1003257c1: mov r14, qword ptr [rsp + 0x90]
0x1003257c9: nop dword ptr [rax]
0x1003257d0: cmp byte ptr [r13 + rbx + 0x5c], 0
0x1003257d6: je 0x1003257e8
0x1003257d8: lea rdi, [r13 + rbx]
0x1003257dd: vmovss xmm0, dword ptr [r13 + 0xc]
0x1003257e3: call 0x100328670 ; 0x100328670
0x1003257e8: cmp byte ptr [r13 + rbx + 0x245c], 0
0x1003257f1: je 0x100325806
0x1003257f3: lea rdi, [r13 + rbx + 0x2400]
0x1003257fb: vmovss xmm0, dword ptr [r13 + 0xc]
0x100325801: call 0x100328670 ; 0x100328670
0x100325806: add rbx, 0x120
0x10032580d: cmp rbx, 0x24c0
0x100325814: jne 0x1003257d0
0x100325816: mov rdi, qword ptr [r14 + 0x280]
0x10032581d: call 0x1000ff210 ; 0x1000ff210
0x100325822: mov byte ptr [r13 + 0x64e0], 0
0x10032582a: vxorps ymm0, ymm0, ymm0
0x10032582e: vmovups ymmword ptr [r13 + 0x64f0], ymm0
0x100325837: vxorps xmm0, xmm0, xmm0
0x10032583b: test rax, rax
0x10032583e: je 0x100326660
0x100325844: mov rcx, qword ptr [r14 + 0x280]
0x10032584b: cmp byte ptr [rcx + 0xc], 0
0x10032584f: je 0x100326660
0x100325855: cmp byte ptr [r13 + 0x51], 0
0x10032585a: jne 0x100326660
0x100325860: mov rax, qword ptr [rax + 0x18]
0x100325864: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x100325869: vmovaps xmmword ptr [rsp + 0xf0], xmm0
0x100325872: mov eax, dword ptr [r13 + 0x62d0]
0x100325879: test eax, eax
0x10032587b: je 0x10032657f
0x100325881: vmovss xmm0, dword ptr [rip + 0x77f837] ; 0x100aa50c0
0x100325889: vmovaps xmm1, xmmword ptr [rip + 0x78316f] ; 0x100aa8a00
0x100325891: vmovaps xmmword ptr [rsp + 0x150], xmm1
0x10032589a: xor ecx, ecx
0x10032589c: vmovss xmm1, dword ptr [rip + 0x782014] ; 0x100aa78b8
0x1003258a4: vmovss dword ptr [rsp + 0x98], xmm1
0x1003258ad: vmovaps xmmword ptr [rsp + 0x140], xmm0
0x1003258b6: nop word ptr cs:[rax + rax]
0x1003258c0: mov ecx, ecx
0x1003258c2: mov rdx, rcx
0x1003258c5: shl rdx, 4
0x1003258c9: mov rsi, qword ptr [rsp + 0xd0]
0x1003258d1: cmp byte ptr [rsi + rdx + 0x62dc], 0
0x1003258d9: je 0x1003264b8
0x1003258df: mov qword ptr [rsp + 0x108], rcx
0x1003258e7: mov rcx, qword ptr [rsi + rdx + 0x62e0]
0x1003258ef: cmp dword ptr [rcx + 0x10], 0
0x1003258f3: je 0x1003264b0
0x1003258f9: lea rax, [rsi + rdx + 0x62e0]
0x100325901: mov qword ptr [rsp + 0x138], rax
0x100325909: xor edx, edx
0x10032590b: nop dword ptr [rax + rax]
0x100325910: mov rax, qword ptr [rcx + 8]
0x100325914: mov dword ptr [rsp + 0x9c], edx
0x10032591b: mov ecx, edx
0x10032591d: mov rax, qword ptr [rax + rcx*8]
0x100325921: mov qword ptr [rsp + 0x380], rax
0x100325929: vzeroupper 
0x10032592c: call 0x1007abc10 ; 0x1007abc10
0x100325931: mov r14, rax
0x100325934: mov qword ptr [rsp + 0x1c0], 0
0x100325940: call 0x10055b490 ; 0x10055b490
0x100325945: mov rbx, qword ptr [rax]
0x100325948: mov rdi, rax
0x10032594b: lea rsi, [rsp + 0x1c0]
0x100325953: lea rdx, [rsp + 0x380]
0x10032595b: mov rcx, r14
0x10032595e: call qword ptr [rbx + 0x40]
0x100325961: mov rax, qword ptr [rsp + 0x1c0]
0x100325969: mov qword ptr [rsp + 0xd8], rax
0x100325971: test rax, rax
0x100325974: je 0x10032765d
0x10032597a: cmp byte ptr [rip + 0x1acd9f7], 0 ; 0x101df3378
0x100325981: je 0x1003261f0
0x100325987: vxorps xmm0, xmm0, xmm0
0x10032598b: lea rdi, [rsp + 0x120]
0x100325993: mov rbx, qword ptr [rsp + 0xd8]
0x10032599b: mov rsi, rbx
0x10032599e: call 0x10055e420 ; 0x10055e420
0x1003259a3: vxorps xmm0, xmm0, xmm0
0x1003259a7: lea rdi, [rsp + 0x1c0]
0x1003259af: mov rsi, rbx
0x1003259b2: call 0x100560b40 ; 0x100560b40
0x1003259b7: vmovaps xmm1, xmmword ptr [rsp + 0x1c0]
0x1003259c0: vmovaps xmm0, xmmword ptr [rsp + 0x1e0]
0x1003259c9: vmulps xmm2, xmm0, xmm0
0x1003259cd: vmovshdup xmm3, xmm2
0x1003259d1: vaddss xmm3, xmm2, xmm3
0x1003259d5: vpermilpd xmm2, xmm2, 1
0x1003259db: vaddss xmm2, xmm2, xmm3
0x1003259df: vrsqrtss xmm3, xmm2, xmm2
0x1003259e3: vmulss xmm4, xmm2, dword ptr [rip + 0x77ebcd] ; 0x100aa45b8
0x1003259eb: vcmpeqss xmm2, xmm2, dword ptr [rip + 0x7816f0] ; 0x100aa70e4
0x1003259f4: vandnps xmm4, xmm2, xmm4
0x1003259f8: vmovss xmm5, dword ptr [rip + 0x782c28] ; 0x100aa8628
0x100325a00: vandps xmm2, xmm2, xmm5
0x100325a04: vorps xmm2, xmm4, xmm2
0x100325a08: vmulss xmm2, xmm3, xmm2
0x100325a0c: vmulss xmm2, xmm3, xmm2
0x100325a10: vmovss xmm4, dword ptr [rip + 0x781dd4] ; 0x100aa77ec
0x100325a18: vsubss xmm2, xmm4, xmm2
0x100325a1c: vmulss xmm2, xmm3, xmm2
0x100325a20: vpermilps xmm2, xmm2, 0xc0
0x100325a26: vmulps xmm2, xmm0, xmm2
0x100325a2a: vmovddup xmm3, qword ptr [rip + 0x781ea6] ; 0x100aa78d8
0x100325a32: vmulps xmm2, xmm2, xmm3
0x100325a36: vmovshdup xmm4, xmm2
0x100325a3a: vaddss xmm4, xmm2, xmm4
0x100325a3e: vpermilpd xmm2, xmm2, 1
0x100325a44: vaddss xmm2, xmm2, xmm4
0x100325a48: vucomiss xmm2, dword ptr [rip + 0x782f4c] ; 0x100aa899c
0x100325a50: vmovss xmm2, dword ptr [rip + 0x77f668] ; 0x100aa50c0
0x100325a58: ja 0x100325a5e
0x100325a5a: vmovaps xmm2, xmm3
0x100325a5e: vpermilps xmm3, xmm1, 0xd2
0x100325a64: vmulps xmm3, xmm3, xmm2
0x100325a68: vpermilps xmm4, xmm2, 0xd2
0x100325a6e: vmulps xmm5, xmm1, xmm4
0x100325a72: vsubps xmm5, xmm3, xmm5
0x100325a76: vpermilps xmm3, xmm5, 0xd2
0x100325a7c: vmulps xmm5, xmm5, xmm5
0x100325a80: vpermilpd xmm6, xmm5, 1
0x100325a86: vaddss xmm6, xmm6, xmm5
0x100325a8a: vmovshdup xmm5, xmm5
0x100325a8e: vaddss xmm5, xmm5, xmm6
0x100325a92: vsqrtss xmm5, xmm5, xmm5
0x100325a96: vmovss xmm8, dword ptr [rip + 0x781e26] ; 0x100aa78c4
0x100325a9e: vucomiss xmm5, xmm8
0x100325aa3: jbe 0x100325aaf
0x100325aa5: vpermilps xmm5, xmm5, 0xc0
0x100325aab: vdivps xmm3, xmm3, xmm5
0x100325aaf: vmulps xmm5, xmm1, xmm1
0x100325ab3: vmovshdup xmm6, xmm5
0x100325ab7: vaddss xmm6, xmm5, xmm6
0x100325abb: vpermilpd xmm5, xmm5, 1
0x100325ac1: vaddss xmm5, xmm5, xmm6
0x100325ac5: vsqrtss xmm5, xmm5, xmm5
0x100325ac9: vmulps xmm4, xmm4, xmm3
0x100325acd: vpermilps xmm6, xmm3, 0xd2
0x100325ad3: vmulps xmm6, xmm2, xmm6
0x100325ad7: vsubps xmm6, xmm4, xmm6
0x100325adb: vpermilps xmm4, xmm6, 0xd2
0x100325ae1: vmulps xmm6, xmm6, xmm6
0x100325ae5: vpermilpd xmm7, xmm6, 1
0x100325aeb: vaddss xmm7, xmm7, xmm6
0x100325aef: vmovshdup xmm6, xmm6
0x100325af3: vaddss xmm6, xmm6, xmm7
0x100325af7: vsqrtss xmm6, xmm6, xmm6
0x100325afb: vucomiss xmm6, xmm8
0x100325b00: jbe 0x100325b0c
0x100325b02: vpermilps xmm6, xmm6, 0xc0
0x100325b08: vdivps xmm4, xmm4, xmm6
0x100325b0c: vpermilps xmm5, xmm5, 0xc0
0x100325b12: vmulps xmm4, xmm5, xmm4
0x100325b16: vblendps xmm1, xmm4, xmm1, 8
0x100325b1c: vmovaps xmmword ptr [rsp + 0x1c0], xmm1
0x100325b25: vblendps xmm2, xmm2, xmmword ptr [rsp + 0x1d0], 8
0x100325b30: vmovaps xmmword ptr [rsp + 0x1d0], xmm2
0x100325b39: vblendps xmm0, xmm3, xmm0, 8
0x100325b3f: vmovaps xmmword ptr [rsp + 0x1e0], xmm0
0x100325b48: vmulps xmm0, xmm1, xmm1
0x100325b4c: vmovshdup xmm2, xmm0
0x100325b50: vaddss xmm2, xmm0, xmm2
0x100325b54: vpermilpd xmm0, xmm0, 1
0x100325b5a: vaddss xmm0, xmm0, xmm2
0x100325b5e: vsqrtss xmm0, xmm0, xmm0
0x100325b62: vblendps xmm1, xmm1, xmmword ptr [rip + 0x77ea34], 2 ; 0x100aa45a0
0x100325b6c: vmulps xmm2, xmm1, xmm1
0x100325b70: vmovshdup xmm3, xmm2
0x100325b74: vaddss xmm3, xmm2, xmm3
0x100325b78: vpermilpd xmm2, xmm2, 1
0x100325b7e: vaddss xmm2, xmm2, xmm3
0x100325b82: vsqrtss xmm2, xmm2, xmm2
0x100325b86: vucomiss xmm2, xmm8
0x100325b8b: jbe 0x100325b97
0x100325b8d: vpermilps xmm2, xmm2, 0xc0
0x100325b93: vdivps xmm1, xmm1, xmm2
0x100325b97: vpermilps xmm0, xmm0, 0xc0
0x100325b9d: vmulps xmm0, xmm0, xmm1
0x100325ba1: xor eax, eax
0x100325ba3: nop word ptr cs:[rax + rax]
0x100325bb0: vmovaps xmmword ptr [rsp + 0x80], xmm0
0x100325bb9: mov dword ptr [rsp + 0x40], eax
0x100325bbd: mov eax, eax
0x100325bbf: vcvtsi2ss xmm0, xmm9, rax
0x100325bc4: vdivss xmm0, xmm0, dword ptr [rip + 0x7965b8] ; 0x100abc184
0x100325bcc: vmovss dword ptr [rsp + 0x20], xmm0
0x100325bd2: lea rdi, [rsp + 0x110]
0x100325bda: mov rbx, qword ptr [rsp + 0xd8]
0x100325be2: mov rsi, rbx
0x100325be5: call 0x10055e420 ; 0x10055e420
0x100325bea: lea rdi, [rsp + 0x380]
0x100325bf2: mov rsi, rbx
0x100325bf5: vmovss xmm0, dword ptr [rsp + 0x20]
0x100325bfb: call 0x100560b40 ; 0x100560b40
0x100325c00: vmovaps xmm1, xmmword ptr [rsp + 0x380]
0x100325c09: vmovaps xmm0, xmmword ptr [rsp + 0x3a0]
0x100325c12: vmulps xmm2, xmm0, xmm0
0x100325c16: vmovshdup xmm3, xmm2
0x100325c1a: vaddss xmm3, xmm2, xmm3
0x100325c1e: vpermilpd xmm2, xmm2, 1
0x100325c24: vaddss xmm2, xmm2, xmm3
0x100325c28: vrsqrtss xmm3, xmm2, xmm2
0x100325c2c: vmulss xmm4, xmm2, dword ptr [rip + 0x77e984] ; 0x100aa45b8
0x100325c34: vcmpeqss xmm2, xmm2, dword ptr [rip + 0x7814a7] ; 0x100aa70e4
0x100325c3d: vandnps xmm4, xmm2, xmm4
0x100325c41: vmovss xmm5, dword ptr [rip + 0x7829df] ; 0x100aa8628
0x100325c49: vandps xmm2, xmm2, xmm5
0x100325c4d: vorps xmm2, xmm4, xmm2
0x100325c51: vmulss xmm2, xmm3, xmm2
0x100325c55: vmulss xmm2, xmm3, xmm2
0x100325c59: vmovss xmm4, dword ptr [rip + 0x781b8b] ; 0x100aa77ec
0x100325c61: vsubss xmm2, xmm4, xmm2
0x100325c65: vmulss xmm2, xmm3, xmm2
0x100325c69: vpermilps xmm2, xmm2, 0xc0
0x100325c6f: vmulps xmm2, xmm0, xmm2
0x100325c73: vmovddup xmm3, qword ptr [rip + 0x781c5d] ; 0x100aa78d8
0x100325c7b: vmulps xmm2, xmm2, xmm3
0x100325c7f: vmovshdup xmm4, xmm2
0x100325c83: vaddss xmm4, xmm2, xmm4
0x100325c87: vpermilpd xmm2, xmm2, 1
0x100325c8d: vaddss xmm2, xmm2, xmm4
0x100325c91: vucomiss xmm2, dword ptr [rip + 0x782d03] ; 0x100aa899c
0x100325c99: vmovss xmm2, dword ptr [rip + 0x77f41f] ; 0x100aa50c0
0x100325ca1: ja 0x100325ca7
0x100325ca3: vmovaps xmm2, xmm3
0x100325ca7: vpermilps xmm3, xmm1, 0xd2
0x100325cad: vmulps xmm3, xmm3, xmm2
0x100325cb1: vpermilps xmm4, xmm2, 0xd2
0x100325cb7: vmulps xmm5, xmm1, xmm4
0x100325cbb: vsubps xmm5, xmm3, xmm5
0x100325cbf: vpermilps xmm3, xmm5, 0xd2
0x100325cc5: vmulps xmm5, xmm5, xmm5
0x100325cc9: vpermilpd xmm6, xmm5, 1
0x100325ccf: vaddss xmm6, xmm6, xmm5
0x100325cd3: vmovshdup xmm5, xmm5
0x100325cd7: vaddss xmm5, xmm5, xmm6
0x100325cdb: vsqrtss xmm5, xmm5, xmm5
0x100325cdf: vmovss xmm8, dword ptr [rip + 0x781bdd] ; 0x100aa78c4
0x100325ce7: vucomiss xmm5, xmm8
0x100325cec: jbe 0x100325cf8
0x100325cee: vpermilps xmm5, xmm5, 0xc0
0x100325cf4: vdivps xmm3, xmm3, xmm5
0x100325cf8: vmulps xmm5, xmm1, xmm1
0x100325cfc: vmovshdup xmm6, xmm5
0x100325d00: vaddss xmm6, xmm5, xmm6
0x100325d04: vpermilpd xmm5, xmm5, 1
0x100325d0a: vaddss xmm5, xmm5, xmm6
0x100325d0e: vsqrtss xmm5, xmm5, xmm5
0x100325d12: vmulps xmm4, xmm4, xmm3
0x100325d16: vpermilps xmm6, xmm3, 0xd2
0x100325d1c: vmulps xmm6, xmm2, xmm6
0x100325d20: vsubps xmm6, xmm4, xmm6
0x100325d24: vpermilps xmm4, xmm6, 0xd2
0x100325d2a: vmulps xmm6, xmm6, xmm6
0x100325d2e: vpermilpd xmm7, xmm6, 1
0x100325d34: vaddss xmm7, xmm7, xmm6
0x100325d38: vmovshdup xmm6, xmm6
0x100325d3c: vaddss xmm6, xmm6, xmm7
0x100325d40: vsqrtss xmm6, xmm6, xmm6
0x100325d44: vucomiss xmm6, xmm8
0x100325d49: jbe 0x100325d55
0x100325d4b: vpermilps xmm6, xmm6, 0xc0
0x100325d51: vdivps xmm4, xmm4, xmm6
0x100325d55: vpermilps xmm5, xmm5, 0xc0
0x100325d5b: vmulps xmm4, xmm5, xmm4
0x100325d5f: vblendps xmm1, xmm4, xmm1, 8
0x100325d65: vmovaps xmmword ptr [rsp + 0x380], xmm1
0x100325d6e: vblendps xmm2, xmm2, xmmword ptr [rsp + 0x390], 8
0x100325d79: vmovaps xmmword ptr [rsp + 0x390], xmm2
0x100325d82: vblendps xmm0, xmm3, xmm0, 8
0x100325d88: vmovaps xmmword ptr [rsp + 0x3a0], xmm0
0x100325d91: vmulps xmm0, xmm1, xmm1
0x100325d95: vmovshdup xmm2, xmm0
0x100325d99: vaddss xmm2, xmm0, xmm2
0x100325d9d: vpermilpd xmm0, xmm0, 1
0x100325da3: vaddss xmm0, xmm0, xmm2
0x100325da7: vsqrtss xmm0, xmm0, xmm0
0x100325dab: vblendps xmm1, xmm1, xmmword ptr [rip + 0x77e7eb], 2 ; 0x100aa45a0
0x100325db5: vmulps xmm2, xmm1, xmm1
0x100325db9: vmovshdup xmm3, xmm2
0x100325dbd: vaddss xmm3, xmm2, xmm3
0x100325dc1: vpermilpd xmm2, xmm2, 1
0x100325dc7: vaddss xmm2, xmm2, xmm3
0x100325dcb: vsqrtss xmm2, xmm2, xmm2
0x100325dcf: vucomiss xmm2, xmm8
0x100325dd4: jbe 0x100325de0
0x100325dd6: vpermilps xmm2, xmm2, 0xc0
0x100325ddc: vdivps xmm1, xmm1, xmm2
0x100325de0: vpermilps xmm0, xmm0, 0xc0
0x100325de6: vmulps xmm0, xmm0, xmm1
0x100325dea: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x100325df0: vmovaps xmm0, xmmword ptr [rsp + 0x120]
0x100325df9: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x100325dff: vmovaps xmm0, xmmword ptr [rsp + 0x110]
0x100325e08: vmovaps xmmword ptr [rsp + 0x20], xmm0
0x100325e0e: lea rbx, [rip + 0x1d1989b] ; 0x10203f6b0
0x100325e15: vmovaps xmm0, xmmword ptr [rbx]
0x100325e19: lea r13, [rip + 0x1d197f0] ; 0x10203f610
0x100325e20: vmovaps xmm1, xmmword ptr [r13]
0x100325e26: vsubps xmm0, xmm0, xmm1
0x100325e2a: vmulps xmm0, xmm0, xmmword ptr [rip + 0x77e76e] ; 0x100aa45a0
0x100325e32: vaddps xmm0, xmm1, xmm0
0x100325e36: vmovaps xmmword ptr [rsp + 0x1a0], xmm0
0x100325e3f: call 0x1002b9810 ; 0x1002b9810
0x100325e44: vmovddup xmm1, qword ptr [rip + 0x796394] ; 0x100abc1e0
0x100325e4c: vmovapd xmmword ptr [rsp + 0x70], xmm1
0x100325e52: vmovaps xmm2, xmmword ptr [rsp + 0x20]
0x100325e58: vsubps xmm0, xmm2, xmm1
0x100325e5c: vmovaps xmmword ptr [rsp + 0xb0], xmm0
0x100325e65: vaddps xmm0, xmm2, xmm1
0x100325e69: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x100325e72: xor r8d, r8d
0x100325e75: mov rdi, rax
0x100325e78: lea r15, [rsp + 0xb0]
0x100325e80: mov rsi, r15
0x100325e83: lea r12, [rsp + 0xa0]
0x100325e8b: mov rdx, r12
0x100325e8e: lea r14, [rsp + 0x1a0]
0x100325e96: mov rcx, r14
0x100325e99: call 0x1002b9d50 ; 0x1002b9d50
0x100325e9e: call 0x1002b9810 ; 0x1002b9810
0x100325ea3: vmovddup xmm1, qword ptr [rip + 0x79633d] ; 0x100abc1e8
0x100325eab: vmovapd xmmword ptr [rsp + 0x50], xmm1
0x100325eb1: vaddps xmm0, xmm1, xmmword ptr [rsp + 0x10]
0x100325eb7: vmovaps xmmword ptr [rsp + 0xb0], xmm0
0x100325ec0: vaddps xmm0, xmm1, xmmword ptr [rsp + 0x20]
0x100325ec6: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x100325ecf: xor r8d, r8d
0x100325ed2: mov rdi, rax
0x100325ed5: mov rsi, r15
0x100325ed8: mov rdx, r12
0x100325edb: mov rcx, r14
0x100325ede: call 0x1002b9d50 ; 0x1002b9d50
0x100325ee3: call 0x1002b9810 ; 0x1002b9810
0x100325ee8: vmovddup xmm1, qword ptr [rip + 0x796300] ; 0x100abc1f0
0x100325ef0: vmovapd xmmword ptr [rsp + 0x60], xmm1
0x100325ef6: vaddps xmm0, xmm1, xmmword ptr [rsp + 0x10]
0x100325efc: vmovaps xmmword ptr [rsp + 0xb0], xmm0
0x100325f05: vaddps xmm0, xmm1, xmmword ptr [rsp + 0x20]
0x100325f0b: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x100325f14: xor r8d, r8d
0x100325f17: mov rdi, rax
0x100325f1a: mov rsi, r15
0x100325f1d: mov rdx, r12
0x100325f20: mov rcx, r14
0x100325f23: call 0x1002b9d50 ; 0x1002b9d50
0x100325f28: call 0x1002b9810 ; 0x1002b9810
0x100325f2d: vmovddup xmm1, qword ptr [rip + 0x7962c3] ; 0x100abc1f8
0x100325f35: vmovapd xmmword ptr [rsp + 0xc0], xmm1
0x100325f3e: vaddps xmm0, xmm1, xmmword ptr [rsp + 0x10]
0x100325f44: vmovaps xmmword ptr [rsp + 0xb0], xmm0
0x100325f4d: vaddps xmm0, xmm1, xmmword ptr [rsp + 0x20]
0x100325f53: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x100325f5c: xor r8d, r8d
0x100325f5f: mov rdi, rax
0x100325f62: mov rsi, r15
0x100325f65: mov rdx, r12
0x100325f68: mov rcx, r14
0x100325f6b: call 0x1002b9d50 ; 0x1002b9d50
0x100325f70: call 0x1002b9810 ; 0x1002b9810
0x100325f75: vmovddup xmm1, qword ptr [rip + 0x796283] ; 0x100abc200
0x100325f7d: vmovapd xmmword ptr [rsp + 0xe0], xmm1
0x100325f86: vaddps xmm0, xmm1, xmmword ptr [rsp + 0x10]
0x100325f8c: vmovaps xmmword ptr [rsp + 0xb0], xmm0
0x100325f95: vaddps xmm0, xmm1, xmmword ptr [rsp + 0x20]
0x100325f9b: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x100325fa4: xor r8d, r8d
0x100325fa7: mov rdi, rax
0x100325faa: mov rsi, r15
0x100325fad: mov rdx, r12
0x100325fb0: mov rcx, r14
0x100325fb3: call 0x1002b9d50 ; 0x1002b9d50
0x100325fb8: call 0x1002b9810 ; 0x1002b9810
0x100325fbd: vmovddup xmm1, qword ptr [rip + 0x796243] ; 0x100abc208
0x100325fc5: vmovapd xmmword ptr [rsp + 0x1b0], xmm1
0x100325fce: vaddps xmm0, xmm1, xmmword ptr [rsp + 0x10]
0x100325fd4: vmovaps xmmword ptr [rsp + 0xb0], xmm0
0x100325fdd: vaddps xmm0, xmm1, xmmword ptr [rsp + 0x20]
0x100325fe3: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x100325fec: xor r8d, r8d
0x100325fef: mov rdi, rax
0x100325ff2: mov rsi, r15
0x100325ff5: mov rdx, r12
0x100325ff8: mov rcx, r14
0x100325ffb: call 0x1002b9d50 ; 0x1002b9d50
0x100326000: vmovaps xmm0, xmmword ptr [rsp + 0x80]
0x100326009: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x120]
0x100326012: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x100326018: vmovaps xmm0, xmmword ptr [rsp + 0x30]
0x10032601e: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x110]
0x100326027: vmovaps xmmword ptr [rsp + 0x20], xmm0
0x10032602d: vmovaps xmm0, xmmword ptr [rbx]
0x100326031: vmovaps xmm1, xmmword ptr [r13]
0x100326037: vsubps xmm0, xmm0, xmm1
0x10032603b: vmulps xmm0, xmm0, xmmword ptr [rip + 0x78367d] ; 0x100aa96c0
0x100326043: vaddps xmm0, xmm1, xmm0
0x100326047: vmovaps xmmword ptr [rsp + 0x1a0], xmm0
0x100326050: call 0x1002b9810 ; 0x1002b9810
0x100326055: vmovaps xmm1, xmmword ptr [rsp + 0x70]
0x10032605b: vmovaps xmm2, xmmword ptr [rsp + 0x20]
0x100326061: vsubps xmm0, xmm2, xmm1
0x100326065: vmovaps xmmword ptr [rsp + 0xb0], xmm0
0x10032606e: vaddps xmm0, xmm2, xmm1
0x100326072: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x10032607b: xor r8d, r8d
0x10032607e: mov rdi, rax
0x100326081: mov rsi, r15
0x100326084: mov rdx, r12
0x100326087: mov rcx, r14
0x10032608a: call 0x1002b9d50 ; 0x1002b9d50
0x10032608f: call 0x1002b9810 ; 0x1002b9810
0x100326094: vmovaps xmm1, xmmword ptr [rsp + 0x50]
0x10032609a: vaddps xmm0, xmm1, xmmword ptr [rsp + 0x10]
0x1003260a0: vmovaps xmmword ptr [rsp + 0xb0], xmm0
0x1003260a9: vaddps xmm0, xmm1, xmmword ptr [rsp + 0x20]
0x1003260af: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x1003260b8: xor r8d, r8d
0x1003260bb: mov rdi, rax
0x1003260be: mov rsi, r15
0x1003260c1: mov rdx, r12
0x1003260c4: mov rcx, r14
0x1003260c7: call 0x1002b9d50 ; 0x1002b9d50
0x1003260cc: call 0x1002b9810 ; 0x1002b9810
0x1003260d1: vmovaps xmm1, xmmword ptr [rsp + 0x60]
0x1003260d7: vaddps xmm0, xmm1, xmmword ptr [rsp + 0x10]
0x1003260dd: vmovaps xmmword ptr [rsp + 0xb0], xmm0
0x1003260e6: vaddps xmm0, xmm1, xmmword ptr [rsp + 0x20]
0x1003260ec: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x1003260f5: xor r8d, r8d
0x1003260f8: mov rdi, rax
0x1003260fb: mov rsi, r15
0x1003260fe: mov rdx, r12
0x100326101: mov rcx, r14
0x100326104: call 0x1002b9d50 ; 0x1002b9d50
0x100326109: call 0x1002b9810 ; 0x1002b9810
0x10032610e: vmovaps xmm1, xmmword ptr [rsp + 0xc0]
0x100326117: vaddps xmm0, xmm1, xmmword ptr [rsp + 0x10]
0x10032611d: vmovaps xmmword ptr [rsp + 0xb0], xmm0
0x100326126: vaddps xmm0, xmm1, xmmword ptr [rsp + 0x20]
0x10032612c: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x100326135: xor r8d, r8d
0x100326138: mov rdi, rax
0x10032613b: mov rsi, r15
0x10032613e: mov rdx, r12
0x100326141: mov rcx, r14
0x100326144: call 0x1002b9d50 ; 0x1002b9d50
0x100326149: call 0x1002b9810 ; 0x1002b9810
0x10032614e: vmovaps xmm1, xmmword ptr [rsp + 0xe0]
0x100326157: vaddps xmm0, xmm1, xmmword ptr [rsp + 0x10]
0x10032615d: vmovaps xmmword ptr [rsp + 0xb0], xmm0
0x100326166: vaddps xmm0, xmm1, xmmword ptr [rsp + 0x20]
0x10032616c: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x100326175: xor r8d, r8d
0x100326178: mov rdi, rax
0x10032617b: mov rsi, r15
0x10032617e: mov rdx, r12
0x100326181: mov rcx, r14
0x100326184: call 0x1002b9d50 ; 0x1002b9d50
0x100326189: call 0x1002b9810 ; 0x1002b9810
0x10032618e: vmovaps xmm1, xmmword ptr [rsp + 0x1b0]
0x100326197: vaddps xmm0, xmm1, xmmword ptr [rsp + 0x10]
0x10032619d: vmovaps xmmword ptr [rsp + 0xb0], xmm0
0x1003261a6: vaddps xmm0, xmm1, xmmword ptr [rsp + 0x20]
0x1003261ac: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x1003261b5: xor r8d, r8d
0x1003261b8: mov rdi, rax
0x1003261bb: mov rsi, r15
0x1003261be: mov rdx, r12
0x1003261c1: mov rcx, r14
0x1003261c4: call 0x1002b9d50 ; 0x1002b9d50
0x1003261c9: vmovaps xmm0, xmmword ptr [rsp + 0x110]
0x1003261d2: vmovaps xmmword ptr [rsp + 0x120], xmm0
0x1003261db: mov eax, dword ptr [rsp + 0x40]
0x1003261df: inc eax
0x1003261e1: vmovaps xmm0, xmmword ptr [rsp + 0x30]
0x1003261e7: cmp eax, 0x64
0x1003261ea: jne 0x100325bb0
0x1003261f0: mov rbx, qword ptr [rsp + 0xd8]
0x1003261f8: mov rdi, rbx
0x1003261fb: lea rsi, [rsp + 0xf0]
0x100326203: lea rdx, [rsp + 0x380]
0x10032620b: call 0x10055f470 ; 0x10055f470
0x100326210: cmp byte ptr [rbx + 0x2c], 0
0x100326214: mov edx, dword ptr [rsp + 0x9c]
0x10032621b: jne 0x10032623d
0x10032621d: vucomiss xmm0, dword ptr [rip + 0x7816a7] ; 0x100aa78cc
0x100326225: ja 0x100326484
0x10032622b: vmovss xmm1, dword ptr [rip + 0x782381] ; 0x100aa85b4
0x100326233: vucomiss xmm1, xmm0
0x100326237: ja 0x100326484
0x10032623d: vmovaps xmm1, xmmword ptr [rsp + 0x380]
0x100326246: vsubps xmm1, xmm1, xmmword ptr [rsp + 0xf0]
0x10032624f: vblendps xmm1, xmm1, xmmword ptr [rip + 0x77e347], 2 ; 0x100aa45a0
0x100326259: vmulps xmm1, xmm1, xmm1
0x10032625d: vmovshdup xmm2, xmm1
0x100326261: vaddss xmm2, xmm1, xmm2
0x100326265: vpermilpd xmm1, xmm1, 1
0x10032626b: vaddss xmm1, xmm1, xmm2
0x10032626f: vsqrtss xmm2, xmm1, xmm1
0x100326273: vmovss xmm1, dword ptr [rsp + 0x98]
0x10032627c: vucomiss xmm1, xmm2
0x100326280: jbe 0x100326484
0x100326286: vmovss dword ptr [rsp + 0x20], xmm2
0x10032628c: lea rdi, [rsp + 0x1c0]
0x100326294: mov rsi, qword ptr [rsp + 0xd8]
0x10032629c: call 0x100560b40 ; 0x100560b40
0x1003262a1: vmovaps xmm1, xmmword ptr [rsp + 0x1c0]
0x1003262aa: vmovaps xmm0, xmmword ptr [rsp + 0x1e0]
0x1003262b3: vmulps xmm2, xmm0, xmm0
0x1003262b7: vmovshdup xmm3, xmm2
0x1003262bb: vaddss xmm3, xmm2, xmm3
0x1003262bf: vpermilpd xmm2, xmm2, 1
0x1003262c5: vaddss xmm2, xmm2, xmm3
0x1003262c9: vrsqrtss xmm3, xmm2, xmm2
0x1003262cd: vmulss xmm4, xmm2, dword ptr [rip + 0x77e2e3] ; 0x100aa45b8
0x1003262d5: vcmpeqss xmm2, xmm2, dword ptr [rip + 0x780e06] ; 0x100aa70e4
0x1003262de: vandnps xmm4, xmm2, xmm4
0x1003262e2: vmovss xmm5, dword ptr [rip + 0x78233e] ; 0x100aa8628
0x1003262ea: vandps xmm2, xmm2, xmm5
0x1003262ee: vorps xmm2, xmm4, xmm2
0x1003262f2: vmulss xmm2, xmm3, xmm2
0x1003262f6: vmulss xmm2, xmm3, xmm2
0x1003262fa: vmovss xmm4, dword ptr [rip + 0x7814ea] ; 0x100aa77ec
0x100326302: vsubss xmm2, xmm4, xmm2
0x100326306: vmulss xmm2, xmm3, xmm2
0x10032630a: vpermilps xmm2, xmm2, 0xc0
0x100326310: vmulps xmm2, xmm0, xmm2
0x100326314: vmovddup xmm3, qword ptr [rip + 0x7815bc] ; 0x100aa78d8
0x10032631c: vmulps xmm2, xmm2, xmm3
0x100326320: vmovshdup xmm4, xmm2
0x100326324: vaddss xmm4, xmm2, xmm4
0x100326328: vpermilpd xmm2, xmm2, 1
0x10032632e: vaddss xmm2, xmm2, xmm4
0x100326332: vucomiss xmm2, dword ptr [rip + 0x782662] ; 0x100aa899c
0x10032633a: vmovss xmm2, dword ptr [rip + 0x77ed7e] ; 0x100aa50c0
0x100326342: ja 0x100326348
0x100326344: vmovaps xmm2, xmm3
0x100326348: vpermilps xmm3, xmm1, 0xd2
0x10032634e: vmulps xmm3, xmm3, xmm2
0x100326352: vpermilps xmm4, xmm2, 0xd2
0x100326358: vmulps xmm5, xmm1, xmm4
0x10032635c: vsubps xmm5, xmm3, xmm5
0x100326360: vpermilps xmm3, xmm5, 0xd2
0x100326366: vmulps xmm5, xmm5, xmm5
0x10032636a: vpermilpd xmm6, xmm5, 1
0x100326370: vaddss xmm6, xmm6, xmm5
0x100326374: vmovshdup xmm5, xmm5
0x100326378: vaddss xmm5, xmm5, xmm6
0x10032637c: vsqrtss xmm5, xmm5, xmm5
0x100326380: vmovss xmm8, dword ptr [rip + 0x78153c] ; 0x100aa78c4
0x100326388: vucomiss xmm5, xmm8
0x10032638d: jbe 0x100326399
0x10032638f: vpermilps xmm5, xmm5, 0xc0
0x100326395: vdivps xmm3, xmm3, xmm5
0x100326399: mov edx, dword ptr [rsp + 0x9c]
0x1003263a0: vmulps xmm5, xmm1, xmm1
0x1003263a4: vmovshdup xmm6, xmm5
0x1003263a8: vaddss xmm6, xmm5, xmm6
0x1003263ac: vpermilpd xmm5, xmm5, 1
0x1003263b2: vaddss xmm5, xmm5, xmm6
0x1003263b6: vsqrtss xmm5, xmm5, xmm5
0x1003263ba: vmulps xmm4, xmm4, xmm3
0x1003263be: vpermilps xmm6, xmm3, 0xd2
0x1003263c4: vmulps xmm6, xmm2, xmm6
0x1003263c8: vsubps xmm6, xmm4, xmm6
0x1003263cc: vpermilps xmm4, xmm6, 0xd2
0x1003263d2: vmulps xmm6, xmm6, xmm6
0x1003263d6: vpermilpd xmm7, xmm6, 1
0x1003263dc: vaddss xmm7, xmm7, xmm6
0x1003263e0: vmovshdup xmm6, xmm6
0x1003263e4: vaddss xmm6, xmm6, xmm7
0x1003263e8: vsqrtss xmm6, xmm6, xmm6
0x1003263ec: vucomiss xmm6, xmm8
0x1003263f1: jbe 0x1003263fd
0x1003263f3: vpermilps xmm6, xmm6, 0xc0
0x1003263f9: vdivps xmm4, xmm4, xmm6
0x1003263fd: vpermilps xmm5, xmm5, 0xc0
0x100326403: vmulps xmm4, xmm5, xmm4
0x100326407: vblendps xmm1, xmm4, xmm1, 8
0x10032640d: vmovaps xmmword ptr [rsp + 0x140], xmm1
0x100326416: vmovaps xmmword ptr [rsp + 0x1c0], xmm1
0x10032641f: vblendps xmm1, xmm2, xmmword ptr [rsp + 0x1d0], 8
0x10032642a: vmovaps xmmword ptr [rsp + 0x1d0], xmm1
0x100326433: vblendps xmm0, xmm3, xmm0, 8
0x100326439: vmovaps xmmword ptr [rsp + 0x1e0], xmm0
0x100326442: vmovaps xmm0, xmmword ptr [rsp + 0x1f0]
0x10032644b: vmovaps xmm1, xmmword ptr [rsp + 0xf0]
0x100326454: vsubps xmm2, xmm0, xmm1
0x100326458: vblendps xmm2, xmm2, xmmword ptr [rip + 0x77e13e], 2 ; 0x100aa45a0
0x100326462: vaddps xmm1, xmm1, xmm2
0x100326466: vblendps xmm0, xmm1, xmm0, 8
0x10032646c: vmovaps xmmword ptr [rsp + 0x150], xmm0
0x100326475: vmovss xmm0, dword ptr [rsp + 0x20]
0x10032647b: vmovss dword ptr [rsp + 0x98], xmm0
0x100326484: inc edx
0x100326486: mov rax, qword ptr [rsp + 0x138]
0x10032648e: mov rcx, qword ptr [rax]
0x100326491: cmp edx, dword ptr [rcx + 0x10]
0x100326494: jb 0x100325910
0x10032649a: mov rax, qword ptr [rsp + 0xd0]
0x1003264a2: mov eax, dword ptr [rax + 0x62d0]
0x1003264a8: mov r14, qword ptr [rsp + 0x90]
0x1003264b0: mov rcx, qword ptr [rsp + 0x108]
0x1003264b8: inc ecx
0x1003264ba: cmp ecx, eax
0x1003264bc: jb 0x1003258c0
0x1003264c2: vmovss xmm0, dword ptr [rip + 0x7813ee] ; 0x100aa78b8
0x1003264ca: vucomiss xmm0, dword ptr [rsp + 0x98]
0x1003264d3: mov r13, qword ptr [rsp + 0xd0]
0x1003264db: jbe 0x10032657f
0x1003264e1: vmovaps xmm2, xmmword ptr [rsp + 0x150]
0x1003264ea: vmovaps xmmword ptr [r13 + 0x6500], xmm2
0x1003264f3: vaddps xmm0, xmm2, xmmword ptr [rsp + 0x140]
0x1003264fc: vmovaps xmmword ptr [r13 + 0x64f0], xmm0
0x100326505: vmovaps xmm1, xmmword ptr [rsp + 0xf0]
0x10032650e: vsubps xmm0, xmm0, xmm2
0x100326512: vsubps xmm1, xmm1, xmm2
0x100326516: vmulps xmm1, xmm0, xmm1
0x10032651a: vmovshdup xmm2, xmm1
0x10032651e: vaddss xmm2, xmm1, xmm2
0x100326522: vpermilpd xmm1, xmm1, 1
0x100326528: vaddss xmm1, xmm1, xmm2
0x10032652c: vmulps xmm0, xmm0, xmm0
0x100326530: vmovshdup xmm2, xmm0
0x100326534: vaddss xmm2, xmm0, xmm2
0x100326538: vpermilpd xmm0, xmm0, 1
0x10032653e: vaddss xmm0, xmm0, xmm2
0x100326542: vdivss xmm0, xmm1, xmm0
0x100326546: vmovss xmm1, dword ptr [rip + 0x77eb72] ; 0x100aa50c0
0x10032654e: vsubss xmm0, xmm1, xmm0
0x100326552: vxorps xmm1, xmm1, xmm1
0x100326556: vmaxss xmm2, xmm1, xmm0
0x10032655a: vcmpunordss xmm0, xmm0, xmm0
0x10032655f: vandnps xmm0, xmm0, xmm2
0x100326563: vucomiss xmm0, xmm1
0x100326567: seta al
0x10032656a: seta byte ptr [r13 + 0x64e0]
0x100326572: test al, al
0x100326574: jne 0x10032658a
0x100326576: vxorps xmm0, xmm0, xmm0
0x10032657a: jmp 0x100326660 ; 0x100326660
0x10032657f: mov al, byte ptr [r13 + 0x64e0]
0x100326586: test al, al
0x100326588: je 0x100326576
0x10032658a: lea rbx, [r13 + 0x64f0]
0x100326591: lea r14, [r13 + 0x6500]
0x100326598: vmovaps xmm2, xmmword ptr [rsp + 0xf0]
0x1003265a1: vmovaps xmm0, xmmword ptr [rbx]
0x1003265a5: vmovaps xmm1, xmmword ptr [r14]
0x1003265aa: vsubps xmm3, xmm0, xmm1
0x1003265ae: vsubps xmm2, xmm2, xmm1
0x1003265b2: vmulps xmm2, xmm3, xmm2
0x1003265b6: vmovshdup xmm4, xmm2
0x1003265ba: vaddss xmm4, xmm2, xmm4
0x1003265be: vpermilpd xmm2, xmm2, 1
0x1003265c4: vaddss xmm2, xmm2, xmm4
0x1003265c8: vmulps xmm3, xmm3, xmm3
0x1003265cc: vmovshdup xmm4, xmm3
0x1003265d0: vaddss xmm4, xmm3, xmm4
0x1003265d4: vpermilpd xmm3, xmm3, 1
0x1003265da: vaddss xmm3, xmm3, xmm4
0x1003265de: vdivss xmm2, xmm2, xmm3
0x1003265e2: vmovss xmm3, dword ptr [rip + 0x77ead6] ; 0x100aa50c0
0x1003265ea: vsubss xmm2, xmm3, xmm2
0x1003265ee: vxorps xmm3, xmm3, xmm3
0x1003265f2: vmaxss xmm3, xmm3, xmm2
0x1003265f6: vcmpunordss xmm2, xmm2, xmm2
0x1003265fb: vandnps xmm3, xmm2, xmm3
0x1003265ff: cmp byte ptr [rip + 0x1accd72], 0 ; 0x101df3378
0x100326606: jne 0x1003275f4
0x10032660c: vsubps xmm0, xmm0, xmm1
0x100326610: vmulps xmm1, xmm0, xmm0
0x100326614: vmovshdup xmm2, xmm1
0x100326618: vaddss xmm2, xmm1, xmm2
0x10032661c: vpermilpd xmm1, xmm1, 1
0x100326622: vaddss xmm1, xmm1, xmm2
0x100326626: vsqrtss xmm1, xmm1, xmm1
0x10032662a: vucomiss xmm1, dword ptr [rip + 0x781292] ; 0x100aa78c4
0x100326632: jbe 0x10032663e
0x100326634: vpermilps xmm1, xmm1, 0xc0
0x10032663a: vdivps xmm0, xmm0, xmm1
0x10032663e: mov r14, qword ptr [rsp + 0x90]
0x100326646: vmulss xmm1, xmm3, dword ptr [rip + 0x785296] ; 0x100aab8e4
0x10032664e: vpermilps xmm1, xmm1, 0xc0
0x100326654: vmulps xmm0, xmm1, xmm0
0x100326658: vxorps xmm1, xmm1, xmm1
0x10032665c: vaddps xmm0, xmm0, xmm1
0x100326660: vmovaps xmmword ptr [rsp + 0x20], xmm0
0x100326666: mov byte ptr [r13 + 0x51], 0
0x10032666b: cmp byte ptr [r13 + 0x50], 0
0x100326670: je 0x10032667d
0x100326672: vmovaps xmm0, xmmword ptr [r13 + 0x10]
0x100326678: jmp 0x100327348 ; 0x100327348
0x10032667d: mov rax, qword ptr [r14 + 0x160]
0x100326684: vmovss xmm0, dword ptr [rax + 0x24]
0x100326689: vmovss dword ptr [rsp + 0x40], xmm0
0x10032668f: vdivss xmm0, xmm0, dword ptr [rip + 0x781621] ; 0x100aa7cb8
0x100326697: vcvttss2si rax, xmm0
0x10032669c: vmovaps xmm2, xmm0
0x1003266a0: vmovss dword ptr [rsp + 0x10], xmm2
0x1003266a6: lea ecx, [rax + 1]
0x1003266a9: mov edx, eax
0x1003266ab: shl edx, 0xd
0x1003266ae: xor edx, eax
0x1003266b0: mov esi, edx
0x1003266b2: imul esi, esi
0x1003266b5: imul esi, esi, 0x3d73
0x1003266bb: add esi, 0xc0ae5
0x1003266c1: imul esi, edx
0x1003266c4: add esi, 0x5208dd0d
0x1003266ca: and esi, 0x7fffffff
0x1003266d0: vcvtsi2ss xmm0, xmm9, esi
0x1003266d4: vmovss xmm1, dword ptr [rip + 0x7844dc] ; 0x100aaabb8
0x1003266dc: vmulss xmm0, xmm0, xmm1
0x1003266e0: vmovaps xmm3, xmm1
0x1003266e4: vmovss xmm1, dword ptr [rip + 0x77e9d4] ; 0x100aa50c0
0x1003266ec: vsubss xmm0, xmm1, xmm0
0x1003266f0: vmovaps xmm4, xmm1
0x1003266f4: vmovss xmm1, dword ptr [rip + 0x77debc] ; 0x100aa45b8
0x1003266fc: vmulss xmm0, xmm0, xmm1
0x100326700: vmovss dword ptr [rsp + 0x30], xmm0
0x100326706: mov edx, ecx
0x100326708: shl edx, 0xd
0x10032670b: xor edx, ecx
0x10032670d: mov ecx, edx
0x10032670f: imul ecx, ecx
0x100326712: imul ecx, ecx, 0x3d73
0x100326718: add ecx, 0xc0ae5
0x10032671e: imul ecx, edx
0x100326721: add ecx, 0x5208dd0d
0x100326727: and ecx, 0x7fffffff
0x10032672d: vcvtsi2ss xmm0, xmm9, ecx
0x100326731: vmulss xmm0, xmm0, xmm3
0x100326735: vsubss xmm0, xmm4, xmm0
0x100326739: vmulss xmm0, xmm0, xmm1
0x10032673d: vmovss dword ptr [rsp + 0x80], xmm0
0x100326746: mov eax, eax
0x100326748: vcvtsi2ss xmm0, xmm9, rax
0x10032674d: vsubss xmm0, xmm2, xmm0
0x100326751: vmulss xmm0, xmm0, dword ptr [rip + 0x781ea7] ; 0x100aa8600
0x100326759: vzeroupper 
0x10032675c: call 0x100aa260c ; 0x100aa260c _cosf
0x100326761: vmovss xmm3, dword ptr [rip + 0x77e957] ; 0x100aa50c0
0x100326769: vsubss xmm0, xmm3, xmm0
0x10032676d: vmovss xmm2, dword ptr [rip + 0x77de43] ; 0x100aa45b8
0x100326775: vmulss xmm0, xmm0, xmm2
0x100326779: vmulss xmm1, xmm0, dword ptr [rsp + 0x80]
0x100326782: vsubss xmm0, xmm3, xmm0
0x100326786: vmovaps xmm4, xmm3
0x10032678a: vmulss xmm0, xmm0, dword ptr [rsp + 0x30]
0x100326790: vaddss xmm0, xmm0, xmm1
0x100326794: vmovss dword ptr [rsp + 0x30], xmm0
0x10032679a: vmovss xmm0, dword ptr [rsp + 0x10]
0x1003267a0: vaddss xmm0, xmm0, xmm0
0x1003267a4: vcvttss2si rax, xmm0
0x1003267a9: lea ecx, [rax + 1]
0x1003267ac: mov edx, eax
0x1003267ae: shl edx, 0xd
0x1003267b1: xor edx, eax
0x1003267b3: mov esi, edx
0x1003267b5: imul esi, esi
0x1003267b8: imul esi, esi, 0x3d73
0x1003267be: add esi, 0xc0ae5
0x1003267c4: imul esi, edx
0x1003267c7: add esi, 0x5208dd0d
0x1003267cd: and esi, 0x7fffffff
0x1003267d3: vcvtsi2ss xmm1, xmm8, esi
0x1003267d7: vmovss xmm3, dword ptr [rip + 0x7843d9] ; 0x100aaabb8
0x1003267df: vmulss xmm1, xmm1, xmm3
0x1003267e3: vsubss xmm1, xmm4, xmm1
0x1003267e7: vmulss xmm1, xmm1, xmm2
0x1003267eb: vmovss dword ptr [rsp + 0x80], xmm1
0x1003267f4: mov edx, ecx
0x1003267f6: shl edx, 0xd
0x1003267f9: xor edx, ecx
0x1003267fb: mov ecx, edx
0x1003267fd: imul ecx, ecx
0x100326800: imul ecx, ecx, 0x3d73
0x100326806: add ecx, 0xc0ae5
0x10032680c: imul ecx, edx
0x10032680f: add ecx, 0x5208dd0d
0x100326815: and ecx, 0x7fffffff
0x10032681b: vcvtsi2ss xmm1, xmm5, ecx
0x10032681f: vmulss xmm1, xmm1, xmm3
0x100326823: vsubss xmm1, xmm4, xmm1
0x100326827: vmulss xmm1, xmm1, xmm2
0x10032682b: vmovss dword ptr [rsp + 0x70], xmm1
0x100326831: mov eax, eax
0x100326833: vcvtsi2ss xmm1, xmm5, rax
0x100326838: vsubss xmm0, xmm0, xmm1
0x10032683c: vmulss xmm0, xmm0, dword ptr [rip + 0x781dbc] ; 0x100aa8600
0x100326844: call 0x100aa260c ; 0x100aa260c _cosf
0x100326849: vmovss xmm2, dword ptr [rip + 0x77e86f] ; 0x100aa50c0
0x100326851: vsubss xmm0, xmm2, xmm0
0x100326855: vmovss xmm3, dword ptr [rip + 0x77dd5b] ; 0x100aa45b8
0x10032685d: vmulss xmm0, xmm0, xmm3
0x100326861: vmulss xmm1, xmm0, dword ptr [rsp + 0x70]
0x100326867: vsubss xmm0, xmm2, xmm0
0x10032686b: vmovaps xmm4, xmm2
0x10032686f: vmulss xmm0, xmm0, dword ptr [rsp + 0x80]
0x100326878: vaddss xmm0, xmm0, xmm1
0x10032687c: vmulss xmm0, xmm0, dword ptr [rip + 0x781dd4] ; 0x100aa8658
0x100326884: vaddss xmm0, xmm0, dword ptr [rsp + 0x30]
0x10032688a: vmovss dword ptr [rsp + 0x30], xmm0
0x100326890: vmovss xmm0, dword ptr [rsp + 0x10]
0x100326896: vmulss xmm0, xmm0, dword ptr [rip + 0x78101e] ; 0x100aa78bc
0x10032689e: vcvttss2si rax, xmm0
0x1003268a3: lea ecx, [rax + 1]
0x1003268a6: mov edx, eax
0x1003268a8: shl edx, 0xd
0x1003268ab: xor edx, eax
0x1003268ad: mov esi, edx
0x1003268af: imul esi, esi
0x1003268b2: imul esi, esi, 0x3d73
0x1003268b8: add esi, 0xc0ae5
0x1003268be: imul esi, edx
0x1003268c1: add esi, 0x5208dd0d
0x1003268c7: and esi, 0x7fffffff
0x1003268cd: vcvtsi2ss xmm1, xmm5, esi
0x1003268d1: vmovss xmm2, dword ptr [rip + 0x7842df] ; 0x100aaabb8
0x1003268d9: vmulss xmm1, xmm1, xmm2
0x1003268dd: vsubss xmm1, xmm4, xmm1
0x1003268e1: vmulss xmm1, xmm1, xmm3
0x1003268e5: vmovss dword ptr [rsp + 0x10], xmm1
0x1003268eb: mov edx, ecx
0x1003268ed: shl edx, 0xd
0x1003268f0: xor edx, ecx
0x1003268f2: mov ecx, edx
0x1003268f4: imul ecx, ecx
0x1003268f7: imul ecx, ecx, 0x3d73
0x1003268fd: add ecx, 0xc0ae5
0x100326903: imul ecx, edx
0x100326906: add ecx, 0x5208dd0d
0x10032690c: and ecx, 0x7fffffff
0x100326912: vcvtsi2ss xmm1, xmm5, ecx
0x100326916: vmulss xmm1, xmm1, xmm2
0x10032691a: vsubss xmm1, xmm4, xmm1
0x10032691e: vmulss xmm1, xmm1, xmm3
0x100326922: vmovss dword ptr [rsp + 0x80], xmm1
0x10032692b: mov eax, eax
0x10032692d: vcvtsi2ss xmm1, xmm5, rax
0x100326932: vsubss xmm0, xmm0, xmm1
0x100326936: vmulss xmm0, xmm0, dword ptr [rip + 0x781cc2] ; 0x100aa8600
0x10032693e: call 0x100aa260c ; 0x100aa260c _cosf
0x100326943: vmovss xmm2, dword ptr [rip + 0x77e775] ; 0x100aa50c0
0x10032694b: vsubss xmm0, xmm2, xmm0
0x10032694f: vmulss xmm0, xmm0, dword ptr [rip + 0x77dc61] ; 0x100aa45b8
0x100326957: vmulss xmm1, xmm0, dword ptr [rsp + 0x80]
0x100326960: vsubss xmm0, xmm2, xmm0
0x100326964: vmulss xmm0, xmm0, dword ptr [rsp + 0x10]
0x10032696a: vaddss xmm0, xmm0, xmm1
0x10032696e: vmulss xmm0, xmm0, dword ptr [rip + 0x788d5e] ; 0x100aaf6d4
0x100326976: vaddss xmm0, xmm0, dword ptr [rsp + 0x30]
0x10032697c: vmulss xmm0, xmm0, dword ptr [rip + 0x781c7c] ; 0x100aa8600
0x100326984: vmovss dword ptr [rsp + 0x70], xmm0
0x10032698a: vmovss xmm0, dword ptr [r13 + 0xc]
0x100326990: vmovss dword ptr [rsp + 0x30], xmm0
0x100326996: cmp byte ptr [r13 + 0x5c], 0
0x10032699b: lea rax, [r13 + 0x58]
0x10032699f: lea rbx, [rip + 0x9857aa] ; 0x100cac150
0x1003269a6: cmovne rbx, rax
0x1003269aa: vmulss xmm0, xmm0, dword ptr [rip + 0x783ada] ; 0x100aaa48c
0x1003269b2: call 0x100aa2708 ; 0x100aa2708 _expf
0x1003269b7: vmovss xmm2, dword ptr [rip + 0x77e701] ; 0x100aa50c0
0x1003269bf: vsubss xmm0, xmm2, xmm0
0x1003269c3: vxorps xmm3, xmm3, xmm3
0x1003269c7: vmaxss xmm0, xmm3, xmm0
0x1003269cb: vminss xmm0, xmm2, xmm0
0x1003269cf: vsubss xmm1, xmm2, xmm0
0x1003269d3: vmulss xmm1, xmm1, dword ptr [r13 + 0x54]
0x1003269d9: vmulss xmm0, xmm0, dword ptr [rbx]
0x1003269dd: vaddss xmm0, xmm0, xmm1
0x1003269e1: vmovss dword ptr [rsp + 0x80], xmm0
0x1003269ea: vmovss dword ptr [r13 + 0x54], xmm0
0x1003269f0: vdivss xmm0, xmm0, dword ptr [rip + 0x780de4] ; 0x100aa77dc
0x1003269f8: vmaxss xmm0, xmm3, xmm0
0x1003269fc: vminss xmm0, xmm2, xmm0
0x100326a00: vmovaps xmm4, xmm2
0x100326a04: vaddss xmm1, xmm0, xmm0
0x100326a08: vmulss xmm0, xmm0, dword ptr [rip + 0x794e00] ; 0x100abb810
0x100326a10: vmovss dword ptr [rsp + 0x50], xmm0
0x100326a16: vmovss xmm2, dword ptr [rsp + 0x30]
0x100326a1c: vmulss xmm0, xmm2, xmm1
0x100326a20: vaddss xmm0, xmm0, dword ptr [r13 + 0x70]
0x100326a26: vmovss dword ptr [rsp + 0x10], xmm0
0x100326a2c: vmovss dword ptr [r13 + 0x70], xmm0
0x100326a32: vmulss xmm0, xmm1, xmm1
0x100326a36: vmulss xmm0, xmm2, xmm0
0x100326a3a: vaddss xmm0, xmm0, dword ptr [r13 + 0x74]
0x100326a40: vmovss dword ptr [r13 + 0x74], xmm0
0x100326a46: vcvttss2si rax, xmm0
0x100326a4b: vmovaps xmm3, xmm0
0x100326a4f: vmovss dword ptr [rsp + 0x30], xmm3
0x100326a55: lea ecx, [rax + 1]
0x100326a58: mov edx, eax
0x100326a5a: shl edx, 0xd
0x100326a5d: xor edx, eax
0x100326a5f: mov esi, edx
0x100326a61: imul esi, esi
0x100326a64: imul esi, esi, 0x3d73
0x100326a6a: add esi, 0xc0ae5
0x100326a70: imul esi, edx
0x100326a73: add esi, 0x5208dd0d
0x100326a79: and esi, 0x7fffffff
0x100326a7f: vcvtsi2ss xmm0, xmm5, esi
0x100326a83: vmovss xmm2, dword ptr [rip + 0x78412d] ; 0x100aaabb8
0x100326a8b: vmulss xmm0, xmm0, xmm2
0x100326a8f: vsubss xmm0, xmm4, xmm0
0x100326a93: vmovss xmm1, dword ptr [rip + 0x77db1d] ; 0x100aa45b8
0x100326a9b: vmulss xmm0, xmm0, xmm1
0x100326a9f: vmovss dword ptr [rsp + 0x60], xmm0
0x100326aa5: mov edx, ecx
0x100326aa7: shl edx, 0xd
0x100326aaa: xor edx, ecx
0x100326aac: mov ecx, edx
0x100326aae: imul ecx, ecx
0x100326ab1: imul ecx, ecx, 0x3d73
0x100326ab7: add ecx, 0xc0ae5
0x100326abd: imul ecx, edx
0x100326ac0: add ecx, 0x5208dd0d
0x100326ac6: and ecx, 0x7fffffff
0x100326acc: vcvtsi2ss xmm0, xmm5, ecx
0x100326ad0: vmulss xmm0, xmm0, xmm2
0x100326ad4: vsubss xmm0, xmm4, xmm0
0x100326ad8: vmulss xmm0, xmm0, xmm1
0x100326adc: vmovss dword ptr [rsp + 0xc0], xmm0
0x100326ae5: mov eax, eax
0x100326ae7: vcvtsi2ss xmm0, xmm5, rax
0x100326aec: vsubss xmm0, xmm3, xmm0
0x100326af0: vmulss xmm0, xmm0, dword ptr [rip + 0x781b08] ; 0x100aa8600
0x100326af8: call 0x100aa260c ; 0x100aa260c _cosf
0x100326afd: vmovss xmm2, dword ptr [rip + 0x77e5bb] ; 0x100aa50c0
0x100326b05: vsubss xmm0, xmm2, xmm0
0x100326b09: vmovss xmm3, dword ptr [rip + 0x77daa7] ; 0x100aa45b8
0x100326b11: vmulss xmm0, xmm0, xmm3
0x100326b15: vmulss xmm1, xmm0, dword ptr [rsp + 0xc0]
0x100326b1e: vsubss xmm0, xmm2, xmm0
0x100326b22: vmovaps xmm4, xmm2
0x100326b26: vmulss xmm0, xmm0, dword ptr [rsp + 0x60]
0x100326b2c: vaddss xmm0, xmm0, xmm1
0x100326b30: vmovss dword ptr [rsp + 0x60], xmm0
0x100326b36: vmovss xmm0, dword ptr [rsp + 0x30]
0x100326b3c: vaddss xmm0, xmm0, xmm0
0x100326b40: vcvttss2si rax, xmm0
0x100326b45: lea ecx, [rax + 1]
0x100326b48: mov edx, eax
0x100326b4a: shl edx, 0xd
0x100326b4d: xor edx, eax
0x100326b4f: mov esi, edx
0x100326b51: imul esi, esi
0x100326b54: imul esi, esi, 0x3d73
0x100326b5a: add esi, 0xc0ae5
0x100326b60: imul esi, edx
0x100326b63: add esi, 0x5208dd0d
0x100326b69: and esi, 0x7fffffff
0x100326b6f: vcvtsi2ss xmm1, xmm5, esi
0x100326b73: vmovss xmm2, dword ptr [rip + 0x78403d] ; 0x100aaabb8
0x100326b7b: vmulss xmm1, xmm1, xmm2
0x100326b7f: vsubss xmm1, xmm4, xmm1
0x100326b83: vmulss xmm1, xmm1, xmm3
0x100326b87: vmovss dword ptr [rsp + 0xc0], xmm1
0x100326b90: mov edx, ecx
0x100326b92: shl edx, 0xd
0x100326b95: xor edx, ecx
0x100326b97: mov ecx, edx
0x100326b99: imul ecx, ecx
0x100326b9c: imul ecx, ecx, 0x3d73
0x100326ba2: add ecx, 0xc0ae5
0x100326ba8: imul ecx, edx
0x100326bab: add ecx, 0x5208dd0d
0x100326bb1: and ecx, 0x7fffffff
0x100326bb7: vcvtsi2ss xmm1, xmm5, ecx
0x100326bbb: vmulss xmm1, xmm1, xmm2
0x100326bbf: vsubss xmm1, xmm4, xmm1
0x100326bc3: vmulss xmm1, xmm1, xmm3
0x100326bc7: vmovss dword ptr [rsp + 0xe0], xmm1
0x100326bd0: mov eax, eax
0x100326bd2: vcvtsi2ss xmm1, xmm5, rax
0x100326bd7: vsubss xmm0, xmm0, xmm1
0x100326bdb: vmulss xmm0, xmm0, dword ptr [rip + 0x781a1d] ; 0x100aa8600
0x100326be3: call 0x100aa260c ; 0x100aa260c _cosf
0x100326be8: vmovss xmm2, dword ptr [rip + 0x77e4d0] ; 0x100aa50c0
0x100326bf0: vsubss xmm0, xmm2, xmm0
0x100326bf4: vmovss xmm3, dword ptr [rip + 0x77d9bc] ; 0x100aa45b8
0x100326bfc: vmulss xmm0, xmm0, xmm3
0x100326c00: vmulss xmm1, xmm0, dword ptr [rsp + 0xe0]
0x100326c09: vsubss xmm0, xmm2, xmm0
0x100326c0d: vmovaps xmm4, xmm2
0x100326c11: vmulss xmm0, xmm0, dword ptr [rsp + 0xc0]
0x100326c1a: vaddss xmm0, xmm0, xmm1
0x100326c1e: vmulss xmm0, xmm0, dword ptr [rip + 0x781a32] ; 0x100aa8658
0x100326c26: vaddss xmm0, xmm0, dword ptr [rsp + 0x60]
0x100326c2c: vmovss dword ptr [rsp + 0x60], xmm0
0x100326c32: vmovss xmm0, dword ptr [rsp + 0x30]
0x100326c38: vmulss xmm0, xmm0, dword ptr [rip + 0x780c7c] ; 0x100aa78bc
0x100326c40: vcvttss2si rax, xmm0
0x100326c45: lea ecx, [rax + 1]
0x100326c48: mov edx, eax
0x100326c4a: shl edx, 0xd
0x100326c4d: xor edx, eax
0x100326c4f: mov esi, edx
0x100326c51: imul esi, esi
0x100326c54: imul esi, esi, 0x3d73
0x100326c5a: add esi, 0xc0ae5
0x100326c60: imul esi, edx
0x100326c63: add esi, 0x5208dd0d
0x100326c69: and esi, 0x7fffffff
0x100326c6f: vcvtsi2ss xmm1, xmm5, esi
0x100326c73: vmovss xmm2, dword ptr [rip + 0x783f3d] ; 0x100aaabb8
0x100326c7b: vmulss xmm1, xmm1, xmm2
0x100326c7f: vsubss xmm1, xmm4, xmm1
0x100326c83: vmulss xmm1, xmm1, xmm3
0x100326c87: vmovss dword ptr [rsp + 0x30], xmm1
0x100326c8d: mov edx, ecx
0x100326c8f: shl edx, 0xd
0x100326c92: xor edx, ecx
0x100326c94: mov ecx, edx
0x100326c96: imul ecx, ecx
0x100326c99: imul ecx, ecx, 0x3d73
0x100326c9f: add ecx, 0xc0ae5
0x100326ca5: imul ecx, edx
0x100326ca8: add ecx, 0x5208dd0d
0x100326cae: and ecx, 0x7fffffff
0x100326cb4: vcvtsi2ss xmm1, xmm5, ecx
0x100326cb8: vmulss xmm1, xmm1, xmm2
0x100326cbc: vsubss xmm1, xmm4, xmm1
0x100326cc0: vmulss xmm1, xmm1, xmm3
0x100326cc4: vmovss dword ptr [rsp + 0xc0], xmm1
0x100326ccd: mov eax, eax
0x100326ccf: vcvtsi2ss xmm1, xmm5, rax
0x100326cd4: vsubss xmm0, xmm0, xmm1
0x100326cd8: vmulss xmm0, xmm0, dword ptr [rip + 0x781920] ; 0x100aa8600
0x100326ce0: call 0x100aa260c ; 0x100aa260c _cosf
0x100326ce5: vmovss xmm2, dword ptr [rip + 0x77e3d3] ; 0x100aa50c0
0x100326ced: vsubss xmm0, xmm2, xmm0
0x100326cf1: vmovss xmm5, dword ptr [rip + 0x77d8bf] ; 0x100aa45b8
0x100326cf9: vmulss xmm0, xmm0, xmm5
0x100326cfd: vmulss xmm1, xmm0, dword ptr [rsp + 0xc0]
0x100326d06: vsubss xmm0, xmm2, xmm0
0x100326d0a: vmovaps xmm4, xmm2
0x100326d0e: vmulss xmm0, xmm0, dword ptr [rsp + 0x30]
0x100326d14: vaddss xmm0, xmm0, xmm1
0x100326d18: vmulss xmm0, xmm0, dword ptr [rip + 0x7889b4] ; 0x100aaf6d4
0x100326d20: vaddss xmm0, xmm0, dword ptr [rsp + 0x60]
0x100326d26: vmovss xmm1, dword ptr [rsp + 0x70]
0x100326d2c: vaddss xmm1, xmm1, xmm1
0x100326d30: vmovss xmm2, dword ptr [rsp + 0x50]
0x100326d36: vaddss xmm2, xmm2, dword ptr [rip + 0x7914c6] ; 0x100ab8204
0x100326d3e: vmulss xmm0, xmm2, xmm0
0x100326d42: vaddss xmm0, xmm1, xmm0
0x100326d46: vmovss dword ptr [rsp + 0x30], xmm0
0x100326d4c: vmovss xmm3, dword ptr [rsp + 0x10]
0x100326d52: vcvttss2si rax, xmm3
0x100326d57: lea ecx, [rax + 1]
0x100326d5a: mov edx, eax
0x100326d5c: shl edx, 0xd
0x100326d5f: xor edx, eax
0x100326d61: mov esi, edx
0x100326d63: imul esi, esi
0x100326d66: imul esi, esi, 0x3d73
0x100326d6c: add esi, 0xc0ae5
0x100326d72: imul esi, edx
0x100326d75: add esi, 0x5208dd0d
0x100326d7b: and esi, 0x7fffffff
0x100326d81: vcvtsi2ss xmm0, xmm6, esi
0x100326d85: vmovss xmm1, dword ptr [rip + 0x783e2b] ; 0x100aaabb8
0x100326d8d: vmulss xmm0, xmm0, xmm1
0x100326d91: vsubss xmm0, xmm4, xmm0
0x100326d95: vmovaps xmm2, xmm5
0x100326d99: vmulss xmm0, xmm0, xmm2
0x100326d9d: vmovss dword ptr [rsp + 0x70], xmm0
0x100326da3: mov edx, ecx
0x100326da5: shl edx, 0xd
0x100326da8: xor edx, ecx
0x100326daa: mov ecx, edx
0x100326dac: imul ecx, ecx
0x100326daf: imul ecx, ecx, 0x3d73
0x100326db5: add ecx, 0xc0ae5
0x100326dbb: imul ecx, edx
0x100326dbe: add ecx, 0x5208dd0d
0x100326dc4: and ecx, 0x7fffffff
0x100326dca: vcvtsi2ss xmm0, xmm6, ecx
0x100326dce: vmulss xmm0, xmm0, xmm1
0x100326dd2: vsubss xmm0, xmm4, xmm0
0x100326dd6: vmulss xmm0, xmm0, xmm2
0x100326dda: vmovss dword ptr [rsp + 0x50], xmm0
0x100326de0: mov eax, eax
0x100326de2: vcvtsi2ss xmm0, xmm6, rax
0x100326de7: vsubss xmm0, xmm3, xmm0
0x100326deb: vmulss xmm0, xmm0, dword ptr [rip + 0x78180d] ; 0x100aa8600
0x100326df3: call 0x100aa260c ; 0x100aa260c _cosf
0x100326df8: vmovss xmm2, dword ptr [rip + 0x77e2c0] ; 0x100aa50c0
0x100326e00: vsubss xmm0, xmm2, xmm0
0x100326e04: vmovss xmm3, dword ptr [rip + 0x77d7ac] ; 0x100aa45b8
0x100326e0c: vmulss xmm0, xmm0, xmm3
0x100326e10: vmulss xmm1, xmm0, dword ptr [rsp + 0x50]
0x100326e16: vsubss xmm0, xmm2, xmm0
0x100326e1a: vmovaps xmm4, xmm2
0x100326e1e: vmulss xmm0, xmm0, dword ptr [rsp + 0x70]
0x100326e24: vaddss xmm0, xmm0, xmm1
0x100326e28: vmovss dword ptr [rsp + 0x70], xmm0
0x100326e2e: vmovss xmm0, dword ptr [rsp + 0x10]
0x100326e34: vaddss xmm0, xmm0, xmm0
0x100326e38: vcvttss2si rax, xmm0
0x100326e3d: lea ecx, [rax + 1]
0x100326e40: mov edx, eax
0x100326e42: shl edx, 0xd
0x100326e45: xor edx, eax
0x100326e47: mov esi, edx
0x100326e49: imul esi, esi
0x100326e4c: imul esi, esi, 0x3d73
0x100326e52: add esi, 0xc0ae5
0x100326e58: imul esi, edx
0x100326e5b: add esi, 0x5208dd0d
0x100326e61: and esi, 0x7fffffff
0x100326e67: vcvtsi2ss xmm1, xmm6, esi
0x100326e6b: vmovss xmm2, dword ptr [rip + 0x783d45] ; 0x100aaabb8
0x100326e73: vmulss xmm1, xmm1, xmm2
0x100326e77: vsubss xmm1, xmm4, xmm1
0x100326e7b: vmulss xmm1, xmm1, xmm3
0x100326e7f: vmovss dword ptr [rsp + 0x50], xmm1
0x100326e85: mov edx, ecx
0x100326e87: shl edx, 0xd
0x100326e8a: xor edx, ecx
0x100326e8c: mov ecx, edx
0x100326e8e: imul ecx, ecx
0x100326e91: imul ecx, ecx, 0x3d73
0x100326e97: add ecx, 0xc0ae5
0x100326e9d: imul ecx, edx
0x100326ea0: add ecx, 0x5208dd0d
0x100326ea6: and ecx, 0x7fffffff
0x100326eac: vcvtsi2ss xmm1, xmm6, ecx
0x100326eb0: vmulss xmm1, xmm1, xmm2
0x100326eb4: vsubss xmm1, xmm4, xmm1
0x100326eb8: vmulss xmm1, xmm1, xmm3
0x100326ebc: vmovss dword ptr [rsp + 0x60], xmm1
0x100326ec2: mov eax, eax
0x100326ec4: vcvtsi2ss xmm1, xmm6, rax
0x100326ec9: vsubss xmm0, xmm0, xmm1
0x100326ecd: vmulss xmm0, xmm0, dword ptr [rip + 0x78172b] ; 0x100aa8600
0x100326ed5: call 0x100aa260c ; 0x100aa260c _cosf
0x100326eda: vmovss xmm2, dword ptr [rip + 0x77e1de] ; 0x100aa50c0
0x100326ee2: vsubss xmm0, xmm2, xmm0
0x100326ee6: vmovss xmm3, dword ptr [rip + 0x77d6ca] ; 0x100aa45b8
0x100326eee: vmulss xmm0, xmm0, xmm3
0x100326ef2: vmulss xmm1, xmm0, dword ptr [rsp + 0x60]
0x100326ef8: vsubss xmm0, xmm2, xmm0
0x100326efc: vmovaps xmm4, xmm2
0x100326f00: vmulss xmm0, xmm0, dword ptr [rsp + 0x50]
0x100326f06: vaddss xmm0, xmm0, xmm1
0x100326f0a: vmulss xmm0, xmm0, dword ptr [rip + 0x7801e2] ; 0x100aa70f4
0x100326f12: vaddss xmm0, xmm0, dword ptr [rsp + 0x70]
0x100326f18: vmovss dword ptr [rsp + 0x70], xmm0
0x100326f1e: vmovss xmm0, dword ptr [rsp + 0x10]
0x100326f24: vmulss xmm0, xmm0, dword ptr [rip + 0x780990] ; 0x100aa78bc
0x100326f2c: vcvttss2si rax, xmm0
0x100326f31: lea ecx, [rax + 1]
0x100326f34: mov edx, eax
0x100326f36: shl edx, 0xd
0x100326f39: xor edx, eax
0x100326f3b: mov esi, edx
0x100326f3d: imul esi, esi
0x100326f40: imul esi, esi, 0x3d73
0x100326f46: add esi, 0xc0ae5
0x100326f4c: imul esi, edx
0x100326f4f: add esi, 0x5208dd0d
0x100326f55: and esi, 0x7fffffff
0x100326f5b: vcvtsi2ss xmm1, xmm5, esi
0x100326f5f: vmovss xmm2, dword ptr [rip + 0x783c51] ; 0x100aaabb8
0x100326f67: vmulss xmm1, xmm1, xmm2
0x100326f6b: vsubss xmm1, xmm4, xmm1
0x100326f6f: vmulss xmm1, xmm1, xmm3
0x100326f73: vmovss dword ptr [rsp + 0x10], xmm1
0x100326f79: mov edx, ecx
0x100326f7b: shl edx, 0xd
0x100326f7e: xor edx, ecx
0x100326f80: mov ecx, edx
0x100326f82: imul ecx, ecx
0x100326f85: imul ecx, ecx, 0x3d73
0x100326f8b: add ecx, 0xc0ae5
0x100326f91: imul ecx, edx
0x100326f94: add ecx, 0x5208dd0d
0x100326f9a: and ecx, 0x7fffffff
0x100326fa0: vcvtsi2ss xmm1, xmm5, ecx
0x100326fa4: vmulss xmm1, xmm1, xmm2
0x100326fa8: vsubss xmm1, xmm4, xmm1
0x100326fac: vmulss xmm1, xmm1, xmm3
0x100326fb0: vmovss dword ptr [rsp + 0x50], xmm1
0x100326fb6: mov eax, eax
0x100326fb8: vcvtsi2ss xmm1, xmm5, rax
0x100326fbd: vsubss xmm0, xmm0, xmm1
0x100326fc1: vmulss xmm0, xmm0, dword ptr [rip + 0x781637] ; 0x100aa8600
0x100326fc9: call 0x100aa260c ; 0x100aa260c _cosf
0x100326fce: vmovss xmm3, dword ptr [rip + 0x77e0ea] ; 0x100aa50c0
0x100326fd6: vsubss xmm0, xmm3, xmm0
0x100326fda: vmovss xmm2, dword ptr [rip + 0x77d5d6] ; 0x100aa45b8
0x100326fe2: vmulss xmm0, xmm0, xmm2
0x100326fe6: vmulss xmm1, xmm0, dword ptr [rsp + 0x50]
0x100326fec: vsubss xmm0, xmm3, xmm0
0x100326ff0: vmulss xmm0, xmm0, dword ptr [rsp + 0x10]
0x100326ff6: vaddss xmm0, xmm0, xmm1
0x100326ffa: vmulss xmm0, xmm0, dword ptr [rip + 0x7859a2] ; 0x100aac9a4
0x100327002: vaddss xmm0, xmm0, dword ptr [rsp + 0x70]
0x100327008: vmulss xmm1, xmm2, dword ptr [rsp + 0x80]
0x100327011: vmovss dword ptr [rsp + 0x70], xmm1
0x100327017: vmovaps xmm4, xmm2
0x10032701b: vmulss xmm0, xmm1, xmm0
0x10032701f: vmovss dword ptr [rsp + 0x80], xmm0
0x100327028: vmovss xmm0, dword ptr [rsp + 0x40]
0x10032702e: vdivss xmm0, xmm0, dword ptr [rip + 0x7807a6] ; 0x100aa77dc
0x100327036: vcvttss2si rax, xmm0
0x10032703b: vmovaps xmm2, xmm0
0x10032703f: vmovss dword ptr [rsp + 0x10], xmm2
0x100327045: lea ecx, [rax + 1]
0x100327048: mov edx, eax
0x10032704a: shl edx, 0xd
0x10032704d: xor edx, eax
0x10032704f: mov esi, edx
0x100327051: imul esi, esi
0x100327054: imul esi, esi, 0x3d73
0x10032705a: add esi, 0xc0ae5
0x100327060: imul esi, edx
0x100327063: add esi, 0x5208dd0d
0x100327069: and esi, 0x7fffffff
0x10032706f: vcvtsi2ss xmm0, xmm5, esi
0x100327073: vmovss xmm1, dword ptr [rip + 0x783b3d] ; 0x100aaabb8
0x10032707b: vmulss xmm0, xmm0, xmm1
0x10032707f: vsubss xmm0, xmm3, xmm0
0x100327083: vmulss xmm0, xmm0, xmm4
0x100327087: vmovss dword ptr [rsp + 0x40], xmm0
0x10032708d: mov edx, ecx
0x10032708f: shl edx, 0xd
0x100327092: xor edx, ecx
0x100327094: mov ecx, edx
0x100327096: imul ecx, ecx
0x100327099: imul ecx, ecx, 0x3d73
0x10032709f: add ecx, 0xc0ae5
0x1003270a5: imul ecx, edx
0x1003270a8: add ecx, 0x5208dd0d
0x1003270ae: and ecx, 0x7fffffff
0x1003270b4: vcvtsi2ss xmm0, xmm5, ecx
0x1003270b8: vmulss xmm0, xmm0, xmm1
0x1003270bc: vsubss xmm0, xmm3, xmm0
0x1003270c0: vmulss xmm0, xmm0, xmm4
0x1003270c4: vmovss dword ptr [rsp + 0x50], xmm0
0x1003270ca: mov eax, eax
0x1003270cc: vcvtsi2ss xmm0, xmm5, rax
0x1003270d1: vsubss xmm0, xmm2, xmm0
0x1003270d5: vmulss xmm0, xmm0, dword ptr [rip + 0x781523] ; 0x100aa8600
0x1003270dd: call 0x100aa260c ; 0x100aa260c _cosf
0x1003270e2: vmovss xmm2, dword ptr [rip + 0x77dfd6] ; 0x100aa50c0
0x1003270ea: vsubss xmm0, xmm2, xmm0
0x1003270ee: vmovss xmm3, dword ptr [rip + 0x77d4c2] ; 0x100aa45b8
0x1003270f6: vmulss xmm0, xmm0, xmm3
0x1003270fa: vmulss xmm1, xmm0, dword ptr [rsp + 0x50]
0x100327100: vsubss xmm0, xmm2, xmm0
0x100327104: vmovaps xmm4, xmm2
0x100327108: vmulss xmm0, xmm0, dword ptr [rsp + 0x40]
0x10032710e: vaddss xmm0, xmm0, xmm1
0x100327112: vmovss dword ptr [rsp + 0x40], xmm0
0x100327118: vmovss xmm0, dword ptr [rsp + 0x10]
0x10032711e: vaddss xmm0, xmm0, xmm0
0x100327122: vcvttss2si rax, xmm0
0x100327127: lea ecx, [rax + 1]
0x10032712a: mov edx, eax
0x10032712c: shl edx, 0xd
0x10032712f: xor edx, eax
0x100327131: mov esi, edx
0x100327133: imul esi, esi
0x100327136: imul esi, esi, 0x3d73
0x10032713c: add esi, 0xc0ae5
0x100327142: imul esi, edx
0x100327145: add esi, 0x5208dd0d
0x10032714b: and esi, 0x7fffffff
0x100327151: vcvtsi2ss xmm1, xmm5, esi
0x100327155: vmovss xmm2, dword ptr [rip + 0x783a5b] ; 0x100aaabb8
0x10032715d: vmulss xmm1, xmm1, xmm2
0x100327161: vsubss xmm1, xmm4, xmm1
0x100327165: vmulss xmm1, xmm1, xmm3
0x100327169: vmovss dword ptr [rsp + 0x50], xmm1
0x10032716f: mov edx, ecx
0x100327171: shl edx, 0xd
0x100327174: xor edx, ecx
0x100327176: mov ecx, edx
0x100327178: imul ecx, ecx
0x10032717b: imul ecx, ecx, 0x3d73
0x100327181: add ecx, 0xc0ae5
0x100327187: imul ecx, edx
0x10032718a: add ecx, 0x5208dd0d
0x100327190: and ecx, 0x7fffffff
0x100327196: vcvtsi2ss xmm1, xmm5, ecx
0x10032719a: vmulss xmm1, xmm1, xmm2
0x10032719e: vsubss xmm1, xmm4, xmm1
0x1003271a2: vmulss xmm1, xmm1, xmm3
0x1003271a6: vmovss dword ptr [rsp + 0x60], xmm1
0x1003271ac: mov eax, eax
0x1003271ae: vcvtsi2ss xmm1, xmm5, rax
0x1003271b3: vsubss xmm0, xmm0, xmm1
0x1003271b7: vmulss xmm0, xmm0, dword ptr [rip + 0x781441] ; 0x100aa8600
0x1003271bf: call 0x100aa260c ; 0x100aa260c _cosf
0x1003271c4: vmovss xmm2, dword ptr [rip + 0x77def4] ; 0x100aa50c0
0x1003271cc: vsubss xmm0, xmm2, xmm0
0x1003271d0: vmovss xmm4, dword ptr [rip + 0x77d3e0] ; 0x100aa45b8
0x1003271d8: vmulss xmm0, xmm0, xmm4
0x1003271dc: vmulss xmm1, xmm0, dword ptr [rsp + 0x60]
0x1003271e2: vsubss xmm0, xmm2, xmm0
0x1003271e6: vmulss xmm0, xmm0, dword ptr [rsp + 0x50]
0x1003271ec: vaddss xmm0, xmm0, xmm1
0x1003271f0: vmulss xmm0, xmm0, dword ptr [rip + 0x781460] ; 0x100aa8658
0x1003271f8: vaddss xmm0, xmm0, dword ptr [rsp + 0x40]
0x1003271fe: vmovss dword ptr [rsp + 0x40], xmm0
0x100327204: vmovss xmm0, dword ptr [rsp + 0x10]
0x10032720a: vmulss xmm0, xmm0, dword ptr [rip + 0x7806aa] ; 0x100aa78bc
0x100327212: vcvttss2si rax, xmm0
0x100327217: lea ecx, [rax + 1]
0x10032721a: mov edx, eax
0x10032721c: shl edx, 0xd
0x10032721f: xor edx, eax
0x100327221: mov esi, edx
0x100327223: imul esi, esi
0x100327226: imul esi, esi, 0x3d73
0x10032722c: add esi, 0xc0ae5
0x100327232: imul esi, edx
0x100327235: add esi, 0x5208dd0d
0x10032723b: and esi, 0x7fffffff
0x100327241: vcvtsi2ss xmm1, xmm5, esi
0x100327245: vmovss xmm3, dword ptr [rip + 0x78396b] ; 0x100aaabb8
0x10032724d: vmulss xmm1, xmm1, xmm3
0x100327251: vsubss xmm1, xmm2, xmm1
0x100327255: vmovaps xmm5, xmm2
0x100327259: vmovaps xmm2, xmm4
0x10032725d: vmulss xmm1, xmm1, xmm2
0x100327261: vmovss dword ptr [rsp + 0x10], xmm1
0x100327267: mov edx, ecx
0x100327269: shl edx, 0xd
0x10032726c: xor edx, ecx
0x10032726e: mov ecx, edx
0x100327270: imul ecx, ecx
0x100327273: imul ecx, ecx, 0x3d73
0x100327279: add ecx, 0xc0ae5
0x10032727f: imul ecx, edx
0x100327282: add ecx, 0x5208dd0d
0x100327288: and ecx, 0x7fffffff
0x10032728e: vcvtsi2ss xmm1, xmm6, ecx
0x100327292: vmulss xmm1, xmm1, xmm3
0x100327296: vsubss xmm1, xmm5, xmm1
0x10032729a: vmulss xmm1, xmm1, xmm2
0x10032729e: vmovss dword ptr [rsp + 0x50], xmm1
0x1003272a4: mov eax, eax
0x1003272a6: vcvtsi2ss xmm1, xmm6, rax
0x1003272ab: vsubss xmm0, xmm0, xmm1
0x1003272af: vmulss xmm0, xmm0, dword ptr [rip + 0x781349] ; 0x100aa8600
0x1003272b7: call 0x100aa260c ; 0x100aa260c _cosf
0x1003272bc: vmovss xmm3, dword ptr [rip + 0x77ddfc] ; 0x100aa50c0
0x1003272c4: vsubss xmm0, xmm3, xmm0
0x1003272c8: vmovss xmm2, dword ptr [rip + 0x77d2e8] ; 0x100aa45b8
0x1003272d0: vmulss xmm0, xmm0, xmm2
0x1003272d4: vmulss xmm1, xmm0, dword ptr [rsp + 0x50]
0x1003272da: vsubss xmm0, xmm3, xmm0
0x1003272de: vmulss xmm0, xmm0, dword ptr [rsp + 0x10]
0x1003272e4: vaddss xmm0, xmm0, xmm1
0x1003272e8: vmulss xmm0, xmm0, dword ptr [rip + 0x7883e4] ; 0x100aaf6d4
0x1003272f0: vaddss xmm0, xmm0, dword ptr [rsp + 0x40]
0x1003272f6: vmovss xmm1, dword ptr [rsp + 0x70]
0x1003272fc: vaddss xmm1, xmm1, dword ptr [rsp + 0x80]
0x100327305: vmulss xmm0, xmm0, xmm2
0x100327309: vaddss xmm0, xmm0, xmm2
0x10032730d: vmulss xmm0, xmm1, xmm0
0x100327311: vxorps xmm1, xmm1, xmm1
0x100327315: vmaxss xmm1, xmm1, xmm0
0x100327319: vcmpunordss xmm0, xmm0, xmm0
0x10032731e: vandnps xmm0, xmm0, xmm1
0x100327322: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x100327328: vmovd xmm0, dword ptr [rsp + 0x30]
0x10032732e: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x100327333: vpshufb xmm0, xmm0, xmmword ptr [rip + 0x784bb4] ; 0x100aabef0
0x10032733c: vpermilps xmm1, xmmword ptr [rsp + 0x10], 0xc0
0x100327344: vmulps xmm0, xmm1, xmm0
0x100327348: vxorps xmm1, xmm1, xmm1
0x10032734c: vaddps xmm0, xmm0, xmm1
0x100327350: vmovaps xmmword ptr [rsp + 0x10], xmm0
0x100327356: vmovss xmm0, dword ptr [r13 + 0xc]
0x10032735c: vmulss xmm0, xmm0, dword ptr [rip + 0x7839c8] ; 0x100aaad2c
0x100327364: vzeroupper 
0x100327367: call 0x100aa2708 ; 0x100aa2708 _expf
0x10032736c: vmovss xmm1, dword ptr [rip + 0x77dd4c] ; 0x100aa50c0
0x100327374: vsubss xmm0, xmm1, xmm0
0x100327378: vxorps xmm2, xmm2, xmm2
0x10032737c: vmaxss xmm0, xmm2, xmm0
0x100327380: vminss xmm0, xmm1, xmm0
0x100327384: vsubss xmm1, xmm1, xmm0
0x100327388: vpermilps xmm1, xmm1, 0xc0
0x10032738e: vmulps xmm1, xmm1, xmmword ptr [r13 + 0x20]
0x100327394: vpermilps xmm0, xmm0, 0xc0
0x10032739a: vmulps xmm0, xmm0, xmmword ptr [rsp + 0x10]
0x1003273a0: vaddps xmm0, xmm0, xmm1
0x1003273a4: vmovaps xmmword ptr [r13 + 0x20], xmm0
0x1003273aa: vaddps xmm0, xmm0, xmmword ptr [rsp + 0x20]
0x1003273b0: vmovaps xmmword ptr [r13 + 0x30], xmm0
0x1003273b6: mov rdi, qword ptr [r14 + 0x280]
0x1003273bd: call 0x1000ff210 ; 0x1000ff210
0x1003273c2: test rax, rax
0x1003273c5: je 0x1003273ea
0x1003273c7: mov rdi, qword ptr [r14 + 0x280]
0x1003273ce: call 0x1000fc260 ; 0x1000fc260
0x1003273d3: mov rax, qword ptr [rax + 0x18]
0x1003273d7: vmovaps xmm0, xmmword ptr [rax + 0x130]
0x1003273df: vmovaps xmmword ptr [rsp + 0x380], xmm0
0x1003273e8: jmp 0x1003273fb ; 0x1003273fb
0x1003273ea: mov rsi, qword ptr [r14 + 0x70]
0x1003273ee: lea rdi, [rsp + 0x380]
0x1003273f6: call 0x10076be90 ; 0x10076be90
0x1003273fb: mov rax, qword ptr [r14 + 0x3d8]
0x100327402: xor ecx, ecx
0x100327404: cmp byte ptr [rax + 0x1391], 0
0x10032740b: sete cl
0x10032740e: lea rax, [rip + 0x794dfb] ; 0x100abc210
0x100327415: vmovss xmm0, dword ptr [rax + rcx*4]
0x10032741a: vmovss dword ptr [rsp + 0x20], xmm0
0x100327420: lea rdi, [rsp + 0x1c0]
0x100327428: lea rdx, [rsp + 0x380]
0x100327430: mov rsi, r13
0x100327433: call 0x100328200 ; 0x100328200
0x100327438: vmovss xmm0, dword ptr [rsp + 0x20]
0x10032743e: vmulss xmm0, xmm0, dword ptr [r13 + 0xc]
0x100327444: vmovaps xmm1, xmmword ptr [rsp + 0x1c0]
0x10032744d: vmulps xmm2, xmm1, xmmword ptr [rip + 0x780b6b] ; 0x100aa7fc0
0x100327455: vmulps xmm2, xmm2, xmmword ptr [rip + 0x794d33] ; 0x100abc190
0x10032745d: vpermilps xmm0, xmm0, 0xc0
0x100327463: vmulps xmm2, xmm0, xmm2
0x100327467: vmovaps xmm3, xmmword ptr [r13 + 0x80]
0x100327470: vsubps xmm2, xmm3, xmm2
0x100327474: vmovaps xmm3, xmmword ptr [r13 + 0x90]
0x10032747d: vmovaps xmm4, xmmword ptr [r13 + 0xa0]
0x100327486: vmulps xmm5, xmm1, xmmword ptr [rip + 0x7815b2] ; 0x100aa8a40
0x10032748e: vmulps xmm5, xmm5, xmmword ptr [rip + 0x794d0a] ; 0x100abc1a0
0x100327496: vmulps xmm5, xmm0, xmm5
0x10032749a: vsubps xmm3, xmm3, xmm5
0x10032749e: vmulps xmm1, xmm1, xmmword ptr [rip + 0x7864ca] ; 0x100aad970
0x1003274a6: vmulps xmm1, xmm1, xmmword ptr [rip + 0x794d02] ; 0x100abc1b0
0x1003274ae: vmulps xmm1, xmm0, xmm1
0x1003274b2: vsubps xmm1, xmm4, xmm1
0x1003274b6: vmovss xmm4, dword ptr [rip + 0x794cca] ; 0x100abc188 gfv<
0x1003274be: vmulps xmm4, xmm0, xmm4
0x1003274c2: vaddps xmm2, xmm4, xmm2
0x1003274c6: vmovaps xmmword ptr [r13 + 0x80], xmm2
0x1003274cf: vmulps xmm4, xmm0, xmmword ptr [rip + 0x794ce9] ; 0x100abc1c0
0x1003274d7: vaddps xmm3, xmm4, xmm3
0x1003274db: vmovaps xmmword ptr [r13 + 0x90], xmm3
0x1003274e4: vmulps xmm0, xmm0, xmmword ptr [rip + 0x794ce4] ; 0x100abc1d0
0x1003274ec: vaddps xmm0, xmm0, xmm1
0x1003274f0: vmovaps xmmword ptr [r13 + 0xa0], xmm0
0x1003274f9: vroundss xmm1, xmm2, xmm2, 9
0x1003274ff: vsubss xmm1, xmm2, xmm1
0x100327503: vmovss dword ptr [r13 + 0x80], xmm1
0x10032750c: vmovshdup xmm1, xmm2
0x100327510: vroundss xmm4, xmm1, xmm1, 9
0x100327516: vsubss xmm1, xmm1, xmm4
0x10032751a: vmovss dword ptr [r13 + 0x84], xmm1
0x100327523: vpermilpd xmm1, xmm2, 1
0x100327529: vroundss xmm2, xmm1, xmm1, 9
0x10032752f: vsubss xmm1, xmm1, xmm2
0x100327533: vmovss dword ptr [r13 + 0x88], xmm1
0x10032753c: vroundss xmm1, xmm3, xmm3, 9
0x100327542: vsubss xmm1, xmm3, xmm1
0x100327546: vmovss dword ptr [r13 + 0x90], xmm1
0x10032754f: vmovshdup xmm1, xmm3
0x100327553: vroundss xmm2, xmm1, xmm1, 9
0x100327559: vsubss xmm1, xmm1, xmm2
0x10032755d: vmovss dword ptr [r13 + 0x94], xmm1
0x100327566: vpermilpd xmm1, xmm3, 1
0x10032756c: vroundss xmm2, xmm1, xmm1, 9
0x100327572: vsubss xmm1, xmm1, xmm2
0x100327576: vmovss dword ptr [r13 + 0x98], xmm1
0x10032757f: vroundss xmm1, xmm0, xmm0, 9
0x100327585: vsubss xmm1, xmm0, xmm1
0x100327589: vmovss dword ptr [r13 + 0xa0], xmm1
0x100327592: vmovshdup xmm1, xmm0
0x100327596: vroundss xmm2, xmm1, xmm1, 9
0x10032759c: vsubss xmm1, xmm1, xmm2
0x1003275a0: vmovss dword ptr [r13 + 0xa4], xmm1
0x1003275a9: vpermilpd xmm0, xmm0, 1
0x1003275af: vroundss xmm1, xmm0, xmm0, 9
0x1003275b5: vsubss xmm0, xmm0, xmm1
0x1003275b9: vmovss dword ptr [r13 + 0xa8], xmm0
0x1003275c2: vxorps xmm0, xmm0, xmm0
0x1003275c6: vmovaps xmmword ptr [r13 + 0x10], xmm0
0x1003275cc: mov byte ptr [r13 + 0x50], 0
0x1003275d1: mov rax, qword ptr [rip + 0x8e6300] ; 0x100c0d8d8
0x1003275d8: mov rax, qword ptr [rax]
0x1003275db: cmp rax, qword ptr [rsp + 0x400]
0x1003275e3: jne 0x100327658
0x1003275e5: lea rsp, [rbp - 0x28]
0x1003275e9: pop rbx
0x1003275ea: pop r12
0x1003275ec: pop r13
0x1003275ee: pop r14
0x1003275f0: pop r15
0x1003275f2: pop rbp
0x1003275f3: ret 
0x1003275f4: vmovaps xmmword ptr [rsp + 0x20], xmm3
0x1003275fa: vzeroupper 
0x1003275fd: call 0x1002b9810 ; 0x1002b9810
0x100327602: lea r15, [rip + 0x1d18007] ; 0x10203f610
0x100327609: vmovss xmm0, dword ptr [rip + 0x7801df] ; 0x100aa77f0
0x100327611: mov ecx, 1
0x100327616: mov rdi, rax
0x100327619: mov rsi, rbx
0x10032761c: mov rdx, r15
0x10032761f: call 0x1002bb510 ; 0x1002bb510
0x100327624: call 0x1002b9810 ; 0x1002b9810
0x100327629: mov ecx, 1
0x10032762e: mov rdi, rax
0x100327631: mov rsi, r14
0x100327634: vmovss xmm0, dword ptr [rip + 0x7801b4] ; 0x100aa77f0
0x10032763c: mov rdx, r15
0x10032763f: call 0x1002bb510 ; 0x1002bb510
0x100327644: vmovaps xmm3, xmmword ptr [rsp + 0x20]
0x10032764a: vmovaps xmm0, xmmword ptr [rbx]
0x10032764e: vmovaps xmm1, xmmword ptr [r14]
0x100327653: jmp 0x10032660c ; 0x10032660c
0x100327658: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10032765d: lea rdi, [rip + 0x83a494] ; 0x100b61af8 ret
0x100327664: lea rsi, [rip + 0x83a2f8] ; 0x100b61963 ./Clump.h
0x10032766b: mov edx, 0x47
0x100327670: mov ecx, 3
0x100327675: call 0x1007e5f70 ; 0x1007e5f70
0x10032767a: ud2 
0x10032767c: lea rdi, [rip + 0x84cdf3] ; 0x100b74476 !isNan( quat )
0x100327683: lea rsi, [rip + 0x84cdfb] ; 0x100b74485 ./Emitter.h
0x10032768a: mov edx, 0x26
0x10032768f: mov ecx, 3
0x100327694: call 0x1007e5f70 ; 0x1007e5f70
0x100327699: ud2 
0x10032769b: nop dword ptr [rax + rax]
