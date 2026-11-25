0x10033afa0: push rbp
0x10033afa1: mov rbp, rsp
0x10033afa4: push rbx
0x10033afa5: and rsp, 0xffffffffffffffe0
0x10033afa9: sub rsp, 0x260
0x10033afb0: mov rbx, rdi
0x10033afb3: mov rax, qword ptr [rip + 0x8d291e] ; 0x100c0d8d8
0x10033afba: mov rax, qword ptr [rax]
0x10033afbd: mov qword ptr [rsp + 0x240], rax
0x10033afc5: cmp byte ptr [rbx + 0x13e], 0
0x10033afcc: jne 0x10033b312
0x10033afd2: mov byte ptr [rbx + 0xb5], 1
0x10033afd9: mov word ptr [rbx + 0xb9], 0
0x10033afe2: mov dword ptr [rbx + 0x139], 0x1010000
0x10033afec: mov qword ptr [rbx + 0x110], 0
0x10033aff7: mov dword ptr [rbx + 0x118], 0
0x10033b001: mov word ptr [rbx + 0x13d], 0x101
0x10033b00a: mov byte ptr [rbx + 0x13f], 1
0x10033b011: mov qword ptr [rbx + 0x120], 0
0x10033b01c: vmovss xmm0, dword ptr [rip + 0x76c0d0] ; 0x100aa70f4
0x10033b024: vmovaps xmmword ptr [rbx + 0x50], xmm0
0x10033b029: vmovaps xmm0, xmmword ptr [rip + 0x76cfdf] ; 0x100aa8010
0x10033b031: vmovaps xmmword ptr [rbx + 0x60], xmm0
0x10033b036: vmovaps xmm0, xmmword ptr [rip + 0x76f8e2] ; 0x100aaa920
0x10033b03e: vmovaps xmmword ptr [rbx + 0x70], xmm0
0x10033b043: vmovaps xmm0, xmmword ptr [rip + 0x76d9b5] ; 0x100aa8a00
0x10033b04b: vmovaps xmmword ptr [rbx + 0x80], xmm0
0x10033b053: mov qword ptr [rbx + 0x148], rdx
0x10033b05a: cmp dword ptr [rbx + 0xbc], 7
0x10033b061: je 0x10033b1f8
0x10033b067: vxorps ymm0, ymm0, ymm0
0x10033b06b: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x10033b074: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x10033b07d: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x10033b086: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x10033b08f: vmovaps xmm1, xmmword ptr [rbx + 0xc0]
0x10033b097: vmovss xmm2, dword ptr [rbx + 0x108]
0x10033b09f: vmovss xmm3, dword ptr [rip + 0x76d509] ; 0x100aa85b0
0x10033b0a7: vcmpunordss xmm4, xmm2, xmm2
0x10033b0ac: vandps xmm5, xmm4, xmm3
0x10033b0b0: vmaxss xmm2, xmm3, xmm2
0x10033b0b4: vandnps xmm2, xmm4, xmm2
0x10033b0b8: vorps xmm2, xmm2, xmm5
0x10033b0bc: vmovss xmm3, dword ptr [rbx + 0x10c]
0x10033b0c4: vmulss xmm3, xmm3, dword ptr [rip + 0x76c028] ; 0x100aa70f4
0x10033b0cc: vaddss xmm3, xmm3, dword ptr [rip + 0x769fec] ; 0x100aa50c0
0x10033b0d4: vmulss xmm2, xmm2, xmm3
0x10033b0d8: vaddss xmm3, xmm2, xmm2
0x10033b0dc: vmulss xmm3, xmm3, dword ptr [rbx + 0xa8]
0x10033b0e4: mov byte ptr [rsp + 0x1cd], 1
0x10033b0ec: mov dword ptr [rsp + 0x1c0], 0x3f800000
0x10033b0f7: vmovaps xmmword ptr [rsp + 0x1d0], xmm1
0x10033b100: mov dword ptr [rsp + 0x208], 0
0x10033b10b: vmovss dword ptr [rsp + 0x20c], xmm3
0x10033b114: mov dword ptr [rsp + 0x21c], 0x3f800000
0x10033b11f: mov dword ptr [rsp + 0x230], 0x8c31
0x10033b12a: vmovaps ymmword ptr [rsp], ymm0
0x10033b12f: vmovaps ymmword ptr [rsp + 0x20], ymm0
0x10033b135: vmovups ymmword ptr [rsp + 0x18c], ymm0
0x10033b13e: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x10033b147: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x10033b150: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x10033b159: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x10033b162: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x10033b16b: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x10033b174: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x10033b17d: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x10033b186: vmovaps ymmword ptr [rsp + 0x80], ymm0
0x10033b18f: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x10033b195: vmovaps ymmword ptr [rsp + 0x40], ymm0
0x10033b19b: mov byte ptr [rsp], 0x3f
0x10033b19f: vmovss dword ptr [rsp + 0x20], xmm2
0x10033b1a5: mov eax, dword ptr [rbx + 0xac]
0x10033b1ab: mov byte ptr [rsp + 1], 0x32
0x10033b1b0: mov dword ptr [rsp + 0x24], eax
0x10033b1b4: mov dword ptr [rsp + 0x1a0], 3
0x10033b1bf: mov dword ptr [rsp + 0x1ac], 2
0x10033b1ca: lea rsi, [rip + 0x8464ca] ; 0x100b8169b fireloopalt3
0x10033b1d1: lea rax, [rsp + 0x1c0]
0x10033b1d9: mov rcx, rsp
0x10033b1dc: mov rdi, rdx
0x10033b1df: mov rdx, rax
0x10033b1e2: vzeroupper 
0x10033b1e5: call 0x1006018a0 ; 0x1006018a0
0x10033b1ea: mov qword ptr [rbx + 0x168], rax
0x10033b1f1: mov qword ptr [rbx + 0x170], rdx
0x10033b1f8: mov qword ptr [rbx + 0x100], 0
0x10033b203: mov dword ptr [rbx + 0x128], 0
0x10033b20d: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10033b212: vcvtsi2ss xmm0, xmm6, eax
0x10033b216: vmulss xmm0, xmm0, dword ptr [rip + 0x76bed2] ; 0x100aa70f0
0x10033b21e: vmovss xmm1, dword ptr [rip + 0x769e9a] ; 0x100aa50c0
0x10033b226: vsubss xmm1, xmm1, xmm0
0x10033b22a: vcvtss2sd xmm1, xmm1, xmm1
0x10033b22e: vxorps xmm2, xmm2, xmm2
0x10033b232: vmulsd xmm1, xmm1, xmm2
0x10033b236: vcvtss2sd xmm0, xmm0, xmm0
0x10033b23a: vaddsd xmm0, xmm1, xmm0
0x10033b23e: vcvtsd2ss xmm0, xmm0, xmm0
0x10033b242: vmovss dword ptr [rbx + 0xb0], xmm0
0x10033b24a: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10033b24f: vcvtsi2ss xmm0, xmm6, eax
0x10033b253: vmulss xmm0, xmm0, dword ptr [rip + 0x76be95] ; 0x100aa70f0
0x10033b25b: vmovss xmm1, dword ptr [rip + 0x769e5d] ; 0x100aa50c0
0x10033b263: vsubss xmm1, xmm1, xmm0
0x10033b267: vxorps xmm2, xmm2, xmm2
0x10033b26b: vmulss xmm1, xmm1, xmm2
0x10033b26f: vmovss xmm2, dword ptr [rip + 0x769341] ; 0x100aa45b8
0x10033b277: vmulss xmm0, xmm0, xmm2
0x10033b27b: vaddss xmm0, xmm0, xmm1
0x10033b27f: vaddss xmm0, xmm0, xmm2
0x10033b283: vmovss dword ptr [rbx + 0x130], xmm0
0x10033b28b: mov dword ptr [rbx + 0x134], 0
0x10033b295: vmovaps xmm0, xmmword ptr [rbx + 0x10]
0x10033b29a: vmovaps xmm1, xmmword ptr [rbx + 0x40]
0x10033b29f: vmovaps xmm2, xmmword ptr [rbx + 0xc0]
0x10033b2a7: vmovaps xmmword ptr [rbx + 0xd0], xmm2
0x10033b2af: vmovaps xmmword ptr [rbx + 0xc0], xmm1
0x10033b2b7: vmulps xmm0, xmm0, xmm0
0x10033b2bb: vmovshdup xmm1, xmm0
0x10033b2bf: vaddss xmm1, xmm0, xmm1
0x10033b2c3: vpermilpd xmm0, xmm0, 1
0x10033b2c9: vaddss xmm0, xmm0, xmm1
0x10033b2cd: vsqrtss xmm0, xmm0, xmm0
0x10033b2d1: vmulss xmm0, xmm0, dword ptr [rip + 0x76d2f7] ; 0x100aa85d0
0x10033b2d9: vaddss xmm0, xmm0, dword ptr [rip + 0x76d6d3] ; 0x100aa89b4
0x10033b2e1: vmovss dword ptr [rbx + 0x108], xmm0
0x10033b2e9: cmp byte ptr [rbx + 0xb6], 0
0x10033b2f0: je 0x10033b305
0x10033b2f2: mov byte ptr [rbx + 0xb6], 1
0x10033b2f9: mov dword ptr [rbx + 0x110], 0x3f800000
0x10033b303: jmp 0x10033b312 ; 0x10033b312
0x10033b305: mov esi, 1
0x10033b30a: mov rdi, rbx
0x10033b30d: call 0x10033a780 ; 0x10033a780
0x10033b312: mov rax, qword ptr [rip + 0x8d25bf] ; 0x100c0d8d8
0x10033b319: mov rax, qword ptr [rax]
0x10033b31c: cmp rax, qword ptr [rsp + 0x240]
0x10033b324: jne 0x10033b32d
0x10033b326: lea rsp, [rbp - 8]
0x10033b32a: pop rbx
0x10033b32b: pop rbp
0x10033b32c: ret 
0x10033b32d: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10033b332: nop word ptr cs:[rax + rax]
