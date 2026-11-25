0x10019b6f0: push rbp
0x10019b6f1: mov rbp, rsp
0x10019b6f4: push r15
0x10019b6f6: push r14
0x10019b6f8: push r13
0x10019b6fa: push r12
0x10019b6fc: push rbx
0x10019b6fd: sub rsp, 0x78
0x10019b701: mov qword ptr [rbp - 0x98], rsi
0x10019b708: mov rbx, rdi
0x10019b70b: mov rax, qword ptr [rip + 0xa721c6] ; 0x100c0d8d8
0x10019b712: mov rax, qword ptr [rax]
0x10019b715: mov qword ptr [rbp - 0x30], rax
0x10019b719: mov rdi, qword ptr [rbx + 0x80068]
0x10019b720: test rdi, rdi
0x10019b723: je 0x10019bb06
0x10019b729: cmp dword ptr [rbx + 0x80cf0], 0
0x10019b730: je 0x10019bb06
0x10019b736: cmp dword ptr [rdi + 0x190], 2
0x10019b73d: jne 0x10019bb2a
0x10019b743: cmp dword ptr [rdi + 0x120], 0x14
0x10019b74a: jne 0x10019bb49
0x10019b750: add rdi, 0x188
0x10019b757: call 0x100795060 ; 0x100795060
0x10019b75c: mov r12, rax
0x10019b75f: test r12, r12
0x10019b762: je 0x10019bb06
0x10019b768: mov rax, qword ptr [rbp - 0x98]
0x10019b76f: mov rax, qword ptr [rax + 0x70]
0x10019b773: vmovaps xmm0, xmmword ptr [rax + 0x1c0]
0x10019b77b: vmovaps xmm6, xmmword ptr [rax + 0x1d0]
0x10019b783: vmovapd xmm1, xmmword ptr [rax + 0x1e0]
0x10019b78b: vmovaps xmm2, xmmword ptr [rax + 0x1f0]
0x10019b793: vinsertps xmm3, xmm0, xmm6, 0x1c
0x10019b799: vunpcklpd xmm3, xmm3, xmm1
0x10019b79d: vinsertps xmm3, xmm3, xmm2, 0x30
0x10019b7a3: vinsertps xmm9, xmm6, xmm0, 0x4c
0x10019b7a9: vunpckhps xmm5, xmm0, xmm6
0x10019b7ad: vblendpd xmm5, xmm1, xmm5, 1
0x10019b7b3: vshufps xmm6, xmm6, xmm0, 0x33
0x10019b7b8: vshufps xmm0, xmm6, xmm0, 0xe2
0x10019b7bd: vinsertps xmm0, xmm0, xmm1, 0xe8
0x10019b7c3: vblendps xmm0, xmm0, xmm2, 8
0x10019b7c9: vaddps xmm7, xmm0, xmm3
0x10019b7cd: vmulps xmm6, xmm7, xmm7
0x10019b7d1: vmovshdup xmm4, xmm6
0x10019b7d5: vaddss xmm4, xmm6, xmm4
0x10019b7d9: vpermilpd xmm6, xmm6, 1
0x10019b7df: vaddss xmm6, xmm6, xmm4
0x10019b7e3: vxorps xmm8, xmm8, xmm8
0x10019b7e8: vucomiss xmm6, xmm8
0x10019b7ed: jbe 0x10019b7fd
0x10019b7ef: vsqrtss xmm4, xmm6, xmm6
0x10019b7f3: vpermilps xmm4, xmm4, 0
0x10019b7f9: vdivps xmm7, xmm7, xmm4
0x10019b7fd: vinsertps xmm4, xmm9, xmm1, 0x68
0x10019b803: vinsertps xmm1, xmm5, xmm2, 0xb0
0x10019b809: vmovaps xmmword ptr [rbp - 0x90], xmm7
0x10019b811: vsubps xmm3, xmm0, xmm3
0x10019b815: vmulps xmm5, xmm3, xmm3
0x10019b819: vmovshdup xmm6, xmm5
0x10019b81d: vaddss xmm6, xmm5, xmm6
0x10019b821: vpermilpd xmm5, xmm5, 1
0x10019b827: vaddss xmm5, xmm5, xmm6
0x10019b82b: vucomiss xmm5, xmm8
0x10019b830: jbe 0x10019b840
0x10019b832: vsqrtss xmm5, xmm5, xmm5
0x10019b836: vpermilps xmm5, xmm5, 0
0x10019b83c: vdivps xmm3, xmm3, xmm5
0x10019b840: vinsertps xmm2, xmm4, xmm2, 0x70
0x10019b846: vmovaps xmmword ptr [rbp - 0x80], xmm3
0x10019b84b: vaddps xmm4, xmm0, xmm1
0x10019b84f: vmulps xmm3, xmm4, xmm4
0x10019b853: vmovshdup xmm5, xmm3
0x10019b857: vaddss xmm5, xmm3, xmm5
0x10019b85b: vpermilpd xmm3, xmm3, 1
0x10019b861: vaddss xmm5, xmm3, xmm5
0x10019b865: vxorps xmm3, xmm3, xmm3
0x10019b869: vucomiss xmm5, xmm3
0x10019b86d: jbe 0x10019b87d
0x10019b86f: vsqrtss xmm5, xmm5, xmm5
0x10019b873: vpermilps xmm5, xmm5, 0
0x10019b879: vdivps xmm4, xmm4, xmm5
0x10019b87d: vmovaps xmmword ptr [rbp - 0x70], xmm4
0x10019b882: vaddps xmm4, xmm0, xmm2
0x10019b886: vmulps xmm5, xmm4, xmm4
0x10019b88a: vmovshdup xmm6, xmm5
0x10019b88e: vaddss xmm6, xmm5, xmm6
0x10019b892: vpermilpd xmm5, xmm5, 1
0x10019b898: vaddss xmm5, xmm5, xmm6
0x10019b89c: vucomiss xmm5, xmm3
0x10019b8a0: jbe 0x10019b8b0
0x10019b8a2: vsqrtss xmm3, xmm5, xmm5
0x10019b8a6: vpermilps xmm3, xmm3, 0
0x10019b8ac: vdivps xmm4, xmm4, xmm3
0x10019b8b0: vmovaps xmmword ptr [rbp - 0x60], xmm4
0x10019b8b5: vsubps xmm3, xmm0, xmm2
0x10019b8b9: vmulps xmm2, xmm3, xmm3
0x10019b8bd: vmovshdup xmm4, xmm2
0x10019b8c1: vaddss xmm4, xmm2, xmm4
0x10019b8c5: vpermilpd xmm2, xmm2, 1
0x10019b8cb: vaddss xmm4, xmm2, xmm4
0x10019b8cf: vxorps xmm2, xmm2, xmm2
0x10019b8d3: vucomiss xmm4, xmm2
0x10019b8d7: jbe 0x10019b8e7
0x10019b8d9: vsqrtss xmm4, xmm4, xmm4
0x10019b8dd: vpermilps xmm4, xmm4, 0
0x10019b8e3: vdivps xmm3, xmm3, xmm4
0x10019b8e7: vmovaps xmmword ptr [rbp - 0x50], xmm3
0x10019b8ec: vsubps xmm0, xmm0, xmm1
0x10019b8f0: vmulps xmm1, xmm0, xmm0
0x10019b8f4: vmovshdup xmm3, xmm1
0x10019b8f8: vaddss xmm3, xmm1, xmm3
0x10019b8fc: vpermilpd xmm1, xmm1, 1
0x10019b902: vaddss xmm1, xmm1, xmm3
0x10019b906: vucomiss xmm1, xmm2
0x10019b90a: jbe 0x10019b91a
0x10019b90c: vsqrtss xmm1, xmm1, xmm1
0x10019b910: vpermilps xmm1, xmm1, 0
0x10019b916: vdivps xmm0, xmm0, xmm1
0x10019b91a: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10019b91f: cmp dword ptr [rbx + 0x80cf0], 0
0x10019b926: je 0x10019baf8
0x10019b92c: mov r13d, 0x2800
0x10019b932: xor r15d, r15d
0x10019b935: nop word ptr cs:[rax + rax]
0x10019b940: mov r15d, r15d
0x10019b943: imul r14, r15, 0xc8
0x10019b94a: lea rdi, [rbx + r14 + 0x80070]
0x10019b952: mov rsi, qword ptr [rbp - 0x98]
0x10019b959: call 0x10019bdc0 ; 0x10019bdc0
0x10019b95e: vmovss xmm4, dword ptr [rip + 0x90975e] ; 0x100aa50c4
0x10019b966: mov eax, dword ptr [rbx + r14 + 0x80104]
0x10019b96e: cmp eax, r13d
0x10019b971: cmova eax, r13d
0x10019b975: mov r8d, 0
0x10019b97b: test eax, eax
0x10019b97d: je 0x10019bad0
0x10019b983: lea rcx, [rbx + r14 + 0x800f8]
0x10019b98b: mov edx, eax
0x10019b98d: xor esi, esi
0x10019b98f: xor edi, edi
0x10019b991: xor r8d, r8d
0x10019b994: nop word ptr cs:[rax + rax]
0x10019b9a0: mov rax, qword ptr [rcx]
0x10019b9a3: vmovaps xmm0, xmmword ptr [rax + rsi]
0x10019b9a8: vinsertps xmm1, xmm0, dword ptr [rip + 0x90970e], 0x30 ; 0x100aa50c0
0x10019b9b2: vmulps xmm2, xmm1, xmmword ptr [rbp - 0x90]
0x10019b9ba: vpermilpd xmm3, xmm2, 1
0x10019b9c0: vaddps xmm2, xmm2, xmm3
0x10019b9c4: vmovshdup xmm3, xmm2
0x10019b9c8: vaddss xmm2, xmm2, xmm3
0x10019b9cc: vucomiss xmm4, xmm2
0x10019b9d0: ja 0x10019bac0
0x10019b9d6: vmulps xmm2, xmm1, xmmword ptr [rbp - 0x80]
0x10019b9db: vpermilpd xmm3, xmm2, 1
0x10019b9e1: vaddps xmm2, xmm2, xmm3
0x10019b9e5: vmovshdup xmm3, xmm2
0x10019b9e9: vaddss xmm2, xmm2, xmm3
0x10019b9ed: vucomiss xmm4, xmm2
0x10019b9f1: ja 0x10019bac0
0x10019b9f7: vmulps xmm2, xmm1, xmmword ptr [rbp - 0x70]
0x10019b9fc: vpermilpd xmm3, xmm2, 1
0x10019ba02: vaddps xmm2, xmm2, xmm3
0x10019ba06: vmovshdup xmm3, xmm2
0x10019ba0a: vaddss xmm2, xmm2, xmm3
0x10019ba0e: vucomiss xmm4, xmm2
0x10019ba12: ja 0x10019bac0
0x10019ba18: vmulps xmm2, xmm1, xmmword ptr [rbp - 0x60]
0x10019ba1d: vpermilpd xmm3, xmm2, 1
0x10019ba23: vaddps xmm2, xmm2, xmm3
0x10019ba27: vmovshdup xmm3, xmm2
0x10019ba2b: vaddss xmm2, xmm2, xmm3
0x10019ba2f: vucomiss xmm4, xmm2
0x10019ba33: ja 0x10019bac0
0x10019ba39: vmulps xmm2, xmm1, xmmword ptr [rbp - 0x50]
0x10019ba3e: vpermilpd xmm3, xmm2, 1
0x10019ba44: vaddps xmm2, xmm2, xmm3
0x10019ba48: vmovshdup xmm3, xmm2
0x10019ba4c: vaddss xmm2, xmm2, xmm3
0x10019ba50: vucomiss xmm4, xmm2
0x10019ba54: ja 0x10019bac0
0x10019ba56: vmulps xmm1, xmm1, xmmword ptr [rbp - 0x40]
0x10019ba5b: vpermilpd xmm2, xmm1, 1
0x10019ba61: vaddps xmm1, xmm1, xmm2
0x10019ba65: vmovshdup xmm2, xmm1
0x10019ba69: vaddss xmm1, xmm1, xmm2
0x10019ba6d: vucomiss xmm4, xmm1
0x10019ba71: ja 0x10019bac0
0x10019ba73: mov r9, qword ptr [rcx - 0x20]
0x10019ba77: movzx r10d, word ptr [rax + rsi + 0x24]
0x10019ba7d: mov r11, rbx
0x10019ba80: mov ebx, r8d
0x10019ba83: lea rbx, [rbx + rbx*4]
0x10019ba87: vmovss dword ptr [r12 + rbx*4], xmm0
0x10019ba8d: vextractps dword ptr [r12 + rbx*4 + 4], xmm0, 1
0x10019ba95: vextractps dword ptr [r12 + rbx*4 + 8], xmm0, 2
0x10019ba9d: vmovss xmm0, dword ptr [rax + rsi + 0xc]
0x10019baa3: vmovss dword ptr [r12 + rbx*4 + 0xc], xmm0
0x10019baaa: shl r10, 6
0x10019baae: mov eax, dword ptr [r9 + r10 + 0x30]
0x10019bab3: mov dword ptr [r12 + rbx*4 + 0x10], eax
0x10019bab8: mov rbx, r11
0x10019babb: inc r8d
0x10019babe: nop 
0x10019bac0: inc rdi
0x10019bac3: add rsi, 0x30
0x10019bac7: cmp rdi, rdx
0x10019baca: jb 0x10019b9a0
0x10019bad0: sub r13d, r8d
0x10019bad3: mov eax, r8d
0x10019bad6: lea rax, [rax + rax*4]
0x10019bada: lea r12, [r12 + rax*4]
0x10019bade: inc r15d
0x10019bae1: cmp r15d, dword ptr [rbx + 0x80cf0]
0x10019bae8: jb 0x10019b940
0x10019baee: mov esi, 0x2800
0x10019baf3: sub esi, r13d
0x10019baf6: jmp 0x10019bafa ; 0x10019bafa
0x10019baf8: xor esi, esi
0x10019bafa: mov rdi, qword ptr [rbx + 0x80068]
0x10019bb01: call 0x100473d40 ; 0x100473d40
0x10019bb06: mov rax, qword ptr [rip + 0xa71dcb] ; 0x100c0d8d8
0x10019bb0d: mov rax, qword ptr [rax]
0x10019bb10: cmp rax, qword ptr [rbp - 0x30]
0x10019bb14: jne 0x10019bb25
0x10019bb16: add rsp, 0x78
0x10019bb1a: pop rbx
0x10019bb1b: pop r12
0x10019bb1d: pop r13
0x10019bb1f: pop r14
0x10019bb21: pop r15
0x10019bb23: pop rbp
0x10019bb24: ret 
0x10019bb25: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10019bb2a: lea rdi, [rip + 0x9db1ea] ; 0x100b76d1b m_vertexBuffers[ idx ].GetUsage() == Bind_Dynamic
0x10019bb31: lea rsi, [rip + 0x9c6743] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10019bb38: mov edx, 0x115
0x10019bb3d: mov ecx, 3
0x10019bb42: call 0x1007e5f70 ; 0x1007e5f70
0x10019bb47: ud2 
0x10019bb49: lea rdi, [rip + 0x9db1fd] ; 0x100b76d4d VsIsValidMap< BufferType >::Test( &m_format, idx )
0x10019bb50: lea rsi, [rip + 0x9c6724] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x10019bb57: mov edx, 0x116
0x10019bb5c: mov ecx, 3
0x10019bb61: call 0x1007e5f70 ; 0x1007e5f70
0x10019bb66: ud2 
0x10019bb68: nop dword ptr [rax + rax]
