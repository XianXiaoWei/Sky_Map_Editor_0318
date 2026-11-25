0x1006a2630: push rbp
0x1006a2631: mov rbp, rsp
0x1006a2634: push r15
0x1006a2636: push r14
0x1006a2638: push r13
0x1006a263a: push r12
0x1006a263c: push rbx
0x1006a263d: and rsp, 0xffffffffffffffe0
0x1006a2641: sub rsp, 0x1c0
0x1006a2648: mov qword ptr [rsp + 0x28], rdx
0x1006a264d: mov r14, rsi
0x1006a2650: mov rbx, rdi
0x1006a2653: mov rax, qword ptr [rip + 0x56b27e] ; 0x100c0d8d8
0x1006a265a: mov rax, qword ptr [rax]
0x1006a265d: mov qword ptr [rsp + 0x1a0], rax
0x1006a2665: vxorps ymm0, ymm0, ymm0
0x1006a2669: vmovups ymmword ptr [rsp + 0xd0], ymm0
0x1006a2672: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x1006a267b: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x1006a2684: cmp byte ptr [rip + 0x660419], 0 ; 0x100d02aa4
0x1006a268b: je 0x1006a29e3
0x1006a2691: lea rdi, [rsp + 0x120]
0x1006a2699: mov rsi, r14
0x1006a269c: vzeroupper 
0x1006a269f: call 0x10076be90 ; 0x10076be90
0x1006a26a4: vmovss xmm0, dword ptr [rsp + 0x120]
0x1006a26ad: vmovss dword ptr [rsp + 0x18], xmm0
0x1006a26b3: lea rdi, [rsp + 0x110]
0x1006a26bb: mov rsi, r14
0x1006a26be: call 0x10076be90 ; 0x10076be90
0x1006a26c3: vmovss xmm0, dword ptr [rsp + 0x18]
0x1006a26c9: vucomiss xmm0, dword ptr [rsp + 0x110]
0x1006a26d2: jne 0x1006a29e3
0x1006a26d8: jp 0x1006a29e3
0x1006a26de: mov eax, dword ptr [r14]
0x1006a26e1: mov dword ptr [rbx + 0x10], eax
0x1006a26e4: mov eax, dword ptr [r14 + 0x14]
0x1006a26e8: mov dword ptr [rbx + 0x24], eax
0x1006a26eb: vmovups xmm0, xmmword ptr [r14 + 4]
0x1006a26f1: vmovups xmmword ptr [rbx + 0x14], xmm0
0x1006a26f6: vmovaps xmm0, xmmword ptr [r14 + 0x20]
0x1006a26fc: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x1006a2701: vmovaps xmm0, xmmword ptr [r14 + 0x30]
0x1006a2707: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x1006a270c: vmovaps xmm0, xmmword ptr [r14 + 0x40]
0x1006a2712: vmovaps xmmword ptr [rbx + 0x50], xmm0
0x1006a2717: vmovaps xmm0, xmmword ptr [r14 + 0x50]
0x1006a271d: vmovaps xmmword ptr [rbx + 0x60], xmm0
0x1006a2722: vmovaps xmm0, xmmword ptr [r14 + 0x60]
0x1006a2728: vmovaps xmmword ptr [rbx + 0x70], xmm0
0x1006a272d: vmovaps xmm0, xmmword ptr [r14 + 0x70]
0x1006a2733: vmovaps xmmword ptr [rbx + 0x80], xmm0
0x1006a273b: vmovaps xmm0, xmmword ptr [r14 + 0x80]
0x1006a2744: vmovaps xmmword ptr [rbx + 0x90], xmm0
0x1006a274c: vmovaps xmm0, xmmword ptr [r14 + 0x90]
0x1006a2755: vmovaps xmmword ptr [rbx + 0xa0], xmm0
0x1006a275d: vmovaps xmm0, xmmword ptr [r14 + 0xa0]
0x1006a2766: vmovaps xmmword ptr [rbx + 0xb0], xmm0
0x1006a276e: vmovaps xmm0, xmmword ptr [r14 + 0xb0]
0x1006a2777: vmovaps xmmword ptr [rbx + 0xc0], xmm0
0x1006a277f: vmovaps xmm0, xmmword ptr [r14 + 0xc0]
0x1006a2788: vmovaps xmmword ptr [rbx + 0xd0], xmm0
0x1006a2790: vmovaps xmm0, xmmword ptr [r14 + 0xd0]
0x1006a2799: vmovaps xmmword ptr [rbx + 0xe0], xmm0
0x1006a27a1: vmovaps xmm0, xmmword ptr [r14 + 0xe0]
0x1006a27aa: vmovaps xmmword ptr [rbx + 0xf0], xmm0
0x1006a27b2: vmovaps xmm0, xmmword ptr [r14 + 0xf0]
0x1006a27bb: vmovaps xmmword ptr [rbx + 0x100], xmm0
0x1006a27c3: vmovaps xmm0, xmmword ptr [r14 + 0x100]
0x1006a27cc: vmovaps xmmword ptr [rbx + 0x110], xmm0
0x1006a27d4: vmovaps xmm0, xmmword ptr [r14 + 0x110]
0x1006a27dd: vmovaps xmmword ptr [rbx + 0x120], xmm0
0x1006a27e5: vmovaps xmm0, xmmword ptr [r14 + 0x120]
0x1006a27ee: vmovaps xmmword ptr [rbx + 0x130], xmm0
0x1006a27f6: vmovaps xmm0, xmmword ptr [r14 + 0x130]
0x1006a27ff: vmovaps xmmword ptr [rbx + 0x140], xmm0
0x1006a2807: vmovaps xmm0, xmmword ptr [r14 + 0x140]
0x1006a2810: vmovaps xmmword ptr [rbx + 0x150], xmm0
0x1006a2818: vmovaps xmm0, xmmword ptr [r14 + 0x150]
0x1006a2821: vmovaps xmmword ptr [rbx + 0x160], xmm0
0x1006a2829: vmovaps xmm0, xmmword ptr [r14 + 0x160]
0x1006a2832: vmovaps xmmword ptr [rbx + 0x170], xmm0
0x1006a283a: vmovaps xmm0, xmmword ptr [r14 + 0x170]
0x1006a2843: vmovaps xmmword ptr [rbx + 0x180], xmm0
0x1006a284b: vmovaps xmm0, xmmword ptr [r14 + 0x180]
0x1006a2854: vmovaps xmmword ptr [rbx + 0x190], xmm0
0x1006a285c: vmovaps xmm0, xmmword ptr [r14 + 0x190]
0x1006a2865: vmovaps xmmword ptr [rbx + 0x1a0], xmm0
0x1006a286d: vmovaps xmm0, xmmword ptr [r14 + 0x1a0]
0x1006a2876: vmovaps xmmword ptr [rbx + 0x1b0], xmm0
0x1006a287e: vmovaps xmm0, xmmword ptr [r14 + 0x1b0]
0x1006a2887: vmovaps xmmword ptr [rbx + 0x1c0], xmm0
0x1006a288f: vmovaps xmm0, xmmword ptr [r14 + 0x1c0]
0x1006a2898: vmovaps xmmword ptr [rbx + 0x1d0], xmm0
0x1006a28a0: vmovaps xmm0, xmmword ptr [r14 + 0x1d0]
0x1006a28a9: vmovaps xmmword ptr [rbx + 0x1e0], xmm0
0x1006a28b1: vmovaps xmm0, xmmword ptr [r14 + 0x1e0]
0x1006a28ba: vmovaps xmmword ptr [rbx + 0x1f0], xmm0
0x1006a28c2: vmovaps xmm0, xmmword ptr [r14 + 0x1f0]
0x1006a28cb: vmovaps xmmword ptr [rbx + 0x200], xmm0
0x1006a28d3: vmovaps xmm0, xmmword ptr [r14 + 0x200]
0x1006a28dc: vmovaps xmmword ptr [rbx + 0x210], xmm0
0x1006a28e4: vmovaps xmm0, xmmword ptr [r14 + 0x210]
0x1006a28ed: vmovaps xmmword ptr [rbx + 0x220], xmm0
0x1006a28f5: vmovaps xmm0, xmmword ptr [r14 + 0x220]
0x1006a28fe: vmovaps xmmword ptr [rbx + 0x230], xmm0
0x1006a2906: vmovaps xmm0, xmmword ptr [r14 + 0x230]
0x1006a290f: vmovaps xmmword ptr [rbx + 0x240], xmm0
0x1006a2917: vmovaps xmm0, xmmword ptr [r14 + 0x240]
0x1006a2920: vmovaps xmmword ptr [rbx + 0x250], xmm0
0x1006a2928: vmovaps xmm0, xmmword ptr [r14 + 0x250]
0x1006a2931: vmovaps xmmword ptr [rbx + 0x260], xmm0
0x1006a2939: vmovaps xmm0, xmmword ptr [r14 + 0x260]
0x1006a2942: vmovaps xmmword ptr [rbx + 0x270], xmm0
0x1006a294a: vmovaps xmm0, xmmword ptr [r14 + 0x270]
0x1006a2953: vmovaps xmmword ptr [rbx + 0x280], xmm0
0x1006a295b: vmovaps xmm0, xmmword ptr [r14 + 0x280]
0x1006a2964: vmovaps xmmword ptr [rbx + 0x290], xmm0
0x1006a296c: vmovaps xmm0, xmmword ptr [r14 + 0x290]
0x1006a2975: vmovaps xmmword ptr [rbx + 0x2a0], xmm0
0x1006a297d: vmovaps xmm0, xmmword ptr [r14 + 0x2a0]
0x1006a2986: vmovaps xmmword ptr [rbx + 0x2b0], xmm0
0x1006a298e: vmovaps xmm0, xmmword ptr [r14 + 0x2b0]
0x1006a2997: vmovaps xmmword ptr [rbx + 0x2c0], xmm0
0x1006a299f: vmovaps xmm0, xmmword ptr [r14 + 0x2c0]
0x1006a29a8: vmovaps xmmword ptr [rbx + 0x2d0], xmm0
0x1006a29b0: vmovaps xmm0, xmmword ptr [r14 + 0x2d0]
0x1006a29b9: vmovaps xmmword ptr [rbx + 0x2e0], xmm0
0x1006a29c1: vmovaps xmm0, xmmword ptr [r14 + 0x2e0]
0x1006a29ca: vmovaps xmmword ptr [rbx + 0x2f0], xmm0
0x1006a29d2: vmovaps xmm0, xmmword ptr [r14 + 0x2f0]
0x1006a29db: vmovaps xmmword ptr [rbx + 0x300], xmm0
0x1006a29e3: lea r12, [rbx + 0x10]
0x1006a29e7: lea rdi, [rsp + 0x100]
0x1006a29ef: mov rsi, r12
0x1006a29f2: vzeroupper 
0x1006a29f5: call 0x10076be90 ; 0x10076be90
0x1006a29fa: inc dword ptr [rbx + 0x594]
0x1006a2a00: mov r14d, dword ptr [rbx + 0xe6c78]
0x1006a2a07: call 0x1007c6c20 ; 0x1007c6c20
0x1006a2a0c: shl r14, 3
0x1006a2a10: lea rcx, [rip + 0x19a6139] ; 0x102048b50
0x1006a2a17: mov rdx, qword ptr [rcx]
0x1006a2a1a: mov ecx, 8
0x1006a2a1f: mov rdi, rax
0x1006a2a22: mov rsi, r14
0x1006a2a25: call 0x100795530 ; 0x100795530
0x1006a2a2a: mov qword ptr [rsp + 0x40], rax
0x1006a2a2f: vmovaps xmm0, xmmword ptr [rbx + 0x1d0]
0x1006a2a37: vmovaps xmm6, xmmword ptr [rbx + 0x1e0]
0x1006a2a3f: vmovapd xmm1, xmmword ptr [rbx + 0x1f0]
0x1006a2a47: mov qword ptr [rsp + 0x18], rbx
0x1006a2a4c: vmovaps xmm2, xmmword ptr [rbx + 0x200]
0x1006a2a54: vinsertps xmm3, xmm0, xmm6, 0x1c
0x1006a2a5a: vunpcklpd xmm3, xmm3, xmm1
0x1006a2a5e: vinsertps xmm3, xmm3, xmm2, 0x30
0x1006a2a64: vinsertps xmm9, xmm6, xmm0, 0x4c
0x1006a2a6a: vunpckhps xmm5, xmm0, xmm6
0x1006a2a6e: vblendpd xmm5, xmm1, xmm5, 1
0x1006a2a74: vshufps xmm6, xmm6, xmm0, 0x33
0x1006a2a79: vshufps xmm0, xmm6, xmm0, 0xe2
0x1006a2a7e: vinsertps xmm0, xmm0, xmm1, 0xe8
0x1006a2a84: vblendps xmm0, xmm0, xmm2, 8
0x1006a2a8a: vaddps xmm7, xmm0, xmm3
0x1006a2a8e: vmulps xmm6, xmm7, xmm7
0x1006a2a92: vmovshdup xmm4, xmm6
0x1006a2a96: vaddss xmm4, xmm6, xmm4
0x1006a2a9a: vpermilpd xmm6, xmm6, 1
0x1006a2aa0: vaddss xmm6, xmm6, xmm4
0x1006a2aa4: vpxor xmm8, xmm8, xmm8
0x1006a2aa9: vucomiss xmm6, xmm8
0x1006a2aae: jbe 0x1006a2abe
0x1006a2ab0: vsqrtss xmm4, xmm6, xmm6
0x1006a2ab4: vpermilps xmm4, xmm4, 0
0x1006a2aba: vdivps xmm7, xmm7, xmm4
0x1006a2abe: vinsertps xmm4, xmm9, xmm1, 0x68
0x1006a2ac4: vinsertps xmm1, xmm5, xmm2, 0xb0
0x1006a2aca: vmovaps xmmword ptr [rsp + 0x140], xmm7
0x1006a2ad3: vsubps xmm3, xmm0, xmm3
0x1006a2ad7: vmulps xmm5, xmm3, xmm3
0x1006a2adb: vmovshdup xmm6, xmm5
0x1006a2adf: vaddss xmm6, xmm5, xmm6
0x1006a2ae3: vpermilpd xmm5, xmm5, 1
0x1006a2ae9: vaddss xmm5, xmm5, xmm6
0x1006a2aed: vucomiss xmm5, xmm8
0x1006a2af2: jbe 0x1006a2b02
0x1006a2af4: vsqrtss xmm5, xmm5, xmm5
0x1006a2af8: vpermilps xmm5, xmm5, 0
0x1006a2afe: vdivps xmm3, xmm3, xmm5
0x1006a2b02: vinsertps xmm2, xmm4, xmm2, 0x70
0x1006a2b08: vmovaps xmmword ptr [rsp + 0x150], xmm3
0x1006a2b11: vaddps xmm4, xmm0, xmm1
0x1006a2b15: vmulps xmm3, xmm4, xmm4
0x1006a2b19: vmovshdup xmm5, xmm3
0x1006a2b1d: vaddss xmm5, xmm3, xmm5
0x1006a2b21: vpermilpd xmm3, xmm3, 1
0x1006a2b27: vaddss xmm5, xmm3, xmm5
0x1006a2b2b: vxorps xmm3, xmm3, xmm3
0x1006a2b2f: vucomiss xmm5, xmm3
0x1006a2b33: jbe 0x1006a2b43
0x1006a2b35: vsqrtss xmm5, xmm5, xmm5
0x1006a2b39: vpermilps xmm5, xmm5, 0
0x1006a2b3f: vdivps xmm4, xmm4, xmm5
0x1006a2b43: vmovaps xmmword ptr [rsp + 0x160], xmm4
0x1006a2b4c: vaddps xmm4, xmm0, xmm2
0x1006a2b50: vmulps xmm5, xmm4, xmm4
0x1006a2b54: vmovshdup xmm6, xmm5
0x1006a2b58: vaddss xmm6, xmm5, xmm6
0x1006a2b5c: vpermilpd xmm5, xmm5, 1
0x1006a2b62: vaddss xmm5, xmm5, xmm6
0x1006a2b66: vucomiss xmm5, xmm3
0x1006a2b6a: jbe 0x1006a2b7a
0x1006a2b6c: vsqrtss xmm3, xmm5, xmm5
0x1006a2b70: vpermilps xmm3, xmm3, 0
0x1006a2b76: vdivps xmm4, xmm4, xmm3
0x1006a2b7a: vmovaps xmmword ptr [rsp + 0x170], xmm4
0x1006a2b83: vsubps xmm3, xmm0, xmm2
0x1006a2b87: vmulps xmm2, xmm3, xmm3
0x1006a2b8b: vmovshdup xmm4, xmm2
0x1006a2b8f: vaddss xmm4, xmm2, xmm4
0x1006a2b93: vpermilpd xmm2, xmm2, 1
0x1006a2b99: vaddss xmm4, xmm2, xmm4
0x1006a2b9d: vxorps xmm2, xmm2, xmm2
0x1006a2ba1: vucomiss xmm4, xmm2
0x1006a2ba5: jbe 0x1006a2bb5
0x1006a2ba7: vsqrtss xmm4, xmm4, xmm4
0x1006a2bab: vpermilps xmm4, xmm4, 0
0x1006a2bb1: vdivps xmm3, xmm3, xmm4
0x1006a2bb5: vmovaps xmmword ptr [rsp + 0x180], xmm3
0x1006a2bbe: vsubps xmm0, xmm0, xmm1
0x1006a2bc2: vmulps xmm1, xmm0, xmm0
0x1006a2bc6: vmovshdup xmm3, xmm1
0x1006a2bca: vaddss xmm3, xmm1, xmm3
0x1006a2bce: vpermilpd xmm1, xmm1, 1
0x1006a2bd4: vaddss xmm1, xmm1, xmm3
0x1006a2bd8: vucomiss xmm1, xmm2
0x1006a2bdc: jbe 0x1006a2bec
0x1006a2bde: vsqrtss xmm1, xmm1, xmm1
0x1006a2be2: vpermilps xmm1, xmm1, 0
0x1006a2be8: vdivps xmm0, xmm0, xmm1
0x1006a2bec: vmovaps xmmword ptr [rsp + 0x190], xmm0
0x1006a2bf5: mov rax, qword ptr [rsp + 0x18]
0x1006a2bfa: mov ebx, dword ptr [rax + 0xe6c78]
0x1006a2c00: call 0x1007c6c20 ; 0x1007c6c20
0x1006a2c05: shl rbx, 2
0x1006a2c09: lea rcx, [rip + 0x19a5f40] ; 0x102048b50
0x1006a2c10: mov rdx, qword ptr [rcx]
0x1006a2c13: mov ecx, 4
0x1006a2c18: mov rdi, rax
0x1006a2c1b: mov rsi, rbx
0x1006a2c1e: call 0x100795530 ; 0x100795530
0x1006a2c23: mov r15, rax
0x1006a2c26: mov rax, qword ptr [rsp + 0x18]
0x1006a2c2b: mov r14d, dword ptr [rax + 0xe6c78]
0x1006a2c32: call 0x1007c6c20 ; 0x1007c6c20
0x1006a2c37: shl r14, 4
0x1006a2c3b: lea rcx, [rip + 0x19a5f0e] ; 0x102048b50
0x1006a2c42: mov rdx, qword ptr [rcx]
0x1006a2c45: mov ecx, 0x10
0x1006a2c4a: mov rdi, rax
0x1006a2c4d: mov rsi, r14
0x1006a2c50: call 0x100795530 ; 0x100795530
0x1006a2c55: mov qword ptr [rsp + 0x20], rax
0x1006a2c5a: mov qword ptr [rsp + 0x50], r12
0x1006a2c5f: mov rax, qword ptr [rsp + 0x18]
0x1006a2c64: cmp dword ptr [rax + 0xe6c78], 0
0x1006a2c6b: je 0x1006a2d05
0x1006a2c71: xor r12d, r12d
0x1006a2c74: lea r14, [rsp + 0x140]
0x1006a2c7c: xor ebx, ebx
0x1006a2c7e: mov rax, qword ptr [rsp + 0x18]
0x1006a2c83: nop word ptr cs:[rax + rax]
0x1006a2c90: mov ebx, ebx
0x1006a2c92: mov r13, qword ptr [rax + rbx*8 + 0xe6c80]
0x1006a2c9a: cmp byte ptr [r13 + 0x5e6], 0
0x1006a2ca2: je 0x1006a2cf4
0x1006a2ca4: lea rsi, [r13 + 0x60]
0x1006a2ca8: mov rdi, r14
0x1006a2cab: call 0x10015e420 ; 0x10015e420
0x1006a2cb0: movzx ecx, al
0x1006a2cb3: mov edx, ecx
0x1006a2cb5: neg edx
0x1006a2cb7: mov eax, r12d
0x1006a2cba: mov dword ptr [r15 + rax*4], edx
0x1006a2cbe: test cl, cl
0x1006a2cc0: je 0x1006a2cf4
0x1006a2cc2: mov rcx, qword ptr [rsp + 0x18]
0x1006a2cc7: mov rcx, qword ptr [rcx + rbx*8 + 0xe6c80]
0x1006a2ccf: vmovaps xmm0, xmmword ptr [rcx + 0xa0]
0x1006a2cd7: mov rcx, rax
0x1006a2cda: shl rcx, 4
0x1006a2cde: mov rdx, qword ptr [rsp + 0x20]
0x1006a2ce3: vmovaps xmmword ptr [rdx + rcx], xmm0
0x1006a2ce8: inc r12d
0x1006a2ceb: mov rcx, qword ptr [rsp + 0x40]
0x1006a2cf0: mov qword ptr [rcx + rax*8], r13
0x1006a2cf4: inc ebx
0x1006a2cf6: mov rax, qword ptr [rsp + 0x18]
0x1006a2cfb: cmp ebx, dword ptr [rax + 0xe6c78]
0x1006a2d01: jb 0x1006a2c90
0x1006a2d03: jmp 0x1006a2d08 ; 0x1006a2d08
0x1006a2d05: xor r12d, r12d
0x1006a2d08: mov r8d, 1
0x1006a2d0e: mov rdi, qword ptr [rsp + 0x28]
0x1006a2d13: mov rsi, qword ptr [rsp + 0x20]
0x1006a2d18: mov edx, r12d
0x1006a2d1b: mov rcx, r15
0x1006a2d1e: call 0x100720dd0 ; 0x100720dd0
0x1006a2d23: test r12d, r12d
0x1006a2d26: je 0x1006a2d6e
0x1006a2d28: xor eax, eax
0x1006a2d2a: mov rsi, qword ptr [rsp + 0x40]
0x1006a2d2f: nop 
0x1006a2d30: mov ecx, eax
0x1006a2d32: cmp dword ptr [r15 + rcx*4], 0
0x1006a2d37: je 0x1006a2d50
0x1006a2d39: inc eax
0x1006a2d3b: cmp eax, r12d
0x1006a2d3e: jb 0x1006a2d30
0x1006a2d40: jmp 0x1006a2d71 ; 0x1006a2d71
0x1006a2d42: nop word ptr cs:[rax + rax]
0x1006a2d50: dec r12d
0x1006a2d53: mov edx, dword ptr [r15 + r12*4]
0x1006a2d57: mov dword ptr [r15 + rcx*4], edx
0x1006a2d5b: mov rdx, qword ptr [rsi + r12*8]
0x1006a2d5f: dec eax
0x1006a2d61: mov qword ptr [rsi + rcx*8], rdx
0x1006a2d65: inc eax
0x1006a2d67: cmp eax, r12d
0x1006a2d6a: jb 0x1006a2d30
0x1006a2d6c: jmp 0x1006a2d71 ; 0x1006a2d71
0x1006a2d6e: xor r12d, r12d
0x1006a2d71: mov r12d, r12d
0x1006a2d74: mov rdi, qword ptr [rsp + 0x40]
0x1006a2d79: lea rsi, [rdi + r12*8]
0x1006a2d7d: mov rax, qword ptr [rsp + 0x50]
0x1006a2d82: mov qword ptr [rsp + 0x80], rax
0x1006a2d8a: lea rdx, [rsp + 0x80]
0x1006a2d92: call 0x1006ad420 ; 0x1006ad420
0x1006a2d97: call 0x1007c6c20 ; 0x1007c6c20
0x1006a2d9c: mov rdi, rax
0x1006a2d9f: mov rsi, qword ptr [rsp + 0x20]
0x1006a2da4: call 0x100795a70 ; 0x100795a70
0x1006a2da9: call 0x1007c6c20 ; 0x1007c6c20
0x1006a2dae: mov rdi, rax
0x1006a2db1: mov rsi, r15
0x1006a2db4: call 0x100795a70 ; 0x100795a70
0x1006a2db9: mov rax, qword ptr [rsp + 0x18]
0x1006a2dbe: mov r15d, dword ptr [rax + 0xe0c]
0x1006a2dc5: call 0x1007c6c20 ; 0x1007c6c20
0x1006a2dca: add r15d, 2
0x1006a2dce: mov ebx, r15d
0x1006a2dd1: shl rbx, 4
0x1006a2dd5: lea rcx, [rip + 0x19a5d74] ; 0x102048b50
0x1006a2ddc: mov rdx, qword ptr [rcx]
0x1006a2ddf: mov ecx, 8
0x1006a2de4: mov rdi, rax
0x1006a2de7: mov rsi, rbx
0x1006a2dea: call 0x100795530 ; 0x100795530
0x1006a2def: mov r14, rax
0x1006a2df2: mov rdi, r14
0x1006a2df5: mov rsi, rbx
0x1006a2df8: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x1006a2dfd: mov rax, qword ptr [rsp + 0x18]
0x1006a2e02: mov eax, dword ptr [rax + 0xe0c]
0x1006a2e08: test rax, rax
0x1006a2e0b: je 0x1006a2e20
0x1006a2e0d: cmp eax, 0x1f
0x1006a2e10: ja 0x1006a2e27
0x1006a2e12: xor ecx, ecx
0x1006a2e14: xor ebx, ebx
0x1006a2e16: mov rdx, qword ptr [rsp + 0x18]
0x1006a2e1b: jmp 0x1006a2f40 ; 0x1006a2f40
0x1006a2e20: xor ebx, ebx
0x1006a2e22: jmp 0x1006a2f4f ; 0x1006a2f4f
0x1006a2e27: mov edx, eax
0x1006a2e29: and edx, 0x1f
0x1006a2e2c: mov rcx, rax
0x1006a2e2f: sub rcx, rdx
0x1006a2e32: mov rsi, qword ptr [rsp + 0x18]
0x1006a2e37: lea rsi, [rsi + 0xe6de0]
0x1006a2e3e: vxorps ymm2, ymm2, ymm2
0x1006a2e42: mov rdi, rcx
0x1006a2e45: vxorps ymm3, ymm3, ymm3
0x1006a2e49: vxorps ymm9, ymm9, ymm9
0x1006a2e4e: vxorps ymm1, ymm1, ymm1
0x1006a2e52: nop word ptr cs:[rax + rax]
0x1006a2e60: vmovdqu ymm4, ymmword ptr [rsi - 0x60]
0x1006a2e65: vmovdqu ymm5, ymmword ptr [rsi - 0x40]
0x1006a2e6a: vmovdqu ymm6, ymmword ptr [rsi - 0x20]
0x1006a2e6f: vmovdqu ymm8, ymmword ptr [rsi]
0x1006a2e73: vextractf128 xmm7, ymm2, 1
0x1006a2e79: vextractf128 xmm0, ymm4, 1
0x1006a2e7f: vpaddd xmm0, xmm0, xmm7
0x1006a2e83: vpaddd xmm2, xmm4, xmm2
0x1006a2e87: vinsertf128 ymm2, ymm2, xmm0, 1
0x1006a2e8d: vextractf128 xmm0, ymm3, 1
0x1006a2e93: vextractf128 xmm4, ymm5, 1
0x1006a2e99: vpaddd xmm0, xmm4, xmm0
0x1006a2e9d: vpaddd xmm3, xmm5, xmm3
0x1006a2ea1: vinsertf128 ymm3, ymm3, xmm0, 1
0x1006a2ea7: vextractf128 xmm0, ymm9, 1
0x1006a2ead: vextractf128 xmm4, ymm6, 1
0x1006a2eb3: vpaddd xmm0, xmm4, xmm0
0x1006a2eb7: vpaddd xmm4, xmm6, xmm9
0x1006a2ebc: vinsertf128 ymm9, ymm4, xmm0, 1
0x1006a2ec2: vextractf128 xmm0, ymm1, 1
0x1006a2ec8: vextractf128 xmm4, ymm8, 1
0x1006a2ece: vpaddd xmm0, xmm4, xmm0
0x1006a2ed2: vpaddd xmm1, xmm8, xmm1
0x1006a2ed6: vinsertf128 ymm1, ymm1, xmm0, 1
0x1006a2edc: sub rsi, -0x80
0x1006a2ee0: add rdi, -0x20
0x1006a2ee4: jne 0x1006a2e60
0x1006a2eea: vextractf128 xmm0, ymm2, 1
0x1006a2ef0: vextractf128 xmm4, ymm3, 1
0x1006a2ef6: vpaddd xmm0, xmm4, xmm0
0x1006a2efa: vpaddd xmm2, xmm3, xmm2
0x1006a2efe: vextractf128 xmm3, ymm9, 1
0x1006a2f04: vextractf128 xmm4, ymm1, 1
0x1006a2f0a: vpaddd xmm3, xmm3, xmm4
0x1006a2f0e: vpaddd xmm0, xmm0, xmm3
0x1006a2f12: vpaddd xmm1, xmm9, xmm1
0x1006a2f16: vpaddd xmm1, xmm2, xmm1
0x1006a2f1a: vpaddd xmm0, xmm1, xmm0
0x1006a2f1e: vpshufd xmm1, xmm0, 0x4e
0x1006a2f23: vpaddd xmm0, xmm0, xmm1
0x1006a2f27: vpshufd xmm1, xmm0, 0xe5
0x1006a2f2c: vpaddd xmm0, xmm0, xmm1
0x1006a2f30: vmovd ebx, xmm0
0x1006a2f34: test edx, edx
0x1006a2f36: mov rdx, qword ptr [rsp + 0x18]
0x1006a2f3b: je 0x1006a2f4f
0x1006a2f3d: nop dword ptr [rax]
0x1006a2f40: add ebx, dword ptr [rdx + rcx*4 + 0xe6d80]
0x1006a2f47: inc rcx
0x1006a2f4a: cmp rcx, rax
0x1006a2f4d: jb 0x1006a2f40
0x1006a2f4f: mov qword ptr [rsp + 0x70], r14
0x1006a2f54: vzeroupper 
0x1006a2f57: call 0x1007c6c20 ; 0x1007c6c20
0x1006a2f5c: mov ecx, ebx
0x1006a2f5e: shl rcx, 3
0x1006a2f62: lea rsi, [rcx + rcx*2]
0x1006a2f66: lea rcx, [rip + 0x19a5be3] ; 0x102048b50
0x1006a2f6d: mov rdx, qword ptr [rcx]
0x1006a2f70: mov ecx, 8
0x1006a2f75: mov rdi, rax
0x1006a2f78: call 0x100795530 ; 0x100795530
0x1006a2f7d: mov r11, rax
0x1006a2f80: lea rax, [r14 + 0x20]
0x1006a2f84: mov qword ptr [rsp + 0x68], rax
0x1006a2f89: mov rax, qword ptr [rsp + 0x18]
0x1006a2f8e: mov r10d, dword ptr [rax + 0xe0c]
0x1006a2f95: test r10, r10
0x1006a2f98: je 0x1006a3046
0x1006a2f9e: mov r8d, r10d
0x1006a2fa1: and r8d, 1
0x1006a2fa5: cmp r10d, 1
0x1006a2fa9: jne 0x1006a2fb9
0x1006a2fab: xor eax, eax
0x1006a2fad: xor edi, edi
0x1006a2faf: test r8, r8
0x1006a2fb2: jne 0x1006a301b
0x1006a2fb4: jmp 0x1006a3046 ; 0x1006a3046
0x1006a2fb9: sub r10, r8
0x1006a2fbc: add r14, 0x38
0x1006a2fc0: xor r9d, r9d
0x1006a2fc3: xor eax, eax
0x1006a2fc5: xor ecx, ecx
0x1006a2fc7: mov rdx, qword ptr [rsp + 0x18]
0x1006a2fcc: nop dword ptr [rax]
0x1006a2fd0: mov edi, dword ptr [rdx + rax*4 + 0xe6d80]
0x1006a2fd7: test edi, edi
0x1006a2fd9: mov ebx, ecx
0x1006a2fdb: lea rbx, [rbx + rbx*2]
0x1006a2fdf: lea rbx, [r11 + rbx*8]
0x1006a2fe3: cmove rbx, r9
0x1006a2fe7: mov qword ptr [r14 - 0x10], rbx
0x1006a2feb: add edi, ecx
0x1006a2fed: mov ecx, dword ptr [rdx + rax*4 + 0xe6d84]
0x1006a2ff4: test ecx, ecx
0x1006a2ff6: lea rbx, [rdi + rdi*2]
0x1006a2ffa: lea rbx, [r11 + rbx*8]
0x1006a2ffe: cmove rbx, r9
0x1006a3002: mov qword ptr [r14], rbx
0x1006a3005: add edi, ecx
0x1006a3007: add rax, 2
0x1006a300b: add r14, 0x20
0x1006a300f: mov ecx, edi
0x1006a3011: cmp r10, rax
0x1006a3014: jne 0x1006a2fd0
0x1006a3016: test r8, r8
0x1006a3019: je 0x1006a3046
0x1006a301b: xor ecx, ecx
0x1006a301d: mov rdx, qword ptr [rsp + 0x18]
0x1006a3022: cmp dword ptr [rdx + rax*4 + 0xe6d80], 0
0x1006a302a: mov edx, edi
0x1006a302c: lea rdx, [rdx + rdx*2]
0x1006a3030: lea rdx, [r11 + rdx*8]
0x1006a3034: cmovne rcx, rdx
0x1006a3038: shl rax, 4
0x1006a303c: mov rdx, qword ptr [rsp + 0x68]
0x1006a3041: mov qword ptr [rdx + rax + 8], rcx
0x1006a3046: mov dword ptr [rsp + 0x60], r15d
0x1006a304b: mov qword ptr [rsp + 0x30], r11
0x1006a3050: test r12d, r12d
0x1006a3053: mov qword ptr [rsp + 0x50], r12
0x1006a3058: je 0x1006a344f
0x1006a305e: mov rax, qword ptr [rsp + 0x18]
0x1006a3063: lea rcx, [rax + 0x470]
0x1006a306a: mov qword ptr [rsp + 0x20], rcx
0x1006a306f: lea rcx, [rax + 0x4b8]
0x1006a3076: mov qword ptr [rsp + 0x38], rcx
0x1006a307b: lea rax, [rax + 0x4f0]
0x1006a3082: mov qword ptr [rsp + 0x48], rax
0x1006a3087: xor r15d, r15d
0x1006a308a: nop word ptr [rax + rax]
0x1006a3090: mov rax, qword ptr [rsp + 0x40]
0x1006a3095: mov r14, qword ptr [rax + r15*8]
0x1006a3099: cmp byte ptr [r14 + 0x5e4], 0
0x1006a30a1: jne 0x1006a322f
0x1006a30a7: mov ebx, dword ptr [r14 + 0x1d8]
0x1006a30ae: call 0x1007c6c20 ; 0x1007c6c20
0x1006a30b3: shl rbx, 2
0x1006a30b7: lea rcx, [rip + 0x19a5a92] ; 0x102048b50
0x1006a30be: mov rdx, qword ptr [rcx]
0x1006a30c1: mov ecx, 0x10
0x1006a30c6: mov rdi, rax
0x1006a30c9: mov rsi, rbx
0x1006a30cc: call 0x100795530 ; 0x100795530
0x1006a30d1: mov r13, rax
0x1006a30d4: mov rsi, qword ptr [r14 + 0x1b8]
0x1006a30db: mov rdx, qword ptr [r14 + 0x1c0]
0x1006a30e2: mov ecx, dword ptr [r14 + 0x1d8]
0x1006a30e9: mov rdi, qword ptr [rsp + 0x28]
0x1006a30ee: mov r8, r13
0x1006a30f1: call 0x100721ce0 ; 0x100721ce0
0x1006a30f6: mov rax, qword ptr [rsp + 0x18]
0x1006a30fb: cmp byte ptr [rax + 0x339], 1
0x1006a3102: mov r12d, dword ptr [r14 + 0x1d8]
0x1006a3109: je 0x1006a3240
0x1006a310f: test r12d, r12d
0x1006a3112: je 0x1006a3217
0x1006a3118: mov rax, qword ptr [r14 + 0x1a8]
0x1006a311f: cmp r12d, 0x1f
0x1006a3123: ja 0x1006a312c
0x1006a3125: xor ecx, ecx
0x1006a3127: jmp 0x1006a3200 ; 0x1006a3200
0x1006a312c: mov edx, r12d
0x1006a312f: and edx, 0x1f
0x1006a3132: mov rcx, r12
0x1006a3135: sub rcx, rdx
0x1006a3138: mov rsi, r13
0x1006a313b: add rsi, 0x60
0x1006a313f: lea rdi, [rax + 0x30]
0x1006a3143: mov rbx, rcx
0x1006a3146: vxorps xmm5, xmm5, xmm5
0x1006a314a: vmovdqa xmm6, xmmword ptr [rip + 0x433e6e] ; 0x100ad6fc0
0x1006a3152: nop word ptr cs:[rax + rax]
0x1006a3160: vmovdqu ymm0, ymmword ptr [rsi - 0x60]
0x1006a3165: vmovdqu ymm1, ymmword ptr [rsi - 0x40]
0x1006a316a: vmovdqu ymm2, ymmword ptr [rsi - 0x20]
0x1006a316f: vmovdqu ymm3, ymmword ptr [rsi]
0x1006a3173: vextractf128 xmm4, ymm0, 1
0x1006a3179: vpcmpeqd xmm4, xmm4, xmm5
0x1006a317d: vpcmpeqd xmm0, xmm0, xmm5
0x1006a3181: vpacksswb xmm0, xmm0, xmm4
0x1006a3185: vextractf128 xmm4, ymm1, 1
0x1006a318b: vpcmpeqd xmm4, xmm4, xmm5
0x1006a318f: vpcmpeqd xmm1, xmm1, xmm5
0x1006a3193: vpacksswb xmm1, xmm1, xmm4
0x1006a3197: vextractf128 xmm4, ymm2, 1
0x1006a319d: vpcmpeqd xmm4, xmm4, xmm5
0x1006a31a1: vpcmpeqd xmm2, xmm2, xmm5
0x1006a31a5: vpacksswb xmm2, xmm2, xmm4
0x1006a31a9: vextractf128 xmm4, ymm3, 1
0x1006a31af: vpcmpeqd xmm4, xmm4, xmm5
0x1006a31b3: vpcmpeqd xmm3, xmm3, xmm5
0x1006a31b7: vpacksswb xmm3, xmm3, xmm4
0x1006a31bb: vpor xmm0, xmm0, xmm6
0x1006a31bf: vpor xmm1, xmm1, xmm6
0x1006a31c3: vpor xmm2, xmm2, xmm6
0x1006a31c7: vpor xmm3, xmm3, xmm6
0x1006a31cb: vmovdqu xmmword ptr [rdi - 0x30], xmm0
0x1006a31d0: vmovdqu xmmword ptr [rdi - 0x20], xmm1
0x1006a31d5: vmovdqu xmmword ptr [rdi - 0x10], xmm2
0x1006a31da: vmovdqu xmmword ptr [rdi], xmm3
0x1006a31de: sub rsi, -0x80
0x1006a31e2: add rdi, 0x40
0x1006a31e6: add rbx, -0x20
0x1006a31ea: jne 0x1006a3160
0x1006a31f0: test edx, edx
0x1006a31f2: je 0x1006a3217
0x1006a31f4: nop word ptr cs:[rax + rax]
0x1006a3200: cmp dword ptr [r13 + rcx*4], 1
0x1006a3206: sbb edx, edx
0x1006a3208: or edx, 3
0x1006a320b: mov word ptr [rax + rcx*2], dx
0x1006a320f: inc rcx
0x1006a3212: cmp rcx, r12
0x1006a3215: jb 0x1006a3200
0x1006a3217: vzeroupper 
0x1006a321a: call 0x1007c6c20 ; 0x1007c6c20
0x1006a321f: mov r12, qword ptr [rsp + 0x50]
0x1006a3224: mov rdi, rax
0x1006a3227: mov rsi, r13
0x1006a322a: call 0x100795a70 ; 0x100795a70
0x1006a322f: inc r15
0x1006a3232: cmp r15, r12
0x1006a3235: jb 0x1006a3090
0x1006a323b: jmp 0x1006a344f ; 0x1006a344f
0x1006a3240: call 0x1007c6c20 ; 0x1007c6c20
0x1006a3245: add r12, r12
0x1006a3248: lea rcx, [rip + 0x19a5901] ; 0x102048b50
0x1006a324f: mov rdx, qword ptr [rcx]
0x1006a3252: mov ecx, 0x10
0x1006a3257: mov rdi, rax
0x1006a325a: mov rsi, r12
0x1006a325d: call 0x100795530 ; 0x100795530
0x1006a3262: mov rbx, rax
0x1006a3265: mov eax, dword ptr [r14 + 0x1d8]
0x1006a326c: test eax, eax
0x1006a326e: je 0x1006a343a
0x1006a3274: xor ecx, ecx
0x1006a3276: xor edx, edx
0x1006a3278: cmp dword ptr [r13 + rcx*2], 0
0x1006a327e: je 0x1006a32f6
0x1006a3280: mov rsi, qword ptr [r14 + 0x1a0]
0x1006a3287: vmovaps xmm0, xmmword ptr [rsi + rcx*8]
0x1006a328c: vsubps xmm1, xmm0, xmmword ptr [rsp + 0x100]
0x1006a3295: vmulps xmm1, xmm1, xmm1
0x1006a3299: vmovshdup xmm2, xmm1
0x1006a329d: vaddss xmm2, xmm1, xmm2
0x1006a32a1: vpermilpd xmm1, xmm1, 1
0x1006a32a7: vaddss xmm1, xmm1, xmm2
0x1006a32ab: vpermilps xmm0, xmm0, 0xe7
0x1006a32b1: vmulss xmm0, xmm0, xmm0
0x1006a32b5: vsubss xmm0, xmm1, xmm0
0x1006a32b9: vmovss xmm1, dword ptr [r14]
0x1006a32be: vmulss xmm1, xmm1, xmm1
0x1006a32c2: vucomiss xmm1, xmm0
0x1006a32c6: jae 0x1006a32fc
0x1006a32c8: vmovss xmm1, dword ptr [r14 + 4]
0x1006a32ce: vmulss xmm1, xmm1, xmm1
0x1006a32d2: mov si, 1
0x1006a32d6: vucomiss xmm1, xmm0
0x1006a32da: jae 0x1006a32fe
0x1006a32dc: vmovss xmm1, dword ptr [r14 + 8]
0x1006a32e2: vmulss xmm1, xmm1, xmm1
0x1006a32e6: mov si, 2
0x1006a32ea: vucomiss xmm1, xmm0
0x1006a32ee: jae 0x1006a32fe
0x1006a32f0: mov si, 3
0x1006a32f4: jmp 0x1006a32fe ; 0x1006a32fe
0x1006a32f6: mov si, 0xffff
0x1006a32fa: jmp 0x1006a330d ; 0x1006a330d
0x1006a32fc: xor esi, esi
0x1006a32fe: vcvttss2si edi, dword ptr [rip + 0x1990072] ; 0x102033378
0x1006a3306: cmp si, di
0x1006a3309: cmovl si, di
0x1006a330d: mov word ptr [rbx + rcx], si
0x1006a3311: inc edx
0x1006a3313: add rcx, 2
0x1006a3317: cmp edx, eax
0x1006a3319: jb 0x1006a3278
0x1006a331f: xor r12d, r12d
0x1006a3322: mov qword ptr [rsp + 0x78], rbx
0x1006a3327: mov r12d, r12d
0x1006a332a: movzx ecx, word ptr [rbx + r12*2]
0x1006a332f: mov rax, qword ptr [r14 + 0x1a8]
0x1006a3336: movzx eax, word ptr [rax + r12*2]
0x1006a333b: cmp ecx, 0xffff
0x1006a3341: jne 0x1006a340a
0x1006a3347: movzx edx, ax
0x1006a334a: cmp edx, 0xffff
0x1006a3350: je 0x1006a340a
0x1006a3356: lea rdi, [rsp + 0x140]
0x1006a335e: mov rsi, qword ptr [rsp + 0x20]
0x1006a3363: call 0x1007e9360 ; 0x1007e9360
0x1006a3368: mov rcx, qword ptr [r14 + 0x1a8]
0x1006a336f: mov rsi, qword ptr [r14 + 0x1b0]
0x1006a3376: movzx eax, word ptr [rcx + r12*2]
0x1006a337b: cmp eax, 2
0x1006a337e: ja 0x1006a33ed
0x1006a3380: mov qword ptr [rsp + 0x90], rsi
0x1006a3388: mov qword ptr [rsp + 0x98], rcx
0x1006a3390: mov rbx, qword ptr [r14 + 0x1c8]
0x1006a3397: imul rax, r12, 0x3e0
0x1006a339e: mov qword ptr [rsp + 0x58], rax
0x1006a33a3: lea rsi, [rbx + rax + 0x20]
0x1006a33a8: mov rdi, qword ptr [rsp + 0x38]
0x1006a33ad: call 0x10077e4b0 ; 0x10077e4b0
0x1006a33b2: mov rax, qword ptr [rsp + 0x58]
0x1006a33b7: lea rsi, [rbx + rax + 0x30]
0x1006a33bc: mov rdi, qword ptr [rsp + 0x48]
0x1006a33c1: call 0x10077e4b0 ; 0x10077e4b0
0x1006a33c6: add rbx, qword ptr [rsp + 0x58]
0x1006a33cb: mov esi, 0x3e0
0x1006a33d0: mov rdi, rbx
0x1006a33d3: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x1006a33d8: mov rbx, qword ptr [rsp + 0x78]
0x1006a33dd: mov rcx, qword ptr [rsp + 0x98]
0x1006a33e5: mov rsi, qword ptr [rsp + 0x90]
0x1006a33ed: mov word ptr [rcx + r12*2], 0xffff
0x1006a33f4: mov word ptr [rsi + r12*2], 0xfffe
0x1006a33fb: lea rdi, [rsp + 0x140]
0x1006a3403: call 0x1007e9480 ; 0x1007e9480
0x1006a3408: jmp 0x1006a342a ; 0x1006a342a
0x1006a340a: movzx ecx, cx
0x1006a340d: cmp ecx, 0xffff
0x1006a3413: je 0x1006a342a
0x1006a3415: movzx eax, ax
0x1006a3418: cmp eax, 0xffff
0x1006a341d: jne 0x1006a342a
0x1006a341f: mov rsi, r14
0x1006a3422: mov edx, r12d
0x1006a3425: call 0x1006a7b50 ; 0x1006a7b50
0x1006a342a: inc r12d
0x1006a342d: cmp r12d, dword ptr [r14 + 0x1d8]
0x1006a3434: jb 0x1006a3327
0x1006a343a: call 0x1007c6c20 ; 0x1007c6c20
0x1006a343f: mov rdi, rax
0x1006a3442: mov rsi, rbx
0x1006a3445: call 0x100795a70 ; 0x100795a70
0x1006a344a: jmp 0x1006a3217 ; 0x1006a3217
0x1006a344f: mov rbx, qword ptr [rsp + 0x18]
0x1006a3454: cmp byte ptr [rbx + 0x339], 0
0x1006a345b: mov r14d, dword ptr [rsp + 0x60]
0x1006a3460: jne 0x1006a3e40
0x1006a3466: mov dword ptr [rbx + 0x143c], 0
0x1006a3470: mov dword ptr [rbx + 0x497c], 0
0x1006a347a: mov dword ptr [rbx + 0x7ebc], 0
0x1006a3484: mov dword ptr [rbx + 0xb3fc], 0
0x1006a348e: mov dword ptr [rbx + 0xe93c], 0
0x1006a3498: mov dword ptr [rbx + 0x11e7c], 0
0x1006a34a2: mov dword ptr [rbx + 0x153bc], 0
0x1006a34ac: mov dword ptr [rbx + 0x188fc], 0
0x1006a34b6: mov dword ptr [rbx + 0x1be3c], 0
0x1006a34c0: mov dword ptr [rbx + 0x1f37c], 0
0x1006a34ca: mov dword ptr [rbx + 0x228bc], 0
0x1006a34d4: mov dword ptr [rbx + 0x25dfc], 0
0x1006a34de: mov dword ptr [rbx + 0x2933c], 0
0x1006a34e8: mov dword ptr [rbx + 0x2c87c], 0
0x1006a34f2: mov dword ptr [rbx + 0x2fdbc], 0
0x1006a34fc: mov dword ptr [rbx + 0x332fc], 0
0x1006a3506: mov dword ptr [rbx + 0x3683c], 0
0x1006a3510: mov dword ptr [rbx + 0x39d7c], 0
0x1006a351a: mov dword ptr [rbx + 0x3d2bc], 0
0x1006a3524: mov dword ptr [rbx + 0x407fc], 0
0x1006a352e: mov dword ptr [rbx + 0x43d3c], 0
0x1006a3538: mov dword ptr [rbx + 0x4727c], 0
0x1006a3542: mov dword ptr [rbx + 0x4a7bc], 0
0x1006a354c: mov dword ptr [rbx + 0x4dcfc], 0
0x1006a3556: mov dword ptr [rbx + 0x5123c], 0
0x1006a3560: mov dword ptr [rbx + 0x5477c], 0
0x1006a356a: mov dword ptr [rbx + 0x57cbc], 0
0x1006a3574: mov dword ptr [rbx + 0x5b1fc], 0
0x1006a357e: mov dword ptr [rbx + 0x5e73c], 0
0x1006a3588: mov dword ptr [rbx + 0x61c7c], 0
0x1006a3592: mov dword ptr [rbx + 0x651bc], 0
0x1006a359c: mov dword ptr [rbx + 0x686fc], 0
0x1006a35a6: mov dword ptr [rbx + 0x6bc3c], 0
0x1006a35b0: mov dword ptr [rbx + 0x6f17c], 0
0x1006a35ba: mov dword ptr [rbx + 0x726bc], 0
0x1006a35c4: mov dword ptr [rbx + 0x75bfc], 0
0x1006a35ce: mov dword ptr [rbx + 0x7913c], 0
0x1006a35d8: mov dword ptr [rbx + 0x7c67c], 0
0x1006a35e2: mov dword ptr [rbx + 0x7fbbc], 0
0x1006a35ec: mov dword ptr [rbx + 0x830fc], 0
0x1006a35f6: mov dword ptr [rbx + 0x8663c], 0
0x1006a3600: mov dword ptr [rbx + 0x89b7c], 0
0x1006a360a: mov dword ptr [rbx + 0x8d0bc], 0
0x1006a3614: mov dword ptr [rbx + 0x905fc], 0
0x1006a361e: mov dword ptr [rbx + 0x93b3c], 0
0x1006a3628: mov dword ptr [rbx + 0x9707c], 0
0x1006a3632: mov dword ptr [rbx + 0x9a5bc], 0
0x1006a363c: mov dword ptr [rbx + 0x9dafc], 0
0x1006a3646: mov dword ptr [rbx + 0xa103c], 0
0x1006a3650: mov dword ptr [rbx + 0xa457c], 0
0x1006a365a: mov dword ptr [rbx + 0xa7abc], 0
0x1006a3664: mov dword ptr [rbx + 0xaaffc], 0
0x1006a366e: mov dword ptr [rbx + 0xae53c], 0
0x1006a3678: mov dword ptr [rbx + 0xb1a7c], 0
0x1006a3682: mov dword ptr [rbx + 0xb4fbc], 0
0x1006a368c: mov dword ptr [rbx + 0xb84fc], 0
0x1006a3696: mov dword ptr [rbx + 0xbba3c], 0
0x1006a36a0: mov dword ptr [rbx + 0xbef7c], 0
0x1006a36aa: mov dword ptr [rbx + 0xc24bc], 0
0x1006a36b4: test r12d, r12d
0x1006a36b7: je 0x1006a3d63
0x1006a36bd: mov eax, dword ptr [rsp + 0xe0]
0x1006a36c4: mov qword ptr [rsp + 0x20], rax
0x1006a36c9: mov r13d, dword ptr [rsp + 0xe8]
0x1006a36d1: lea rax, [rbx + 0xf00]
0x1006a36d8: mov qword ptr [rsp + 0x48], rax
0x1006a36dd: xor ecx, ecx
0x1006a36df: mov rax, qword ptr [rsp + 0x40]
0x1006a36e4: mov r12, qword ptr [rax + rcx*8]
0x1006a36e8: cmp byte ptr [r12 + 0x5e4], 0
0x1006a36f1: je 0x1006a3740
0x1006a36f3: mov qword ptr [rsp + 0x38], rcx
0x1006a36f8: mov r15, qword ptr [rsp + 0x48]
0x1006a36fd: xor ebx, ebx
0x1006a36ff: nop 
0x1006a3700: mov r14d, dword ptr [r12 + rbx*4 + 0x2cc]
0x1006a3708: test r14d, r14d
0x1006a370b: je 0x1006a3720
0x1006a370d: mov esi, dword ptr [r12 + rbx*4 + 0xb4]
0x1006a3715: mov rdi, r15
0x1006a3718: mov edx, r14d
0x1006a371b: call 0x1007f6ae0 ; 0x1007f6ae0
0x1006a3720: lea r13d, [r13 + r14*4]
0x1006a3725: inc rbx
0x1006a3728: add r15, 0x3540
0x1006a372f: cmp rbx, 0x3b
0x1006a3733: jb 0x1006a3700
0x1006a3735: jmp 0x1006a3d34 ; 0x1006a3d34
0x1006a373a: nop word ptr [rax + rax]
0x1006a3740: mov eax, dword ptr [r12 + 0x1d8]
0x1006a3748: test eax, eax
0x1006a374a: je 0x1006a3d39
0x1006a3750: mov qword ptr [rsp + 0x38], rcx
0x1006a3755: xor r14d, r14d
0x1006a3758: jmp 0x1006a3800 ; 0x1006a3800
0x1006a375d: imul rcx, r14, 0xf8
0x1006a3764: mov rsi, qword ptr [r12 + 0x1c8]
0x1006a376c: imul rdx, r14, 0x3e0
0x1006a3773: mov rdi, qword ptr [rsi + rdx + 0x20]
0x1006a3778: mov rbx, qword ptr [rsp + 0x18]
0x1006a377d: sub rdi, qword ptr [rbx + 0x4d8]
0x1006a3784: shr rdi, 3
0x1006a3788: imul edi, edi, 0xcccccccd
0x1006a378e: mov dword ptr [rsp + 0x28], edi
0x1006a3792: lea r9, [rsi + rdx + 0x30]
0x1006a3797: lea r10, [rsi + rcx*4 + 0x38]
0x1006a379c: xor edi, edi
0x1006a379e: xor r11d, r11d
0x1006a37a1: mov ecx, dword ptr [r10 + rdi]
0x1006a37a5: test ecx, ecx
0x1006a37a7: je 0x1006a37e0
0x1006a37a9: mov edx, r11d
0x1006a37ac: add rdx, rdx
0x1006a37af: add rdx, qword ptr [r9]
0x1006a37b2: mov r8, qword ptr [rsp + 0x68]
0x1006a37b7: mov rsi, qword ptr [r8 + rdi + 8]
0x1006a37bc: mov r15d, dword ptr [r8 + rdi]
0x1006a37c0: lea rbx, [r15 + r15*2]
0x1006a37c4: mov qword ptr [rsi + rbx*8], rdx
0x1006a37c8: mov dword ptr [rsi + rbx*8 + 8], ecx
0x1006a37cc: mov ecx, dword ptr [rsp + 0x28]
0x1006a37d0: mov dword ptr [rsi + rbx*8 + 0x10], ecx
0x1006a37d4: lea ecx, [r15 + 1]
0x1006a37d8: mov dword ptr [r8 + rdi], ecx
0x1006a37dc: add r11d, dword ptr [r10 + rdi]
0x1006a37e0: add rdi, 0x10
0x1006a37e4: cmp rdi, 0x3b0
0x1006a37eb: jne 0x1006a37a1
0x1006a37ed: jmp 0x1006a3d28 ; 0x1006a3d28
0x1006a37f2: nop word ptr cs:[rax + rax]
0x1006a3800: mov r14d, r14d
0x1006a3803: mov rcx, qword ptr [r12 + 0x1a8]
0x1006a380b: movzx ecx, word ptr [rcx + r14*2]
0x1006a3810: cmp ecx, 0xffff
0x1006a3816: je 0x1006a3d28
0x1006a381c: movsx ecx, cx
0x1006a381f: cmp ecx, 2
0x1006a3822: jle 0x1006a375d
0x1006a3828: mov rcx, qword ptr [r12 + 0x1d0]
0x1006a3830: mov r15, r14
0x1006a3833: shl r15, 7
0x1006a3837: movzx ebx, word ptr [rcx + r15 + 4]
0x1006a383d: test ebx, ebx
0x1006a383f: je 0x1006a3d20
0x1006a3845: movzx eax, word ptr [rcx + r15 + 6]
0x1006a384b: mov qword ptr [rsp + 0x28], rcx
0x1006a3850: mov esi, dword ptr [rcx + r15]
0x1006a3854: add esi, dword ptr [r12 + rax*4 + 0xb4]
0x1006a385c: imul rax, rax, 0x3540
0x1006a3863: mov rcx, qword ptr [rsp + 0x18]
0x1006a3868: lea rdi, [rcx + rax + 0xf00]
0x1006a3870: mov edx, ebx
0x1006a3872: call 0x1007f6ae0 ; 0x1007f6ae0
0x1006a3877: mov rax, qword ptr [rsp + 0x20]
0x1006a387c: lea eax, [rax + rbx*4]
0x1006a387f: mov rcx, qword ptr [rsp + 0x28]
0x1006a3884: movzx ebx, word ptr [rcx + r15 + 0xc]
0x1006a388a: test ebx, ebx
0x1006a388c: mov qword ptr [rsp + 0x20], rax
0x1006a3891: je 0x1006a3d20
0x1006a3897: movzx eax, word ptr [rcx + r15 + 0xe]
0x1006a389d: mov esi, dword ptr [rcx + r15 + 8]
0x1006a38a2: add esi, dword ptr [r12 + rax*4 + 0xb4]
0x1006a38aa: imul rax, rax, 0x3540
0x1006a38b1: mov rcx, qword ptr [rsp + 0x18]
0x1006a38b6: lea rdi, [rcx + rax + 0xf00]
0x1006a38be: mov edx, ebx
0x1006a38c0: call 0x1007f6ae0 ; 0x1007f6ae0
0x1006a38c5: mov rax, qword ptr [rsp + 0x20]
0x1006a38ca: lea eax, [rax + rbx*4]
0x1006a38cd: mov rcx, qword ptr [rsp + 0x28]
0x1006a38d2: movzx ebx, word ptr [rcx + r15 + 0x14]
0x1006a38d8: test ebx, ebx
0x1006a38da: mov qword ptr [rsp + 0x20], rax
0x1006a38df: je 0x1006a3d20
0x1006a38e5: movzx eax, word ptr [rcx + r15 + 0x16]
0x1006a38eb: mov esi, dword ptr [rcx + r15 + 0x10]
0x1006a38f0: add esi, dword ptr [r12 + rax*4 + 0xb4]
0x1006a38f8: imul rax, rax, 0x3540
0x1006a38ff: mov rcx, qword ptr [rsp + 0x18]
0x1006a3904: lea rdi, [rcx + rax + 0xf00]
0x1006a390c: mov edx, ebx
0x1006a390e: call 0x1007f6ae0 ; 0x1007f6ae0
0x1006a3913: mov rax, qword ptr [rsp + 0x20]
0x1006a3918: lea eax, [rax + rbx*4]
0x1006a391b: mov rcx, qword ptr [rsp + 0x28]
0x1006a3920: movzx ebx, word ptr [rcx + r15 + 0x1c]
0x1006a3926: test ebx, ebx
0x1006a3928: mov qword ptr [rsp + 0x20], rax
0x1006a392d: je 0x1006a3d20
0x1006a3933: movzx eax, word ptr [rcx + r15 + 0x1e]
0x1006a3939: mov esi, dword ptr [rcx + r15 + 0x18]
0x1006a393e: add esi, dword ptr [r12 + rax*4 + 0xb4]
0x1006a3946: imul rax, rax, 0x3540
0x1006a394d: mov rcx, qword ptr [rsp + 0x18]
0x1006a3952: lea rdi, [rcx + rax + 0xf00]
0x1006a395a: mov edx, ebx
0x1006a395c: call 0x1007f6ae0 ; 0x1007f6ae0
0x1006a3961: mov rax, qword ptr [rsp + 0x20]
0x1006a3966: lea eax, [rax + rbx*4]
0x1006a3969: mov rcx, qword ptr [rsp + 0x28]
0x1006a396e: movzx ebx, word ptr [rcx + r15 + 0x24]
0x1006a3974: test ebx, ebx
0x1006a3976: mov qword ptr [rsp + 0x20], rax
0x1006a397b: je 0x1006a3d20
0x1006a3981: movzx eax, word ptr [rcx + r15 + 0x26]
0x1006a3987: mov esi, dword ptr [rcx + r15 + 0x20]
0x1006a398c: add esi, dword ptr [r12 + rax*4 + 0xb4]
0x1006a3994: imul rax, rax, 0x3540
0x1006a399b: mov rcx, qword ptr [rsp + 0x18]
0x1006a39a0: lea rdi, [rcx + rax + 0xf00]
0x1006a39a8: mov edx, ebx
0x1006a39aa: call 0x1007f6ae0 ; 0x1007f6ae0
0x1006a39af: mov rax, qword ptr [rsp + 0x20]
0x1006a39b4: lea eax, [rax + rbx*4]
0x1006a39b7: mov rcx, qword ptr [rsp + 0x28]
0x1006a39bc: movzx ebx, word ptr [rcx + r15 + 0x2c]
0x1006a39c2: test ebx, ebx
0x1006a39c4: mov qword ptr [rsp + 0x20], rax
0x1006a39c9: je 0x1006a3d20
0x1006a39cf: movzx eax, word ptr [rcx + r15 + 0x2e]
0x1006a39d5: mov esi, dword ptr [rcx + r15 + 0x28]
0x1006a39da: add esi, dword ptr [r12 + rax*4 + 0xb4]
0x1006a39e2: imul rax, rax, 0x3540
0x1006a39e9: mov rcx, qword ptr [rsp + 0x18]
0x1006a39ee: lea rdi, [rcx + rax + 0xf00]
0x1006a39f6: mov edx, ebx
0x1006a39f8: call 0x1007f6ae0 ; 0x1007f6ae0
0x1006a39fd: mov rax, qword ptr [rsp + 0x20]
0x1006a3a02: lea eax, [rax + rbx*4]
0x1006a3a05: mov rcx, qword ptr [rsp + 0x28]
0x1006a3a0a: movzx ebx, word ptr [rcx + r15 + 0x34]
0x1006a3a10: test ebx, ebx
0x1006a3a12: mov qword ptr [rsp + 0x20], rax
0x1006a3a17: je 0x1006a3d20
0x1006a3a1d: movzx eax, word ptr [rcx + r15 + 0x36]
0x1006a3a23: mov esi, dword ptr [rcx + r15 + 0x30]
0x1006a3a28: add esi, dword ptr [r12 + rax*4 + 0xb4]
0x1006a3a30: imul rax, rax, 0x3540
0x1006a3a37: mov rcx, qword ptr [rsp + 0x18]
0x1006a3a3c: lea rdi, [rcx + rax + 0xf00]
0x1006a3a44: mov edx, ebx
0x1006a3a46: call 0x1007f6ae0 ; 0x1007f6ae0
0x1006a3a4b: mov rax, qword ptr [rsp + 0x20]
0x1006a3a50: lea eax, [rax + rbx*4]
0x1006a3a53: mov rcx, qword ptr [rsp + 0x28]
0x1006a3a58: movzx ebx, word ptr [rcx + r15 + 0x3c]
0x1006a3a5e: test ebx, ebx
0x1006a3a60: mov qword ptr [rsp + 0x20], rax
0x1006a3a65: je 0x1006a3d20
0x1006a3a6b: movzx eax, word ptr [rcx + r15 + 0x3e]
0x1006a3a71: mov esi, dword ptr [rcx + r15 + 0x38]
0x1006a3a76: add esi, dword ptr [r12 + rax*4 + 0xb4]
0x1006a3a7e: imul rax, rax, 0x3540
0x1006a3a85: mov rcx, qword ptr [rsp + 0x18]
0x1006a3a8a: lea rdi, [rcx + rax + 0xf00]
0x1006a3a92: mov edx, ebx
0x1006a3a94: call 0x1007f6ae0 ; 0x1007f6ae0
0x1006a3a99: mov rax, qword ptr [rsp + 0x20]
0x1006a3a9e: lea eax, [rax + rbx*4]
0x1006a3aa1: mov rcx, qword ptr [rsp + 0x28]
0x1006a3aa6: movzx ebx, word ptr [rcx + r15 + 0x44]
0x1006a3aac: test ebx, ebx
0x1006a3aae: mov qword ptr [rsp + 0x20], rax
0x1006a3ab3: je 0x1006a3d20
0x1006a3ab9: movzx eax, word ptr [rcx + r15 + 0x46]
0x1006a3abf: mov esi, dword ptr [rcx + r15 + 0x40]
0x1006a3ac4: add esi, dword ptr [r12 + rax*4 + 0xb4]
0x1006a3acc: imul rax, rax, 0x3540
0x1006a3ad3: mov rcx, qword ptr [rsp + 0x18]
0x1006a3ad8: lea rdi, [rcx + rax + 0xf00]
0x1006a3ae0: mov edx, ebx
0x1006a3ae2: call 0x1007f6ae0 ; 0x1007f6ae0
0x1006a3ae7: mov rax, qword ptr [rsp + 0x20]
0x1006a3aec: lea eax, [rax + rbx*4]
0x1006a3aef: mov rcx, qword ptr [rsp + 0x28]
0x1006a3af4: movzx ebx, word ptr [rcx + r15 + 0x4c]
0x1006a3afa: test ebx, ebx
0x1006a3afc: mov qword ptr [rsp + 0x20], rax
0x1006a3b01: je 0x1006a3d20
0x1006a3b07: movzx eax, word ptr [rcx + r15 + 0x4e]
0x1006a3b0d: mov esi, dword ptr [rcx + r15 + 0x48]
0x1006a3b12: add esi, dword ptr [r12 + rax*4 + 0xb4]
0x1006a3b1a: imul rax, rax, 0x3540
0x1006a3b21: mov rcx, qword ptr [rsp + 0x18]
0x1006a3b26: lea rdi, [rcx + rax + 0xf00]
0x1006a3b2e: mov edx, ebx
0x1006a3b30: call 0x1007f6ae0 ; 0x1007f6ae0
0x1006a3b35: mov rax, qword ptr [rsp + 0x20]
0x1006a3b3a: lea eax, [rax + rbx*4]
0x1006a3b3d: mov rcx, qword ptr [rsp + 0x28]
0x1006a3b42: movzx ebx, word ptr [rcx + r15 + 0x54]
0x1006a3b48: test ebx, ebx
0x1006a3b4a: mov qword ptr [rsp + 0x20], rax
0x1006a3b4f: je 0x1006a3d20
0x1006a3b55: movzx eax, word ptr [rcx + r15 + 0x56]
0x1006a3b5b: mov esi, dword ptr [rcx + r15 + 0x50]
0x1006a3b60: add esi, dword ptr [r12 + rax*4 + 0xb4]
0x1006a3b68: imul rax, rax, 0x3540
0x1006a3b6f: mov rcx, qword ptr [rsp + 0x18]
0x1006a3b74: lea rdi, [rcx + rax + 0xf00]
0x1006a3b7c: mov edx, ebx
0x1006a3b7e: call 0x1007f6ae0 ; 0x1007f6ae0
0x1006a3b83: mov rax, qword ptr [rsp + 0x20]
0x1006a3b88: lea eax, [rax + rbx*4]
0x1006a3b8b: mov rcx, qword ptr [rsp + 0x28]
0x1006a3b90: movzx ebx, word ptr [rcx + r15 + 0x5c]
0x1006a3b96: test ebx, ebx
0x1006a3b98: mov qword ptr [rsp + 0x20], rax
0x1006a3b9d: je 0x1006a3d20
0x1006a3ba3: movzx eax, word ptr [rcx + r15 + 0x5e]
0x1006a3ba9: mov esi, dword ptr [rcx + r15 + 0x58]
0x1006a3bae: add esi, dword ptr [r12 + rax*4 + 0xb4]
0x1006a3bb6: imul rax, rax, 0x3540
0x1006a3bbd: mov rcx, qword ptr [rsp + 0x18]
0x1006a3bc2: lea rdi, [rcx + rax + 0xf00]
0x1006a3bca: mov edx, ebx
0x1006a3bcc: call 0x1007f6ae0 ; 0x1007f6ae0
0x1006a3bd1: mov rax, qword ptr [rsp + 0x20]
0x1006a3bd6: lea eax, [rax + rbx*4]
0x1006a3bd9: mov rcx, qword ptr [rsp + 0x28]
0x1006a3bde: movzx ebx, word ptr [rcx + r15 + 0x64]
0x1006a3be4: test ebx, ebx
0x1006a3be6: mov qword ptr [rsp + 0x20], rax
0x1006a3beb: je 0x1006a3d20
0x1006a3bf1: movzx eax, word ptr [rcx + r15 + 0x66]
0x1006a3bf7: mov esi, dword ptr [rcx + r15 + 0x60]
0x1006a3bfc: add esi, dword ptr [r12 + rax*4 + 0xb4]
0x1006a3c04: imul rax, rax, 0x3540
0x1006a3c0b: mov rcx, qword ptr [rsp + 0x18]
0x1006a3c10: lea rdi, [rcx + rax + 0xf00]
0x1006a3c18: mov edx, ebx
0x1006a3c1a: call 0x1007f6ae0 ; 0x1007f6ae0
0x1006a3c1f: mov rax, qword ptr [rsp + 0x20]
0x1006a3c24: lea eax, [rax + rbx*4]
0x1006a3c27: mov rcx, qword ptr [rsp + 0x28]
0x1006a3c2c: movzx ebx, word ptr [rcx + r15 + 0x6c]
0x1006a3c32: test ebx, ebx
0x1006a3c34: mov qword ptr [rsp + 0x20], rax
0x1006a3c39: je 0x1006a3d20
0x1006a3c3f: movzx eax, word ptr [rcx + r15 + 0x6e]
0x1006a3c45: mov esi, dword ptr [rcx + r15 + 0x68]
0x1006a3c4a: add esi, dword ptr [r12 + rax*4 + 0xb4]
0x1006a3c52: imul rax, rax, 0x3540
0x1006a3c59: mov rcx, qword ptr [rsp + 0x18]
0x1006a3c5e: lea rdi, [rcx + rax + 0xf00]
0x1006a3c66: mov edx, ebx
0x1006a3c68: call 0x1007f6ae0 ; 0x1007f6ae0
0x1006a3c6d: mov rax, qword ptr [rsp + 0x20]
0x1006a3c72: lea eax, [rax + rbx*4]
0x1006a3c75: mov rcx, qword ptr [rsp + 0x28]
0x1006a3c7a: movzx ebx, word ptr [rcx + r15 + 0x74]
0x1006a3c80: test ebx, ebx
0x1006a3c82: mov qword ptr [rsp + 0x20], rax
0x1006a3c87: je 0x1006a3d20
0x1006a3c8d: movzx eax, word ptr [rcx + r15 + 0x76]
0x1006a3c93: mov esi, dword ptr [rcx + r15 + 0x70]
0x1006a3c98: add esi, dword ptr [r12 + rax*4 + 0xb4]
0x1006a3ca0: imul rax, rax, 0x3540
0x1006a3ca7: mov rcx, qword ptr [rsp + 0x18]
0x1006a3cac: lea rdi, [rcx + rax + 0xf00]
0x1006a3cb4: mov edx, ebx
0x1006a3cb6: call 0x1007f6ae0 ; 0x1007f6ae0
0x1006a3cbb: mov rax, qword ptr [rsp + 0x20]
0x1006a3cc0: lea eax, [rax + rbx*4]
0x1006a3cc3: mov rcx, qword ptr [rsp + 0x28]
0x1006a3cc8: movzx ebx, word ptr [rcx + r15 + 0x7c]
0x1006a3cce: test ebx, ebx
0x1006a3cd0: mov qword ptr [rsp + 0x20], rax
0x1006a3cd5: je 0x1006a3d20
0x1006a3cd7: movzx eax, word ptr [rcx + r15 + 0x7e]
0x1006a3cdd: mov esi, dword ptr [rcx + r15 + 0x78]
0x1006a3ce2: add esi, dword ptr [r12 + rax*4 + 0xb4]
0x1006a3cea: imul rax, rax, 0x3540
0x1006a3cf1: mov rcx, qword ptr [rsp + 0x18]
0x1006a3cf6: lea rdi, [rcx + rax + 0xf00]
0x1006a3cfe: mov edx, ebx
0x1006a3d00: call 0x1007f6ae0 ; 0x1007f6ae0
0x1006a3d05: mov rax, qword ptr [rsp + 0x20]
0x1006a3d0a: lea eax, [rax + rbx*4]
0x1006a3d0d: mov qword ptr [rsp + 0x20], rax
0x1006a3d12: nop word ptr cs:[rax + rax]
0x1006a3d20: mov eax, dword ptr [r12 + 0x1d8]
0x1006a3d28: inc r14d
0x1006a3d2b: cmp r14d, eax
0x1006a3d2e: jb 0x1006a3800
0x1006a3d34: mov rcx, qword ptr [rsp + 0x38]
0x1006a3d39: inc rcx
0x1006a3d3c: mov r12, qword ptr [rsp + 0x50]
0x1006a3d41: cmp rcx, r12
0x1006a3d44: jb 0x1006a36df
0x1006a3d4a: mov dword ptr [rsp + 0xe8], r13d
0x1006a3d52: mov rax, qword ptr [rsp + 0x20]
0x1006a3d57: mov dword ptr [rsp + 0xe0], eax
0x1006a3d5e: mov r14d, dword ptr [rsp + 0x60]
0x1006a3d63: test r14d, r14d
0x1006a3d66: mov rdx, qword ptr [rsp + 0x70]
0x1006a3d6b: mov r15, qword ptr [rsp + 0x30]
0x1006a3d70: je 0x1006a3d9a
0x1006a3d72: xor eax, eax
0x1006a3d74: nop word ptr cs:[rax + rax]
0x1006a3d80: mov ecx, eax
0x1006a3d82: shl rcx, 4
0x1006a3d86: cmp dword ptr [rdx + rcx], 0x8001
0x1006a3d8d: jae 0x1006a43e1
0x1006a3d93: inc eax
0x1006a3d95: cmp eax, r14d
0x1006a3d98: jb 0x1006a3d80
0x1006a3d9a: mov rax, qword ptr [rsp + 0x18]
0x1006a3d9f: cmp byte ptr [rax + 0x339], 0
0x1006a3da6: jne 0x1006a3e8c
0x1006a3dac: mov al, byte ptr [rip + 0x198f54e] ; 0x102033300
0x1006a3db2: and al, 1
0x1006a3db4: or al, byte ptr [rip + 0x198f6de] ; 0x102033498
0x1006a3dba: jne 0x1006a4144
0x1006a3dc0: cmp byte ptr [rip + 0x198f821], 0 ; 0x1020335e8
0x1006a3dc7: jne 0x1006a43c7
0x1006a3dcd: lea rsi, [rsp + 0xa0]
0x1006a3dd5: mov rdi, qword ptr [rsp + 0x18]
0x1006a3dda: vzeroupper 
0x1006a3ddd: call 0x1006a57c0 ; 0x1006a57c0
0x1006a3de2: call 0x1007c6c20 ; 0x1007c6c20
0x1006a3de7: mov rbx, qword ptr [rsp + 0x70]
0x1006a3dec: mov rdi, rax
0x1006a3def: mov rsi, r15
0x1006a3df2: call 0x100795a70 ; 0x100795a70
0x1006a3df7: call 0x1007c6c20 ; 0x1007c6c20
0x1006a3dfc: mov rdi, rax
0x1006a3dff: mov rsi, rbx
0x1006a3e02: call 0x100795a70 ; 0x100795a70
0x1006a3e07: call 0x1007c6c20 ; 0x1007c6c20
0x1006a3e0c: mov rdi, rax
0x1006a3e0f: mov rsi, qword ptr [rsp + 0x40]
0x1006a3e14: call 0x100795a70 ; 0x100795a70
0x1006a3e19: mov rax, qword ptr [rip + 0x569ab8] ; 0x100c0d8d8
0x1006a3e20: mov rax, qword ptr [rax]
0x1006a3e23: cmp rax, qword ptr [rsp + 0x1a0]
0x1006a3e2b: jne 0x1006a43dc
0x1006a3e31: lea rsp, [rbp - 0x28]
0x1006a3e35: pop rbx
0x1006a3e36: pop r12
0x1006a3e38: pop r13
0x1006a3e3a: pop r14
0x1006a3e3c: pop r15
0x1006a3e3e: pop rbp
0x1006a3e3f: ret 
0x1006a3e40: lea rsi, [rbx + 0x470]
0x1006a3e47: lea rdi, [rsp + 0x140]
0x1006a3e4f: call 0x1007e9360 ; 0x1007e9360
0x1006a3e54: lea rdi, [rbx + 0x4b8]
0x1006a3e5b: mov rsi, 0xffffffffffffffff
0x1006a3e62: call 0x10077dea0 ; 0x10077dea0
0x1006a3e67: lea rdi, [rbx + 0x4f0]
0x1006a3e6e: mov rsi, 0xffffffffffffffff
0x1006a3e75: call 0x10077dea0 ; 0x10077dea0
0x1006a3e7a: lea rdi, [rsp + 0x140]
0x1006a3e82: call 0x1007e9480 ; 0x1007e9480
0x1006a3e87: jmp 0x1006a3466 ; 0x1006a3466
0x1006a3e8c: mov rax, qword ptr [rsp + 0x18]
0x1006a3e91: lea rax, [rax + 0xc18]
0x1006a3e98: mov qword ptr [rsp + 0x58], rax
0x1006a3e9d: xor eax, eax
0x1006a3e9f: mov qword ptr [rsp + 0x38], rax
0x1006a3ea4: mov dword ptr [rsp + 0x48], 0
0x1006a3eac: mov rbx, qword ptr [rsp + 0x18]
0x1006a3eb1: cmp dword ptr [rbx + 0xc20], 2
0x1006a3eb8: jne 0x1006a4400
0x1006a3ebe: cmp dword ptr [rbx + 0xc10], 4
0x1006a3ec5: jne 0x1006a441f
0x1006a3ecb: mov byte ptr [rbx + 0xc08], 1
0x1006a3ed2: mov rdi, qword ptr [rsp + 0x58]
0x1006a3ed7: call 0x100795060 ; 0x100795060
0x1006a3edc: mov ecx, dword ptr [rsp + 0x48]
0x1006a3ee0: mov r8d, ecx
0x1006a3ee3: lea rdi, [rax + r8*4]
0x1006a3ee7: mov rdx, qword ptr [rsp + 0x38]
0x1006a3eec: imul rsi, rdx, 0x550
0x1006a3ef3: mov qword ptr [rsp + 0x20], rdi
0x1006a3ef8: mov qword ptr [rbx + rsi + 0xc54c0], rdi
0x1006a3f00: mov dword ptr [rbx + rsi + 0xc54c8], ecx
0x1006a3f07: mov dword ptr [rbx + rsi + 0xc54cc], 0
0x1006a3f12: mov rdi, rdx
0x1006a3f15: shl rdi, 4
0x1006a3f19: mov rcx, qword ptr [rsp + 0x68]
0x1006a3f1e: mov edx, dword ptr [rcx + rdi]
0x1006a3f21: test edx, edx
0x1006a3f23: je 0x1006a404f
0x1006a3f29: lea r11, [rbx + rsi + 0xc54cc]
0x1006a3f31: lea r14, [rcx + rdi]
0x1006a3f35: mov r10, qword ptr [rcx + rdi + 8]
0x1006a3f3a: lea rax, [rax + r8*4 + 0x30]
0x1006a3f3f: mov qword ptr [rsp + 0x28], rax
0x1006a3f44: xor ecx, ecx
0x1006a3f46: xor ebx, ebx
0x1006a3f48: mov qword ptr [rsp + 0x60], r14
0x1006a3f4d: mov eax, ebx
0x1006a3f4f: lea rsi, [rax + rax*2]
0x1006a3f53: mov eax, dword ptr [r10 + rsi*8 + 8]
0x1006a3f58: test rax, rax
0x1006a3f5b: je 0x1006a3f7a
0x1006a3f5d: mov rdx, qword ptr [r10 + rsi*8]
0x1006a3f61: mov ecx, ecx
0x1006a3f63: lea r13, [r10 + rsi*8 + 8]
0x1006a3f68: mov esi, dword ptr [r10 + rsi*8 + 0x10]
0x1006a3f6d: cmp eax, 0x10
0x1006a3f70: jae 0x1006a3f81
0x1006a3f72: xor r9d, r9d
0x1006a3f75: jmp 0x1006a400a ; 0x1006a400a
0x1006a3f7a: xor eax, eax
0x1006a3f7c: jmp 0x1006a403e ; 0x1006a403e
0x1006a3f81: mov r15d, eax
0x1006a3f84: and r15d, 0xf
0x1006a3f88: mov r9, rax
0x1006a3f8b: sub r9, r15
0x1006a3f8e: vmovd xmm0, esi
0x1006a3f92: vpshufd xmm0, xmm0, 0
0x1006a3f97: lea r12, [rdx + 0x18]
0x1006a3f9b: mov rdi, qword ptr [rsp + 0x28]
0x1006a3fa0: lea r8, [rdi + rcx*4]
0x1006a3fa4: mov r14, r9
0x1006a3fa7: nop word ptr [rax + rax]
0x1006a3fb0: vpmovzxwd xmm1, qword ptr [r12 - 0x18]
0x1006a3fb7: vpmovzxwd xmm2, qword ptr [r12 - 0x10]
0x1006a3fbe: vpmovzxwd xmm3, qword ptr [r12 - 8]
0x1006a3fc5: vpmovzxwd xmm4, qword ptr [r12]
0x1006a3fcb: vpaddd xmm1, xmm0, xmm1
0x1006a3fcf: vpaddd xmm2, xmm0, xmm2
0x1006a3fd3: vpaddd xmm3, xmm0, xmm3
0x1006a3fd7: vpaddd xmm4, xmm0, xmm4
0x1006a3fdb: vmovdqu xmmword ptr [r8 - 0x30], xmm1
0x1006a3fe1: vmovdqu xmmword ptr [r8 - 0x20], xmm2
0x1006a3fe7: vmovdqu xmmword ptr [r8 - 0x10], xmm3
0x1006a3fed: vmovdqu xmmword ptr [r8], xmm4
0x1006a3ff2: add r12, 0x20
0x1006a3ff6: add r8, 0x40
0x1006a3ffa: add r14, -0x10
0x1006a3ffe: jne 0x1006a3fb0
0x1006a4000: test r15d, r15d
0x1006a4003: mov r14, qword ptr [rsp + 0x60]
0x1006a4008: je 0x1006a4034
0x1006a400a: sub rax, r9
0x1006a400d: shl rcx, 2
0x1006a4011: lea rcx, [rcx + r9*4]
0x1006a4015: add rcx, qword ptr [rsp + 0x20]
0x1006a401a: lea rdx, [rdx + r9*2]
0x1006a401e: nop 
0x1006a4020: movzx edi, word ptr [rdx]
0x1006a4023: add edi, esi
0x1006a4025: mov dword ptr [rcx], edi
0x1006a4027: add rcx, 4
0x1006a402b: add rdx, 2
0x1006a402f: dec rax
0x1006a4032: jne 0x1006a4020
0x1006a4034: mov eax, dword ptr [r13]
0x1006a4038: mov ecx, dword ptr [r11]
0x1006a403b: mov edx, dword ptr [r14]
0x1006a403e: add ecx, eax
0x1006a4040: mov dword ptr [r11], ecx
0x1006a4043: inc ebx
0x1006a4045: cmp ebx, edx
0x1006a4047: jb 0x1006a3f4d
0x1006a404d: jmp 0x1006a4051 ; 0x1006a4051
0x1006a404f: xor ecx, ecx
0x1006a4051: add dword ptr [rsp + 0x48], ecx
0x1006a4055: mov rax, qword ptr [rsp + 0x38]
0x1006a405a: mov rcx, rax
0x1006a405d: inc rcx
0x1006a4060: mov rax, rcx
0x1006a4063: mov qword ptr [rsp + 0x38], rax
0x1006a4068: cmp rcx, 0x3b
0x1006a406c: jb 0x1006a3eac
0x1006a4072: mov eax, dword ptr [rsp + 0x48]
0x1006a4076: shl eax, 2
0x1006a4079: add dword ptr [rsp + 0xe0], eax
0x1006a4080: mov rax, qword ptr [rsp + 0x18]
0x1006a4085: mov eax, dword ptr [rax + 0xe0c]
0x1006a408b: test eax, eax
0x1006a408d: je 0x1006a40c5
0x1006a408f: mov rcx, qword ptr [rsp + 0x18]
0x1006a4094: lea rcx, [rcx + 0xc59fa]
0x1006a409b: xor esi, esi
0x1006a409d: cmp byte ptr [rcx], 1
0x1006a40a0: je 0x1006a443e
0x1006a40a6: mov edx, dword ptr [rcx - 0x532]
0x1006a40ac: mov edi, dword ptr [rcx - 0x52e]
0x1006a40b2: mov dword ptr [rcx - 0x1e], edi
0x1006a40b5: mov dword ptr [rcx - 0x12], edx
0x1006a40b8: inc esi
0x1006a40ba: add rcx, 0x550
0x1006a40c1: cmp esi, eax
0x1006a40c3: jb 0x1006a409d
0x1006a40c5: mov rax, qword ptr [rsp + 0x18]
0x1006a40ca: cmp dword ptr [rax + 0xb20], 2
0x1006a40d1: jne 0x1006a4466
0x1006a40d7: mov rax, qword ptr [rsp + 0x18]
0x1006a40dc: cmp dword ptr [rax + 0xad0], 0x28
0x1006a40e3: jne 0x1006a448d
0x1006a40e9: mov rax, qword ptr [rsp + 0x18]
0x1006a40ee: lea rdi, [rax + 0xb18]
0x1006a40f5: mov r15, qword ptr [rsp + 0x30]
0x1006a40fa: call 0x100795060 ; 0x100795060
0x1006a40ff: mov r14, rax
0x1006a4102: mov rax, qword ptr [rsp + 0x18]
0x1006a4107: lea rbx, [rax + 0x4b8]
0x1006a410e: mov r12, qword ptr [rax + 0x4d8]
0x1006a4115: mov rdi, rbx
0x1006a4118: call 0x10077e670 ; 0x10077e670
0x1006a411d: mov rdi, r14
0x1006a4120: mov rsi, r12
0x1006a4123: mov rdx, rax
0x1006a4126: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1006a412b: mov rdi, rbx
0x1006a412e: call 0x10077e670 ; 0x10077e670
0x1006a4133: add dword ptr [rsp + 0xe4], eax
0x1006a413a: mov r12, qword ptr [rsp + 0x50]
0x1006a413f: jmp 0x1006a3dac ; 0x1006a3dac
0x1006a4144: mov eax, dword ptr [rip + 0x65e956] ; 0x100d02aa0
0x1006a414a: mov rcx, qword ptr [rsp + 0x18]
0x1006a414f: mov dword ptr [rcx + 0xe6e6c], eax
0x1006a4155: test r12d, r12d
0x1006a4158: je 0x1006a3dc0
0x1006a415e: xor ebx, ebx
0x1006a4160: lea r13, [rsp + 0x80]
0x1006a4168: lea r14, [rsp + 0xf0]
0x1006a4170: mov rax, qword ptr [rsp + 0x40]
0x1006a4175: mov r12, qword ptr [rax + rbx*8]
0x1006a4179: cmp byte ptr [r12 + 0x5e4], 0
0x1006a4182: jne 0x1006a418e
0x1006a4184: mov al, byte ptr [rip + 0x198f30e] ; 0x102033498
0x1006a418a: test al, al
0x1006a418c: jne 0x1006a419d
0x1006a418e: inc rbx
0x1006a4191: cmp rbx, qword ptr [rsp + 0x50]
0x1006a4196: jb 0x1006a4170
0x1006a4198: jmp 0x1006a3dc0 ; 0x1006a3dc0
0x1006a419d: vmovss xmm0, dword ptr [rip + 0x400413] ; 0x100aa45b8
0x1006a41a5: vmulss xmm0, xmm0, dword ptr [r12 + 0x5e0]
0x1006a41af: vmovaps xmm1, xmmword ptr [r12 + 0x20]
0x1006a41b6: vmovaps xmm2, xmmword ptr [r12 + 0x30]
0x1006a41bd: vmovaps xmm3, xmmword ptr [r12 + 0x40]
0x1006a41c4: vpermilps xmm0, xmm0, 0xc0
0x1006a41ca: mov rax, qword ptr [rip + 0x569937] ; 0x100c0db08
0x1006a41d1: vmulps xmm4, xmm0, xmmword ptr [rax]
0x1006a41d5: vmulps xmm5, xmm0, xmmword ptr [rax + 0x10]
0x1006a41da: vmulps xmm0, xmm0, xmmword ptr [rax + 0x20]
0x1006a41df: vpermilps xmm6, xmm4, 0xc0
0x1006a41e5: vmulps xmm6, xmm1, xmm6
0x1006a41e9: vpermilps xmm7, xmm4, 0xd5
0x1006a41ef: vmulps xmm7, xmm2, xmm7
0x1006a41f3: vaddps xmm6, xmm7, xmm6
0x1006a41f7: vpermilps xmm4, xmm4, 0xea
0x1006a41fd: vmulps xmm4, xmm3, xmm4
0x1006a4201: vaddps xmm4, xmm4, xmm6
0x1006a4205: vpermilps xmm6, xmm5, 0xc0
0x1006a420b: vmulps xmm6, xmm1, xmm6
0x1006a420f: vpermilps xmm7, xmm5, 0xd5
0x1006a4215: vmulps xmm7, xmm2, xmm7
0x1006a4219: vaddps xmm6, xmm7, xmm6
0x1006a421d: vpermilps xmm5, xmm5, 0xea
0x1006a4223: vmulps xmm5, xmm3, xmm5
0x1006a4227: vaddps xmm5, xmm5, xmm6
0x1006a422b: vpermilps xmm6, xmm0, 0xc0
0x1006a4231: vmulps xmm1, xmm1, xmm6
0x1006a4235: vpermilps xmm6, xmm0, 0xd5
0x1006a423b: vmulps xmm2, xmm2, xmm6
0x1006a423f: vaddps xmm1, xmm2, xmm1
0x1006a4243: vpermilps xmm0, xmm0, 0xea
0x1006a4249: vmulps xmm0, xmm3, xmm0
0x1006a424d: vaddps xmm0, xmm0, xmm1
0x1006a4251: vinsertf128 ymm1, ymm4, xmm5, 1
0x1006a4257: vmovups ymmword ptr [rsp + 0x140], ymm1
0x1006a4260: vmovaps xmmword ptr [rsp + 0x160], xmm0
0x1006a4269: mov ecx, dword ptr [r12 + 0x1d8]
0x1006a4271: test ecx, ecx
0x1006a4273: je 0x1006a43af
0x1006a4279: xor r15d, r15d
0x1006a427c: jmp 0x1006a42a2 ; 0x1006a42a2
0x1006a427e: vxorps xmm0, xmm0, xmm0
0x1006a4282: vmovss xmm1, dword ptr [rip + 0x400e36] ; 0x100aa50c0
0x1006a428a: cmp eax, 1
0x1006a428d: je 0x1006a42ee
0x1006a428f: vxorps xmm1, xmm1, xmm1
0x1006a4293: vmovss xmm2, dword ptr [rip + 0x400e25] ; 0x100aa50c0
0x1006a429b: cmp eax, 2
0x1006a429e: jne 0x1006a42fb
0x1006a42a0: jmp 0x1006a42ff ; 0x1006a42ff
0x1006a42a2: mov rax, qword ptr [r12 + 0x1a8]
0x1006a42aa: mov r15d, r15d
0x1006a42ad: movsx eax, word ptr [rax + r15*2]
0x1006a42b2: cmp eax, -1
0x1006a42b5: je 0x1006a43a3
0x1006a42bb: mov rcx, qword ptr [r12 + 0x1a0]
0x1006a42c3: mov qword ptr [rsp + 0x20], rcx
0x1006a42c8: mov ecx, eax
0x1006a42ca: sar ecx, 0x1f
0x1006a42cd: shr ecx, 0x1e
0x1006a42d0: add ecx, eax
0x1006a42d2: and ecx, 0xfffffffc
0x1006a42d5: vmovss xmm0, dword ptr [rip + 0x400de3] ; 0x100aa50c0
0x1006a42dd: sub eax, ecx
0x1006a42df: jne 0x1006a427e
0x1006a42e1: vmovss xmm1, dword ptr [rip + 0x400dd7] ; 0x100aa50c0
0x1006a42e9: cmp eax, 1
0x1006a42ec: jne 0x1006a428f
0x1006a42ee: vmovss xmm2, dword ptr [rip + 0x400dca] ; 0x100aa50c0
0x1006a42f6: cmp eax, 2
0x1006a42f9: je 0x1006a42ff
0x1006a42fb: vxorps xmm2, xmm2, xmm2
0x1006a42ff: vinsertps xmm0, xmm0, xmm1, 0x10
0x1006a4305: vinsertps xmm0, xmm0, xmm2, 0x20
0x1006a430b: vmovss xmm1, dword ptr [rip + 0x400dad] ; 0x100aa50c0
0x1006a4313: vinsertps xmm0, xmm0, xmm1, 0x30
0x1006a4319: vmovaps xmmword ptr [rsp + 0x130], xmm0
0x1006a4322: mov rdi, r13
0x1006a4325: lea rsi, [rsp + 0x130]
0x1006a432d: vmovd xmm0, dword ptr [rip + 0x404283] ; 0x100aa85b8
0x1006a4335: vzeroupper 
0x1006a4338: call 0x10077d310 ; 0x10077d310
0x1006a433d: vmovdqa xmm0, xmmword ptr [rsp + 0x80]
0x1006a4346: vmovdqa xmmword ptr [rsp + 0xf0], xmm0
0x1006a434f: call 0x1002b9810 ; 0x1002b9810
0x1006a4354: mov rcx, r15
0x1006a4357: shl rcx, 4
0x1006a435b: mov rdx, qword ptr [rsp + 0x20]
0x1006a4360: vmovdqa xmm0, xmmword ptr [rdx + rcx]
0x1006a4365: vmovdqa xmmword ptr [rsp + 0x80], xmm0
0x1006a436e: mov dword ptr [rsp], 0
0x1006a4375: mov rdi, rax
0x1006a4378: mov rsi, r13
0x1006a437b: lea rdx, [rsp + 0x140]
0x1006a4383: lea rcx, [rsp + 0x150]
0x1006a438b: lea r8, [rsp + 0x160]
0x1006a4393: mov r9, r14
0x1006a4396: call 0x1002bc2f0 ; 0x1002bc2f0
0x1006a439b: mov ecx, dword ptr [r12 + 0x1d8]
0x1006a43a3: inc r15d
0x1006a43a6: cmp r15d, ecx
0x1006a43a9: jb 0x1006a42a2
0x1006a43af: mov r15, qword ptr [rsp + 0x30]
0x1006a43b4: inc rbx
0x1006a43b7: cmp rbx, qword ptr [rsp + 0x50]
0x1006a43bc: jb 0x1006a4170
0x1006a43c2: jmp 0x1006a3dc0 ; 0x1006a3dc0
0x1006a43c7: lea rdi, [rsp + 0xa0]
0x1006a43cf: vzeroupper 
0x1006a43d2: call 0x1006a47d0 ; 0x1006a47d0
0x1006a43d7: jmp 0x1006a3dcd ; 0x1006a3dcd
0x1006a43dc: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1006a43e1: lea rdi, [rip + 0x4f5b7f] ; 0x100b99f67 renderLists[ i ].chunkCount <= kMaxVisibleBins
0x1006a43e8: lea rsi, [rip + 0x4f55f2] ; 0x100b999e1 TerrainBarn.cpp
0x1006a43ef: mov edx, 0x6d8
0x1006a43f4: mov ecx, 3
0x1006a43f9: call 0x1007e5f70 ; 0x1007e5f70
0x1006a43fe: ud2 
0x1006a4400: lea rdi, [rip + 0x4e5cf2] ; 0x100b8a0f9 m_indexBuffers[ idx ].mb.GetUsage() == Bind_Dynamic
0x1006a4407: lea rsi, [rip + 0x4bde6d] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1006a440e: mov edx, 0x11e
0x1006a4413: mov ecx, 3
0x1006a4418: call 0x1007e5f70 ; 0x1007e5f70
0x1006a441d: jmp 0x1006a43fe ; 0x1006a43fe
0x1006a441f: lea rdi, [rip + 0x4e5d07] ; 0x100b8a12d sizeof( IndexType ) == m_indexBuffers[ idx ].idxSize
0x1006a4426: lea rsi, [rip + 0x4bde4e] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1006a442d: mov edx, 0x11f
0x1006a4432: mov ecx, 3
0x1006a4437: call 0x1007e5f70 ; 0x1007e5f70
0x1006a443c: jmp 0x1006a43fe ; 0x1006a43fe
0x1006a443e: lea rdi, [rip + 0x4bde2c] ; 0x100b62271 !m_queued
0x1006a4445: lea rsi, [rip + 0x4bde2f] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1006a444c: lea r8, [rip + 0x4bde44] ; 0x100b62297 VertexRender has already been committed!
0x1006a4453: mov edx, 0x91
0x1006a4458: mov ecx, 4
0x1006a445d: xor eax, eax
0x1006a445f: call 0x1007e6030 ; 0x1007e6030
0x1006a4464: jmp 0x1006a43fe ; 0x1006a43fe
0x1006a4466: lea rdi, [rip + 0x4d28ae] ; 0x100b76d1b m_vertexBuffers[ idx ].GetUsage() == Bind_Dynamic
0x1006a446d: lea rsi, [rip + 0x4bde07] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1006a4474: mov edx, 0x115
0x1006a4479: mov ecx, 3
0x1006a447e: mov r15, qword ptr [rsp + 0x30]
0x1006a4483: call 0x1007e5f70 ; 0x1007e5f70
0x1006a4488: jmp 0x1006a43fe ; 0x1006a43fe
0x1006a448d: lea rdi, [rip + 0x4d28b9] ; 0x100b76d4d VsIsValidMap< BufferType >::Test( &m_format, idx )
0x1006a4494: lea rsi, [rip + 0x4bdde0] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1006a449b: mov edx, 0x116
0x1006a44a0: mov ecx, 3
0x1006a44a5: mov r15, qword ptr [rsp + 0x30]
0x1006a44aa: call 0x1007e5f70 ; 0x1007e5f70
0x1006a44af: jmp 0x1006a43fe ; 0x1006a43fe
0x1006a44b4: mov rbx, rax
0x1006a44b7: jmp 0x1006a45f4 ; 0x1006a45f4
0x1006a44bc: mov rbx, rax
0x1006a44bf: jmp 0x1006a45f4 ; 0x1006a45f4
0x1006a44c4: mov rbx, rax
0x1006a44c7: jmp 0x1006a45f4 ; 0x1006a45f4
0x1006a44cc: mov rbx, rax
0x1006a44cf: jmp 0x1006a45f4 ; 0x1006a45f4
0x1006a44d4: mov rbx, rax
0x1006a44d7: lea rdi, [rsp + 0x140]
0x1006a44df: call 0x1007e9480 ; 0x1007e9480
0x1006a44e4: jmp 0x1006a45f4 ; 0x1006a45f4
0x1006a44e9: mov rbx, rax
0x1006a44ec: jmp 0x1006a45f4 ; 0x1006a45f4
0x1006a44f1: mov rbx, rax
0x1006a44f4: jmp 0x1006a45f4 ; 0x1006a45f4
0x1006a44f9: mov rbx, rax
0x1006a44fc: jmp 0x1006a45f9 ; 0x1006a45f9
0x1006a4501: mov rdi, rax
0x1006a4504: call 0x100011bf0 ; 0x100011bf0
0x1006a4509: mov rdi, rax
0x1006a450c: call 0x100011bf0 ; 0x100011bf0
0x1006a4511: mov rdi, rax
0x1006a4514: call 0x100011bf0 ; 0x100011bf0
0x1006a4519: jmp 0x1006a462d ; 0x1006a462d
0x1006a451e: jmp 0x1006a462d ; 0x1006a462d
0x1006a4523: mov rbx, rax
0x1006a4526: jmp 0x1006a4609 ; 0x1006a4609
0x1006a452b: jmp 0x1006a4545 ; 0x1006a4545
0x1006a452d: mov rdi, rax
0x1006a4530: call 0x100011bf0 ; 0x100011bf0
0x1006a4535: mov rdi, rax
0x1006a4538: call 0x100011bf0 ; 0x100011bf0
0x1006a453d: mov rbx, rax
0x1006a4540: jmp 0x1006a4642 ; 0x1006a4642
0x1006a4545: mov rbx, rax
0x1006a4548: jmp 0x1006a4652 ; 0x1006a4652
0x1006a454d: mov rdi, rax
0x1006a4550: call 0x100011bf0 ; 0x100011bf0
0x1006a4555: mov rbx, rax
0x1006a4558: jmp 0x1006a45f4 ; 0x1006a45f4
0x1006a455d: jmp 0x1006a4595 ; 0x1006a4595
0x1006a455f: mov rbx, rax
0x1006a4562: lea rdi, [rsp + 0x140]
0x1006a456a: call 0x1007e9480 ; 0x1007e9480
0x1006a456f: jmp 0x1006a4574 ; 0x1006a4574
0x1006a4571: mov rbx, rax
0x1006a4574: call 0x1007c6c20 ; 0x1007c6c20
0x1006a4579: mov r15, qword ptr [rsp + 0x30]
0x1006a457e: mov rdi, rax
0x1006a4581: mov rsi, qword ptr [rsp + 0x78]
0x1006a4586: call 0x100795a70 ; 0x100795a70
0x1006a458b: jmp 0x1006a459d ; 0x1006a459d
0x1006a458d: mov rdi, rax
0x1006a4590: call 0x100011bf0 ; 0x100011bf0
0x1006a4595: mov rbx, rax
0x1006a4598: mov r15, qword ptr [rsp + 0x30]
0x1006a459d: call 0x1007c6c20 ; 0x1007c6c20
0x1006a45a2: mov rdi, rax
0x1006a45a5: mov rsi, r13
0x1006a45a8: call 0x100795a70 ; 0x100795a70
0x1006a45ad: jmp 0x1006a45f9 ; 0x1006a45f9
0x1006a45af: mov rdi, rax
0x1006a45b2: call 0x100011bf0 ; 0x100011bf0
0x1006a45b7: mov rbx, rax
0x1006a45ba: mov dword ptr [rsp + 0xe8], r13d
0x1006a45c2: mov rax, qword ptr [rsp + 0x20]
0x1006a45c7: mov dword ptr [rsp + 0xe0], eax
0x1006a45ce: jmp 0x1006a45f4 ; 0x1006a45f4
0x1006a45d0: mov rdi, rax
0x1006a45d3: call 0x100011bf0 ; 0x100011bf0
0x1006a45d8: mov rbx, rax
0x1006a45db: jmp 0x1006a45f4 ; 0x1006a45f4
0x1006a45dd: mov rbx, rax
0x1006a45e0: mov rax, qword ptr [rsp + 0x20]
0x1006a45e5: mov dword ptr [rsp + 0xe0], eax
0x1006a45ec: mov dword ptr [rsp + 0xe8], r13d
0x1006a45f4: mov r15, qword ptr [rsp + 0x30]
0x1006a45f9: call 0x1007c6c20 ; 0x1007c6c20
0x1006a45fe: mov rdi, rax
0x1006a4601: mov rsi, r15
0x1006a4604: call 0x100795a70 ; 0x100795a70
0x1006a4609: call 0x1007c6c20 ; 0x1007c6c20
0x1006a460e: mov rsi, qword ptr [rsp + 0x70]
0x1006a4613: mov rdi, rax
0x1006a4616: call 0x100795a70 ; 0x100795a70
0x1006a461b: jmp 0x1006a4652 ; 0x1006a4652
0x1006a461d: mov rdi, rax
0x1006a4620: call 0x100011bf0 ; 0x100011bf0
0x1006a4625: mov rdi, rax
0x1006a4628: call 0x100011bf0 ; 0x100011bf0
0x1006a462d: mov rbx, rax
0x1006a4630: call 0x1007c6c20 ; 0x1007c6c20
0x1006a4635: mov rdi, rax
0x1006a4638: mov rsi, qword ptr [rsp + 0x20]
0x1006a463d: call 0x100795a70 ; 0x100795a70
0x1006a4642: call 0x1007c6c20 ; 0x1007c6c20
0x1006a4647: mov rdi, rax
0x1006a464a: mov rsi, r15
0x1006a464d: call 0x100795a70 ; 0x100795a70
0x1006a4652: call 0x1007c6c20 ; 0x1007c6c20
0x1006a4657: mov rdi, rax
0x1006a465a: mov rsi, qword ptr [rsp + 0x40]
0x1006a465f: call 0x100795a70 ; 0x100795a70
0x1006a4664: mov rdi, rbx
0x1006a4667: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a466c: mov rdi, rax
0x1006a466f: call 0x100011bf0 ; 0x100011bf0
0x1006a4674: mov rdi, rax
0x1006a4677: call 0x100011bf0 ; 0x100011bf0
0x1006a467c: mov rdi, rax
0x1006a467f: call 0x100011bf0 ; 0x100011bf0
0x1006a4684: nop word ptr cs:[rax + rax]
