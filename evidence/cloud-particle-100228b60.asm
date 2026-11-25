0x100228b60: push rbp
0x100228b61: mov rbp, rsp
0x100228b64: push r15
0x100228b66: push r14
0x100228b68: push r13
0x100228b6a: push r12
0x100228b6c: push rbx
0x100228b6d: push rax
0x100228b6e: mov rbx, r8
0x100228b71: vmovss dword ptr [rbp - 0x30], xmm2
0x100228b76: vmovss dword ptr [rbp - 0x2c], xmm1
0x100228b7b: mov r12, rcx
0x100228b7e: mov r14, rdx
0x100228b81: mov r15, rsi
0x100228b84: mov r13, rdi
0x100228b87: vdivss xmm0, xmm0, dword ptr [rip + 0x87df19] ; 0x100aa6aa8
0x100228b8f: vaddss xmm0, xmm0, dword ptr [r13 + 8]
0x100228b95: vmovss xmm1, dword ptr [rip + 0x87c523] ; 0x100aa50c0
0x100228b9d: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x100228ba2: vmovss xmm1, dword ptr [r13]
0x100228ba8: vaddss xmm1, xmm1, xmm1
0x100228bac: vmovss xmm5, dword ptr [rbp - 0x2c]
0x100228bb1: vdivss xmm1, xmm1, xmm5
0x100228bb5: vmovss xmm6, dword ptr [rip + 0x87c503] ; 0x100aa50c0
0x100228bbd: vminss xmm2, xmm6, xmm1
0x100228bc1: vcmpunordss xmm1, xmm1, xmm1
0x100228bc6: vandnps xmm2, xmm1, xmm2
0x100228bca: vandps xmm1, xmm1, xmm6
0x100228bce: vorps xmm1, xmm2, xmm1
0x100228bd2: vmulss xmm2, xmm1, dword ptr [r13 + 4]
0x100228bd8: vmulss xmm1, xmm1, xmm2
0x100228bdc: vmovss xmm7, dword ptr [rbp - 0x30]
0x100228be1: vsubss xmm2, xmm6, xmm7
0x100228be5: vmovss xmm3, dword ptr [rip + 0x87ebff] ; 0x100aa77ec
0x100228bed: vmulss xmm2, xmm2, xmm3
0x100228bf1: vdivss xmm2, xmm2, dword ptr [rip + 0x87ebef] ; 0x100aa77e8
0x100228bf9: vminss xmm4, xmm6, xmm2
0x100228bfd: vcmpunordss xmm2, xmm2, xmm2
0x100228c02: vandnps xmm4, xmm2, xmm4
0x100228c06: vandps xmm2, xmm2, xmm6
0x100228c0a: vorps xmm2, xmm4, xmm2
0x100228c0e: vmulss xmm3, xmm7, xmm3
0x100228c12: vdivss xmm3, xmm3, dword ptr [rip + 0x8805d2] ; 0x100aa91ec
0x100228c1a: vminss xmm4, xmm6, xmm3
0x100228c1e: vcmpunordss xmm3, xmm3, xmm3
0x100228c23: vandnps xmm4, xmm3, xmm4
0x100228c27: vandps xmm3, xmm3, xmm6
0x100228c2b: vorps xmm3, xmm4, xmm3
0x100228c2f: vmulss xmm2, xmm2, xmm3
0x100228c33: vmulss xmm1, xmm1, xmm2
0x100228c37: vaddss xmm2, xmm5, dword ptr [rip + 0x87fa59] ; 0x100aa8698
0x100228c3f: vdivss xmm2, xmm2, dword ptr [rip + 0x88917d] ; 0x100ab1dc4
0x100228c47: vxorps xmm3, xmm3, xmm3
0x100228c4b: vmaxss xmm2, xmm3, xmm2
0x100228c4f: vminss xmm2, xmm6, xmm2
0x100228c53: vmovss xmm3, dword ptr [r15]
0x100228c58: vmovss dword ptr [rbx], xmm3
0x100228c5c: vmovss xmm3, dword ptr [r15 + 4]
0x100228c62: vmovss dword ptr [rbx + 4], xmm3
0x100228c67: vmovss xmm3, dword ptr [r15 + 8]
0x100228c6d: vmovss dword ptr [rbx + 8], xmm3
0x100228c72: vmovaps xmm3, xmmword ptr [r12]
0x100228c78: vmovaps xmm8, xmmword ptr [rip + 0x8832a0] ; 0x100aabf20
0x100228c80: vdivps xmm3, xmm3, xmm8
0x100228c85: vxorps xmm9, xmm9, xmm9
0x100228c8a: vcmpleps xmm6, xmm9, xmm3
0x100228c8f: vmovaps xmm7, xmmword ptr [rip + 0x8890d9] ; 0x100ab1d70
0x100228c97: vmovaps xmm4, xmmword ptr [rip + 0x87f241] ; 0x100aa7ee0
0x100228c9f: vblendvps xmm4, xmm4, xmm7, xmm6
0x100228ca5: vmulss xmm0, xmm0, dword ptr [rip + 0x87f98b] ; 0x100aa8638
0x100228cad: vmulps xmm3, xmm4, xmm3
0x100228cb1: vmaxps xmm4, xmm3, xmmword ptr [rip + 0x8890c7] ; 0x100ab1d80
0x100228cb9: vblendps xmm3, xmm4, xmm3, 8
0x100228cbf: vminps xmm3, xmm3, xmm7
0x100228cc3: vcvttps2dq xmm3, xmm3
0x100228cc7: vpextrw word ptr [rbx + 0xc], xmm3, 0
0x100228cce: vpextrw word ptr [rbx + 0xe], xmm3, 2
0x100228cd5: vmulss xmm1, xmm2, xmm1
0x100228cd9: vpextrw word ptr [rbx + 0x10], xmm3, 4
0x100228ce0: mov word ptr [rbx + 0x12], 0
0x100228ce6: vdivss xmm2, xmm5, dword ptr [rip + 0x87e40a] ; 0x100aa70f8
0x100228cee: vmulss xmm0, xmm0, dword ptr [rip + 0x8890d2] ; 0x100ab1dc8
0x100228cf6: vmulss xmm1, xmm1, dword ptr [rip + 0x87b8ba] ; 0x100aa45b8
0x100228cfe: vunpcklps xmm0, xmm2, xmm0
0x100228d02: vinsertps xmm0, xmm0, xmm1, 0x28
0x100228d08: vmovaps xmm1, xmmword ptr [rip + 0x889080] ; 0x100ab1d90
0x100228d10: vmulps xmm0, xmm0, xmm1
0x100228d14: vmaxps xmm0, xmm0, xmm9
0x100228d19: vminps xmm0, xmm0, xmm1
0x100228d1d: vcvttps2dq xmm0, xmm0
0x100228d21: vpextrw word ptr [rbx + 0x14], xmm0, 0
0x100228d28: vpextrw word ptr [rbx + 0x16], xmm0, 2
0x100228d2f: vpextrw word ptr [rbx + 0x18], xmm0, 4
0x100228d36: vpextrw word ptr [rbx + 0x1a], xmm0, 6
0x100228d3d: vmovaps xmm0, xmmword ptr [r15]
0x100228d42: vsubps xmm0, xmm0, xmmword ptr [r14]
0x100228d47: vdivps xmm0, xmm0, xmm8
0x100228d4c: vcmpleps xmm1, xmm9, xmm0
0x100228d51: vmovaps xmm2, xmmword ptr [rip + 0x8884d7] ; 0x100ab1230
0x100228d59: vmovaps xmm3, xmmword ptr [rip + 0x888dcf] ; 0x100ab1b30
0x100228d61: vblendvps xmm1, xmm3, xmm2, xmm1
0x100228d67: vmulps xmm0, xmm1, xmm0
0x100228d6b: vmaxps xmm1, xmm0, xmmword ptr [rip + 0x888dcd] ; 0x100ab1b40
0x100228d73: vblendps xmm0, xmm1, xmm0, 8
0x100228d79: vminps xmm0, xmm0, xmm2
0x100228d7d: vcvttps2dq xmm0, xmm0
0x100228d81: vpextrb byte ptr [rbx + 0x1c], xmm0, 0
0x100228d88: vpextrb byte ptr [rbx + 0x1d], xmm0, 4
0x100228d8f: vpextrb byte ptr [rbx + 0x1e], xmm0, 8
0x100228d96: add rsp, 8
0x100228d9a: pop rbx
0x100228d9b: pop r12
0x100228d9d: pop r13
0x100228d9f: pop r14
0x100228da1: pop r15
0x100228da3: pop rbp
0x100228da4: ret 
0x100228da5: nop word ptr cs:[rax + rax]
