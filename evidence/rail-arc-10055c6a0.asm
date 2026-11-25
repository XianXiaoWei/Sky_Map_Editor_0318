0x10055c6a0: push rbp
0x10055c6a1: mov rbp, rsp
0x10055c6a4: push r15
0x10055c6a6: push r14
0x10055c6a8: push r13
0x10055c6aa: push r12
0x10055c6ac: push rbx
0x10055c6ad: sub rsp, 0x28
0x10055c6b1: mov r14d, ecx
0x10055c6b4: vmovaps xmm10, xmm1
0x10055c6b8: vmovaps xmm12, xmm0
0x10055c6bc: mov qword ptr [rbp - 0x38], rsi
0x10055c6c0: mov r12, rdi
0x10055c6c3: test edx, edx
0x10055c6c5: mov ebx, 1
0x10055c6ca: cmovne ebx, edx
0x10055c6cd: test r14b, r14b
0x10055c6d0: je 0x10055c748
0x10055c6d2: vmovss xmm1, dword ptr [rip + 0x5489e6] ; 0x100aa50c0
0x10055c6da: vmovaps xmm0, xmm12
0x10055c6de: vmovss dword ptr [rbp - 0x30], xmm12
0x10055c6e3: vmovss dword ptr [rbp - 0x2c], xmm10
0x10055c6e8: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x10055c6ed: vmovss xmm10, dword ptr [rbp - 0x2c]
0x10055c6f2: vmovss xmm12, dword ptr [rbp - 0x30]
0x10055c6f7: vaddss xmm1, xmm0, dword ptr [rip + 0x5489c1] ; 0x100aa50c0
0x10055c6ff: vxorps xmm2, xmm2, xmm2
0x10055c703: vcmpltss xmm2, xmm0, xmm2
0x10055c708: vblendvps xmm0, xmm0, xmm1, xmm2
0x10055c70e: mov rsi, qword ptr [rbp - 0x38]
0x10055c712: mov eax, esi
0x10055c714: vcvtsi2ss xmm1, xmm3, rax
0x10055c719: vmulss xmm2, xmm0, xmm1
0x10055c71d: vcvttss2si rcx, xmm2
0x10055c722: lea edx, [rsi - 1]
0x10055c725: lea eax, [rcx + 1]
0x10055c728: xor r8d, r8d
0x10055c72b: cmp edx, ecx
0x10055c72d: cmove eax, r8d
0x10055c731: test ecx, ecx
0x10055c733: mov edx, ecx
0x10055c735: cmove edx, esi
0x10055c738: dec edx
0x10055c73a: lea edi, [rsi - 2]
0x10055c73d: lea esi, [rax + 1]
0x10055c740: cmp edi, ecx
0x10055c742: cmove esi, r8d
0x10055c746: jmp 0x10055c794 ; 0x10055c794
0x10055c748: vxorps xmm0, xmm0, xmm0
0x10055c74c: vmaxss xmm0, xmm0, xmm12
0x10055c751: vmovss xmm1, dword ptr [rip + 0x548967] ; 0x100aa50c0
0x10055c759: vminss xmm0, xmm1, xmm0
0x10055c75d: mov rax, qword ptr [rbp - 0x38]
0x10055c761: mov rcx, rax
0x10055c764: lea esi, [rcx - 1]
0x10055c767: vcvtsi2ss xmm1, xmm2, rsi
0x10055c76c: vmulss xmm2, xmm0, xmm1
0x10055c770: vcvttss2si rax, xmm2
0x10055c775: lea ecx, [rcx - 2]
0x10055c778: cmp esi, eax
0x10055c77a: cmovne ecx, eax
0x10055c77d: lea eax, [rcx + 1]
0x10055c780: lea edx, [rcx - 1]
0x10055c783: test ecx, ecx
0x10055c785: cmove edx, ecx
0x10055c788: xor edi, edi
0x10055c78a: cmp eax, esi
0x10055c78c: setne dil
0x10055c790: lea esi, [rcx + rdi + 1]
0x10055c794: vmulss xmm0, xmm0, xmm1
0x10055c798: mov ecx, ecx
0x10055c79a: vcvtsi2ss xmm1, xmm3, rcx
0x10055c79f: vsubss xmm8, xmm0, xmm1
0x10055c7a3: mov edx, edx
0x10055c7a5: shl rdx, 4
0x10055c7a9: vmovaps xmm1, xmmword ptr [r12 + rdx]
0x10055c7af: shl rcx, 4
0x10055c7b3: vmovaps xmm2, xmmword ptr [r12 + rcx]
0x10055c7b9: mov eax, eax
0x10055c7bb: shl rax, 4
0x10055c7bf: vmovaps xmm3, xmmword ptr [r12 + rax]
0x10055c7c5: mov eax, esi
0x10055c7c7: shl rax, 4
0x10055c7cb: vmovaps xmm4, xmmword ptr [r12 + rax]
0x10055c7d1: vaddps xmm9, xmm2, xmm2
0x10055c7d5: vsubps xmm6, xmm3, xmm1
0x10055c7d9: vaddps xmm7, xmm1, xmm1
0x10055c7dd: vmulps xmm0, xmm2, xmmword ptr [rip + 0x54af9b] ; 0x100aa7780
0x10055c7e5: vsubps xmm0, xmm7, xmm0
0x10055c7e9: vmulps xmm7, xmm3, xmmword ptr [rip + 0x54b75f] ; 0x100aa7f50
0x10055c7f1: vaddps xmm0, xmm0, xmm7
0x10055c7f5: vsubps xmm0, xmm0, xmm4
0x10055c7f9: vmovaps xmm15, xmmword ptr [rip + 0x54b87f] ; 0x100aa8080
0x10055c801: vmulps xmm2, xmm2, xmm15
0x10055c806: vsubps xmm1, xmm2, xmm1
0x10055c80a: vmulps xmm2, xmm3, xmm15
0x10055c80f: vsubps xmm1, xmm1, xmm2
0x10055c813: vaddps xmm1, xmm4, xmm1
0x10055c817: vpermilps xmm2, xmm8, 0xc0
0x10055c81d: vmulps xmm1, xmm2, xmm1
0x10055c821: vaddps xmm0, xmm0, xmm1
0x10055c825: vmulps xmm0, xmm2, xmm0
0x10055c829: vaddps xmm0, xmm6, xmm0
0x10055c82d: vmulps xmm0, xmm2, xmm0
0x10055c831: vaddps xmm0, xmm9, xmm0
0x10055c835: vmulps xmm5, xmm0, xmmword ptr [rip + 0x54ae33] ; 0x100aa7670
0x10055c83d: vsubss xmm0, xmm10, xmm12
0x10055c842: mov eax, ebx
0x10055c844: vcvtsi2ss xmm1, xmm11, rax
0x10055c849: vdivss xmm14, xmm0, xmm1
0x10055c84d: mov rax, qword ptr [rbp - 0x38]
0x10055c851: lea r13d, [rax - 1]
0x10055c855: lea r15d, [rax - 2]
0x10055c859: test r14b, r14b
0x10055c85c: je 0x10055c9d1
0x10055c862: mov eax, dword ptr [rbp - 0x38]
0x10055c865: vcvtsi2ss xmm0, xmm11, rax
0x10055c86a: vmovss dword ptr [rbp - 0x3c], xmm0
0x10055c86f: xor r14d, r14d
0x10055c872: vxorps xmm0, xmm0, xmm0
0x10055c876: vmovss dword ptr [rbp - 0x40], xmm14
0x10055c87b: nop dword ptr [rax + rax]
0x10055c880: vmovaps xmmword ptr [rbp - 0x50], xmm5
0x10055c885: vmovss dword ptr [rbp - 0x2c], xmm0
0x10055c88a: vaddss xmm12, xmm14, xmm12
0x10055c88f: vmovss dword ptr [rbp - 0x30], xmm12
0x10055c894: vmovaps xmm0, xmm12
0x10055c898: vmovss xmm1, dword ptr [rip + 0x548820] ; 0x100aa50c0
0x10055c8a0: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x10055c8a5: vmovss xmm14, dword ptr [rbp - 0x40]
0x10055c8aa: vmovaps xmm6, xmmword ptr [rip + 0x54b7ce] ; 0x100aa8080
0x10055c8b2: vmovss xmm12, dword ptr [rbp - 0x30]
0x10055c8b7: vaddss xmm1, xmm0, dword ptr [rip + 0x548801] ; 0x100aa50c0
0x10055c8bf: vcmpltss xmm2, xmm0, dword ptr [rip + 0x54a81c] ; 0x100aa70e4
0x10055c8c8: vblendvps xmm0, xmm0, xmm1, xmm2
0x10055c8ce: vmulss xmm0, xmm0, dword ptr [rbp - 0x3c]
0x10055c8d3: vcvttss2si rax, xmm0
0x10055c8d8: lea ecx, [rax + 1]
0x10055c8db: cmp r13d, eax
0x10055c8de: mov edx, 0
0x10055c8e3: cmove ecx, edx
0x10055c8e6: mov edx, eax
0x10055c8e8: test eax, eax
0x10055c8ea: cmove edx, dword ptr [rbp - 0x38]
0x10055c8ee: lea esi, [rcx + 1]
0x10055c8f1: mov edi, eax
0x10055c8f3: dec edx
0x10055c8f5: vcvtsi2ss xmm1, xmm11, rdi
0x10055c8fa: shl rdi, 4
0x10055c8fe: shl rcx, 4
0x10055c902: shl rdx, 4
0x10055c906: cmp r15d, eax
0x10055c909: vsubss xmm0, xmm0, xmm1
0x10055c90d: vmovaps xmm1, xmmword ptr [r12 + rdi]
0x10055c913: vmovaps xmm2, xmmword ptr [r12 + rdx]
0x10055c919: vmovaps xmm3, xmmword ptr [r12 + rcx]
0x10055c91f: mov eax, 0
0x10055c924: cmovne rax, rsi
0x10055c928: shl rax, 4
0x10055c92c: vaddps xmm4, xmm2, xmm2
0x10055c930: vmulps xmm5, xmm1, xmmword ptr [rip + 0x54ae48] ; 0x100aa7780
0x10055c938: vsubps xmm4, xmm4, xmm5
0x10055c93c: vmulps xmm5, xmm3, xmmword ptr [rip + 0x54b60c] ; 0x100aa7f50
0x10055c944: vaddps xmm4, xmm4, xmm5
0x10055c948: vmulps xmm5, xmm1, xmm6
0x10055c94c: vsubps xmm5, xmm5, xmm2
0x10055c950: vsubps xmm2, xmm3, xmm2
0x10055c954: vmulps xmm3, xmm3, xmm6
0x10055c958: vsubps xmm3, xmm5, xmm3
0x10055c95c: vmovaps xmm5, xmmword ptr [r12 + rax]
0x10055c962: vsubps xmm4, xmm4, xmm5
0x10055c966: vaddps xmm3, xmm5, xmm3
0x10055c96a: vpermilps xmm0, xmm0, 0xc0
0x10055c970: vmulps xmm3, xmm0, xmm3
0x10055c974: vaddps xmm3, xmm4, xmm3
0x10055c978: vmulps xmm3, xmm0, xmm3
0x10055c97c: vaddps xmm2, xmm2, xmm3
0x10055c980: vmulps xmm0, xmm0, xmm2
0x10055c984: vaddps xmm1, xmm1, xmm1
0x10055c988: vaddps xmm0, xmm1, xmm0
0x10055c98c: vmulps xmm3, xmm0, xmmword ptr [rip + 0x54acdc] ; 0x100aa7670
0x10055c994: vsubps xmm1, xmm3, xmmword ptr [rbp - 0x50]
0x10055c999: vmulps xmm1, xmm1, xmm1
0x10055c99d: vmovshdup xmm2, xmm1
0x10055c9a1: vaddss xmm2, xmm1, xmm2
0x10055c9a5: vpermilpd xmm1, xmm1, 1
0x10055c9ab: vaddss xmm1, xmm1, xmm2
0x10055c9af: vmovss xmm0, dword ptr [rbp - 0x2c]
0x10055c9b4: vsqrtss xmm1, xmm1, xmm1
0x10055c9b8: vaddss xmm0, xmm0, xmm1
0x10055c9bc: inc r14d
0x10055c9bf: cmp r14d, ebx
0x10055c9c2: vmovaps xmm5, xmm3
0x10055c9c6: jb 0x10055c880
0x10055c9cc: jmp 0x10055cb06 ; 0x10055cb06
0x10055c9d1: vcvtsi2ss xmm8, xmm11, r13
0x10055c9d6: xor eax, eax
0x10055c9d8: vmovss xmm9, dword ptr [rip + 0x5486e0] ; 0x100aa50c0
0x10055c9e0: vmovaps xmm10, xmmword ptr [rip + 0x54ad98] ; 0x100aa7780
0x10055c9e8: vmovaps xmm11, xmmword ptr [rip + 0x54b560] ; 0x100aa7f50
0x10055c9f0: vmovaps xmm13, xmmword ptr [rip + 0x54ac78] ; 0x100aa7670
0x10055c9f8: vxorps xmm0, xmm0, xmm0
0x10055c9fc: nop dword ptr [rax]
0x10055ca00: vaddss xmm12, xmm14, xmm12
0x10055ca05: vxorps xmm1, xmm1, xmm1
0x10055ca09: vmaxss xmm6, xmm1, xmm12
0x10055ca0e: vminss xmm6, xmm9, xmm6
0x10055ca12: vmulss xmm6, xmm6, xmm8
0x10055ca17: vcvttss2si rdx, xmm6
0x10055ca1c: cmp r13d, edx
0x10055ca1f: cmove edx, r15d
0x10055ca23: lea esi, [rdx + 1]
0x10055ca26: lea edi, [rdx - 1]
0x10055ca29: xor ecx, ecx
0x10055ca2b: cmp esi, r13d
0x10055ca2e: setne cl
0x10055ca31: test edx, edx
0x10055ca33: lea ecx, [rdx + rcx + 1]
0x10055ca37: vxorps xmm7, xmm7, xmm7
0x10055ca3b: vcvtsi2ss xmm7, xmm7, rdx
0x10055ca40: mov r8d, ebx
0x10055ca43: mov ebx, 0
0x10055ca48: vsubss xmm6, xmm6, xmm7
0x10055ca4c: cmovne rbx, rdi
0x10055ca50: shl rbx, 4
0x10055ca54: shl rdx, 4
0x10055ca58: vmovaps xmm7, xmmword ptr [r12 + rdx]
0x10055ca5e: shl rsi, 4
0x10055ca62: vmovaps xmm1, xmmword ptr [r12 + rsi]
0x10055ca68: shl rcx, 4
0x10055ca6c: vmovaps xmm2, xmmword ptr [r12 + rbx]
0x10055ca72: mov ebx, r8d
0x10055ca75: vaddps xmm3, xmm2, xmm2
0x10055ca79: vmulps xmm4, xmm7, xmm10
0x10055ca7e: vsubps xmm3, xmm3, xmm4
0x10055ca82: vmulps xmm4, xmm1, xmm11
0x10055ca87: vaddps xmm3, xmm3, xmm4
0x10055ca8b: vmulps xmm4, xmm7, xmm15
0x10055ca90: vsubps xmm4, xmm4, xmm2
0x10055ca94: vsubps xmm2, xmm1, xmm2
0x10055ca98: vmulps xmm1, xmm1, xmm15
0x10055ca9d: vsubps xmm1, xmm4, xmm1
0x10055caa1: vmovaps xmm4, xmmword ptr [r12 + rcx]
0x10055caa7: vsubps xmm3, xmm3, xmm4
0x10055caab: vaddps xmm1, xmm4, xmm1
0x10055caaf: vpermilps xmm4, xmm6, 0xc0
0x10055cab5: vmulps xmm1, xmm4, xmm1
0x10055cab9: vaddps xmm1, xmm3, xmm1
0x10055cabd: vmulps xmm1, xmm4, xmm1
0x10055cac1: vaddps xmm1, xmm2, xmm1
0x10055cac5: vmulps xmm1, xmm4, xmm1
0x10055cac9: vaddps xmm2, xmm7, xmm7
0x10055cacd: vaddps xmm1, xmm2, xmm1
0x10055cad1: vmulps xmm1, xmm1, xmm13
0x10055cad6: vsubps xmm2, xmm1, xmm5
0x10055cada: vmulps xmm2, xmm2, xmm2
0x10055cade: vmovshdup xmm3, xmm2
0x10055cae2: vaddss xmm3, xmm2, xmm3
0x10055cae6: vpermilpd xmm2, xmm2, 1
0x10055caec: vaddss xmm2, xmm2, xmm3
0x10055caf0: vsqrtss xmm2, xmm2, xmm2
0x10055caf4: vaddss xmm0, xmm0, xmm2
0x10055caf8: inc eax
0x10055cafa: cmp eax, ebx
0x10055cafc: vmovaps xmm5, xmm1
0x10055cb00: jb 0x10055ca00
0x10055cb06: add rsp, 0x28
0x10055cb0a: pop rbx
0x10055cb0b: pop r12
0x10055cb0d: pop r13
0x10055cb0f: pop r14
0x10055cb11: pop r15
0x10055cb13: pop rbp
0x10055cb14: ret 
0x10055cb15: nop word ptr cs:[rax + rax]
