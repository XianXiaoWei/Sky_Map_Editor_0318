0x100614ea0: push rbp
0x100614ea1: mov rbp, rsp
0x100614ea4: push r15
0x100614ea6: push r14
0x100614ea8: push r13
0x100614eaa: push r12
0x100614eac: push rbx
0x100614ead: sub rsp, 0xf8
0x100614eb4: mov qword ptr [rbp - 0xc0], rsi
0x100614ebb: mov rbx, rdi
0x100614ebe: mov rax, qword ptr [rip + 0x5f8a13] ; 0x100c0d8d8
0x100614ec5: mov rax, qword ptr [rax]
0x100614ec8: mov qword ptr [rbp - 0x30], rax
0x100614ecc: call 0x100781700 ; 0x100781700
0x100614ed1: mov r14, rax
0x100614ed4: mov rdi, qword ptr [rbx + 0x980]
0x100614edb: mov eax, dword ptr [rbx + 0x988]
0x100614ee1: lea rsi, [rax + rax*4]
0x100614ee5: shl rsi, 4
0x100614ee9: add rsi, rdi
0x100614eec: lea rdx, [rbp - 0x70]
0x100614ef0: call 0x1006158c0 ; 0x1006158c0
0x100614ef5: cmp dword ptr [rbx + 0x158], 2
0x100614efc: jne 0x100615854
0x100614f02: cmp dword ptr [rbx + 0x108], 0x18
0x100614f09: jne 0x100615873
0x100614f0f: vmovsd xmm0, qword ptr [r14 + 0x260]
0x100614f18: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x100614f20: lea rdi, [rbx + 0x150]
0x100614f27: mov qword ptr [rbp - 0x98], rbx
0x100614f2e: call 0x100795060 ; 0x100795060
0x100614f33: mov r11, qword ptr [rbp - 0x98]
0x100614f3a: mov r12, rax
0x100614f3d: cmp dword ptr [r11 + 0x988], 0
0x100614f45: je 0x1006157c6
0x100614f4b: vmovaps xmm0, xmmword ptr [rip + 0x49b6fd] ; 0x100ab0650
0x100614f53: vdivps xmm5, xmm0, xmmword ptr [rbp - 0xb0]
0x100614f5b: xor ebx, ebx
0x100614f5d: mov r8d, 3
0x100614f63: vmovaps xmm8, xmmword ptr [rip + 0x498605] ; 0x100aad570
0x100614f6b: vxorps xmm9, xmm9, xmm9
0x100614f70: vmovaps xmm6, xmmword ptr [rip + 0x4980d8] ; 0x100aad050
0x100614f78: vmovaps xmmword ptr [rbp - 0xd0], xmm5
0x100614f80: lea edx, [r8 - 3]
0x100614f84: mov r14, qword ptr [r11 + 0x980]
0x100614f8b: mov ebx, ebx
0x100614f8d: lea r15, [rbx + rbx*4]
0x100614f91: shl r15, 4
0x100614f95: lea r13, [r14 + r15]
0x100614f99: cmp qword ptr [rbp - 0xc0], 0
0x100614fa1: je 0x1006153c0
0x100614fa7: movzx eax, byte ptr [r14 + r15 + 0x2d]
0x100614fad: test al, al
0x100614faf: je 0x1006153c0
0x100614fb5: mov dword ptr [rbp - 0xb4], edx
0x100614fbb: vmovaps xmmword ptr [rbp - 0xe0], xmm13
0x100614fc3: vmovaps xmmword ptr [rbp - 0xf0], xmm12
0x100614fcb: vmovaps xmmword ptr [rbp - 0x100], xmm11
0x100614fd3: vmovaps xmmword ptr [rbp - 0x110], xmm10
0x100614fdb: vmovaps xmmword ptr [rbp - 0x120], xmm7
0x100614fe3: mov qword ptr [rbp - 0xb0], r8
0x100614fea: mov qword ptr [rbp - 0xa0], rbx
0x100614ff1: lea rdi, [rbp - 0x70]
0x100614ff5: mov rsi, qword ptr [rbp - 0xc0]
0x100614ffc: call 0x10076be90 ; 0x10076be90
0x100615001: vmovaps xmm0, xmmword ptr [r13]
0x100615007: vsubps xmm1, xmm0, xmmword ptr [rbp - 0x70]
0x10061500c: vmulps xmm2, xmm1, xmm1
0x100615010: vmovshdup xmm3, xmm2
0x100615014: vaddss xmm3, xmm2, xmm3
0x100615018: vpermilpd xmm2, xmm2, 1
0x10061501e: vaddss xmm2, xmm2, xmm3
0x100615022: vrsqrtss xmm3, xmm2, xmm2
0x100615026: vmulss xmm4, xmm2, dword ptr [rip + 0x48f58a] ; 0x100aa45b8
0x10061502e: vcmpeqss xmm2, xmm2, dword ptr [rip + 0x4920ad] ; 0x100aa70e4
0x100615037: vandnps xmm4, xmm2, xmm4
0x10061503b: vmovss xmm5, dword ptr [rip + 0x4935e5] ; 0x100aa8628
0x100615043: vandps xmm2, xmm2, xmm5
0x100615047: vorps xmm2, xmm4, xmm2
0x10061504b: vmulss xmm2, xmm3, xmm2
0x10061504f: vmulss xmm2, xmm3, xmm2
0x100615053: vmovss xmm4, dword ptr [rip + 0x492791] ; 0x100aa77ec
0x10061505b: vsubss xmm2, xmm4, xmm2
0x10061505f: vmulss xmm2, xmm3, xmm2
0x100615063: vpermilps xmm2, xmm2, 0xc0
0x100615069: vmulps xmm2, xmm1, xmm2
0x10061506d: vmovaps xmm1, xmmword ptr [r14 + r15 + 0x10]
0x100615074: vpermilps xmm3, xmm1, 0xd2
0x10061507a: vmulps xmm3, xmm3, xmm2
0x10061507e: vpermilps xmm2, xmm2, 0xd2
0x100615084: vmulps xmm2, xmm1, xmm2
0x100615088: vsubps xmm3, xmm3, xmm2
0x10061508c: vpermilps xmm2, xmm3, 0xd2
0x100615092: vmulps xmm3, xmm3, xmm3
0x100615096: vpermilpd xmm4, xmm3, 1
0x10061509c: vaddss xmm4, xmm4, xmm3
0x1006150a0: vmovshdup xmm3, xmm3
0x1006150a4: vaddss xmm3, xmm3, xmm4
0x1006150a8: vsqrtss xmm3, xmm3, xmm3
0x1006150ac: vucomiss xmm3, dword ptr [rip + 0x492810] ; 0x100aa78c4
0x1006150b4: jbe 0x1006150c0
0x1006150b6: vpermilps xmm3, xmm3, 0xc0
0x1006150bc: vdivps xmm2, xmm2, xmm3
0x1006150c0: mov r11, qword ptr [rbp - 0x98]
0x1006150c7: vmovaps xmm8, xmmword ptr [rip + 0x4984a1] ; 0x100aad570
0x1006150cf: vxorps xmm9, xmm9, xmm9
0x1006150d4: vmovss xmm4, dword ptr [r14 + r15 + 0x28]
0x1006150db: movzx eax, byte ptr [r11 + 0x9b2]
0x1006150e3: lea rcx, [rip + 0x49676e] ; 0x100aab858
0x1006150ea: vmulss xmm3, xmm4, dword ptr [rcx + rax*4]
0x1006150ef: vmovss xmm5, dword ptr [rip + 0x493529] ; 0x100aa8620
0x1006150f7: test rax, rax
0x1006150fa: vmovaps xmm10, xmmword ptr [rbp - 0x110]
0x100615102: vmovaps xmm11, xmmword ptr [rbp - 0x100]
0x10061510a: vmovaps xmm12, xmmword ptr [rbp - 0xf0]
0x100615112: vmovaps xmm13, xmmword ptr [rbp - 0xe0]
0x10061511a: jne 0x100615120
0x10061511c: vxorps xmm5, xmm5, xmm5
0x100615120: vmulss xmm4, xmm4, xmm5
0x100615124: vmulps xmm5, xmm2, xmmword ptr [rip + 0x498864] ; 0x100aad990
0x10061512c: vbroadcastss xmm6, dword ptr [r14 + r15 + 0x24]
0x100615133: vmulps xmm5, xmm5, xmm6
0x100615137: vaddps xmm5, xmm0, xmm5
0x10061513b: vpermilps xmm3, xmm3, 0xc0
0x100615141: vmulps xmm7, xmm1, xmm3
0x100615145: vaddps xmm3, xmm5, xmm7
0x100615149: vmovaps xmmword ptr [rbp - 0x70], xmm3
0x10061514e: vmulps xmm2, xmm2, xmmword ptr [rip + 0x49251a] ; 0x100aa7670
0x100615156: vmulps xmm2, xmm2, xmm6
0x10061515a: vaddps xmm2, xmm0, xmm2
0x10061515e: vaddps xmm0, xmm2, xmm7
0x100615162: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x100615167: vpermilps xmm4, xmm4, 0xc0
0x10061516d: vmulps xmm1, xmm1, xmm4
0x100615171: vaddps xmm2, xmm2, xmm1
0x100615175: vmovaps xmmword ptr [rbp - 0x50], xmm2
0x10061517a: vaddps xmm1, xmm5, xmm1
0x10061517e: vmovaps xmmword ptr [rbp - 0x40], xmm1
0x100615183: mov esi, dword ptr [r14 + r15 + 0x40]
0x100615188: mov dword ptr [rbp - 0x90], esi
0x10061518e: mov eax, dword ptr [r14 + r15 + 0x4c]
0x100615193: mov dword ptr [rbp - 0x8c], eax
0x100615199: mov r9d, dword ptr [r14 + r15 + 0x48]
0x10061519e: mov dword ptr [rbp - 0x88], r9d
0x1006151a5: mov dword ptr [rbp - 0x84], eax
0x1006151ab: mov dword ptr [rbp - 0x80], r9d
0x1006151af: mov edx, dword ptr [r14 + r15 + 0x44]
0x1006151b4: mov dword ptr [rbp - 0x7c], edx
0x1006151b7: mov dword ptr [rbp - 0x78], esi
0x1006151ba: mov dword ptr [rbp - 0x74], edx
0x1006151bd: mov rcx, qword ptr [rbp - 0xb0]
0x1006151c4: lea r8d, [rcx - 2]
0x1006151c8: mov edi, dword ptr [rbp - 0xb4]
0x1006151ce: lea rdi, [rdi + rdi*2]
0x1006151d2: vmovss dword ptr [r12 + rdi*8], xmm3
0x1006151d8: vextractps dword ptr [r12 + rdi*8 + 4], xmm3, 1
0x1006151e0: vextractps dword ptr [r12 + rdi*8 + 8], xmm3, 2
0x1006151e8: mov dword ptr [r12 + rdi*8 + 0x10], esi
0x1006151ed: mov dword ptr [r12 + rdi*8 + 0x14], eax
0x1006151f2: vmulps xmm1, xmm8, xmmword ptr [r14 + r15 + 0x30]
0x1006151f9: vmaxps xmm1, xmm1, xmm9
0x1006151fe: vminps xmm1, xmm1, xmm8
0x100615203: vcvttps2dq xmm1, xmm1
0x100615207: vpextrb r10d, xmm1, 0
0x10061520d: vpextrb edx, xmm1, 4
0x100615213: vpextrb ecx, xmm1, 8
0x100615219: vpextrd esi, xmm1, 3
0x10061521f: shl esi, 0x18
0x100615222: shl ecx, 0x10
0x100615225: or ecx, r10d
0x100615228: or ecx, esi
0x10061522a: shl edx, 8
0x10061522d: or edx, ecx
0x10061522f: mov dword ptr [r12 + rdi*8 + 0xc], edx
0x100615234: mov rcx, qword ptr [rbp - 0xb0]
0x10061523b: lea r10d, [rcx - 1]
0x10061523f: lea rcx, [r8 + r8*2]
0x100615243: mov r8, qword ptr [rbp - 0xb0]
0x10061524a: vmovss dword ptr [r12 + rcx*8], xmm0
0x100615250: vextractps dword ptr [r12 + rcx*8 + 4], xmm0, 1
0x100615258: vextractps dword ptr [r12 + rcx*8 + 8], xmm0, 2
0x100615260: mov dword ptr [r12 + rcx*8 + 0x10], r9d
0x100615265: mov dword ptr [r12 + rcx*8 + 0x14], eax
0x10061526a: vmulps xmm0, xmm8, xmmword ptr [r14 + r15 + 0x30]
0x100615271: vmaxps xmm0, xmm0, xmm9
0x100615276: vminps xmm0, xmm0, xmm8
0x10061527b: vcvttps2dq xmm0, xmm0
0x10061527f: vpextrb eax, xmm0, 0
0x100615285: vpextrb edx, xmm0, 4
0x10061528b: vpextrb edi, xmm0, 8
0x100615291: vpextrd esi, xmm0, 3
0x100615297: shl esi, 0x18
0x10061529a: shl edi, 0x10
0x10061529d: or edi, eax
0x10061529f: or edi, esi
0x1006152a1: shl edx, 8
0x1006152a4: or edx, edi
0x1006152a6: mov dword ptr [r12 + rcx*8 + 0xc], edx
0x1006152ab: lea rax, [r10 + r10*2]
0x1006152af: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1006152b4: vmovss dword ptr [r12 + rax*8], xmm0
0x1006152ba: vextractps dword ptr [r12 + rax*8 + 4], xmm0, 1
0x1006152c2: vextractps dword ptr [r12 + rax*8 + 8], xmm0, 2
0x1006152ca: mov ecx, dword ptr [rbp - 0x80]
0x1006152cd: mov dword ptr [r12 + rax*8 + 0x10], ecx
0x1006152d2: mov ecx, dword ptr [rbp - 0x7c]
0x1006152d5: mov dword ptr [r12 + rax*8 + 0x14], ecx
0x1006152da: vmulps xmm0, xmm8, xmmword ptr [r14 + r15 + 0x30]
0x1006152e1: vmaxps xmm0, xmm0, xmm9
0x1006152e6: vminps xmm0, xmm0, xmm8
0x1006152eb: vcvttps2dq xmm0, xmm0
0x1006152ef: vpextrb ecx, xmm0, 0
0x1006152f5: vpextrb edx, xmm0, 4
0x1006152fb: vpextrb esi, xmm0, 8
0x100615301: vpextrd edi, xmm0, 3
0x100615307: shl edi, 0x18
0x10061530a: shl esi, 0x10
0x10061530d: or esi, ecx
0x10061530f: or esi, edi
0x100615311: shl edx, 8
0x100615314: or edx, esi
0x100615316: mov dword ptr [r12 + rax*8 + 0xc], edx
0x10061531b: mov eax, r8d
0x10061531e: lea rax, [rax + rax*2]
0x100615322: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x100615327: vmovss dword ptr [r12 + rax*8], xmm0
0x10061532d: vextractps dword ptr [r12 + rax*8 + 4], xmm0, 1
0x100615335: vextractps dword ptr [r12 + rax*8 + 8], xmm0, 2
0x10061533d: mov ecx, dword ptr [rbp - 0x78]
0x100615340: mov dword ptr [r12 + rax*8 + 0x10], ecx
0x100615345: mov ecx, dword ptr [rbp - 0x74]
0x100615348: mov dword ptr [r12 + rax*8 + 0x14], ecx
0x10061534d: vmulps xmm0, xmm8, xmmword ptr [r14 + r15 + 0x30]
0x100615354: vmaxps xmm0, xmm0, xmm9
0x100615359: vminps xmm0, xmm0, xmm8
0x10061535e: vcvttps2dq xmm0, xmm0
0x100615362: vpextrb ecx, xmm0, 0
0x100615368: vpextrb edx, xmm0, 4
0x10061536e: vpextrb esi, xmm0, 8
0x100615374: vpextrd edi, xmm0, 3
0x10061537a: shl edi, 0x18
0x10061537d: shl esi, 0x10
0x100615380: or esi, ecx
0x100615382: or esi, edi
0x100615384: shl edx, 8
0x100615387: or edx, esi
0x100615389: mov dword ptr [r12 + rax*8 + 0xc], edx
0x10061538e: vmovaps xmm5, xmmword ptr [rbp - 0xd0]
0x100615396: mov rbx, qword ptr [rbp - 0xa0]
0x10061539d: vmovaps xmm6, xmmword ptr [rip + 0x497cab] ; 0x100aad050
0x1006153a5: vmovaps xmm7, xmmword ptr [rbp - 0x120]
0x1006153ad: jmp 0x100615713 ; 0x100615713
0x1006153b2: nop word ptr cs:[rax + rax]
0x1006153c0: cmp byte ptr [r11 + 0x9b0], 0
0x1006153c8: vmovaps xmm0, xmmword ptr [rip + 0x495180] ; 0x100aaa550
0x1006153d0: je 0x100615417
0x1006153d2: mov rax, qword ptr [r11 + 0x990]
0x1006153d9: mov rax, qword ptr [rax + 0x10]
0x1006153dd: lea rcx, [rax + 0xb0]
0x1006153e4: test rax, rax
0x1006153e7: cmove rcx, rax
0x1006153eb: vpmovzxdq xmm0, qword ptr [rcx + 0x10]
0x1006153f1: vmovdqa xmm1, xmmword ptr [rip + 0x4bd447] ; 0x100ad2840
0x1006153f9: vpor xmm0, xmm0, xmm1
0x1006153fd: vsubpd xmm0, xmm0, xmm1
0x100615401: vcvtpd2ps xmm0, xmm0
0x100615405: vmovsd xmm1, qword ptr [r14 + r15 + 0x48]
0x10061540c: vsubps xmm1, xmm1, xmmword ptr [r14 + r15 + 0x40]
0x100615413: vmulps xmm0, xmm1, xmm0
0x100615417: cmp byte ptr [r14 + r15 + 0x2c], 0
0x10061541d: je 0x100615438
0x10061541f: vmovsd xmm0, qword ptr [r14 + r15 + 0x24]
0x100615426: vinsertps xmm0, xmm0, dword ptr [rip + 0x48fc90], 0x20 ; 0x100aa50c0
0x100615430: vblendps xmm13, xmm0, xmm13, 8
0x100615436: jmp 0x10061544d ; 0x10061544d
0x100615438: vinsertps xmm0, xmm0, dword ptr [rip + 0x48fc7e], 0x20 ; 0x100aa50c0
0x100615442: vbroadcastss xmm1, dword ptr [r14 + r15 + 0x24]
0x100615449: vmulps xmm13, xmm0, xmm1
0x10061544d: vmovaps xmm0, xmmword ptr [rip + 0x4bf50b] ; 0x100ad4960
0x100615455: vinsertps xmm12, xmm0, xmm12, 0xf4
0x10061545b: vmulps xmm1, xmm12, xmm13
0x100615460: vmovaps xmm0, xmmword ptr [r13]
0x100615466: vaddps xmm3, xmm1, xmm0
0x10061546a: vmovaps xmm1, xmmword ptr [rip + 0x4bf4fe] ; 0x100ad4970
0x100615472: vinsertps xmm11, xmm1, xmm11, 0xf4
0x100615478: vmulps xmm2, xmm11, xmm13
0x10061547d: vmovaps xmm1, xmmword ptr [rip + 0x4950db] ; 0x100aaa560
0x100615485: vinsertps xmm10, xmm1, xmm10, 0xf4
0x10061548b: mov r13d, dword ptr [r14 + r15 + 0x4c]
0x100615490: mov r10d, dword ptr [r14 + r15 + 0x48]
0x100615495: mov esi, dword ptr [r14 + r15 + 0x40]
0x10061549a: mov eax, dword ptr [r14 + r15 + 0x44]
0x10061549f: mov dword ptr [rbp - 0xa0], eax
0x1006154a5: lea r11d, [r8 - 2]
0x1006154a9: mov eax, edx
0x1006154ab: mov rcx, qword ptr [rbp - 0x98]
0x1006154b2: cmp byte ptr [rcx + 0x9b3], 0
0x1006154b9: je 0x1006154d0
0x1006154bb: vmovaps xmm4, xmm3
0x1006154bf: jmp 0x1006154d8 ; 0x1006154d8
0x1006154c1: nop word ptr cs:[rax + rax]
0x1006154d0: vmulps xmm1, xmm5, xmm3
0x1006154d4: vaddps xmm4, xmm1, xmm6
0x1006154d8: vmovaps xmm1, xmmword ptr [rip + 0x4bf4a0] ; 0x100ad4980
0x1006154e0: vinsertps xmm7, xmm1, xmm7, 0xf4
0x1006154e6: vmulps xmm1, xmm10, xmm13
0x1006154eb: vaddps xmm2, xmm2, xmm0
0x1006154ef: lea rax, [rax + rax*2]
0x1006154f3: vmovss dword ptr [r12 + rax*8], xmm4
0x1006154f9: vextractps dword ptr [r12 + rax*8 + 4], xmm4, 1
0x100615501: vextractps dword ptr [r12 + rax*8 + 8], xmm3, 2
0x100615509: mov dword ptr [rbp - 0xb0], esi
0x10061550f: mov dword ptr [r12 + rax*8 + 0x10], esi
0x100615514: mov dword ptr [r12 + rax*8 + 0x14], r13d
0x100615519: vmulps xmm3, xmm8, xmmword ptr [r14 + r15 + 0x30]
0x100615520: vmaxps xmm3, xmm3, xmm9
0x100615525: vminps xmm3, xmm3, xmm8
0x10061552a: vcvttps2dq xmm3, xmm3
0x10061552e: vpextrb ecx, xmm3, 0
0x100615534: vpextrb edx, xmm3, 4
0x10061553a: vpextrb edi, xmm3, 8
0x100615540: vpextrd esi, xmm3, 3
0x100615546: shl esi, 0x18
0x100615549: shl edi, 0x10
0x10061554c: or edi, ecx
0x10061554e: or edi, esi
0x100615550: shl edx, 8
0x100615553: or edx, edi
0x100615555: mov dword ptr [r12 + rax*8 + 0xc], edx
0x10061555a: mov r9, r8
0x10061555d: lea r8d, [r8 - 1]
0x100615561: mov rax, qword ptr [rbp - 0x98]
0x100615568: movzx ecx, byte ptr [rax + 0x9b3]
0x10061556f: test cl, cl
0x100615571: je 0x100615580
0x100615573: vmovaps xmm4, xmm2
0x100615577: jmp 0x100615588 ; 0x100615588
0x100615579: nop dword ptr [rax]
0x100615580: vmulps xmm3, xmm5, xmm2
0x100615584: vaddps xmm4, xmm3, xmm6
0x100615588: vmulps xmm3, xmm7, xmm13
0x10061558d: lea rcx, [r11 + r11*2]
0x100615591: vmovss dword ptr [r12 + rcx*8], xmm4
0x100615597: vextractps dword ptr [r12 + rcx*8 + 4], xmm4, 1
0x10061559f: vextractps dword ptr [r12 + rcx*8 + 8], xmm2, 2
0x1006155a7: vaddps xmm1, xmm1, xmm0
0x1006155ab: mov dword ptr [r12 + rcx*8 + 0x10], r10d
0x1006155b0: mov dword ptr [r12 + rcx*8 + 0x14], r13d
0x1006155b5: vmulps xmm2, xmm8, xmmword ptr [r14 + r15 + 0x30]
0x1006155bc: vmaxps xmm2, xmm2, xmm9
0x1006155c1: vminps xmm2, xmm2, xmm8
0x1006155c6: vcvttps2dq xmm2, xmm2
0x1006155ca: vpextrb edx, xmm2, 0
0x1006155d0: vpextrb esi, xmm2, 4
0x1006155d6: vpextrb edi, xmm2, 8
0x1006155dc: vpextrd eax, xmm2, 3
0x1006155e2: shl eax, 0x18
0x1006155e5: shl edi, 0x10
0x1006155e8: or edi, edx
0x1006155ea: or edi, eax
0x1006155ec: shl esi, 8
0x1006155ef: or esi, edi
0x1006155f1: mov dword ptr [r12 + rcx*8 + 0xc], esi
0x1006155f6: mov r11, qword ptr [rbp - 0x98]
0x1006155fd: movzx eax, byte ptr [r11 + 0x9b3]
0x100615605: test al, al
0x100615607: je 0x100615610
0x100615609: vmovaps xmm2, xmm1
0x10061560d: jmp 0x100615618 ; 0x100615618
0x10061560f: nop 
0x100615610: vmulps xmm2, xmm5, xmm1
0x100615614: vaddps xmm2, xmm2, xmm6
0x100615618: mov r13d, dword ptr [rbp - 0xa0]
0x10061561f: vaddps xmm0, xmm3, xmm0
0x100615623: lea rax, [r8 + r8*2]
0x100615627: vmovss dword ptr [r12 + rax*8], xmm2
0x10061562d: vextractps dword ptr [r12 + rax*8 + 4], xmm2, 1
0x100615635: vextractps dword ptr [r12 + rax*8 + 8], xmm1, 2
0x10061563d: mov dword ptr [r12 + rax*8 + 0x10], r10d
0x100615642: mov dword ptr [r12 + rax*8 + 0x14], r13d
0x100615647: vmulps xmm1, xmm8, xmmword ptr [r14 + r15 + 0x30]
0x10061564e: vmaxps xmm1, xmm1, xmm9
0x100615653: vminps xmm1, xmm1, xmm8
0x100615658: vcvttps2dq xmm1, xmm1
0x10061565c: vpextrb ecx, xmm1, 0
0x100615662: vpextrb edx, xmm1, 4
0x100615668: vpextrb esi, xmm1, 8
0x10061566e: vpextrd edi, xmm1, 3
0x100615674: shl edi, 0x18
0x100615677: shl esi, 0x10
0x10061567a: or esi, ecx
0x10061567c: or esi, edi
0x10061567e: shl edx, 8
0x100615681: or edx, esi
0x100615683: mov dword ptr [r12 + rax*8 + 0xc], edx
0x100615688: mov r8, r9
0x10061568b: mov eax, r8d
0x10061568e: movzx ecx, byte ptr [r11 + 0x9b3]
0x100615696: test cl, cl
0x100615698: je 0x1006156a0
0x10061569a: vmovaps xmm1, xmm0
0x10061569e: jmp 0x1006156a8 ; 0x1006156a8
0x1006156a0: vmulps xmm1, xmm5, xmm0
0x1006156a4: vaddps xmm1, xmm1, xmm6
0x1006156a8: mov ecx, dword ptr [rbp - 0xb0]
0x1006156ae: lea rax, [rax + rax*2]
0x1006156b2: vmovss dword ptr [r12 + rax*8], xmm1
0x1006156b8: vextractps dword ptr [r12 + rax*8 + 4], xmm1, 1
0x1006156c0: vextractps dword ptr [r12 + rax*8 + 8], xmm0, 2
0x1006156c8: mov dword ptr [r12 + rax*8 + 0x10], ecx
0x1006156cd: mov dword ptr [r12 + rax*8 + 0x14], r13d
0x1006156d2: vmulps xmm0, xmm8, xmmword ptr [r14 + r15 + 0x30]
0x1006156d9: vmaxps xmm0, xmm0, xmm9
0x1006156de: vminps xmm0, xmm0, xmm8
0x1006156e3: vcvttps2dq xmm0, xmm0
0x1006156e7: vpextrb ecx, xmm0, 0
0x1006156ed: vpextrb edx, xmm0, 4
0x1006156f3: vpextrb esi, xmm0, 8
0x1006156f9: vpextrd edi, xmm0, 3
0x1006156ff: shl edi, 0x18
0x100615702: shl esi, 0x10
0x100615705: or esi, ecx
0x100615707: or esi, edi
0x100615709: shl edx, 8
0x10061570c: or edx, esi
0x10061570e: mov dword ptr [r12 + rax*8 + 0xc], edx
0x100615713: inc ebx
0x100615715: mov eax, dword ptr [r11 + 0x988]
0x10061571c: add r8d, 4
0x100615720: cmp ebx, eax
0x100615722: jb 0x100614f80
0x100615728: add eax, eax
0x10061572a: lea eax, [rax + rax*2]
0x10061572d: cmp byte ptr [r11 + 0x96a], 1
0x100615735: je 0x1006157d6
0x10061573b: lea rdi, [r11 + 8]
0x10061573f: mov dword ptr [r11 + 0x94c], eax
0x100615746: call 0x1007f58d0 ; 0x1007f58d0
0x10061574b: mov rdi, qword ptr [rbp - 0x98]
0x100615752: cmp byte ptr [rdi + 0x9b1], 0
0x100615759: je 0x100615789
0x10061575b: cmp byte ptr [rdi + 0x978], 0
0x100615762: je 0x100615835
0x100615768: lea rdi, [rdi + 0x6b0]
0x10061576f: lea rsi, [rip + 0x5627d1] ; 0x100b77f47 u_color
0x100615776: lea rdx, [rip + 0x1a29f33] ; 0x10203f6b0
0x10061577d: call 0x1007be690 ; 0x1007be690
0x100615782: mov rdi, qword ptr [rbp - 0x98]
0x100615789: cmp byte ptr [rdi + 0x9b0], 0
0x100615790: je 0x10061580e
0x100615792: cmp byte ptr [rdi + 0x978], 0
0x100615799: je 0x100615835
0x10061579f: mov rax, qword ptr [rdi + 0x990]
0x1006157a6: add rdi, 0x6b0
0x1006157ad: test rax, rax
0x1006157b0: je 0x1006157fe
0x1006157b2: mov rax, qword ptr [rax + 0x10]
0x1006157b6: lea rdx, [rax + 0xb0]
0x1006157bd: test rax, rax
0x1006157c0: cmove rdx, rax
0x1006157c4: jmp 0x100615800 ; 0x100615800
0x1006157c6: xor eax, eax
0x1006157c8: cmp byte ptr [r11 + 0x96a], 1
0x1006157d0: jne 0x10061573b
0x1006157d6: lea rdi, [rip + 0x54ca94] ; 0x100b62271 !m_queued
0x1006157dd: lea rsi, [rip + 0x54ca97] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1006157e4: lea r8, [rip + 0x54caac] ; 0x100b62297 VertexRender has already been committed!
0x1006157eb: mov edx, 0x91
0x1006157f0: mov ecx, 4
0x1006157f5: xor eax, eax
0x1006157f7: call 0x1007e6030 ; 0x1007e6030
0x1006157fc: ud2 
0x1006157fe: xor edx, edx
0x100615800: lea rsi, [rip + 0x54f6a2] ; 0x100b64ea9 u_texture
0x100615807: xor ecx, ecx
0x100615809: call 0x1007be8b0 ; 0x1007be8b0
0x10061580e: mov rax, qword ptr [rip + 0x5f80c3] ; 0x100c0d8d8
0x100615815: mov rax, qword ptr [rax]
0x100615818: cmp rax, qword ptr [rbp - 0x30]
0x10061581c: jne 0x100615830
0x10061581e: add rsp, 0xf8
0x100615825: pop rbx
0x100615826: pop r12
0x100615828: pop r13
0x10061582a: pop r14
0x10061582c: pop r15
0x10061582e: pop rbp
0x10061582f: ret 
0x100615830: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100615835: lea rdi, [rip + 0x5614ae] ; 0x100b76cea IsInitialized()
0x10061583c: lea rsi, [rip + 0x54ca38] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x100615843: mov edx, 0xa8
0x100615848: mov ecx, 3
0x10061584d: call 0x1007e5f70 ; 0x1007e5f70
0x100615852: ud2 
0x100615854: lea rdi, [rip + 0x5614c0] ; 0x100b76d1b m_vertexBuffers[ idx ].GetUsage() == Bind_Dynamic
0x10061585b: lea rsi, [rip + 0x54ca19] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x100615862: mov edx, 0x115
0x100615867: mov ecx, 3
0x10061586c: call 0x1007e5f70 ; 0x1007e5f70
0x100615871: ud2 
0x100615873: lea rdi, [rip + 0x5614d3] ; 0x100b76d4d VsIsValidMap< BufferType >::Test( &m_format, idx )
0x10061587a: lea rsi, [rip + 0x54c9fa] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x100615881: mov edx, 0x116
0x100615886: mov ecx, 3
0x10061588b: call 0x1007e5f70 ; 0x1007e5f70
0x100615890: ud2 
0x100615892: nop word ptr cs:[rax + rax]
