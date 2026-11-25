0x10073afd0: push rbp
0x10073afd1: mov rbp, rsp
0x10073afd4: push r15
0x10073afd6: push r14
0x10073afd8: push r13
0x10073afda: push r12
0x10073afdc: push rbx
0x10073afdd: and rsp, 0xffffffffffffffe0
0x10073afe1: sub rsp, 0x340
0x10073afe8: mov qword ptr [rsp + 0x78], r9
0x10073afed: mov r15, r8
0x10073aff0: vmovss dword ptr [rsp + 0x30], xmm1
0x10073aff6: mov r12, rcx
0x10073aff9: mov r13, rdx
0x10073affc: mov r14, rdi
0x10073afff: mov rax, qword ptr [rip + 0x4d28d2] ; 0x100c0d8d8
0x10073b006: mov rax, qword ptr [rax]
0x10073b009: mov qword ptr [rsp + 0x320], rax
0x10073b011: vxorps xmm0, xmm0, xmm0
0x10073b015: vmovlps qword ptr [rsp + 0x60], xmm0
0x10073b01b: mov dword ptr [rsp + 0x68], 0
0x10073b023: lea rbx, [r12 + 0x10]
0x10073b028: vmovaps xmm0, xmmword ptr [r12 + 0x10]
0x10073b02f: vsubps xmm1, xmm0, xmmword ptr [r12 + 0x130]
0x10073b039: vmulps xmm1, xmm1, xmm1
0x10073b03d: vmovshdup xmm2, xmm1
0x10073b041: vaddss xmm2, xmm1, xmm2
0x10073b045: vpermilpd xmm1, xmm1, 1
0x10073b04b: vaddss xmm1, xmm1, xmm2
0x10073b04f: vsqrtss xmm1, xmm1, xmm1
0x10073b053: vxorps xmm2, xmm2, xmm2
0x10073b057: vmaxss xmm1, xmm2, xmm1
0x10073b05b: vmovss xmm2, dword ptr [rip + 0x36d969] ; 0x100aa89cc
0x10073b063: vminss xmm4, xmm2, xmm1
0x10073b067: cmp byte ptr [r12 + 0xbb0], 0
0x10073b070: je 0x10073b171
0x10073b076: vmovss dword ptr [rsp + 0x10], xmm4
0x10073b07c: lea rax, [rip + 0x3867b9] ; 0x100ac183c
0x10073b083: vbroadcastss xmm1, dword ptr [rax]
0x10073b088: vmulps xmm1, xmm1, xmmword ptr [r12 + 0x70]
0x10073b08f: vbroadcastss xmm2, dword ptr [r12 + 0xe4]
0x10073b099: vmulps xmm1, xmm1, xmm2
0x10073b09d: vaddps xmm1, xmm0, xmm1
0x10073b0a1: mov byte ptr [rsp + 0x88], 1
0x10073b0a9: movabs rax, 0xffffff8f00000001
0x10073b0b3: mov qword ptr [rsp + 0x80], rax
0x10073b0bb: lea rax, [rip + 0xbee] ; 0x10073bcb0
0x10073b0c2: mov qword ptr [rsp + 0x90], rax
0x10073b0ca: mov qword ptr [rsp + 0x98], r14
0x10073b0d2: vmovaps xmm0, xmmword ptr [r12 + 0x80]
0x10073b0dc: vmovaps xmmword ptr [rsp + 0x40], xmm0
0x10073b0e2: mov rdi, qword ptr [r13 + 0x138]
0x10073b0e9: vmulps xmm0, xmm0, xmmword ptr [rip + 0x36e1ff] ; 0x100aa92f0
0x10073b0f1: vmovaps xmmword ptr [rsp], xmm1
0x10073b0f6: vaddps xmm0, xmm1, xmm0
0x10073b0fa: vmovaps xmmword ptr [rsp + 0xe0], xmm0
0x10073b103: lea rsi, [rsp + 0xe0]
0x10073b10b: lea rdx, [rsp + 0x40]
0x10073b110: vmovss xmm0, dword ptr [rip + 0x36b990] ; 0x100aa6aa8
0x10073b118: lea rcx, [rsp + 0x80]
0x10073b120: lea r8, [rsp + 0xa0]
0x10073b128: call 0x100776a90 ; 0x100776a90
0x10073b12d: test al, al
0x10073b12f: je 0x10073b17f
0x10073b131: vmovaps xmm0, xmmword ptr [rsp + 0xa0]
0x10073b13a: vmovaps xmm2, xmmword ptr [rsp]
0x10073b13f: vsubps xmm0, xmm0, xmm2
0x10073b143: vmulps xmm0, xmm0, xmm0
0x10073b147: vmovshdup xmm1, xmm0
0x10073b14b: vaddss xmm1, xmm0, xmm1
0x10073b14f: vpermilpd xmm0, xmm0, 1
0x10073b155: vaddss xmm0, xmm0, xmm1
0x10073b159: vsqrtss xmm0, xmm0, xmm0
0x10073b15d: vmovss xmm1, dword ptr [rsp + 0x10]
0x10073b163: vucomiss xmm1, xmm0
0x10073b167: jbe 0x10073b184
0x10073b169: vmovss dword ptr [rsp + 0x10], xmm0
0x10073b16f: jmp 0x10073b184 ; 0x10073b184
0x10073b171: vxorps xmm0, xmm0, xmm0
0x10073b175: vmovss dword ptr [rsp], xmm0
0x10073b17a: jmp 0x10073b548 ; 0x10073b548
0x10073b17f: vmovaps xmm2, xmmword ptr [rsp]
0x10073b184: vmovaps xmm0, xmmword ptr [r12 + 0x80]
0x10073b18e: vxorps xmm1, xmm0, xmmword ptr [rip + 0x36c76a] ; 0x100aa7900
0x10073b196: vmovaps xmmword ptr [rsp + 0x40], xmm1
0x10073b19c: mov rdi, qword ptr [r13 + 0x138]
0x10073b1a3: vmulps xmm0, xmm0, xmmword ptr [rip + 0x393045] ; 0x100ace1f0
0x10073b1ab: vaddps xmm0, xmm2, xmm0
0x10073b1af: vmovaps xmmword ptr [rsp + 0xe0], xmm0
0x10073b1b8: lea rsi, [rsp + 0xe0]
0x10073b1c0: lea rdx, [rsp + 0x40]
0x10073b1c5: vmovss xmm0, dword ptr [rip + 0x36b8db] ; 0x100aa6aa8
0x10073b1cd: lea rcx, [rsp + 0x80]
0x10073b1d5: lea r8, [rsp + 0xa0]
0x10073b1dd: call 0x100776a90 ; 0x100776a90
0x10073b1e2: test al, al
0x10073b1e4: je 0x10073b22a
0x10073b1e6: vmovaps xmm0, xmmword ptr [rsp + 0xa0]
0x10073b1ef: vmovaps xmm2, xmmword ptr [rsp]
0x10073b1f4: vsubps xmm0, xmm0, xmm2
0x10073b1f8: vmulps xmm0, xmm0, xmm0
0x10073b1fc: vmovshdup xmm1, xmm0
0x10073b200: vaddss xmm1, xmm0, xmm1
0x10073b204: vpermilpd xmm0, xmm0, 1
0x10073b20a: vaddss xmm0, xmm0, xmm1
0x10073b20e: vsqrtss xmm0, xmm0, xmm0
0x10073b212: vmovss xmm1, dword ptr [rsp + 0x10]
0x10073b218: vucomiss xmm1, xmm0
0x10073b21c: vmovaps xmm1, xmm2
0x10073b220: jbe 0x10073b22f
0x10073b222: vmovss dword ptr [rsp + 0x10], xmm0
0x10073b228: jmp 0x10073b22f ; 0x10073b22f
0x10073b22a: vmovaps xmm1, xmmword ptr [rsp]
0x10073b22f: vmovaps xmm0, xmmword ptr [r12 + 0x70]
0x10073b236: vmovaps xmmword ptr [rsp + 0x40], xmm0
0x10073b23c: mov rdi, qword ptr [r13 + 0x138]
0x10073b243: vmulps xmm0, xmm0, xmmword ptr [rip + 0x36e0a5] ; 0x100aa92f0
0x10073b24b: vaddps xmm0, xmm1, xmm0
0x10073b24f: vmovaps xmmword ptr [rsp + 0xe0], xmm0
0x10073b258: lea rsi, [rsp + 0xe0]
0x10073b260: lea rdx, [rsp + 0x40]
0x10073b265: vmovss xmm0, dword ptr [rip + 0x36b83b] ; 0x100aa6aa8
0x10073b26d: lea rcx, [rsp + 0x80]
0x10073b275: lea r8, [rsp + 0xa0]
0x10073b27d: call 0x100776a90 ; 0x100776a90
0x10073b282: test al, al
0x10073b284: je 0x10073b2c6
0x10073b286: vmovaps xmm0, xmmword ptr [rsp + 0xa0]
0x10073b28f: vmovaps xmm2, xmmword ptr [rsp]
0x10073b294: vsubps xmm0, xmm0, xmm2
0x10073b298: vmulps xmm0, xmm0, xmm0
0x10073b29c: vmovshdup xmm1, xmm0
0x10073b2a0: vaddss xmm1, xmm0, xmm1
0x10073b2a4: vpermilpd xmm0, xmm0, 1
0x10073b2aa: vaddss xmm0, xmm0, xmm1
0x10073b2ae: vsqrtss xmm0, xmm0, xmm0
0x10073b2b2: vmovss xmm1, dword ptr [rsp + 0x10]
0x10073b2b8: vucomiss xmm1, xmm0
0x10073b2bc: jbe 0x10073b2cb
0x10073b2be: vmovss dword ptr [rsp + 0x10], xmm0
0x10073b2c4: jmp 0x10073b2cb ; 0x10073b2cb
0x10073b2c6: vmovaps xmm2, xmmword ptr [rsp]
0x10073b2cb: vmovaps xmm0, xmmword ptr [r12 + 0x70]
0x10073b2d2: vxorps xmm1, xmm0, xmmword ptr [rip + 0x36c626] ; 0x100aa7900
0x10073b2da: vmovaps xmmword ptr [rsp + 0x40], xmm1
0x10073b2e0: mov rdi, qword ptr [r13 + 0x138]
0x10073b2e7: vmulps xmm0, xmm0, xmmword ptr [rip + 0x392f01] ; 0x100ace1f0
0x10073b2ef: vaddps xmm0, xmm2, xmm0
0x10073b2f3: vmovaps xmmword ptr [rsp + 0xe0], xmm0
0x10073b2fc: lea rsi, [rsp + 0xe0]
0x10073b304: lea rdx, [rsp + 0x40]
0x10073b309: vmovss xmm0, dword ptr [rip + 0x36b797] ; 0x100aa6aa8
0x10073b311: lea rcx, [rsp + 0x80]
0x10073b319: lea r8, [rsp + 0xa0]
0x10073b321: call 0x100776a90 ; 0x100776a90
0x10073b326: test al, al
0x10073b328: je 0x10073b364
0x10073b32a: vmovaps xmm0, xmmword ptr [rsp + 0xa0]
0x10073b333: vsubps xmm0, xmm0, xmmword ptr [rsp]
0x10073b338: vmulps xmm0, xmm0, xmm0
0x10073b33c: vmovshdup xmm1, xmm0
0x10073b340: vaddss xmm1, xmm0, xmm1
0x10073b344: vpermilpd xmm0, xmm0, 1
0x10073b34a: vaddss xmm0, xmm0, xmm1
0x10073b34e: vsqrtss xmm0, xmm0, xmm0
0x10073b352: vmovss xmm4, dword ptr [rsp + 0x10]
0x10073b358: vucomiss xmm4, xmm0
0x10073b35c: jbe 0x10073b36a
0x10073b35e: vmovaps xmm4, xmm0
0x10073b362: jmp 0x10073b36a ; 0x10073b36a
0x10073b364: vmovss xmm4, dword ptr [rsp + 0x10]
0x10073b36a: vmovss xmm0, dword ptr [r14 + 0x384]
0x10073b373: vxorps xmm3, xmm3, xmm3
0x10073b377: vmovss xmm1, dword ptr [rip + 0x36fbcd] ; 0x100aaaf4c
0x10073b37f: vucomiss xmm1, xmm0
0x10073b383: jbe 0x10073b543
0x10073b389: vsubss xmm0, xmm4, xmm0
0x10073b38d: vxorps xmm1, xmm1, xmm1
0x10073b391: vmaxss xmm0, xmm1, xmm0
0x10073b395: vmovss xmm2, dword ptr [rip + 0x36c917] ; 0x100aa7cb4
0x10073b39d: vminss xmm0, xmm2, xmm0
0x10073b3a1: vmovaps xmm1, xmmword ptr [r12 + 0x50]
0x10073b3a8: vmulps xmm1, xmm1, xmm1
0x10073b3ac: vmovshdup xmm3, xmm1
0x10073b3b0: vaddss xmm3, xmm1, xmm3
0x10073b3b4: vpermilpd xmm1, xmm1, 1
0x10073b3ba: vaddss xmm1, xmm1, xmm3
0x10073b3be: vsqrtss xmm1, xmm1, xmm1
0x10073b3c2: vmulss xmm3, xmm1, dword ptr [rip + 0x36bd2a] ; 0x100aa70f4
0x10073b3ca: vmulss xmm3, xmm0, xmm3
0x10073b3ce: vmulss xmm3, xmm3, dword ptr [rsp + 0x30]
0x10073b3d4: vucomiss xmm0, xmm2
0x10073b3d8: jne 0x10073b3e0
0x10073b3da: jnp 0x10073b543
0x10073b3e0: vcvtss2sd xmm2, xmm0, xmm0
0x10073b3e4: vucomisd xmm2, qword ptr [rip + 0x37085c] ; 0x100aabc48
0x10073b3ec: jbe 0x10073b543
0x10073b3f2: mov rdi, qword ptr [r13 + 0x5c8]
0x10073b3f9: vxorps ymm2, ymm2, ymm2
0x10073b3fd: vmovaps ymmword ptr [rsp + 0x2a0], ymm2
0x10073b406: vmovaps ymmword ptr [rsp + 0x300], ymm2
0x10073b40f: vmovaps ymmword ptr [rsp + 0x2e0], ymm2
0x10073b418: vmovaps ymmword ptr [rsp + 0x2c0], ymm2
0x10073b421: mov byte ptr [rsp + 0x2ad], 1
0x10073b429: mov dword ptr [rsp + 0x2a0], 0x3f800000
0x10073b434: vmovss dword ptr [rsp], xmm3
0x10073b439: vmovaps xmm3, xmmword ptr [rbx]
0x10073b43d: vmovaps xmmword ptr [rsp + 0x2b0], xmm3
0x10073b446: movabs rax, 0x41f0000041200000
0x10073b450: mov qword ptr [rsp + 0x2e8], rax
0x10073b458: mov dword ptr [rsp + 0x310], 0xc31
0x10073b463: vmovaps ymmword ptr [rsp + 0xe0], ymm2
0x10073b46c: vmovaps ymmword ptr [rsp + 0x100], ymm2
0x10073b475: vmovups ymmword ptr [rsp + 0x26c], ymm2
0x10073b47e: vmovaps ymmword ptr [rsp + 0x260], ymm2
0x10073b487: vmovaps ymmword ptr [rsp + 0x240], ymm2
0x10073b490: vmovaps ymmword ptr [rsp + 0x220], ymm2
0x10073b499: vmovaps ymmword ptr [rsp + 0x200], ymm2
0x10073b4a2: vmovaps ymmword ptr [rsp + 0x1e0], ymm2
0x10073b4ab: vmovaps ymmword ptr [rsp + 0x1c0], ymm2
0x10073b4b4: vmovaps ymmword ptr [rsp + 0x1a0], ymm2
0x10073b4bd: vmovaps ymmword ptr [rsp + 0x180], ymm2
0x10073b4c6: vmovaps ymmword ptr [rsp + 0x160], ymm2
0x10073b4cf: vmovaps ymmword ptr [rsp + 0x140], ymm2
0x10073b4d8: vmovaps ymmword ptr [rsp + 0x120], ymm2
0x10073b4e1: mov word ptr [rsp + 0xe0], 0x4321
0x10073b4eb: vmovss dword ptr [rsp + 0x100], xmm1
0x10073b4f4: vmovss dword ptr [rsp + 0x104], xmm0
0x10073b4fd: mov dword ptr [rsp + 0x280], 3
0x10073b508: mov dword ptr [rsp + 0x28c], 2
0x10073b513: lea rsi, [rip + 0x461f81] ; 0x100b9d49b whippast
0x10073b51a: lea rdx, [rsp + 0x2a0]
0x10073b522: lea rcx, [rsp + 0xe0]
0x10073b52a: vmovss dword ptr [rsp + 0x10], xmm4
0x10073b530: vzeroupper 
0x10073b533: call 0x1006018a0 ; 0x1006018a0
0x10073b538: vmovss xmm3, dword ptr [rsp]
0x10073b53d: vmovss xmm4, dword ptr [rsp + 0x10]
0x10073b543: vmovss dword ptr [rsp], xmm3
0x10073b548: vmovss dword ptr [r14 + 0x384], xmm4
0x10073b551: vmovss xmm0, dword ptr [r12 + 0xb48]
0x10073b55b: vmovss dword ptr [rsp + 0x10], xmm0
0x10073b561: mov rsi, qword ptr [r13 + 0x2c8]
0x10073b568: lea rdi, [rsp + 0xd0]
0x10073b570: mov rdx, rbx
0x10073b573: call 0x100328200 ; 0x100328200
0x10073b578: vmovaps xmm0, xmmword ptr [rsp + 0xd0]
0x10073b581: vsubps xmm0, xmm0, xmmword ptr [r12 + 0x50]
0x10073b588: vmulps xmm0, xmm0, xmm0
0x10073b58c: vmovshdup xmm1, xmm0
0x10073b590: vaddss xmm1, xmm0, xmm1
0x10073b594: vpermilpd xmm0, xmm0, 1
0x10073b59a: vaddss xmm0, xmm0, xmm1
0x10073b59e: vmulss xmm0, xmm0, dword ptr [rip + 0x39ecbe] ; 0x100ada264
0x10073b5a6: vmulss xmm1, xmm0, dword ptr [rip + 0x36d086] ; 0x100aa8634
0x10073b5ae: vmovss xmm2, dword ptr [rsp + 0x10]
0x10073b5b4: vcmpeqss xmm2, xmm2, dword ptr [rip + 0x369b03] ; 0x100aa50c0
0x10073b5bd: vblendvps xmm0, xmm0, xmm1, xmm2
0x10073b5c3: vmovss xmm1, dword ptr [rip + 0x36d03d] ; 0x100aa8608
0x10073b5cb: vminss xmm1, xmm1, xmm0
0x10073b5cf: vxorps xmm4, xmm4, xmm4
0x10073b5d3: vaddss xmm0, xmm1, dword ptr [rip + 0x36d0cd] ; 0x100aa86a8
0x10073b5db: cmp byte ptr [r12 + 0xbb0], 0
0x10073b5e4: vxorps xmm2, xmm2, xmm2
0x10073b5e8: je 0x10073b60b
0x10073b5ea: vmovss xmm2, dword ptr [rip + 0x36f95a] ; 0x100aaaf4c
0x10073b5f2: vsubss xmm3, xmm2, dword ptr [r14 + 0x384]
0x10073b5fb: vdivss xmm2, xmm3, xmm2
0x10073b5ff: vmaxss xmm2, xmm4, xmm2
0x10073b603: vmulss xmm1, xmm2, xmm1
0x10073b607: vaddss xmm2, xmm1, xmm1
0x10073b60b: vaddss xmm0, xmm0, xmm2
0x10073b60f: vmulss xmm1, xmm0, dword ptr [rip + 0x36e059] ; 0x100aa9670
0x10073b617: vmovss dword ptr [rsp + 0x2c], xmm1
0x10073b61d: vmulss xmm0, xmm0, dword ptr [rip + 0x36dba3] ; 0x100aa91c8
0x10073b625: vaddss xmm0, xmm0, dword ptr [rsp]
0x10073b62a: vmovss dword ptr [rsp + 0x10], xmm0
0x10073b630: vmovss xmm0, dword ptr [rsp + 0x30]
0x10073b636: vmulss xmm0, xmm0, dword ptr [rip + 0x36d372] ; 0x100aa89b0
0x10073b63e: call 0x100aa2708 ; 0x100aa2708 _expf
0x10073b643: vmovss xmm1, dword ptr [rip + 0x369a75] ; 0x100aa50c0
0x10073b64b: vsubss xmm0, xmm1, xmm0
0x10073b64f: vmovss dword ptr [rsp + 0x58], xmm0
0x10073b655: vxorps xmm2, xmm2, xmm2
0x10073b659: vmaxss xmm0, xmm2, xmm0
0x10073b65d: vminss xmm0, xmm1, xmm0
0x10073b661: vsubss xmm1, xmm1, xmm0
0x10073b665: vmulss xmm2, xmm1, dword ptr [r14 + 0x370]
0x10073b66e: vmulss xmm3, xmm0, dword ptr [rsp + 0x2c]
0x10073b674: vaddss xmm2, xmm2, xmm3
0x10073b678: vmovss dword ptr [rsp], xmm2
0x10073b67d: vmovss dword ptr [r14 + 0x370], xmm2
0x10073b686: vmulss xmm1, xmm1, dword ptr [r14 + 0x374]
0x10073b68f: vmulss xmm0, xmm0, dword ptr [rsp + 0x10]
0x10073b695: vaddss xmm0, xmm1, xmm0
0x10073b699: vmovss dword ptr [rsp + 0x10], xmm0
0x10073b69f: vmovss dword ptr [r14 + 0x374], xmm0
0x10073b6a8: vmovss xmm0, dword ptr [r14 + 0x380]
0x10073b6b1: vmovss dword ptr [rsp + 0x2c], xmm0
0x10073b6b7: vmovss xmm1, dword ptr [rip + 0x36b3e5] ; 0x100aa6aa4
0x10073b6bf: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x10073b6c4: vmovss xmm1, dword ptr [rip + 0x3699f4] ; 0x100aa50c0
0x10073b6cc: vsubss xmm1, xmm1, xmm0
0x10073b6d0: vmulss xmm1, xmm1, dword ptr [rsp]
0x10073b6d5: vmulss xmm0, xmm0, dword ptr [r14 + 0x378]
0x10073b6de: vaddss xmm0, xmm0, xmm1
0x10073b6e2: vmovss dword ptr [rsp], xmm0
0x10073b6e7: vmovss xmm1, dword ptr [rip + 0x36b3b9] ; 0x100aa6aa8
0x10073b6ef: vmovss xmm0, dword ptr [rsp + 0x2c]
0x10073b6f5: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x10073b6fa: vmovss xmm1, dword ptr [rip + 0x3699be] ; 0x100aa50c0
0x10073b702: vsubss xmm1, xmm1, xmm0
0x10073b706: vmulss xmm1, xmm1, dword ptr [rsp + 0x10]
0x10073b70c: vmulss xmm0, xmm0, dword ptr [r14 + 0x37c]
0x10073b715: vaddss xmm0, xmm0, xmm1
0x10073b719: vmovss dword ptr [rsp + 0x5c], xmm0
0x10073b71f: vmovss xmm0, dword ptr [rsp]
0x10073b724: vmulss xmm0, xmm0, dword ptr [rsp + 0x30]
0x10073b72a: vmulss xmm1, xmm0, dword ptr [rip + 0x373f96] ; 0x100aaf6c8
0x10073b732: vmovss xmm2, dword ptr [rip + 0x36cefa] ; 0x100aa8634
0x10073b73a: vmovaps xmm3, xmm2
0x10073b73e: vmulss xmm1, xmm1, xmm3
0x10073b742: vaddss xmm2, xmm1, dword ptr [r14 + 0x360]
0x10073b74b: vmovss dword ptr [r14 + 0x360], xmm2
0x10073b754: vmulss xmm1, xmm0, dword ptr [rip + 0x373f70] ; 0x100aaf6cc
0x10073b75c: vmulss xmm1, xmm1, xmm3
0x10073b760: vaddss xmm1, xmm1, dword ptr [r14 + 0x364]
0x10073b769: vmovss dword ptr [r14 + 0x364], xmm1
0x10073b772: vmulss xmm0, xmm0, dword ptr [rip + 0x373f56] ; 0x100aaf6d0
0x10073b77a: vmulss xmm0, xmm0, xmm3
0x10073b77e: vaddss xmm0, xmm0, dword ptr [r14 + 0x368]
0x10073b787: vmovss dword ptr [r14 + 0x368], xmm0
0x10073b790: xor ebx, ebx
0x10073b792: jmp 0x10073b7ad ; 0x10073b7ad
0x10073b794: nop word ptr cs:[rax + rax]
0x10073b7a0: vmovss xmm2, dword ptr [r14 + rbx*4 + 0x364]
0x10073b7aa: inc rbx
0x10073b7ad: vmovss dword ptr [rsp + 0x30], xmm2
0x10073b7b3: vcvttss2si rax, xmm2
0x10073b7b8: lea ecx, [rax + 1]
0x10073b7bb: mov edx, eax
0x10073b7bd: shl edx, 0xd
0x10073b7c0: xor edx, eax
0x10073b7c2: mov esi, edx
0x10073b7c4: imul esi, esi
0x10073b7c7: imul esi, esi, 0x3d73
0x10073b7cd: add esi, 0xc0ae5
0x10073b7d3: imul esi, edx
0x10073b7d6: add esi, 0x5208dd0d
0x10073b7dc: and esi, 0x7fffffff
0x10073b7e2: vcvtsi2ss xmm0, xmm6, esi
0x10073b7e6: vmovss xmm1, dword ptr [rip + 0x36f3ca] ; 0x100aaabb8
0x10073b7ee: vmulss xmm0, xmm0, xmm1
0x10073b7f2: vmovaps xmm3, xmm1
0x10073b7f6: vmovss xmm1, dword ptr [rip + 0x3698c2] ; 0x100aa50c0
0x10073b7fe: vsubss xmm0, xmm1, xmm0
0x10073b802: vmovaps xmm4, xmm1
0x10073b806: vmovss xmm1, dword ptr [rip + 0x368daa] ; 0x100aa45b8
0x10073b80e: vmulss xmm0, xmm0, xmm1
0x10073b812: vmovss dword ptr [rsp + 0x10], xmm0
0x10073b818: mov edx, ecx
0x10073b81a: shl edx, 0xd
0x10073b81d: xor edx, ecx
0x10073b81f: mov ecx, edx
0x10073b821: imul ecx, ecx
0x10073b824: imul ecx, ecx, 0x3d73
0x10073b82a: add ecx, 0xc0ae5
0x10073b830: imul ecx, edx
0x10073b833: add ecx, 0x5208dd0d
0x10073b839: and ecx, 0x7fffffff
0x10073b83f: vcvtsi2ss xmm0, xmm6, ecx
0x10073b843: vmulss xmm0, xmm0, xmm3
0x10073b847: vsubss xmm0, xmm4, xmm0
0x10073b84b: vmulss xmm0, xmm0, xmm1
0x10073b84f: vmovss dword ptr [rsp], xmm0
0x10073b854: mov eax, eax
0x10073b856: vcvtsi2ss xmm0, xmm6, rax
0x10073b85b: vsubss xmm0, xmm2, xmm0
0x10073b85f: vmovss xmm1, dword ptr [rip + 0x36cd99] ; 0x100aa8600
0x10073b867: vmulss xmm0, xmm0, xmm1
0x10073b86b: call 0x100aa260c ; 0x100aa260c _cosf
0x10073b870: vmovss xmm2, dword ptr [rip + 0x369848] ; 0x100aa50c0
0x10073b878: vsubss xmm0, xmm2, xmm0
0x10073b87c: vmovss xmm3, dword ptr [rip + 0x368d34] ; 0x100aa45b8
0x10073b884: vmulss xmm0, xmm0, xmm3
0x10073b888: vmulss xmm1, xmm0, dword ptr [rsp]
0x10073b88d: vsubss xmm0, xmm2, xmm0
0x10073b891: vmovaps xmm4, xmm2
0x10073b895: vmulss xmm0, xmm0, dword ptr [rsp + 0x10]
0x10073b89b: vaddss xmm0, xmm0, xmm1
0x10073b89f: vmovss dword ptr [rsp + 0x10], xmm0
0x10073b8a5: vmovss xmm0, dword ptr [rsp + 0x30]
0x10073b8ab: vaddss xmm0, xmm0, xmm0
0x10073b8af: vcvttss2si rax, xmm0
0x10073b8b4: lea ecx, [rax + 1]
0x10073b8b7: mov edx, eax
0x10073b8b9: shl edx, 0xd
0x10073b8bc: xor edx, eax
0x10073b8be: mov esi, edx
0x10073b8c0: imul esi, esi
0x10073b8c3: imul esi, esi, 0x3d73
0x10073b8c9: add esi, 0xc0ae5
0x10073b8cf: imul esi, edx
0x10073b8d2: add esi, 0x5208dd0d
0x10073b8d8: and esi, 0x7fffffff
0x10073b8de: vcvtsi2ss xmm1, xmm6, esi
0x10073b8e2: vmovss xmm2, dword ptr [rip + 0x36f2ce] ; 0x100aaabb8
0x10073b8ea: vmulss xmm1, xmm1, xmm2
0x10073b8ee: vsubss xmm1, xmm4, xmm1
0x10073b8f2: vmulss xmm1, xmm1, xmm3
0x10073b8f6: vmovss dword ptr [rsp], xmm1
0x10073b8fb: mov edx, ecx
0x10073b8fd: shl edx, 0xd
0x10073b900: xor edx, ecx
0x10073b902: mov ecx, edx
0x10073b904: imul ecx, ecx
0x10073b907: imul ecx, ecx, 0x3d73
0x10073b90d: add ecx, 0xc0ae5
0x10073b913: imul ecx, edx
0x10073b916: add ecx, 0x5208dd0d
0x10073b91c: and ecx, 0x7fffffff
0x10073b922: vcvtsi2ss xmm1, xmm6, ecx
0x10073b926: vmulss xmm1, xmm1, xmm2
0x10073b92a: vsubss xmm1, xmm4, xmm1
0x10073b92e: vmulss xmm1, xmm1, xmm3
0x10073b932: vmovss dword ptr [rsp + 0x2c], xmm1
0x10073b938: mov eax, eax
0x10073b93a: vcvtsi2ss xmm1, xmm5, rax
0x10073b93f: vsubss xmm0, xmm0, xmm1
0x10073b943: vmulss xmm0, xmm0, dword ptr [rip + 0x36ccb5] ; 0x100aa8600
0x10073b94b: call 0x100aa260c ; 0x100aa260c _cosf
0x10073b950: vmovss xmm2, dword ptr [rip + 0x369768] ; 0x100aa50c0
0x10073b958: vsubss xmm0, xmm2, xmm0
0x10073b95c: vmovss xmm4, dword ptr [rip + 0x368c54] ; 0x100aa45b8
0x10073b964: vmulss xmm0, xmm0, xmm4
0x10073b968: vmulss xmm1, xmm0, dword ptr [rsp + 0x2c]
0x10073b96e: vsubss xmm0, xmm2, xmm0
0x10073b972: vmulss xmm0, xmm0, dword ptr [rsp]
0x10073b977: vaddss xmm0, xmm0, xmm1
0x10073b97b: vmulss xmm0, xmm0, dword ptr [rip + 0x36ccd5] ; 0x100aa8658
0x10073b983: vaddss xmm0, xmm0, dword ptr [rsp + 0x10]
0x10073b989: vmovss dword ptr [rsp + 0x10], xmm0
0x10073b98f: vmovss xmm0, dword ptr [rsp + 0x30]
0x10073b995: vmulss xmm0, xmm0, dword ptr [rip + 0x36bf1f] ; 0x100aa78bc
0x10073b99d: vcvttss2si rax, xmm0
0x10073b9a2: lea ecx, [rax + 1]
0x10073b9a5: mov edx, eax
0x10073b9a7: shl edx, 0xd
0x10073b9aa: xor edx, eax
0x10073b9ac: mov esi, edx
0x10073b9ae: imul esi, esi
0x10073b9b1: imul esi, esi, 0x3d73
0x10073b9b7: add esi, 0xc0ae5
0x10073b9bd: imul esi, edx
0x10073b9c0: add esi, 0x5208dd0d
0x10073b9c6: and esi, 0x7fffffff
0x10073b9cc: vcvtsi2ss xmm1, xmm5, esi
0x10073b9d0: vmovss xmm3, dword ptr [rip + 0x36f1e0] ; 0x100aaabb8
0x10073b9d8: vmulss xmm1, xmm1, xmm3
0x10073b9dc: vsubss xmm1, xmm2, xmm1
0x10073b9e0: vmovaps xmm5, xmm2
0x10073b9e4: vmovaps xmm2, xmm4
0x10073b9e8: vmulss xmm1, xmm1, xmm2
0x10073b9ec: vmovss dword ptr [rsp + 0x30], xmm1
0x10073b9f2: mov edx, ecx
0x10073b9f4: shl edx, 0xd
0x10073b9f7: xor edx, ecx
0x10073b9f9: mov ecx, edx
0x10073b9fb: imul ecx, ecx
0x10073b9fe: imul ecx, ecx, 0x3d73
0x10073ba04: add ecx, 0xc0ae5
0x10073ba0a: imul ecx, edx
0x10073ba0d: add ecx, 0x5208dd0d
0x10073ba13: and ecx, 0x7fffffff
0x10073ba19: vcvtsi2ss xmm1, xmm6, ecx
0x10073ba1d: vmulss xmm1, xmm1, xmm3
0x10073ba21: vsubss xmm1, xmm5, xmm1
0x10073ba25: vmulss xmm1, xmm1, xmm2
0x10073ba29: vmovss dword ptr [rsp], xmm1
0x10073ba2e: mov eax, eax
0x10073ba30: vcvtsi2ss xmm1, xmm6, rax
0x10073ba35: vsubss xmm0, xmm0, xmm1
0x10073ba39: vmulss xmm0, xmm0, dword ptr [rip + 0x36cbbf] ; 0x100aa8600
0x10073ba41: call 0x100aa260c ; 0x100aa260c _cosf
0x10073ba46: vmovss xmm2, dword ptr [rip + 0x369672] ; 0x100aa50c0
0x10073ba4e: vsubss xmm0, xmm2, xmm0
0x10073ba52: vmulss xmm0, xmm0, dword ptr [rip + 0x368b5e] ; 0x100aa45b8
0x10073ba5a: vmulss xmm1, xmm0, dword ptr [rsp]
0x10073ba5f: vsubss xmm0, xmm2, xmm0
0x10073ba63: vmulss xmm0, xmm0, dword ptr [rsp + 0x30]
0x10073ba69: vaddss xmm0, xmm0, xmm1
0x10073ba6d: vmulss xmm0, xmm0, dword ptr [rip + 0x373c5f] ; 0x100aaf6d4
0x10073ba75: vaddss xmm0, xmm0, dword ptr [rsp + 0x10]
0x10073ba7b: vmulss xmm0, xmm0, dword ptr [rsp + 0x5c]
0x10073ba81: vxorps xmm1, xmm1, xmm1
0x10073ba85: vmulss xmm1, xmm0, xmm1
0x10073ba89: vmovss dword ptr [rsp + rbx*4 + 0x60], xmm1
0x10073ba8f: vaddss xmm0, xmm0, xmm0
0x10073ba93: vmovss dword ptr [r15 + rbx*4], xmm0
0x10073ba99: cmp rbx, 2
0x10073ba9d: jne 0x10073b7a0
0x10073baa3: vmovss xmm0, dword ptr [r14 + 0x290]
0x10073baac: vmovss dword ptr [rsp + 0x30], xmm0
0x10073bab2: vmovss xmm0, dword ptr [r14 + 0x298]
0x10073babb: vcvtss2sd xmm0, xmm0, xmm0
0x10073babf: vaddsd xmm0, xmm0, qword ptr [rip + 0x36dc31] ; 0x100aa96f8
0x10073bac7: vmovss xmm1, dword ptr [rsp + 0x60]
0x10073bacd: vcvtss2sd xmm1, xmm1, xmm1
0x10073bad1: vaddsd xmm0, xmm0, xmm1
0x10073bad5: vcvtsd2ss xmm0, xmm0, xmm0
0x10073bad9: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x10073bade: vxorps xmm1, xmm0, xmmword ptr [rip + 0x36be1a] ; 0x100aa7900
0x10073bae6: vinsertps xmm2, xmm0, xmm0, 0x4e
0x10073baec: vinsertps xmm1, xmm2, xmm1, 0x20
0x10073baf2: vmovaps xmmword ptr [rsp + 0x10], xmm1
0x10073baf8: vxorps xmm1, xmm1, xmm1
0x10073bafc: vunpcklps xmm0, xmm0, xmm1
0x10073bb00: vmovaps xmmword ptr [rsp], xmm0
0x10073bb05: vmovss xmm0, dword ptr [rsp + 0x30]
0x10073bb0b: vaddss xmm0, xmm0, dword ptr [rsp + 0x64]
0x10073bb11: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x10073bb16: vinsertps xmm1, xmm0, xmm0, 0x29
0x10073bb1c: vxorps xmm2, xmm0, xmmword ptr [rip + 0x36bddc] ; 0x100aa7900
0x10073bb24: vxorps xmm4, xmm4, xmm4
0x10073bb28: vinsertps xmm2, xmm4, xmm2, 0x10
0x10073bb2e: vinsertps xmm0, xmm2, xmm0, 0x60
0x10073bb34: vmovddup xmm2, qword ptr [rip + 0x36bd9c] ; 0x100aa78d8
0x10073bb3c: vmovaps xmm5, xmmword ptr [rsp]
0x10073bb41: vmulps xmm3, xmm5, xmm4
0x10073bb45: vmovaps xmm6, xmmword ptr [rsp + 0x10]
0x10073bb4b: vaddps xmm3, xmm3, xmm6
0x10073bb4f: vmovaps xmmword ptr [rsp + 0x30], xmm3
0x10073bb55: vmulps xmm3, xmm6, xmm4
0x10073bb59: vpermilps xmm4, xmm1, 0xd5
0x10073bb5f: vmulps xmm4, xmm4, xmm2
0x10073bb63: vaddps xmm4, xmm4, xmm3
0x10073bb67: vpermilps xmm1, xmm1, 0xea
0x10073bb6d: vmulps xmm1, xmm5, xmm1
0x10073bb71: vaddps xmm1, xmm1, xmm4
0x10073bb75: vmovaps xmmword ptr [rsp + 0x10], xmm1
0x10073bb7b: vpermilps xmm1, xmm0, 0xd5
0x10073bb81: vmulps xmm1, xmm1, xmm2
0x10073bb85: vaddps xmm1, xmm1, xmm3
0x10073bb89: vpermilps xmm0, xmm0, 0xea
0x10073bb8f: vmulps xmm0, xmm5, xmm0
0x10073bb93: vaddps xmm0, xmm0, xmm1
0x10073bb97: vmovaps xmmword ptr [rsp], xmm0
0x10073bb9c: vmovss xmm0, dword ptr [r14 + 0x388]
0x10073bba5: vsubss xmm0, xmm0, dword ptr [r14 + 0x2dc]
0x10073bbae: vxorps xmm1, xmm1, xmm1
0x10073bbb2: vmulss xmm1, xmm1, dword ptr [rsp + 0x68]
0x10073bbb8: vaddss xmm0, xmm0, xmm1
0x10073bbbc: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x10073bbc1: vxorps xmm5, xmm5, xmm5
0x10073bbc5: vshufps xmm1, xmm0, xmm5, 0x41
0x10073bbca: vxorps xmm2, xmm0, xmmword ptr [rip + 0x36bd2e] ; 0x100aa7900
0x10073bbd2: vinsertps xmm0, xmm2, xmm0, 0x5c
0x10073bbd8: vpermilps xmm2, xmm1, 0xc0
0x10073bbde: vmovaps xmm4, xmmword ptr [rsp + 0x30]
0x10073bbe4: vmulps xmm2, xmm4, xmm2
0x10073bbe8: vpermilps xmm1, xmm1, 0xd5
0x10073bbee: vmovaps xmm6, xmmword ptr [rsp + 0x10]
0x10073bbf4: vmulps xmm1, xmm6, xmm1
0x10073bbf8: vaddps xmm1, xmm1, xmm2
0x10073bbfc: vmovaps xmm7, xmmword ptr [rsp]
0x10073bc01: vmulps xmm2, xmm7, xmm5
0x10073bc05: vaddps xmm1, xmm2, xmm1
0x10073bc09: vpermilps xmm3, xmm0, 0xc0
0x10073bc0f: vmulps xmm3, xmm4, xmm3
0x10073bc13: vpermilps xmm0, xmm0, 0xd5
0x10073bc19: vmulps xmm0, xmm6, xmm0
0x10073bc1d: vaddps xmm0, xmm0, xmm3
0x10073bc21: vaddps xmm0, xmm2, xmm0
0x10073bc25: vmulps xmm2, xmm4, xmm5
0x10073bc29: vmulps xmm3, xmm6, xmm5
0x10073bc2d: vaddps xmm2, xmm3, xmm2
0x10073bc31: vaddps xmm2, xmm7, xmm2
0x10073bc35: vinsertf128 ymm0, ymm1, xmm0, 1
0x10073bc3b: mov rax, qword ptr [rsp + 0x78]
0x10073bc40: vmovups ymmword ptr [rax], ymm0
0x10073bc44: vmovaps xmmword ptr [rax + 0x20], xmm2
0x10073bc49: vmovss xmm0, dword ptr [rip + 0x36946f] ; 0x100aa50c0
0x10073bc51: vmovss xmm1, dword ptr [rsp + 0x58]
0x10073bc57: vsubss xmm0, xmm0, xmm1
0x10073bc5b: vmulss xmm0, xmm0, dword ptr [r14 + 0x380]
0x10073bc64: vmulss xmm1, xmm1, dword ptr [rip + 0x36b478] ; 0x100aa70e4
0x10073bc6c: vaddss xmm0, xmm1, xmm0
0x10073bc70: vmovss dword ptr [r14 + 0x380], xmm0
0x10073bc79: mov rax, qword ptr [rip + 0x4d1c58] ; 0x100c0d8d8
0x10073bc80: mov rax, qword ptr [rax]
0x10073bc83: cmp rax, qword ptr [rsp + 0x320]
0x10073bc8b: jne 0x10073bc9f
0x10073bc8d: lea rsp, [rbp - 0x28]
0x10073bc91: pop rbx
0x10073bc92: pop r12
0x10073bc94: pop r13
0x10073bc96: pop r14
0x10073bc98: pop r15
0x10073bc9a: pop rbp
0x10073bc9b: vzeroupper 
0x10073bc9e: ret 
0x10073bc9f: vzeroupper 
0x10073bca2: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10073bca7: nop word ptr [rax + rax]
