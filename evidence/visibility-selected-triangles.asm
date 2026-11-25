0x10071f790: push rbp
0x10071f791: mov rbp, rsp
0x10071f794: push r15
0x10071f796: push r14
0x10071f798: push r13
0x10071f79a: push r12
0x10071f79c: push rbx
0x10071f79d: sub rsp, 0x318
0x10071f7a4: mov r14, rdi
0x10071f7a7: mov rdi, qword ptr [rbp + 0x20]
0x10071f7ab: mov r11, qword ptr [rbp + 0x10]
0x10071f7af: mov rax, qword ptr [rip + 0x4ee122] ; 0x100c0d8d8
0x10071f7b6: mov rax, qword ptr [rax]
0x10071f7b9: mov qword ptr [rbp - 0x30], rax
0x10071f7bd: mov dword ptr [r11], 0
0x10071f7c4: mov dword ptr [rdi], 0
0x10071f7ca: test ecx, ecx
0x10071f7cc: je 0x1007201b8
0x10071f7d2: mov qword ptr [rbp - 0x2f0], r9
0x10071f7d9: vmovaps xmm4, xmmword ptr [r8]
0x10071f7de: vmovaps xmm3, xmmword ptr [r8 + 0x10]
0x10071f7e4: vmovaps xmm10, xmmword ptr [r8 + 0x20]
0x10071f7ea: mov qword ptr [rbp - 0x328], r8
0x10071f7f1: vmovaps xmm8, xmmword ptr [r8 + 0x30]
0x10071f7f7: vinsertps xmm0, xmm3, xmm4, 0x4c
0x10071f7fd: vinsertps xmm0, xmm0, xmm10, 0x68
0x10071f803: vinsertps xmm0, xmm0, xmm8, 0x70
0x10071f809: vmulps xmm0, xmm0, xmm0
0x10071f80d: vmovshdup xmm5, xmm0
0x10071f811: vaddss xmm5, xmm0, xmm5
0x10071f815: vpermilpd xmm0, xmm0, 1
0x10071f81b: vaddss xmm0, xmm0, xmm5
0x10071f81f: vsqrtss xmm0, xmm0, xmm0
0x10071f823: vmovss xmm5, dword ptr [rip + 0x39d4b5] ; 0x100abcce0
0x10071f82b: vdivss xmm11, xmm5, xmm0
0x10071f82f: lea r8, [rbp - 0x2d0]
0x10071f836: mov r9d, ecx
0x10071f839: xor ebx, ebx
0x10071f83b: vmovss xmm12, dword ptr [rip + 0x38587d] ; 0x100aa50c0
0x10071f843: vxorps xmm13, xmm13, xmm13
0x10071f848: vmovaps xmm14, xmmword ptr [rip + 0x3880c0] ; 0x100aa7910
0x10071f850: vmovss xmm15, dword ptr [rip + 0x38f1a8] ; 0x100aaea00
0x10071f858: mov rax, qword ptr [rip + 0x4ead21] ; 0x100c0a580
0x10071f85f: add rax, 8
0x10071f863: mov qword ptr [rbp - 0x2e8], rax
0x10071f86a: mov qword ptr [rbp - 0x320], rdx
0x10071f871: mov qword ptr [rbp - 0x318], rsi
0x10071f878: mov qword ptr [rbp - 0x310], r9
0x10071f87f: vmovss dword ptr [rbp - 0x2f4], xmm11
0x10071f887: jmp 0x10071f8aa ; 0x10071f8aa
0x10071f889: nop dword ptr [rax]
0x10071f890: mov rax, qword ptr [rbp - 0x328]
0x10071f897: vmovaps xmm4, xmmword ptr [rax]
0x10071f89b: vmovaps xmm3, xmmword ptr [rax + 0x10]
0x10071f8a0: vmovaps xmm10, xmmword ptr [rax + 0x20]
0x10071f8a5: vmovaps xmm8, xmmword ptr [rax + 0x30]
0x10071f8aa: mov eax, dword ptr [rdx + rbx*4]
0x10071f8ad: lea ecx, [rax + rax*2]
0x10071f8b0: lea edi, [rax + rax*2 + 1]
0x10071f8b4: lea eax, [rax + rax*2 + 2]
0x10071f8b8: movzx r15d, word ptr [rsi + rax*2]
0x10071f8bd: movzx r13d, word ptr [rsi + rdi*2]
0x10071f8c2: movzx r12d, word ptr [rsi + rcx*2]
0x10071f8c7: mov qword ptr [rbp - 0x340], r12
0x10071f8ce: shl r12, 4
0x10071f8d2: movsx eax, byte ptr [r14 + r12 + 0xc]
0x10071f8d8: vxorps xmm9, xmm9, xmm9
0x10071f8dd: vcvtsi2ss xmm0, xmm9, eax
0x10071f8e1: movsx eax, byte ptr [r14 + r12 + 0xd]
0x10071f8e7: vxorps xmm9, xmm9, xmm9
0x10071f8ec: vcvtsi2ss xmm5, xmm9, eax
0x10071f8f0: movsx eax, byte ptr [r14 + r12 + 0xe]
0x10071f8f6: vxorps xmm9, xmm9, xmm9
0x10071f8fb: vcvtsi2ss xmm6, xmm9, eax
0x10071f8ff: vinsertps xmm0, xmm0, xmm5, 0x10
0x10071f905: vinsertps xmm0, xmm0, xmm6, 0x20
0x10071f90b: vshufps xmm5, xmm3, xmm4, 0x33
0x10071f910: vshufps xmm5, xmm5, xmm4, 0xe2
0x10071f915: vinsertps xmm5, xmm5, xmm10, 0xe8
0x10071f91b: vblendps xmm7, xmm5, xmm8, 8
0x10071f921: vmovaps xmm5, xmmword ptr [r14 + r12]
0x10071f927: vinsertps xmm6, xmm5, xmm12, 0x30
0x10071f92d: vmulps xmm6, xmm7, xmm6
0x10071f931: vpermilpd xmm1, xmm6, 1
0x10071f937: vaddps xmm1, xmm6, xmm1
0x10071f93b: vmovshdup xmm6, xmm1
0x10071f93f: vaddss xmm1, xmm1, xmm6
0x10071f943: vmulss xmm1, xmm11, xmm1
0x10071f947: vpermilps xmm1, xmm1, 0xc0
0x10071f94d: vmulps xmm0, xmm0, xmm1
0x10071f951: vsubps xmm0, xmm5, xmm0
0x10071f955: vpermilps xmm1, xmm0, 0
0x10071f95b: vmulps xmm1, xmm4, xmm1
0x10071f95f: vpermilps xmm5, xmm0, 0x55
0x10071f965: vmulps xmm5, xmm3, xmm5
0x10071f969: vaddps xmm1, xmm1, xmm5
0x10071f96d: vpermilps xmm0, xmm0, 0xaa
0x10071f973: vmulps xmm0, xmm10, xmm0
0x10071f977: vaddps xmm0, xmm0, xmm1
0x10071f97b: vaddps xmm9, xmm8, xmm0
0x10071f97f: vmovaps xmmword ptr [rbp - 0x70], xmm9
0x10071f984: mov qword ptr [rbp - 0x338], r13
0x10071f98b: shl r13, 4
0x10071f98f: movsx eax, byte ptr [r14 + r13 + 0xc]
0x10071f995: vxorps xmm2, xmm2, xmm2
0x10071f999: vcvtsi2ss xmm1, xmm2, eax
0x10071f99d: movsx eax, byte ptr [r14 + r13 + 0xd]
0x10071f9a3: vxorps xmm2, xmm2, xmm2
0x10071f9a7: vcvtsi2ss xmm5, xmm2, eax
0x10071f9ab: movsx eax, byte ptr [r14 + r13 + 0xe]
0x10071f9b1: vxorps xmm2, xmm2, xmm2
0x10071f9b5: vcvtsi2ss xmm6, xmm2, eax
0x10071f9b9: vinsertps xmm1, xmm1, xmm5, 0x10
0x10071f9bf: vinsertps xmm1, xmm1, xmm6, 0x20
0x10071f9c5: vmovaps xmm5, xmmword ptr [r14 + r13]
0x10071f9cb: vinsertps xmm6, xmm5, xmm12, 0x30
0x10071f9d1: vmulps xmm6, xmm7, xmm6
0x10071f9d5: vpermilpd xmm0, xmm6, 1
0x10071f9db: vaddps xmm0, xmm6, xmm0
0x10071f9df: vmovshdup xmm6, xmm0
0x10071f9e3: vaddss xmm0, xmm0, xmm6
0x10071f9e7: vmulss xmm0, xmm11, xmm0
0x10071f9eb: vpermilps xmm0, xmm0, 0xc0
0x10071f9f1: vmulps xmm0, xmm1, xmm0
0x10071f9f5: vsubps xmm0, xmm5, xmm0
0x10071f9f9: vpermilps xmm1, xmm0, 0
0x10071f9ff: vmulps xmm1, xmm4, xmm1
0x10071fa03: vpermilps xmm5, xmm0, 0x55
0x10071fa09: vmulps xmm5, xmm3, xmm5
0x10071fa0d: vaddps xmm1, xmm1, xmm5
0x10071fa11: vpermilps xmm0, xmm0, 0xaa
0x10071fa17: vmulps xmm0, xmm10, xmm0
0x10071fa1b: vaddps xmm0, xmm0, xmm1
0x10071fa1f: vaddps xmm6, xmm8, xmm0
0x10071fa23: vpermilpd xmm5, xmm6, 1
0x10071fa29: vmovaps xmmword ptr [rbp - 0x60], xmm6
0x10071fa2e: mov qword ptr [rbp - 0x330], r15
0x10071fa35: shl r15, 4
0x10071fa39: movsx eax, byte ptr [r14 + r15 + 0xc]
0x10071fa3f: vxorps xmm2, xmm2, xmm2
0x10071fa43: vcvtsi2ss xmm0, xmm2, eax
0x10071fa47: movsx eax, byte ptr [r14 + r15 + 0xd]
0x10071fa4d: vxorps xmm2, xmm2, xmm2
0x10071fa51: vcvtsi2ss xmm1, xmm2, eax
0x10071fa55: movsx eax, byte ptr [r14 + r15 + 0xe]
0x10071fa5b: vxorps xmm2, xmm2, xmm2
0x10071fa5f: vcvtsi2ss xmm2, xmm2, eax
0x10071fa63: vinsertps xmm0, xmm0, xmm1, 0x10
0x10071fa69: vinsertps xmm0, xmm0, xmm2, 0x20
0x10071fa6f: vmovaps xmm1, xmmword ptr [r14 + r15]
0x10071fa75: vinsertps xmm2, xmm1, xmm12, 0x30
0x10071fa7b: vmulps xmm2, xmm7, xmm2
0x10071fa7f: vpermilpd xmm7, xmm2, 1
0x10071fa85: vaddps xmm2, xmm2, xmm7
0x10071fa89: vmovshdup xmm7, xmm2
0x10071fa8d: vaddss xmm2, xmm2, xmm7
0x10071fa91: vmulss xmm2, xmm11, xmm2
0x10071fa95: vpermilps xmm2, xmm2, 0xc0
0x10071fa9b: vmulps xmm0, xmm0, xmm2
0x10071fa9f: vsubps xmm0, xmm1, xmm0
0x10071faa3: vpermilps xmm1, xmm0, 0
0x10071faa9: vmulps xmm1, xmm4, xmm1
0x10071faad: vpermilps xmm2, xmm0, 0x55
0x10071fab3: vmulps xmm2, xmm3, xmm2
0x10071fab7: vaddps xmm1, xmm1, xmm2
0x10071fabb: vpermilps xmm0, xmm0, 0xaa
0x10071fac1: vmulps xmm0, xmm10, xmm0
0x10071fac5: vaddps xmm0, xmm0, xmm1
0x10071fac9: vaddps xmm1, xmm8, xmm0
0x10071facd: vpermilpd xmm2, xmm1, 1
0x10071fad3: vmovaps xmmword ptr [rbp - 0x50], xmm1
0x10071fad8: vmovaps xmmword ptr [rbp - 0x40], xmm9
0x10071fadd: vmovss xmm3, dword ptr [rbp - 0x68]
0x10071fae2: vucomiss xmm3, xmm13
0x10071fae7: jb 0x10071fb20
0x10071fae9: vucomiss xmm5, xmm13
0x10071faee: setae cl
0x10071faf1: vucomiss xmm3, xmm13
0x10071faf6: setae al
0x10071faf9: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10071fafe: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x10071fb06: mov r10d, 1
0x10071fb0c: cmp al, cl
0x10071fb0e: jne 0x10071fb37
0x10071fb10: jmp 0x10071fb69 ; 0x10071fb69
0x10071fb12: nop word ptr cs:[rax + rax]
0x10071fb20: vucomiss xmm5, xmm13
0x10071fb25: setae cl
0x10071fb28: vucomiss xmm3, xmm13
0x10071fb2d: setae al
0x10071fb30: xor r10d, r10d
0x10071fb33: xor al, cl
0x10071fb35: je 0x10071fb69
0x10071fb37: vsubss xmm0, xmm3, xmm5
0x10071fb3b: vdivss xmm0, xmm3, xmm0
0x10071fb3f: vmovaps xmm4, xmmword ptr [rbp - 0x70]
0x10071fb44: vsubps xmm7, xmm6, xmm4
0x10071fb48: vpermilps xmm0, xmm0, 0
0x10071fb4e: vmulps xmm0, xmm7, xmm0
0x10071fb52: vaddps xmm0, xmm4, xmm0
0x10071fb56: mov rcx, r10
0x10071fb59: shl rcx, 4
0x10071fb5d: vmovaps xmmword ptr [rbp + rcx - 0xb0], xmm0
0x10071fb66: inc r10d
0x10071fb69: vucomiss xmm5, xmm13
0x10071fb6e: jb 0x10071fba0
0x10071fb70: vucomiss xmm2, xmm13
0x10071fb75: setae cl
0x10071fb78: vucomiss xmm5, xmm13
0x10071fb7d: setae al
0x10071fb80: mov edi, r10d
0x10071fb83: shl rdi, 4
0x10071fb87: vmovaps xmmword ptr [rbp + rdi - 0xb0], xmm6
0x10071fb90: inc r10d
0x10071fb93: cmp al, cl
0x10071fb95: jne 0x10071fbb4
0x10071fb97: jmp 0x10071fbe6 ; 0x10071fbe6
0x10071fb99: nop dword ptr [rax]
0x10071fba0: vucomiss xmm2, xmm13
0x10071fba5: setae cl
0x10071fba8: vucomiss xmm5, xmm13
0x10071fbad: setae al
0x10071fbb0: xor al, cl
0x10071fbb2: je 0x10071fbe6
0x10071fbb4: vsubss xmm0, xmm5, xmm2
0x10071fbb8: vdivss xmm0, xmm5, xmm0
0x10071fbbc: vmovaps xmm4, xmmword ptr [rbp - 0x60]
0x10071fbc1: vsubps xmm5, xmm1, xmm4
0x10071fbc5: vpermilps xmm0, xmm0, 0
0x10071fbcb: vmulps xmm0, xmm5, xmm0
0x10071fbcf: vaddps xmm0, xmm4, xmm0
0x10071fbd3: mov ecx, r10d
0x10071fbd6: shl rcx, 4
0x10071fbda: vmovaps xmmword ptr [rbp + rcx - 0xb0], xmm0
0x10071fbe3: inc r10d
0x10071fbe6: vucomiss xmm2, xmm13
0x10071fbeb: jb 0x10071fc20
0x10071fbed: setae cl
0x10071fbf0: vucomiss xmm3, xmm13
0x10071fbf5: setae al
0x10071fbf8: mov edi, r10d
0x10071fbfb: shl rdi, 4
0x10071fbff: vmovaps xmmword ptr [rbp + rdi - 0xb0], xmm1
0x10071fc08: inc r10d
0x10071fc0b: cmp cl, al
0x10071fc0d: jne 0x10071fc2f
0x10071fc0f: jmp 0x10071fc62 ; 0x10071fc62
0x10071fc11: nop word ptr cs:[rax + rax]
0x10071fc20: setae cl
0x10071fc23: vucomiss xmm3, xmm13
0x10071fc28: setae al
0x10071fc2b: xor al, cl
0x10071fc2d: je 0x10071fc62
0x10071fc2f: vpermilpd xmm0, xmm9, 1
0x10071fc35: vsubss xmm0, xmm2, xmm0
0x10071fc39: vdivss xmm0, xmm2, xmm0
0x10071fc3d: vsubps xmm2, xmm9, xmm1
0x10071fc41: vpermilps xmm0, xmm0, 0
0x10071fc47: vmulps xmm0, xmm2, xmm0
0x10071fc4b: vaddps xmm0, xmm1, xmm0
0x10071fc4f: mov ecx, r10d
0x10071fc52: shl rcx, 4
0x10071fc56: vmovaps xmmword ptr [rbp + rcx - 0xb0], xmm0
0x10071fc5f: inc r10d
0x10071fc62: cmp r10d, 3
0x10071fc66: jb 0x10071ff80
0x10071fc6c: mov qword ptr [rbp - 0x2e0], rbx
0x10071fc73: add r12, r14
0x10071fc76: add r13, r14
0x10071fc79: add r15, r14
0x10071fc7c: mov eax, r10d
0x10071fc7f: mov rcx, rax
0x10071fc82: lea rbx, [rbp - 0xb0]
0x10071fc89: lea rdi, [rbp - 0xf0]
0x10071fc90: vdivss xmm0, xmm12, dword ptr [rbx + 0xc]
0x10071fc95: vpermilps xmm0, xmm0, 0xc0
0x10071fc9b: vmulps xmm0, xmm0, xmmword ptr [rbx]
0x10071fc9f: vmovaps xmmword ptr [rdi], xmm0
0x10071fca3: add rdi, 0x10
0x10071fca7: add rbx, 0x10
0x10071fcab: dec rcx
0x10071fcae: jne 0x10071fc90
0x10071fcb0: vmovss xmm0, dword ptr [rbp - 0xf0]
0x10071fcb8: vmovss xmm2, dword ptr [rbp - 0xec]
0x10071fcc0: vmovss xmm1, dword ptr [rbp - 0xe0]
0x10071fcc8: vsubss xmm3, xmm1, xmm0
0x10071fccc: vmovss xmm1, dword ptr [rbp - 0xcc]
0x10071fcd4: vsubss xmm4, xmm1, xmm2
0x10071fcd8: vmulss xmm3, xmm3, xmm4
0x10071fcdc: vandps xmm3, xmm3, xmm14
0x10071fce1: vucomiss xmm3, xmm15
0x10071fce6: jbe 0x10071fda0
0x10071fcec: vsubss xmm3, xmm0, dword ptr [rbp - 0xd0]
0x10071fcf4: vsubss xmm4, xmm2, dword ptr [rbp - 0xdc]
0x10071fcfc: vmulss xmm3, xmm3, xmm4
0x10071fd00: vandps xmm3, xmm3, xmm14
0x10071fd05: vucomiss xmm3, xmm15
0x10071fd0a: seta cl
0x10071fd0d: mov rbx, qword ptr [rbp - 0x2e0]
0x10071fd14: test cl, cl
0x10071fd16: jne 0x10071fdb1
0x10071fd1c: cmp r10d, 4
0x10071fd20: jne 0x10071fdb1
0x10071fd26: vmovss xmm3, dword ptr [rbp - 0xd0]
0x10071fd2e: vmovss xmm4, dword ptr [rbp - 0xc0]
0x10071fd36: vsubss xmm4, xmm4, xmm3
0x10071fd3a: vsubss xmm2, xmm2, xmm1
0x10071fd3e: vmulss xmm2, xmm2, xmm4
0x10071fd42: vandps xmm2, xmm2, xmm14
0x10071fd47: vucomiss xmm2, xmm15
0x10071fd4c: jbe 0x10071fd70
0x10071fd4e: vsubss xmm0, xmm3, xmm0
0x10071fd52: vsubss xmm1, xmm1, dword ptr [rbp - 0xbc]
0x10071fd5a: vmulss xmm0, xmm0, xmm1
0x10071fd5e: vandps xmm0, xmm0, xmm14
0x10071fd63: vucomiss xmm0, xmm15
0x10071fd68: ja 0x10071fdb5
0x10071fd6a: nop word ptr [rax + rax]
0x10071fd70: mov r8d, eax
0x10071fd73: and r8d, 1
0x10071fd77: cmp r10d, 1
0x10071fd7b: jne 0x10071ff91
0x10071fd81: xor esi, esi
0x10071fd83: mov r15, qword ptr [rbp + 0x18]
0x10071fd87: mov rdx, qword ptr [rbp - 0x2f0]
0x10071fd8e: mov r13, qword ptr [rbp + 0x20]
0x10071fd92: test r8, r8
0x10071fd95: jne 0x10071ffe9
0x10071fd9b: jmp 0x100720005 ; 0x100720005
0x10071fda0: xor ecx, ecx
0x10071fda2: mov rbx, qword ptr [rbp - 0x2e0]
0x10071fda9: test cl, cl
0x10071fdab: je 0x10071fd1c
0x10071fdb1: test cl, cl
0x10071fdb3: je 0x10071fd70
0x10071fdb5: cmp byte ptr [rip + 0x191c53c], 0 ; 0x10203c2f8
0x10071fdbc: je 0x10071ff80
0x10071fdc2: mov rax, qword ptr [rip + 0x4ea757] ; 0x100c0a520
0x10071fdc9: mov rcx, rax
0x10071fdcc: lea rax, [rcx + 0x18]
0x10071fdd0: mov qword ptr [rbp - 0x2d8], rax
0x10071fdd7: lea rax, [rcx + 0x40]
0x10071fddb: mov qword ptr [rbp - 0x188], rax
0x10071fde2: lea rdi, [rbp - 0x188]
0x10071fde9: mov rsi, r8
0x10071fdec: mov rbx, r8
0x10071fdef: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x10071fdf4: mov qword ptr [rbp - 0x100], 0
0x10071fdff: mov dword ptr [rbp - 0xf8], 0xffffffff
0x10071fe09: mov rax, qword ptr [rip + 0x4ed7b8] ; 0x100c0d5c8
0x10071fe10: lea rcx, [rax + 0x18]
0x10071fe14: mov qword ptr [rbp - 0x308], rcx
0x10071fe1b: mov qword ptr [rbp - 0x2d8], rcx
0x10071fe22: lea rax, [rax + 0x40]
0x10071fe26: mov qword ptr [rbp - 0x300], rax
0x10071fe2d: mov qword ptr [rbp - 0x188], rax
0x10071fe34: mov edx, 1
0x10071fe39: mov rdi, rbx
0x10071fe3c: lea rsi, [rip + 0x47cd19] ; 0x100b9cb5c Vis
0x10071fe43: call 0x1007a56a0 ; 0x1007a56a0
0x10071fe48: mov edx, 0x3e
0x10071fe4d: lea rdi, [rbp - 0x2d8]
0x10071fe54: lea rsi, [rip + 0x47cd05] ; 0x100b9cb60 Discarded large occlusion triangle during clipping, indexes ( 
0x10071fe5b: call 0x100011930 ; 0x100011930
0x10071fe60: lea rbx, [rip + 0x440a43] ; 0x100b608aa , 
0x10071fe67: mov rdi, rax
0x10071fe6a: mov rsi, qword ptr [rbp - 0x340]
0x10071fe71: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x10071fe76: mov edx, 2
0x10071fe7b: mov rdi, rax
0x10071fe7e: mov rsi, rbx
0x10071fe81: call 0x100011930 ; 0x100011930
0x10071fe86: mov rdi, rax
0x10071fe89: mov rsi, qword ptr [rbp - 0x338]
0x10071fe90: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x10071fe95: mov edx, 2
0x10071fe9a: mov rdi, rax
0x10071fe9d: mov rsi, rbx
0x10071fea0: call 0x100011930 ; 0x100011930
0x10071fea5: mov rdi, rax
0x10071fea8: mov rsi, qword ptr [rbp - 0x330]
0x10071feaf: call 0x100aa23de ; 0x100aa23de __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEj
0x10071feb4: mov edx, 2
0x10071feb9: mov rdi, rax
0x10071febc: lea rsi, [rip + 0x465390] ; 0x100b85253  )
0x10071fec3: call 0x100011930 ; 0x100011930
0x10071fec8: mov rax, qword ptr [rbp - 0x308]
0x10071fecf: mov qword ptr [rbp - 0x2d8], rax
0x10071fed6: mov rax, qword ptr [rbp - 0x300]
0x10071fedd: mov qword ptr [rbp - 0x188], rax
0x10071fee4: lea rbx, [rbp - 0x2d0]
0x10071feeb: mov rdi, rbx
0x10071feee: call 0x1007a58d0 ; 0x1007a58d0
0x10071fef3: lea rdi, [rbp - 0x2d8]
0x10071fefa: mov rsi, qword ptr [rbp - 0x2e8]
0x10071ff01: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10071ff06: lea rdi, [rbp - 0x188]
0x10071ff0d: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10071ff12: call 0x1002b9810 ; 0x1002b9810
0x10071ff17: mov r9d, 1
0x10071ff1d: mov rdi, rax
0x10071ff20: mov rsi, r12
0x10071ff23: mov rdx, r13
0x10071ff26: mov rcx, r15
0x10071ff29: lea r8, [rip + 0x191f750] ; 0x10203f680
0x10071ff30: call 0x1002bd1b0 ; 0x1002bd1b0
0x10071ff35: mov r8, rbx
0x10071ff38: mov r11, qword ptr [rbp + 0x10]
0x10071ff3c: mov rdx, qword ptr [rbp - 0x320]
0x10071ff43: mov rsi, qword ptr [rbp - 0x318]
0x10071ff4a: vmovss xmm11, dword ptr [rbp - 0x2f4]
0x10071ff52: mov r9, qword ptr [rbp - 0x310]
0x10071ff59: mov rbx, qword ptr [rbp - 0x2e0]
0x10071ff60: vmovss xmm12, dword ptr [rip + 0x385158] ; 0x100aa50c0
0x10071ff68: vxorps xmm13, xmm13, xmm13
0x10071ff6d: vmovaps xmm14, xmmword ptr [rip + 0x38799b] ; 0x100aa7910
0x10071ff75: vmovss xmm15, dword ptr [rip + 0x38ea83] ; 0x100aaea00
0x10071ff7d: nop dword ptr [rax]
0x10071ff80: inc rbx
0x10071ff83: cmp rbx, r9
0x10071ff86: jb 0x10071f890
0x10071ff8c: jmp 0x10072008f ; 0x10072008f
0x10071ff91: sub rax, r8
0x10071ff94: lea rdi, [rbp - 0xe0]
0x10071ff9b: xor esi, esi
0x10071ff9d: mov r15, qword ptr [rbp + 0x18]
0x10071ffa1: mov rdx, qword ptr [rbp - 0x2f0]
0x10071ffa8: mov r13, qword ptr [rbp + 0x20]
0x10071ffac: nop dword ptr [rax]
0x10071ffb0: mov ebx, dword ptr [r11]
0x10071ffb3: add ebx, esi
0x10071ffb5: shl rbx, 4
0x10071ffb9: vmovaps xmm0, xmmword ptr [rdi - 0x10]
0x10071ffbe: vmovaps xmmword ptr [rdx + rbx], xmm0
0x10071ffc3: mov ebx, dword ptr [r11]
0x10071ffc6: lea ebx, [rsi + rbx + 1]
0x10071ffca: shl rbx, 4
0x10071ffce: vmovaps xmm0, xmmword ptr [rdi]
0x10071ffd2: vmovaps xmmword ptr [rdx + rbx], xmm0
0x10071ffd7: add rsi, 2
0x10071ffdb: add rdi, 0x20
0x10071ffdf: cmp rax, rsi
0x10071ffe2: jne 0x10071ffb0
0x10071ffe4: test r8, r8
0x10071ffe7: je 0x100720005
0x10071ffe9: mov rcx, rsi
0x10071ffec: shl rcx, 4
0x10071fff0: add esi, dword ptr [r11]
0x10071fff3: shl rsi, 4
0x10071fff7: vmovaps xmm0, xmmword ptr [rbp + rcx - 0xf0]
0x100720000: vmovaps xmmword ptr [rdx + rsi], xmm0
0x100720005: mov esi, dword ptr [r11]
0x100720008: mov ecx, dword ptr [r13]
0x10072000c: lea r8d, [rsi + 1]
0x100720010: lea ebx, [rcx + 1]
0x100720013: lea r9d, [rsi + 2]
0x100720017: lea edi, [rcx + 2]
0x10072001a: lea edx, [rcx + 3]
0x10072001d: mov word ptr [r15 + rcx*2], si
0x100720022: mov word ptr [r15 + rbx*2], r8w
0x100720027: mov word ptr [r15 + rdi*2], r9w
0x10072002c: mov dword ptr [r13], edx
0x100720030: cmp r10d, 4
0x100720034: jne 0x10072005d
0x100720036: mov esi, dword ptr [r11]
0x100720039: lea edi, [rsi + 2]
0x10072003c: mov edx, edx
0x10072003e: mov word ptr [r15 + rdx*2], di
0x100720043: lea edx, [rsi + 3]
0x100720046: lea edi, [rcx + 4]
0x100720049: mov word ptr [r15 + rdi*2], dx
0x10072004e: lea edx, [rcx + 5]
0x100720051: mov word ptr [r15 + rdx*2], si
0x100720056: lea ecx, [rcx + 6]
0x100720059: mov dword ptr [r13], ecx
0x10072005d: add dword ptr [r11], r10d
0x100720060: mov rdx, qword ptr [rbp - 0x320]
0x100720067: mov rsi, qword ptr [rbp - 0x318]
0x10072006e: lea r8, [rbp - 0x2d0]
0x100720075: mov r9, qword ptr [rbp - 0x310]
0x10072007c: mov rbx, qword ptr [rbp - 0x2e0]
0x100720083: inc rbx
0x100720086: cmp rbx, r9
0x100720089: jb 0x10071f890
0x10072008f: mov r10, qword ptr [rbp + 0x20]
0x100720093: cmp dword ptr [r10], 0
0x100720097: mov rcx, qword ptr [rbp - 0x2f0]
0x10072009e: je 0x1007201b8
0x1007200a4: mov eax, dword ptr [r11]
0x1007200a7: shl rax, 4
0x1007200ab: vxorps xmm0, xmm0, xmm0
0x1007200af: vmovaps xmmword ptr [rcx + rax], xmm0
0x1007200b4: mov rcx, r11
0x1007200b7: mov r11d, dword ptr [r10]
0x1007200ba: lea esi, [r11 - 1]
0x1007200be: mov eax, 0xaaaaaaab
0x1007200c3: imul rax, rsi
0x1007200c7: shr rax, 0x23
0x1007200cb: shl eax, 2
0x1007200ce: lea eax, [rax + rax*2]
0x1007200d1: sub esi, eax
0x1007200d3: mov r14d, 0xb
0x1007200d9: mov ecx, dword ptr [rcx]
0x1007200db: sub r14d, esi
0x1007200de: mov rax, qword ptr [rbp + 0x18]
0x1007200e2: je 0x1007201ad
0x1007200e8: mov word ptr [rax + r11*2], cx
0x1007200ed: cmp r14d, 1
0x1007200f1: je 0x1007201ad
0x1007200f7: mov esi, r14d
0x1007200fa: lea rdi, [rsi - 1]
0x1007200fe: cmp rdi, 0x3f
0x100720102: ja 0x10072010f
0x100720104: mov r9d, 1
0x10072010a: jmp 0x10072018d ; 0x10072018d
0x10072010f: lea r10, [rsi - 2]
0x100720113: lea r8d, [r11 + 1]
0x100720117: mov r9d, 1
0x10072011d: mov ebx, r10d
0x100720120: add ebx, r8d
0x100720123: jb 0x100720189
0x100720125: shr r10, 0x20
0x100720129: mov r10, qword ptr [rbp + 0x20]
0x10072012d: jne 0x10072018d
0x10072012f: lea r8d, [r14 + 0x3f]
0x100720133: and r8d, 0x3f
0x100720137: sub rdi, r8
0x10072013a: vmovd xmm0, ecx
0x10072013e: vpshuflw xmm0, xmm0, 0
0x100720143: vpshufd xmm0, xmm0, 0x50
0x100720148: vinsertf128 ymm0, ymm0, xmm0, 1
0x10072014e: lea ebx, [r11 + 1]
0x100720152: lea r9, [rdi + 1]
0x100720156: nop word ptr cs:[rax + rax]
0x100720160: mov edx, ebx
0x100720162: vmovups ymmword ptr [rax + rdx*2], ymm0
0x100720167: vmovups ymmword ptr [rax + rdx*2 + 0x20], ymm0
0x10072016d: vmovups ymmword ptr [rax + rdx*2 + 0x40], ymm0
0x100720173: vmovups ymmword ptr [rax + rdx*2 + 0x60], ymm0
0x100720179: add ebx, 0x40
0x10072017c: add rdi, -0x40
0x100720180: jne 0x100720160
0x100720182: test r8d, r8d
0x100720185: jne 0x10072018d
0x100720187: jmp 0x1007201ad ; 0x1007201ad
0x100720189: mov r10, qword ptr [rbp + 0x20]
0x10072018d: lea edx, [r9 + r11]
0x100720191: sub rsi, r9
0x100720194: nop word ptr cs:[rax + rax]
0x1007201a0: mov edi, edx
0x1007201a2: mov word ptr [rax + rdi*2], cx
0x1007201a6: inc edx
0x1007201a8: dec rsi
0x1007201ab: jne 0x1007201a0
0x1007201ad: inc ecx
0x1007201af: mov rdx, qword ptr [rbp + 0x10]
0x1007201b3: mov dword ptr [rdx], ecx
0x1007201b5: add dword ptr [r10], r14d
0x1007201b8: mov rax, qword ptr [rip + 0x4ed719] ; 0x100c0d8d8
0x1007201bf: mov rax, qword ptr [rax]
0x1007201c2: cmp rax, qword ptr [rbp - 0x30]
0x1007201c6: jne 0x1007201dd
0x1007201c8: add rsp, 0x318
0x1007201cf: pop rbx
0x1007201d0: pop r12
0x1007201d2: pop r13
0x1007201d4: pop r14
0x1007201d6: pop r15
0x1007201d8: pop rbp
0x1007201d9: vzeroupper 
0x1007201dc: ret 
0x1007201dd: vzeroupper 
0x1007201e0: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1007201e5: mov rbx, rax
0x1007201e8: jmp 0x10072021a ; 0x10072021a
0x1007201ea: mov rbx, rax
0x1007201ed: jmp 0x10072022d ; 0x10072022d
0x1007201ef: mov rbx, rax
0x1007201f2: mov rax, qword ptr [rbp - 0x308]
0x1007201f9: mov qword ptr [rbp - 0x2d8], rax
0x100720200: mov rax, qword ptr [rbp - 0x300]
0x100720207: mov qword ptr [rbp - 0x188], rax
0x10072020e: lea rdi, [rbp - 0x2d0]
0x100720215: call 0x1007a58d0 ; 0x1007a58d0
0x10072021a: lea rdi, [rbp - 0x2d8]
0x100720221: mov rsi, qword ptr [rbp - 0x2e8]
0x100720228: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10072022d: lea rdi, [rbp - 0x188]
0x100720234: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100720239: mov rdi, rbx
0x10072023c: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100720241: nop word ptr cs:[rax + rax]
