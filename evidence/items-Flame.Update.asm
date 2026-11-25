0x10033c010: push rbp
0x10033c011: mov rbp, rsp
0x10033c014: push r15
0x10033c016: push r14
0x10033c018: push r12
0x10033c01a: push rbx
0x10033c01b: and rsp, 0xffffffffffffffe0
0x10033c01f: sub rsp, 0x320
0x10033c026: mov r14, rdx
0x10033c029: vmovaps xmm3, xmm0
0x10033c02d: mov r15, rsi
0x10033c030: mov rbx, rdi
0x10033c033: mov rax, qword ptr [rip + 0x8d189e] ; 0x100c0d8d8
0x10033c03a: mov rax, qword ptr [rax]
0x10033c03d: mov qword ptr [rsp + 0x308], rax
0x10033c045: vmovaps xmm4, xmmword ptr [rbx + 0xc0]
0x10033c04d: vsubps xmm0, xmm4, xmmword ptr [rbx + 0xd0]
0x10033c055: mov rax, qword ptr [r14 + 0x160]
0x10033c05c: vmovss xmm1, dword ptr [rax + 0x18]
0x10033c061: lea rcx, [rip + 0x1cbf068] ; 0x101ffb0d0
0x10033c068: cmp byte ptr [rcx], 0
0x10033c06b: vmovss xmm2, dword ptr [rip + 0x76904d] ; 0x100aa50c0
0x10033c073: je 0x10033c080
0x10033c075: lea rcx, [rip + 0x97c4c4] ; 0x100cb8540
0x10033c07c: vmovss xmm2, dword ptr [rcx]
0x10033c080: vmulss xmm2, xmm2, dword ptr [rax + 0x20]
0x10033c085: vmulss xmm1, xmm1, xmm2
0x10033c089: vmovss xmm2, dword ptr [rip + 0x76aa0b] ; 0x100aa6a9c
0x10033c091: vmaxss xmm1, xmm2, xmm1
0x10033c095: vmovss xmm2, dword ptr [rip + 0x76aa03] ; 0x100aa6aa0
0x10033c09d: vminss xmm1, xmm2, xmm1
0x10033c0a1: vpermilps xmm1, xmm1, 0xc0
0x10033c0a7: vdivps xmm0, xmm0, xmm1
0x10033c0ab: vmovaps xmmword ptr [rsp + 0x20], xmm0
0x10033c0b1: vmovaps xmmword ptr [rbx + 0xe0], xmm0
0x10033c0b9: vmovaps xmmword ptr [rbx + 0xd0], xmm4
0x10033c0c1: vmulss xmm0, xmm3, dword ptr [rip + 0x77089f] ; 0x100aac968
0x10033c0c9: vmovss dword ptr [rsp + 0x1c], xmm3
0x10033c0cf: vmovaps xmmword ptr [rsp + 0x40], xmm4
0x10033c0d5: call 0x100aa2708 ; 0x100aa2708 _expf
0x10033c0da: vmovss xmm1, dword ptr [rip + 0x768fde] ; 0x100aa50c0
0x10033c0e2: vmovaps xmm3, xmm1
0x10033c0e6: vsubss xmm0, xmm3, xmm0
0x10033c0ea: vxorps xmm1, xmm1, xmm1
0x10033c0ee: vmaxss xmm0, xmm1, xmm0
0x10033c0f2: vminss xmm0, xmm3, xmm0
0x10033c0f6: vsubss xmm1, xmm3, xmm0
0x10033c0fa: vpermilps xmm1, xmm1, 0xc0
0x10033c100: vmulps xmm1, xmm1, xmmword ptr [rbx + 0xf0]
0x10033c108: vpermilps xmm0, xmm0, 0xc0
0x10033c10e: vmovaps xmm2, xmmword ptr [rsp + 0x40]
0x10033c114: vmulps xmm0, xmm2, xmm0
0x10033c118: vaddps xmm0, xmm0, xmm1
0x10033c11c: vsubps xmm0, xmm0, xmm2
0x10033c120: vmovaps xmm4, xmm2
0x10033c124: vmulps xmm1, xmm0, xmm0
0x10033c128: vmovshdup xmm2, xmm1
0x10033c12c: vaddss xmm2, xmm1, xmm2
0x10033c130: vpermilpd xmm1, xmm1, 1
0x10033c136: vaddss xmm1, xmm1, xmm2
0x10033c13a: vsqrtss xmm1, xmm1, xmm1
0x10033c13e: vmovss xmm5, dword ptr [rip + 0x76a956] ; 0x100aa6a9c
0x10033c146: vmaxss xmm2, xmm5, xmm1
0x10033c14a: vcmpunordss xmm1, xmm1, xmm1
0x10033c14f: vandnps xmm2, xmm1, xmm2
0x10033c153: vandps xmm1, xmm1, xmm5
0x10033c157: vorps xmm1, xmm2, xmm1
0x10033c15b: vmovss xmm2, dword ptr [rip + 0x76af91] ; 0x100aa70f4
0x10033c163: vdivss xmm1, xmm2, xmm1
0x10033c167: vminss xmm2, xmm3, xmm1
0x10033c16b: vcmpunordss xmm1, xmm1, xmm1
0x10033c170: vandnps xmm2, xmm1, xmm2
0x10033c174: vandps xmm1, xmm1, xmm3
0x10033c178: vorps xmm1, xmm2, xmm1
0x10033c17c: vpermilps xmm1, xmm1, 0xc0
0x10033c182: vmulps xmm0, xmm1, xmm0
0x10033c186: vaddps xmm0, xmm4, xmm0
0x10033c18a: vmovaps xmmword ptr [rbx + 0xf0], xmm0
0x10033c192: cmp byte ptr [rbx + 0xb4], 0
0x10033c199: je 0x10033c36f
0x10033c19f: vmovss xmm0, dword ptr [rbx + 0x110]
0x10033c1a7: vmovss dword ptr [rsp + 0x40], xmm0
0x10033c1ad: vmovss xmm1, dword ptr [rip + 0x78069f] ; 0x100abc854
0x10033c1b5: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x10033c1ba: vmovss dword ptr [rsp + 0x3c], xmm0
0x10033c1c0: vmovss xmm3, dword ptr [rip + 0x76c3e8] ; 0x100aa85b0
0x10033c1c8: vmovss xmm0, dword ptr [rbx + 0x108]
0x10033c1d0: vmovss xmm4, dword ptr [rbx + 0x10c]
0x10033c1d8: vmovss dword ptr [rsp + 0x38], xmm4
0x10033c1de: vcmpunordss xmm1, xmm0, xmm0
0x10033c1e3: vandps xmm2, xmm1, xmm3
0x10033c1e7: vmaxss xmm0, xmm3, xmm0
0x10033c1eb: vandnps xmm0, xmm1, xmm0
0x10033c1ef: vorps xmm0, xmm0, xmm2
0x10033c1f3: vmulss xmm1, xmm4, dword ptr [rip + 0x76aef9] ; 0x100aa70f4
0x10033c1fb: vaddss xmm1, xmm1, dword ptr [rip + 0x768ebd] ; 0x100aa50c0
0x10033c203: vmulss xmm0, xmm0, xmm1
0x10033c207: vmovss xmm1, dword ptr [rip + 0x76b5e1] ; 0x100aa77f0
0x10033c20f: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x10033c214: vmovss xmm5, dword ptr [rip + 0x768ea4] ; 0x100aa50c0
0x10033c21c: vmovss xmm3, dword ptr [rsp + 0x1c]
0x10033c222: vmovss xmm1, dword ptr [rsp + 0x38]
0x10033c228: vsubss xmm1, xmm1, xmm3
0x10033c22c: vxorps xmm2, xmm2, xmm2
0x10033c230: vmaxss xmm1, xmm2, xmm1
0x10033c234: vmovss xmm2, dword ptr [rip + 0x76a870] ; 0x100aa6aac
0x10033c23c: vminss xmm1, xmm2, xmm1
0x10033c240: cmp byte ptr [rbx + 0x138], 0
0x10033c247: sete al
0x10033c24a: vucomiss xmm1, xmm5
0x10033c24e: setnp dl
0x10033c251: sete cl
0x10033c254: vucomiss xmm1, xmm5
0x10033c258: vmovss xmm2, dword ptr [rsp + 0x3c]
0x10033c25e: vmovss dword ptr [rbx + 0x114], xmm2
0x10033c266: vmulss xmm0, xmm0, dword ptr [rsp + 0x40]
0x10033c26c: vmulss xmm0, xmm0, dword ptr [rip + 0x771368] ; 0x100aad5dc
0x10033c274: lea rsi, [rip + 0x78561d] ; 0x100ac1898
0x10033c27b: vmovss xmm2, dword ptr [rsi]
0x10033c27f: vmovss dword ptr [rsp + 0x40], xmm2
0x10033c285: vdivss xmm0, xmm0, xmm2
0x10033c289: vsqrtss xmm0, xmm0, xmm0
0x10033c28d: vmovss dword ptr [rbx + 0x118], xmm0
0x10033c295: vmovss dword ptr [rbx + 0x10c], xmm1
0x10033c29d: vmovaps xmm4, xmm3
0x10033c2a1: jne 0x10033c2ab
0x10033c2a3: jp 0x10033c2ab
0x10033c2a5: and cl, dl
0x10033c2a7: and al, cl
0x10033c2a9: je 0x10033c2c1
0x10033c2ab: vucomiss xmm1, dword ptr [rip + 0x768e0d] ; 0x100aa50c0
0x10033c2b3: setnp al
0x10033c2b6: sete cl
0x10033c2b9: and cl, al
0x10033c2bb: mov byte ptr [rbx + 0x138], cl
0x10033c2c1: vmovaps xmm0, xmmword ptr [rsp + 0x20]
0x10033c2c7: vmulps xmm0, xmm0, xmm0
0x10033c2cb: vmovshdup xmm1, xmm0
0x10033c2cf: vaddss xmm1, xmm0, xmm1
0x10033c2d3: vpermilpd xmm0, xmm0, 1
0x10033c2d9: vaddss xmm1, xmm0, xmm1
0x10033c2dd: vxorps xmm0, xmm0, xmm0
0x10033c2e1: vucomiss xmm1, xmm0
0x10033c2e5: seta byte ptr [rbx + 0x142]
0x10033c2ec: cmp qword ptr [rbx + 0x100], 0
0x10033c2f4: je 0x10033c442
0x10033c2fa: mov byte ptr [rbx + 0x139], 0
0x10033c301: mov byte ptr [rbx + 0x13d], 0
0x10033c308: mov word ptr [rbx + 0x13b], 0
0x10033c311: mov dword ptr [rbx + 0x130], 0
0x10033c31b: mov al, byte ptr [rbx + 0xb6]
0x10033c321: test al, al
0x10033c323: jne 0x10033c741
0x10033c329: vxorps xmm0, xmm0, xmm0
0x10033c32d: vmovss dword ptr [rbx + 0x128], xmm0
0x10033c335: cmp byte ptr [rbx + 0x139], 0
0x10033c33c: jne 0x10033c75e
0x10033c342: test al, al
0x10033c344: je 0x10033c77a
0x10033c34a: vmulss xmm1, xmm4, dword ptr [rip + 0x768266] ; 0x100aa45b8
0x10033c352: vmovss xmm2, dword ptr [rip + 0x768d66] ; 0x100aa50c0
0x10033c35a: vsubss xmm2, xmm2, xmm1
0x10033c35e: vmulss xmm2, xmm2, dword ptr [rbx + 0x110]
0x10033c366: vaddss xmm1, xmm1, xmm2
0x10033c36a: jmp 0x10033c772 ; 0x10033c772
0x10033c36f: mov rdi, qword ptr [rbx + 0x168]
0x10033c376: test rdi, rdi
0x10033c379: je 0x10033c402
0x10033c37f: mov r14, qword ptr [rbx + 0x170]
0x10033c386: test r14, r14
0x10033c389: je 0x10033c402
0x10033c38b: mov rax, qword ptr [rdi]
0x10033c38e: call qword ptr [rax]
0x10033c390: cmp r14, rax
0x10033c393: jne 0x10033c402
0x10033c395: vxorps ymm0, ymm0, ymm0
0x10033c399: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x10033c3a2: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x10033c3ab: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x10033c3b4: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x10033c3bd: mov dword ptr [rsp + 0x130], 1
0x10033c3c8: mov rdi, qword ptr [rbx + 0x168]
0x10033c3cf: test rdi, rdi
0x10033c3d2: je 0x10033c402
0x10033c3d4: mov r14, qword ptr [rbx + 0x170]
0x10033c3db: test r14, r14
0x10033c3de: je 0x10033c402
0x10033c3e0: mov rax, qword ptr [rdi]
0x10033c3e3: vzeroupper 
0x10033c3e6: call qword ptr [rax]
0x10033c3e8: cmp r14, rax
0x10033c3eb: jne 0x10033c402
0x10033c3ed: mov rdi, qword ptr [rbx + 0x168]
0x10033c3f4: mov rax, qword ptr [rdi]
0x10033c3f7: lea rsi, [rsp + 0xc0]
0x10033c3ff: call qword ptr [rax + 0x68]
0x10033c402: mov rdi, qword ptr [rbx + 0x188]
0x10033c409: test rdi, rdi
0x10033c40c: je 0x10033c436
0x10033c40e: mov r14, qword ptr [rbx + 0x190]
0x10033c415: test r14, r14
0x10033c418: je 0x10033c436
0x10033c41a: mov rax, qword ptr [rdi]
0x10033c41d: vzeroupper 
0x10033c420: call qword ptr [rax]
0x10033c422: cmp r14, rax
0x10033c425: jne 0x10033c436
0x10033c427: mov rdi, qword ptr [rbx + 0x188]
0x10033c42e: mov rax, qword ptr [rdi]
0x10033c431: xor esi, esi
0x10033c433: call qword ptr [rax + 0x30]
0x10033c436: mov byte ptr [rbx + 0xb9], 1
0x10033c43d: jmp 0x10033d40b ; 0x10033d40b
0x10033c442: vaddss xmm0, xmm4, dword ptr [rbx + 0x130]
0x10033c44a: vmovss dword ptr [rbx + 0x130], xmm0
0x10033c452: vucomiss xmm0, dword ptr [rip + 0x76815e] ; 0x100aa45b8
0x10033c45a: jbe 0x10033c733
0x10033c460: vmovss dword ptr [rsp + 0x20], xmm1
0x10033c466: vmovss xmm1, dword ptr [rip + 0x76814a] ; 0x100aa45b8
0x10033c46e: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x10033c473: vmovss dword ptr [rbx + 0x130], xmm0
0x10033c47b: mov dword ptr [rbx + 0x134], 0
0x10033c485: cmp byte ptr [rbx + 0x13b], 0
0x10033c48c: jne 0x10033c4a2
0x10033c48e: vxorps xmm0, xmm0, xmm0
0x10033c492: vmovss xmm1, dword ptr [rsp + 0x20]
0x10033c498: vucomiss xmm1, xmm0
0x10033c49c: jbe 0x10033c5e7
0x10033c4a2: lea r12, [rbx + 0xc0]
0x10033c4a9: mov byte ptr [rbx + 0x13b], 0
0x10033c4b0: mov rsi, qword ptr [r14 + 0x2c8]
0x10033c4b7: lea rdi, [rsp + 0xb0]
0x10033c4bf: mov rdx, r12
0x10033c4c2: call 0x100328200 ; 0x100328200
0x10033c4c7: vmovaps xmm0, xmmword ptr [rsp + 0xb0]
0x10033c4d0: vmulps xmm1, xmm0, xmm0
0x10033c4d4: vmovshdup xmm2, xmm1
0x10033c4d8: vaddss xmm2, xmm1, xmm2
0x10033c4dc: vpermilpd xmm1, xmm1, 1
0x10033c4e2: vaddss xmm1, xmm1, xmm2
0x10033c4e6: vmulss xmm3, xmm1, dword ptr [rip + 0x76c11a] ; 0x100aa8608
0x10033c4ee: vsqrtss xmm2, xmm6, dword ptr [rbx + 0x108]
0x10033c4f6: vmulss xmm2, xmm2, dword ptr [rip + 0x76b7c2] ; 0x100aa7cc0
0x10033c4fe: vmulss xmm2, xmm2, dword ptr [rip + 0x780352] ; 0x100abc858
0x10033c506: vmulss xmm2, xmm2, dword ptr [rip + 0x76b2ce] ; 0x100aa77dc
0x10033c50e: vucomiss xmm3, xmm2
0x10033c512: jbe 0x10033cd6e
0x10033c518: vsqrtss xmm1, xmm1, xmm1
0x10033c51c: vucomiss xmm1, dword ptr [rip + 0x76b3a0] ; 0x100aa78c4
0x10033c524: vmovss dword ptr [rsp + 0x20], xmm3
0x10033c52a: jbe 0x10033c536
0x10033c52c: vpermilps xmm1, xmm1, 0xc0
0x10033c532: vdivps xmm0, xmm0, xmm1
0x10033c536: mov byte ptr [rsp + 0x288], 1
0x10033c53e: vxorps xmm1, xmm1, xmm1
0x10033c542: vmovups xmmword ptr [rsp + 0x290], xmm1
0x10033c54b: movabs rax, 0xffffff9f00000001
0x10033c555: mov qword ptr [rsp + 0x280], rax
0x10033c55d: mov rdi, qword ptr [r14 + 0x138]
0x10033c564: vxorps xmm0, xmm0, xmmword ptr [rip + 0x76b394] ; 0x100aa7900
0x10033c56c: vmovaps xmmword ptr [rsp + 0xa0], xmm0
0x10033c575: lea rdx, [rsp + 0xa0]
0x10033c57d: vmovss xmm0, dword ptr [rip + 0x76a523] ; 0x100aa6aa8
0x10033c585: lea rcx, [rsp + 0x280]
0x10033c58d: lea r8, [rsp + 0xc0]
0x10033c595: mov rsi, r12
0x10033c598: call 0x100776a90 ; 0x100776a90
0x10033c59d: xor al, 1
0x10033c59f: mov byte ptr [rbx + 0x13b], al
0x10033c5a5: vmovss xmm3, dword ptr [rsp + 0x20]
0x10033c5ab: test al, al
0x10033c5ad: je 0x10033c5e7
0x10033c5af: vaddss xmm0, xmm3, xmm3
0x10033c5b3: vaddss xmm0, xmm0, dword ptr [rip + 0x76c0a5] ; 0x100aa8660
0x10033c5bb: vsqrtss xmm1, xmm6, dword ptr [rbx + 0x108]
0x10033c5c3: vmulss xmm1, xmm1, dword ptr [rip + 0x76b6f5] ; 0x100aa7cc0
0x10033c5cb: vmulss xmm1, xmm1, dword ptr [rip + 0x780285] ; 0x100abc858
0x10033c5d3: vmulss xmm1, xmm1, dword ptr [rip + 0x76b201] ; 0x100aa77dc
0x10033c5db: vdivss xmm0, xmm0, xmm1
0x10033c5df: vmovss dword ptr [rbx + 0x134], xmm0
0x10033c5e7: cmp byte ptr [rbx + 0x13c], 0
0x10033c5ee: vmovss xmm5, dword ptr [rip + 0x768aca] ; 0x100aa50c0
0x10033c5f6: jne 0x10033c605
0x10033c5f8: cmp byte ptr [rbx + 0x142], 0
0x10033c5ff: je 0x10033c6a0
0x10033c605: mov rdi, qword ptr [r14 + 0x3e0]
0x10033c60c: vmovss xmm0, dword ptr [rdi + 0xc]
0x10033c611: vucomiss xmm0, dword ptr [rip + 0x76b1cf] ; 0x100aa77e8
0x10033c619: jbe 0x10033c699
0x10033c61b: mov rsi, qword ptr [r14 + 0x138]
0x10033c622: vmovaps xmm0, xmmword ptr [rbx + 0xc0]
0x10033c62a: vmovaps xmmword ptr [rsp + 0x90], xmm0
0x10033c633: lea rdx, [rsp + 0x90]
0x10033c63b: call 0x100567830 ; 0x100567830
0x10033c640: mov byte ptr [rbx + 0x13c], al
0x10033c646: test al, al
0x10033c648: je 0x10033c686
0x10033c64a: mov rcx, qword ptr [r14 + 0x3e0]
0x10033c651: vxorps xmm0, xmm0, xmm0
0x10033c655: vmaxss xmm0, xmm0, dword ptr [rcx + 0xc]
0x10033c65a: vmovss xmm1, dword ptr [rip + 0x768a5e] ; 0x100aa50c0
0x10033c662: vminss xmm0, xmm1, xmm0
0x10033c666: vsubss xmm1, xmm1, xmm0
0x10033c66a: vmulss xmm1, xmm1, dword ptr [rip + 0x76bf96] ; 0x100aa8608
0x10033c672: vmulss xmm0, xmm0, dword ptr [rip + 0x76bf56] ; 0x100aa85d0
0x10033c67a: vaddss xmm0, xmm0, xmm1
0x10033c67e: vmovss dword ptr [rbx + 0x134], xmm0
0x10033c686: vmovss xmm5, dword ptr [rip + 0x768a32] ; 0x100aa50c0
0x10033c68e: cmp byte ptr [rbx + 0x13d], 0
0x10033c695: jne 0x10033c6b4
0x10033c697: jmp 0x10033c6ab ; 0x10033c6ab
0x10033c699: mov byte ptr [rbx + 0x13c], 0
0x10033c6a0: xor eax, eax
0x10033c6a2: cmp byte ptr [rbx + 0x13d], 0
0x10033c6a9: jne 0x10033c6b4
0x10033c6ab: cmp byte ptr [rbx + 0x142], 0
0x10033c6b2: je 0x10033c717
0x10033c6b4: mov rdi, qword ptr [r14 + 0x3d8]
0x10033c6bb: vmovaps xmm0, xmmword ptr [rbx + 0xc0]
0x10033c6c3: vmovaps xmmword ptr [rsp + 0x80], xmm0
0x10033c6cc: lea rsi, [rsp + 0x80]
0x10033c6d4: call 0x1004d6140 ; 0x1004d6140
0x10033c6d9: mov byte ptr [rbx + 0x13d], al
0x10033c6df: test al, al
0x10033c6e1: je 0x10033c709
0x10033c6e3: vmovss xmm4, dword ptr [rsp + 0x1c]
0x10033c6e9: vmovss xmm0, dword ptr [rip + 0x76a3bb] ; 0x100aa6aac
0x10033c6f1: vdivss xmm0, xmm0, xmm4
0x10033c6f5: vmovss dword ptr [rbx + 0x134], xmm0
0x10033c6fd: mov cl, 1
0x10033c6ff: vmovss xmm5, dword ptr [rip + 0x7689b9] ; 0x100aa50c0
0x10033c707: jmp 0x10033c72d ; 0x10033c72d
0x10033c709: mov al, byte ptr [rbx + 0x13c]
0x10033c70f: vmovss xmm5, dword ptr [rip + 0x7689a9] ; 0x100aa50c0
0x10033c717: mov cl, 1
0x10033c719: test al, al
0x10033c71b: vmovss xmm4, dword ptr [rsp + 0x1c]
0x10033c721: jne 0x10033c72d
0x10033c723: cmp byte ptr [rbx + 0x13b], 0
0x10033c72a: setne cl
0x10033c72d: mov byte ptr [rbx + 0x139], cl
0x10033c733: mov al, byte ptr [rbx + 0xb6]
0x10033c739: test al, al
0x10033c73b: je 0x10033c329
0x10033c741: vaddss xmm0, xmm4, dword ptr [rbx + 0x128]
0x10033c749: vmovss dword ptr [rbx + 0x128], xmm0
0x10033c751: cmp byte ptr [rbx + 0x139], 0
0x10033c758: je 0x10033c342
0x10033c75e: vmulss xmm1, xmm4, dword ptr [rbx + 0x134]
0x10033c766: vmovss xmm2, dword ptr [rbx + 0x110]
0x10033c76e: vsubss xmm1, xmm2, xmm1
0x10033c772: vmovss dword ptr [rbx + 0x110], xmm1
0x10033c77a: cmp byte ptr [rbx + 0xb8], 0
0x10033c781: je 0x10033c7f3
0x10033c783: vmovss xmm2, dword ptr [rbx + 0xa0]
0x10033c78b: vmulss xmm1, xmm2, dword ptr [rip + 0x767e25] ; 0x100aa45b8
0x10033c793: vxorps xmm3, xmm3, xmm3
0x10033c797: vmaxss xmm1, xmm3, xmm1
0x10033c79b: vmovss xmm3, dword ptr [rip + 0x76b515] ; 0x100aa7cb8
0x10033c7a3: vminss xmm1, xmm3, xmm1
0x10033c7a7: vaddss xmm1, xmm2, xmm1
0x10033c7ab: vsubss xmm2, xmm2, xmm1
0x10033c7af: vucomiss xmm2, dword ptr [rip + 0x76b10d] ; 0x100aa78c4
0x10033c7b7: ja 0x10033c7cb
0x10033c7b9: vmovss xmm3, dword ptr [rip + 0x76ce0f] ; 0x100aa95d0
0x10033c7c1: vucomiss xmm3, xmm2
0x10033c7c5: vmovaps xmm3, xmm5
0x10033c7c9: jbe 0x10033c7d3
0x10033c7cb: vsubss xmm0, xmm0, xmm1
0x10033c7cf: vdivss xmm3, xmm0, xmm2
0x10033c7d3: vxorps xmm0, xmm0, xmm0
0x10033c7d7: vmaxss xmm0, xmm0, xmm3
0x10033c7db: vminss xmm0, xmm5, xmm0
0x10033c7df: vmovss xmm1, dword ptr [rbx + 0x110]
0x10033c7e7: vminss xmm0, xmm1, xmm0
0x10033c7eb: vmovss dword ptr [rbx + 0x110], xmm0
0x10033c7f3: test al, al
0x10033c7f5: je 0x10033c801
0x10033c7f7: vmovss xmm0, dword ptr [rbx + 0x110]
0x10033c7ff: jmp 0x10033c853 ; 0x10033c853
0x10033c801: vmovss xmm0, dword ptr [rbx + 0x110]
0x10033c809: vxorps xmm1, xmm1, xmm1
0x10033c80d: vucomiss xmm0, xmm1
0x10033c811: jbe 0x10033c853
0x10033c813: vmulss xmm2, xmm4, dword ptr [rip + 0x76afcd] ; 0x100aa77e8
0x10033c81b: vsqrtss xmm3, xmm6, dword ptr [rbx + 0x108]
0x10033c823: vmulss xmm3, xmm3, dword ptr [rip + 0x76b495] ; 0x100aa7cc0
0x10033c82b: vmulss xmm3, xmm3, dword ptr [rip + 0x780025] ; 0x100abc858
0x10033c833: vdivss xmm2, xmm2, xmm3
0x10033c837: vaddss xmm0, xmm0, xmm2
0x10033c83b: vmaxss xmm0, xmm1, xmm0
0x10033c83f: vmovss xmm1, dword ptr [rip + 0x768879] ; 0x100aa50c0
0x10033c847: vminss xmm0, xmm1, xmm0
0x10033c84b: vmovss dword ptr [rbx + 0x110], xmm0
0x10033c853: vxorps xmm2, xmm2, xmm2
0x10033c857: vmaxss xmm0, xmm2, xmm0
0x10033c85b: vmovss xmm1, dword ptr [rip + 0x76885d] ; 0x100aa50c0
0x10033c863: vminss xmm0, xmm1, xmm0
0x10033c867: vmovss dword ptr [rbx + 0x110], xmm0
0x10033c86f: vucomiss xmm0, xmm1
0x10033c873: jb 0x10033cba3
0x10033c879: test al, al
0x10033c87b: je 0x10033c88a
0x10033c87d: cmp byte ptr [rbx + 0xb9], 0
0x10033c884: je 0x10033cb9b
0x10033c88a: cmp byte ptr [rbx + 0xb5], 0
0x10033c891: je 0x10033c909
0x10033c893: mov rax, qword ptr [rbx + 0x100]
0x10033c89a: test rax, rax
0x10033c89d: je 0x10033c8a8
0x10033c89f: cmp byte ptr [rax + 0x1ef8], 0
0x10033c8a6: jne 0x10033c909
0x10033c8a8: call 0x1007abc10 ; 0x1007abc10
0x10033c8ad: mov eax, dword ptr [rax + 0x38]
0x10033c8b0: mov dword ptr [rsp + 0xc8], eax
0x10033c8b7: call 0x1004b1530 ; 0x1004b1530
0x10033c8bc: mov rax, qword ptr [rip + 0x1ab88a5] ; 0x101df5168
0x10033c8c3: mov eax, dword ptr [rax + 0x38]
0x10033c8c6: mov dword ptr [rsp + 0xc8], eax
0x10033c8cd: lea rax, [rip + 0x8d87fc] ; 0x100c150d0
0x10033c8d4: mov qword ptr [rsp + 0xc0], rax
0x10033c8dc: mov eax, dword ptr [rbx + 0x150]
0x10033c8e2: mov dword ptr [rsp + 0xd4], eax
0x10033c8e9: mov byte ptr [rsp + 0xd8], 1
0x10033c8f1: mov rax, qword ptr [r14 + 0x178]
0x10033c8f8: mov rdi, qword ptr [rax + 0x38]
0x10033c8fc: lea rsi, [rsp + 0xc0]
0x10033c904: call 0x1004b1f90 ; 0x1004b1f90
0x10033c909: mov byte ptr [rbx + 0xb6], 1
0x10033c910: mov dword ptr [rbx + 0x110], 0x3f800000
0x10033c91a: mov rdi, rbx
0x10033c91d: call 0x10033b490 ; 0x10033b490
0x10033c922: mov dword ptr [rbx + 0x10c], 0x3f800000
0x10033c92c: mov byte ptr [rbx + 0x138], 1
0x10033c933: mov rdi, qword ptr [r14 + 0x438]
0x10033c93a: vmovaps xmm0, xmmword ptr [rbx + 0xc0]
0x10033c942: vmovaps xmmword ptr [rsp + 0x70], xmm0
0x10033c948: mov rax, qword ptr [rip + 0x76b751] ; 0x100aa80a0
0x10033c94f: mov qword ptr [rsp + 0x50], rax
0x10033c954: mov dword ptr [rsp + 0x58], 0
0x10033c95c: lea rax, [rip + 0x1ab3415] ; 0x101defd78
0x10033c963: mov rcx, qword ptr [rax]
0x10033c966: vmovss xmm0, dword ptr [rip + 0x76eed2] ; 0x100aab840
0x10033c96e: lea rsi, [rsp + 0x70]
0x10033c973: lea rdx, [rsp + 0x50]
0x10033c978: xor r8d, r8d
0x10033c97b: call 0x1002de9e0 ; 0x1002de9e0
0x10033c980: mov qword ptr [rsp + 0xc0], rax
0x10033c988: mov dword ptr [rsp + 0xc8], edx
0x10033c98f: lea rdi, [rsp + 0xc0]
0x10033c997: call 0x100316270 ; 0x100316270
0x10033c99c: mov r12, rax
0x10033c99f: test r12, r12
0x10033c9a2: vxorps xmm2, xmm2, xmm2
0x10033c9a6: je 0x10033cb9b
0x10033c9ac: vmovaps xmm0, xmmword ptr [rbx + 0xc0]
0x10033c9b4: mov byte ptr [r12 + 0x188], 1
0x10033c9bd: mov byte ptr [r12 + 0xae], 1
0x10033c9c6: vmovaps xmmword ptr [r12 + 0x160], xmm0
0x10033c9d0: vsqrtss xmm0, xmm6, dword ptr [rbx + 0x108]
0x10033c9d8: vmulss xmm0, xmm0, dword ptr [rip + 0x76b2e0] ; 0x100aa7cc0
0x10033c9e0: vmulss xmm0, xmm0, dword ptr [rip + 0x77fe70] ; 0x100abc858
0x10033c9e8: vmovss dword ptr [r12 + 0x80], xmm0
0x10033c9f2: vmovss dword ptr [r12 + 0x9c], xmm0
0x10033c9fc: vmovss dword ptr [r12 + 0x84], xmm0
0x10033ca06: mov rax, qword ptr [rbx]
0x10033ca09: lea rdi, [rsp + 0xc0]
0x10033ca11: mov rsi, rbx
0x10033ca14: call qword ptr [rax + 0x18]
0x10033ca17: vmovaps xmm0, xmmword ptr [rsp + 0xd0]
0x10033ca20: vmulps xmm1, xmm0, xmm0
0x10033ca24: vmovshdup xmm2, xmm1
0x10033ca28: vaddss xmm2, xmm1, xmm2
0x10033ca2c: vpermilpd xmm1, xmm1, 1
0x10033ca32: vaddss xmm1, xmm1, xmm2
0x10033ca36: vsqrtss xmm1, xmm1, xmm1
0x10033ca3a: vucomiss xmm1, dword ptr [rip + 0x76ae82] ; 0x100aa78c4
0x10033ca42: jbe 0x10033ca4e
0x10033ca44: vpermilps xmm1, xmm1, 0xc0
0x10033ca4a: vdivps xmm0, xmm0, xmm1
0x10033ca4e: vmulps xmm1, xmm0, xmm0
0x10033ca52: vmovshdup xmm2, xmm1
0x10033ca56: vaddss xmm2, xmm1, xmm2
0x10033ca5a: vpermilpd xmm1, xmm1, 1
0x10033ca60: vaddss xmm1, xmm1, xmm2
0x10033ca64: vsqrtss xmm1, xmm1, xmm1
0x10033ca68: vucomiss xmm1, dword ptr [rip + 0x76ae54] ; 0x100aa78c4
0x10033ca70: jbe 0x10033ca7c
0x10033ca72: vpermilps xmm1, xmm1, 0xc0
0x10033ca78: vdivps xmm0, xmm0, xmm1
0x10033ca7c: vxorps xmm1, xmm0, xmmword ptr [rip + 0x76ae7c] ; 0x100aa7900
0x10033ca84: vmulps xmm2, xmm0, xmm0
0x10033ca88: vmovshdup xmm3, xmm2
0x10033ca8c: vaddss xmm3, xmm2, xmm3
0x10033ca90: vpermilpd xmm2, xmm2, 1
0x10033ca96: vaddss xmm2, xmm2, xmm3
0x10033ca9a: vsqrtss xmm2, xmm2, xmm2
0x10033ca9e: vucomiss xmm2, dword ptr [rip + 0x76ae1e] ; 0x100aa78c4
0x10033caa6: jbe 0x10033cab2
0x10033caa8: vpermilps xmm2, xmm2, 0xc0
0x10033caae: vdivps xmm1, xmm1, xmm2
0x10033cab2: vmulps xmm1, xmm1, xmmword ptr [rip + 0x76ebd6] ; 0x100aab690
0x10033caba: vmovshdup xmm2, xmm1
0x10033cabe: vaddss xmm2, xmm1, xmm2
0x10033cac2: vpermilpd xmm1, xmm1, 1
0x10033cac8: vaddss xmm1, xmm1, xmm2
0x10033cacc: vaddss xmm1, xmm1, dword ptr [rip + 0x7685f0] ; 0x100aa50c4
0x10033cad4: vandps xmm1, xmm1, xmmword ptr [rip + 0x76ae34] ; 0x100aa7910
0x10033cadc: vmovss xmm2, dword ptr [rip + 0x76ade0] ; 0x100aa78c4
0x10033cae4: vucomiss xmm2, xmm1
0x10033cae8: jae 0x10033cb5a
0x10033caea: vmovaps xmm1, xmmword ptr [rip + 0x76eb9e] ; 0x100aab690
0x10033caf2: vmulps xmm2, xmm0, xmm1
0x10033caf6: vmovshdup xmm3, xmm2
0x10033cafa: vaddss xmm3, xmm2, xmm3
0x10033cafe: vpermilpd xmm2, xmm2, 1
0x10033cb04: vaddss xmm2, xmm2, xmm3
0x10033cb08: vmovss xmm3, dword ptr [rip + 0x7685b0] ; 0x100aa50c0
0x10033cb10: vaddss xmm2, xmm2, xmm3
0x10033cb14: vaddss xmm2, xmm2, xmm2
0x10033cb18: vsqrtss xmm2, xmm2, xmm2
0x10033cb1c: vdivss xmm3, xmm3, xmm2
0x10033cb20: vmovss xmm4, dword ptr [rip + 0x76859c] ; 0x100aa50c4
0x10033cb28: vmulps xmm4, xmm0, xmm4
0x10033cb2c: vpermilps xmm0, xmm0, 0xd2
0x10033cb32: vmulps xmm0, xmm0, xmm1
0x10033cb36: vsubps xmm0, xmm4, xmm0
0x10033cb3a: vpermilps xmm0, xmm0, 0xd2
0x10033cb40: vpermilps xmm1, xmm3, 0xc0
0x10033cb46: vmulps xmm0, xmm0, xmm1
0x10033cb4a: vmulss xmm1, xmm2, dword ptr [rip + 0x767a66] ; 0x100aa45b8
0x10033cb52: vinsertps xmm0, xmm0, xmm1, 0x30
0x10033cb58: jmp 0x10033cb62 ; 0x10033cb62
0x10033cb5a: vmovaps xmm0, xmmword ptr [rip + 0x76eb3e] ; 0x100aab6a0
0x10033cb62: vxorps xmm2, xmm2, xmm2
0x10033cb66: vmovaps xmmword ptr [r12 + 0x30], xmm0
0x10033cb6d: vpermilps xmm1, xmm0, 0xe7
0x10033cb73: vucomiss xmm1, xmm1
0x10033cb77: jp 0x10033d437
0x10033cb7d: vmovshdup xmm1, xmm0
0x10033cb81: vucomiss xmm0, xmm1
0x10033cb85: jp 0x10033d437
0x10033cb8b: vpermilpd xmm0, xmm0, 1
0x10033cb91: vucomiss xmm0, xmm0
0x10033cb95: jp 0x10033d437
0x10033cb9b: vmovss xmm0, dword ptr [rbx + 0x110]
0x10033cba3: vucomiss xmm2, xmm0
0x10033cba7: jb 0x10033cc46
0x10033cbad: cmp byte ptr [rbx + 0xb6], 0
0x10033cbb4: je 0x10033cded
0x10033cbba: cmp byte ptr [rbx + 0xb5], 0
0x10033cbc1: je 0x10033cc39
0x10033cbc3: mov rax, qword ptr [rbx + 0x100]
0x10033cbca: test rax, rax
0x10033cbcd: je 0x10033cbd8
0x10033cbcf: cmp byte ptr [rax + 0x1ef8], 0
0x10033cbd6: jne 0x10033cc39
0x10033cbd8: call 0x1007abc10 ; 0x1007abc10
0x10033cbdd: mov eax, dword ptr [rax + 0x38]
0x10033cbe0: mov dword ptr [rsp + 0xc8], eax
0x10033cbe7: call 0x1004b1530 ; 0x1004b1530
0x10033cbec: mov rax, qword ptr [rip + 0x1ab8575] ; 0x101df5168
0x10033cbf3: mov eax, dword ptr [rax + 0x38]
0x10033cbf6: mov dword ptr [rsp + 0xc8], eax
0x10033cbfd: lea rax, [rip + 0x8d84cc] ; 0x100c150d0
0x10033cc04: mov qword ptr [rsp + 0xc0], rax
0x10033cc0c: mov eax, dword ptr [rbx + 0x150]
0x10033cc12: mov dword ptr [rsp + 0xd4], eax
0x10033cc19: mov byte ptr [rsp + 0xd8], 0
0x10033cc21: mov rax, qword ptr [r14 + 0x178]
0x10033cc28: mov rdi, qword ptr [rax + 0x38]
0x10033cc2c: lea rsi, [rsp + 0xc0]
0x10033cc34: call 0x1004b1f90 ; 0x1004b1f90
0x10033cc39: mov esi, 1
0x10033cc3e: mov rdi, rbx
0x10033cc41: call 0x10033a780 ; 0x10033a780
0x10033cc46: cmp byte ptr [rbx + 0xb6], 0
0x10033cc4d: je 0x10033cded
0x10033cc53: vmovss xmm0, dword ptr [rbx + 0x110]
0x10033cc5b: vucomiss xmm0, dword ptr [rip + 0x76c575] ; 0x100aa91d8
0x10033cc63: jbe 0x10033cded
0x10033cc69: mov rax, qword ptr [rbx + 0x100]
0x10033cc70: test rax, rax
0x10033cc73: je 0x10033cc82
0x10033cc75: cmp byte ptr [rax + 0x1ef8], 0
0x10033cc7c: jne 0x10033cded
0x10033cc82: mov rdi, qword ptr [r14 + 0x280]
0x10033cc89: call 0x1000fc260 ; 0x1000fc260
0x10033cc8e: mov r12, rax
0x10033cc91: vmovaps xmm0, xmmword ptr [rbx + 0xc0]
0x10033cc99: vmovaps xmmword ptr [rsp + 0x60], xmm0
0x10033cc9f: lea rdi, [rsp + 0x60]
0x10033cca4: mov rsi, r15
0x10033cca7: call 0x10078ce10 ; 0x10078ce10
0x10033ccac: vmaxss xmm0, xmm0, dword ptr [rip + 0x76b980] ; 0x100aa8634
0x10033ccb4: vmovss dword ptr [rsp + 0x20], xmm0
0x10033ccba: vmovss xmm0, dword ptr [rbx + 0x108]
0x10033ccc2: vmovss xmm1, dword ptr [rbx + 0x10c]
0x10033ccca: vcmpunordss xmm2, xmm0, xmm0
0x10033cccf: vmovss xmm3, dword ptr [rip + 0x76b8d9] ; 0x100aa85b0
0x10033ccd7: vmovaps xmm4, xmm3
0x10033ccdb: vandps xmm3, xmm2, xmm4
0x10033ccdf: vmaxss xmm0, xmm4, xmm0
0x10033cce3: vandnps xmm0, xmm2, xmm0
0x10033cce7: vorps xmm0, xmm0, xmm3
0x10033cceb: vmulss xmm1, xmm1, dword ptr [rip + 0x76a401] ; 0x100aa70f4
0x10033ccf3: vaddss xmm1, xmm1, dword ptr [rip + 0x7683c5] ; 0x100aa50c0
0x10033ccfb: vmulss xmm0, xmm0, xmm1
0x10033ccff: vmovss xmm1, dword ptr [rip + 0x76aae9] ; 0x100aa77f0
0x10033cd07: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x10033cd0c: vmovss xmm2, dword ptr [rsp + 0x1c]
0x10033cd12: vmulss xmm0, xmm0, dword ptr [rbx + 0x110]
0x10033cd1a: vmovss xmm1, dword ptr [rsp + 0x20]
0x10033cd20: vmulss xmm1, xmm1, xmm1
0x10033cd24: vdivss xmm0, xmm0, xmm1
0x10033cd28: vmulss xmm0, xmm0, dword ptr [rip + 0x77fb20] ; 0x100abc850
0x10033cd30: vucomiss xmm0, dword ptr [rsp + 0x40]
0x10033cd36: jbe 0x10033cded
0x10033cd3c: mov rax, qword ptr [r12 + 0x30]
0x10033cd41: vmovss xmm1, dword ptr [rip + 0x768377] ; 0x100aa50c0
0x10033cd49: vucomiss xmm1, dword ptr [rax + 0x48]
0x10033cd4e: jbe 0x10033cd81
0x10033cd50: lea rcx, [rip + 0x784b31] ; 0x100ac1888
0x10033cd57: vmulss xmm1, xmm0, dword ptr [rcx]
0x10033cd5b: vmulss xmm1, xmm1, xmm2
0x10033cd5f: vmovss xmm2, dword ptr [rax + 8]
0x10033cd64: vxorps xmm2, xmm2, xmmword ptr [rip + 0x76ab94] ; 0x100aa7900
0x10033cd6c: jmp 0x10033cd9a ; 0x10033cd9a
0x10033cd6e: mov al, byte ptr [rbx + 0x13b]
0x10033cd74: test al, al
0x10033cd76: jne 0x10033c5af
0x10033cd7c: jmp 0x10033c5e7 ; 0x10033c5e7
0x10033cd81: lea rcx, [rip + 0x784b04] ; 0x100ac188c
0x10033cd88: vmulss xmm1, xmm0, dword ptr [rcx]
0x10033cd8c: vmulss xmm1, xmm1, xmm2
0x10033cd90: vmovss xmm2, dword ptr [rax + 0x28]
0x10033cd95: vsubss xmm2, xmm2, dword ptr [rax + 8]
0x10033cd9a: vminss xmm1, xmm1, xmm2
0x10033cd9e: vaddss xmm1, xmm1, dword ptr [rax + 0xc]
0x10033cda3: vmovss dword ptr [rax + 0xc], xmm1
0x10033cda8: mov rax, qword ptr [r12 + 0x60]
0x10033cdad: lea rcx, [rbx + 8]
0x10033cdb1: mov qword ptr [rax + 0x368], rcx
0x10033cdb8: vxorps xmm1, xmm1, xmm1
0x10033cdbc: vmovaps xmmword ptr [rax + 0x370], xmm1
0x10033cdc4: vsubss xmm0, xmm0, dword ptr [rsp + 0x40]
0x10033cdca: vxorps xmm1, xmm1, xmm1
0x10033cdce: vmaxss xmm0, xmm1, xmm0
0x10033cdd2: vmovss xmm1, dword ptr [rip + 0x7682e6] ; 0x100aa50c0
0x10033cdda: vminss xmm0, xmm1, xmm0
0x10033cdde: vmovss dword ptr [rbx + 0x10c], xmm0
0x10033cde6: mov byte ptr [rbx + 0x138], 1
0x10033cded: cmp byte ptr [rbx + 0x139], 0
0x10033cdf4: je 0x10033cf2b
0x10033cdfa: cmp byte ptr [rbx + 0x13a], 0
0x10033ce01: jne 0x10033cf65
0x10033ce07: mov rdi, qword ptr [r14 + 0x5c8]
0x10033ce0e: vxorps ymm0, ymm0, ymm0
0x10033ce12: vmovaps ymmword ptr [rsp + 0x280], ymm0
0x10033ce1b: vmovaps ymmword ptr [rsp + 0x2e0], ymm0
0x10033ce24: vmovaps ymmword ptr [rsp + 0x2c0], ymm0
0x10033ce2d: vmovaps ymmword ptr [rsp + 0x2a0], ymm0
0x10033ce36: mov byte ptr [rsp + 0x28d], 1
0x10033ce3e: mov dword ptr [rsp + 0x280], 0x3f800000
0x10033ce49: vmovaps xmm1, xmmword ptr [rbx + 0xc0]
0x10033ce51: vmovaps xmmword ptr [rsp + 0x290], xmm1
0x10033ce5a: movabs rax, 0x4170000040400000
0x10033ce64: mov qword ptr [rsp + 0x2c8], rax
0x10033ce6c: mov dword ptr [rsp + 0x2f0], 0xc31
0x10033ce77: vmovups ymmword ptr [rsp + 0x250], ymm0
0x10033ce80: vmovaps ymmword ptr [rsp + 0x240], ymm0
0x10033ce89: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x10033ce92: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x10033ce9b: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x10033cea4: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x10033cead: vmovaps ymmword ptr [rsp + 0x1a0], ymm0
0x10033ceb6: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x10033cebf: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x10033cec8: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x10033ced1: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x10033ceda: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x10033cee3: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x10033ceec: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x10033cef5: lea rsi, [rip + 0x844804] ; 0x100b81700 burnout
0x10033cefc: lea rdx, [rsp + 0x280]
0x10033cf04: lea rcx, [rsp + 0xc0]
0x10033cf0c: vzeroupper 
0x10033cf0f: call 0x1006018a0 ; 0x1006018a0
0x10033cf14: mov qword ptr [rbx + 0x158], rax
0x10033cf1b: mov qword ptr [rbx + 0x160], rdx
0x10033cf22: cmp byte ptr [rbx + 0x139], 0
0x10033cf29: jne 0x10033cf65
0x10033cf2b: cmp byte ptr [rbx + 0x13a], 0
0x10033cf32: je 0x10033cf65
0x10033cf34: mov rdi, qword ptr [rbx + 0x158]
0x10033cf3b: test rdi, rdi
0x10033cf3e: je 0x10033cf65
0x10033cf40: mov r14, qword ptr [rbx + 0x160]
0x10033cf47: test r14, r14
0x10033cf4a: je 0x10033cf65
0x10033cf4c: mov rax, qword ptr [rdi]
0x10033cf4f: call qword ptr [rax]
0x10033cf51: cmp r14, rax
0x10033cf54: jne 0x10033cf65
0x10033cf56: mov rdi, qword ptr [rbx + 0x158]
0x10033cf5d: mov rax, qword ptr [rdi]
0x10033cf60: xor esi, esi
0x10033cf62: call qword ptr [rax + 0x30]
0x10033cf65: vmovss xmm0, dword ptr [rbx + 0x134]
0x10033cf6d: vxorps xmm1, xmm1, xmm1
0x10033cf71: vucomiss xmm0, xmm1
0x10033cf75: jbe 0x10033d07a
0x10033cf7b: vxorps ymm0, ymm0, ymm0
0x10033cf7f: vmovups ymmword ptr [rsp + 0x24c], ymm0
0x10033cf88: vmovaps ymmword ptr [rsp + 0x240], ymm0
0x10033cf91: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x10033cf9a: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x10033cfa3: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x10033cfac: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x10033cfb5: vmovaps ymmword ptr [rsp + 0x1a0], ymm0
0x10033cfbe: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x10033cfc7: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x10033cfd0: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x10033cfd9: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x10033cfe2: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x10033cfeb: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x10033cff4: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x10033cffd: mov eax, dword ptr [rbx + 0x110]
0x10033d003: mov word ptr [rsp + 0xc0], 0x3a60
0x10033d00d: mov dword ptr [rsp + 0xe0], eax
0x10033d014: mov dword ptr [rsp + 0xe4], 0x3f800000
0x10033d01f: mov dword ptr [rsp + 0x260], 3
0x10033d02a: mov dword ptr [rsp + 0x26c], 2
0x10033d035: mov rdi, qword ptr [rbx + 0x158]
0x10033d03c: test rdi, rdi
0x10033d03f: je 0x10033d07a
0x10033d041: mov r14, qword ptr [rbx + 0x160]
0x10033d048: test r14, r14
0x10033d04b: je 0x10033d07a
0x10033d04d: mov rax, qword ptr [rdi]
0x10033d050: vzeroupper 
0x10033d053: call qword ptr [rax]
0x10033d055: vxorps xmm1, xmm1, xmm1
0x10033d059: cmp r14, rax
0x10033d05c: jne 0x10033d07a
0x10033d05e: mov rdi, qword ptr [rbx + 0x158]
0x10033d065: mov rax, qword ptr [rdi]
0x10033d068: lea rsi, [rsp + 0xc0]
0x10033d070: call qword ptr [rax + 0x88]
0x10033d076: vxorps xmm1, xmm1, xmm1
0x10033d07a: vmovss xmm0, dword ptr [rbx + 0x110]
0x10033d082: vucomiss xmm0, xmm1
0x10033d086: jne 0x10033d08a
0x10033d088: jnp 0x10033d09e
0x10033d08a: vmovss xmm1, dword ptr [rbx + 0x10c]
0x10033d092: vxorps xmm2, xmm2, xmm2
0x10033d096: vucomiss xmm1, xmm2
0x10033d09a: jne 0x10033d0da
0x10033d09c: jp 0x10033d0da
0x10033d09e: mov rdi, qword ptr [rbx + 0x188]
0x10033d0a5: test rdi, rdi
0x10033d0a8: je 0x10033d0d2
0x10033d0aa: mov r14, qword ptr [rbx + 0x190]
0x10033d0b1: test r14, r14
0x10033d0b4: je 0x10033d0d2
0x10033d0b6: mov rax, qword ptr [rdi]
0x10033d0b9: vzeroupper 
0x10033d0bc: call qword ptr [rax]
0x10033d0be: cmp r14, rax
0x10033d0c1: jne 0x10033d0d2
0x10033d0c3: mov rdi, qword ptr [rbx + 0x188]
0x10033d0ca: mov rax, qword ptr [rdi]
0x10033d0cd: xor esi, esi
0x10033d0cf: call qword ptr [rax + 0x30]
0x10033d0d2: vmovss xmm0, dword ptr [rbx + 0x110]
0x10033d0da: vucomiss xmm0, dword ptr [rip + 0x767fde] ; 0x100aa50c0
0x10033d0e2: jb 0x10033d118
0x10033d0e4: mov rdi, qword ptr [rbx + 0x178]
0x10033d0eb: test rdi, rdi
0x10033d0ee: je 0x10033d118
0x10033d0f0: mov r14, qword ptr [rbx + 0x180]
0x10033d0f7: test r14, r14
0x10033d0fa: je 0x10033d118
0x10033d0fc: mov rax, qword ptr [rdi]
0x10033d0ff: vzeroupper 
0x10033d102: call qword ptr [rax]
0x10033d104: cmp r14, rax
0x10033d107: jne 0x10033d118
0x10033d109: mov rdi, qword ptr [rbx + 0x178]
0x10033d110: mov rax, qword ptr [rdi]
0x10033d113: xor esi, esi
0x10033d115: call qword ptr [rax + 0x30]
0x10033d118: mov rdi, qword ptr [rbx + 0x168]
0x10033d11f: test rdi, rdi
0x10033d122: je 0x10033d3e2
0x10033d128: mov r14, qword ptr [rbx + 0x170]
0x10033d12f: test r14, r14
0x10033d132: je 0x10033d3e2
0x10033d138: mov rax, qword ptr [rdi]
0x10033d13b: vzeroupper 
0x10033d13e: call qword ptr [rax]
0x10033d140: cmp r14, rax
0x10033d143: jne 0x10033d3e2
0x10033d149: vxorps ymm4, ymm4, ymm4
0x10033d14d: vmovaps ymmword ptr [rsp + 0x120], ymm4
0x10033d156: vmovaps ymmword ptr [rsp + 0x100], ymm4
0x10033d15f: vmovaps ymmword ptr [rsp + 0xe0], ymm4
0x10033d168: vmovaps ymmword ptr [rsp + 0xc0], ymm4
0x10033d171: vmovaps xmm0, xmmword ptr [rbx + 0xc0]
0x10033d179: vmovaps xmmword ptr [rsp + 0xd0], xmm0
0x10033d182: vmovss xmm0, dword ptr [rbx + 0x108]
0x10033d18a: vcmpunordss xmm1, xmm0, xmm0
0x10033d18f: vmovss xmm2, dword ptr [rip + 0x76b419] ; 0x100aa85b0
0x10033d197: vmovaps xmm3, xmm2
0x10033d19b: vandps xmm2, xmm1, xmm3
0x10033d19f: vmaxss xmm0, xmm3, xmm0
0x10033d1a3: vandnps xmm0, xmm1, xmm0
0x10033d1a7: vorps xmm0, xmm0, xmm2
0x10033d1ab: vmovss xmm1, dword ptr [rbx + 0x10c]
0x10033d1b3: vmulss xmm1, xmm1, dword ptr [rip + 0x769f39] ; 0x100aa70f4
0x10033d1bb: vmovss xmm2, dword ptr [rip + 0x767efd] ; 0x100aa50c0
0x10033d1c3: vaddss xmm1, xmm1, xmm2
0x10033d1c7: vmulss xmm0, xmm0, xmm1
0x10033d1cb: vaddss xmm0, xmm0, xmm0
0x10033d1cf: vmulss xmm0, xmm0, dword ptr [rbx + 0xa8]
0x10033d1d7: mov dword ptr [rsp + 0x108], 0
0x10033d1e2: vmovss dword ptr [rsp + 0x10c], xmm0
0x10033d1eb: vxorps xmm0, xmm0, xmm0
0x10033d1ef: vcmpltss xmm0, xmm0, dword ptr [rbx + 0x110]
0x10033d1f8: vandps xmm0, xmm0, xmm2
0x10033d1fc: vmovss dword ptr [rsp + 0xc0], xmm0
0x10033d205: mov dword ptr [rsp + 0x130], 0xc21
0x10033d210: mov rdi, qword ptr [rbx + 0x168]
0x10033d217: test rdi, rdi
0x10033d21a: je 0x10033d255
0x10033d21c: mov r14, qword ptr [rbx + 0x170]
0x10033d223: test r14, r14
0x10033d226: je 0x10033d255
0x10033d228: mov rax, qword ptr [rdi]
0x10033d22b: vzeroupper 
0x10033d22e: call qword ptr [rax]
0x10033d230: vxorps ymm4, ymm4, ymm4
0x10033d234: cmp r14, rax
0x10033d237: jne 0x10033d255
0x10033d239: mov rdi, qword ptr [rbx + 0x168]
0x10033d240: mov rax, qword ptr [rdi]
0x10033d243: lea rsi, [rsp + 0xc0]
0x10033d24b: vzeroupper 
0x10033d24e: call qword ptr [rax + 0x68]
0x10033d251: vxorps ymm4, ymm4, ymm4
0x10033d255: vmovups ymmword ptr [rsp + 0x24c], ymm4
0x10033d25e: vmovaps ymmword ptr [rsp + 0x240], ymm4
0x10033d267: vmovaps ymmword ptr [rsp + 0x220], ymm4
0x10033d270: vmovaps ymmword ptr [rsp + 0x200], ymm4
0x10033d279: vmovaps ymmword ptr [rsp + 0x1e0], ymm4
0x10033d282: vmovaps ymmword ptr [rsp + 0x1c0], ymm4
0x10033d28b: vmovaps ymmword ptr [rsp + 0x1a0], ymm4
0x10033d294: vmovaps ymmword ptr [rsp + 0x180], ymm4
0x10033d29d: vmovaps ymmword ptr [rsp + 0x160], ymm4
0x10033d2a6: vmovaps ymmword ptr [rsp + 0x140], ymm4
0x10033d2af: vmovaps ymmword ptr [rsp + 0x120], ymm4
0x10033d2b8: vmovaps ymmword ptr [rsp + 0x100], ymm4
0x10033d2c1: vmovaps ymmword ptr [rsp + 0xe0], ymm4
0x10033d2ca: vmovaps ymmword ptr [rsp + 0xc0], ymm4
0x10033d2d3: vmovss xmm0, dword ptr [rbx + 0x108]
0x10033d2db: vmovss xmm1, dword ptr [rbx + 0x10c]
0x10033d2e3: vcmpunordss xmm2, xmm0, xmm0
0x10033d2e8: vmovss xmm3, dword ptr [rip + 0x76b2c0] ; 0x100aa85b0
0x10033d2f0: vmovaps xmm4, xmm3
0x10033d2f4: vandps xmm3, xmm2, xmm4
0x10033d2f8: vmaxss xmm0, xmm4, xmm0
0x10033d2fc: vandnps xmm0, xmm2, xmm0
0x10033d300: vorps xmm0, xmm0, xmm3
0x10033d304: vmulss xmm1, xmm1, dword ptr [rip + 0x769de8] ; 0x100aa70f4
0x10033d30c: vaddss xmm1, xmm1, dword ptr [rip + 0x767dac] ; 0x100aa50c0
0x10033d314: vmulss xmm0, xmm0, xmm1
0x10033d318: mov byte ptr [rsp + 0xc0], 0x3f
0x10033d320: vmovss dword ptr [rsp + 0xe0], xmm0
0x10033d329: mov eax, dword ptr [rbx + 0x110]
0x10033d32f: mov byte ptr [rsp + 0xc1], 0x40
0x10033d337: mov dword ptr [rsp + 0xe4], eax
0x10033d33e: mov dword ptr [rsp + 0x260], 3
0x10033d349: mov dword ptr [rsp + 0x26c], 2
0x10033d354: mov eax, dword ptr [rbx + 0xac]
0x10033d35a: mov cl, 1
0x10033d35c: test cl, cl
0x10033d35e: jne 0x10033d380
0x10033d360: mov dword ptr [rsp + 0xe4], eax
0x10033d367: mov dword ptr [rsp + 0x260], 3
0x10033d372: mov rdi, qword ptr [rbx + 0x168]
0x10033d379: test rdi, rdi
0x10033d37c: jne 0x10033d3b1
0x10033d37e: jmp 0x10033d3e2 ; 0x10033d3e2
0x10033d380: mov byte ptr [rsp + 0xc2], 0x32
0x10033d388: mov dword ptr [rsp + 0xe8], eax
0x10033d38f: mov dword ptr [rsp + 0x260], 7
0x10033d39a: mov dword ptr [rsp + 0x26c], 3
0x10033d3a5: mov rdi, qword ptr [rbx + 0x168]
0x10033d3ac: test rdi, rdi
0x10033d3af: je 0x10033d3e2
0x10033d3b1: mov r14, qword ptr [rbx + 0x170]
0x10033d3b8: test r14, r14
0x10033d3bb: je 0x10033d3e2
0x10033d3bd: mov rax, qword ptr [rdi]
0x10033d3c0: vzeroupper 
0x10033d3c3: call qword ptr [rax]
0x10033d3c5: cmp r14, rax
0x10033d3c8: jne 0x10033d3e2
0x10033d3ca: mov rdi, qword ptr [rbx + 0x168]
0x10033d3d1: mov rax, qword ptr [rdi]
0x10033d3d4: lea rsi, [rsp + 0xc0]
0x10033d3dc: call qword ptr [rax + 0x88]
0x10033d3e2: cmp byte ptr [rbx + 0xba], 0
0x10033d3e9: je 0x10033d3f6
0x10033d3eb: mov rdi, rbx
0x10033d3ee: vzeroupper 
0x10033d3f1: call 0x10033b490 ; 0x10033b490
0x10033d3f6: mov word ptr [rbx + 0xb9], 0
0x10033d3ff: mov al, byte ptr [rbx + 0x139]
0x10033d405: mov byte ptr [rbx + 0x13a], al
0x10033d40b: mov rax, qword ptr [rip + 0x8d04c6] ; 0x100c0d8d8
0x10033d412: mov rax, qword ptr [rax]
0x10033d415: cmp rax, qword ptr [rsp + 0x308]
0x10033d41d: jne 0x10033d42f
0x10033d41f: lea rsp, [rbp - 0x20]
0x10033d423: pop rbx
0x10033d424: pop r12
0x10033d426: pop r14
0x10033d428: pop r15
0x10033d42a: pop rbp
0x10033d42b: vzeroupper 
0x10033d42e: ret 
0x10033d42f: vzeroupper 
0x10033d432: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10033d437: lea rdi, [rip + 0x837038] ; 0x100b74476 !isNan( quat )
0x10033d43e: lea rsi, [rip + 0x837040] ; 0x100b74485 ./Emitter.h
0x10033d445: mov edx, 0x26
0x10033d44a: mov ecx, 3
0x10033d44f: call 0x1007e5f70 ; 0x1007e5f70
0x10033d454: ud2 
0x10033d456: mov rdi, rax
0x10033d459: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10033d45e: mov rdi, rax
0x10033d461: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10033d466: nop word ptr cs:[rax + rax]
