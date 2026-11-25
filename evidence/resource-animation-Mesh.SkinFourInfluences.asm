0x100458bd0: push rbp
0x100458bd1: mov rbp, rsp
0x100458bd4: push rbx
0x100458bd5: test r9d, r9d
0x100458bd8: je 0x100458e39
0x100458bde: mov r10, qword ptr [rbp + 0x10]
0x100458be2: mov r9d, r9d
0x100458be5: xor r11d, r11d
0x100458be8: vmovss xmm8, dword ptr [rip + 0x658630] ; 0x100ab1220
0x100458bf0: movsx eax, byte ptr [rcx + r11]
0x100458bf5: vxorps xmm9, xmm9, xmm9
0x100458bfa: vcvtsi2ss xmm11, xmm9, eax
0x100458bfe: movsx eax, byte ptr [rcx + r11 + 1]
0x100458c04: vxorps xmm9, xmm9, xmm9
0x100458c09: vcvtsi2ss xmm12, xmm9, eax
0x100458c0d: movsx eax, byte ptr [rcx + r11 + 2]
0x100458c13: vxorps xmm9, xmm9, xmm9
0x100458c18: vcvtsi2ss xmm10, xmm9, eax
0x100458c1c: movzx eax, byte ptr [r8 + r11*2]
0x100458c21: shl rax, 6
0x100458c25: vmovaps xmm7, xmmword ptr [r10 + rax]
0x100458c2b: vmovaps xmm0, xmmword ptr [r10 + rax + 0x10]
0x100458c32: vmovaps xmm1, xmmword ptr [r10 + rax + 0x20]
0x100458c39: movzx ebx, byte ptr [r8 + r11*2 + 4]
0x100458c3f: vxorps xmm9, xmm9, xmm9
0x100458c44: vcvtsi2ss xmm2, xmm9, ebx
0x100458c48: vmulss xmm6, xmm2, xmm8
0x100458c4d: vbroadcastss xmm9, dword ptr [rsi + r11*4]
0x100458c53: vmulps xmm3, xmm9, xmm7
0x100458c57: vbroadcastss xmm13, dword ptr [rsi + r11*4 + 4]
0x100458c5e: vmulps xmm4, xmm0, xmm13
0x100458c63: vaddps xmm4, xmm4, xmm3
0x100458c67: vbroadcastss xmm15, dword ptr [rsi + r11*4 + 8]
0x100458c6e: vmulps xmm5, xmm1, xmm15
0x100458c73: vaddps xmm4, xmm5, xmm4
0x100458c77: vaddps xmm4, xmm4, xmmword ptr [r10 + rax + 0x30]
0x100458c7e: vpermilps xmm2, xmm6, 0xc0
0x100458c84: vmulps xmm14, xmm2, xmm4
0x100458c88: vpermilps xmm11, xmm11, 0
0x100458c8e: vmulps xmm6, xmm11, xmm7
0x100458c92: vpermilps xmm5, xmm12, 0
0x100458c98: vmulps xmm0, xmm0, xmm5
0x100458c9c: vaddps xmm0, xmm0, xmm6
0x100458ca0: vpermilps xmm6, xmm10, 0
0x100458ca6: vmulps xmm1, xmm1, xmm6
0x100458caa: vaddps xmm0, xmm1, xmm0
0x100458cae: vmulps xmm10, xmm0, xmm2
0x100458cb2: movzx eax, byte ptr [r8 + r11*2 + 1]
0x100458cb8: shl rax, 6
0x100458cbc: vmovaps xmm1, xmmword ptr [r10 + rax]
0x100458cc2: vmovaps xmm2, xmmword ptr [r10 + rax + 0x10]
0x100458cc9: vmovaps xmm7, xmmword ptr [r10 + rax + 0x20]
0x100458cd0: movzx ebx, byte ptr [r8 + r11*2 + 5]
0x100458cd6: vcvtsi2ss xmm0, xmm8, ebx
0x100458cda: vmulss xmm0, xmm0, xmm8
0x100458cdf: vmulps xmm3, xmm9, xmm1
0x100458ce3: vmulps xmm4, xmm2, xmm13
0x100458ce8: vaddps xmm3, xmm4, xmm3
0x100458cec: vmulps xmm4, xmm7, xmm15
0x100458cf1: vaddps xmm3, xmm4, xmm3
0x100458cf5: vaddps xmm3, xmm3, xmmword ptr [r10 + rax + 0x30]
0x100458cfc: vpermilps xmm0, xmm0, 0xc0
0x100458d02: vmulps xmm3, xmm0, xmm3
0x100458d06: vaddps xmm12, xmm14, xmm3
0x100458d0a: vmulps xmm1, xmm11, xmm1
0x100458d0e: vmulps xmm2, xmm2, xmm5
0x100458d12: vaddps xmm1, xmm2, xmm1
0x100458d16: vmulps xmm2, xmm7, xmm6
0x100458d1a: vaddps xmm1, xmm2, xmm1
0x100458d1e: vmulps xmm0, xmm1, xmm0
0x100458d22: vaddps xmm10, xmm10, xmm0
0x100458d26: movzx eax, byte ptr [r8 + r11*2 + 2]
0x100458d2c: shl rax, 6
0x100458d30: vmovaps xmm1, xmmword ptr [r10 + rax]
0x100458d36: vmovaps xmm2, xmmword ptr [r10 + rax + 0x10]
0x100458d3d: vmovaps xmm4, xmmword ptr [r10 + rax + 0x20]
0x100458d44: movzx ebx, byte ptr [r8 + r11*2 + 6]
0x100458d4a: vcvtsi2ss xmm7, xmm8, ebx
0x100458d4e: vmulss xmm7, xmm7, xmm8
0x100458d53: vmulps xmm0, xmm9, xmm1
0x100458d57: vmulps xmm3, xmm2, xmm13
0x100458d5c: vaddps xmm0, xmm3, xmm0
0x100458d60: vmulps xmm3, xmm4, xmm15
0x100458d65: vaddps xmm0, xmm3, xmm0
0x100458d69: vaddps xmm0, xmm0, xmmword ptr [r10 + rax + 0x30]
0x100458d70: vpermilps xmm3, xmm7, 0xc0
0x100458d76: vmulps xmm0, xmm3, xmm0
0x100458d7a: vaddps xmm12, xmm12, xmm0
0x100458d7e: vmulps xmm1, xmm11, xmm1
0x100458d82: vmulps xmm2, xmm2, xmm5
0x100458d86: vaddps xmm1, xmm2, xmm1
0x100458d8a: vmulps xmm2, xmm4, xmm6
0x100458d8e: vaddps xmm1, xmm2, xmm1
0x100458d92: vmulps xmm1, xmm1, xmm3
0x100458d96: vaddps xmm10, xmm10, xmm1
0x100458d9a: movzx eax, byte ptr [r8 + r11*2 + 3]
0x100458da0: shl rax, 6
0x100458da4: vmovaps xmm2, xmmword ptr [r10 + rax]
0x100458daa: vmovaps xmm3, xmmword ptr [r10 + rax + 0x10]
0x100458db1: vmovaps xmm4, xmmword ptr [r10 + rax + 0x20]
0x100458db8: movzx ebx, byte ptr [r8 + r11*2 + 7]
0x100458dbe: vcvtsi2ss xmm7, xmm8, ebx
0x100458dc2: vmulss xmm7, xmm7, xmm8
0x100458dc7: vmulps xmm0, xmm9, xmm2
0x100458dcb: vmulps xmm1, xmm3, xmm13
0x100458dd0: vaddps xmm0, xmm1, xmm0
0x100458dd4: vmulps xmm1, xmm4, xmm15
0x100458dd9: vaddps xmm0, xmm1, xmm0
0x100458ddd: vaddps xmm0, xmm0, xmmword ptr [r10 + rax + 0x30]
0x100458de4: vpermilps xmm1, xmm7, 0xc0
0x100458dea: vmulps xmm0, xmm1, xmm0
0x100458dee: vaddps xmm0, xmm12, xmm0
0x100458df2: vmulps xmm2, xmm11, xmm2
0x100458df6: vmulps xmm3, xmm3, xmm5
0x100458dfa: vaddps xmm2, xmm3, xmm2
0x100458dfe: vmulps xmm3, xmm4, xmm6
0x100458e02: vaddps xmm2, xmm3, xmm2
0x100458e06: vmulps xmm1, xmm2, xmm1
0x100458e0a: vaddps xmm1, xmm10, xmm1
0x100458e0e: vextractps dword ptr [rdi + r11*4 + 8], xmm0, 2
0x100458e16: vmovlps qword ptr [rdi + r11*4], xmm0
0x100458e1c: mov eax, dword ptr [rsi + r11*4 + 0xc]
0x100458e21: mov dword ptr [rdi + r11*4 + 0xc], eax
0x100458e26: vmovaps xmmword ptr [rdx + r11*4], xmm1
0x100458e2c: add r11, 4
0x100458e30: dec r9
0x100458e33: jne 0x100458bf0
0x100458e39: pop rbx
0x100458e3a: pop rbp
0x100458e3b: ret 
0x100458e3c: nop dword ptr [rax]
