0x10026c670: push rbp
0x10026c671: mov rbp, rsp
0x10026c674: push r15
0x10026c676: push r14
0x10026c678: push r13
0x10026c67a: push r12
0x10026c67c: push rbx
0x10026c67d: sub rsp, 0x188
0x10026c684: mov r14, r9
0x10026c687: mov qword ptr [rbp - 0x38], r8
0x10026c68b: mov rbx, rdx
0x10026c68e: mov r12, rdi
0x10026c691: mov dword ptr [r12 + 0x58], esi
0x10026c696: lea r13, [r12 + 0x10]
0x10026c69b: vmovaps xmm0, xmmword ptr [r12 + 0x40]
0x10026c6a2: vmovaps xmmword ptr [r12 + 0x60], xmm0
0x10026c6a9: vmovaps xmmword ptr [r12 + 0xe0], xmm0
0x10026c6b3: lea rdi, [rbp - 0x190]
0x10026c6ba: mov rsi, r13
0x10026c6bd: call 0x100789f00 ; 0x100789f00
0x10026c6c2: vmovaps xmm0, xmmword ptr [rbp - 0x190]
0x10026c6ca: vmulps xmm1, xmm0, xmmword ptr [rip + 0x83b9be] ; 0x100aa8090
0x10026c6d2: vmovshdup xmm0, xmm1
0x10026c6d6: vmovaps xmmword ptr [r12 + 0xd0], xmm1
0x10026c6e0: vmovaps xmm2, xmmword ptr [r12 + 0x10]
0x10026c6e7: vmovaps xmm3, xmmword ptr [r12 + 0x20]
0x10026c6ee: vmovaps xmm4, xmmword ptr [r12 + 0x30]
0x10026c6f5: vmovaps xmm6, xmmword ptr [rip + 0x83b213] ; 0x100aa7910
0x10026c6fd: vandps xmm7, xmm1, xmm6
0x10026c701: vmovss xmm5, dword ptr [rip + 0x83a393] ; 0x100aa6a9c
0x10026c709: vucomiss xmm5, xmm7
0x10026c70d: jae 0x10026c75f
0x10026c70f: vandps xmm6, xmm0, xmm6
0x10026c713: vucomiss xmm5, xmm6
0x10026c717: jae 0x10026c75f
0x10026c719: vpermilpd xmm6, xmm1, 1
0x10026c71f: vandpd xmm7, xmm6, xmmword ptr [rip + 0x83b1e9] ; 0x100aa7910
0x10026c727: vucomiss xmm5, xmm7
0x10026c72b: jae 0x10026c75f
0x10026c72d: vmovss xmm5, dword ptr [rip + 0x83898b] ; 0x100aa50c0
0x10026c735: vdivss xmm7, xmm5, xmm1
0x10026c739: vdivss xmm8, xmm5, xmm0
0x10026c73d: vdivss xmm5, xmm5, xmm6
0x10026c741: vpermilps xmm6, xmm7, 0xc0
0x10026c747: vmulps xmm2, xmm2, xmm6
0x10026c74b: vpermilps xmm6, xmm8, 0xc0
0x10026c751: vmulps xmm3, xmm3, xmm6
0x10026c755: vpermilps xmm5, xmm5, 0xc0
0x10026c75b: vmulps xmm4, xmm4, xmm5
0x10026c75f: vmovaps xmmword ptr [r12 + 0x70], xmm2
0x10026c766: vmovaps xmmword ptr [r12 + 0x80], xmm3
0x10026c770: vmovaps xmmword ptr [r12 + 0x90], xmm4
0x10026c77a: vxorps xmm2, xmm2, xmm2
0x10026c77e: vmovaps xmmword ptr [r12 + 0xa0], xmm2
0x10026c788: vpermilpd xmm2, xmm1, 1
0x10026c78e: vmaxss xmm3, xmm2, xmm1
0x10026c792: vcmpunordss xmm1, xmm1, xmm1
0x10026c797: vblendvps xmm1, xmm3, xmm2, xmm1
0x10026c79d: vcmpunordss xmm2, xmm1, xmm1
0x10026c7a2: vmaxss xmm1, xmm0, xmm1
0x10026c7a6: vblendvps xmm0, xmm1, xmm0, xmm2
0x10026c7ac: vmovss dword ptr [r12 + 0xb0], xmm0
0x10026c7b6: movabs rax, 0x3f80000040800000
0x10026c7c0: mov qword ptr [r12 + 0xb4], rax
0x10026c7c8: mov dword ptr [r12 + 0x100], 0x40800000
0x10026c7d4: mov byte ptr [r12 + 0x2c5], 0
0x10026c7dd: xor esi, esi
0x10026c7df: mov rdi, r12
0x10026c7e2: call 0x10026d0f0 ; 0x10026d0f0
0x10026c7e7: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10026c7ec: vcvtsi2ss xmm0, xmm9, eax
0x10026c7f0: vmulss xmm0, xmm0, dword ptr [rip + 0x83a8f8] ; 0x100aa70f0
0x10026c7f8: vmovss xmm1, dword ptr [rip + 0x8388c0] ; 0x100aa50c0
0x10026c800: vsubss xmm1, xmm1, xmm0
0x10026c804: vmulss xmm1, xmm1, dword ptr [rip + 0x83be60] ; 0x100aa866c
0x10026c80c: vmulss xmm0, xmm0, dword ptr [rip + 0x83b4a4] ; 0x100aa7cb8
0x10026c814: vaddss xmm0, xmm0, xmm1
0x10026c818: vmovss dword ptr [r12 + 0x128], xmm0
0x10026c822: mov dword ptr [r12 + 0x2e0], 0
0x10026c82e: mov dword ptr [r12 + 0x140], 0
0x10026c83a: mov word ptr [r12 + 0x2c1], 0
0x10026c845: movabs rax, 0x700000000
0x10026c84f: mov qword ptr [rbp - 0xf8], rax
0x10026c856: mov byte ptr [rbp - 0xec], 0
0x10026c85d: mov dword ptr [rbp - 0xf0], 0
0x10026c867: mov word ptr [rbp - 0xeb], 1
0x10026c870: mov dword ptr [rbp - 0xe8], 0x447a0000
0x10026c87a: mov word ptr [rbp - 0xe4], 0
0x10026c883: movabs rax, 0x3f8000003f800000
0x10026c88d: mov qword ptr [rbp - 0xe0], rax
0x10026c894: mov byte ptr [rbp - 0xd8], 0
0x10026c89b: mov qword ptr [rbp - 0xd4], 0x3eb33333
0x10026c8a6: mov dword ptr [rbp - 0xcc], 0xc11cf5c3
0x10026c8b0: mov byte ptr [rbp - 0xc8], 0
0x10026c8b7: mov byte ptr [rbp - 0xc6], 0
0x10026c8be: mov dword ptr [rbp - 0xc4], 0
0x10026c8c8: movabs rax, 0x3f8000003cf5c28f
0x10026c8d2: mov qword ptr [rbp - 0xb8], rax
0x10026c8d9: mov byte ptr [rbp - 0xb0], 1
0x10026c8e0: mov dword ptr [rbp - 0xac], 0
0x10026c8ea: mov dword ptr [rbp - 0xa8], 1
0x10026c8f4: mov dword ptr [rbp - 0xa4], 0x3f800000
0x10026c8fe: mov byte ptr [rbp - 0xa0], 0
0x10026c905: mov byte ptr [rbp - 0x9f], 0
0x10026c90c: mov byte ptr [rbp - 0xee], 0
0x10026c913: mov byte ptr [rbp - 0xc7], 1
0x10026c91a: mov word ptr [rbp - 0xd0], 0x101
0x10026c923: mov byte ptr [rbp - 0xf0], 1
0x10026c92a: lea rsi, [rip + 0x91024a] ; 0x100b7cb7b CharDarkCreatureAnim
0x10026c931: lea rdx, [rip + 0x8f990a] ; 0x100b66242 Mesh
0x10026c938: lea r8, [rbp - 0xf8]
0x10026c93f: mov rdi, rbx
0x10026c942: mov rcx, r13
0x10026c945: call 0x10046c700 ; 0x10046c700
0x10026c94a: mov qword ptr [r12 + 0x1e0], rax
0x10026c952: lea rdi, [rbp - 0x1b0]
0x10026c959: call 0x1007c2530 ; 0x1007c2530
0x10026c95e: call 0x10079ac90 ; 0x10079ac90
0x10026c963: mov r15, qword ptr [rbp + 0x18]
0x10026c967: lea rdx, [rip + 0x90a1d7] ; 0x100b76b45 Noise3Ch
0x10026c96e: mov rdi, r15
0x10026c971: mov rsi, rax
0x10026c974: call 0x1007c4360 ; 0x1007c4360
0x10026c979: test rax, rax
0x10026c97c: je 0x10026c98f
0x10026c97e: lea rsi, [rbp - 0x1b0]
0x10026c985: mov rdi, rax
0x10026c988: call 0x1007c2310 ; 0x1007c2310
0x10026c98d: jmp 0x10026c9a7 ; 0x10026c9a7
0x10026c98f: call 0x10079ac90 ; 0x10079ac90
0x10026c994: mov rsi, qword ptr [rax + 8]
0x10026c998: lea rdx, [rip + 0x90a1a6] ; 0x100b76b45 Noise3Ch
0x10026c99f: mov rdi, r15
0x10026c9a2: call 0x1007c4640 ; 0x1007c4640
0x10026c9a7: lea rdi, [rbp - 0x178]
0x10026c9ae: call 0x1007c2530 ; 0x1007c2530
0x10026c9b3: call 0x10079ac90 ; 0x10079ac90
0x10026c9b8: lea rdx, [rip + 0x9101d1] ; 0x100b7cb90 AvatarMaskBasicTex
0x10026c9bf: mov rdi, r15
0x10026c9c2: mov rsi, rax
0x10026c9c5: call 0x1007c4360 ; 0x1007c4360
0x10026c9ca: test rax, rax
0x10026c9cd: je 0x10026c9e0
0x10026c9cf: lea rsi, [rbp - 0x178]
0x10026c9d6: mov rdi, rax
0x10026c9d9: call 0x1007c2310 ; 0x1007c2310
0x10026c9de: jmp 0x10026c9f8 ; 0x10026c9f8
0x10026c9e0: call 0x10079ac90 ; 0x10079ac90
0x10026c9e5: mov rsi, qword ptr [rax + 8]
0x10026c9e9: lea rdx, [rip + 0x9101a0] ; 0x100b7cb90 AvatarMaskBasicTex
0x10026c9f0: mov rdi, r15
0x10026c9f3: call 0x1007c4640 ; 0x1007c4640
0x10026c9f8: lea rdi, [rbp - 0x118]
0x10026c9ff: call 0x1007c2530 ; 0x1007c2530
0x10026ca04: call 0x10079ac90 ; 0x10079ac90
0x10026ca09: lea rdx, [rip + 0x910193] ; 0x100b7cba3 AttribSimpleGlow
0x10026ca10: mov rdi, r15
0x10026ca13: mov rsi, rax
0x10026ca16: call 0x1007c4360 ; 0x1007c4360
0x10026ca1b: test rax, rax
0x10026ca1e: je 0x10026ca31
0x10026ca20: lea rsi, [rbp - 0x118]
0x10026ca27: mov rdi, rax
0x10026ca2a: call 0x1007c2310 ; 0x1007c2310
0x10026ca2f: jmp 0x10026ca49 ; 0x10026ca49
0x10026ca31: call 0x10079ac90 ; 0x10079ac90
0x10026ca36: mov rsi, qword ptr [rax + 8]
0x10026ca3a: lea rdx, [rip + 0x910162] ; 0x100b7cba3 AttribSimpleGlow
0x10026ca41: mov rdi, r15
0x10026ca44: call 0x1007c4640 ; 0x1007c4640
0x10026ca49: lea rdi, [rbp - 0x158]
0x10026ca50: call 0x1007c2530 ; 0x1007c2530
0x10026ca55: call 0x10079ac90 ; 0x10079ac90
0x10026ca5a: lea rdx, [rip + 0x90d8a1] ; 0x100b7a302 UpNormal
0x10026ca61: mov rdi, r15
0x10026ca64: mov rsi, rax
0x10026ca67: call 0x1007c4360 ; 0x1007c4360
0x10026ca6c: test rax, rax
0x10026ca6f: je 0x10026ca82
0x10026ca71: lea rsi, [rbp - 0x158]
0x10026ca78: mov rdi, rax
0x10026ca7b: call 0x1007c2310 ; 0x1007c2310
0x10026ca80: jmp 0x10026ca9a ; 0x10026ca9a
0x10026ca82: call 0x10079ac90 ; 0x10079ac90
0x10026ca87: mov rsi, qword ptr [rax + 8]
0x10026ca8b: lea rdx, [rip + 0x90d870] ; 0x100b7a302 UpNormal
0x10026ca92: mov rdi, r15
0x10026ca95: call 0x1007c4640 ; 0x1007c4640
0x10026ca9a: mov rdi, qword ptr [r12 + 0x1e0]
0x10026caa2: mov rax, qword ptr [rbp - 0x178]
0x10026caa9: test rax, rax
0x10026caac: je 0x10026cac2
0x10026caae: mov rax, qword ptr [rax + 0x10]
0x10026cab2: lea rcx, [rax + 0xb0]
0x10026cab9: test rax, rax
0x10026cabc: cmove rcx, rax
0x10026cac0: jmp 0x10026cac4 ; 0x10026cac4
0x10026cac2: xor ecx, ecx
0x10026cac4: lea rdx, [rip + 0x9072a7] ; 0x100b73d72 u_diffuse1Tex
0x10026cacb: xor esi, esi
0x10026cacd: xor r8d, r8d
0x10026cad0: call 0x100466ee0 ; 0x100466ee0
0x10026cad5: mov rdi, qword ptr [r12 + 0x1e0]
0x10026cadd: mov rax, qword ptr [rbp - 0x118]
0x10026cae4: test rax, rax
0x10026cae7: je 0x10026cafd
0x10026cae9: mov rax, qword ptr [rax + 0x10]
0x10026caed: lea rcx, [rax + 0xb0]
0x10026caf4: test rax, rax
0x10026caf7: cmove rcx, rax
0x10026cafb: jmp 0x10026caff ; 0x10026caff
0x10026cafd: xor ecx, ecx
0x10026caff: lea rdx, [rip + 0x90727a] ; 0x100b73d80 u_diffuse2Tex
0x10026cb06: xor esi, esi
0x10026cb08: xor r8d, r8d
0x10026cb0b: call 0x100466ee0 ; 0x100466ee0
0x10026cb10: mov rdi, qword ptr [r12 + 0x1e0]
0x10026cb18: mov rax, qword ptr [rbp - 0x118]
0x10026cb1f: test rax, rax
0x10026cb22: je 0x10026cb38
0x10026cb24: mov rax, qword ptr [rax + 0x10]
0x10026cb28: lea rcx, [rax + 0xb0]
0x10026cb2f: test rax, rax
0x10026cb32: cmove rcx, rax
0x10026cb36: jmp 0x10026cb3a ; 0x10026cb3a
0x10026cb38: xor ecx, ecx
0x10026cb3a: lea rdx, [rip + 0x90724d] ; 0x100b73d8e u_lightTex
0x10026cb41: xor esi, esi
0x10026cb43: xor r8d, r8d
0x10026cb46: call 0x100466ee0 ; 0x100466ee0
0x10026cb4b: mov rdi, qword ptr [r12 + 0x1e0]
0x10026cb53: mov rax, qword ptr [rbp - 0x158]
0x10026cb5a: test rax, rax
0x10026cb5d: je 0x10026cb73
0x10026cb5f: mov rax, qword ptr [rax + 0x10]
0x10026cb63: lea rcx, [rax + 0xb0]
0x10026cb6a: test rax, rax
0x10026cb6d: cmove rcx, rax
0x10026cb71: jmp 0x10026cb75 ; 0x10026cb75
0x10026cb73: xor ecx, ecx
0x10026cb75: lea rdx, [rip + 0x909fb2] ; 0x100b76b2e u_normTex
0x10026cb7c: xor esi, esi
0x10026cb7e: xor r8d, r8d
0x10026cb81: call 0x100466ee0 ; 0x100466ee0
0x10026cb86: mov rdi, qword ptr [r12 + 0x1e0]
0x10026cb8e: lea rdx, [rip + 0x907213] ; 0x100b73da8 u_diffuse1TexScale
0x10026cb95: vmovss xmm0, dword ptr [rip + 0x838523] ; 0x100aa50c0
0x10026cb9d: xor esi, esi
0x10026cb9f: call 0x1004667c0 ; 0x1004667c0
0x10026cba4: mov rdi, qword ptr [r12 + 0x1e0]
0x10026cbac: lea rdx, [rip + 0x9071e6] ; 0x100b73d99 u_normTexScale
0x10026cbb3: xor esi, esi
0x10026cbb5: vxorps xmm0, xmm0, xmm0
0x10026cbb9: call 0x1004667c0 ; 0x1004667c0
0x10026cbbe: mov rdi, qword ptr [r12 + 0x1e0]
0x10026cbc6: mov esi, 1
0x10026cbcb: call 0x1004636d0 ; 0x1004636d0
0x10026cbd0: mov qword ptr [rbp - 0x88], r14
0x10026cbd7: mov rax, qword ptr [r12 + 0x1e0]
0x10026cbdf: mov r14, qword ptr [rax + 0x68]
0x10026cbe3: test r14, r14
0x10026cbe6: je 0x10026cc63
0x10026cbe8: mov rdi, r14
0x10026cbeb: call 0x100096120 ; 0x100096120
0x10026cbf0: lea rsi, [rip + 0x90ffbd] ; 0x100b7cbb4 M_head_Con
0x10026cbf7: mov rdi, r14
0x10026cbfa: call 0x10009e110 ; 0x10009e110
0x10026cbff: mov qword ptr [r12 + 0x208], rax
0x10026cc07: lea rsi, [rip + 0x90ffb1] ; 0x100b7cbbf M_belly_Sim
0x10026cc0e: mov rdi, r14
0x10026cc11: call 0x10009e110 ; 0x10009e110
0x10026cc16: mov qword ptr [r12 + 0x210], rax
0x10026cc1e: lea rsi, [rip + 0x90ffa6] ; 0x100b7cbcb M_tail4_Sim
0x10026cc25: mov rdi, r14
0x10026cc28: call 0x10009e110 ; 0x10009e110
0x10026cc2d: mov qword ptr [r12 + 0x218], rax
0x10026cc35: lea rsi, [rip + 0x90b0c7] ; 0x100b77d03 M_tail7_Sim
0x10026cc3c: mov rdi, r14
0x10026cc3f: call 0x10009e110 ; 0x10009e110
0x10026cc44: mov qword ptr [r12 + 0x220], rax
0x10026cc4c: lea rsi, [rip + 0x90ff84] ; 0x100b7cbd7 M_eye
0x10026cc53: mov rdi, r14
0x10026cc56: call 0x10009e110 ; 0x10009e110
0x10026cc5b: mov qword ptr [r12 + 0x228], rax
0x10026cc63: lea rdi, [rbp - 0x138]
0x10026cc6a: call 0x1007c2530 ; 0x1007c2530
0x10026cc6f: call 0x10079ac90 ; 0x10079ac90
0x10026cc74: lea rdx, [rip + 0x8f45b2] ; 0x100b6122d White
0x10026cc7b: mov rdi, r15
0x10026cc7e: mov rsi, rax
0x10026cc81: call 0x1007c4360 ; 0x1007c4360
0x10026cc86: test rax, rax
0x10026cc89: je 0x10026cc9c
0x10026cc8b: lea rsi, [rbp - 0x138]
0x10026cc92: mov rdi, rax
0x10026cc95: call 0x1007c2310 ; 0x1007c2310
0x10026cc9a: jmp 0x10026ccb4 ; 0x10026ccb4
0x10026cc9c: call 0x10079ac90 ; 0x10079ac90
0x10026cca1: mov rsi, qword ptr [rax + 8]
0x10026cca5: lea rdx, [rip + 0x8f4581] ; 0x100b6122d White
0x10026ccac: mov rdi, r15
0x10026ccaf: call 0x1007c4640 ; 0x1007c4640
0x10026ccb4: lea rsi, [rip + 0x8f81cf] ; 0x100b64e8a SpUnitBall
0x10026ccbb: lea rdx, [rip + 0x90ff1b] ; 0x100b7cbdd UnlitColor
0x10026ccc2: lea r8, [rbp - 0xf8]
0x10026ccc9: mov rdi, rbx
0x10026cccc: mov rcx, r13
0x10026cccf: call 0x10046c700 ; 0x10046c700
0x10026ccd4: mov qword ptr [r12 + 0x1e8], rax
0x10026ccdc: mov rcx, qword ptr [rbp - 0x138]
0x10026cce3: test rcx, rcx
0x10026cce6: je 0x10026ccfc
0x10026cce8: mov rdx, qword ptr [rcx + 0x10]
0x10026ccec: lea rcx, [rdx + 0xb0]
0x10026ccf3: test rdx, rdx
0x10026ccf6: cmove rcx, rdx
0x10026ccfa: jmp 0x10026ccfe ; 0x10026ccfe
0x10026ccfc: xor ecx, ecx
0x10026ccfe: lea rdx, [rip + 0x8f81a4] ; 0x100b64ea9 u_texture
0x10026cd05: xor esi, esi
0x10026cd07: xor r8d, r8d
0x10026cd0a: mov rdi, rax
0x10026cd0d: call 0x100466ee0 ; 0x100466ee0
0x10026cd12: mov rdi, qword ptr [r12 + 0x1e8]
0x10026cd1a: lea rdx, [rip + 0x8f7ad0] ; 0x100b647f1 u_diffuseColor
0x10026cd21: lea rcx, [rip + 0x1dd2988] ; 0x10203f6b0
0x10026cd28: xor esi, esi
0x10026cd2a: call 0x100466a50 ; 0x100466a50
0x10026cd2f: mov rdi, qword ptr [r12 + 0x1e8]
0x10026cd37: vxorps xmm0, xmm0, xmm0
0x10026cd3b: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x10026cd40: lea rdx, [rip + 0x9070b7] ; 0x100b73dfe u_uvScroll
0x10026cd47: lea rcx, [rbp - 0x80]
0x10026cd4b: xor esi, esi
0x10026cd4d: call 0x100466af0 ; 0x100466af0
0x10026cd52: mov rdi, qword ptr [r12 + 0x1e8]
0x10026cd5a: vxorps xmm0, xmm0, xmm0
0x10026cd5e: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x10026cd63: lea rdx, [rip + 0x90758b] ; 0x100b742f5 u_uvOffset
0x10026cd6a: lea rcx, [rbp - 0x80]
0x10026cd6e: xor esi, esi
0x10026cd70: call 0x100466af0 ; 0x100466af0
0x10026cd75: mov rdi, qword ptr [r12 + 0x1e8]
0x10026cd7d: mov esi, 1
0x10026cd82: call 0x1004636d0 ; 0x1004636d0
0x10026cd87: call 0x100327f70 ; 0x100327f70
0x10026cd8c: mov rdi, qword ptr [rbp - 0x38]
0x10026cd90: mov rsi, rax
0x10026cd93: call 0x100327790 ; 0x100327790
0x10026cd98: mov qword ptr [rbp - 0x30], rax
0x10026cd9c: call 0x100327e10 ; 0x100327e10
0x10026cda1: mov r14, rax
0x10026cda4: mov qword ptr [rbp - 0x80], 0
0x10026cdac: call 0x100327f70 ; 0x100327f70
0x10026cdb1: mov rbx, qword ptr [rax]
0x10026cdb4: lea rsi, [rbp - 0x80]
0x10026cdb8: lea rdx, [rbp - 0x30]
0x10026cdbc: mov rdi, rax
0x10026cdbf: mov rcx, r14
0x10026cdc2: call qword ptr [rbx + 0x40]
0x10026cdc5: mov rdi, qword ptr [rbp - 0x80]
0x10026cdc9: mov qword ptr [r12 + 0x230], rdi
0x10026cdd1: vmovaps xmm0, xmmword ptr [r12 + 0x60]
0x10026cdd8: vinsertps xmm0, xmm0, dword ptr [rip + 0x8382de], 0x30 ; 0x100aa50c0
0x10026cde2: vmovss xmm1, dword ptr [rip + 0x839cbe] ; 0x100aa6aa8
0x10026cdea: vmovaps xmmword ptr [rdi + 0x10], xmm1
0x10026cdef: vmovaps xmm1, xmmword ptr [rip + 0x847b29] ; 0x100ab4920
0x10026cdf7: vmovaps xmmword ptr [rdi + 0x20], xmm1
0x10026cdfc: vmovaps xmm1, xmmword ptr [rip + 0x847b2c] ; 0x100ab4930
0x10026ce04: vmovaps xmmword ptr [rdi + 0x30], xmm1
0x10026ce09: vmovaps xmmword ptr [rdi + 0x40], xmm0
0x10026ce0e: call 0x100328de0 ; 0x100328de0
0x10026ce13: mov rax, qword ptr [r12 + 0x230]
0x10026ce1b: mov qword ptr [rax + 0x50], 0
0x10026ce23: xor esi, esi
0x10026ce25: mov rdi, qword ptr [rbp - 0x88]
0x10026ce2c: call 0x10043d6a0 ; 0x10043d6a0
0x10026ce31: mov qword ptr [r12 + 0x1d8], rax
0x10026ce39: mov byte ptr [rax + 0x40], 1
0x10026ce3d: vmovss xmm0, dword ptr [rip + 0x83827b] ; 0x100aa50c0
0x10026ce45: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x10026ce4a: vmovaps xmm0, xmmword ptr [rip + 0x83b24e] ; 0x100aa80a0
0x10026ce52: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x10026ce57: vmovaps xmm0, xmmword ptr [rip + 0x83bbd1] ; 0x100aa8a30
0x10026ce5f: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x10026ce64: vmovaps xmm0, xmmword ptr [rip + 0x83bb94] ; 0x100aa8a00
0x10026ce6c: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x10026ce71: lea rsi, [rbp - 0x80]
0x10026ce75: mov rdi, rax
0x10026ce78: call 0x10043ccd0 ; 0x10043ccd0
0x10026ce7d: mov rdi, qword ptr [rbp + 0x10]
0x10026ce81: mov rsi, qword ptr [r12 + 0x1d8]
0x10026ce89: mov edx, 1
0x10026ce8e: call 0x1004ce8c0 ; 0x1004ce8c0
0x10026ce93: cmp qword ptr [r12 + 0x218], 0
0x10026ce9c: je 0x10026cf50
0x10026cea2: call 0x100327f70 ; 0x100327f70
0x10026cea7: mov rdi, qword ptr [rbp - 0x38]
0x10026ceab: mov rsi, rax
0x10026ceae: call 0x100327790 ; 0x100327790
0x10026ceb3: mov qword ptr [rbp - 0x30], rax
0x10026ceb7: call 0x100327e10 ; 0x100327e10
0x10026cebc: mov r14, rax
0x10026cebf: mov qword ptr [rbp - 0x80], 0
0x10026cec7: call 0x100327f70 ; 0x100327f70
0x10026cecc: mov rbx, qword ptr [rax]
0x10026cecf: lea rsi, [rbp - 0x80]
0x10026ced3: lea rdx, [rbp - 0x30]
0x10026ced7: mov rdi, rax
0x10026ceda: mov rcx, r14
0x10026cedd: call qword ptr [rbx + 0x40]
0x10026cee0: mov rbx, qword ptr [rbp - 0x80]
0x10026cee4: mov qword ptr [r12 + 0x238], rbx
0x10026ceec: mov rsi, qword ptr [r12 + 0x218]
0x10026cef4: lea rdi, [rbp - 0x80]
0x10026cef8: call 0x1007f26b0 ; 0x1007f26b0
0x10026cefd: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x10026cf02: vinsertps xmm0, xmm0, dword ptr [rip + 0x8381b4], 0x30 ; 0x100aa50c0
0x10026cf0c: vmovss xmm1, dword ptr [rip + 0x839b94] ; 0x100aa6aa8
0x10026cf14: vmovaps xmmword ptr [rbx + 0x10], xmm1
0x10026cf19: vmovaps xmm1, xmmword ptr [rip + 0x8479ff] ; 0x100ab4920
0x10026cf21: vmovaps xmmword ptr [rbx + 0x20], xmm1
0x10026cf26: vmovaps xmm1, xmmword ptr [rip + 0x847a02] ; 0x100ab4930
0x10026cf2e: vmovaps xmmword ptr [rbx + 0x30], xmm1
0x10026cf33: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x10026cf38: mov rdi, rbx
0x10026cf3b: call 0x100328de0 ; 0x100328de0
0x10026cf40: mov rax, qword ptr [r12 + 0x238]
0x10026cf48: mov qword ptr [rax + 0x50], 0
0x10026cf50: mov byte ptr [r12 + 0x2c7], 0
0x10026cf59: mov eax, dword ptr [rip + 0xabe4c1] ; 0x100d2b420
0x10026cf5f: mov dword ptr [r12 + 0x2c8], eax
0x10026cf67: mov dword ptr [r12 + 0x2cc], 0
0x10026cf73: mov dword ptr [r12 + 0x180], 0
0x10026cf7f: mov rax, qword ptr [r12 + 0x50]
0x10026cf84: mov cl, byte ptr [rax + 4]
0x10026cf87: xor cl, 1
0x10026cf8a: mov byte ptr [r12 + 0x2c3], cl
0x10026cf92: mov byte ptr [r12 + 0x2c4], cl
0x10026cf9a: vmovss xmm0, dword ptr [r12 + 0x64]
0x10026cfa1: vmovss dword ptr [r12 + 0x12c], xmm0
0x10026cfab: vxorps xmm0, xmm0, xmm0
0x10026cfaf: vmovaps xmmword ptr [r12 + 0x130], xmm0
0x10026cfb9: mov dword ptr [r12 + 0x1a0], 0
0x10026cfc5: mov cl, byte ptr [rax + 6]
0x10026cfc8: mov byte ptr [r12 + 0x2dc], cl
0x10026cfd0: cmp qword ptr [rax + 0x10], 0
0x10026cfd5: je 0x10026d02c
0x10026cfd7: cmp qword ptr [rax + 0x18], 0
0x10026cfdc: je 0x10026d04b
0x10026cfde: lea rdi, [rbp - 0x138]
0x10026cfe5: call 0x1007c2570 ; 0x1007c2570
0x10026cfea: lea rdi, [rbp - 0x158]
0x10026cff1: call 0x1007c2570 ; 0x1007c2570
0x10026cff6: lea rdi, [rbp - 0x118]
0x10026cffd: call 0x1007c2570 ; 0x1007c2570
0x10026d002: lea rdi, [rbp - 0x178]
0x10026d009: call 0x1007c2570 ; 0x1007c2570
0x10026d00e: lea rdi, [rbp - 0x1b0]
0x10026d015: call 0x1007c2570 ; 0x1007c2570
0x10026d01a: add rsp, 0x188
0x10026d021: pop rbx
0x10026d022: pop r12
0x10026d024: pop r13
0x10026d026: pop r14
0x10026d028: pop r15
0x10026d02a: pop rbp
0x10026d02b: ret 
0x10026d02c: lea rdi, [rip + 0x90fbb5] ; 0x100b7cbe8 params->patrolRail != nullptr
0x10026d033: lea rsi, [rip + 0x90fbcc] ; 0x100b7cc06 DarkCreature.cpp
0x10026d03a: mov edx, 0x289
0x10026d03f: mov ecx, 3
0x10026d044: call 0x1007e5f70 ; 0x1007e5f70
0x10026d049: jmp 0x10026d068 ; 0x10026d068
0x10026d04b: lea rdi, [rip + 0x90fbc5] ; 0x100b7cc17 params->cooldownRail != nullptr
0x10026d052: lea rsi, [rip + 0x90fbad] ; 0x100b7cc06 DarkCreature.cpp
0x10026d059: mov edx, 0x28a
0x10026d05e: mov ecx, 3
0x10026d063: call 0x1007e5f70 ; 0x1007e5f70
0x10026d068: ud2 
0x10026d06a: jmp 0x10026d09a ; 0x10026d09a
0x10026d06c: jmp 0x10026d09a ; 0x10026d09a
0x10026d06e: jmp 0x10026d09a ; 0x10026d09a
0x10026d070: jmp 0x10026d09a ; 0x10026d09a
0x10026d072: jmp 0x10026d0ab ; 0x10026d0ab
0x10026d074: mov rbx, rax
0x10026d077: jmp 0x10026d0ba ; 0x10026d0ba
0x10026d079: mov rbx, rax
0x10026d07c: jmp 0x10026d0c6 ; 0x10026d0c6
0x10026d07e: mov rbx, rax
0x10026d081: jmp 0x10026d0d2 ; 0x10026d0d2
0x10026d083: jmp 0x10026d09a ; 0x10026d09a
0x10026d085: jmp 0x10026d09a ; 0x10026d09a
0x10026d087: mov rbx, rax
0x10026d08a: jmp 0x10026d0ba ; 0x10026d0ba
0x10026d08c: mov rbx, rax
0x10026d08f: jmp 0x10026d0c6 ; 0x10026d0c6
0x10026d091: mov rbx, rax
0x10026d094: jmp 0x10026d0d2 ; 0x10026d0d2
0x10026d096: jmp 0x10026d0ab ; 0x10026d0ab
0x10026d098: jmp 0x10026d09a ; 0x10026d09a
0x10026d09a: mov rbx, rax
0x10026d09d: lea rdi, [rbp - 0x138]
0x10026d0a4: call 0x1007c2570 ; 0x1007c2570
0x10026d0a9: jmp 0x10026d0ae ; 0x10026d0ae
0x10026d0ab: mov rbx, rax
0x10026d0ae: lea rdi, [rbp - 0x158]
0x10026d0b5: call 0x1007c2570 ; 0x1007c2570
0x10026d0ba: lea rdi, [rbp - 0x118]
0x10026d0c1: call 0x1007c2570 ; 0x1007c2570
0x10026d0c6: lea rdi, [rbp - 0x178]
0x10026d0cd: call 0x1007c2570 ; 0x1007c2570
0x10026d0d2: lea rdi, [rbp - 0x1b0]
0x10026d0d9: call 0x1007c2570 ; 0x1007c2570
0x10026d0de: mov rdi, rbx
0x10026d0e1: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10026d0e6: nop word ptr cs:[rax + rax]
