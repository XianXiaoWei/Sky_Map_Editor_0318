0x100480a30: push rbp
0x100480a31: mov rbp, rsp
0x100480a34: push r15
0x100480a36: push r14
0x100480a38: push r13
0x100480a3a: push r12
0x100480a3c: push rbx
0x100480a3d: sub rsp, 0xf8
0x100480a44: mov r14, rsi
0x100480a47: mov rbx, rdi
0x100480a4a: mov rax, qword ptr [r14 + 0x160]
0x100480a51: lea rcx, [rip + 0x1b7a678] ; 0x101ffb0d0
0x100480a58: cmp byte ptr [rcx], 0
0x100480a5b: je 0x100480a6a
0x100480a5d: lea rcx, [rip + 0x837adc] ; 0x100cb8540
0x100480a64: vmovss xmm0, dword ptr [rcx]
0x100480a68: jmp 0x100480a72 ; 0x100480a72
0x100480a6a: vmovss xmm0, dword ptr [rip + 0x62464e] ; 0x100aa50c0
0x100480a72: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x100480a77: vmulss xmm0, xmm0, dword ptr [rax + 0x14]
0x100480a7c: vmovss xmm1, dword ptr [rip + 0x626018] ; 0x100aa6a9c
0x100480a84: vmaxss xmm0, xmm1, xmm0
0x100480a88: vmovss xmm1, dword ptr [rip + 0x626010] ; 0x100aa6aa0
0x100480a90: vminss xmm0, xmm1, xmm0
0x100480a94: vcvtss2sd xmm2, xmm0, xmm0
0x100480a98: vmovsd xmm0, qword ptr [rbx + 0x98]
0x100480aa0: vmovss xmm1, dword ptr [rbx + 0x8c]
0x100480aa8: vaddsd xmm2, xmm0, xmm2
0x100480aac: vmovsd qword ptr [rbx + 0x98], xmm2
0x100480ab4: mov eax, dword ptr [rbx + 0x88]
0x100480aba: mov r12d, 1
0x100480ac0: cmp eax, 1
0x100480ac3: je 0x100480b04
0x100480ac5: lea ecx, [rax - 1]
0x100480ac8: vcvtsi2sd xmm3, xmm3, rcx
0x100480acd: vcvtss2sd xmm1, xmm1, xmm1
0x100480ad1: vdivsd xmm2, xmm2, xmm1
0x100480ad5: vmulsd xmm2, xmm2, xmm3
0x100480ad9: vcvtsd2ss xmm2, xmm2, xmm2
0x100480add: vroundss xmm2, xmm2, xmm2, 0xa
0x100480ae3: vdivsd xmm0, xmm0, xmm1
0x100480ae7: vmulsd xmm0, xmm0, xmm3
0x100480aeb: vcvtsd2ss xmm0, xmm0, xmm0
0x100480aef: vroundss xmm0, xmm0, xmm0, 0xa
0x100480af5: vsubss xmm0, xmm2, xmm0
0x100480af9: vcvttss2si r12, xmm0
0x100480afe: test eax, eax
0x100480b00: cmove r12d, eax
0x100480b04: vmovaps xmm2, xmmword ptr [rbx + 0x50]
0x100480b09: vmulps xmm0, xmm2, xmm2
0x100480b0d: vmovshdup xmm1, xmm0
0x100480b11: vaddss xmm1, xmm0, xmm1
0x100480b15: vpermilpd xmm0, xmm0, 1
0x100480b1b: vaddss xmm0, xmm0, xmm1
0x100480b1f: vsqrtss xmm0, xmm0, xmm0
0x100480b23: vucomiss xmm0, dword ptr [rip + 0x626d99] ; 0x100aa78c4
0x100480b2b: jbe 0x100480b37
0x100480b2d: vpermilps xmm0, xmm0, 0xc0
0x100480b33: vdivps xmm2, xmm2, xmm0
0x100480b37: test r12d, r12d
0x100480b3a: je 0x100480da9
0x100480b40: vmovaps xmmword ptr [rbp - 0x70], xmm2
0x100480b45: mov ecx, dword ptr [rbx + 0x94]
0x100480b4b: cmp ecx, eax
0x100480b4d: jae 0x100480daf
0x100480b53: lea r15, [rbx + 0x40]
0x100480b57: mov r13d, 1
0x100480b5d: nop dword ptr [rax]
0x100480b60: vmovss xmm0, dword ptr [rip + 0x623a50] ; 0x100aa45b8
0x100480b68: vmovaps xmmword ptr [rbp - 0xe0], xmm0
0x100480b70: vmovaps xmm0, xmmword ptr [rip + 0x626d78] ; 0x100aa78f0
0x100480b78: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x100480b80: vmovaps xmm0, xmmword ptr [rip + 0x631a58] ; 0x100ab25e0
0x100480b88: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x100480b90: vmovaps xmm0, xmmword ptr [rip + 0x627e68] ; 0x100aa8a00
0x100480b98: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x100480ba0: lea rdi, [rbp - 0x120]
0x100480ba7: mov rsi, r15
0x100480baa: lea rdx, [rbp - 0xe0]
0x100480bb1: call 0x100076df0 ; 0x100076df0
0x100480bb6: vmovaps xmm0, xmmword ptr [rbp - 0x120]
0x100480bbe: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x100480bc3: vmovaps xmm0, xmmword ptr [rbp - 0x110]
0x100480bcb: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x100480bd0: vmovaps xmm0, xmmword ptr [rbp - 0x100]
0x100480bd8: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x100480bdd: vmovaps xmm0, xmmword ptr [rbp - 0xf0]
0x100480be5: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x100480bea: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100480bef: vcvtsi2ss xmm0, xmm4, eax
0x100480bf3: vmovss xmm1, dword ptr [rip + 0x6264f5] ; 0x100aa70f0
0x100480bfb: vmulss xmm0, xmm0, xmm1
0x100480bff: vaddss xmm0, xmm0, xmm0
0x100480c03: vpermilps xmm0, xmm0, 0xc0
0x100480c09: vmovaps xmm1, xmmword ptr [rbp - 0x50]
0x100480c0e: vmulps xmm0, xmm1, xmm0
0x100480c12: vsubps xmm0, xmm0, xmm1
0x100480c16: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x80]
0x100480c1b: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x100480c20: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100480c25: vcvtsi2ss xmm0, xmm4, eax
0x100480c29: vmulss xmm0, xmm0, dword ptr [rip + 0x6264bf] ; 0x100aa70f0
0x100480c31: vaddss xmm0, xmm0, xmm0
0x100480c35: vpermilps xmm0, xmm0, 0xc0
0x100480c3b: vmovaps xmm1, xmmword ptr [rbp - 0x40]
0x100480c40: vmulps xmm0, xmm1, xmm0
0x100480c44: vsubps xmm0, xmm0, xmm1
0x100480c48: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x50]
0x100480c4d: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x100480c52: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100480c57: vcvtsi2ss xmm0, xmm4, eax
0x100480c5b: vmulss xmm0, xmm0, dword ptr [rip + 0x62648d] ; 0x100aa70f0
0x100480c63: vaddss xmm0, xmm0, xmm0
0x100480c67: vpermilps xmm0, xmm0, 0xc0
0x100480c6d: vmovaps xmm1, xmmword ptr [rbp - 0x60]
0x100480c72: vmulps xmm0, xmm1, xmm0
0x100480c76: vsubps xmm0, xmm0, xmm1
0x100480c7a: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x40]
0x100480c7f: vsubps xmm1, xmm0, xmmword ptr [rbx + 0x70]
0x100480c84: vmovaps xmm3, xmmword ptr [rbp - 0x70]
0x100480c89: vmulps xmm1, xmm3, xmm1
0x100480c8d: vmovshdup xmm2, xmm1
0x100480c91: vaddss xmm2, xmm1, xmm2
0x100480c95: vpermilpd xmm1, xmm1, 1
0x100480c9b: vaddss xmm1, xmm1, xmm2
0x100480c9f: vpermilps xmm1, xmm1, 0xc0
0x100480ca5: vmulps xmm1, xmm3, xmm1
0x100480ca9: vsubps xmm0, xmm0, xmm1
0x100480cad: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x100480cb2: vmovss xmm0, dword ptr [rbx + 0x90]
0x100480cba: vmovss dword ptr [rbp - 0x40], xmm0
0x100480cbf: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100480cc4: vcvtsi2ss xmm0, xmm4, eax
0x100480cc8: vmulss xmm0, xmm0, dword ptr [rip + 0x626420] ; 0x100aa70f0
0x100480cd0: vmovss xmm1, dword ptr [rip + 0x6243e8] ; 0x100aa50c0
0x100480cd8: vsubss xmm1, xmm1, xmm0
0x100480cdc: vmulss xmm1, xmm1, dword ptr [rip + 0x6297c4] ; 0x100aaa4a8
0x100480ce4: vmulss xmm0, xmm0, dword ptr [rip + 0x628988] ; 0x100aa9674
0x100480cec: vaddss xmm0, xmm0, xmm1
0x100480cf0: vmulss xmm0, xmm0, dword ptr [rbp - 0x40]
0x100480cf5: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x100480cfa: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x100480cff: vcvtsi2ss xmm0, xmm4, eax
0x100480d03: vmulss xmm0, xmm0, dword ptr [rip + 0x6263e5] ; 0x100aa70f0
0x100480d0b: vmovss xmm1, dword ptr [rip + 0x6243ad] ; 0x100aa50c0
0x100480d13: vsubss xmm1, xmm1, xmm0
0x100480d17: vmulss xmm1, xmm1, dword ptr [rip + 0x6263c5] ; 0x100aa70e4
0x100480d1f: vmulss xmm0, xmm0, dword ptr [rip + 0x627c91] ; 0x100aa89b8
0x100480d27: vaddss xmm0, xmm0, xmm1
0x100480d2b: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x100480d30: vpshufb xmm0, xmm0, xmmword ptr [rip + 0x62b1b7] ; 0x100aabef0
0x100480d39: vmulps xmm0, xmm0, xmmword ptr [rip + 0x62728f] ; 0x100aa7fd0
0x100480d41: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x70]
0x100480d46: vpermilps xmm1, xmmword ptr [rbp - 0x40], 0xc0
0x100480d4d: vmulps xmm0, xmm1, xmm0
0x100480d51: vmovaps xmm1, xmmword ptr [rbp - 0x60]
0x100480d56: vmovaps xmmword ptr [rbp - 0xa0], xmm1
0x100480d5e: mov rdx, qword ptr [rbx + 0x80]
0x100480d65: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x100480d6d: mov rdi, r14
0x100480d70: lea rsi, [rbp - 0xa0]
0x100480d77: lea rcx, [rbp - 0x90]
0x100480d7e: call 0x100478610 ; 0x100478610
0x100480d83: mov eax, dword ptr [rbx + 0x88]
0x100480d89: mov ecx, dword ptr [rbx + 0x94]
0x100480d8f: inc ecx
0x100480d91: mov dword ptr [rbx + 0x94], ecx
0x100480d97: cmp r13d, r12d
0x100480d9a: jae 0x100480daf
0x100480d9c: inc r13d
0x100480d9f: cmp ecx, eax
0x100480da1: jb 0x100480b60
0x100480da7: jmp 0x100480daf ; 0x100480daf
0x100480da9: mov ecx, dword ptr [rbx + 0x94]
0x100480daf: cmp ecx, eax
0x100480db1: jne 0x100480dbb
0x100480db3: mov rdi, rbx
0x100480db6: call 0x10032ef60 ; 0x10032ef60
0x100480dbb: add rsp, 0xf8
0x100480dc2: pop rbx
0x100480dc3: pop r12
0x100480dc5: pop r13
0x100480dc7: pop r14
0x100480dc9: pop r15
0x100480dcb: pop rbp
0x100480dcc: ret 
0x100480dcd: nop dword ptr [rax]
