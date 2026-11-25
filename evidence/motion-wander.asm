0x10062d010: push rbp
0x10062d011: mov rbp, rsp
0x10062d014: push r15
0x10062d016: push r14
0x10062d018: push rbx
0x10062d019: sub rsp, 0x118
0x10062d020: vmovss dword ptr [rbp - 0x30], xmm3
0x10062d025: vmovaps xmmword ptr [rbp - 0x50], xmm2
0x10062d02a: vmovaps xmmword ptr [rbp - 0x60], xmm1
0x10062d02f: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x10062d034: mov r15, rdx
0x10062d037: mov rbx, rsi
0x10062d03a: mov r14, rdi
0x10062d03d: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10062d042: vcvtsi2ss xmm0, xmm4, eax
0x10062d046: vmulss xmm0, xmm0, dword ptr [rip + 0x47a0a2] ; 0x100aa70f0
0x10062d04e: vsubss xmm1, xmm0, dword ptr [rip + 0x47806a] ; 0x100aa50c0
0x10062d056: vaddss xmm0, xmm0, xmm1
0x10062d05a: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10062d05f: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10062d064: vcvtsi2ss xmm0, xmm4, eax
0x10062d068: vmulss xmm0, xmm0, dword ptr [rip + 0x47a080] ; 0x100aa70f0
0x10062d070: vsubss xmm1, xmm0, dword ptr [rip + 0x478048] ; 0x100aa50c0
0x10062d078: vaddss xmm0, xmm0, xmm1
0x10062d07c: vmulss xmm0, xmm0, dword ptr [rbp - 0x30]
0x10062d081: vmovaps xmmword ptr [rbp - 0x30], xmm0
0x10062d086: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10062d08b: vcvtsi2ss xmm0, xmm4, eax
0x10062d08f: vmulss xmm0, xmm0, dword ptr [rip + 0x47a059] ; 0x100aa70f0
0x10062d097: vsubss xmm1, xmm0, dword ptr [rip + 0x478021] ; 0x100aa50c0
0x10062d09f: vaddss xmm0, xmm0, xmm1
0x10062d0a3: vmovaps xmm1, xmmword ptr [rbp - 0x40]
0x10062d0a8: vinsertps xmm1, xmm1, dword ptr [rbp - 0x30], 0x10
0x10062d0af: vinsertps xmm0, xmm1, xmm0, 0x20
0x10062d0b5: vpermilps xmm1, xmmword ptr [rbp - 0x50], 0xc0
0x10062d0bc: vmulps xmm0, xmm1, xmm0
0x10062d0c0: vaddps xmm0, xmm0, xmmword ptr [r15]
0x10062d0c5: vmovaps xmmword ptr [r15], xmm0
0x10062d0ca: vmulps xmm1, xmm0, xmm0
0x10062d0ce: vmovshdup xmm2, xmm1
0x10062d0d2: vaddss xmm2, xmm1, xmm2
0x10062d0d6: vpermilpd xmm1, xmm1, 1
0x10062d0dc: vaddss xmm1, xmm1, xmm2
0x10062d0e0: vsqrtss xmm1, xmm1, xmm1
0x10062d0e4: vucomiss xmm1, dword ptr [rip + 0x47a7d8] ; 0x100aa78c4
0x10062d0ec: jbe 0x10062d0f8
0x10062d0ee: vpermilps xmm1, xmm1, 0xc0
0x10062d0f4: vdivps xmm0, xmm0, xmm1
0x10062d0f8: vmovaps xmmword ptr [r15], xmm0
0x10062d0fd: vpermilps xmm1, xmmword ptr [rbp - 0x60], 0xc0
0x10062d104: vmulps xmm1, xmm1, xmmword ptr [rip + 0x47a814] ; 0x100aa7920
0x10062d10c: vpermilps xmm2, xmmword ptr [rbp - 0x70], 0xc0
0x10062d113: vmulps xmm0, xmm2, xmm0
0x10062d117: vaddps xmm0, xmm1, xmm0
0x10062d11b: vmovss xmm1, dword ptr [rip + 0x477f9d] ; 0x100aa50c0
0x10062d123: vinsertps xmm0, xmm0, xmm1, 0x30
0x10062d129: vmovaps xmmword ptr [rbp - 0xf0], xmm1
0x10062d131: vmovaps xmm2, xmmword ptr [rip + 0x47af67] ; 0x100aa80a0
0x10062d139: vmovaps xmmword ptr [rbp - 0xe0], xmm2
0x10062d141: vmovaps xmm2, xmmword ptr [rip + 0x47b8e7] ; 0x100aa8a30
0x10062d149: vmovaps xmmword ptr [rbp - 0xd0], xmm2
0x10062d151: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x10062d159: vxorps xmm0, xmm0, xmm0
0x10062d15d: vblendps xmm2, xmm0, xmmword ptr [rbx + 0x10], 7
0x10062d164: vmovaps xmmword ptr [rbp - 0xb0], xmm2
0x10062d16c: vblendps xmm2, xmm0, xmmword ptr [rbx + 0x20], 7
0x10062d173: vmovaps xmmword ptr [rbp - 0xa0], xmm2
0x10062d17b: vblendps xmm0, xmm0, xmmword ptr [rbx + 0x30], 7
0x10062d182: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x10062d18a: vmovaps xmm0, xmmword ptr [rbx]
0x10062d18e: vinsertps xmm0, xmm0, xmm1, 0x30
0x10062d194: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x10062d199: lea rdi, [rbp - 0x130]
0x10062d1a0: lea rsi, [rbp - 0xb0]
0x10062d1a7: lea rdx, [rbp - 0xf0]
0x10062d1ae: call 0x100076df0 ; 0x100076df0
0x10062d1b3: vmovaps xmm0, xmmword ptr [rbp - 0x100]
0x10062d1bb: vsubps xmm0, xmm0, xmmword ptr [rbx]
0x10062d1bf: vmulps xmm1, xmm0, xmm0
0x10062d1c3: vmovshdup xmm2, xmm1
0x10062d1c7: vaddss xmm2, xmm1, xmm2
0x10062d1cb: vpermilpd xmm1, xmm1, 1
0x10062d1d1: vaddss xmm1, xmm1, xmm2
0x10062d1d5: vsqrtss xmm1, xmm1, xmm1
0x10062d1d9: vucomiss xmm1, dword ptr [rip + 0x47a6e3] ; 0x100aa78c4
0x10062d1e1: jbe 0x10062d1ed
0x10062d1e3: vpermilps xmm1, xmm1, 0xc0
0x10062d1e9: vdivps xmm0, xmm0, xmm1
0x10062d1ed: vbroadcastss xmm1, dword ptr [rbx + 0x54]
0x10062d1f3: vmulps xmm0, xmm0, xmm1
0x10062d1f7: vsubps xmm0, xmm0, xmmword ptr [rbx + 0x40]
0x10062d1fc: vmovaps xmmword ptr [r14], xmm0
0x10062d201: mov rax, r14
0x10062d204: add rsp, 0x118
0x10062d20b: pop rbx
0x10062d20c: pop r14
0x10062d20e: pop r15
0x10062d210: pop rbp
0x10062d211: ret 
0x10062d212: nop word ptr cs:[rax + rax]
