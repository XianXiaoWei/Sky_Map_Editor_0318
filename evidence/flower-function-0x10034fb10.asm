0x10034fb10: push rbp
0x10034fb11: mov rbp, rsp
0x10034fb14: push r15
0x10034fb16: push r14
0x10034fb18: push r13
0x10034fb1a: push r12
0x10034fb1c: push rbx
0x10034fb1d: sub rsp, 0x328
0x10034fb24: mov qword ptr [rbp - 0x2e8], rcx
0x10034fb2b: mov qword ptr [rbp - 0x258], rdx
0x10034fb32: mov dword ptr [rbp - 0x238], esi
0x10034fb38: mov r12, rdi
0x10034fb3b: mov rax, qword ptr [rip + 0x8bdd96] ; 0x100c0d8d8
0x10034fb42: mov rax, qword ptr [rax]
0x10034fb45: mov qword ptr [rbp - 0x30], rax
0x10034fb49: lea rdi, [r12 + 0x11dd0]
0x10034fb51: lea rbx, [r12 + 0x35dd8]
0x10034fb59: lea r14, [r12 + 0x335dd8]
0x10034fb61: lea r15, [r12 + 0x435dd8]
0x10034fb69: mov esi, 0x20000
0x10034fb6e: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x10034fb73: mov esi, 0x400000
0x10034fb78: mov rdi, rbx
0x10034fb7b: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x10034fb80: mov esi, 0xff
0x10034fb85: mov edx, 0x20000
0x10034fb8a: mov rdi, r15
0x10034fb8d: call 0x100aa2900 ; 0x100aa2900 _memset
0x10034fb92: xor ebx, ebx
0x10034fb94: xor eax, eax
0x10034fb96: call 0x100011c10 ; 0x100011c10
0x10034fb9b: mov rdi, r12
0x10034fb9e: movabs rax, 0x100007ffe
0x10034fba8: xor ecx, ecx
0x10034fbaa: nop word ptr [rax + rax]
0x10034fbb0: lea rdx, [rdi + rbx + 0x435db8]
0x10034fbb8: mov qword ptr [rdi + rbx + 0x435db8], rcx
0x10034fbc0: mov ecx, eax
0x10034fbc2: and ecx, 0xfffffffe
0x10034fbc5: shl rcx, 5
0x10034fbc9: lea rsi, [rdi + rcx + 0x335dd8]
0x10034fbd1: mov qword ptr [rdi + rcx + 0x335dd8], rdx
0x10034fbd9: lea rdx, [rdi + rbx + 0x435d78]
0x10034fbe1: mov qword ptr [rdi + rbx + 0x435d78], rsi
0x10034fbe9: lea rcx, [rdi + rbx + 0x435d58]
0x10034fbf1: mov qword ptr [rdi + rbx + 0x435d58], rdx
0x10034fbf9: add rbx, -0x80
0x10034fbfd: add rax, -4
0x10034fc01: cmp ebx, 0xfff00000
0x10034fc07: jne 0x10034fbb0
0x10034fc09: mov qword ptr [rdi + 0x455dd8], r14
0x10034fc10: mov eax, dword ptr [rdi + 0x11dc0]
0x10034fc16: test eax, eax
0x10034fc18: mov qword ptr [rbp - 0x228], rdi
0x10034fc1f: je 0x10034fe4c
0x10034fc25: xor ebx, ebx
0x10034fc27: lea r13, [rbp - 0x220]
0x10034fc2e: lea r14, [rbp - 0x330]
0x10034fc35: nop word ptr cs:[rax + rax]
0x10034fc40: mov ebx, ebx
0x10034fc42: imul r15, rbx, 0x110
0x10034fc49: cmp byte ptr [rdi + r15 + 0xf48], 0
0x10034fc52: je 0x10034fe42
0x10034fc58: cmp dword ptr [rdi + r15 + 0xf4c], 0
0x10034fc61: je 0x10034fe42
0x10034fc67: vmovaps xmm8, xmmword ptr [rdi + r15 + 0xee0]
0x10034fc71: vmovaps xmm1, xmmword ptr [rdi + r15 + 0xef0]
0x10034fc7b: vmovshdup xmm2, xmm1
0x10034fc7f: vpermilpd xmm3, xmm1, 1
0x10034fc85: vpermilps xmm4, xmm1, 0xe7
0x10034fc8b: vaddss xmm5, xmm1, xmm1
0x10034fc8f: vaddss xmm6, xmm2, xmm2
0x10034fc93: vaddss xmm7, xmm3, xmm3
0x10034fc97: vmulss xmm9, xmm1, xmm5
0x10034fc9b: vmulss xmm0, xmm1, xmm6
0x10034fc9f: vmulss xmm11, xmm1, xmm7
0x10034fca3: vmulss xmm12, xmm4, xmm5
0x10034fca7: vmulss xmm10, xmm2, xmm6
0x10034fcab: vmulss xmm2, xmm2, xmm7
0x10034fcaf: vmulss xmm6, xmm4, xmm6
0x10034fcb3: vmulss xmm3, xmm3, xmm7
0x10034fcb7: vmulss xmm4, xmm4, xmm7
0x10034fcbb: vmovss xmm13, dword ptr [rip + 0x7553fd] ; 0x100aa50c0
0x10034fcc3: vsubss xmm7, xmm13, xmm10
0x10034fcc8: vsubss xmm7, xmm7, xmm3
0x10034fccc: vaddss xmm1, xmm0, xmm4
0x10034fcd0: vsubss xmm5, xmm11, xmm6
0x10034fcd4: vinsertps xmm1, xmm7, xmm1, 0x10
0x10034fcda: vinsertps xmm1, xmm1, xmm5, 0x20
0x10034fce0: vsubss xmm0, xmm0, xmm4
0x10034fce4: vsubss xmm4, xmm13, xmm9
0x10034fce9: vsubss xmm3, xmm4, xmm3
0x10034fced: vaddss xmm5, xmm2, xmm12
0x10034fcf2: vinsertps xmm0, xmm0, xmm3, 0x10
0x10034fcf8: vinsertps xmm0, xmm0, xmm5, 0x20
0x10034fcfe: vaddss xmm3, xmm11, xmm6
0x10034fd02: vsubss xmm2, xmm2, xmm12
0x10034fd07: vsubss xmm4, xmm4, xmm10
0x10034fd0c: vinsertps xmm2, xmm3, xmm2, 0x10
0x10034fd12: vinsertps xmm2, xmm2, xmm4, 0x20
0x10034fd18: vmovaps xmm3, xmmword ptr [rip + 0x757950] ; 0x100aa7670
0x10034fd20: vmulps xmm3, xmm3, xmmword ptr [rdi + r15 + 0xf00]
0x10034fd2a: vpermilps xmm4, xmm3, 0xc0
0x10034fd30: vmulps xmm6, xmm4, xmm1
0x10034fd34: vxorps xmm4, xmm4, xmm4
0x10034fd38: vmulps xmm5, xmm0, xmm4
0x10034fd3c: vaddps xmm7, xmm5, xmm6
0x10034fd40: vmulps xmm6, xmm2, xmm4
0x10034fd44: vaddps xmm9, xmm6, xmm7
0x10034fd48: vmulps xmm1, xmm1, xmm4
0x10034fd4c: vpermilps xmm7, xmm3, 0xd5
0x10034fd52: vmulps xmm0, xmm0, xmm7
0x10034fd56: vaddps xmm0, xmm0, xmm1
0x10034fd5a: vaddps xmm0, xmm6, xmm0
0x10034fd5e: vaddps xmm1, xmm5, xmm1
0x10034fd62: vpermilps xmm3, xmm3, 0xea
0x10034fd68: vmulps xmm2, xmm2, xmm3
0x10034fd6c: vaddps xmm1, xmm2, xmm1
0x10034fd70: vblendps xmm2, xmm9, xmm4, 8
0x10034fd76: vblendps xmm0, xmm0, xmm4, 8
0x10034fd7c: vblendps xmm1, xmm1, xmm4, 8
0x10034fd82: vinsertps xmm3, xmm8, xmm13, 0x30
0x10034fd88: lea r12, [rdi + r15 + 0xf60]
0x10034fd90: vmovaps xmmword ptr [rdi + r15 + 0xf60], xmm2
0x10034fd9a: vmovaps xmmword ptr [rdi + r15 + 0xf70], xmm0
0x10034fda4: vmovaps xmmword ptr [rdi + r15 + 0xf80], xmm1
0x10034fdae: vmovaps xmmword ptr [rdi + r15 + 0xf90], xmm3
0x10034fdb8: mov rdi, r13
0x10034fdbb: mov rsi, r12
0x10034fdbe: call 0x100076940 ; 0x100076940
0x10034fdc3: vmovaps xmm0, xmmword ptr [rbp - 0x220]
0x10034fdcb: mov rax, qword ptr [rbp - 0x228]
0x10034fdd2: vmovaps xmmword ptr [rax + r15 + 0xfa0], xmm0
0x10034fddc: vmovaps xmm0, xmmword ptr [rbp - 0x210]
0x10034fde4: mov rax, qword ptr [rbp - 0x228]
0x10034fdeb: vmovaps xmmword ptr [rax + r15 + 0xfb0], xmm0
0x10034fdf5: vmovaps xmm0, xmmword ptr [rbp - 0x200]
0x10034fdfd: mov rax, qword ptr [rbp - 0x228]
0x10034fe04: vmovaps xmmword ptr [rax + r15 + 0xfc0], xmm0
0x10034fe0e: vmovaps xmm0, xmmword ptr [rbp - 0x1f0]
0x10034fe16: mov rax, qword ptr [rbp - 0x228]
0x10034fe1d: vmovaps xmmword ptr [rax + r15 + 0xfd0], xmm0
0x10034fe27: mov rdi, r12
0x10034fe2a: mov rsi, r13
0x10034fe2d: mov rdx, r14
0x10034fe30: call 0x10078c720 ; 0x10078c720
0x10034fe35: mov rdi, qword ptr [rbp - 0x228]
0x10034fe3c: mov eax, dword ptr [rdi + 0x11dc0]
0x10034fe42: inc ebx
0x10034fe44: cmp ebx, eax
0x10034fe46: jb 0x10034fc40
0x10034fe4c: mov r12d, dword ptr [rbp - 0x238]
0x10034fe53: test r12d, r12d
0x10034fe56: je 0x10034fe7a
0x10034fe58: mov r9d, r12d
0x10034fe5b: mov r8d, r9d
0x10034fe5e: and r8d, 1
0x10034fe62: cmp r12d, 1
0x10034fe66: mov r15, qword ptr [rbp - 0x258]
0x10034fe6d: jne 0x10034fe85
0x10034fe6f: xor ecx, ecx
0x10034fe71: xor ebx, ebx
0x10034fe73: test r8, r8
0x10034fe76: jne 0x10034fed3
0x10034fe78: jmp 0x10034fef0 ; 0x10034fef0
0x10034fe7a: xor ebx, ebx
0x10034fe7c: mov r15, qword ptr [rbp - 0x258]
0x10034fe83: jmp 0x10034fef0 ; 0x10034fef0
0x10034fe85: sub r9, r8
0x10034fe88: lea rsi, [r15 + 0xf4]
0x10034fe8f: xor ecx, ecx
0x10034fe91: mov edi, 0xaaaaaaab
0x10034fe96: xor eax, eax
0x10034fe98: nop dword ptr [rax + rax]
0x10034fea0: mov edx, dword ptr [rsi - 0xd0]
0x10034fea6: mov ebx, dword ptr [rsi]
0x10034fea8: imul rdx, rdi
0x10034feac: shr rdx, 0x21
0x10034feb0: add edx, eax
0x10034feb2: imul rbx, rdi
0x10034feb6: shr rbx, 0x21
0x10034feba: add ebx, edx
0x10034febc: add rcx, 2
0x10034fec0: add rsi, 0x1a0
0x10034fec7: mov eax, ebx
0x10034fec9: cmp r9, rcx
0x10034fecc: jne 0x10034fea0
0x10034fece: test r8, r8
0x10034fed1: je 0x10034fef0
0x10034fed3: imul rax, rcx, 0xd0
0x10034feda: mov eax, dword ptr [r15 + rax + 0x24]
0x10034fedf: mov ecx, 0xaaaaaaab
0x10034fee4: imul rcx, rax
0x10034fee8: shr rcx, 0x21
0x10034feec: add ecx, ebx
0x10034feee: mov ebx, ecx
0x10034fef0: call 0x1007c6c20 ; 0x1007c6c20
0x10034fef5: mov esi, ebx
0x10034fef7: shl rsi, 4
0x10034fefb: lea rcx, [rip + 0x1cf8c4e] ; 0x102048b50
0x10034ff02: mov rdx, qword ptr [rcx]
0x10034ff05: mov ecx, 0x10
0x10034ff0a: mov rdi, rax
0x10034ff0d: call 0x100795530 ; 0x100795530
0x10034ff12: mov r14, rax
0x10034ff15: test r12d, r12d
0x10034ff18: je 0x100350251
0x10034ff1e: mov eax, r12d
0x10034ff21: mov qword ptr [rbp - 0x278], rax
0x10034ff28: xor eax, eax
0x10034ff2a: xor r10d, r10d
0x10034ff2d: vxorps xmm0, xmm0, xmm0
0x10034ff31: vmovss dword ptr [rbp - 0x240], xmm0
0x10034ff39: mov r9, qword ptr [rbp - 0x228]
0x10034ff40: mov qword ptr [rbp - 0x230], r14
0x10034ff47: mov qword ptr [rbp - 0x280], rax
0x10034ff4e: imul rax, rax, 0xd0
0x10034ff55: cmp dword ptr [r15 + rax + 0x24], 0
0x10034ff5b: je 0x100350231
0x10034ff61: lea r13, [r15 + rax + 0x24]
0x10034ff66: xor r11d, r11d
0x10034ff69: nop dword ptr [rax]
0x10034ff70: mov ebx, r10d
0x10034ff73: shl rbx, 4
0x10034ff77: vmovaps xmm0, xmmword ptr [rip + 0x755151] ; 0x100aa50d0
0x10034ff7f: vmovaps xmmword ptr [r14 + rbx], xmm0
0x10034ff85: mov rcx, qword ptr [r13 + 4]
0x10034ff89: mov rax, qword ptr [r13 + 0xc]
0x10034ff8d: mov edx, r11d
0x10034ff90: movzx edx, word ptr [rax + rdx*2]
0x10034ff94: lea rdx, [rdx + rdx*8]
0x10034ff98: cmp byte ptr [rcx + rdx*4 + 0xd], 0
0x10034ff9d: jle 0x100350220
0x10034ffa3: lea esi, [r11 + 2]
0x10034ffa7: movzx esi, word ptr [rax + rsi*2]
0x10034ffab: lea edi, [r11 + 1]
0x10034ffaf: movzx eax, word ptr [rax + rdi*2]
0x10034ffb3: vmovsd xmm0, qword ptr [rcx + rdx*4]
0x10034ffb8: vinsertps xmm1, xmm0, dword ptr [rcx + rdx*4 + 8], 0x20
0x10034ffc0: lea rax, [rax + rax*8]
0x10034ffc4: vmovsd xmm0, qword ptr [rcx + rax*4]
0x10034ffc9: vinsertps xmm3, xmm0, dword ptr [rcx + rax*4 + 8], 0x20
0x10034ffd1: lea rax, [rsi + rsi*8]
0x10034ffd5: vmovsd xmm0, qword ptr [rcx + rax*4]
0x10034ffda: vinsertps xmm4, xmm0, dword ptr [rcx + rax*4 + 8], 0x20
0x10034ffe2: vmovaps xmm0, xmmword ptr [rip + 0x76cec6] ; 0x100abceb0
0x10034ffea: vmovaps xmm2, xmm0
0x10034ffee: vmovaps xmmword ptr [rbp - 0x2e0], xmm1
0x10034fff6: vmulps xmm0, xmm1, xmm2
0x10034fffa: vmovaps xmmword ptr [rbp - 0x2d0], xmm3
0x100350002: vmulps xmm1, xmm3, xmm2
0x100350006: vaddps xmm0, xmm0, xmm1
0x10035000a: vmovaps xmmword ptr [rbp - 0x2c0], xmm4
0x100350012: vmulps xmm1, xmm4, xmm2
0x100350016: vaddps xmm3, xmm0, xmm1
0x10035001a: vmovshdup xmm0, xmm3
0x10035001e: vxorps xmm1, xmm1, xmm1
0x100350022: vucomiss xmm1, xmm0
0x100350026: jae 0x100350220
0x10035002c: mov eax, dword ptr [r9 + 0x11dc0]
0x100350033: test eax, eax
0x100350035: je 0x100350220
0x10035003b: add rbx, r14
0x10035003e: lea r12, [rcx + rdx*4 + 0x10]
0x100350043: vpermilps xmm0, xmm3, 0
0x100350049: vmovaps xmmword ptr [rbp - 0x2b0], xmm0
0x100350051: vpermilps xmm0, xmm3, 0x55
0x100350057: vmovaps xmmword ptr [rbp - 0x270], xmm0
0x10035005f: vpermilps xmm0, xmm3, 0xaa
0x100350065: vmovaps xmmword ptr [rbp - 0x250], xmm0
0x10035006d: xor r14d, r14d
0x100350070: vmovaps xmmword ptr [rbp - 0x290], xmm3
0x100350078: mov qword ptr [rbp - 0x2a0], r11
0x10035007f: nop 
0x100350080: mov r14d, r14d
0x100350083: imul rcx, r14, 0x110
0x10035008a: cmp byte ptr [r9 + rcx + 0xf48], 0
0x100350093: je 0x100350190
0x100350099: movzx edx, byte ptr [r9 + rcx + 0xf54]
0x1003500a2: cmp dl, byte ptr [r12]
0x1003500a6: jne 0x100350190
0x1003500ac: mov edx, dword ptr [r9 + rcx + 0xf4c]
0x1003500b4: cmp edx, 1
0x1003500b7: je 0x10035011a
0x1003500b9: cmp edx, 2
0x1003500bc: jne 0x10035019e
0x1003500c2: mov r15d, r10d
0x1003500c5: vmovaps xmmword ptr [rbp - 0x220], xmm3
0x1003500cd: lea rsi, [r9 + rcx + 0xf60]
0x1003500d5: lea rdi, [rbp - 0x220]
0x1003500dc: call 0x10078ccc0 ; 0x10078ccc0
0x1003500e1: test al, al
0x1003500e3: mov r9, qword ptr [rbp - 0x228]
0x1003500ea: vmovaps xmm3, xmmword ptr [rbp - 0x290]
0x1003500f2: mov r10d, r15d
0x1003500f5: mov r11, qword ptr [rbp - 0x2a0]
0x1003500fc: jne 0x10035019e
0x100350102: mov eax, dword ptr [r9 + 0x11dc0]
0x100350109: inc r14d
0x10035010c: cmp r14d, eax
0x10035010f: jb 0x100350080
0x100350115: jmp 0x100350216 ; 0x100350216
0x10035011a: vmovaps xmm0, xmmword ptr [rbp - 0x2b0]
0x100350122: vmulps xmm0, xmm0, xmmword ptr [r9 + rcx + 0xfa0]
0x10035012c: vmovaps xmm1, xmmword ptr [rbp - 0x270]
0x100350134: vmulps xmm1, xmm1, xmmword ptr [r9 + rcx + 0xfb0]
0x10035013e: vaddps xmm0, xmm0, xmm1
0x100350142: vmovaps xmm1, xmmword ptr [rbp - 0x250]
0x10035014a: vmulps xmm1, xmm1, xmmword ptr [r9 + rcx + 0xfc0]
0x100350154: vaddps xmm0, xmm0, xmm1
0x100350158: vaddps xmm0, xmm0, xmmword ptr [r9 + rcx + 0xfd0]
0x100350162: vmulps xmm0, xmm0, xmm0
0x100350166: vmovshdup xmm1, xmm0
0x10035016a: vaddss xmm1, xmm0, xmm1
0x10035016e: vpermilpd xmm0, xmm0, 1
0x100350174: vaddss xmm0, xmm0, xmm1
0x100350178: vmovss xmm1, dword ptr [rip + 0x754f40] ; 0x100aa50c0
0x100350180: vucomiss xmm1, xmm0
0x100350184: jae 0x10035019e
0x100350186: nop word ptr cs:[rax + rax]
0x100350190: inc r14d
0x100350193: cmp r14d, eax
0x100350196: jb 0x100350080
0x10035019c: jmp 0x100350216 ; 0x100350216
0x10035019e: vmovaps xmm0, xmmword ptr [rbp - 0x2e0]
0x1003501a6: vmovaps xmm2, xmmword ptr [rbp - 0x2c0]
0x1003501ae: vsubps xmm0, xmm0, xmm2
0x1003501b2: vmovaps xmm1, xmmword ptr [rbp - 0x2d0]
0x1003501ba: vsubps xmm1, xmm1, xmm2
0x1003501be: vpermilps xmm2, xmm0, 0xd2
0x1003501c4: vmulps xmm2, xmm2, xmm1
0x1003501c8: vpermilps xmm1, xmm1, 0xd2
0x1003501ce: vmulps xmm0, xmm0, xmm1
0x1003501d2: vsubps xmm0, xmm2, xmm0
0x1003501d6: vmulps xmm0, xmm0, xmm0
0x1003501da: vpermilpd xmm1, xmm0, 1
0x1003501e0: vaddss xmm1, xmm1, xmm0
0x1003501e4: vmovshdup xmm0, xmm0
0x1003501e8: vaddss xmm0, xmm0, xmm1
0x1003501ec: vsqrtss xmm0, xmm0, xmm0
0x1003501f0: vmulss xmm0, xmm0, dword ptr [rip + 0x7543c0] ; 0x100aa45b8
0x1003501f8: vinsertps xmm1, xmm3, xmm0, 0x30
0x1003501fe: vmovss xmm2, dword ptr [rbp - 0x240]
0x100350206: vaddss xmm2, xmm2, xmm0
0x10035020a: vmovss dword ptr [rbp - 0x240], xmm2
0x100350212: vmovaps xmmword ptr [rbx], xmm1
0x100350216: mov r14, qword ptr [rbp - 0x230]
0x10035021d: nop dword ptr [rax]
0x100350220: inc r10d
0x100350223: add r11d, 3
0x100350227: cmp r11d, dword ptr [r13]
0x10035022b: jb 0x10034ff70
0x100350231: mov rax, qword ptr [rbp - 0x280]
0x100350238: inc rax
0x10035023b: cmp rax, qword ptr [rbp - 0x278]
0x100350242: mov r15, qword ptr [rbp - 0x258]
0x100350249: jb 0x10034ff47
0x10035024f: jmp 0x100350264 ; 0x100350264
0x100350251: vxorps xmm0, xmm0, xmm0
0x100350255: vmovss dword ptr [rbp - 0x240], xmm0
0x10035025d: mov r9, qword ptr [rbp - 0x228]
0x100350264: mov dword ptr [r9 + 0x35dd0], 0
0x10035026f: vmovss xmm0, dword ptr [rbp - 0x240]
0x100350277: vmulss xmm0, xmm0, dword ptr [rip + 0x76cc1d] ; 0x100abce9c
0x10035027f: vmovss xmm1, dword ptr [rip + 0x757561] ; 0x100aa77e8
0x100350287: vmaxss xmm0, xmm1, xmm0
0x10035028b: vmovss dword ptr [r9 + 0x35dd4], xmm0
0x100350294: mov eax, dword ptr [rbp - 0x238]
0x10035029a: test eax, eax
0x10035029c: je 0x100350ae5
0x1003502a2: mov qword ptr [rbp - 0x230], r14
0x1003502a9: vsqrtss xmm0, xmm0, xmm0
0x1003502ad: vmulss xmm1, xmm0, dword ptr [rip + 0x757537] ; 0x100aa77ec
0x1003502b5: vinsertps xmm0, xmm1, dword ptr [rip + 0x7567ed], 0x10 ; 0x100aa6aac
0x1003502bf: vmovaps xmmword ptr [rbp - 0x270], xmm1
0x1003502c7: vinsertps xmm0, xmm0, xmm1, 0x20
0x1003502cd: vxorps xmm1, xmm1, xmm1
0x1003502d1: vblendps xmm2, xmm1, xmm0, 1
0x1003502d7: vmovaps xmmword ptr [rbp - 0x2e0], xmm2
0x1003502df: vblendps xmm2, xmm0, xmm1, 0xd
0x1003502e5: vmovaps xmmword ptr [rbp - 0x2d0], xmm2
0x1003502ed: vblendps xmm0, xmm0, xmm1, 0xb
0x1003502f3: vmovaps xmmword ptr [rbp - 0x2c0], xmm0
0x1003502fb: mov eax, eax
0x1003502fd: mov qword ptr [rbp - 0x278], rax
0x100350304: vxorps xmm1, xmm1, xmm1
0x100350308: xor ecx, ecx
0x10035030a: mov rax, qword ptr [rip + 0x8ba26f] ; 0x100c0a580
0x100350311: add rax, 8
0x100350315: mov qword ptr [rbp - 0x238], rax
0x10035031c: xor edi, edi
0x10035031e: vxorps xmm0, xmm0, xmm0
0x100350322: vmovss dword ptr [rbp - 0x2b0], xmm0
0x10035032a: mov qword ptr [rbp - 0x280], rcx
0x100350331: imul rcx, rcx, 0xd0
0x100350338: mov r8d, dword ptr [r15 + rcx + 0x24]
0x10035033d: test r8d, r8d
0x100350340: je 0x10035070a
0x100350346: lea rcx, [r15 + rcx + 0x24]
0x10035034b: mov qword ptr [rbp - 0x240], rcx
0x100350352: xor eax, eax
0x100350354: nop word ptr cs:[rax + rax]
0x100350360: mov ecx, edi
0x100350362: shl rcx, 4
0x100350366: mov rdx, qword ptr [rbp - 0x230]
0x10035036d: vbroadcastss xmm0, dword ptr [rdx + rcx + 0xc]
0x100350374: vucomiss xmm0, xmm1
0x100350378: jbe 0x1003506fc
0x10035037e: mov edx, eax
0x100350380: shl edx, 0xd
0x100350383: xor edx, eax
0x100350385: mov esi, edx
0x100350387: imul esi, esi
0x10035038a: imul esi, esi, 0x3d73
0x100350390: add esi, 0xc0ae5
0x100350396: imul esi, edx
0x100350399: add esi, 0x5208dd0d
0x10035039f: and esi, 0x7fffffff
0x1003503a5: vxorps xmm3, xmm3, xmm3
0x1003503a9: vcvtsi2ss xmm1, xmm8, esi
0x1003503ad: vmulss xmm1, xmm1, dword ptr [rip + 0x75e4c7] ; 0x100aae87c
0x1003503b5: vmovss xmm2, dword ptr [rip + 0x754d03] ; 0x100aa50c0
0x1003503bd: vaddss xmm1, xmm1, xmm2
0x1003503c1: vaddss xmm1, xmm1, xmm2
0x1003503c5: vmulss xmm1, xmm1, dword ptr [rip + 0x7541eb] ; 0x100aa45b8
0x1003503cd: vsubss xmm2, xmm2, xmm1
0x1003503d1: vmulss xmm2, xmm2, xmm3
0x1003503d5: vaddss xmm1, xmm1, xmm2
0x1003503d9: vaddss xmm1, xmm1, dword ptr [rip + 0x764cd7] ; 0x100ab50b8
0x1003503e1: vdivss xmm0, xmm0, dword ptr [r9 + 0x35dd4]
0x1003503ea: vucomiss xmm0, xmm1
0x1003503ee: jbe 0x100350590
0x1003503f4: mov esi, dword ptr [r9 + 0x35dd0]
0x1003503fb: cmp rsi, 0x1000
0x100350402: jae 0x100350b24
0x100350408: mov dword ptr [rbp - 0x2a0], eax
0x10035040e: mov dword ptr [rbp - 0x290], edi
0x100350414: add rcx, qword ptr [rbp - 0x230]
0x10035041b: lea eax, [rsi + 1]
0x10035041e: mov dword ptr [r9 + 0x35dd0], eax
0x100350425: vmovaps xmm0, xmmword ptr [rcx]
0x100350429: vinsertps xmm1, xmm0, dword ptr [rbp - 0x270], 0x30
0x100350433: shl rsi, 4
0x100350437: vmovaps xmmword ptr [r9 + rsi + 0x11dd0], xmm1
0x100350441: vmovaps xmm1, xmmword ptr [rbp - 0x2e0]
0x100350449: vmovaps xmmword ptr [rbp - 0x330], xmm1
0x100350451: vmovaps xmm1, xmmword ptr [rbp - 0x2d0]
0x100350459: vmovaps xmmword ptr [rbp - 0x320], xmm1
0x100350461: vmovaps xmm1, xmmword ptr [rbp - 0x2c0]
0x100350469: vmovaps xmmword ptr [rbp - 0x310], xmm1
0x100350471: vinsertps xmm0, xmm0, dword ptr [rip + 0x754c45], 0x30 ; 0x100aa50c0
0x10035047b: vmovaps xmmword ptr [rbp - 0x300], xmm0
0x100350483: cmp dword ptr [r9 + 0x11dc0], 0
0x10035048b: lea r14, [r9 + rsi + 0x21dde]
0x100350493: je 0x1003506a0
0x100350499: lea r13, [r9 + rsi + 0x21dd0]
0x1003504a1: xor r15d, r15d
0x1003504a4: mov qword ptr [rbp - 0x250], rsi
0x1003504ab: nop dword ptr [rax + rax]
0x1003504b0: mov r15d, r15d
0x1003504b3: imul r12, r15, 0x110
0x1003504ba: cmp byte ptr [r9 + r12 + 0xf48], 0
0x1003504c3: je 0x10035056d
0x1003504c9: cmp dword ptr [r9 + r12 + 0xf4c], 0
0x1003504d2: je 0x1003504fa
0x1003504d4: lea rdi, [r9 + r12 + 0xf60]
0x1003504dc: lea rsi, [rbp - 0x330]
0x1003504e3: call 0x10078de40 ; 0x10078de40
0x1003504e8: test al, al
0x1003504ea: mov r9, qword ptr [rbp - 0x228]
0x1003504f1: mov rsi, qword ptr [rbp - 0x250]
0x1003504f8: je 0x10035056d
0x1003504fa: movzx eax, byte ptr [r14]
0x1003504fe: cmp rax, 4
0x100350502: jae 0x100350599
0x100350508: mov ecx, eax
0x10035050a: inc cl
0x10035050c: mov byte ptr [r14], cl
0x10035050f: lea rcx, [r9 + rsi]
0x100350513: mov byte ptr [rax + rcx + 0x21dda], r15b
0x10035051b: vmovss xmm0, dword ptr [r9 + r12 + 0xf40]
0x100350525: vaddss xmm1, xmm0, dword ptr [r13]
0x10035052b: vmovss dword ptr [r13], xmm1
0x100350531: vmovss xmm1, dword ptr [rbp - 0x2b0]
0x100350539: vaddss xmm1, xmm1, xmm0
0x10035053d: vmovss dword ptr [rbp - 0x2b0], xmm1
0x100350545: vmovaps xmm0, xmmword ptr [rbp - 0x270]
0x10035054d: vaddss xmm0, xmm0, dword ptr [r9 + r12 + 0xf44]
0x100350557: vmovss xmm1, dword ptr [r13 - 0xfff4]
0x100350560: vmaxss xmm0, xmm1, xmm0
0x100350564: vmovss dword ptr [r13 - 0xfff4], xmm0
0x10035056d: inc r15d
0x100350570: cmp r15d, dword ptr [r9 + 0x11dc0]
0x100350577: jb 0x1003504b0
0x10035057d: jmp 0x1003506a0 ; 0x1003506a0
0x100350582: nop word ptr cs:[rax + rax]
0x100350590: vxorps xmm1, xmm1, xmm1
0x100350594: jmp 0x1003506fc ; 0x1003506fc
0x100350599: mov rax, qword ptr [rip + 0x8b9f80] ; 0x100c0a520
0x1003505a0: mov rcx, rax
0x1003505a3: lea rax, [rcx + 0x18]
0x1003505a7: mov qword ptr [rbp - 0x220], rax
0x1003505ae: lea rax, [rcx + 0x40]
0x1003505b2: mov qword ptr [rbp - 0xd0], rax
0x1003505b9: lea rdi, [rbp - 0xd0]
0x1003505c0: lea rbx, [rbp - 0x218]
0x1003505c7: mov rsi, rbx
0x1003505ca: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1003505cf: mov qword ptr [rbp - 0x48], 0
0x1003505d7: mov dword ptr [rbp - 0x40], 0xffffffff
0x1003505de: mov rdi, rbx
0x1003505e1: mov rax, qword ptr [rip + 0x8bcfe0] ; 0x100c0d5c8
0x1003505e8: lea rbx, [rax + 0x18]
0x1003505ec: mov qword ptr [rbp - 0x220], rbx
0x1003505f3: lea r15, [rax + 0x40]
0x1003505f7: mov qword ptr [rbp - 0xd0], r15
0x1003505fe: mov edx, 1
0x100350603: lea rsi, [rip + 0x826655] ; 0x100b76c5f Flowers
0x10035060a: call 0x1007a56a0 ; 0x1007a56a0
0x10035060f: mov edx, 0x1b
0x100350614: lea rdi, [rbp - 0x220]
0x10035061b: lea rsi, [rip + 0x8316c8] ; 0x100b81cea Too many patches per seed! 
0x100350622: call 0x100011930 ; 0x100011930
0x100350627: movzx esi, byte ptr [r14]
0x10035062b: inc esi
0x10035062d: mov rdi, rax
0x100350630: call 0x100aa23d8 ; 0x100aa23d8 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEi
0x100350635: mov edx, 3
0x10035063a: mov rdi, rax
0x10035063d: lea rsi, [rip + 0x8316c2] ; 0x100b81d06  > 
0x100350644: call 0x100011930 ; 0x100011930
0x100350649: mov esi, 4
0x10035064e: mov rdi, rax
0x100350651: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x100350656: mov qword ptr [rbp - 0x220], rbx
0x10035065d: mov qword ptr [rbp - 0xd0], r15
0x100350664: lea rdi, [rbp - 0x218]
0x10035066b: call 0x1007a58d0 ; 0x1007a58d0
0x100350670: lea rdi, [rbp - 0x220]
0x100350677: mov rsi, qword ptr [rbp - 0x238]
0x10035067e: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100350683: lea rdi, [rbp - 0xd0]
0x10035068a: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10035068f: mov r9, qword ptr [rbp - 0x228]
0x100350696: mov rsi, qword ptr [rbp - 0x250]
0x10035069d: nop dword ptr [rax]
0x1003506a0: lea rdi, [r9 + rsi + 0x21dda]
0x1003506a8: add rsi, r9
0x1003506ab: movzx eax, byte ptr [r14]
0x1003506af: lea rsi, [rax + rsi + 0x21dda]
0x1003506b7: mov qword ptr [rbp - 0x220], r9
0x1003506be: lea rdx, [rbp - 0x220]
0x1003506c5: call 0x1003529c0 ; 0x1003529c0
0x1003506ca: cmp byte ptr [r14], 0
0x1003506ce: je 0x100350b43
0x1003506d4: mov rax, qword ptr [rbp - 0x240]
0x1003506db: mov r8d, dword ptr [rax]
0x1003506de: mov r9, qword ptr [rbp - 0x228]
0x1003506e5: mov r15, qword ptr [rbp - 0x258]
0x1003506ec: vxorps xmm1, xmm1, xmm1
0x1003506f0: mov edi, dword ptr [rbp - 0x290]
0x1003506f6: mov eax, dword ptr [rbp - 0x2a0]
0x1003506fc: inc edi
0x1003506fe: add eax, 3
0x100350701: cmp eax, r8d
0x100350704: jb 0x100350360
0x10035070a: mov rcx, qword ptr [rbp - 0x280]
0x100350711: inc rcx
0x100350714: cmp rcx, qword ptr [rbp - 0x278]
0x10035071b: jb 0x10035032a
0x100350721: mov byte ptr [r9 + 0x455de0], 0
0x100350729: cmp dword ptr [r9 + 0x35dd0], 0
0x100350731: mov r14, qword ptr [rbp - 0x230]
0x100350738: je 0x100350aed
0x10035073e: xor r12d, r12d
0x100350741: vmovq xmm0, r9
0x100350746: vpshufd xmm0, xmm0, 0x44
0x10035074b: vpaddq xmm0, xmm0, xmmword ptr [rip + 0x76c78d] ; 0x100abcee0
0x100350753: vmovdqa xmmword ptr [rbp - 0x2a0], xmm0
0x10035075b: mov dword ptr [rbp - 0x250], 0
0x100350765: mov r12d, r12d
0x100350768: mov r13, r12
0x10035076b: shl r13, 4
0x10035076f: vmovss xmm0, dword ptr [r9 + r13 + 0x21dd0]
0x100350779: vdivss xmm1, xmm0, dword ptr [rbp - 0x2b0]
0x100350781: vmulss xmm1, xmm1, dword ptr [rip + 0x76c717] ; 0x100abcea0
0x100350789: vcvttss2si rax, xmm1
0x10035078e: vmovaps xmm1, xmmword ptr [r9 + r13 + 0x11dd0]
0x100350798: vsubps xmm2, xmm1, xmm1
0x10035079c: vmulps xmm2, xmm2, xmm2
0x1003507a0: vmovshdup xmm3, xmm2
0x1003507a4: vaddss xmm3, xmm2, xmm3
0x1003507a8: vpermilpd xmm2, xmm2, 1
0x1003507ae: vaddss xmm2, xmm2, xmm3
0x1003507b2: vsqrtss xmm2, xmm2, xmm2
0x1003507b6: vpermilps xmm1, xmm1, 0xe7
0x1003507bc: vaddss xmm1, xmm1, xmm1
0x1003507c0: vmovss xmm3, dword ptr [rip + 0x757014] ; 0x100aa77dc
0x1003507c8: vmaxss xmm1, xmm3, xmm1
0x1003507cc: vsubss xmm1, xmm2, xmm1
0x1003507d0: vmovss xmm2, dword ptr [rip + 0x7548e8] ; 0x100aa50c0
0x1003507d8: vmaxss xmm1, xmm2, xmm1
0x1003507dc: vsqrtss xmm1, xmm1, xmm1
0x1003507e0: vdivss xmm1, xmm2, xmm1
0x1003507e4: vmulss xmm0, xmm0, xmm1
0x1003507e8: vmulss xmm0, xmm0, dword ptr [r9 + 0x35dd4]
0x1003507f1: vmulss xmm0, xmm0, dword ptr [rip + 0x95f92b] ; 0x100cb0124
0x1003507f9: vaddss xmm0, xmm0, xmm2
0x1003507fd: vcvttss2si r14, xmm0
0x100350802: cmp r14d, eax
0x100350805: jbe 0x10035080f
0x100350807: mov byte ptr [r9 + 0x455de0], 1
0x10035080f: cmp r14d, eax
0x100350812: cmova r14d, eax
0x100350816: mov word ptr [r9 + r13 + 0x21dd8], r14w
0x10035081f: call 0x1007c6c20 ; 0x1007c6c20
0x100350824: movzx esi, r14w
0x100350828: lea rcx, [rip + 0x1cf8321] ; 0x102048b50
0x10035082f: mov rdx, qword ptr [rcx]
0x100350832: mov ecx, 1
0x100350837: mov rdi, rax
0x10035083a: call 0x100795530 ; 0x100795530
0x10035083f: mov r15, rax
0x100350842: mov qword ptr [rbp - 0x290], r12
0x100350849: mov rax, qword ptr [rbp - 0x228]
0x100350850: mov qword ptr [rbp - 0x270], r13
0x100350857: lea r13, [rax + r13 + 0x21dd8]
0x10035085f: movzx r12d, word ptr [r13]
0x100350864: call 0x1007c6c20 ; 0x1007c6c20
0x100350869: shl r12, 3
0x10035086d: lea rcx, [rip + 0x1cf82dc] ; 0x102048b50
0x100350874: mov rdx, qword ptr [rcx]
0x100350877: mov ecx, 8
0x10035087c: mov rdi, rax
0x10035087f: mov rsi, r12
0x100350882: call 0x100795530 ; 0x100795530
0x100350887: mov r12, rax
0x10035088a: mov rdi, qword ptr [rbp - 0x228]
0x100350891: mov rax, qword ptr [rbp - 0x270]
0x100350898: lea rdx, [rdi + rax + 0x21dd0]
0x1003508a0: lea rcx, [rdi + rax + 0x11dd0]
0x1003508a8: movzx r9d, word ptr [r13]
0x1003508ad: test r9d, r9d
0x1003508b0: mov r14, qword ptr [rbp - 0x230]
0x1003508b7: je 0x1003509fb
0x1003508bd: cmp r9d, 7
0x1003508c1: ja 0x1003508ca
0x1003508c3: xor esi, esi
0x1003508c5: jmp 0x1003509ce ; 0x1003509ce
0x1003508ca: mov r8d, r9d
0x1003508cd: and r8d, 7
0x1003508d1: mov eax, r9d
0x1003508d4: and eax, 7
0x1003508d7: mov rsi, r9
0x1003508da: sub rsi, rax
0x1003508dd: vmovd xmm0, dword ptr [rbp - 0x250]
0x1003508e5: vpshufd xmm0, xmm0, 0x44
0x1003508ea: mov rbx, r12
0x1003508ed: add rbx, 0x30
0x1003508f1: mov eax, 1
0x1003508f6: vmovq xmm1, rax
0x1003508fb: vpslldq xmm1, xmm1, 8
0x100350900: mov rax, rsi
0x100350903: vmovdqa xmm6, xmmword ptr [rip + 0x76c5b5] ; 0x100abcec0
0x10035090b: vmovdqa xmm8, xmm6
0x10035090f: vmovdqa xmm7, xmmword ptr [rip + 0x768a99] ; 0x100ab93b0
0x100350917: vmovdqa xmm9, xmm7
0x10035091b: vmovdqa xmm6, xmmword ptr [rip + 0x76c5ad] ; 0x100abced0
0x100350923: vmovdqa xmm10, xmm6
0x100350927: vmovdqa xmm7, xmmword ptr [rbp - 0x2a0]
0x10035092f: vmovdqa xmm6, xmmword ptr [rip + 0x762409] ; 0x100ab2d40
0x100350937: nop word ptr [rax + rax]
0x100350940: vpaddq xmm2, xmm0, xmm1
0x100350944: vpaddd xmm3, xmm0, xmm1
0x100350948: vpshufd xmm3, xmm3, 0xe8
0x10035094d: vpmovzxdq xmm3, xmm3
0x100350952: vpaddd xmm4, xmm2, xmm8
0x100350957: vpshufd xmm4, xmm4, 0xe8
0x10035095c: vpmovzxdq xmm4, xmm4
0x100350961: vpaddd xmm5, xmm2, xmm9
0x100350966: vpshufd xmm5, xmm5, 0xe8
0x10035096b: vpmovzxdq xmm5, xmm5
0x100350970: vpaddd xmm2, xmm2, xmm10
0x100350975: vpshufd xmm2, xmm2, 0xe8
0x10035097a: vpmovzxdq xmm2, xmm2
0x10035097f: vpsllq xmm3, xmm3, 5
0x100350984: vpaddq xmm3, xmm7, xmm3
0x100350988: vpsllq xmm4, xmm4, 5
0x10035098d: vpaddq xmm4, xmm7, xmm4
0x100350991: vpsllq xmm5, xmm5, 5
0x100350996: vpaddq xmm5, xmm7, xmm5
0x10035099a: vpsllq xmm2, xmm2, 5
0x10035099f: vpaddq xmm2, xmm7, xmm2
0x1003509a3: vmovdqu xmmword ptr [rbx - 0x30], xmm3
0x1003509a8: vmovdqu xmmword ptr [rbx - 0x20], xmm4
0x1003509ad: vmovdqu xmmword ptr [rbx - 0x10], xmm5
0x1003509b2: vmovdqu xmmword ptr [rbx], xmm2
0x1003509b6: vpaddq xmm1, xmm1, xmm6
0x1003509ba: add rbx, 0x40
0x1003509be: add rax, -8
0x1003509c2: jne 0x100350940
0x1003509c8: test r8w, r8w
0x1003509cc: je 0x1003509fb
0x1003509ce: mov eax, dword ptr [rbp - 0x250]
0x1003509d4: nop word ptr cs:[rax + rax]
0x1003509e0: lea ebx, [rax + rsi]
0x1003509e3: shl rbx, 5
0x1003509e7: lea rbx, [rdi + rbx + 0x35dd8]
0x1003509ef: mov qword ptr [r12 + rsi*8], rbx
0x1003509f3: inc rsi
0x1003509f6: cmp rsi, r9
0x1003509f9: jb 0x1003509e0
0x1003509fb: mov rax, qword ptr [rbp - 0x290]
0x100350a02: mov esi, eax
0x100350a04: shl esi, 0xc
0x100350a07: mov dword ptr [rsp + 8], esi
0x100350a0b: mov dword ptr [rsp], r9d
0x100350a0f: mov dword ptr [rsp + 0x10], 0
0x100350a17: mov rsi, qword ptr [rbp - 0x2e8]
0x100350a1e: mov r8, r12
0x100350a21: mov rbx, rdi
0x100350a24: mov r9, r15
0x100350a27: call 0x100350c40 ; 0x100350c40
0x100350a2c: mov rax, qword ptr [rbp - 0x270]
0x100350a33: mov word ptr [rbx + rax + 0x21dd6], 0
0x100350a3d: movzx esi, word ptr [r13]
0x100350a42: test si, si
0x100350a45: je 0x100350a96
0x100350a47: lea rax, [rbx + rax + 0x21dd6]
0x100350a4f: xor edx, edx
0x100350a51: xor ecx, ecx
0x100350a53: mov ebx, dword ptr [rbp - 0x250]
0x100350a59: nop dword ptr [rax]
0x100350a60: mov ecx, ecx
0x100350a62: cmp byte ptr [r15 + rcx], 0
0x100350a67: je 0x100350a8b
0x100350a69: movzx edx, dx
0x100350a6c: mov rdx, qword ptr [r12 + rdx*8]
0x100350a70: mov rsi, qword ptr [r12 + rcx*8]
0x100350a74: vmovups ymm0, ymmword ptr [rsi]
0x100350a78: vmovups ymmword ptr [rdx], ymm0
0x100350a7c: movzx edx, word ptr [rax]
0x100350a7f: inc edx
0x100350a81: mov word ptr [rax], dx
0x100350a84: inc ebx
0x100350a86: movzx esi, word ptr [r13]
0x100350a8b: inc ecx
0x100350a8d: movzx edi, si
0x100350a90: cmp ecx, edi
0x100350a92: jb 0x100350a60
0x100350a94: jmp 0x100350a9c ; 0x100350a9c
0x100350a96: mov ebx, dword ptr [rbp - 0x250]
0x100350a9c: vzeroupper 
0x100350a9f: call 0x1007c6c20 ; 0x1007c6c20
0x100350aa4: mov rdi, rax
0x100350aa7: mov rsi, r12
0x100350aaa: call 0x100795a70 ; 0x100795a70
0x100350aaf: call 0x1007c6c20 ; 0x1007c6c20
0x100350ab4: mov rdi, rax
0x100350ab7: mov rsi, r15
0x100350aba: call 0x100795a70 ; 0x100795a70
0x100350abf: mov dword ptr [rbp - 0x250], ebx
0x100350ac5: mov r12, qword ptr [rbp - 0x290]
0x100350acc: inc r12d
0x100350acf: mov r9, qword ptr [rbp - 0x228]
0x100350ad6: cmp r12d, dword ptr [r9 + 0x35dd0]
0x100350add: jb 0x100350765
0x100350ae3: jmp 0x100350aed ; 0x100350aed
0x100350ae5: mov byte ptr [r9 + 0x455de0], 0
0x100350aed: call 0x1007c6c20 ; 0x1007c6c20
0x100350af2: mov rdi, rax
0x100350af5: mov rsi, r14
0x100350af8: call 0x100795a70 ; 0x100795a70
0x100350afd: mov rax, qword ptr [rip + 0x8bcdd4] ; 0x100c0d8d8
0x100350b04: mov rax, qword ptr [rax]
0x100350b07: cmp rax, qword ptr [rbp - 0x30]
0x100350b0b: jne 0x100350b1f
0x100350b0d: add rsp, 0x328
0x100350b14: pop rbx
0x100350b15: pop r12
0x100350b17: pop r13
0x100350b19: pop r14
0x100350b1b: pop r15
0x100350b1d: pop rbp
0x100350b1e: ret 
0x100350b1f: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100350b24: lea rdi, [rip + 0x8311a7] ; 0x100b81cd2 m_seedCount < kMaxSeeds
0x100350b2b: lea rsi, [rip + 0x831108] ; 0x100b81c3a FlowerBarn.cpp
0x100350b32: mov edx, 0x13c
0x100350b37: mov ecx, 3
0x100350b3c: call 0x1007e5f70 ; 0x1007e5f70
0x100350b41: jmp 0x100350b60 ; 0x100350b60
0x100350b43: lea rdi, [rip + 0x8311c0] ; 0x100b81d0a seed.flowerPatchCount > 0
0x100350b4a: lea rsi, [rip + 0x8310e9] ; 0x100b81c3a FlowerBarn.cpp
0x100350b51: mov edx, 0x15b
0x100350b56: mov ecx, 3
0x100350b5b: call 0x1007e5f70 ; 0x1007e5f70
0x100350b60: ud2 
0x100350b62: jmp 0x100350c0a ; 0x100350c0a
0x100350b67: jmp 0x100350c0a ; 0x100350c0a
0x100350b6c: mov rdi, rax
0x100350b6f: call 0x100011bf0 ; 0x100011bf0
0x100350b74: mov r14, rax
0x100350b77: call 0x1007c6c20 ; 0x1007c6c20
0x100350b7c: mov rdi, rax
0x100350b7f: mov rsi, r12
0x100350b82: call 0x100795a70 ; 0x100795a70
0x100350b87: jmp 0x100350ba4 ; 0x100350ba4
0x100350b89: mov rdi, rax
0x100350b8c: call 0x100011bf0 ; 0x100011bf0
0x100350b91: mov rdi, rax
0x100350b94: call 0x100011bf0 ; 0x100011bf0
0x100350b99: mov rdi, rax
0x100350b9c: call 0x100011bf0 ; 0x100011bf0
0x100350ba1: mov r14, rax
0x100350ba4: call 0x1007c6c20 ; 0x1007c6c20
0x100350ba9: mov rdi, rax
0x100350bac: mov rsi, r15
0x100350baf: call 0x100795a70 ; 0x100795a70
0x100350bb4: jmp 0x100350c0d ; 0x100350c0d
0x100350bb6: mov rdi, rax
0x100350bb9: call 0x100011bf0 ; 0x100011bf0
0x100350bbe: jmp 0x100350c0a ; 0x100350c0a
0x100350bc0: mov r14, rax
0x100350bc3: jmp 0x100350be7 ; 0x100350be7
0x100350bc5: mov r14, rax
0x100350bc8: jmp 0x100350bfa ; 0x100350bfa
0x100350bca: mov r14, rax
0x100350bcd: mov qword ptr [rbp - 0x220], rbx
0x100350bd4: mov qword ptr [rbp - 0xd0], r15
0x100350bdb: lea rdi, [rbp - 0x218]
0x100350be2: call 0x1007a58d0 ; 0x1007a58d0
0x100350be7: lea rdi, [rbp - 0x220]
0x100350bee: mov rsi, qword ptr [rbp - 0x238]
0x100350bf5: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100350bfa: lea rdi, [rbp - 0xd0]
0x100350c01: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100350c06: jmp 0x100350c0d ; 0x100350c0d
0x100350c08: jmp 0x100350c0a ; 0x100350c0a
0x100350c0a: mov r14, rax
0x100350c0d: call 0x1007c6c20 ; 0x1007c6c20
0x100350c12: mov rdi, rax
0x100350c15: mov rsi, qword ptr [rbp - 0x230]
0x100350c1c: call 0x100795a70 ; 0x100795a70
0x100350c21: mov rdi, r14
0x100350c24: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100350c29: mov rdi, rax
0x100350c2c: call 0x100011bf0 ; 0x100011bf0
0x100350c31: nop word ptr cs:[rax + rax]
