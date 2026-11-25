0x100061680: push rbp
0x100061681: mov rbp, rsp
0x100061684: push r15
0x100061686: push r14
0x100061688: push r13
0x10006168a: push r12
0x10006168c: push rbx
0x10006168d: sub rsp, 0x178
0x100061694: mov qword ptr [rbp - 0x120], r9
0x10006169b: mov qword ptr [rbp - 0xb0], r8
0x1000616a2: mov r13, rcx
0x1000616a5: mov ebx, edx
0x1000616a7: mov r12, rsi
0x1000616aa: mov r14, rdi
0x1000616ad: mov rax, qword ptr [rip + 0xbac224] ; 0x100c0d8d8
0x1000616b4: mov rax, qword ptr [rax]
0x1000616b7: mov qword ptr [rbp - 0x30], rax
0x1000616bb: call 0x10043fb50 ; 0x10043fb50
0x1000616c0: mov r15, rax
0x1000616c3: test bl, bl
0x1000616c5: je 0x100061ec5
0x1000616cb: cmp byte ptr [r13 + 0x24], 0
0x1000616d0: je 0x100061ec5
0x1000616d6: mov rdi, qword ptr [r13 + 0x28]
0x1000616da: cmp qword ptr [rdi + 0x190], 0
0x1000616e2: je 0x100061ec5
0x1000616e8: cmp byte ptr [rdi + 0x18e], 0
0x1000616ef: je 0x100061ec5
0x1000616f5: lea rax, [rip + 0x1fddfe4] ; 0x10203f6e0
0x1000616fc: vmovaps xmm0, xmmword ptr [rax]
0x100061700: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x100061708: mov esi, dword ptr [r13 + 0x20]
0x10006170c: lea rcx, [rbp - 0xd8]
0x100061713: lea r8, [rbp - 0xd4]
0x10006171a: mov rdx, r13
0x10006171d: call 0x100775f70 ; 0x100775f70
0x100061722: test al, al
0x100061724: mov qword ptr [rbp - 0x108], r14
0x10006172b: je 0x10006174f
0x10006172d: vmovss xmm0, dword ptr [rbp - 0xd8]
0x100061735: vmovss dword ptr [rbp - 0x130], xmm0
0x10006173d: vmovss xmm0, dword ptr [rbp - 0xd4]
0x100061745: vmovss dword ptr [rbp - 0x100], xmm0
0x10006174d: jmp 0x10006177b ; 0x10006177b
0x10006174f: mov dword ptr [rbp - 0xd4], 0x3eaa7efa
0x100061759: mov dword ptr [rbp - 0xd8], 0x3eaa7efa
0x100061763: vmovss xmm0, dword ptr [rip + 0xa46eed] ; 0x100aa8658
0x10006176b: vmovss dword ptr [rbp - 0x100], xmm0
0x100061773: vmovss dword ptr [rbp - 0x130], xmm0
0x10006177b: lea rax, [rip + 0x1fddf5e] ; 0x10203f6e0
0x100061782: vmovaps xmm0, xmmword ptr [rax]
0x100061786: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x10006178b: lea rcx, [rbp - 0x50]
0x10006178f: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x100061794: lea r8, [rbp - 0x40]
0x100061798: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x10006179d: mov rdi, qword ptr [r13 + 0x28]
0x1000617a1: mov esi, dword ptr [r13 + 0x20]
0x1000617a5: lea r14, [rbp - 0x60]
0x1000617a9: mov rdx, r14
0x1000617ac: call 0x100776270 ; 0x100776270
0x1000617b1: mov bl, al
0x1000617b3: mov rdi, qword ptr [r13 + 0x28]
0x1000617b7: mov esi, dword ptr [r13 + 0x20]
0x1000617bb: lea rcx, [rbp - 0xa2]
0x1000617c2: lea r8, [rbp - 0xa1]
0x1000617c9: lea rdx, [rbp - 0xa3]
0x1000617d0: call 0x100776580 ; 0x100776580
0x1000617d5: test al, al
0x1000617d7: je 0x100061848
0x1000617d9: movzx esi, byte ptr [rbp - 0xa3]
0x1000617e0: mov rdi, r15
0x1000617e3: call 0x1004434f0 ; 0x1004434f0
0x1000617e8: mov qword ptr [rbp - 0xc0], rax
0x1000617ef: movzx esi, byte ptr [rbp - 0xa2]
0x1000617f6: mov rdi, r15
0x1000617f9: call 0x1004434f0 ; 0x1004434f0
0x1000617fe: mov qword ptr [rbp - 0xf0], rax
0x100061805: movzx esi, byte ptr [rbp - 0xa1]
0x10006180c: mov rdi, r15
0x10006180f: call 0x1004434f0 ; 0x1004434f0
0x100061814: test bl, bl
0x100061816: jne 0x100061854
0x100061818: mov rcx, qword ptr [rbp - 0xc0]
0x10006181f: vmovaps xmm0, xmmword ptr [rcx + 0x20]
0x100061824: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x100061829: mov rcx, qword ptr [rbp - 0xf0]
0x100061830: vmovaps xmm0, xmmword ptr [rcx + 0x20]
0x100061835: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x10006183a: vmovaps xmm0, xmmword ptr [rax + 0x20]
0x10006183f: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x100061844: mov bl, 1
0x100061846: jmp 0x100061854 ; 0x100061854
0x100061848: vxorps xmm4, xmm4, xmm4
0x10006184c: test bl, bl
0x10006184e: je 0x100061e0e
0x100061854: vmovaps xmm0, xmmword ptr [r13]
0x10006185a: mov rax, qword ptr [rbp - 0xb0]
0x100061861: vsubps xmm0, xmm0, xmmword ptr [rax]
0x100061865: vmulps xmm0, xmm0, xmm0
0x100061869: vmovshdup xmm1, xmm0
0x10006186d: vaddss xmm1, xmm0, xmm1
0x100061871: vpermilpd xmm0, xmm0, 1
0x100061877: vaddss xmm0, xmm0, xmm1
0x10006187b: vsqrtss xmm0, xmm0, xmm0
0x10006187f: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x100061887: mov esi, 0x50
0x10006188c: mov rdi, r13
0x10006188f: call 0x10022ddd0 ; 0x10022ddd0
0x100061894: vmovss dword ptr [rbp - 0xf0], xmm0
0x10006189c: mov rdi, qword ptr [r13 + 0x28]
0x1000618a0: mov esi, dword ptr [r13 + 0x20]
0x1000618a4: lea rcx, [rbp - 0x84]
0x1000618ab: lea r8, [rbp - 0x78]
0x1000618af: lea r15, [rbp - 0x90]
0x1000618b6: mov rdx, r15
0x1000618b9: call 0x1007766d0 ; 0x1007766d0
0x1000618be: test al, al
0x1000618c0: je 0x100061d47
0x1000618c6: mov dword ptr [rbp - 0x170], ebx
0x1000618cc: vmovss xmm0, dword ptr [rip + 0xa437ec] ; 0x100aa50c0
0x1000618d4: vmovaps xmm1, xmm0
0x1000618d8: vsubss xmm0, xmm1, dword ptr [rbp - 0x130]
0x1000618e0: vsubss xmm0, xmm0, dword ptr [rbp - 0x100]
0x1000618e8: vmovss dword ptr [rbp - 0xa0], xmm0
0x1000618f0: mov eax, dword ptr [rbp - 0xd8]
0x1000618f6: mov dword ptr [rbp - 0x9c], eax
0x1000618fc: mov eax, dword ptr [rbp - 0xd4]
0x100061902: mov dword ptr [rbp - 0x98], eax
0x100061908: xor ebx, ebx
0x10006190a: vxorps xmm8, xmm8, xmm8
0x10006190f: vmovaps xmm4, xmmword ptr [rbp - 0xc0]
0x100061917: vmovaps xmm2, xmmword ptr [rbp - 0xd0]
0x10006191f: vmovaps xmm7, xmm1
0x100061923: vucomiss xmm8, xmm0
0x100061927: jae 0x100061b4d
0x10006192d: jmp 0x10006194e ; 0x10006194e
0x10006192f: nop 
0x100061930: vmovss xmm0, dword ptr [rbp + rbx*4 - 0x9c]
0x100061939: inc rbx
0x10006193c: add r15, 0xc
0x100061940: add r14, 0x10
0x100061944: vucomiss xmm8, xmm0
0x100061948: jae 0x100061b4d
0x10006194e: vmovaps xmmword ptr [rbp - 0x100], xmm0
0x100061956: vmovaps xmmword ptr [rbp - 0xd0], xmm2
0x10006195e: lea rax, [rip + 0x1fddd7b] ; 0x10203f6e0
0x100061965: vmovaps xmm0, xmmword ptr [rax]
0x100061969: vmovaps xmmword ptr [rbp - 0x160], xmm0
0x100061971: lea rdi, [rbp - 0x160]
0x100061978: mov rsi, r15
0x10006197b: call 0x100414690 ; 0x100414690
0x100061980: vxorps xmm8, xmm8, xmm8
0x100061985: vmovss xmm7, dword ptr [rip + 0xa43733] ; 0x100aa50c0
0x10006198d: vmovss xmm0, dword ptr [rbp - 0xf0]
0x100061995: vucomiss xmm0, dword ptr [rip + 0xa46cbf] ; 0x100aa865c
0x10006199d: vmaxss xmm0, xmm8, dword ptr [rbp - 0x140]
0x1000619a5: vminss xmm1, xmm7, xmm0
0x1000619a9: vmovaps xmm0, xmmword ptr [r12 + 0x20]
0x1000619b0: vmovaps xmm2, xmmword ptr [r12 + 0xc40]
0x1000619ba: vsubps xmm3, xmm0, xmm2
0x1000619be: vpermilps xmm1, xmm1, 0
0x1000619c4: vmulps xmm1, xmm3, xmm1
0x1000619c8: vaddps xmm1, xmm2, xmm1
0x1000619cc: vmulps xmm2, xmm1, xmmword ptr [rbp - 0x160]
0x1000619d4: vblendps xmm1, xmm2, xmm1, 8
0x1000619da: vbroadcastss xmm2, dword ptr [r12 + 0x280]
0x1000619e4: vmulps xmm2, xmm2, xmmword ptr [r12 + 0x270]
0x1000619ee: vbroadcastss xmm3, dword ptr [rbp - 0x138]
0x1000619f7: vmulps xmm2, xmm2, xmm3
0x1000619fb: vinsertps xmm2, xmm2, xmm7, 0x30
0x100061a01: vaddps xmm2, xmm1, xmm2
0x100061a05: vblendps xmm1, xmm2, xmm1, 8
0x100061a0b: vmovaps xmm3, xmmword ptr [rip + 0xa45eed] ; 0x100aa7900
0x100061a13: vxorps xmm3, xmm3, xmmword ptr [r12 + 0x290]
0x100061a1d: vmovaps xmm4, xmmword ptr [r13 + 0x10]
0x100061a23: vmulps xmm3, xmm4, xmm3
0x100061a27: vmovshdup xmm5, xmm3
0x100061a2b: vaddss xmm5, xmm3, xmm5
0x100061a2f: vpermilpd xmm3, xmm3, 1
0x100061a35: vaddss xmm3, xmm3, xmm5
0x100061a39: vmaxss xmm3, xmm8, xmm3
0x100061a3d: jbe 0x100061ac0
0x100061a43: vmovss xmm4, dword ptr [rip + 0xa42b6d] ; 0x100aa45b8
0x100061a4b: vmulss xmm3, xmm3, xmm4
0x100061a4f: vaddss xmm3, xmm3, xmm4
0x100061a53: vmovaps xmm4, xmmword ptr [r14]
0x100061a58: vpermilps xmm5, xmmword ptr [rbp - 0x100], 0xc0
0x100061a62: vmulps xmm5, xmm5, xmm4
0x100061a66: vblendps xmm4, xmm5, xmm4, 8
0x100061a6c: vmulss xmm3, xmm3, dword ptr [rbp - 0x13c]
0x100061a74: vpermilps xmm3, xmm3, 0xc0
0x100061a7a: vmulps xmm3, xmm0, xmm3
0x100061a7e: vblendps xmm0, xmm3, xmm0, 8
0x100061a84: vmulps xmm2, xmm2, xmmword ptr [rip + 0xa465f4] ; 0x100aa8080
0x100061a8c: vblendps xmm1, xmm2, xmm1, 8
0x100061a92: vaddps xmm1, xmm1, xmm0
0x100061a96: vblendps xmm0, xmm1, xmm0, 8
0x100061a9c: vmulps xmm0, xmm4, xmm0
0x100061aa0: vblendps xmm0, xmm0, xmm4, 8
0x100061aa6: vmovaps xmm2, xmmword ptr [rbp - 0xd0]
0x100061aae: vaddps xmm0, xmm2, xmm0
0x100061ab2: vmulps xmm0, xmm0, xmmword ptr [rip + 0xa465d6] ; 0x100aa8090
0x100061aba: jmp 0x100061b3f ; 0x100061b3f
0x100061abf: nop 
0x100061ac0: vmulps xmm4, xmm4, xmmword ptr [rbp - 0x150]
0x100061ac8: vmovshdup xmm5, xmm4
0x100061acc: vaddss xmm5, xmm4, xmm5
0x100061ad0: vpermilpd xmm4, xmm4, 1
0x100061ad6: vaddss xmm4, xmm4, xmm5
0x100061ada: vmaxss xmm4, xmm8, xmm4
0x100061ade: vmovaps xmm5, xmmword ptr [r14]
0x100061ae3: vpermilps xmm6, xmmword ptr [rbp - 0x100], 0xc0
0x100061aed: vmulps xmm6, xmm6, xmm5
0x100061af1: vblendps xmm5, xmm6, xmm5, 8
0x100061af7: vmulss xmm3, xmm3, dword ptr [rbp - 0x13c]
0x100061aff: vpermilps xmm3, xmm3, 0xc0
0x100061b05: vmulps xmm3, xmm0, xmm3
0x100061b09: vblendps xmm0, xmm3, xmm0, 8
0x100061b0f: vpermilps xmm3, xmm4, 0xc0
0x100061b15: vmulps xmm2, xmm2, xmm3
0x100061b19: vblendps xmm1, xmm2, xmm1, 8
0x100061b1f: vaddps xmm1, xmm0, xmm1
0x100061b23: vblendps xmm0, xmm1, xmm0, 8
0x100061b29: vmulps xmm0, xmm5, xmm0
0x100061b2d: vblendps xmm0, xmm0, xmm5, 8
0x100061b33: vmovaps xmm2, xmmword ptr [rbp - 0xd0]
0x100061b3b: vaddps xmm0, xmm2, xmm0
0x100061b3f: vmovaps xmm4, xmmword ptr [rbp - 0xc0]
0x100061b47: vblendps xmm2, xmm0, xmm2, 8
0x100061b4d: cmp rbx, 2
0x100061b51: jne 0x100061930
0x100061b57: mov r14, qword ptr [rbp - 0x108]
0x100061b5e: mov r8, qword ptr [rbp - 0x120]
0x100061b65: mov ebx, dword ptr [rbp - 0x170]
0x100061b6b: test bl, bl
0x100061b6d: mov rdx, qword ptr [rbp - 0xb0]
0x100061b74: je 0x100061dff
0x100061b7a: vmovaps xmmword ptr [rbp - 0xd0], xmm2
0x100061b82: cmp byte ptr [r12 + 0x110], 0
0x100061b8b: je 0x100061e48
0x100061b91: vmovaps xmm0, xmmword ptr [r12 + 0x290]
0x100061b9b: vmovaps xmmword ptr [rbp - 0xf0], xmm0
0x100061ba3: vxorps xmm0, xmm0, xmmword ptr [rip + 0xa45d55] ; 0x100aa7900
0x100061bab: vmovaps xmm1, xmmword ptr [r8]
0x100061bb0: vmovaps xmmword ptr [rbp - 0x170], xmm1
0x100061bb8: vmulps xmm0, xmm1, xmm0
0x100061bbc: vmovshdup xmm1, xmm0
0x100061bc0: vaddss xmm1, xmm0, xmm1
0x100061bc4: vpermilpd xmm0, xmm0, 1
0x100061bca: vaddss xmm0, xmm0, xmm1
0x100061bce: vmovss dword ptr [rbp - 0x130], xmm0
0x100061bd6: vsubss xmm0, xmm4, dword ptr [r12 + 0x200]
0x100061be0: vmulss xmm0, xmm0, dword ptr [r12 + 0x20c]
0x100061bea: vxorps xmm1, xmm1, xmm1
0x100061bee: vmaxss xmm0, xmm1, xmm0
0x100061bf2: vminss xmm0, xmm7, xmm0
0x100061bf6: vmulss xmm0, xmm0, dword ptr [rip + 0xa46a62] ; 0x100aa8660
0x100061bfe: call 0x100aa2702 ; 0x100aa2702 _exp2f
0x100061c03: vmovss xmm2, dword ptr [rip + 0xa434b5] ; 0x100aa50c0
0x100061c0b: vsubss xmm0, xmm2, xmm0
0x100061c0f: vmovss dword ptr [rbp - 0x100], xmm0
0x100061c17: vmovshdup xmm0, xmmword ptr [rbp - 0x170]
0x100061c1f: vandps xmm0, xmm0, xmmword ptr [rip + 0xa45ce9] ; 0x100aa7910
0x100061c27: vmovshdup xmm1, xmmword ptr [rbp - 0xf0]
0x100061c2f: vmulss xmm1, xmm1, dword ptr [rip + 0xa46995] ; 0x100aa85cc
0x100061c37: vaddss xmm1, xmm1, xmm2
0x100061c3b: vmovss xmm2, dword ptr [rbp - 0x130]
0x100061c43: vmulss xmm2, xmm2, dword ptr [rip + 0xa46a19] ; 0x100aa8664
0x100061c4b: vaddss xmm2, xmm2, dword ptr [rip + 0xa45c69] ; 0x100aa78bc
0x100061c53: vdivss xmm1, xmm1, xmm2
0x100061c57: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x100061c5c: vmovaps xmm4, xmmword ptr [rbp - 0xc0]
0x100061c64: vmulss xmm1, xmm4, dword ptr [rip + 0xa469fc] ; 0x100aa8668
0x100061c6c: vmovss xmm5, dword ptr [rip + 0xa4344c] ; 0x100aa50c0
0x100061c74: vaddss xmm1, xmm1, xmm5
0x100061c78: vxorps xmm3, xmm3, xmm3
0x100061c7c: vmaxss xmm0, xmm3, xmm0
0x100061c80: vminss xmm0, xmm5, xmm0
0x100061c84: vmovss xmm2, dword ptr [rip + 0xa469ac] ; 0x100aa8638
0x100061c8c: vmulss xmm0, xmm0, xmm2
0x100061c90: vmaxss xmm1, xmm3, xmm1
0x100061c94: vxorps xmm3, xmm3, xmm3
0x100061c98: vminss xmm1, xmm5, xmm1
0x100061c9c: vmulss xmm1, xmm1, xmm2
0x100061ca0: vroundss xmm2, xmm0, xmm0, 9
0x100061ca6: vcvttss2si rax, xmm2
0x100061cab: vroundss xmm1, xmm1, xmm1, 9
0x100061cb1: vcvttss2si rcx, xmm1
0x100061cb6: mov edx, eax
0x100061cb8: vcvtsi2ss xmm1, xmm9, rdx
0x100061cbd: vsubss xmm0, xmm0, xmm1
0x100061cc1: shl ecx, 6
0x100061cc4: cmp eax, 0x3f
0x100061cc7: mov edx, 0x3f
0x100061ccc: mov esi, 0x3f
0x100061cd1: cmovb esi, eax
0x100061cd4: or esi, ecx
0x100061cd6: shl rsi, 4
0x100061cda: inc eax
0x100061cdc: cmp eax, 0x3f
0x100061cdf: cmovae eax, edx
0x100061ce2: or eax, ecx
0x100061ce4: shl rax, 4
0x100061ce8: vmovaps xmm1, xmmword ptr [r12 + rax + 0x4c80]
0x100061cf2: vmovaps xmm2, xmmword ptr [r12 + rsi + 0x4c80]
0x100061cfc: vsubps xmm1, xmm1, xmm2
0x100061d00: vpermilps xmm0, xmm0, 0xc0
0x100061d06: vmulps xmm0, xmm1, xmm0
0x100061d0a: vaddps xmm0, xmm2, xmm0
0x100061d0e: vinsertps xmm0, xmm0, xmm5, 0x30
0x100061d14: vmaxss xmm1, xmm3, dword ptr [rbp - 0x100]
0x100061d1c: vminss xmm1, xmm5, xmm1
0x100061d20: vmovaps xmm2, xmmword ptr [rbp - 0xd0]
0x100061d28: vsubps xmm0, xmm0, xmm2
0x100061d2c: vpermilps xmm1, xmm1, 0
0x100061d32: vmulps xmm0, xmm1, xmm0
0x100061d36: vaddps xmm2, xmm2, xmm0
0x100061d3a: test bl, bl
0x100061d3c: je 0x100061ec5
0x100061d42: jmp 0x1000625ad ; 0x1000625ad
0x100061d47: vmovss xmm3, dword ptr [rip + 0xa43371] ; 0x100aa50c0
0x100061d4f: vmovss xmm0, dword ptr [rbp - 0xf0]
0x100061d57: vucomiss xmm0, dword ptr [rip + 0xa468fd] ; 0x100aa865c
0x100061d5f: vmovaps xmm2, xmmword ptr [rbp - 0xd0]
0x100061d67: jbe 0x100061e2a
0x100061d6d: vmovaps xmm0, xmmword ptr [r12 + 0x290]
0x100061d77: vxorps xmm0, xmm0, xmmword ptr [rip + 0xa45b81] ; 0x100aa7900
0x100061d7f: vmulps xmm0, xmm0, xmmword ptr [r13 + 0x10]
0x100061d85: vmovshdup xmm1, xmm0
0x100061d89: vaddss xmm1, xmm0, xmm1
0x100061d8d: vpermilpd xmm0, xmm0, 1
0x100061d93: vaddss xmm0, xmm0, xmm1
0x100061d97: vmovss xmm1, dword ptr [rip + 0xa42819] ; 0x100aa45b8
0x100061d9f: vmulss xmm0, xmm0, xmm1
0x100061da3: vaddss xmm0, xmm0, xmm1
0x100061da7: vmulss xmm0, xmm0, dword ptr [rip + 0xa45a3d] ; 0x100aa77ec
0x100061daf: vmovaps xmm1, xmmword ptr [r12 + 0x20]
0x100061db6: vpermilps xmm0, xmm0, 0xc0
0x100061dbc: vmulps xmm0, xmm1, xmm0
0x100061dc0: vblendps xmm0, xmm0, xmm1, 8
0x100061dc6: vaddps xmm1, xmm0, xmmword ptr [r12 + 0xc40]
0x100061dd0: vblendps xmm2, xmm1, xmm0, 8
0x100061dd6: mov r14, qword ptr [rbp - 0x108]
0x100061ddd: vmovaps xmm4, xmmword ptr [rbp - 0xc0]
0x100061de5: mov r8, qword ptr [rbp - 0x120]
0x100061dec: vmovaps xmm7, xmm3
0x100061df0: test bl, bl
0x100061df2: mov rdx, qword ptr [rbp - 0xb0]
0x100061df9: jne 0x100061b7a
0x100061dff: xor ebx, ebx
0x100061e01: test bl, bl
0x100061e03: je 0x100061ec5
0x100061e09: jmp 0x1000625ad ; 0x1000625ad
0x100061e0e: mov r14, qword ptr [rbp - 0x108]
0x100061e15: vmovaps xmm2, xmmword ptr [rbp - 0xd0]
0x100061e1d: test bl, bl
0x100061e1f: je 0x100061ec5
0x100061e25: jmp 0x1000625ad ; 0x1000625ad
0x100061e2a: xor ebx, ebx
0x100061e2c: mov r14, qword ptr [rbp - 0x108]
0x100061e33: vmovaps xmm4, xmmword ptr [rbp - 0xc0]
0x100061e3b: test bl, bl
0x100061e3d: je 0x100061ec5
0x100061e43: jmp 0x1000625ad ; 0x1000625ad
0x100061e48: vpermilps xmm0, xmm4, 0xc0
0x100061e4e: vmulps xmm0, xmm0, xmmword ptr [r8]
0x100061e53: vaddps xmm0, xmm0, xmmword ptr [rdx]
0x100061e57: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x100061e5f: lea rdi, [rbp - 0x160]
0x100061e66: lea rcx, [rbp - 0xa0]
0x100061e6d: mov rsi, r12
0x100061e70: vmovaps xmm0, xmm4
0x100061e74: call 0x100065510 ; 0x100065510
0x100061e79: vmovaps xmm4, xmmword ptr [rbp - 0xc0]
0x100061e81: vmovaps xmm0, xmmword ptr [rbp - 0x160]
0x100061e89: vpermilps xmm1, xmm0, 0xe7
0x100061e8f: vmovss xmm2, dword ptr [rip + 0xa43229] ; 0x100aa50c0
0x100061e97: vsubss xmm1, xmm2, xmm1
0x100061e9b: vpermilps xmm1, xmm1, 0xc0
0x100061ea1: vmovaps xmm2, xmmword ptr [rbp - 0xd0]
0x100061ea9: vmulps xmm1, xmm2, xmm1
0x100061ead: vblendps xmm1, xmm1, xmm2, 8
0x100061eb3: vaddps xmm0, xmm0, xmm1
0x100061eb7: vblendps xmm2, xmm0, xmm1, 8
0x100061ebd: test bl, bl
0x100061ebf: jne 0x1000625ad
0x100061ec5: cmp byte ptr [r12 + 0x110], 0
0x100061ece: je 0x10006236d
0x100061ed4: mov rax, qword ptr [rbp - 0x120]
0x100061edb: vmovaps xmm0, xmmword ptr [rax]
0x100061edf: vmovshdup xmm3, xmm0
0x100061ee3: vxorps xmm2, xmm2, xmm2
0x100061ee7: vucomiss xmm2, xmm3
0x100061eeb: mov rax, qword ptr [rbp - 0xb0]
0x100061ef2: jbe 0x1000621b4
0x100061ef8: vbroadcastss xmm1, dword ptr [rax + 4]
0x100061efe: vucomiss xmm1, xmm2
0x100061f02: jbe 0x1000621b4
0x100061f08: vmovaps xmm2, xmmword ptr [rip + 0xa459f0] ; 0x100aa7900
0x100061f10: vmovaps xmmword ptr [rbp - 0xf0], xmm3
0x100061f18: vxorps xmm3, xmm3, xmm2
0x100061f1c: vinsertps xmm4, xmm0, xmm3, 0x10
0x100061f22: vblendpd xmm0, xmm0, xmm4, 1
0x100061f28: vdivss xmm4, xmm1, xmm3
0x100061f2c: vmovaps xmmword ptr [rbp - 0xc0], xmm4
0x100061f34: vmovaps xmm1, xmmword ptr [r12 + 0x290]
0x100061f3e: vmovaps xmmword ptr [rbp - 0x130], xmm1
0x100061f46: vxorps xmm1, xmm1, xmm2
0x100061f4a: vmulps xmm2, xmm1, xmmword ptr [rip + 0xa4614e] ; 0x100aa80a0
0x100061f52: vmovshdup xmm3, xmm2
0x100061f56: vaddss xmm3, xmm2, xmm3
0x100061f5a: vpermilpd xmm2, xmm2, 1
0x100061f60: vaddss xmm2, xmm2, xmm3
0x100061f64: vxorps xmm3, xmm3, xmm3
0x100061f68: vmaxss xmm2, xmm3, xmm2
0x100061f6c: vxorps xmm5, xmm5, xmm5
0x100061f70: vmulss xmm2, xmm2, dword ptr [rip + 0xa45870] ; 0x100aa77e8
0x100061f78: vpermilps xmm2, xmm2, 0xc0
0x100061f7e: vmulps xmm2, xmm2, xmmword ptr [rip + 0xa4612a] ; 0x100aa80b0
0x100061f86: vmovss xmm3, dword ptr [rip + 0xa43132] ; 0x100aa50c0
0x100061f8e: vinsertps xmm2, xmm2, xmm3, 0x30
0x100061f94: vmovaps xmm6, xmm3
0x100061f98: vmovaps xmm3, xmmword ptr [r12 + 0x20]
0x100061f9f: vmovaps xmmword ptr [rbp - 0xd0], xmm3
0x100061fa7: vmulps xmm2, xmm3, xmm2
0x100061fab: vblendps xmm2, xmm2, xmm3, 8
0x100061fb1: vmovaps xmm3, xmmword ptr [r12 + 0xc40]
0x100061fbb: vsubps xmm2, xmm2, xmm3
0x100061fbf: vmulps xmm2, xmm2, xmmword ptr [rip + 0xa460f9] ; 0x100aa80c0
0x100061fc7: vaddps xmm2, xmm3, xmm2
0x100061fcb: vmovaps xmmword ptr [rbp - 0x120], xmm2
0x100061fd3: vmulps xmm0, xmm0, xmm1
0x100061fd7: vmovshdup xmm1, xmm0
0x100061fdb: vaddss xmm1, xmm0, xmm1
0x100061fdf: vpermilpd xmm0, xmm0, 1
0x100061fe5: vaddss xmm0, xmm0, xmm1
0x100061fe9: vmovss dword ptr [rbp - 0xb0], xmm0
0x100061ff1: vsubss xmm0, xmm4, dword ptr [r12 + 0x200]
0x100061ffb: vmulss xmm0, xmm0, dword ptr [r12 + 0x20c]
0x100062005: vmaxss xmm0, xmm5, xmm0
0x100062009: vminss xmm0, xmm6, xmm0
0x10006200d: vmulss xmm0, xmm0, dword ptr [rip + 0xa4664b] ; 0x100aa8660
0x100062015: call 0x100aa2702 ; 0x100aa2702 _exp2f
0x10006201a: vmovss xmm2, dword ptr [rip + 0xa4309e] ; 0x100aa50c0
0x100062022: vsubss xmm0, xmm2, xmm0
0x100062026: vmovss dword ptr [rbp - 0x100], xmm0
0x10006202e: vmovaps xmm0, xmmword ptr [rbp - 0xf0]
0x100062036: vandps xmm0, xmm0, xmmword ptr [rip + 0xa458d2] ; 0x100aa7910
0x10006203e: vmovshdup xmm1, xmmword ptr [rbp - 0x130]
0x100062046: vmulss xmm1, xmm1, dword ptr [rip + 0xa4657e] ; 0x100aa85cc
0x10006204e: vaddss xmm1, xmm1, xmm2
0x100062052: vmovss xmm2, dword ptr [rbp - 0xb0]
0x10006205a: vmulss xmm2, xmm2, dword ptr [rip + 0xa46602] ; 0x100aa8664
0x100062062: vaddss xmm2, xmm2, dword ptr [rip + 0xa45852] ; 0x100aa78bc
0x10006206a: vdivss xmm1, xmm1, xmm2
0x10006206e: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x100062073: vmovss dword ptr [rbp - 0xf0], xmm0
0x10006207b: vmovss xmm0, dword ptr [rbp - 0xb0]
0x100062083: vmaxss xmm0, xmm0, dword ptr [rip + 0xa45059] ; 0x100aa70e4
0x10006208b: vmovss xmm1, dword ptr [rip + 0xa465dd] ; 0x100aa8670
0x100062093: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x100062098: vmovaps xmm4, xmmword ptr [rbp - 0xc0]
0x1000620a0: vmulss xmm0, xmm0, dword ptr [r12 + 0x3c]
0x1000620a7: vmulss xmm0, xmm0, dword ptr [rip + 0xa4580d] ; 0x100aa78bc
0x1000620af: vmovss xmm6, dword ptr [rip + 0xa43009] ; 0x100aa50c0
0x1000620b7: vaddss xmm0, xmm0, xmm6
0x1000620bb: vmulss xmm1, xmm4, dword ptr [rip + 0xa465a5] ; 0x100aa8668
0x1000620c3: vaddss xmm1, xmm1, xmm6
0x1000620c7: vxorps xmm5, xmm5, xmm5
0x1000620cb: vmaxss xmm2, xmm5, dword ptr [rbp - 0xf0]
0x1000620d3: vminss xmm2, xmm6, xmm2
0x1000620d7: vmovss xmm3, dword ptr [rip + 0xa46559] ; 0x100aa8638
0x1000620df: vmulss xmm2, xmm2, xmm3
0x1000620e3: vmaxss xmm1, xmm5, xmm1
0x1000620e7: vxorps xmm5, xmm5, xmm5
0x1000620eb: vminss xmm1, xmm6, xmm1
0x1000620ef: vmulss xmm1, xmm1, xmm3
0x1000620f3: vroundss xmm3, xmm2, xmm2, 9
0x1000620f9: vcvttss2si rax, xmm3
0x1000620fe: vroundss xmm1, xmm1, xmm1, 9
0x100062104: vcvttss2si rcx, xmm1
0x100062109: mov edx, eax
0x10006210b: vcvtsi2ss xmm1, xmm9, rdx
0x100062110: vsubss xmm1, xmm2, xmm1
0x100062114: shl ecx, 6
0x100062117: cmp eax, 0x3f
0x10006211a: mov edx, 0x3f
0x10006211f: mov esi, 0x3f
0x100062124: cmovb esi, eax
0x100062127: or esi, ecx
0x100062129: shl rsi, 4
0x10006212d: inc eax
0x10006212f: cmp eax, 0x3f
0x100062132: cmovae eax, edx
0x100062135: or eax, ecx
0x100062137: shl rax, 4
0x10006213b: vmovaps xmm2, xmmword ptr [r12 + rax + 0x4c80]
0x100062145: vmovaps xmm3, xmmword ptr [r12 + rsi + 0x4c80]
0x10006214f: vsubps xmm2, xmm2, xmm3
0x100062153: vpermilps xmm1, xmm1, 0xc0
0x100062159: vmulps xmm1, xmm2, xmm1
0x10006215d: vaddps xmm1, xmm3, xmm1
0x100062161: vinsertps xmm1, xmm1, xmm6, 0x30
0x100062167: vpermilps xmm0, xmm0, 0xc0
0x10006216d: vmovaps xmm2, xmmword ptr [rbp - 0xd0]
0x100062175: vmulps xmm0, xmm2, xmm0
0x100062179: vblendps xmm0, xmm0, xmm2, 8
0x10006217f: vmulps xmm0, xmm0, xmm1
0x100062183: vblendps xmm0, xmm0, xmm1, 8
0x100062189: vmaxss xmm1, xmm5, dword ptr [rbp - 0x100]
0x100062191: vminss xmm1, xmm6, xmm1
0x100062195: vmovaps xmm2, xmmword ptr [rbp - 0x120]
0x10006219d: vsubps xmm0, xmm0, xmm2
0x1000621a1: vpermilps xmm1, xmm1, 0
0x1000621a7: vmulps xmm0, xmm1, xmm0
0x1000621ab: vaddps xmm2, xmm2, xmm0
0x1000621af: jmp 0x1000625ad ; 0x1000625ad
0x1000621b4: vmovss xmm1, dword ptr [r12 + 0x204]
0x1000621be: vmovaps xmmword ptr [rbp - 0xc0], xmm1
0x1000621c6: vmovaps xmm1, xmmword ptr [r12 + 0x290]
0x1000621d0: vxorps xmm2, xmm1, xmmword ptr [rip + 0xa45728] ; 0x100aa7900
0x1000621d8: vmulps xmm0, xmm0, xmm2
0x1000621dc: vmovshdup xmm2, xmm0
0x1000621e0: vaddss xmm2, xmm0, xmm2
0x1000621e4: vpermilpd xmm0, xmm0, 1
0x1000621ea: vaddss xmm4, xmm0, xmm2
0x1000621ee: vmovss dword ptr [rbp - 0x120], xmm4
0x1000621f6: vandps xmm0, xmm3, xmmword ptr [rip + 0xa45712] ; 0x100aa7910
0x1000621fe: vmovshdup xmm1, xmm1
0x100062202: vmulss xmm1, xmm1, dword ptr [rip + 0xa463c2] ; 0x100aa85cc
0x10006220a: vmovss xmm2, dword ptr [rip + 0xa42eae] ; 0x100aa50c0
0x100062212: vaddss xmm1, xmm1, xmm2
0x100062216: vmulss xmm2, xmm4, dword ptr [rip + 0xa46446] ; 0x100aa8664
0x10006221e: vaddss xmm2, xmm2, dword ptr [rip + 0xa45696] ; 0x100aa78bc
0x100062226: vdivss xmm1, xmm1, xmm2
0x10006222a: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x10006222f: vmovss dword ptr [rbp - 0xb0], xmm0
0x100062237: vmovaps xmm0, xmmword ptr [rbp - 0xc0]
0x10006223f: vmulss xmm0, xmm0, dword ptr [rip + 0xa46421] ; 0x100aa8668
0x100062247: vmovss xmm1, dword ptr [rip + 0xa42e71] ; 0x100aa50c0
0x10006224f: vaddss xmm0, xmm0, xmm1
0x100062253: vxorps xmm1, xmm1, xmm1
0x100062257: vmaxss xmm0, xmm1, xmm0
0x10006225b: vmovss dword ptr [rbp - 0xd0], xmm0
0x100062263: vmovss xmm0, dword ptr [rbp - 0x120]
0x10006226b: vmaxss xmm0, xmm0, xmm1
0x10006226f: vmovss xmm1, dword ptr [rip + 0xa463f5] ; 0x100aa866c
0x100062277: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x10006227c: vmovaps xmm4, xmmword ptr [rbp - 0xc0]
0x100062284: vmulss xmm0, xmm0, dword ptr [r12 + 0x3c]
0x10006228b: vmovss xmm5, dword ptr [rip + 0xa42e2d] ; 0x100aa50c0
0x100062293: vmovss xmm3, dword ptr [rbp - 0xd0]
0x10006229b: vsubss xmm1, xmm5, xmm3
0x10006229f: vmulss xmm0, xmm1, xmm0
0x1000622a3: vmulss xmm0, xmm0, dword ptr [rip + 0xa45611] ; 0x100aa78bc
0x1000622ab: vaddss xmm0, xmm0, xmm5
0x1000622af: vxorps xmm1, xmm1, xmm1
0x1000622b3: vmaxss xmm1, xmm1, dword ptr [rbp - 0xb0]
0x1000622bb: vminss xmm1, xmm5, xmm1
0x1000622bf: vmovss xmm2, dword ptr [rip + 0xa46371] ; 0x100aa8638
0x1000622c7: vmulss xmm1, xmm1, xmm2
0x1000622cb: vminss xmm3, xmm5, xmm3
0x1000622cf: vmulss xmm2, xmm3, xmm2
0x1000622d3: vroundss xmm3, xmm1, xmm1, 9
0x1000622d9: vcvttss2si rax, xmm3
0x1000622de: vroundss xmm2, xmm2, xmm2, 9
0x1000622e4: vcvttss2si rcx, xmm2
0x1000622e9: mov edx, eax
0x1000622eb: vcvtsi2ss xmm2, xmm9, rdx
0x1000622f0: vsubss xmm1, xmm1, xmm2
0x1000622f4: shl ecx, 6
0x1000622f7: cmp eax, 0x3f
0x1000622fa: mov edx, 0x3f
0x1000622ff: mov esi, 0x3f
0x100062304: cmovb esi, eax
0x100062307: or esi, ecx
0x100062309: shl rsi, 4
0x10006230d: inc eax
0x10006230f: cmp eax, 0x3f
0x100062312: cmovae eax, edx
0x100062315: or eax, ecx
0x100062317: shl rax, 4
0x10006231b: vmovaps xmm2, xmmword ptr [r12 + rax + 0x4c80]
0x100062325: vmovaps xmm3, xmmword ptr [r12 + rsi + 0x4c80]
0x10006232f: vsubps xmm2, xmm2, xmm3
0x100062333: vpermilps xmm1, xmm1, 0xc0
0x100062339: vmulps xmm1, xmm2, xmm1
0x10006233d: vaddps xmm1, xmm3, xmm1
0x100062341: vinsertps xmm1, xmm1, xmm5, 0x30
0x100062347: vmovaps xmm2, xmmword ptr [r12 + 0x20]
0x10006234e: vpermilps xmm0, xmm0, 0xc0
0x100062354: vmulps xmm0, xmm2, xmm0
0x100062358: vblendps xmm0, xmm0, xmm2, 8
0x10006235e: vmulps xmm0, xmm0, xmm1
0x100062362: vblendps xmm2, xmm0, xmm1, 8
0x100062368: jmp 0x1000625ad ; 0x1000625ad
0x10006236d: mov r15, qword ptr [rbp - 0xb0]
0x100062374: vmovaps xmm0, xmmword ptr [r15]
0x100062379: vmovaps xmmword ptr [rbp - 0x1a0], xmm0
0x100062381: mov rbx, qword ptr [rbp - 0x120]
0x100062388: vmovaps xmm0, xmmword ptr [rbx]
0x10006238c: vmovaps xmmword ptr [rbp - 0x190], xmm0
0x100062394: vmovaps xmm0, xmmword ptr [r12 + 0x97080]
0x10006239e: vmovaps xmmword ptr [rbp - 0x180], xmm0
0x1000623a6: vpermilps xmm0, xmm0, 0xe7
0x1000623ac: lea rdi, [rbp - 0x1a0]
0x1000623b3: lea rsi, [rbp - 0x190]
0x1000623ba: lea rdx, [rbp - 0x180]
0x1000623c1: lea rcx, [rbp - 0x90]
0x1000623c8: lea r8, [rbp - 0xa0]
0x1000623cf: call 0x100791400 ; 0x100791400
0x1000623d4: test al, al
0x1000623d6: je 0x1000624fd
0x1000623dc: vxorps xmm0, xmm0, xmm0
0x1000623e0: vmaxss xmm1, xmm0, dword ptr [rbp - 0x90]
0x1000623e8: vmovss dword ptr [rbp - 0x90], xmm1
0x1000623f0: vmovaps xmm3, xmm1
0x1000623f4: vmovaps xmm1, xmmword ptr [r12 + 0x290]
0x1000623fe: vxorps xmm1, xmm1, xmmword ptr [rip + 0xa454fa] ; 0x100aa7900
0x100062406: vmulps xmm1, xmm1, xmmword ptr [rip + 0xa45c92] ; 0x100aa80a0
0x10006240e: vmovshdup xmm2, xmm1
0x100062412: vaddss xmm2, xmm1, xmm2
0x100062416: vpermilpd xmm1, xmm1, 1
0x10006241c: vaddss xmm1, xmm1, xmm2
0x100062420: vmaxss xmm0, xmm0, xmm1
0x100062424: vmulss xmm0, xmm0, dword ptr [rip + 0xa453bc] ; 0x100aa77e8
0x10006242c: vpermilps xmm0, xmm0, 0xc0
0x100062432: vmulps xmm0, xmm0, xmmword ptr [rip + 0xa45c76] ; 0x100aa80b0
0x10006243a: vmovss xmm1, dword ptr [rip + 0xa42c7e] ; 0x100aa50c0
0x100062442: vinsertps xmm0, xmm0, xmm1, 0x30
0x100062448: vmovaps xmm1, xmmword ptr [r12 + 0x20]
0x10006244f: vmulps xmm0, xmm1, xmm0
0x100062453: vblendps xmm0, xmm0, xmm1, 8
0x100062459: vmovaps xmm1, xmmword ptr [r12 + 0xc40]
0x100062463: vsubps xmm0, xmm0, xmm1
0x100062467: vmulps xmm0, xmm0, xmmword ptr [rip + 0xa45c51] ; 0x100aa80c0
0x10006246f: vaddps xmm0, xmm1, xmm0
0x100062473: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x10006247b: vmovaps xmm0, xmm3
0x10006247f: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x100062487: vpermilps xmm1, xmm0, 0xc0
0x10006248d: vmulps xmm1, xmm1, xmmword ptr [rbx]
0x100062491: vaddps xmm1, xmm1, xmmword ptr [r15]
0x100062496: vmovaps xmmword ptr [rbp - 0x160], xmm1
0x10006249e: lea rdi, [rbp - 0x60]
0x1000624a2: lea rcx, [rbp - 0x160]
0x1000624a9: mov rsi, r12
0x1000624ac: mov rdx, r15
0x1000624af: mov r8, rbx
0x1000624b2: call 0x100065510 ; 0x100065510
0x1000624b7: vmovaps xmm4, xmmword ptr [rbp - 0xc0]
0x1000624bf: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1000624c4: vpermilps xmm1, xmm0, 0xe7
0x1000624ca: vmovss xmm2, dword ptr [rip + 0xa42bee] ; 0x100aa50c0
0x1000624d2: vsubss xmm1, xmm2, xmm1
0x1000624d6: vpermilps xmm1, xmm1, 0xc0
0x1000624dc: vmovaps xmm2, xmmword ptr [rbp - 0xd0]
0x1000624e4: vmulps xmm1, xmm1, xmm2
0x1000624e8: vblendps xmm1, xmm1, xmm2, 8
0x1000624ee: vaddps xmm0, xmm0, xmm1
0x1000624f2: vblendps xmm2, xmm0, xmm1, 8
0x1000624f8: jmp 0x1000625ad ; 0x1000625ad
0x1000624fd: vmovaps xmm0, xmmword ptr [rbx]
0x100062501: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x100062506: vmovshdup xmm0, xmm0
0x10006250a: vxorps xmm1, xmm1, xmm1
0x10006250e: vmaxss xmm2, xmm1, xmm0
0x100062512: vcmpunordss xmm0, xmm0, xmm0
0x100062517: vandnps xmm0, xmm0, xmm2
0x10006251b: vmovss dword ptr [rbp - 0x5c], xmm0
0x100062520: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x100062525: vmulps xmm2, xmm0, xmm0
0x100062529: vmovshdup xmm3, xmm2
0x10006252d: vaddss xmm3, xmm2, xmm3
0x100062531: vpermilpd xmm2, xmm2, 1
0x100062537: vaddss xmm2, xmm2, xmm3
0x10006253b: vrsqrtss xmm3, xmm2, xmm2
0x10006253f: vmulss xmm4, xmm2, dword ptr [rip + 0xa42071] ; 0x100aa45b8
0x100062547: vcmpeqss xmm1, xmm2, xmm1
0x10006254c: vandnps xmm2, xmm1, xmm4
0x100062550: vmovss xmm4, dword ptr [rip + 0xa460d0] ; 0x100aa8628
0x100062558: vandps xmm1, xmm1, xmm4
0x10006255c: vorps xmm1, xmm2, xmm1
0x100062560: vmulss xmm1, xmm3, xmm1
0x100062564: vmulss xmm1, xmm3, xmm1
0x100062568: vmovss xmm2, dword ptr [rip + 0xa4527c] ; 0x100aa77ec
0x100062570: vsubss xmm1, xmm2, xmm1
0x100062574: vmulss xmm1, xmm3, xmm1
0x100062578: vpermilps xmm1, xmm1, 0xc0
0x10006257e: vmulps xmm0, xmm0, xmm1
0x100062582: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x100062587: lea rdi, [rbp - 0x160]
0x10006258e: lea rcx, [rbp - 0x60]
0x100062592: mov rsi, r12
0x100062595: mov rdx, r15
0x100062598: call 0x100064c60 ; 0x100064c60
0x10006259d: vmovaps xmm2, xmmword ptr [rbp - 0x160]
0x1000625a5: vmovss xmm4, dword ptr [rip + 0xa4530b] ; 0x100aa78b8
0x1000625ad: vinsertps xmm0, xmm2, xmm4, 0x30
0x1000625b3: vmovaps xmmword ptr [r14], xmm0
0x1000625b8: mov rax, qword ptr [rip + 0xbab319] ; 0x100c0d8d8
0x1000625bf: mov rax, qword ptr [rax]
0x1000625c2: cmp rax, qword ptr [rbp - 0x30]
0x1000625c6: jne 0x1000625dd
0x1000625c8: mov rax, r14
0x1000625cb: add rsp, 0x178
0x1000625d2: pop rbx
0x1000625d3: pop r12
0x1000625d5: pop r13
0x1000625d7: pop r14
0x1000625d9: pop r15
0x1000625db: pop rbp
0x1000625dc: ret 
0x1000625dd: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1000625e2: nop word ptr cs:[rax + rax]
