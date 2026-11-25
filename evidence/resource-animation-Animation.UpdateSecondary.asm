0x100099680: push rbp
0x100099681: mov rbp, rsp
0x100099684: push r15
0x100099686: push r14
0x100099688: push r13
0x10009968a: push r12
0x10009968c: push rbx
0x10009968d: sub rsp, 0x64b8
0x100099694: mov r14d, esi
0x100099697: mov rax, qword ptr [rip + 0xb7423a] ; 0x100c0d8d8
0x10009969e: mov rax, qword ptr [rax]
0x1000996a1: mov qword ptr [rbp - 0x30], rax
0x1000996a5: mov qword ptr [rbp - 0x60c0], rdi
0x1000996ac: movsxd r12, dword ptr [rdi + 0xc]
0x1000996b0: mov dword ptr [rbp - 0x3030], 0
0x1000996ba: test r12, r12
0x1000996bd: jle 0x100099710
0x1000996bf: imul rax, r12, 0x70
0x1000996c3: inc r12
0x1000996c6: mov rcx, qword ptr [rbp - 0x60c0]
0x1000996cd: lea rbx, [rcx + rax + 0x4228]
0x1000996d5: lea r15, [rbp - 0x3030]
0x1000996dc: vmovss dword ptr [rbp - 0x60b4], xmm0
0x1000996e4: nop word ptr cs:[rax + rax]
0x1000996f0: mov rdi, rbx
0x1000996f3: vmovss xmm0, dword ptr [rbp - 0x60b4]
0x1000996fb: mov rsi, r15
0x1000996fe: call 0x100097df0 ; 0x100097df0
0x100099703: dec r12
0x100099706: add rbx, -0x70
0x10009970a: cmp r12, 1
0x10009970e: jg 0x1000996f0
0x100099710: test r14b, r14b
0x100099713: jne 0x100099e78
0x100099719: mov r9, qword ptr [rbp - 0x60c0]
0x100099720: mov edx, dword ptr [r9 + 0xc]
0x100099724: test rdx, rdx
0x100099727: je 0x100099e78
0x10009972d: mov rax, qword ptr [r9 + 0x6018]
0x100099734: mov r13d, dword ptr [rax + 0x54]
0x100099738: mov r8d, edx
0x10009973b: and r8d, 1
0x10009973f: cmp edx, 1
0x100099742: jne 0x100099753
0x100099744: xor esi, esi
0x100099746: xor r10d, r10d
0x100099749: test r8, r8
0x10009974c: jne 0x1000997ca
0x10009974e: jmp 0x100099803 ; 0x100099803
0x100099753: sub rdx, r8
0x100099756: lea rdi, [r9 + 0x4298]
0x10009975d: xor esi, esi
0x10009975f: vmovss xmm0, dword ptr [rip + 0xa0d335] ; 0x100aa6a9c
0x100099767: xor r10d, r10d
0x10009976a: nop word ptr [rax + rax]
0x100099770: cmp dword ptr [rdi + 0xc], 0
0x100099774: js 0x10009978f
0x100099776: vmovss xmm1, dword ptr [rdi + 0x14]
0x10009977b: vucomiss xmm1, xmm0
0x10009977f: jbe 0x10009978f
0x100099781: mov ebx, r10d
0x100099784: inc r10d
0x100099787: mov qword ptr [rbp + rbx*8 - 0x60b0], rdi
0x10009978f: cmp dword ptr [rdi + 0x7c], 0
0x100099793: js 0x1000997b5
0x100099795: vmovss xmm1, dword ptr [rdi + 0x84]
0x10009979d: vucomiss xmm1, xmm0
0x1000997a1: jbe 0x1000997b5
0x1000997a3: lea rbx, [rdi + 0x70]
0x1000997a7: mov ecx, r10d
0x1000997aa: inc r10d
0x1000997ad: mov qword ptr [rbp + rcx*8 - 0x60b0], rbx
0x1000997b5: add rsi, 2
0x1000997b9: add rdi, 0xe0
0x1000997c0: cmp rdx, rsi
0x1000997c3: jne 0x100099770
0x1000997c5: test r8, r8
0x1000997c8: je 0x100099803
0x1000997ca: imul rcx, rsi, 0x70
0x1000997ce: cmp dword ptr [r9 + rcx + 0x42a4], 0
0x1000997d7: js 0x100099803
0x1000997d9: vmovss xmm0, dword ptr [r9 + rcx + 0x42ac]
0x1000997e3: vucomiss xmm0, dword ptr [rip + 0xa0d2b1] ; 0x100aa6a9c
0x1000997eb: jbe 0x100099803
0x1000997ed: lea rcx, [r9 + rcx + 0x4298]
0x1000997f5: mov edx, r10d
0x1000997f8: inc r10d
0x1000997fb: mov qword ptr [rbp + rdx*8 - 0x60b0], rcx
0x100099803: test r10d, r10d
0x100099806: je 0x100099e78
0x10009980c: mov eax, r10d
0x10009980f: lea rdx, [rax - 1]
0x100099813: mov ecx, eax
0x100099815: and ecx, 3
0x100099818: cmp rdx, 3
0x10009981c: jae 0x10009982b
0x10009981e: vxorps xmm2, xmm2, xmm2
0x100099822: xor edx, edx
0x100099824: test rcx, rcx
0x100099827: jne 0x100099882
0x100099829: jmp 0x1000998a1 ; 0x1000998a1
0x10009982b: mov rsi, rax
0x10009982e: sub rsi, rcx
0x100099831: vxorps xmm2, xmm2, xmm2
0x100099835: xor edx, edx
0x100099837: nop word ptr [rax + rax]
0x100099840: mov rdi, qword ptr [rbp + rdx*8 - 0x60b0]
0x100099848: mov rbx, qword ptr [rbp + rdx*8 - 0x60a8]
0x100099850: vaddss xmm0, xmm2, dword ptr [rdi + 0x14]
0x100099855: vaddss xmm0, xmm0, dword ptr [rbx + 0x14]
0x10009985a: mov rdi, qword ptr [rbp + rdx*8 - 0x60a0]
0x100099862: vaddss xmm0, xmm0, dword ptr [rdi + 0x14]
0x100099867: mov rdi, qword ptr [rbp + rdx*8 - 0x6098]
0x10009986f: vaddss xmm2, xmm0, dword ptr [rdi + 0x14]
0x100099874: add rdx, 4
0x100099878: cmp rsi, rdx
0x10009987b: jne 0x100099840
0x10009987d: test rcx, rcx
0x100099880: je 0x1000998a1
0x100099882: lea rdx, [rbp + rdx*8 - 0x60b0]
0x10009988a: neg rcx
0x10009988d: nop dword ptr [rax]
0x100099890: mov rsi, qword ptr [rdx]
0x100099893: vaddss xmm2, xmm2, dword ptr [rsi + 0x14]
0x100099898: add rdx, 8
0x10009989c: inc rcx
0x10009989f: jne 0x100099890
0x1000998a1: test r13d, r13d
0x1000998a4: je 0x100099984
0x1000998aa: mov r8, qword ptr [r9 + 0x5838]
0x1000998b1: mov edx, r13d
0x1000998b4: and edx, 1
0x1000998b7: cmp r13d, 1
0x1000998bb: jne 0x1000998c9
0x1000998bd: xor esi, esi
0x1000998bf: test rdx, rdx
0x1000998c2: jne 0x10009993c
0x1000998c4: jmp 0x100099984 ; 0x100099984
0x1000998c9: mov rdi, r13
0x1000998cc: sub rdi, rdx
0x1000998cf: lea rbx, [r8 + 0x210]
0x1000998d6: lea rcx, [rbp - 0x5fe0]
0x1000998dd: xor esi, esi
0x1000998df: nop 
0x1000998e0: vmovaps xmm0, xmmword ptr [rbx - 0x120]
0x1000998e8: vmovaps xmmword ptr [rcx - 0x30], xmm0
0x1000998ed: vmovaps xmm0, xmmword ptr [rbx - 0x100]
0x1000998f5: vmovaps xmmword ptr [rcx - 0x50], xmm0
0x1000998fa: vmovaps xmm0, xmmword ptr [rbx - 0xf0]
0x100099902: vmovaps xmmword ptr [rcx - 0x40], xmm0
0x100099907: add rsi, 2
0x10009990b: vmovaps xmm0, xmmword ptr [rbx - 0x30]
0x100099910: vmovaps xmmword ptr [rcx], xmm0
0x100099914: vmovaps xmm0, xmmword ptr [rbx - 0x10]
0x100099919: vmovaps xmmword ptr [rcx - 0x20], xmm0
0x10009991e: vmovaps xmm0, xmmword ptr [rbx]
0x100099922: vmovaps xmmword ptr [rcx - 0x10], xmm0
0x100099927: add rbx, 0x1e0
0x10009992e: add rcx, 0x60
0x100099932: cmp rdi, rsi
0x100099935: jne 0x1000998e0
0x100099937: test rdx, rdx
0x10009993a: je 0x100099984
0x10009993c: imul rcx, rsi, 0xf0
0x100099943: lea rdx, [rsi + rsi*2]
0x100099947: shl rdx, 4
0x10009994b: vmovaps xmm0, xmmword ptr [r8 + rcx + 0xf0]
0x100099955: vmovaps xmmword ptr [rbp + rdx - 0x6010], xmm0
0x10009995e: vmovaps xmm0, xmmword ptr [r8 + rcx + 0x110]
0x100099968: vmovaps xmmword ptr [rbp + rdx - 0x6030], xmm0
0x100099971: vmovaps xmm0, xmmword ptr [r8 + rcx + 0x120]
0x10009997b: vmovaps xmmword ptr [rbp + rdx - 0x6020], xmm0
0x100099984: test r10d, r10d
0x100099987: je 0x100099e0e
0x10009998d: test r13d, r13d
0x100099990: jle 0x100099c6d
0x100099996: mov ecx, r13d
0x100099999: and ecx, 0x1f
0x10009999c: mov rdx, r13
0x10009999f: mov qword ptr [rbp - 0x60d0], rcx
0x1000999a6: sub rdx, rcx
0x1000999a9: mov qword ptr [rbp - 0x60c8], rdx
0x1000999b0: xor r14d, r14d
0x1000999b3: vmovss xmm3, dword ptr [rip + 0xa0b705] ; 0x100aa50c0
0x1000999bb: lea r15, [rip + 0xc8950e] ; 0x100d22ed0
0x1000999c2: lea r12, [rip + 0xc89907] ; 0x100d232d0
0x1000999c9: mov qword ptr [rbp - 0x60d8], rax
0x1000999d0: mov rbx, qword ptr [rbp + r14*8 - 0x60b0]
0x1000999d8: vmovss xmm0, dword ptr [rbx + 0x14]
0x1000999dd: vsubss xmm2, xmm2, xmm0
0x1000999e1: vucomiss xmm3, xmm2
0x1000999e5: jbe 0x100099a10
0x1000999e7: vsubss xmm1, xmm3, xmm2
0x1000999eb: vdivss xmm0, xmm0, xmm1
0x1000999ef: vucomiss xmm0, xmm3
0x1000999f3: vmovaps xmm1, xmm3
0x1000999f7: ja 0x100099a20
0x1000999f9: vucomiss xmm0, dword ptr [rip + 0xa0d6e3] ; 0x100aa70e4
0x100099a01: vmovaps xmm1, xmm0
0x100099a05: jne 0x100099a20
0x100099a07: jp 0x100099a20
0x100099a09: nop dword ptr [rax]
0x100099a10: inc r14
0x100099a13: cmp r14, rax
0x100099a16: jne 0x1000999d0
0x100099a18: jmp 0x100099e0e ; 0x100099e0e
0x100099a1d: nop dword ptr [rax]
0x100099a20: vmovss dword ptr [rbp - 0x60b8], xmm1
0x100099a28: vmovss dword ptr [rbp - 0x60b4], xmm2
0x100099a30: movsxd rax, dword ptr [rbx + 0xc]
0x100099a34: mov rdi, qword ptr [r9 + rax*8 + 0x6020]
0x100099a3c: mov r10d, dword ptr [rbx + 0x10]
0x100099a40: mov edx, dword ptr [rbx + 0x38]
0x100099a43: mov ecx, dword ptr [rbx + 0x3c]
0x100099a46: mov r8d, dword ptr [rbx + 0x40]
0x100099a4a: mov r9d, dword ptr [rbx + 0x44]
0x100099a4e: vmovss xmm0, dword ptr [rbx + 0x48]
0x100099a53: movzx r11d, byte ptr [rbx + 0x61]
0x100099a58: movzx eax, byte ptr [rbx + 0x4c]
0x100099a5c: lea rsi, [rbp - 0x3030]
0x100099a63: push rax
0x100099a64: push qword ptr [rbx + 0x68]
0x100099a67: push r11
0x100099a69: push r10
0x100099a6b: call 0x1000e6900 ; 0x1000e6900
0x100099a70: mov rdi, qword ptr [rbp - 0x60c0]
0x100099a77: add rsp, 0x20
0x100099a7b: cmp byte ptr [rbx + 0x4d], 0
0x100099a7f: je 0x100099acf
0x100099a81: cmp byte ptr [rbx + 0x4e], 0
0x100099a85: je 0x100099aed
0x100099a87: cmp byte ptr [rdi + 0x5830], 0
0x100099a8e: je 0x100099b1f
0x100099a94: cmp byte ptr [rbx + 0x62], 0
0x100099a98: je 0x100099b1f
0x100099a9e: cmp byte ptr [rip + 0xbe41ec], 0 ; 0x100c7dc91
0x100099aa5: mov rcx, r15
0x100099aa8: je 0x100099c20
0x100099aae: vmovss xmm0, dword ptr [rdi + 0x5834]
0x100099ab6: vmovss xmm1, dword ptr [rip + 0xa0b602] ; 0x100aa50c0
0x100099abe: vsubss xmm1, xmm1, xmm0
0x100099ac2: cmp r13d, 0x20
0x100099ac6: jae 0x100099b27
0x100099ac8: xor eax, eax
0x100099aca: jmp 0x100099bda ; 0x100099bda
0x100099acf: mov rax, qword ptr [rdi + 0x6018]
0x100099ad6: mov rax, qword ptr [rax + 0x58]
0x100099ada: vmovss xmm0, dword ptr [rax + 0x24]
0x100099adf: vmovss dword ptr [rbp - 0x300c], xmm0
0x100099ae7: cmp byte ptr [rbx + 0x4e], 0
0x100099aeb: jne 0x100099a87
0x100099aed: mov rax, qword ptr [rdi + 0x6018]
0x100099af4: mov rax, qword ptr [rax + 0x58]
0x100099af8: vmovss xmm0, dword ptr [rax + 0x20]
0x100099afd: vmovss dword ptr [rbp - 0x3010], xmm0
0x100099b05: vmovss xmm0, dword ptr [rax + 0x28]
0x100099b0a: vmovss dword ptr [rbp - 0x3008], xmm0
0x100099b12: cmp byte ptr [rdi + 0x5830], 0
0x100099b19: jne 0x100099a94
0x100099b1f: mov rcx, r15
0x100099b22: jmp 0x100099c20 ; 0x100099c20
0x100099b27: vpermilps xmm2, xmm0, 0
0x100099b2d: vinsertf128 ymm2, ymm2, xmm2, 1
0x100099b33: vpermilps xmm3, xmm1, 0
0x100099b39: vinsertf128 ymm3, ymm3, xmm3, 1
0x100099b3f: xor eax, eax
0x100099b41: mov rcx, qword ptr [rbp - 0x60c8]
0x100099b48: nop dword ptr [rax + rax]
0x100099b50: vmulps ymm4, ymm2, ymmword ptr [r12 + rax*4]
0x100099b56: vmulps ymm5, ymm2, ymmword ptr [r12 + rax*4 + 0x20]
0x100099b5d: vmulps ymm6, ymm2, ymmword ptr [r12 + rax*4 + 0x40]
0x100099b64: vmulps ymm7, ymm2, ymmword ptr [r12 + rax*4 + 0x60]
0x100099b6b: vmulps ymm8, ymm3, ymmword ptr [r15 + rax*4]
0x100099b71: vaddps ymm4, ymm4, ymm8
0x100099b76: vmulps ymm8, ymm3, ymmword ptr [r15 + rax*4 + 0x20]
0x100099b7d: vaddps ymm5, ymm5, ymm8
0x100099b82: vmulps ymm8, ymm3, ymmword ptr [r15 + rax*4 + 0x40]
0x100099b89: vaddps ymm6, ymm6, ymm8
0x100099b8e: vmulps ymm8, ymm3, ymmword ptr [r15 + rax*4 + 0x60]
0x100099b95: vaddps ymm7, ymm7, ymm8
0x100099b9a: vmovups ymmword ptr [rbp + rax*4 - 0x64d8], ymm4
0x100099ba3: vmovups ymmword ptr [rbp + rax*4 - 0x64b8], ymm5
0x100099bac: vmovups ymmword ptr [rbp + rax*4 - 0x6498], ymm6
0x100099bb5: vmovups ymmword ptr [rbp + rax*4 - 0x6478], ymm7
0x100099bbe: add rax, 0x20
0x100099bc2: cmp rcx, rax
0x100099bc5: jne 0x100099b50
0x100099bc7: mov rax, rcx
0x100099bca: lea rcx, [rbp - 0x64d8]
0x100099bd1: cmp dword ptr [rbp - 0x60d0], 0
0x100099bd8: je 0x100099c20
0x100099bda: mov rcx, r13
0x100099bdd: sub rcx, rax
0x100099be0: shl rax, 2
0x100099be4: nop word ptr cs:[rax + rax]
0x100099bf0: vmulss xmm2, xmm0, dword ptr [rax + r12]
0x100099bf6: vmulss xmm3, xmm1, dword ptr [rax + r15]
0x100099bfc: vaddss xmm2, xmm2, xmm3
0x100099c00: vmovss dword ptr [rbp + rax - 0x64d8], xmm2
0x100099c09: add rax, 4
0x100099c0d: dec rcx
0x100099c10: jne 0x100099bf0
0x100099c12: lea rcx, [rbp - 0x64d8]
0x100099c19: nop dword ptr [rax]
0x100099c20: lea rsi, [rbp - 0x3030]
0x100099c27: lea rdx, [rbp - 0x6030]
0x100099c2e: vmovss xmm0, dword ptr [rbp - 0x60b8]
0x100099c36: vzeroupper 
0x100099c39: call 0x10009ad60 ; 0x10009ad60
0x100099c3e: mov r9, qword ptr [rbp - 0x60c0]
0x100099c45: mov rax, qword ptr [rbp - 0x60d8]
0x100099c4c: vmovss xmm2, dword ptr [rbp - 0x60b4]
0x100099c54: vmovss xmm3, dword ptr [rip + 0xa0b464] ; 0x100aa50c0
0x100099c5c: inc r14
0x100099c5f: cmp r14, rax
0x100099c62: jne 0x1000999d0
0x100099c68: jmp 0x100099e0e ; 0x100099e0e
0x100099c6d: lea rbx, [rbp - 0x60b0]
0x100099c74: vmovss xmm3, dword ptr [rip + 0xa0b444] ; 0x100aa50c0
0x100099c7c: lea r14, [rbp - 0x3030]
0x100099c83: nop word ptr cs:[rax + rax]
0x100099c90: mov r12, qword ptr [rbx]
0x100099c93: vmovss xmm0, dword ptr [r12 + 0x14]
0x100099c9a: vsubss xmm2, xmm2, xmm0
0x100099c9e: vucomiss xmm3, xmm2
0x100099ca2: jbe 0x100099e01
0x100099ca8: vsubss xmm1, xmm3, xmm2
0x100099cac: vdivss xmm0, xmm0, xmm1
0x100099cb0: vucomiss xmm0, xmm3
0x100099cb4: vmovaps xmm1, xmm3
0x100099cb8: ja 0x100099cce
0x100099cba: vucomiss xmm0, dword ptr [rip + 0xa0d422] ; 0x100aa70e4
0x100099cc2: vmovaps xmm1, xmm0
0x100099cc6: jne 0x100099cce
0x100099cc8: jnp 0x100099e01
0x100099cce: vmovss dword ptr [rbp - 0x60b8], xmm1
0x100099cd6: vmovss dword ptr [rbp - 0x60b4], xmm2
0x100099cde: mov r15, rax
0x100099ce1: movsxd rax, dword ptr [r12 + 0xc]
0x100099ce6: mov rdi, qword ptr [r9 + rax*8 + 0x6020]
0x100099cee: mov r10d, dword ptr [r12 + 0x10]
0x100099cf3: mov edx, dword ptr [r12 + 0x38]
0x100099cf8: mov ecx, dword ptr [r12 + 0x3c]
0x100099cfd: mov r8d, dword ptr [r12 + 0x40]
0x100099d02: mov r9d, dword ptr [r12 + 0x44]
0x100099d07: vmovss xmm0, dword ptr [r12 + 0x48]
0x100099d0e: movzx r11d, byte ptr [r12 + 0x61]
0x100099d14: movzx eax, byte ptr [r12 + 0x4c]
0x100099d1a: mov rsi, r14
0x100099d1d: push rax
0x100099d1e: push qword ptr [r12 + 0x68]
0x100099d23: push r11
0x100099d25: push r10
0x100099d27: call 0x1000e6900 ; 0x1000e6900
0x100099d2c: mov rdi, qword ptr [rbp - 0x60c0]
0x100099d33: add rsp, 0x20
0x100099d37: cmp byte ptr [r12 + 0x4d], 0
0x100099d3d: je 0x100099d7b
0x100099d3f: cmp byte ptr [r12 + 0x4e], 0
0x100099d45: je 0x100099d9b
0x100099d47: cmp byte ptr [rdi + 0x5830], 0
0x100099d4e: vmovss xmm0, dword ptr [rbp - 0x60b8]
0x100099d56: je 0x100099dd1
0x100099d58: cmp byte ptr [r12 + 0x62], 0
0x100099d5e: je 0x100099dd1
0x100099d60: cmp byte ptr [rip + 0xbe3f2a], 0 ; 0x100c7dc91
0x100099d67: lea rcx, [rbp - 0x64d8]
0x100099d6e: lea rax, [rip + 0xc8915b] ; 0x100d22ed0
0x100099d75: cmove rcx, rax
0x100099d79: jmp 0x100099dd8 ; 0x100099dd8
0x100099d7b: mov rax, qword ptr [rdi + 0x6018]
0x100099d82: mov rax, qword ptr [rax + 0x58]
0x100099d86: vmovss xmm0, dword ptr [rax + 0x24]
0x100099d8b: vmovss dword ptr [rbp - 0x300c], xmm0
0x100099d93: cmp byte ptr [r12 + 0x4e], 0
0x100099d99: jne 0x100099d47
0x100099d9b: mov rax, qword ptr [rdi + 0x6018]
0x100099da2: mov rax, qword ptr [rax + 0x58]
0x100099da6: vmovss xmm0, dword ptr [rax + 0x20]
0x100099dab: vmovss dword ptr [rbp - 0x3010], xmm0
0x100099db3: vmovss xmm0, dword ptr [rax + 0x28]
0x100099db8: vmovss dword ptr [rbp - 0x3008], xmm0
0x100099dc0: cmp byte ptr [rdi + 0x5830], 0
0x100099dc7: vmovss xmm0, dword ptr [rbp - 0x60b8]
0x100099dcf: jne 0x100099d58
0x100099dd1: lea rcx, [rip + 0xc890f8] ; 0x100d22ed0
0x100099dd8: mov rsi, r14
0x100099ddb: lea rdx, [rbp - 0x6030]
0x100099de2: call 0x10009ad60 ; 0x10009ad60
0x100099de7: mov r9, qword ptr [rbp - 0x60c0]
0x100099dee: mov rax, r15
0x100099df1: vmovss xmm2, dword ptr [rbp - 0x60b4]
0x100099df9: vmovss xmm3, dword ptr [rip + 0xa0b2bf] ; 0x100aa50c0
0x100099e01: add rbx, 8
0x100099e05: dec rax
0x100099e08: jne 0x100099c90
0x100099e0e: test r13d, r13d
0x100099e11: je 0x100099e78
0x100099e13: movabs rax, 0x100000000
0x100099e1d: lea rcx, [rbp - 0x6010]
0x100099e24: mov rdx, rax
0x100099e27: nop word ptr [rax + rax]
0x100099e30: mov rsi, qword ptr [r9 + 0x5838]
0x100099e37: mov rdi, rdx
0x100099e3a: sar rdi, 0x20
0x100099e3e: imul rdi, rdi, 0xf0
0x100099e45: vmovaps xmm0, xmmword ptr [rcx]
0x100099e49: vmovaps xmmword ptr [rsi + rdi], xmm0
0x100099e4e: vmovaps xmm0, xmmword ptr [rcx - 0x20]
0x100099e53: vmovaps xmmword ptr [rsi + rdi + 0x20], xmm0
0x100099e59: vmovaps xmm0, xmmword ptr [rcx - 0x10]
0x100099e5e: vmovaps xmmword ptr [rsi + rdi + 0x30], xmm0
0x100099e64: mov byte ptr [rsi + rdi + 0xe0], 1
0x100099e6c: add rcx, 0x30
0x100099e70: add rdx, rax
0x100099e73: dec r13
0x100099e76: jne 0x100099e30
0x100099e78: mov rax, qword ptr [rip + 0xb73a59] ; 0x100c0d8d8
0x100099e7f: mov rax, qword ptr [rax]
0x100099e82: cmp rax, qword ptr [rbp - 0x30]
0x100099e86: jne 0x100099e9a
0x100099e88: add rsp, 0x64b8
0x100099e8f: pop rbx
0x100099e90: pop r12
0x100099e92: pop r13
0x100099e94: pop r14
0x100099e96: pop r15
0x100099e98: pop rbp
0x100099e99: ret 
0x100099e9a: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100099e9f: nop 
