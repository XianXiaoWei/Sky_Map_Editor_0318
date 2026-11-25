0x1007f2c20: push rbp
0x1007f2c21: mov rbp, rsp
0x1007f2c24: push rbx
0x1007f2c25: sub rsp, 0xc8
0x1007f2c2c: mov rbx, rdi
0x1007f2c2f: cmp byte ptr [rbx + 0xe0], 0
0x1007f2c36: je 0x1007f2e53
0x1007f2c3c: mov rdi, qword ptr [rbx + 0xc0]
0x1007f2c43: test rdi, rdi
0x1007f2c46: je 0x1007f2c79
0x1007f2c48: call 0x1007f2c20 ; 0x1007f2c20
0x1007f2c4d: mov rax, qword ptr [rbx + 0xc0]
0x1007f2c54: vmovaps xmm0, xmmword ptr [rax + 0x40]
0x1007f2c59: vmovaps xmm1, xmmword ptr [rax + 0x50]
0x1007f2c5e: vmovaps xmm2, xmmword ptr [rax + 0x60]
0x1007f2c63: vmovaps xmmword ptr [rbp - 0x30], xmm2
0x1007f2c68: vmovaps xmm2, xmmword ptr [rax + 0x70]
0x1007f2c6d: vmovaps xmmword ptr [rbp - 0x20], xmm2
0x1007f2c72: vmovaps xmm2, xmmword ptr [rax + 0x20]
0x1007f2c77: jmp 0x1007f2cab ; 0x1007f2cab
0x1007f2c79: vmovaps xmm0, xmmword ptr [rip + 0x2b5daf] ; 0x100aa8a30
0x1007f2c81: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x1007f2c86: vmovaps xmm0, xmmword ptr [rip + 0x2b5d72] ; 0x100aa8a00
0x1007f2c8e: vmovaps xmmword ptr [rbp - 0x20], xmm0
0x1007f2c93: vmovss xmm0, dword ptr [rip + 0x2b2425] ; 0x100aa50c0
0x1007f2c9b: vmovaps xmm2, xmmword ptr [rip + 0x2b7c1d] ; 0x100aaa8c0
0x1007f2ca3: vmovaps xmm1, xmmword ptr [rip + 0x2b53f5] ; 0x100aa80a0
0x1007f2cab: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1007f2cb0: vmovaps xmmword ptr [rbp - 0x40], xmm1
0x1007f2cb5: vmovaps xmm3, xmmword ptr [rbx]
0x1007f2cb9: vmulss xmm8, xmm2, xmm3
0x1007f2cbd: vmovshdup xmm1, xmm2
0x1007f2cc1: vmovshdup xmm4, xmm3
0x1007f2cc5: vmulss xmm9, xmm1, xmm4
0x1007f2cc9: vpermilpd xmm2, xmm2, 1
0x1007f2ccf: vpermilpd xmm3, xmm3, 1
0x1007f2cd5: vmulss xmm10, xmm2, xmm3
0x1007f2cd9: vmovaps xmm3, xmmword ptr [rbx + 0x30]
0x1007f2cde: vmovshdup xmm4, xmm3
0x1007f2ce2: vpermilpd xmm5, xmm3, 1
0x1007f2ce8: vpermilps xmm6, xmm3, 0xe7
0x1007f2cee: vaddss xmm7, xmm3, xmm3
0x1007f2cf2: vaddss xmm0, xmm4, xmm4
0x1007f2cf6: vaddss xmm1, xmm5, xmm5
0x1007f2cfa: vmulss xmm11, xmm3, xmm7
0x1007f2cfe: vmulss xmm2, xmm3, xmm0
0x1007f2d02: vmulss xmm3, xmm3, xmm1
0x1007f2d06: vmulss xmm7, xmm6, xmm7
0x1007f2d0a: vmulss xmm12, xmm4, xmm0
0x1007f2d0e: vmulss xmm4, xmm4, xmm1
0x1007f2d12: vmulss xmm0, xmm6, xmm0
0x1007f2d16: vmulss xmm5, xmm5, xmm1
0x1007f2d1a: vmulss xmm1, xmm6, xmm1
0x1007f2d1e: vmovss xmm13, dword ptr [rip + 0x2b239a] ; 0x100aa50c0
0x1007f2d26: vsubss xmm6, xmm13, xmm12
0x1007f2d2b: vsubss xmm14, xmm6, xmm5
0x1007f2d2f: vaddss xmm6, xmm2, xmm1
0x1007f2d33: vsubss xmm15, xmm3, xmm0
0x1007f2d37: vsubss xmm1, xmm2, xmm1
0x1007f2d3b: vsubss xmm2, xmm13, xmm11
0x1007f2d40: vsubss xmm5, xmm2, xmm5
0x1007f2d44: vaddss xmm11, xmm4, xmm7
0x1007f2d48: vaddss xmm0, xmm3, xmm0
0x1007f2d4c: vsubss xmm3, xmm4, xmm7
0x1007f2d50: vsubss xmm2, xmm2, xmm12
0x1007f2d55: vinsertps xmm4, xmm14, xmm6, 0x1c
0x1007f2d5b: vinsertps xmm4, xmm4, xmm15, 0x20
0x1007f2d61: vinsertps xmm1, xmm1, xmm5, 0x1c
0x1007f2d67: vinsertps xmm1, xmm1, xmm11, 0x20
0x1007f2d6d: vinsertps xmm0, xmm0, xmm3, 0x1c
0x1007f2d73: vinsertps xmm0, xmm0, xmm2, 0x20
0x1007f2d79: vbroadcastss ymm2, dword ptr [rbx + 0x10]
0x1007f2d7f: vmulps xmm2, xmm2, xmm4
0x1007f2d83: vbroadcastss ymm3, dword ptr [rbx + 0x14]
0x1007f2d89: vmulps xmm1, xmm3, xmm1
0x1007f2d8d: vbroadcastss ymm3, dword ptr [rbx + 0x18]
0x1007f2d93: vmulps xmm0, xmm3, xmm0
0x1007f2d97: vmovaps xmmword ptr [rbp - 0xd0], xmm2
0x1007f2d9f: vmovaps xmmword ptr [rbp - 0xc0], xmm1
0x1007f2da7: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x1007f2daf: vinsertps xmm0, xmm8, xmm9, 0x10
0x1007f2db5: vinsertps xmm0, xmm0, xmm10, 0x20
0x1007f2dbb: vinsertps xmm0, xmm0, xmm13, 0x30
0x1007f2dc1: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x1007f2dc9: lea rdi, [rbp - 0x90]
0x1007f2dd0: lea rsi, [rbp - 0x50]
0x1007f2dd4: lea rdx, [rbp - 0xd0]
0x1007f2ddb: vzeroupper 
0x1007f2dde: call 0x100076df0 ; 0x100076df0
0x1007f2de3: vmovaps xmm0, xmmword ptr [rbp - 0x90]
0x1007f2deb: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x1007f2df0: vmovaps xmm1, xmmword ptr [rbp - 0x80]
0x1007f2df5: vmovaps xmmword ptr [rbx + 0x50], xmm1
0x1007f2dfa: vmovaps xmm2, xmmword ptr [rbp - 0x70]
0x1007f2dff: vmovaps xmmword ptr [rbx + 0x60], xmm2
0x1007f2e04: vmovaps xmm3, xmmword ptr [rbp - 0x60]
0x1007f2e09: vmovaps xmmword ptr [rbx + 0x70], xmm3
0x1007f2e0e: vbroadcastss ymm4, dword ptr [rbx + 0x20]
0x1007f2e14: vmulps xmm0, xmm0, xmm4
0x1007f2e18: vbroadcastss ymm4, dword ptr [rbx + 0x24]
0x1007f2e1e: vmulps xmm1, xmm1, xmm4
0x1007f2e22: vbroadcastss ymm4, dword ptr [rbx + 0x28]
0x1007f2e28: vmulps xmm2, xmm2, xmm4
0x1007f2e2c: vmovaps xmmword ptr [rbx + 0x80], xmm0
0x1007f2e34: vmovaps xmmword ptr [rbx + 0x90], xmm1
0x1007f2e3c: vmovaps xmmword ptr [rbx + 0xa0], xmm2
0x1007f2e44: vmovaps xmmword ptr [rbx + 0xb0], xmm3
0x1007f2e4c: mov byte ptr [rbx + 0xe0], 0
0x1007f2e53: add rsp, 0xc8
0x1007f2e5a: pop rbx
0x1007f2e5b: pop rbp
0x1007f2e5c: vzeroupper 
0x1007f2e5f: ret 
