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
