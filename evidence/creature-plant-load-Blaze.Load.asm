0x1001ae8e0: push rbp
0x1001ae8e1: mov rbp, rsp
0x1001ae8e4: push r15
0x1001ae8e6: push r14
0x1001ae8e8: push rbx
0x1001ae8e9: sub rsp, 0x158
0x1001ae8f0: mov r14, rsi
0x1001ae8f3: mov rbx, rdi
0x1001ae8f6: mov byte ptr [rbx + 0x99], 0
0x1001ae8fd: mov qword ptr [rbx + 0xcc], 0
0x1001ae908: mov qword ptr [rbx + 0xa8], 0
0x1001ae913: mov dword ptr [rbx + 0xb0], 0
0x1001ae91d: mov byte ptr [rbx + 0x56], 0
0x1001ae921: mov word ptr [rbx + 0xc8], 0
0x1001ae92a: mov dword ptr [rbx + 0x9c], 0
0x1001ae934: mov byte ptr [rbx + 0xa0], 0
0x1001ae93b: mov dword ptr [rbx + 0xa2], 0
0x1001ae945: mov eax, dword ptr [rip + 0xb75651] ; 0x100d23f9c
0x1001ae94b: mov dword ptr [rbx + 0x50], eax
0x1001ae94e: mov qword ptr [rbx + 0xe0], 0
0x1001ae959: mov dword ptr [rbx + 0xd4], 0
0x1001ae963: mov eax, dword ptr [rbx + 0x94]
0x1001ae969: mov dword ptr [rbx + 0xd8], eax
0x1001ae96f: movabs rax, 0x3f80000000000000
0x1001ae979: mov qword ptr [rbx + 0xb4], rax
0x1001ae980: mov qword ptr [rbx + 0xc0], 0
0x1001ae98b: mov byte ptr [rbx + 0xca], 0
0x1001ae992: vmovaps xmm0, xmmword ptr [rip + 0x8fbf26] ; 0x100aaa8c0
0x1001ae99a: vmovaps xmmword ptr [rbx + 0xf0], xmm0
0x1001ae9a2: mov byte ptr [rbx + 0x11c], 0
0x1001ae9a9: mov qword ptr [rbx + 0x110], 0
0x1001ae9b4: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001ae9b9: vcvtsi2ss xmm0, xmm1, eax
0x1001ae9bd: vmulss xmm0, xmm0, dword ptr [rip + 0x8f872b] ; 0x100aa70f0
0x1001ae9c5: vmulss xmm0, xmm0, dword ptr [rip + 0x8fc573] ; 0x100aaaf40
0x1001ae9cd: vcvttss2si eax, xmm0
0x1001ae9d1: lea ecx, [rax*8]
0x1001ae9d8: sub ecx, eax
0x1001ae9da: movsxd rax, ecx
0x1001ae9dd: imul rax, rax, 0x14f8b589
0x1001ae9e4: mov rcx, rax
0x1001ae9e7: shr rcx, 0x3f
0x1001ae9eb: sar rax, 0x2d
0x1001ae9ef: add eax, ecx
0x1001ae9f1: vcvtsi2ss xmm0, xmm1, eax
0x1001ae9f5: vmovss dword ptr [rbx + 0x118], xmm0
0x1001ae9fd: mov qword ptr [rbx + 0xe8], 0
0x1001aea08: mov rax, qword ptr [rbx + 0x58]
0x1001aea0c: test rax, rax
0x1001aea0f: je 0x1001aec04
0x1001aea15: mov rdi, qword ptr [r14 + 0x5a8]
0x1001aea1c: mov rsi, qword ptr [rax + 0x228]
0x1001aea23: call 0x10046ccc0 ; 0x10046ccc0
0x1001aea28: mov qword ptr [rbx + 0xe0], rax
0x1001aea2f: vmovaps xmm0, xmmword ptr [rip + 0x8fbe89] ; 0x100aaa8c0
0x1001aea37: vmovaps xmmword ptr [rbx + 0xf0], xmm0
0x1001aea3f: mov rsi, qword ptr [rbx + 0x58]
0x1001aea43: mov rax, qword ptr [rsi]
0x1001aea46: lea rdi, [rbp - 0xd0]
0x1001aea4d: call qword ptr [rax + 0x18]
0x1001aea50: vmovaps xmm0, xmmword ptr [rbp - 0xd0]
0x1001aea58: vmulps xmm0, xmm0, xmm0
0x1001aea5c: vmovshdup xmm1, xmm0
0x1001aea60: vaddss xmm1, xmm0, xmm1
0x1001aea64: vpermilpd xmm0, xmm0, 1
0x1001aea6a: vaddss xmm0, xmm0, xmm1
0x1001aea6e: vsqrtss xmm0, xmm0, xmm0
0x1001aea72: vmovaps xmm1, xmmword ptr [rbx + 0x10]
0x1001aea77: vmulps xmm1, xmm1, xmm1
0x1001aea7b: vmovshdup xmm2, xmm1
0x1001aea7f: vaddss xmm2, xmm1, xmm2
0x1001aea83: vpermilpd xmm1, xmm1, 1
0x1001aea89: vaddss xmm1, xmm1, xmm2
0x1001aea8d: vsqrtss xmm1, xmm1, xmm1
0x1001aea91: vmulss xmm0, xmm0, xmm1
0x1001aea95: vmovss dword ptr [rbx + 0xf0], xmm0
0x1001aea9d: cmp byte ptr [rbx + 0x90], 0
0x1001aeaa4: je 0x1001aeabe
0x1001aeaa6: vmovaps xmm0, xmmword ptr [rbx + 0xf0]
0x1001aeaae: vmulps xmm0, xmm0, xmmword ptr [rip + 0x8f8bba] ; 0x100aa7670
0x1001aeab6: vmovaps xmmword ptr [rbx + 0xf0], xmm0
0x1001aeabe: mov rsi, qword ptr [rbx + 0x58]
0x1001aeac2: mov rax, qword ptr [rsi]
0x1001aeac5: lea rdi, [rbp - 0xd0]
0x1001aeacc: call qword ptr [rax + 0x18]
0x1001aeacf: vmovaps xmm0, xmmword ptr [rbp - 0xc0]
0x1001aead7: vmulps xmm0, xmm0, xmm0
0x1001aeadb: vmovshdup xmm1, xmm0
0x1001aeadf: vaddss xmm1, xmm0, xmm1
0x1001aeae3: vpermilpd xmm0, xmm0, 1
0x1001aeae9: vaddss xmm0, xmm0, xmm1
0x1001aeaed: vsqrtss xmm0, xmm0, xmm0
0x1001aeaf1: vmovaps xmm1, xmmword ptr [rbx + 0x20]
0x1001aeaf6: vmulps xmm1, xmm1, xmm1
0x1001aeafa: vmovshdup xmm2, xmm1
0x1001aeafe: vaddss xmm2, xmm1, xmm2
0x1001aeb02: vpermilpd xmm1, xmm1, 1
0x1001aeb08: vaddss xmm1, xmm1, xmm2
0x1001aeb0c: vsqrtss xmm1, xmm1, xmm1
0x1001aeb10: vmulss xmm0, xmm0, xmm1
0x1001aeb14: vmovss dword ptr [rbx + 0xf4], xmm0
0x1001aeb1c: cmp byte ptr [rbx + 0x90], 0
0x1001aeb23: je 0x1001aeb3d
0x1001aeb25: vmovaps xmm0, xmmword ptr [rbx + 0xf0]
0x1001aeb2d: vmulps xmm0, xmm0, xmmword ptr [rip + 0x8f8b3b] ; 0x100aa7670
0x1001aeb35: vmovaps xmmword ptr [rbx + 0xf0], xmm0
0x1001aeb3d: mov rsi, qword ptr [rbx + 0x58]
0x1001aeb41: mov rax, qword ptr [rsi]
0x1001aeb44: lea rdi, [rbp - 0xd0]
0x1001aeb4b: call qword ptr [rax + 0x18]
0x1001aeb4e: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x1001aeb56: vmulps xmm0, xmm0, xmm0
0x1001aeb5a: vmovshdup xmm1, xmm0
0x1001aeb5e: vaddss xmm1, xmm0, xmm1
0x1001aeb62: vpermilpd xmm0, xmm0, 1
0x1001aeb68: vaddss xmm0, xmm0, xmm1
0x1001aeb6c: vsqrtss xmm0, xmm0, xmm0
0x1001aeb70: vmovaps xmm1, xmmword ptr [rbx + 0x30]
0x1001aeb75: vmulps xmm1, xmm1, xmm1
0x1001aeb79: vmovshdup xmm2, xmm1
0x1001aeb7d: vaddss xmm2, xmm1, xmm2
0x1001aeb81: vpermilpd xmm1, xmm1, 1
0x1001aeb87: vaddss xmm1, xmm1, xmm2
0x1001aeb8b: vsqrtss xmm1, xmm1, xmm1
0x1001aeb8f: vmulss xmm0, xmm0, xmm1
0x1001aeb93: vmovss dword ptr [rbx + 0xf8], xmm0
0x1001aeb9b: cmp byte ptr [rbx + 0x90], 0
0x1001aeba2: je 0x1001aebbc
0x1001aeba4: vmovaps xmm0, xmmword ptr [rbx + 0xf0]
0x1001aebac: vmulps xmm0, xmm0, xmmword ptr [rip + 0x8f8abc] ; 0x100aa7670
0x1001aebb4: vmovaps xmmword ptr [rbx + 0xf0], xmm0
0x1001aebbc: mov rdi, qword ptr [rbx + 0xe0]
0x1001aebc3: lea rdx, [rip + 0x9c4f0b] ; 0x100b73ad5 u_alphaFade
0x1001aebca: xor esi, esi
0x1001aebcc: call 0x100466620 ; 0x100466620
0x1001aebd1: mov byte ptr [rbx + 0xca], al
0x1001aebd7: test al, al
0x1001aebd9: je 0x1001aebf8
0x1001aebdb: mov rdi, qword ptr [rbx + 0xe0]
0x1001aebe2: lea rdx, [rip + 0x9c4eec] ; 0x100b73ad5 u_alphaFade
0x1001aebe9: vmovss xmm0, dword ptr [rip + 0x8f64cf] ; 0x100aa50c0
0x1001aebf1: xor esi, esi
0x1001aebf3: call 0x1004667c0 ; 0x1004667c0
0x1001aebf8: mov byte ptr [rbx + 0x98], 0
0x1001aebff: jmp 0x1001af2f4 ; 0x1001af2f4
0x1001aec04: lea rdi, [rbp - 0xf0]
0x1001aec0b: call 0x1007c2530 ; 0x1007c2530
0x1001aec10: movabs rax, 0x700000000
0x1001aec1a: mov qword ptr [rbp - 0xd0], rax
0x1001aec21: mov byte ptr [rbp - 0xc4], 0
0x1001aec28: mov dword ptr [rbp - 0xc8], 0
0x1001aec32: mov word ptr [rbp - 0xc3], 1
0x1001aec3b: mov dword ptr [rbp - 0xc0], 0x447a0000
0x1001aec45: mov word ptr [rbp - 0xbc], 0
0x1001aec4e: movabs rax, 0x3f8000003f800000
0x1001aec58: mov qword ptr [rbp - 0xb8], rax
0x1001aec5f: mov byte ptr [rbp - 0xb0], 0
0x1001aec66: mov qword ptr [rbp - 0xac], 0x3eb33333
0x1001aec71: mov dword ptr [rbp - 0xa4], 0xc11cf5c3
0x1001aec7b: mov word ptr [rbp - 0xa0], 0
0x1001aec84: mov byte ptr [rbp - 0x9e], 0
0x1001aec8b: mov dword ptr [rbp - 0x9c], 0
0x1001aec95: movabs rax, 0x3f8000003cf5c28f
0x1001aec9f: mov qword ptr [rbp - 0x90], rax
0x1001aeca6: mov byte ptr [rbp - 0x88], 1
0x1001aecad: movabs rax, 0x100000000
0x1001aecb7: mov qword ptr [rbp - 0x84], rax
0x1001aecbe: mov dword ptr [rbp - 0x7c], 0x3f800000
0x1001aecc5: mov byte ptr [rbp - 0x78], 0
0x1001aecc9: mov byte ptr [rbp - 0x77], 0
0x1001aeccd: cmp byte ptr [rbx + 0x98], 0
0x1001aecd4: mov r15, qword ptr [r14 + 0x140]
0x1001aecdb: je 0x1001aed0a
0x1001aecdd: call 0x10079ac90 ; 0x10079ac90
0x1001aece2: lea rdx, [rip + 0x9b2544] ; 0x100b6122d White
0x1001aece9: mov rdi, r15
0x1001aecec: mov rsi, rax
0x1001aecef: call 0x1007c4360 ; 0x1007c4360
0x1001aecf4: test rax, rax
0x1001aecf7: je 0x1001aed3e
0x1001aecf9: lea rsi, [rbp - 0xf0]
0x1001aed00: mov rdi, rax
0x1001aed03: call 0x1007c2310 ; 0x1007c2310
0x1001aed08: jmp 0x1001aed56 ; 0x1001aed56
0x1001aed0a: call 0x10079ac90 ; 0x10079ac90
0x1001aed0f: lea rdx, [rip + 0x9c9239] ; 0x100b77f4f UIFootPrint
0x1001aed16: mov rdi, r15
0x1001aed19: mov rsi, rax
0x1001aed1c: call 0x1007c4360 ; 0x1007c4360
0x1001aed21: test rax, rax
0x1001aed24: je 0x1001aedf0
0x1001aed2a: lea rsi, [rbp - 0xf0]
0x1001aed31: mov rdi, rax
0x1001aed34: call 0x1007c2310 ; 0x1007c2310
0x1001aed39: jmp 0x1001aee08 ; 0x1001aee08
0x1001aed3e: call 0x10079ac90 ; 0x10079ac90
0x1001aed43: mov rsi, qword ptr [rax + 8]
0x1001aed47: lea rdx, [rip + 0x9b24df] ; 0x100b6122d White
0x1001aed4e: mov rdi, r15
0x1001aed51: call 0x1007c4640 ; 0x1007c4640
0x1001aed56: mov byte ptr [rbp - 0xc6], 0
0x1001aed5d: mov rdi, qword ptr [r14 + 0x5a8]
0x1001aed64: vmovss xmm0, dword ptr [rip + 0x8f6354] ; 0x100aa50c0
0x1001aed6c: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001aed71: vmovaps xmm0, xmmword ptr [rip + 0x8f9327] ; 0x100aa80a0
0x1001aed79: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1001aed7e: vmovaps xmm0, xmmword ptr [rip + 0x8f9caa] ; 0x100aa8a30
0x1001aed86: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1001aed8b: vmovaps xmm0, xmmword ptr [rip + 0x8f9c6d] ; 0x100aa8a00
0x1001aed93: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x1001aed98: lea rsi, [rip + 0x9c9192] ; 0x100b77f31 CandleAncestor
0x1001aed9f: lea rdx, [rip + 0x9c919a] ; 0x100b77f40 Candle
0x1001aeda6: lea rcx, [rbp - 0x60]
0x1001aedaa: lea r8, [rbp - 0xd0]
0x1001aedb1: call 0x10046c700 ; 0x10046c700
0x1001aedb6: mov qword ptr [rbx + 0xe0], rax
0x1001aedbd: cmp byte ptr [rbx + 0x91], 0
0x1001aedc4: je 0x1001aedd6
0x1001aedc6: lea rcx, [rip + 0x1e554b3] ; 0x102004280
0x1001aedcd: vmovaps xmm0, xmmword ptr [rcx]
0x1001aedd1: jmp 0x1001af17e ; 0x1001af17e
0x1001aedd6: cmp byte ptr [rbx + 0x57], 0
0x1001aedda: je 0x1001af169
0x1001aede0: lea rcx, [rip + 0x1e554a9] ; 0x102004290
0x1001aede7: vmovaps xmm0, xmmword ptr [rcx]
0x1001aedeb: jmp 0x1001af17e ; 0x1001af17e
0x1001aedf0: call 0x10079ac90 ; 0x10079ac90
0x1001aedf5: mov rsi, qword ptr [rax + 8]
0x1001aedf9: lea rdx, [rip + 0x9c914f] ; 0x100b77f4f UIFootPrint
0x1001aee00: mov rdi, r15
0x1001aee03: call 0x1007c4640 ; 0x1007c4640
0x1001aee08: mov byte ptr [rbp - 0xc6], 0
0x1001aee0f: mov rdi, qword ptr [r14 + 0x5a8]
0x1001aee16: vmovss xmm0, dword ptr [rip + 0x8f62a2] ; 0x100aa50c0
0x1001aee1e: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001aee23: vmovaps xmm0, xmmword ptr [rip + 0x8f9275] ; 0x100aa80a0
0x1001aee2b: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1001aee30: vmovaps xmm0, xmmword ptr [rip + 0x8f9bf8] ; 0x100aa8a30
0x1001aee38: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1001aee3d: vmovaps xmm0, xmmword ptr [rip + 0x8f9bbb] ; 0x100aa8a00
0x1001aee45: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x1001aee4a: lea rsi, [rip + 0x9c910a] ; 0x100b77f5b Plane
0x1001aee51: lea rdx, [rip + 0x9c4c6d] ; 0x100b73ac5 UnlitAlphaColor
0x1001aee58: lea rcx, [rbp - 0x60]
0x1001aee5c: lea r8, [rbp - 0xd0]
0x1001aee63: call 0x10046c700 ; 0x10046c700
0x1001aee68: mov qword ptr [rbx + 0xe0], rax
0x1001aee6f: lea rcx, [rip + 0x1e907da] ; 0x10203f650
0x1001aee76: vmovaps xmm0, xmmword ptr [rcx]
0x1001aee7a: vinsertps xmm0, xmm0, dword ptr [rip + 0x8f5734], 0x20 ; 0x100aa45b8
0x1001aee84: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001aee89: lea rdx, [rip + 0x9b5961] ; 0x100b647f1 u_diffuseColor
0x1001aee90: lea rcx, [rbp - 0x60]
0x1001aee94: xor esi, esi
0x1001aee96: mov rdi, rax
0x1001aee99: call 0x100466910 ; 0x100466910
0x1001aee9e: mov rdi, qword ptr [rbx + 0xe0]
0x1001aeea5: lea rdx, [rip + 0x9c4c29] ; 0x100b73ad5 u_alphaFade
0x1001aeeac: vmovss xmm0, dword ptr [rip + 0x8f620c] ; 0x100aa50c0
0x1001aeeb4: xor esi, esi
0x1001aeeb6: call 0x1004667c0 ; 0x1004667c0
0x1001aeebb: mov rdi, qword ptr [rbx + 0xe0]
0x1001aeec2: lea rdx, [rip + 0x9c5422] ; 0x100b742eb u_scatter
0x1001aeec9: xor esi, esi
0x1001aeecb: vxorps xmm0, xmm0, xmm0
0x1001aeecf: call 0x1004667c0 ; 0x1004667c0
0x1001aeed4: mov rdi, qword ptr [rbx + 0xe0]
0x1001aeedb: mov rax, qword ptr [rbp - 0xf0]
0x1001aeee2: test rax, rax
0x1001aeee5: je 0x1001aeefb
0x1001aeee7: mov rax, qword ptr [rax + 0x10]
0x1001aeeeb: lea rcx, [rax + 0xb0]
0x1001aeef2: test rax, rax
0x1001aeef5: cmove rcx, rax
0x1001aeef9: jmp 0x1001aeefd ; 0x1001aeefd
0x1001aeefb: xor ecx, ecx
0x1001aeefd: lea rdx, [rip + 0x9b5fa5] ; 0x100b64ea9 u_texture
0x1001aef04: xor esi, esi
0x1001aef06: xor r8d, r8d
0x1001aef09: call 0x100466ee0 ; 0x100466ee0
0x1001aef0e: mov rdi, qword ptr [rbx + 0xe0]
0x1001aef15: vxorps xmm0, xmm0, xmm0
0x1001aef19: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001aef1e: lea rdx, [rip + 0x9c53d0] ; 0x100b742f5 u_uvOffset
0x1001aef25: lea rcx, [rbp - 0x60]
0x1001aef29: xor esi, esi
0x1001aef2b: call 0x100466af0 ; 0x100466af0
0x1001aef30: mov rdi, qword ptr [rbx + 0xe0]
0x1001aef37: vxorps xmm0, xmm0, xmm0
0x1001aef3b: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001aef40: lea rdx, [rip + 0x9c901a] ; 0x100b77f61 u_uvScale
0x1001aef47: lea rcx, [rbp - 0x60]
0x1001aef4b: xor esi, esi
0x1001aef4d: call 0x100466af0 ; 0x100466af0
0x1001aef52: mov rdi, qword ptr [rbx + 0xe0]
0x1001aef59: vxorps xmm0, xmm0, xmm0
0x1001aef5d: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001aef62: lea rdx, [rip + 0x9c4e95] ; 0x100b73dfe u_uvScroll
0x1001aef69: lea rcx, [rbp - 0x60]
0x1001aef6d: xor esi, esi
0x1001aef6f: call 0x100466af0 ; 0x100466af0
0x1001aef74: mov rdi, qword ptr [rbx + 0xe0]
0x1001aef7b: vmovaps xmm0, xmmword ptr [rip + 0x8ff0ad] ; 0x100aae030
0x1001aef83: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001aef88: lea rdx, [rip + 0x9b5858] ; 0x100b647e7 u_selfLit
0x1001aef8f: lea rcx, [rbp - 0x60]
0x1001aef93: xor esi, esi
0x1001aef95: call 0x100466af0 ; 0x100466af0
0x1001aef9a: mov byte ptr [rbx + 0xca], 1
0x1001aefa1: vmovaps xmm0, xmmword ptr [rip + 0x8fb917] ; 0x100aaa8c0
0x1001aefa9: vmovaps xmmword ptr [rbx + 0xf0], xmm0
0x1001aefb1: mov r15, qword ptr [r14 + 0x140]
0x1001aefb8: call 0x10079ac90 ; 0x10079ac90
0x1001aefbd: lea rdx, [rip + 0x9c8fa7] ; 0x100b77f6b OrangeL2
0x1001aefc4: mov rdi, r15
0x1001aefc7: mov rsi, rax
0x1001aefca: call 0x1007c4360 ; 0x1007c4360
0x1001aefcf: test rax, rax
0x1001aefd2: je 0x1001aefe5
0x1001aefd4: lea rsi, [rbp - 0xf0]
0x1001aefdb: mov rdi, rax
0x1001aefde: call 0x1007c2310 ; 0x1007c2310
0x1001aefe3: jmp 0x1001aeffd ; 0x1001aeffd
0x1001aefe5: call 0x10079ac90 ; 0x10079ac90
0x1001aefea: mov rsi, qword ptr [rax + 8]
0x1001aefee: lea rdx, [rip + 0x9c8f76] ; 0x100b77f6b OrangeL2
0x1001aeff5: mov rdi, r15
0x1001aeff8: call 0x1007c4640 ; 0x1007c4640
0x1001aeffd: mov byte ptr [rbp - 0xc6], 0
0x1001af004: mov rdi, qword ptr [r14 + 0x5a8]
0x1001af00b: vmovss xmm0, dword ptr [rip + 0x8f60ad] ; 0x100aa50c0
0x1001af013: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001af018: vmovaps xmm0, xmmword ptr [rip + 0x8f9080] ; 0x100aa80a0
0x1001af020: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1001af025: vmovaps xmm0, xmmword ptr [rip + 0x8f9a03] ; 0x100aa8a30
0x1001af02d: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1001af032: vmovaps xmm0, xmmword ptr [rip + 0x8f99c6] ; 0x100aa8a00
0x1001af03a: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x1001af03f: lea rsi, [rip + 0x9c8f2e] ; 0x100b77f74 LightShaft_02
0x1001af046: lea rdx, [rip + 0x9c8f35] ; 0x100b77f82 UnlitAlphaFading
0x1001af04d: lea rcx, [rbp - 0x60]
0x1001af051: lea r8, [rbp - 0xd0]
0x1001af058: call 0x10046c700 ; 0x10046c700
0x1001af05d: mov qword ptr [rbx + 0xe8], rax
0x1001af064: lea rdx, [rip + 0x9c4a6a] ; 0x100b73ad5 u_alphaFade
0x1001af06b: vmovss xmm0, dword ptr [rip + 0x8f604d] ; 0x100aa50c0
0x1001af073: xor esi, esi
0x1001af075: mov rdi, rax
0x1001af078: call 0x1004667c0 ; 0x1004667c0
0x1001af07d: mov rdi, qword ptr [rbx + 0xe8]
0x1001af084: lea rdx, [rip + 0x9c5260] ; 0x100b742eb u_scatter
0x1001af08b: vmovss xmm0, dword ptr [rip + 0x8f602d] ; 0x100aa50c0
0x1001af093: xor esi, esi
0x1001af095: call 0x1004667c0 ; 0x1004667c0
0x1001af09a: mov rdi, qword ptr [rbx + 0xe8]
0x1001af0a1: mov rax, qword ptr [rbp - 0xf0]
0x1001af0a8: test rax, rax
0x1001af0ab: je 0x1001af0c1
0x1001af0ad: mov rax, qword ptr [rax + 0x10]
0x1001af0b1: lea rcx, [rax + 0xb0]
0x1001af0b8: test rax, rax
0x1001af0bb: cmove rcx, rax
0x1001af0bf: jmp 0x1001af0c3 ; 0x1001af0c3
0x1001af0c1: xor ecx, ecx
0x1001af0c3: lea rdx, [rip + 0x9b5ddf] ; 0x100b64ea9 u_texture
0x1001af0ca: xor esi, esi
0x1001af0cc: xor r8d, r8d
0x1001af0cf: call 0x100466ee0 ; 0x100466ee0
0x1001af0d4: mov rdi, qword ptr [rbx + 0xe8]
0x1001af0db: vxorps xmm0, xmm0, xmm0
0x1001af0df: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001af0e4: lea rdx, [rip + 0x9c520a] ; 0x100b742f5 u_uvOffset
0x1001af0eb: lea rcx, [rbp - 0x60]
0x1001af0ef: xor esi, esi
0x1001af0f1: call 0x100466af0 ; 0x100466af0
0x1001af0f6: mov rdi, qword ptr [rbx + 0xe8]
0x1001af0fd: vxorps xmm0, xmm0, xmm0
0x1001af101: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001af106: lea rdx, [rip + 0x9c4cf1] ; 0x100b73dfe u_uvScroll
0x1001af10d: lea rcx, [rbp - 0x60]
0x1001af111: xor esi, esi
0x1001af113: call 0x100466af0 ; 0x100466af0
0x1001af118: mov rdi, qword ptr [rbx + 0xe8]
0x1001af11f: vmovaps xmm0, xmmword ptr [rip + 0x8fef19] ; 0x100aae040
0x1001af127: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001af12c: lea rdx, [rip + 0x9c8e60] ; 0x100b77f93 u_fadingStartEnd
0x1001af133: lea rcx, [rbp - 0x60]
0x1001af137: xor esi, esi
0x1001af139: call 0x100466af0 ; 0x100466af0
0x1001af13e: mov rdi, qword ptr [rbx + 0xe8]
0x1001af145: vmovaps xmm0, xmmword ptr [rip + 0x8fef03] ; 0x100aae050
0x1001af14d: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001af152: lea rdx, [rip + 0x9b568e] ; 0x100b647e7 u_selfLit
0x1001af159: lea rcx, [rbp - 0x60]
0x1001af15d: xor esi, esi
0x1001af15f: call 0x100466af0 ; 0x100466af0
0x1001af164: jmp 0x1001af2e8 ; 0x1001af2e8
0x1001af169: lea rcx, [rip + 0x1e904a0] ; 0x10203f610
0x1001af170: vmovaps xmm0, xmmword ptr [rcx]
0x1001af174: vblendps xmm0, xmm0, xmmword ptr [rip + 0x8feea2], 6 ; 0x100aae020
0x1001af17e: vmulps xmm0, xmm0, xmmword ptr [rip + 0x8f8dca] ; 0x100aa7f50
0x1001af186: vinsertps xmm0, xmm0, dword ptr [rip + 0x8f5428], 0x30 ; 0x100aa45b8
0x1001af190: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001af195: lea rdx, [rip + 0x9c8dab] ; 0x100b77f47 u_color
0x1001af19c: lea rcx, [rbp - 0x60]
0x1001af1a0: xor esi, esi
0x1001af1a2: mov rdi, rax
0x1001af1a5: call 0x100466a50 ; 0x100466a50
0x1001af1aa: mov byte ptr [rbx + 0xca], 1
0x1001af1b1: cmp byte ptr [rbx + 0x90], 0
0x1001af1b8: vmovaps xmm0, xmmword ptr [rip + 0x8fb700] ; 0x100aaa8c0
0x1001af1c0: jne 0x1001af1ca
0x1001af1c2: vmovaps xmm0, xmmword ptr [rip + 0x8f8ec6] ; 0x100aa8090
0x1001af1ca: vmovaps xmmword ptr [rbx + 0xf0], xmm0
0x1001af1d2: mov rdi, qword ptr [r14 + 0x418]
0x1001af1d9: xor esi, esi
0x1001af1db: call 0x10033f470 ; 0x10033f470
0x1001af1e0: mov r15, rax
0x1001af1e3: mov qword ptr [rbx + 0x110], r15
0x1001af1ea: vmovss xmm0, dword ptr [rip + 0x8f5ece] ; 0x100aa50c0
0x1001af1f2: vmovaps xmmword ptr [rbp - 0x170], xmm0
0x1001af1fa: vmovaps xmm0, xmmword ptr [rip + 0x8f8e9e] ; 0x100aa80a0
0x1001af202: vmovaps xmmword ptr [rbp - 0x160], xmm0
0x1001af20a: vmovaps xmm0, xmmword ptr [rip + 0x8f981e] ; 0x100aa8a30
0x1001af212: vmovaps xmmword ptr [rbp - 0x150], xmm0
0x1001af21a: vmovaps xmm0, xmmword ptr [rip + 0x8f97de] ; 0x100aa8a00
0x1001af222: vmovaps xmm1, xmm0
0x1001af226: vmovaps xmmword ptr [rbp - 0x140], xmm1
0x1001af22e: vmovss xmm0, dword ptr [rip + 0x8f85b2] ; 0x100aa77e8
0x1001af236: vmovaps xmmword ptr [rbp - 0x130], xmm0
0x1001af23e: vmovaps xmm0, xmmword ptr [rip + 0x8f9fea] ; 0x100aa9230
0x1001af246: vmovaps xmmword ptr [rbp - 0x120], xmm0
0x1001af24e: vmovaps xmm0, xmmword ptr [rip + 0x8fbd4a] ; 0x100aaafa0
0x1001af256: vmovaps xmmword ptr [rbp - 0x110], xmm0
0x1001af25e: vmovaps xmmword ptr [rbp - 0x100], xmm1
0x1001af266: lea rdi, [rbp - 0x60]
0x1001af26a: lea rsi, [rbp - 0x170]
0x1001af271: lea rdx, [rbp - 0x130]
0x1001af278: call 0x100076df0 ; 0x100076df0
0x1001af27d: lea rsi, [rbp - 0x60]
0x1001af281: mov rdi, r15
0x1001af284: call 0x10033abc0 ; 0x10033abc0
0x1001af289: mov rdi, qword ptr [rbx + 0x110]
0x1001af290: mov rsi, qword ptr [r14 + 0x438]
0x1001af297: mov rdx, qword ptr [r14 + 0x5c8]
0x1001af29e: call 0x10033afa0 ; 0x10033afa0
0x1001af2a3: mov rdi, qword ptr [rbx + 0x110]
0x1001af2aa: xor esi, esi
0x1001af2ac: call 0x10033a780 ; 0x10033a780
0x1001af2b1: mov rdi, qword ptr [rbx + 0x110]
0x1001af2b8: xor esi, esi
0x1001af2ba: call 0x10033ac40 ; 0x10033ac40
0x1001af2bf: mov rax, qword ptr [rbx + 0x110]
0x1001af2c6: mov byte ptr [rax + 0x13f], 1
0x1001af2cd: mov dword ptr [rax + 0xa4], 0x47c34f80
0x1001af2d7: mov byte ptr [rax + 0xb5], 1
0x1001af2de: mov dword ptr [rax + 0x11c], 0x3f800000
0x1001af2e8: lea rdi, [rbp - 0xf0]
0x1001af2ef: call 0x1007c2570 ; 0x1007c2570
0x1001af2f4: add rsp, 0x158
0x1001af2fb: pop rbx
0x1001af2fc: pop r14
0x1001af2fe: pop r15
0x1001af300: pop rbp
0x1001af301: ret 
0x1001af302: jmp 0x1001af320 ; 0x1001af320
0x1001af304: jmp 0x1001af320 ; 0x1001af320
0x1001af306: jmp 0x1001af320 ; 0x1001af320
0x1001af308: jmp 0x1001af320 ; 0x1001af320
0x1001af30a: jmp 0x1001af320 ; 0x1001af320
0x1001af30c: jmp 0x1001af320 ; 0x1001af320
0x1001af30e: jmp 0x1001af320 ; 0x1001af320
0x1001af310: jmp 0x1001af320 ; 0x1001af320
0x1001af312: jmp 0x1001af320 ; 0x1001af320
0x1001af314: jmp 0x1001af320 ; 0x1001af320
0x1001af316: jmp 0x1001af320 ; 0x1001af320
0x1001af318: jmp 0x1001af320 ; 0x1001af320
0x1001af31a: jmp 0x1001af320 ; 0x1001af320
0x1001af31c: jmp 0x1001af320 ; 0x1001af320
0x1001af31e: jmp 0x1001af320 ; 0x1001af320
0x1001af320: mov rbx, rax
0x1001af323: lea rdi, [rbp - 0xf0]
0x1001af32a: call 0x1007c2570 ; 0x1007c2570
0x1001af32f: mov rdi, rbx
0x1001af332: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1001af337: nop word ptr [rax + rax]
