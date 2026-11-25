0x100149c40: push rbp
0x100149c41: mov rbp, rsp
0x100149c44: push r15
0x100149c46: push r14
0x100149c48: push r13
0x100149c4a: push r12
0x100149c4c: push rbx
0x100149c4d: sub rsp, 0x3c8
0x100149c54: mov rbx, rsi
0x100149c57: mov r14, rdi
0x100149c5a: mov rax, qword ptr [rip + 0xac3c77] ; 0x100c0d8d8
0x100149c61: mov rax, qword ptr [rax]
0x100149c64: mov qword ptr [rbp - 0x30], rax
0x100149c68: mov rdi, qword ptr [rbx + 0x280]
0x100149c6f: test rdi, rdi
0x100149c72: je 0x10014a462
0x100149c78: call 0x1000ff210 ; 0x1000ff210
0x100149c7d: test rax, rax
0x100149c80: je 0x10014a462
0x100149c86: cmp byte ptr [r14 + 0x48], 0
0x100149c8b: je 0x100149cdd
0x100149c8d: mov rax, qword ptr [rbx + 0x310]
0x100149c94: cmp byte ptr [rax + 0x48e1], 0
0x100149c9b: jne 0x10014a45a
0x100149ca1: mov rax, qword ptr [rbx + 0x3f8]
0x100149ca8: cmp byte ptr [rax + 0x71e], 0
0x100149caf: jne 0x10014a45a
0x100149cb5: mov rax, qword ptr [rbx + 0x400]
0x100149cbc: cmp byte ptr [rax + 0x3430], 0
0x100149cc3: jne 0x10014a45a
0x100149cc9: mov rax, qword ptr [rbx + 0x478]
0x100149cd0: cmp byte ptr [rax + 0x167], 0
0x100149cd7: jne 0x10014a45a
0x100149cdd: mov rdi, qword ptr [rbx + 0x280]
0x100149ce4: call 0x1000fc260 ; 0x1000fc260
0x100149ce9: mov r12, rax
0x100149cec: mov rax, qword ptr [r12 + 0x18]
0x100149cf1: mov qword ptr [rbp - 0x260], rax
0x100149cf8: mov rax, qword ptr [rbx + 0x138]
0x100149cff: mov qword ptr [rbp - 0x268], rax
0x100149d06: cmp byte ptr [r14 + 0x4a], 0
0x100149d0b: je 0x100149d17
0x100149d0d: mov rdi, qword ptr [r12 + 0x50]
0x100149d12: call 0x10035dda0 ; 0x10035dda0
0x100149d17: cmp byte ptr [r14 + 0x4b], 0
0x100149d1c: je 0x100149d2c
0x100149d1e: mov rax, qword ptr [r12 + 0x18]
0x100149d23: vxorps xmm0, xmm0, xmm0
0x100149d27: vmovaps xmmword ptr [rax + 0x50], xmm0
0x100149d2c: cmp qword ptr [r14 + 0x40], 0
0x100149d31: mov qword ptr [rbp - 0x278], rbx
0x100149d38: je 0x100149e95
0x100149d3e: mov rsi, qword ptr [r14 + 0x38]
0x100149d42: mov rax, qword ptr [rsi]
0x100149d45: lea rbx, [rbp - 0x3f0]
0x100149d4c: mov rdi, rbx
0x100149d4f: call qword ptr [rax + 0x18]
0x100149d52: mov rsi, qword ptr [r14 + 0x40]
0x100149d56: mov rax, qword ptr [rsi]
0x100149d59: lea r15, [rbp - 0x2c0]
0x100149d60: mov rdi, r15
0x100149d63: call qword ptr [rax + 0x18]
0x100149d66: lea r13, [rbp - 0x300]
0x100149d6d: mov rdi, r13
0x100149d70: mov rsi, r15
0x100149d73: call 0x100076940 ; 0x100076940
0x100149d78: lea rdi, [rbp - 0x220]
0x100149d7f: mov rsi, rbx
0x100149d82: mov rdx, r13
0x100149d85: call 0x100076df0 ; 0x100076df0
0x100149d8a: mov rbx, qword ptr [rbp - 0x260]
0x100149d91: vmovaps xmm0, xmmword ptr [rbx + 0x10]
0x100149d96: vpermilps xmm1, xmm0, 0
0x100149d9c: vmulps xmm1, xmm1, xmmword ptr [rbp - 0x220]
0x100149da4: vpermilps xmm2, xmm0, 0x55
0x100149daa: vmulps xmm2, xmm2, xmmword ptr [rbp - 0x210]
0x100149db2: vaddps xmm1, xmm1, xmm2
0x100149db6: vpermilps xmm0, xmm0, 0xaa
0x100149dbc: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x200]
0x100149dc4: vaddps xmm0, xmm1, xmm0
0x100149dc8: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x1f0]
0x100149dd0: vmovaps xmmword ptr [rbp - 0x300], xmm0
0x100149dd8: lea rsi, [rbp - 0x300]
0x100149ddf: xor edx, edx
0x100149de1: mov rdi, r12
0x100149de4: call 0x100100fb0 ; 0x100100fb0
0x100149de9: vmovaps xmm0, xmmword ptr [rbx + 0x60]
0x100149dee: vpermilps xmm1, xmm0, 0xc0
0x100149df4: vmulps xmm1, xmm1, xmmword ptr [rbp - 0x220]
0x100149dfc: vpermilps xmm2, xmm0, 0xd5
0x100149e02: vmulps xmm2, xmm2, xmmword ptr [rbp - 0x210]
0x100149e0a: vaddps xmm1, xmm2, xmm1
0x100149e0e: vpermilps xmm0, xmm0, 0xea
0x100149e14: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x200]
0x100149e1c: vaddps xmm0, xmm0, xmm1
0x100149e20: vmovaps xmmword ptr [rbp - 0x230], xmm0
0x100149e28: vxorps xmm0, xmm0, xmm0
0x100149e2c: vmovlps qword ptr [rbp - 0x240], xmm0
0x100149e34: mov dword ptr [rbp - 0x238], 0
0x100149e3e: mov rax, qword ptr [rip + 0x95e25b] ; 0x100aa80a0
0x100149e45: mov qword ptr [rbp - 0x250], rax
0x100149e4c: mov dword ptr [rbp - 0x248], 0
0x100149e56: lea rdi, [rbp - 0x2c0]
0x100149e5d: lea rsi, [rbp - 0x230]
0x100149e64: lea rdx, [rbp - 0x240]
0x100149e6b: lea rcx, [rbp - 0x250]
0x100149e72: call 0x100146d00 ; 0x100146d00
0x100149e77: vmovapd xmm0, xmmword ptr [rbp - 0x2c0]
0x100149e7f: vmovapd xmmword ptr [rbx + 0x30], xmm0
0x100149e84: vmovapd xmmword ptr [rbx + 0x40], xmm0
0x100149e89: mov byte ptr [rbx + 0x121], 1
0x100149e90: jmp 0x10014a448 ; 0x10014a448
0x100149e95: mov qword ptr [rbp - 0x258], r12
0x100149e9c: mov rsi, qword ptr [r14 + 0x38]
0x100149ea0: vmovaps xmm0, xmmword ptr [rsi + 0x10]
0x100149ea5: vmovaps xmmword ptr [rbp - 0x230], xmm0
0x100149ead: mov rax, qword ptr [rsi]
0x100149eb0: lea r15, [rbp - 0x3b0]
0x100149eb7: mov rdi, r15
0x100149eba: call qword ptr [rax + 0x18]
0x100149ebd: mov rsi, qword ptr [r14 + 0x38]
0x100149ec1: mov rax, qword ptr [rsi]
0x100149ec4: lea r12, [rbp - 0x220]
0x100149ecb: mov rdi, r12
0x100149ece: call qword ptr [rax + 0x20]
0x100149ed1: lea rdi, [rbp - 0x300]
0x100149ed8: mov rsi, r15
0x100149edb: mov rdx, r12
0x100149ede: call 0x100076df0 ; 0x100076df0
0x100149ee3: cmp byte ptr [r14 + 0x49], 0
0x100149ee8: mov qword ptr [rbp - 0x270], r14
0x100149eef: je 0x10014a1b2
0x100149ef5: mov ebx, 1
0x100149efa: lea r12, [rbp - 0x370]
0x100149f01: lea r14, [rbp - 0x220]
0x100149f08: nop dword ptr [rax + rax]
0x100149f10: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100149f15: vcvtsi2ss xmm0, xmm4, eax
0x100149f19: vmovss xmm1, dword ptr [rip + 0x95d1cf] ; 0x100aa70f0
0x100149f21: vmulss xmm0, xmm0, xmm1
0x100149f25: vmovaps xmmword ptr [rbp - 0x330], xmm0
0x100149f2d: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100149f32: vcvtsi2ss xmm0, xmm4, eax
0x100149f36: vmulss xmm0, xmm0, dword ptr [rip + 0x95d1b2] ; 0x100aa70f0
0x100149f3e: vmovaps xmmword ptr [rbp - 0x320], xmm0
0x100149f46: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100149f4b: vcvtsi2ss xmm0, xmm4, eax
0x100149f4f: vmulss xmm0, xmm0, dword ptr [rip + 0x95d199] ; 0x100aa70f0
0x100149f57: vmovaps xmm1, xmmword ptr [rbp - 0x330]
0x100149f5f: vinsertps xmm1, xmm1, dword ptr [rbp - 0x320], 0x10
0x100149f69: vinsertps xmm0, xmm1, xmm0, 0x20
0x100149f6f: vmulps xmm0, xmm0, xmmword ptr [rip + 0x95f729] ; 0x100aa96a0
0x100149f77: vaddps xmm0, xmm0, xmmword ptr [rip + 0x961fe1] ; 0x100aabf60
0x100149f7f: vpermilps xmm1, xmm0, 0
0x100149f85: vmulps xmm1, xmm1, xmmword ptr [rbp - 0x300]
0x100149f8d: vpermilps xmm2, xmm0, 0x55
0x100149f93: vmulps xmm2, xmm2, xmmword ptr [rbp - 0x2f0]
0x100149f9b: vaddps xmm1, xmm1, xmm2
0x100149f9f: vpermilps xmm0, xmm0, 0xaa
0x100149fa5: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x2e0]
0x100149fad: vaddps xmm0, xmm0, xmm1
0x100149fb1: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x2d0]
0x100149fb9: vmovaps xmmword ptr [rbp - 0x240], xmm0
0x100149fc1: vmovaps xmmword ptr [rbp - 0x360], xmm0
0x100149fc9: vsubps xmm0, xmm0, xmmword ptr [rip + 0x961f9f] ; 0x100aabf70
0x100149fd1: vmovaps xmmword ptr [rbp - 0x350], xmm0
0x100149fd9: xor r9d, r9d
0x100149fdc: lea rdi, [rbp - 0x360]
0x100149fe3: lea rsi, [rbp - 0x350]
0x100149fea: lea rdx, [rbp - 0x300]
0x100149ff1: lea rcx, [rbp - 0x250]
0x100149ff8: mov r8, r12
0x100149ffb: call 0x10078dd30 ; 0x10078dd30
0x10014a000: mov r13b, 1
0x10014a003: test al, al
0x10014a005: je 0x10014a193
0x10014a00b: vmovss xmm0, dword ptr [rbp - 0x23c]
0x10014a013: vsubss xmm0, xmm0, dword ptr [rbp - 0x24c]
0x10014a01b: mov byte ptr [rbp - 0x2b8], 1
0x10014a022: lea rax, [rbp - 0x2b0]
0x10014a029: vxorps xmm1, xmm1, xmm1
0x10014a02d: vmovups xmmword ptr [rax], xmm1
0x10014a031: movabs rax, 0xffffffef00000001
0x10014a03b: mov qword ptr [rbp - 0x2c0], rax
0x10014a042: vmovaps xmm1, xmmword ptr [rip + 0x95f296] ; 0x100aa92e0
0x10014a04a: vmovaps xmmword ptr [rbp - 0x340], xmm1
0x10014a052: mov rdi, qword ptr [rbp - 0x268]
0x10014a059: lea rsi, [rbp - 0x240]
0x10014a060: lea rdx, [rbp - 0x340]
0x10014a067: lea rcx, [rbp - 0x2c0]
0x10014a06e: mov r15, r14
0x10014a071: mov r8, r15
0x10014a074: call 0x100776a90 ; 0x100776a90
0x10014a079: test al, al
0x10014a07b: je 0x10014a190
0x10014a081: mov esi, 0x50
0x10014a086: mov rdi, r15
0x10014a089: call 0x10022ddd0 ; 0x10022ddd0
0x10014a08e: vucomiss xmm0, dword ptr [rip + 0x95e5c6] ; 0x100aa865c
0x10014a096: ja 0x10014a193
0x10014a09c: vmovaps xmm0, xmmword ptr [rip + 0x95dffc] ; 0x100aa80a0
0x10014a0a4: vmovaps xmm3, xmmword ptr [rbp - 0x310]
0x10014a0ac: vinsertps xmm3, xmm0, xmm3, 0xf5
0x10014a0b2: vmovaps xmm0, xmmword ptr [rbp - 0x210]
0x10014a0ba: vmulps xmm1, xmm3, xmm3
0x10014a0be: vmovshdup xmm2, xmm1
0x10014a0c2: vaddss xmm2, xmm1, xmm2
0x10014a0c6: vpermilpd xmm1, xmm1, 1
0x10014a0cc: vaddss xmm1, xmm1, xmm2
0x10014a0d0: vsqrtss xmm2, xmm1, xmm1
0x10014a0d4: vucomiss xmm2, dword ptr [rip + 0x95d7e8] ; 0x100aa78c4
0x10014a0dc: vmovaps xmmword ptr [rbp - 0x310], xmm3
0x10014a0e4: vmovaps xmm1, xmm3
0x10014a0e8: jbe 0x10014a0fc
0x10014a0ea: vpermilps xmm1, xmm2, 0xc0
0x10014a0f0: vmovaps xmm2, xmmword ptr [rip + 0x95dfa8] ; 0x100aa80a0
0x10014a0f8: vdivps xmm1, xmm2, xmm1
0x10014a0fc: vmulps xmm2, xmm0, xmm0
0x10014a100: vmovshdup xmm3, xmm2
0x10014a104: vaddss xmm3, xmm2, xmm3
0x10014a108: vpermilpd xmm2, xmm2, 1
0x10014a10e: vaddss xmm2, xmm2, xmm3
0x10014a112: vsqrtss xmm2, xmm2, xmm2
0x10014a116: vucomiss xmm2, dword ptr [rip + 0x95d7a6] ; 0x100aa78c4
0x10014a11e: jbe 0x10014a12a
0x10014a120: vpermilps xmm2, xmm2, 0xc0
0x10014a126: vdivps xmm0, xmm0, xmm2
0x10014a12a: vmulps xmm0, xmm1, xmm0
0x10014a12e: vmovshdup xmm1, xmm0
0x10014a132: vaddss xmm1, xmm0, xmm1
0x10014a136: vpermilpd xmm0, xmm0, 1
0x10014a13c: vaddss xmm0, xmm0, xmm1
0x10014a140: vmovss xmm1, dword ptr [rip + 0x95af7c] ; 0x100aa50c4
0x10014a148: vmaxss xmm0, xmm1, xmm0
0x10014a14c: vmovss xmm1, dword ptr [rip + 0x95af6c] ; 0x100aa50c0
0x10014a154: vminss xmm0, xmm1, xmm0
0x10014a158: call 0x100aa2576 ; 0x100aa2576 _acosf
0x10014a15d: vmovss xmm1, dword ptr [rip + 0x961df7] ; 0x100aabf5c
0x10014a165: vucomiss xmm1, xmm0
0x10014a169: jbe 0x10014a193
0x10014a16b: vmovaps xmm0, xmmword ptr [rbp - 0x220]
0x10014a173: vmovaps xmmword ptr [rbp - 0x230], xmm0
0x10014a17b: xor r13d, r13d
0x10014a17e: test r13b, r13b
0x10014a181: jne 0x10014a19c
0x10014a183: jmp 0x10014a23c ; 0x10014a23c
0x10014a188: nop dword ptr [rax + rax]
0x10014a190: mov r14, r15
0x10014a193: test r13b, r13b
0x10014a196: je 0x10014a23c
0x10014a19c: lea eax, [rbx + 1]
0x10014a19f: cmp ebx, 0x3e8
0x10014a1a5: mov ebx, eax
0x10014a1a7: jb 0x100149f10
0x10014a1ad: jmp 0x10014a23c ; 0x10014a23c
0x10014a1b2: cmp byte ptr [r14 + 0x4c], 0
0x10014a1b7: je 0x10014a22b
0x10014a1b9: mov rsi, qword ptr [r14 + 0x38]
0x10014a1bd: vmovaps xmm0, xmmword ptr [rip + 0x95f11b] ; 0x100aa92e0
0x10014a1c5: vmovaps xmmword ptr [rbp - 0x2c0], xmm0
0x10014a1cd: vmovss xmm0, dword ptr [rsi + 0x14]
0x10014a1d2: add rsi, 0x10
0x10014a1d6: mov rax, qword ptr [rbp - 0x258]
0x10014a1dd: mov rax, qword ptr [rax + 0x20]
0x10014a1e1: vaddss xmm0, xmm0, dword ptr [rax + 0x34]
0x10014a1e6: lea rdx, [rbp - 0x2c0]
0x10014a1ed: lea r8, [rbp - 0x220]
0x10014a1f4: xor ecx, ecx
0x10014a1f6: mov rdi, qword ptr [rbp - 0x268]
0x10014a1fd: call 0x100776a90 ; 0x100776a90
0x10014a202: test al, al
0x10014a204: je 0x10014a23c
0x10014a206: lea rdi, [rbp - 0x220]
0x10014a20d: mov esi, 0x50
0x10014a212: call 0x10022ddd0 ; 0x10022ddd0
0x10014a217: vucomiss xmm0, dword ptr [rip + 0x95e43d] ; 0x100aa865c
0x10014a21f: ja 0x10014a23c
0x10014a221: vmovaps xmm0, xmmword ptr [rbp - 0x220]
0x10014a229: jmp 0x10014a234 ; 0x10014a234
0x10014a22b: mov rax, qword ptr [r14 + 0x38]
0x10014a22f: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x10014a234: vmovaps xmmword ptr [rbp - 0x230], xmm0
0x10014a23c: lea rsi, [rbp - 0x230]
0x10014a243: xor edx, edx
0x10014a245: mov rdi, qword ptr [rbp - 0x258]
0x10014a24c: call 0x100100fb0 ; 0x100100fb0
0x10014a251: mov r14, qword ptr [rbp - 0x270]
0x10014a258: mov rsi, qword ptr [r14 + 0x38]
0x10014a25c: lea rbx, [rbp - 0x2c0]
0x10014a263: mov rdi, rbx
0x10014a266: call 0x10043d900 ; 0x10043d900
0x10014a26b: vxorps xmm0, xmm0, xmm0
0x10014a26f: vmovlps qword ptr [rbp - 0x240], xmm0
0x10014a277: mov dword ptr [rbp - 0x238], 0
0x10014a281: mov rax, qword ptr [rip + 0x95de18] ; 0x100aa80a0
0x10014a288: mov qword ptr [rbp - 0x250], rax
0x10014a28f: mov dword ptr [rbp - 0x248], 0
0x10014a299: lea rdi, [rbp - 0x220]
0x10014a2a0: lea rdx, [rbp - 0x240]
0x10014a2a7: lea rcx, [rbp - 0x250]
0x10014a2ae: mov rsi, rbx
0x10014a2b1: call 0x100146d00 ; 0x100146d00
0x10014a2b6: vmovaps xmm0, xmmword ptr [rbp - 0x220]
0x10014a2be: mov rax, qword ptr [rbp - 0x260]
0x10014a2c5: vmovaps xmmword ptr [rax + 0x30], xmm0
0x10014a2ca: vmovaps xmmword ptr [rax + 0x40], xmm0
0x10014a2cf: mov byte ptr [rax + 0x121], 1
0x10014a2d6: lea rdi, [rbp - 0xd0]
0x10014a2dd: lea r13, [rbp - 0x218]
0x10014a2e4: mov rax, qword ptr [rip + 0xac0235] ; 0x100c0a520
0x10014a2eb: lea rcx, [rax + 0x18]
0x10014a2ef: mov qword ptr [rbp - 0x220], rcx
0x10014a2f6: add rax, 0x40
0x10014a2fa: mov qword ptr [rbp - 0xd0], rax
0x10014a301: mov rsi, r13
0x10014a304: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x10014a309: mov qword ptr [rbp - 0x48], 0
0x10014a311: mov dword ptr [rbp - 0x40], 0xffffffff
0x10014a318: mov rbx, qword ptr [rip + 0xac32a9] ; 0x100c0d5c8
0x10014a31f: lea r15, [rbx + 0x18]
0x10014a323: mov qword ptr [rbp - 0x220], r15
0x10014a32a: add rbx, 0x40
0x10014a32e: mov qword ptr [rbp - 0xd0], rbx
0x10014a335: lea rsi, [rip + 0xa2afe8] ; 0x100b75324 AvatarSetPos
0x10014a33c: mov edx, 2
0x10014a341: mov rdi, r13
0x10014a344: call 0x1007a56a0 ; 0x1007a56a0
0x10014a349: lea rsi, [rip + 0xa2b1e4] ; 0x100b75534 Starting avatar at 
0x10014a350: lea rdi, [rbp - 0x220]
0x10014a357: mov edx, 0x13
0x10014a35c: call 0x100011930 ; 0x100011930
0x10014a361: mov rcx, qword ptr [rax]
0x10014a364: mov rdx, qword ptr [rcx - 0x18]
0x10014a368: mov esi, 0xfffffefb
0x10014a36d: and esi, dword ptr [rax + rdx + 8]
0x10014a371: or esi, 4
0x10014a374: mov dword ptr [rax + rdx + 8], esi
0x10014a378: mov rcx, qword ptr [rcx - 0x18]
0x10014a37c: mov qword ptr [rax + rcx + 0x10], 3
0x10014a385: lea rsi, [rip + 0xa29011] ; 0x100b7339d (
0x10014a38c: mov edx, 1
0x10014a391: mov rdi, rax
0x10014a394: call 0x100011930 ; 0x100011930
0x10014a399: vmovss xmm0, dword ptr [rbp - 0x230]
0x10014a3a1: mov rdi, rax
0x10014a3a4: call 0x100aa23d2 ; 0x100aa23d2 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEf
0x10014a3a9: lea rsi, [rip + 0xa164fa] ; 0x100b608aa , 
0x10014a3b0: mov edx, 2
0x10014a3b5: mov rdi, rax
0x10014a3b8: call 0x100011930 ; 0x100011930
0x10014a3bd: vmovss xmm0, dword ptr [rbp - 0x22c]
0x10014a3c5: vpermilps xmm0, xmm0, 0
0x10014a3cb: mov rdi, rax
0x10014a3ce: call 0x100aa23d2 ; 0x100aa23d2 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEf
0x10014a3d3: lea rsi, [rip + 0xa164d0] ; 0x100b608aa , 
0x10014a3da: mov edx, 2
0x10014a3df: mov rdi, rax
0x10014a3e2: call 0x100011930 ; 0x100011930
0x10014a3e7: vmovsd xmm0, qword ptr [rbp - 0x228]
0x10014a3ef: vmovddup xmm0, xmm0
0x10014a3f3: mov rdi, rax
0x10014a3f6: call 0x100aa23d2 ; 0x100aa23d2 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEf
0x10014a3fb: lea rsi, [rip + 0xa12692] ; 0x100b5ca94 )
0x10014a402: mov edx, 1
0x10014a407: mov rdi, rax
0x10014a40a: call 0x100011930 ; 0x100011930
0x10014a40f: mov qword ptr [rbp - 0x220], r15
0x10014a416: mov qword ptr [rbp - 0xd0], rbx
0x10014a41d: mov rdi, r13
0x10014a420: call 0x1007a58d0 ; 0x1007a58d0
0x10014a425: mov rsi, qword ptr [rip + 0xac0154] ; 0x100c0a580
0x10014a42c: add rsi, 8
0x10014a430: lea rdi, [rbp - 0x220]
0x10014a437: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10014a43c: lea rdi, [rbp - 0xd0]
0x10014a443: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10014a448: mov rax, qword ptr [rbp - 0x278]
0x10014a44f: mov rax, qword ptr [rax + 0x280]
0x10014a456: mov byte ptr [rax + 0xc], 1
0x10014a45a: mov rdi, r14
0x10014a45d: call 0x10032ef60 ; 0x10032ef60
0x10014a462: mov rax, qword ptr [rip + 0xac346f] ; 0x100c0d8d8
0x10014a469: mov rax, qword ptr [rax]
0x10014a46c: cmp rax, qword ptr [rbp - 0x30]
0x10014a470: jne 0x10014a484
0x10014a472: add rsp, 0x3c8
0x10014a479: pop rbx
0x10014a47a: pop r12
0x10014a47c: pop r13
0x10014a47e: pop r14
0x10014a480: pop r15
0x10014a482: pop rbp
0x10014a483: ret 
0x10014a484: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10014a489: mov r14, rax
0x10014a48c: jmp 0x10014a4ac ; 0x10014a4ac
0x10014a48e: mov r14, rax
0x10014a491: jmp 0x10014a4c3 ; 0x10014a4c3
0x10014a493: mov r14, rax
0x10014a496: mov qword ptr [rbp - 0x220], r15
0x10014a49d: mov qword ptr [rbp - 0xd0], rbx
0x10014a4a4: mov rdi, r13
0x10014a4a7: call 0x1007a58d0 ; 0x1007a58d0
0x10014a4ac: mov rsi, qword ptr [rip + 0xac00cd] ; 0x100c0a580
0x10014a4b3: add rsi, 8
0x10014a4b7: lea rdi, [rbp - 0x220]
0x10014a4be: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10014a4c3: lea rdi, [rbp - 0xd0]
0x10014a4ca: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10014a4cf: mov rdi, r14
0x10014a4d2: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10014a4d7: nop word ptr [rax + rax]
