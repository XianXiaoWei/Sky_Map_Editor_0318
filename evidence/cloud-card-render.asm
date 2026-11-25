0x1002206f0: push rbp
0x1002206f1: mov rbp, rsp
0x1002206f4: push r15
0x1002206f6: push r14
0x1002206f8: push r13
0x1002206fa: push r12
0x1002206fc: push rbx
0x1002206fd: sub rsp, 0x148
0x100220704: mov r12, rsi
0x100220707: mov r14, rdi
0x10022070a: mov dword ptr [r14 + 0x209ac], 0
0x100220715: mov ebx, dword ptr [r14 + 0x10010]
0x10022071c: test rbx, rbx
0x10022071f: je 0x1002213bc
0x100220725: mov al, byte ptr [rip + 0xa75a56] ; 0x100c96181
0x10022072b: test al, al
0x10022072d: je 0x1002213bc
0x100220733: vmovaps xmm0, xmmword ptr [r12 + 0x1c0]
0x10022073d: vmovaps xmm6, xmmword ptr [r12 + 0x1d0]
0x100220747: vmovapd xmm1, xmmword ptr [r12 + 0x1e0]
0x100220751: vmovaps xmm2, xmmword ptr [r12 + 0x1f0]
0x10022075b: vinsertps xmm3, xmm0, xmm6, 0x1c
0x100220761: vunpcklpd xmm3, xmm3, xmm1
0x100220765: vinsertps xmm3, xmm3, xmm2, 0x30
0x10022076b: vinsertps xmm4, xmm6, xmm0, 0x4c
0x100220771: vunpckhps xmm5, xmm0, xmm6
0x100220775: vblendpd xmm5, xmm1, xmm5, 1
0x10022077b: vshufps xmm6, xmm6, xmm0, 0x33
0x100220780: vshufps xmm0, xmm6, xmm0, 0xe2
0x100220785: vinsertps xmm0, xmm0, xmm1, 0xe8
0x10022078b: vblendps xmm0, xmm0, xmm2, 8
0x100220791: vaddps xmm8, xmm0, xmm3
0x100220795: vmulps xmm6, xmm8, xmm8
0x10022079a: vmovshdup xmm7, xmm6
0x10022079e: vaddss xmm7, xmm6, xmm7
0x1002207a2: vpermilpd xmm6, xmm6, 1
0x1002207a8: vaddss xmm7, xmm6, xmm7
0x1002207ac: vxorps xmm6, xmm6, xmm6
0x1002207b0: vucomiss xmm7, xmm6
0x1002207b4: jbe 0x1002207c4
0x1002207b6: vsqrtss xmm7, xmm7, xmm7
0x1002207ba: vpermilps xmm7, xmm7, 0
0x1002207c0: vdivps xmm8, xmm8, xmm7
0x1002207c4: vinsertps xmm4, xmm4, xmm1, 0x68
0x1002207ca: vinsertps xmm1, xmm5, xmm2, 0xb0
0x1002207d0: vsubps xmm9, xmm0, xmm3
0x1002207d4: vmulps xmm3, xmm9, xmm9
0x1002207d9: vmovshdup xmm5, xmm3
0x1002207dd: vaddss xmm5, xmm3, xmm5
0x1002207e1: vpermilpd xmm3, xmm3, 1
0x1002207e7: vaddss xmm3, xmm3, xmm5
0x1002207eb: vucomiss xmm3, xmm6
0x1002207ef: jbe 0x1002207ff
0x1002207f1: vsqrtss xmm3, xmm3, xmm3
0x1002207f5: vpermilps xmm3, xmm3, 0
0x1002207fb: vdivps xmm9, xmm9, xmm3
0x1002207ff: vinsertps xmm2, xmm4, xmm2, 0x70
0x100220805: vaddps xmm6, xmm0, xmm1
0x100220809: vmulps xmm3, xmm6, xmm6
0x10022080d: vmovshdup xmm4, xmm3
0x100220811: vaddss xmm4, xmm3, xmm4
0x100220815: vpermilpd xmm3, xmm3, 1
0x10022081b: vaddss xmm4, xmm3, xmm4
0x10022081f: vxorps xmm3, xmm3, xmm3
0x100220823: vucomiss xmm4, xmm3
0x100220827: jbe 0x100220837
0x100220829: vsqrtss xmm4, xmm4, xmm4
0x10022082d: vpermilps xmm4, xmm4, 0
0x100220833: vdivps xmm6, xmm6, xmm4
0x100220837: vaddps xmm7, xmm0, xmm2
0x10022083b: vmulps xmm4, xmm7, xmm7
0x10022083f: vmovshdup xmm5, xmm4
0x100220843: vaddss xmm5, xmm4, xmm5
0x100220847: vpermilpd xmm4, xmm4, 1
0x10022084d: vaddss xmm4, xmm4, xmm5
0x100220851: vucomiss xmm4, xmm3
0x100220855: jbe 0x100220865
0x100220857: vsqrtss xmm3, xmm4, xmm4
0x10022085b: vpermilps xmm3, xmm3, 0
0x100220861: vdivps xmm7, xmm7, xmm3
0x100220865: vsubps xmm4, xmm0, xmm2
0x100220869: vmulps xmm2, xmm4, xmm4
0x10022086d: vmovshdup xmm3, xmm2
0x100220871: vaddss xmm3, xmm2, xmm3
0x100220875: vpermilpd xmm2, xmm2, 1
0x10022087b: vaddss xmm3, xmm2, xmm3
0x10022087f: vxorps xmm2, xmm2, xmm2
0x100220883: vucomiss xmm3, xmm2
0x100220887: jbe 0x100220897
0x100220889: vsqrtss xmm3, xmm3, xmm3
0x10022088d: vpermilps xmm3, xmm3, 0
0x100220893: vdivps xmm4, xmm4, xmm3
0x100220897: vsubps xmm3, xmm0, xmm1
0x10022089b: vmulps xmm0, xmm3, xmm3
0x10022089f: vmovshdup xmm1, xmm0
0x1002208a3: vaddss xmm1, xmm0, xmm1
0x1002208a7: vpermilpd xmm0, xmm0, 1
0x1002208ad: vaddss xmm0, xmm0, xmm1
0x1002208b1: vucomiss xmm0, xmm2
0x1002208b5: mov qword ptr [rbp - 0x30], rdx
0x1002208b9: vmovaps xmmword ptr [rbp - 0x90], xmm8
0x1002208c1: vmovaps xmmword ptr [rbp - 0x80], xmm9
0x1002208c6: vmovaps xmmword ptr [rbp - 0xa0], xmm6
0x1002208ce: vmovaps xmmword ptr [rbp - 0xc0], xmm7
0x1002208d6: vmovaps xmmword ptr [rbp - 0x70], xmm4
0x1002208db: jbe 0x1002208eb
0x1002208dd: vsqrtss xmm0, xmm0, xmm0
0x1002208e1: vpermilps xmm0, xmm0, 0
0x1002208e7: vdivps xmm3, xmm3, xmm0
0x1002208eb: vmovaps xmmword ptr [rbp - 0x50], xmm3
0x1002208f0: call 0x1007c6c20 ; 0x1007c6c20
0x1002208f5: shl rbx, 3
0x1002208f9: lea r13, [rip + 0x1e28250] ; 0x102048b50
0x100220900: mov rdx, qword ptr [r13]
0x100220904: mov ecx, 8
0x100220909: mov rdi, rax
0x10022090c: mov rsi, rbx
0x10022090f: call 0x100795530 ; 0x100795530
0x100220914: mov qword ptr [rbp - 0x38], rax
0x100220918: mov ebx, dword ptr [r14 + 0x10010]
0x10022091f: call 0x1007c6c20 ; 0x1007c6c20
0x100220924: shl rbx, 4
0x100220928: mov rdx, qword ptr [r13]
0x10022092c: mov ecx, 0x10
0x100220931: mov rdi, rax
0x100220934: mov rsi, rbx
0x100220937: call 0x100795530 ; 0x100795530
0x10022093c: mov r15, rax
0x10022093f: mov ebx, dword ptr [r14 + 0x10010]
0x100220946: call 0x1007c6c20 ; 0x1007c6c20
0x10022094b: shl rbx, 2
0x10022094f: mov rdx, qword ptr [r13]
0x100220953: mov ecx, 4
0x100220958: mov rdi, rax
0x10022095b: mov rsi, rbx
0x10022095e: call 0x100795530 ; 0x100795530
0x100220963: mov rbx, rax
0x100220966: mov qword ptr [rbp - 0xa8], r12
0x10022096d: mov ecx, dword ptr [r14 + 0x10010]
0x100220974: xor r13d, r13d
0x100220977: test ecx, ecx
0x100220979: je 0x100220ada
0x10022097f: vmovaps xmm0, xmmword ptr [rip + 0x886f79] ; 0x100aa7900
0x100220987: xor eax, eax
0x100220989: vmovaps xmm5, xmmword ptr [rbp - 0x90]
0x100220991: vmovaps xmm6, xmmword ptr [rbp - 0x80]
0x100220996: vmovaps xmm7, xmmword ptr [rbp - 0xa0]
0x10022099e: vmovaps xmm8, xmmword ptr [rbp - 0xc0]
0x1002209a6: vmovaps xmm9, xmmword ptr [rbp - 0x70]
0x1002209ab: vmovaps xmm10, xmmword ptr [rbp - 0x50]
0x1002209b0: mov rdi, qword ptr [rbp - 0x38]
0x1002209b4: nop word ptr cs:[rax + rax]
0x1002209c0: mov rdx, qword ptr [r14 + 0x10018]
0x1002209c7: mov esi, eax
0x1002209c9: shl rsi, 7
0x1002209cd: vmovaps xmm1, xmmword ptr [rdx + rsi + 0x70]
0x1002209d3: vpermilps xmm3, xmm1, 0xe7
0x1002209d9: vinsertps xmm2, xmm1, dword ptr [rip + 0x8846dd], 0x30 ; 0x100aa50c0
0x1002209e3: vxorps xmm1, xmm3, xmm0
0x1002209e7: vmulps xmm3, xmm2, xmm5
0x1002209eb: vpermilpd xmm4, xmm3, 1
0x1002209f1: vaddps xmm3, xmm3, xmm4
0x1002209f5: vmovshdup xmm4, xmm3
0x1002209f9: vaddss xmm3, xmm3, xmm4
0x1002209fd: vucomiss xmm1, xmm3
0x100220a01: ja 0x100220ad0
0x100220a07: vmulps xmm3, xmm2, xmm6
0x100220a0b: vpermilpd xmm4, xmm3, 1
0x100220a11: vaddps xmm3, xmm3, xmm4
0x100220a15: vmovshdup xmm4, xmm3
0x100220a19: vaddss xmm3, xmm3, xmm4
0x100220a1d: vucomiss xmm1, xmm3
0x100220a21: ja 0x100220ad0
0x100220a27: vmulps xmm3, xmm2, xmm7
0x100220a2b: vpermilpd xmm4, xmm3, 1
0x100220a31: vaddps xmm3, xmm3, xmm4
0x100220a35: vmovshdup xmm4, xmm3
0x100220a39: vaddss xmm3, xmm3, xmm4
0x100220a3d: vucomiss xmm1, xmm3
0x100220a41: ja 0x100220ad0
0x100220a47: vmulps xmm3, xmm2, xmm8
0x100220a4c: vpermilpd xmm4, xmm3, 1
0x100220a52: vaddps xmm3, xmm3, xmm4
0x100220a56: vmovshdup xmm4, xmm3
0x100220a5a: vaddss xmm3, xmm3, xmm4
0x100220a5e: vucomiss xmm1, xmm3
0x100220a62: ja 0x100220ad0
0x100220a64: vmulps xmm3, xmm2, xmm9
0x100220a69: vpermilpd xmm4, xmm3, 1
0x100220a6f: vaddps xmm3, xmm3, xmm4
0x100220a73: vmovshdup xmm4, xmm3
0x100220a77: vaddss xmm3, xmm3, xmm4
0x100220a7b: vucomiss xmm1, xmm3
0x100220a7f: ja 0x100220ad0
0x100220a81: vmulps xmm2, xmm2, xmm10
0x100220a86: vpermilpd xmm3, xmm2, 1
0x100220a8c: vaddps xmm2, xmm2, xmm3
0x100220a90: vmovshdup xmm3, xmm2
0x100220a94: vaddss xmm2, xmm2, xmm3
0x100220a98: vucomiss xmm1, xmm2
0x100220a9c: ja 0x100220ad0
0x100220a9e: lea rcx, [rdx + rsi]
0x100220aa2: lea rdx, [rdx + rsi + 0x70]
0x100220aa7: mov esi, r13d
0x100220aaa: mov qword ptr [rdi + rsi*8], rcx
0x100220aae: mov dword ptr [rbx + rsi*4], 0xffffffff
0x100220ab5: vmovaps xmm1, xmmword ptr [rdx]
0x100220ab9: shl rsi, 4
0x100220abd: vmovaps xmmword ptr [r15 + rsi], xmm1
0x100220ac3: inc r13d
0x100220ac6: mov ecx, dword ptr [r14 + 0x10010]
0x100220acd: nop dword ptr [rax]
0x100220ad0: inc eax
0x100220ad2: cmp eax, ecx
0x100220ad4: jb 0x1002209c0
0x100220ada: xor r8d, r8d
0x100220add: mov rdi, qword ptr [rbp - 0x30]
0x100220ae1: mov rsi, r15
0x100220ae4: mov edx, r13d
0x100220ae7: mov rcx, rbx
0x100220aea: call 0x100720dd0 ; 0x100720dd0
0x100220aef: test r13d, r13d
0x100220af2: je 0x10022138b
0x100220af8: lea rdi, [r14 + 0x20470]
0x100220aff: xor eax, eax
0x100220b01: mov rsi, qword ptr [rbp - 0x38]
0x100220b05: nop word ptr cs:[rax + rax]
0x100220b10: mov ecx, eax
0x100220b12: cmp dword ptr [rbx + rcx*4], 0
0x100220b16: je 0x100220b30
0x100220b18: inc eax
0x100220b1a: cmp eax, r13d
0x100220b1d: jb 0x100220b10
0x100220b1f: jmp 0x100220b62 ; 0x100220b62
0x100220b21: nop word ptr cs:[rax + rax]
0x100220b30: dec r13d
0x100220b33: mov rdx, qword ptr [rsi + r13*8]
0x100220b37: mov qword ptr [rsi + rcx*8], rdx
0x100220b3b: mov edx, dword ptr [rbx + r13*4]
0x100220b3f: mov dword ptr [rbx + rcx*4], edx
0x100220b42: mov rdx, r13
0x100220b45: shl rdx, 4
0x100220b49: vmovaps xmm0, xmmword ptr [r15 + rdx]
0x100220b4f: shl rcx, 4
0x100220b53: vmovaps xmmword ptr [r15 + rcx], xmm0
0x100220b59: dec eax
0x100220b5b: inc eax
0x100220b5d: cmp eax, r13d
0x100220b60: jb 0x100220b10
0x100220b62: test r13d, r13d
0x100220b65: je 0x10022138b
0x100220b6b: mov qword ptr [rbp - 0xd8], rdi
0x100220b72: mov qword ptr [rbp - 0x58], r14
0x100220b76: mov qword ptr [rbp - 0x50], rbx
0x100220b7a: mov qword ptr [rbp - 0x70], r15
0x100220b7e: call 0x1007c6c20 ; 0x1007c6c20
0x100220b83: mov esi, r13d
0x100220b86: mov rcx, rsi
0x100220b89: mov qword ptr [rbp - 0x30], rcx
0x100220b8d: shl rsi, 4
0x100220b91: lea rcx, [rip + 0x1e27fb8] ; 0x102048b50
0x100220b98: mov rdx, qword ptr [rcx]
0x100220b9b: mov ecx, 0x10
0x100220ba0: mov rdi, rax
0x100220ba3: call 0x100795530 ; 0x100795530
0x100220ba8: xor r15d, r15d
0x100220bab: lea r14, [rbp - 0x120]
0x100220bb2: mov qword ptr [rbp - 0xa0], rax
0x100220bb9: mov r12, rax
0x100220bbc: mov r13, qword ptr [rbp - 0xa8]
0x100220bc3: nop word ptr cs:[rax + rax]
0x100220bd0: mov rax, qword ptr [rbp - 0x38]
0x100220bd4: mov rbx, qword ptr [rax + r15*8]
0x100220bd8: mov rdi, r14
0x100220bdb: mov rsi, r13
0x100220bde: call 0x10076be90 ; 0x10076be90
0x100220be3: vmovaps xmm0, xmmword ptr [rbp - 0x120]
0x100220beb: vpermilps xmm1, xmm0, 0
0x100220bf1: vmulps xmm1, xmm1, xmmword ptr [rbx + 0x30]
0x100220bf6: vpermilps xmm2, xmm0, 0x55
0x100220bfc: vmulps xmm2, xmm2, xmmword ptr [rbx + 0x40]
0x100220c01: vaddps xmm1, xmm1, xmm2
0x100220c05: vpermilps xmm0, xmm0, 0xaa
0x100220c0b: vmulps xmm0, xmm0, xmmword ptr [rbx + 0x50]
0x100220c10: vaddps xmm0, xmm1, xmm0
0x100220c14: vaddps xmm0, xmm0, xmmword ptr [rbx + 0x60]
0x100220c19: vmulps xmm1, xmm0, xmm0
0x100220c1d: vmovshdup xmm2, xmm1
0x100220c21: vaddss xmm2, xmm1, xmm2
0x100220c25: vpermilpd xmm1, xmm1, 1
0x100220c2b: vaddss xmm1, xmm1, xmm2
0x100220c2f: vsqrtss xmm1, xmm1, xmm1
0x100220c33: vucomiss xmm1, dword ptr [rip + 0x886c89] ; 0x100aa78c4
0x100220c3b: jbe 0x100220c47
0x100220c3d: vpermilps xmm1, xmm1, 0xc0
0x100220c43: vdivps xmm0, xmm0, xmm1
0x100220c47: vmovaps xmmword ptr [r12], xmm0
0x100220c4d: vxorps xmm1, xmm1, xmm1
0x100220c51: vucomiss xmm1, dword ptr [r12 + 4]
0x100220c58: jbe 0x100220c68
0x100220c5a: vxorps xmm0, xmm0, xmmword ptr [rip + 0x886c9e] ; 0x100aa7900
0x100220c62: vmovaps xmmword ptr [r12], xmm0
0x100220c68: inc r15
0x100220c6b: add r12, 0x10
0x100220c6f: cmp r15, qword ptr [rbp - 0x30]
0x100220c73: jb 0x100220bd0
0x100220c79: mov rax, qword ptr [rbp - 0x58]
0x100220c7d: mov ebx, dword ptr [rax + 0x2016c]
0x100220c83: call 0x1007c6c20 ; 0x1007c6c20
0x100220c88: shl rbx, 4
0x100220c8c: lea rcx, [rip + 0x1e27ebd] ; 0x102048b50
0x100220c93: mov rdx, qword ptr [rcx]
0x100220c96: mov ecx, 0x10
0x100220c9b: mov rdi, rax
0x100220c9e: mov rsi, rbx
0x100220ca1: call 0x100795530 ; 0x100795530
0x100220ca6: mov r13, rax
0x100220ca9: xor r14d, r14d
0x100220cac: lea r15, [rbp - 0x160]
0x100220cb3: vmovss xmm3, dword ptr [rip + 0x886c09] ; 0x100aa78c4
0x100220cbb: nop dword ptr [rax + rax]
0x100220cc0: mov rax, qword ptr [rbp - 0x38]
0x100220cc4: mov rbx, qword ptr [rax + r14*8]
0x100220cc8: vmovaps xmm0, xmmword ptr [rip + 0x8873d0] ; 0x100aa80a0
0x100220cd0: vmovaps xmm4, xmm0
0x100220cd4: vinsertps xmm5, xmm4, xmm5, 0xf5
0x100220cda: mov rax, r14
0x100220cdd: shl rax, 4
0x100220ce1: mov rcx, qword ptr [rbp - 0xa0]
0x100220ce8: vmovaps xmm0, xmmword ptr [rcx + rax]
0x100220ced: vmulps xmm1, xmm0, xmmword ptr [rip + 0x887d3b] ; 0x100aa8a30
0x100220cf5: vpermilps xmm2, xmm0, 0xd2
0x100220cfb: vmulps xmm2, xmm2, xmm4
0x100220cff: vsubps xmm1, xmm1, xmm2
0x100220d03: vpermilps xmm4, xmm1, 0xd2
0x100220d09: vmulps xmm1, xmm1, xmm1
0x100220d0d: vpermilpd xmm2, xmm1, 1
0x100220d13: vaddss xmm2, xmm2, xmm1
0x100220d17: vmovshdup xmm1, xmm1
0x100220d1b: vaddss xmm1, xmm1, xmm2
0x100220d1f: vsqrtss xmm1, xmm1, xmm1
0x100220d23: vucomiss xmm1, xmm3
0x100220d27: jbe 0x100220d33
0x100220d29: vpermilps xmm1, xmm1, 0xc0
0x100220d2f: vdivps xmm4, xmm4, xmm1
0x100220d33: vmovaps xmmword ptr [rbp - 0x90], xmm4
0x100220d3b: vmovaps xmmword ptr [rbp - 0x80], xmm5
0x100220d40: vmulps xmm0, xmm5, xmm0
0x100220d44: vmovshdup xmm1, xmm0
0x100220d48: vaddss xmm1, xmm0, xmm1
0x100220d4c: vpermilpd xmm0, xmm0, 1
0x100220d52: vaddss xmm0, xmm0, xmm1
0x100220d56: call 0x100aa2576 ; 0x100aa2576 _acosf
0x100220d5b: vmulss xmm0, xmm0, dword ptr [rip + 0x886391] ; 0x100aa70f4
0x100220d63: mov r12, qword ptr [rbx]
0x100220d66: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x100220d6b: vmovshdup xmm14, xmm0
0x100220d6f: vmovaps xmm1, xmmword ptr [rbp - 0x90]
0x100220d77: vmovshdup xmm2, xmm1
0x100220d7b: vpermilpd xmm3, xmm1, 1
0x100220d81: vmulss xmm4, xmm1, xmm2
0x100220d85: vmulss xmm8, xmm2, xmm3
0x100220d89: vmulss xmm9, xmm3, xmm1
0x100220d8d: vmovss xmm5, dword ptr [rip + 0x88432b] ; 0x100aa50c0
0x100220d95: vsubss xmm7, xmm5, xmm14
0x100220d9a: vmulss xmm5, xmm1, xmm1
0x100220d9e: vmulss xmm5, xmm5, xmm7
0x100220da2: vaddss xmm10, xmm14, xmm5
0x100220da6: vmulss xmm4, xmm4, xmm7
0x100220daa: vmulss xmm6, xmm3, xmm0
0x100220dae: vaddss xmm11, xmm6, xmm4
0x100220db2: vmulss xmm9, xmm9, xmm7
0x100220db6: vmulss xmm13, xmm2, xmm0
0x100220dba: vsubss xmm12, xmm9, xmm13
0x100220dbf: vinsertps xmm5, xmm10, xmm11, 0x1c
0x100220dc5: vinsertps xmm10, xmm5, xmm12, 0x20
0x100220dcb: vsubss xmm4, xmm4, xmm6
0x100220dcf: vmulss xmm2, xmm2, xmm2
0x100220dd3: vmulss xmm2, xmm2, xmm7
0x100220dd7: vaddss xmm2, xmm14, xmm2
0x100220ddb: vmulss xmm6, xmm8, xmm7
0x100220ddf: vmulss xmm0, xmm1, xmm0
0x100220de3: vaddss xmm5, xmm0, xmm6
0x100220de7: vinsertps xmm2, xmm4, xmm2, 0x1c
0x100220ded: vinsertps xmm2, xmm2, xmm5, 0x20
0x100220df3: vaddss xmm4, xmm13, xmm9
0x100220df8: vsubss xmm0, xmm6, xmm0
0x100220dfc: vmulss xmm3, xmm3, xmm3
0x100220e00: vmulss xmm3, xmm3, xmm7
0x100220e04: vaddss xmm1, xmm14, xmm3
0x100220e08: vinsertps xmm0, xmm4, xmm0, 0x1c
0x100220e0e: vinsertps xmm0, xmm0, xmm1, 0x20
0x100220e14: vmovaps xmmword ptr [rbp - 0x160], xmm10
0x100220e1c: vmovaps xmmword ptr [rbp - 0x150], xmm2
0x100220e24: vmovaps xmmword ptr [rbp - 0x140], xmm0
0x100220e2c: vmovaps xmm0, xmmword ptr [rip + 0x887bcc] ; 0x100aa8a00
0x100220e34: vmovaps xmmword ptr [rbp - 0x130], xmm0
0x100220e3c: add r12, 0x10
0x100220e40: lea rdi, [rbp - 0x120]
0x100220e47: mov rsi, r12
0x100220e4a: mov rdx, r15
0x100220e4d: call 0x100076df0 ; 0x100076df0
0x100220e52: mov rsi, qword ptr [rbx + 8]
0x100220e56: cmp dword ptr [rsi + 0x34], 0
0x100220e5a: vmovss xmm3, dword ptr [rip + 0x886a62] ; 0x100aa78c4
0x100220e62: je 0x100220ed1
0x100220e64: xor ecx, ecx
0x100220e66: nop word ptr cs:[rax + rax]
0x100220e70: mov rax, qword ptr [rsi + 0x60]
0x100220e74: mov edx, ecx
0x100220e76: shl rdx, 4
0x100220e7a: vbroadcastss xmm0, dword ptr [rax + rdx]
0x100220e80: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x120]
0x100220e88: vbroadcastss xmm1, dword ptr [rax + rdx + 4]
0x100220e8f: vmulps xmm1, xmm1, xmmword ptr [rbp - 0x110]
0x100220e97: vaddps xmm0, xmm0, xmm1
0x100220e9b: vbroadcastss xmm1, dword ptr [rax + rdx + 8]
0x100220ea2: vmulps xmm1, xmm1, xmmword ptr [rbp - 0x100]
0x100220eaa: vaddps xmm0, xmm0, xmm1
0x100220eae: vaddps xmm0, xmm0, xmmword ptr [rbp - 0xf0]
0x100220eb6: mov eax, dword ptr [rbx + 0x18]
0x100220eb9: add eax, ecx
0x100220ebb: shl rax, 4
0x100220ebf: vmovaps xmmword ptr [r13 + rax], xmm0
0x100220ec6: inc ecx
0x100220ec8: mov rsi, qword ptr [rbx + 8]
0x100220ecc: cmp ecx, dword ptr [rsi + 0x34]
0x100220ecf: jb 0x100220e70
0x100220ed1: inc r14
0x100220ed4: cmp r14, qword ptr [rbp - 0x30]
0x100220ed8: vmovaps xmm5, xmmword ptr [rbp - 0x80]
0x100220edd: jb 0x100220cc0
0x100220ee3: lea rax, [rip + 0x1e1e7f6] ; 0x10203f6e0
0x100220eea: vmovaps xmm0, xmmword ptr [rax]
0x100220eee: vmovaps xmmword ptr [rbp - 0x120], xmm0
0x100220ef6: vmovaps xmm0, xmmword ptr [rip + 0x88c6c2] ; 0x100aad5c0
0x100220efe: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x100220f06: lea rdi, [rbp - 0x160]
0x100220f0d: lea rsi, [rbp - 0xd0]
0x100220f14: vmovd xmm0, dword ptr [rip + 0x88769c] ; 0x100aa85b8
0x100220f1c: call 0x10077d310 ; 0x10077d310
0x100220f21: vmovdqa xmm0, xmmword ptr [rbp - 0x160]
0x100220f29: vmovdqa xmmword ptr [rbp - 0x120], xmm0
0x100220f31: mov qword ptr [rbp - 0x100], 0x3f800000
0x100220f3c: mov dword ptr [rbp - 0xf8], 0
0x100220f46: lea rdi, [rbp - 0x120]
0x100220f4d: lea r14, [rbp - 0x170]
0x100220f54: mov rsi, r14
0x100220f57: call 0x100414530 ; 0x100414530
0x100220f5c: mov rax, qword ptr [rbp - 0x58]
0x100220f60: cmp dword ptr [rax + 0x20180], 2
0x100220f67: jne 0x10022153c
0x100220f6d: cmp dword ptr [rax + 0x20130], 0x1c
0x100220f74: jne 0x10022155b
0x100220f7a: lea rdi, [rax + 0x20178]
0x100220f81: call 0x100795060 ; 0x100795060
0x100220f86: mov r15, rax
0x100220f89: xor ebx, ebx
0x100220f8b: nop dword ptr [rax + rax]
0x100220f90: mov rax, qword ptr [rbp - 0x38]
0x100220f94: mov r12, qword ptr [rax + rbx*8]
0x100220f98: mov rax, qword ptr [r12 + 8]
0x100220f9d: cmp dword ptr [rax + 0x34], 0
0x100220fa1: je 0x100221206
0x100220fa7: vmovaps xmm0, xmmword ptr [r12 + 0x30]
0x100220fae: vmovaps xmm1, xmmword ptr [r12 + 0x40]
0x100220fb5: vmovapd xmm2, xmmword ptr [r12 + 0x50]
0x100220fbc: vunpcklps xmm3, xmm0, xmm1
0x100220fc0: mov rax, qword ptr [r12]
0x100220fc4: vxorps xmm4, xmm4, xmm4
0x100220fc8: vmaxss xmm4, xmm4, dword ptr [rax + 0x70]
0x100220fcd: vmovss xmm5, dword ptr [rip + 0x8840eb] ; 0x100aa50c0
0x100220fd5: vminss xmm4, xmm5, xmm4
0x100220fd9: mov rax, rbx
0x100220fdc: shl rax, 4
0x100220fe0: vunpcklpd xmm5, xmm3, xmm2
0x100220fe4: vmovapd xmmword ptr [rbp - 0x90], xmm5
0x100220fec: vshufps xmm3, xmm3, xmm2, 0xde
0x100220ff1: vmovaps xmmword ptr [rbp - 0x80], xmm3
0x100220ff6: vunpckhps xmm0, xmm0, xmm1
0x100220ffa: vblendpd xmm0, xmm2, xmm0, 1
0x100221000: vmovapd xmmword ptr [rbp - 0xc0], xmm0
0x100221008: mov rcx, qword ptr [rbp - 0xa0]
0x10022100f: vmulss xmm0, xmm4, dword ptr [rcx + rax + 4]
0x100221015: vmovss xmm1, dword ptr [rip + 0x8860d7] ; 0x100aa70f4
0x10022101d: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x100221022: vmovaps xmm14, xmmword ptr [rbp - 0xc0]
0x10022102a: vmovaps xmm13, xmmword ptr [rbp - 0x80]
0x10022102f: vmovaps xmm12, xmmword ptr [rbp - 0x90]
0x100221037: vmovaps xmm11, xmmword ptr [rip + 0x890b01] ; 0x100ab1b40
0x10022103f: vmovaps xmm10, xmmword ptr [rip + 0x890ae9] ; 0x100ab1b30
0x100221047: vmovaps xmm6, xmmword ptr [rip + 0x8901e1] ; 0x100ab1230
0x10022104f: vmovaps xmm8, xmmword ptr [rip + 0x88c559] ; 0x100aad5b0
0x100221057: vmovaps xmm7, xmmword ptr [rip + 0x88c541] ; 0x100aad5a0
0x10022105f: vxorps xmm9, xmm9, xmm9
0x100221064: vmovaps xmm5, xmmword ptr [rip + 0x88c524] ; 0x100aad590
0x10022106c: vmovdqa xmm4, xmmword ptr [rip + 0x88c50c] ; 0x100aad580
0x100221074: vmovss xmm3, dword ptr [rip + 0x886848] ; 0x100aa78c4
0x10022107c: vaddss xmm0, xmm0, xmm0
0x100221080: vaddss xmm0, xmm0, dword ptr [rip + 0x88403c] ; 0x100aa50c4
0x100221088: xor eax, eax
0x10022108a: vucomiss xmm0, dword ptr [rip + 0x886052] ; 0x100aa70e4
0x100221092: seta al
0x100221095: vandps xmm0, xmm0, xmmword ptr [rip + 0x886873] ; 0x100aa7910
0x10022109d: vmovss xmm1, dword ptr [rip + 0x88401b] ; 0x100aa50c0
0x1002210a5: vminss xmm0, xmm1, xmm0
0x1002210a9: lea rcx, [rip + 0x890c78] ; 0x100ab1d28
0x1002210b0: vmulss xmm0, xmm0, dword ptr [rcx + rax*4]
0x1002210b5: vcvttss2si eax, xmm0
0x1002210b9: xor ecx, ecx
0x1002210bb: nop dword ptr [rax + rax]
0x1002210c0: mov esi, dword ptr [r12 + 0x18]
0x1002210c5: add esi, ecx
0x1002210c7: lea rdx, [rsi + rsi*8]
0x1002210cb: lea rdx, [rdx + rdx*2]
0x1002210cf: add rdx, rsi
0x1002210d2: shl rsi, 4
0x1002210d6: mov edi, dword ptr [r13 + rsi + 8]
0x1002210db: mov dword ptr [r15 + rdx + 8], edi
0x1002210e0: mov rsi, qword ptr [r13 + rsi]
0x1002210e5: mov qword ptr [r15 + rdx], rsi
0x1002210e9: mov rsi, qword ptr [r12 + 8]
0x1002210ee: mov rsi, qword ptr [rsi + 0x70]
0x1002210f2: mov ecx, ecx
0x1002210f4: mov rdi, rcx
0x1002210f7: shl rdi, 4
0x1002210fb: mov esi, dword ptr [rsi + rdi]
0x1002210fe: mov dword ptr [r15 + rdx + 0xc], esi
0x100221103: mov rsi, qword ptr [r12 + 8]
0x100221108: mov rsi, qword ptr [rsi + 0x68]
0x10022110c: movzx edi, byte ptr [rsi + rcx*4]
0x100221110: vmovd xmm0, edi
0x100221114: vpinsrb xmm0, xmm0, byte ptr [rsi + rcx*4 + 1], 4
0x10022111c: vpinsrb xmm0, xmm0, byte ptr [rsi + rcx*4 + 2], 8
0x100221124: vpslld xmm0, xmm0, 0x18
0x100221129: vpsrad xmm0, xmm0, 0x18
0x10022112e: vpaddd xmm0, xmm0, xmm4
0x100221132: vaddps xmm0, xmm0, xmm5
0x100221136: vcmpleps xmm1, xmm9, xmm0
0x10022113b: vblendvps xmm1, xmm7, xmm8, xmm1
0x100221141: vmulps xmm0, xmm1, xmm0
0x100221145: vpermilps xmm1, xmm0, 0xc0
0x10022114b: vmulps xmm1, xmm12, xmm1
0x10022114f: vpermilps xmm2, xmm0, 0xd5
0x100221155: vmulps xmm2, xmm13, xmm2
0x100221159: vaddps xmm1, xmm2, xmm1
0x10022115d: vpermilps xmm0, xmm0, 0xea
0x100221163: vmulps xmm0, xmm14, xmm0
0x100221167: vaddps xmm0, xmm0, xmm1
0x10022116b: vmulps xmm1, xmm0, xmm0
0x10022116f: vmovshdup xmm2, xmm1
0x100221173: vaddss xmm2, xmm1, xmm2
0x100221177: vpermilpd xmm1, xmm1, 1
0x10022117d: vaddss xmm1, xmm1, xmm2
0x100221181: vsqrtss xmm1, xmm1, xmm1
0x100221185: vucomiss xmm1, xmm3
0x100221189: jbe 0x100221195
0x10022118b: vpermilps xmm1, xmm1, 0xc0
0x100221191: vdivps xmm0, xmm0, xmm1
0x100221195: vcmpleps xmm1, xmm9, xmm0
0x10022119a: vblendvps xmm1, xmm10, xmm6, xmm1
0x1002211a0: vmulps xmm0, xmm0, xmm1
0x1002211a4: vmaxps xmm0, xmm0, xmm11
0x1002211a9: vminps xmm0, xmm0, xmm6
0x1002211ad: vcvttps2dq xmm0, xmm0
0x1002211b1: vpextrb byte ptr [r15 + rdx + 0x10], xmm0, 0
0x1002211b9: vpextrb byte ptr [r15 + rdx + 0x11], xmm0, 4
0x1002211c1: vpextrb byte ptr [r15 + rdx + 0x12], xmm0, 8
0x1002211c9: mov byte ptr [r15 + rdx + 0x13], al
0x1002211ce: mov rdi, qword ptr [r12 + 0x10]
0x1002211d3: mov rsi, r14
0x1002211d6: test rdi, rdi
0x1002211d9: je 0x1002211e7
0x1002211db: lea rsi, [rcx + rcx*2]
0x1002211df: shl rsi, 2
0x1002211e3: add rsi, qword ptr [rdi + 8]
0x1002211e7: mov edi, dword ptr [rsi]
0x1002211e9: mov dword ptr [r15 + rdx + 0x14], edi
0x1002211ee: mov esi, dword ptr [rsi + 4]
0x1002211f1: mov dword ptr [r15 + rdx + 0x18], esi
0x1002211f6: inc ecx
0x1002211f8: mov rdx, qword ptr [r12 + 8]
0x1002211fd: cmp ecx, dword ptr [rdx + 0x34]
0x100221200: jb 0x1002210c0
0x100221206: inc rbx
0x100221209: cmp rbx, qword ptr [rbp - 0x30]
0x10022120d: jne 0x100220f90
0x100221213: call 0x1007c6c20 ; 0x1007c6c20
0x100221218: mov rcx, qword ptr [rbp - 0x30]
0x10022121c: lea rcx, [rcx*4]
0x100221224: lea r14, [rcx + rcx*2]
0x100221228: lea rcx, [rip + 0x1e27921] ; 0x102048b50
0x10022122f: mov rdx, qword ptr [rcx]
0x100221232: mov ecx, 4
0x100221237: mov rdi, rax
0x10022123a: mov rsi, r14
0x10022123d: call 0x100795530 ; 0x100795530
0x100221242: mov rbx, rax
0x100221245: mov rdi, rbx
0x100221248: mov rsi, r14
0x10022124b: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x100221250: mov qword ptr [rbp - 0x80], rbx
0x100221254: lea rbx, [rbx + 8]
0x100221258: xor r15d, r15d
0x10022125b: lea r14, [rbp - 0x160]
0x100221262: nop word ptr cs:[rax + rax]
0x100221270: mov rax, qword ptr [rbp - 0x38]
0x100221274: mov r12, qword ptr [rax + r15*8]
0x100221278: vmovaps xmm0, xmmword ptr [r12 + 0x70]
0x10022127f: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x100221287: mov rdi, r14
0x10022128a: mov rsi, qword ptr [rbp - 0xa8]
0x100221291: call 0x10076be90 ; 0x10076be90
0x100221296: inc r15
0x100221299: vmovaps xmm0, xmmword ptr [rbp - 0x90]
0x1002212a1: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x160]
0x1002212a9: vmulps xmm0, xmm0, xmm0
0x1002212ad: vmovshdup xmm1, xmm0
0x1002212b1: vaddss xmm1, xmm0, xmm1
0x1002212b5: vpermilpd xmm0, xmm0, 1
0x1002212bb: vaddss xmm0, xmm0, xmm1
0x1002212bf: vmovss dword ptr [rbx - 8], xmm0
0x1002212c4: mov eax, dword ptr [r12 + 0x1c]
0x1002212c9: mov dword ptr [rbx - 4], eax
0x1002212cc: mov rax, qword ptr [r12 + 8]
0x1002212d1: mov eax, dword ptr [rax + 0x38]
0x1002212d4: mov dword ptr [rbx], eax
0x1002212d6: add rbx, 0xc
0x1002212da: cmp r15, qword ptr [rbp - 0x30]
0x1002212de: jb 0x100221270
0x1002212e0: cmp byte ptr [rip + 0xa74e99], 0 ; 0x100c96180
0x1002212e7: je 0x1002212fe
0x1002212e9: mov rax, qword ptr [rbp - 0x30]
0x1002212ed: lea rax, [rax + rax*2]
0x1002212f1: mov rdi, qword ptr [rbp - 0x80]
0x1002212f5: lea rsi, [rdi + rax*4]
0x1002212f9: call 0x100224290 ; 0x100224290
0x1002212fe: test r15d, r15d
0x100221301: mov r12, qword ptr [rbp - 0xd8]
0x100221308: je 0x100221339
0x10022130a: mov rbx, qword ptr [rbp - 0x80]
0x10022130e: add rbx, 8
0x100221312: xor r14d, r14d
0x100221315: nop word ptr cs:[rax + rax]
0x100221320: mov esi, dword ptr [rbx - 4]
0x100221323: mov edx, dword ptr [rbx]
0x100221325: mov rdi, r12
0x100221328: call 0x1007f6ae0 ; 0x1007f6ae0
0x10022132d: inc r14
0x100221330: add rbx, 0xc
0x100221334: cmp r14, r15
0x100221337: jb 0x100221320
0x100221339: mov rdi, r12
0x10022133c: call 0x1007f6540 ; 0x1007f6540
0x100221341: cmp byte ptr [rip + 0x1bc0e50], 0 ; 0x101de2198
0x100221348: jne 0x1002213ce
0x10022134e: call 0x1007c6c20 ; 0x1007c6c20
0x100221353: mov rdi, rax
0x100221356: mov rsi, qword ptr [rbp - 0x80]
0x10022135a: call 0x100795a70 ; 0x100795a70
0x10022135f: call 0x1007c6c20 ; 0x1007c6c20
0x100221364: mov r15, qword ptr [rbp - 0x70]
0x100221368: mov rbx, qword ptr [rbp - 0x50]
0x10022136c: mov rdi, rax
0x10022136f: mov rsi, r13
0x100221372: call 0x100795a70 ; 0x100795a70
0x100221377: call 0x1007c6c20 ; 0x1007c6c20
0x10022137c: mov rdi, rax
0x10022137f: mov rsi, qword ptr [rbp - 0xa0]
0x100221386: call 0x100795a70 ; 0x100795a70
0x10022138b: call 0x1007c6c20 ; 0x1007c6c20
0x100221390: mov rdi, rax
0x100221393: mov rsi, rbx
0x100221396: call 0x100795a70 ; 0x100795a70
0x10022139b: call 0x1007c6c20 ; 0x1007c6c20
0x1002213a0: mov rdi, rax
0x1002213a3: mov rsi, r15
0x1002213a6: call 0x100795a70 ; 0x100795a70
0x1002213ab: call 0x1007c6c20 ; 0x1007c6c20
0x1002213b0: mov rdi, rax
0x1002213b3: mov rsi, qword ptr [rbp - 0x38]
0x1002213b7: call 0x100795a70 ; 0x100795a70
0x1002213bc: add rsp, 0x148
0x1002213c3: pop rbx
0x1002213c4: pop r12
0x1002213c6: pop r13
0x1002213c8: pop r14
0x1002213ca: pop r15
0x1002213cc: pop rbp
0x1002213cd: ret 
0x1002213ce: mov rax, qword ptr [rbp - 0x58]
0x1002213d2: cmp dword ptr [rax + 0x10010], 0
0x1002213d9: je 0x10022134e
0x1002213df: xor r12d, r12d
0x1002213e2: lea r14, [rbp - 0xd0]
0x1002213e9: lea r15, [rbp - 0x160]
0x1002213f0: mov rax, qword ptr [rbp - 0x58]
0x1002213f4: mov rax, qword ptr [rax + 0x10018]
0x1002213fb: mov r12d, r12d
0x1002213fe: mov rbx, r12
0x100221401: shl rbx, 7
0x100221405: mov eax, dword ptr [rax + rbx + 0x20]
0x100221409: mov ecx, eax
0x10022140b: shl ecx, 0xd
0x10022140e: xor ecx, eax
0x100221410: mov edx, ecx
0x100221412: imul edx, edx
0x100221415: imul edx, edx, 0x3d73
0x10022141b: add edx, 0xc0ae5
0x100221421: imul edx, ecx
0x100221424: add edx, 0x5208dd0d
0x10022142a: and edx, 0x7fffffff
0x100221430: vcvtsi2ss xmm0, xmm6, edx
0x100221434: vmovss xmm4, dword ptr [rip + 0x88977c] ; 0x100aaabb8
0x10022143c: vmulss xmm0, xmm0, xmm4
0x100221440: vmovss xmm3, dword ptr [rip + 0x883c78] ; 0x100aa50c0
0x100221448: vsubss xmm0, xmm3, xmm0
0x10022144c: lea ecx, [rax + 0xa]
0x10022144f: mov edx, ecx
0x100221451: shl edx, 0xd
0x100221454: xor edx, ecx
0x100221456: mov ecx, edx
0x100221458: imul ecx, ecx
0x10022145b: imul ecx, ecx, 0x3d73
0x100221461: add ecx, 0xc0ae5
0x100221467: imul ecx, edx
0x10022146a: add ecx, 0x5208dd0d
0x100221470: and ecx, 0x7fffffff
0x100221476: vcvtsi2ss xmm1, xmm5, ecx
0x10022147a: vmulss xmm1, xmm1, xmm4
0x10022147e: vsubss xmm1, xmm3, xmm1
0x100221482: add eax, 0x1e
0x100221485: mov ecx, eax
0x100221487: shl ecx, 0xd
0x10022148a: xor ecx, eax
0x10022148c: mov eax, ecx
0x10022148e: imul eax, eax
0x100221491: imul eax, eax, 0x3d73
0x100221497: add eax, 0xc0ae5
0x10022149c: imul eax, ecx
0x10022149f: add eax, 0x5208dd0d
0x1002214a4: and eax, 0x7fffffff
0x1002214a9: vcvtsi2ss xmm2, xmm5, eax
0x1002214ad: vmulss xmm2, xmm2, xmm4
0x1002214b1: vsubss xmm2, xmm3, xmm2
0x1002214b5: vinsertps xmm0, xmm0, xmm1, 0x10
0x1002214bb: vinsertps xmm0, xmm0, xmm2, 0x20
0x1002214c1: vinsertps xmm0, xmm0, xmm3, 0x30
0x1002214c7: vmovaps xmm1, xmmword ptr [rip + 0x8861a1] ; 0x100aa7670
0x1002214cf: vmovaps xmm2, xmm1
0x1002214d3: vmulps xmm1, xmm0, xmm2
0x1002214d7: vblendps xmm0, xmm1, xmm0, 8
0x1002214dd: vaddps xmm1, xmm0, xmm2
0x1002214e1: vblendps xmm0, xmm1, xmm0, 8
0x1002214e7: vmovaps xmmword ptr [rbp - 0x160], xmm0
0x1002214ef: call 0x1002b9810 ; 0x1002b9810
0x1002214f4: mov rcx, qword ptr [rbp - 0x58]
0x1002214f8: mov rcx, qword ptr [rcx + 0x10018]
0x1002214ff: vmovaps xmm0, xmmword ptr [rcx + rbx + 0x70]
0x100221505: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x10022150d: vpermilps xmm0, xmm0, 0xe7
0x100221513: xor ecx, ecx
0x100221515: mov rdi, rax
0x100221518: mov rsi, r14
0x10022151b: mov rdx, r15
0x10022151e: call 0x1002bb510 ; 0x1002bb510
0x100221523: inc r12d
0x100221526: mov rax, qword ptr [rbp - 0x58]
0x10022152a: cmp r12d, dword ptr [rax + 0x10010]
0x100221531: jb 0x1002213f0
0x100221537: jmp 0x10022134e ; 0x10022134e
0x10022153c: lea rdi, [rip + 0x9557d8] ; 0x100b76d1b m_vertexBuffers[ idx ].GetUsage() == Bind_Dynamic
0x100221543: lea rsi, [rip + 0x940d31] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10022154a: mov edx, 0x115
0x10022154f: mov ecx, 3
0x100221554: call 0x1007e5f70 ; 0x1007e5f70
0x100221559: jmp 0x100221578 ; 0x100221578
0x10022155b: lea rdi, [rip + 0x9557eb] ; 0x100b76d4d VsIsValidMap< BufferType >::Test( &m_format, idx )
0x100221562: lea rsi, [rip + 0x940d12] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x100221569: mov edx, 0x116
0x10022156e: mov ecx, 3
0x100221573: call 0x1007e5f70 ; 0x1007e5f70
0x100221578: ud2 
0x10022157a: jmp 0x1002215e7 ; 0x1002215e7
0x10022157c: mov rdi, rax
0x10022157f: call 0x100011bf0 ; 0x100011bf0
0x100221584: mov rdi, rax
0x100221587: call 0x100011bf0 ; 0x100011bf0
0x10022158c: mov rdi, rax
0x10022158f: call 0x100011bf0 ; 0x100011bf0
0x100221594: jmp 0x10022160d ; 0x10022160d
0x100221596: jmp 0x10022160d ; 0x10022160d
0x100221598: jmp 0x10022160d ; 0x10022160d
0x10022159a: jmp 0x10022160d ; 0x10022160d
0x10022159c: jmp 0x100221632 ; 0x100221632
0x1002215a1: mov r14, rax
0x1002215a4: mov r15, qword ptr [rbp - 0x70]
0x1002215a8: mov rbx, qword ptr [rbp - 0x50]
0x1002215ac: jmp 0x100221651 ; 0x100221651
0x1002215b1: mov r14, rax
0x1002215b4: jmp 0x100221651 ; 0x100221651
0x1002215b9: mov rdi, rax
0x1002215bc: call 0x100011bf0 ; 0x100011bf0
0x1002215c1: mov rdi, rax
0x1002215c4: call 0x100011bf0 ; 0x100011bf0
0x1002215c9: mov rdi, rax
0x1002215cc: call 0x100011bf0 ; 0x100011bf0
0x1002215d1: mov r14, rax
0x1002215d4: jmp 0x100221661 ; 0x100221661
0x1002215d9: mov r14, rax
0x1002215dc: jmp 0x100221671 ; 0x100221671
0x1002215e1: jmp 0x1002215e7 ; 0x1002215e7
0x1002215e3: jmp 0x1002215e7 ; 0x1002215e7
0x1002215e5: jmp 0x1002215e7 ; 0x1002215e7
0x1002215e7: mov r14, rax
0x1002215ea: call 0x1007c6c20 ; 0x1007c6c20
0x1002215ef: mov r15, qword ptr [rbp - 0x70]
0x1002215f3: mov rbx, qword ptr [rbp - 0x50]
0x1002215f7: mov rdi, rax
0x1002215fa: mov rsi, qword ptr [rbp - 0x80]
0x1002215fe: call 0x100795a70 ; 0x100795a70
0x100221603: jmp 0x100221618 ; 0x100221618
0x100221605: mov rdi, rax
0x100221608: call 0x100011bf0 ; 0x100011bf0
0x10022160d: mov r14, rax
0x100221610: mov r15, qword ptr [rbp - 0x70]
0x100221614: mov rbx, qword ptr [rbp - 0x50]
0x100221618: call 0x1007c6c20 ; 0x1007c6c20
0x10022161d: mov rdi, rax
0x100221620: mov rsi, r13
0x100221623: call 0x100795a70 ; 0x100795a70
0x100221628: jmp 0x10022163d ; 0x10022163d
0x10022162a: mov rdi, rax
0x10022162d: call 0x100011bf0 ; 0x100011bf0
0x100221632: mov r14, rax
0x100221635: mov r15, qword ptr [rbp - 0x70]
0x100221639: mov rbx, qword ptr [rbp - 0x50]
0x10022163d: call 0x1007c6c20 ; 0x1007c6c20
0x100221642: mov rdi, rax
0x100221645: mov rsi, qword ptr [rbp - 0xa0]
0x10022164c: call 0x100795a70 ; 0x100795a70
0x100221651: call 0x1007c6c20 ; 0x1007c6c20
0x100221656: mov rdi, rax
0x100221659: mov rsi, rbx
0x10022165c: call 0x100795a70 ; 0x100795a70
0x100221661: call 0x1007c6c20 ; 0x1007c6c20
0x100221666: mov rdi, rax
0x100221669: mov rsi, r15
0x10022166c: call 0x100795a70 ; 0x100795a70
0x100221671: call 0x1007c6c20 ; 0x1007c6c20
0x100221676: mov rdi, rax
0x100221679: mov rsi, qword ptr [rbp - 0x38]
0x10022167d: call 0x100795a70 ; 0x100795a70
0x100221682: mov rdi, r14
0x100221685: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10022168a: mov rdi, rax
0x10022168d: call 0x100011bf0 ; 0x100011bf0
0x100221692: mov rdi, rax
0x100221695: call 0x100011bf0 ; 0x100011bf0
0x10022169a: mov rdi, rax
0x10022169d: call 0x100011bf0 ; 0x100011bf0
0x1002216a2: mov rdi, rax
0x1002216a5: call 0x100011bf0 ; 0x100011bf0
0x1002216aa: nop word ptr [rax + rax]
