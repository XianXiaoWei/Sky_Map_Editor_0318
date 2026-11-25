0x1000e5ac0: push rbp
0x1000e5ac1: mov rbp, rsp
0x1000e5ac4: mov rax, qword ptr [rsi + 0xe0]
0x1000e5acb: movsxd rcx, ecx
0x1000e5ace: vmovaps xmm0, xmmword ptr [rdx]
0x1000e5ad2: vmovaps xmmword ptr [rdi], xmm0
0x1000e5ad6: test r8b, r8b
0x1000e5ad9: jne 0x1000e5b57
0x1000e5adb: vpermilps xmm1, xmm0, 0xe7
0x1000e5ae1: vpermilps xmm2, xmm0, 0xff
0x1000e5ae7: lea rdx, [rcx + rcx*8]
0x1000e5aeb: shl rdx, 4
0x1000e5aef: vmovaps xmm3, xmmword ptr [rax + rdx + 0x40]
0x1000e5af5: vmulps xmm2, xmm2, xmm3
0x1000e5af9: vpermilps xmm4, xmm3, 0xe7
0x1000e5aff: vpermilps xmm5, xmm3, 0xff
0x1000e5b05: vmulps xmm5, xmm0, xmm5
0x1000e5b09: vaddps xmm2, xmm2, xmm5
0x1000e5b0d: vpermilps xmm5, xmm0, 0xd2
0x1000e5b13: vmulps xmm5, xmm5, xmm3
0x1000e5b17: vpermilps xmm6, xmm3, 0xd2
0x1000e5b1d: vmulps xmm6, xmm0, xmm6
0x1000e5b21: vsubps xmm5, xmm5, xmm6
0x1000e5b25: vpermilps xmm5, xmm5, 0xd2
0x1000e5b2b: vaddps xmm2, xmm2, xmm5
0x1000e5b2f: vmulss xmm1, xmm1, xmm4
0x1000e5b33: vmulps xmm0, xmm0, xmm3
0x1000e5b37: vmovshdup xmm3, xmm0
0x1000e5b3b: vaddss xmm3, xmm0, xmm3
0x1000e5b3f: vpermilpd xmm0, xmm0, 1
0x1000e5b45: vaddss xmm0, xmm0, xmm3
0x1000e5b49: vsubss xmm0, xmm1, xmm0
0x1000e5b4d: vinsertps xmm0, xmm2, xmm0, 0x30
0x1000e5b53: vmovaps xmmword ptr [rdi], xmm0
0x1000e5b57: lea rcx, [rcx + rcx*8]
0x1000e5b5b: shl rcx, 4
0x1000e5b5f: cmp byte ptr [rax + rcx + 0x88], 0
0x1000e5b67: je 0x1000e5b99
0x1000e5b69: test r8b, r8b
0x1000e5b6c: je 0x1000e5bd1
0x1000e5b6e: vmovshdup xmm1, xmm0
0x1000e5b72: vmovaps xmm2, xmmword ptr [rip + 0x9c1d86] ; 0x100aa7900
0x1000e5b7a: vxorps xmm1, xmm1, xmm2
0x1000e5b7e: vinsertps xmm1, xmm0, xmm1, 0x10
0x1000e5b84: vpermilpd xmm0, xmm0, 1
0x1000e5b8a: vxorpd xmm0, xmm0, xmm2
0x1000e5b8e: vinsertps xmm0, xmm1, xmm0, 0x20
0x1000e5b94: jmp 0x1000e5d45 ; 0x1000e5d45
0x1000e5b99: vmovshdup xmm1, xmm0
0x1000e5b9d: vmovaps xmm2, xmmword ptr [rip + 0x9c1d5b] ; 0x100aa7900
0x1000e5ba5: vxorps xmm1, xmm1, xmm2
0x1000e5ba9: vinsertps xmm1, xmm0, xmm1, 0x10
0x1000e5baf: vpermilpd xmm0, xmm0, 1
0x1000e5bb5: vxorpd xmm0, xmm0, xmm2
0x1000e5bb9: vinsertps xmm0, xmm1, xmm0, 0x20
0x1000e5bbf: vmovaps xmmword ptr [rdi], xmm0
0x1000e5bc3: test r8b, r8b
0x1000e5bc6: je 0x1000e5cd5
0x1000e5bcc: mov rax, rdi
0x1000e5bcf: pop rbp
0x1000e5bd0: ret 
0x1000e5bd1: vmovaps xmm2, xmmword ptr [rax + rcx + 0x50]
0x1000e5bd7: vmovaps xmm1, xmmword ptr [rax + rcx + 0x60]
0x1000e5bdd: vpermilps xmm3, xmm2, 0xe7
0x1000e5be3: vpermilps xmm4, xmm2, 0xff
0x1000e5be9: vmulps xmm4, xmm4, xmm0
0x1000e5bed: vpermilps xmm5, xmm0, 0xe7
0x1000e5bf3: vpermilps xmm6, xmm0, 0xff
0x1000e5bf9: vmulps xmm6, xmm2, xmm6
0x1000e5bfd: vaddps xmm4, xmm4, xmm6
0x1000e5c01: vpermilps xmm6, xmm2, 0xd2
0x1000e5c07: vmulps xmm6, xmm6, xmm0
0x1000e5c0b: vpermilps xmm7, xmm0, 0xd2
0x1000e5c11: vmulps xmm7, xmm2, xmm7
0x1000e5c15: vsubps xmm6, xmm6, xmm7
0x1000e5c19: vpermilps xmm6, xmm6, 0xd2
0x1000e5c1f: vaddps xmm4, xmm4, xmm6
0x1000e5c23: vpermilpd xmm6, xmm4, 1
0x1000e5c29: vmovshdup xmm7, xmm4
0x1000e5c2d: vmulss xmm3, xmm3, xmm5
0x1000e5c31: vmulps xmm0, xmm2, xmm0
0x1000e5c35: vmovshdup xmm2, xmm0
0x1000e5c39: vaddss xmm2, xmm0, xmm2
0x1000e5c3d: vpermilpd xmm0, xmm0, 1
0x1000e5c43: vaddss xmm0, xmm0, xmm2
0x1000e5c47: vsubss xmm0, xmm3, xmm0
0x1000e5c4b: vmovaps xmm2, xmmword ptr [rip + 0x9c1cad] ; 0x100aa7900
0x1000e5c53: vxorps xmm3, xmm7, xmm2
0x1000e5c57: vinsertps xmm3, xmm4, xmm3, 0x10
0x1000e5c5d: vxorpd xmm2, xmm6, xmm2
0x1000e5c61: vinsertps xmm2, xmm3, xmm2, 0x20
0x1000e5c67: vinsertps xmm2, xmm2, xmm0, 0x30
0x1000e5c6d: vpermilps xmm3, xmm1, 0xe7
0x1000e5c73: vpermilps xmm4, xmm1, 0xff
0x1000e5c79: vmulps xmm4, xmm4, xmm2
0x1000e5c7d: vpermilps xmm5, xmm0, 0xc0
0x1000e5c83: vmulps xmm5, xmm1, xmm5
0x1000e5c87: vaddps xmm4, xmm4, xmm5
0x1000e5c8b: vpermilps xmm5, xmm1, 0xd2
0x1000e5c91: vmulps xmm5, xmm5, xmm2
0x1000e5c95: vpermilps xmm6, xmm2, 0xd2
0x1000e5c9b: vmulps xmm6, xmm1, xmm6
0x1000e5c9f: vsubps xmm5, xmm5, xmm6
0x1000e5ca3: vpermilps xmm5, xmm5, 0xd2
0x1000e5ca9: vaddps xmm4, xmm4, xmm5
0x1000e5cad: vmulss xmm0, xmm3, xmm0
0x1000e5cb1: vmulps xmm1, xmm1, xmm2
0x1000e5cb5: vmovshdup xmm2, xmm1
0x1000e5cb9: vaddss xmm2, xmm1, xmm2
0x1000e5cbd: vpermilpd xmm1, xmm1, 1
0x1000e5cc3: vaddss xmm1, xmm1, xmm2
0x1000e5cc7: vsubss xmm0, xmm0, xmm1
0x1000e5ccb: vinsertps xmm0, xmm4, xmm0, 0x30
0x1000e5cd1: vmovaps xmmword ptr [rdi], xmm0
0x1000e5cd5: vpermilps xmm1, xmm0, 0xe7
0x1000e5cdb: vpermilps xmm2, xmm0, 0xff
0x1000e5ce1: vmovaps xmm3, xmmword ptr [rax + rcx + 0x70]
0x1000e5ce7: vmulps xmm2, xmm2, xmm3
0x1000e5ceb: vpermilps xmm4, xmm3, 0xe7
0x1000e5cf1: vpermilps xmm5, xmm3, 0xff
0x1000e5cf7: vmulps xmm5, xmm0, xmm5
0x1000e5cfb: vaddps xmm2, xmm2, xmm5
0x1000e5cff: vpermilps xmm5, xmm0, 0xd2
0x1000e5d05: vmulps xmm5, xmm5, xmm3
0x1000e5d09: vpermilps xmm6, xmm3, 0xd2
0x1000e5d0f: vmulps xmm6, xmm0, xmm6
0x1000e5d13: vsubps xmm5, xmm5, xmm6
0x1000e5d17: vpermilps xmm5, xmm5, 0xd2
0x1000e5d1d: vaddps xmm2, xmm2, xmm5
0x1000e5d21: vmulss xmm1, xmm1, xmm4
0x1000e5d25: vmulps xmm0, xmm0, xmm3
0x1000e5d29: vmovshdup xmm3, xmm0
0x1000e5d2d: vaddss xmm3, xmm0, xmm3
0x1000e5d31: vpermilpd xmm0, xmm0, 1
0x1000e5d37: vaddss xmm0, xmm0, xmm3
0x1000e5d3b: vsubss xmm0, xmm1, xmm0
0x1000e5d3f: vinsertps xmm0, xmm2, xmm0, 0x30
0x1000e5d45: vmovaps xmmword ptr [rdi], xmm0
0x1000e5d49: mov rax, rdi
0x1000e5d4c: pop rbp
0x1000e5d4d: ret 
0x1000e5d4e: nop 
