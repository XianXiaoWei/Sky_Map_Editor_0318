0x100099ea0: push rbp
0x100099ea1: mov rbp, rsp
0x100099ea4: push r15
0x100099ea6: push r14
0x100099ea8: push r13
0x100099eaa: push r12
0x100099eac: push rbx
0x100099ead: sub rsp, 0x6148
0x100099eb4: mov r14d, esi
0x100099eb7: mov r13, rdi
0x100099eba: mov rax, qword ptr [rip + 0xb73a17] ; 0x100c0d8d8
0x100099ec1: mov rax, qword ptr [rax]
0x100099ec4: mov qword ptr [rbp - 0x30], rax
0x100099ec8: movsxd r15, dword ptr [r13 + 0x10]
0x100099ecc: mov dword ptr [rbp - 0x3030], 0
0x100099ed6: test r15, r15
0x100099ed9: jle 0x100099f20
0x100099edb: imul rax, r15, 0x70
0x100099edf: inc r15
0x100099ee2: lea rbx, [r13 + rax + 0x4928]
0x100099eea: lea r12, [rbp - 0x3030]
0x100099ef1: vmovss dword ptr [rbp - 0x6110], xmm0
0x100099ef9: nop dword ptr [rax]
0x100099f00: mov rdi, rbx
0x100099f03: vmovss xmm0, dword ptr [rbp - 0x6110]
0x100099f0b: mov rsi, r12
0x100099f0e: call 0x100097df0 ; 0x100097df0
0x100099f13: dec r15
0x100099f16: add rbx, -0x70
0x100099f1a: cmp r15, 1
0x100099f1e: jg 0x100099f00
0x100099f20: test r14b, r14b
0x100099f23: jne 0x10009a958
0x100099f29: mov edx, dword ptr [r13 + 0x10]
0x100099f2d: test rdx, rdx
0x100099f30: je 0x10009a958
0x100099f36: mov rax, qword ptr [r13 + 0x6018]
0x100099f3d: mov r15d, dword ptr [rax + 0x54]
0x100099f41: mov r8d, edx
0x100099f44: and r8d, 1
0x100099f48: cmp edx, 1
0x100099f4b: jne 0x100099f5f
0x100099f4d: xor esi, esi
0x100099f4f: xor eax, eax
0x100099f51: test r8, r8
0x100099f54: jne 0x100099fd6
0x100099f5a: jmp 0x10009a00d ; 0x10009a00d
0x100099f5f: sub rdx, r8
0x100099f62: lea rdi, [r13 + 0x4998]
0x100099f69: xor esi, esi
0x100099f6b: vmovss xmm0, dword ptr [rip + 0xa0cb29] ; 0x100aa6a9c
0x100099f73: xor eax, eax
0x100099f75: nop word ptr cs:[rax + rax]
0x100099f80: cmp dword ptr [rdi + 0xc], 0
0x100099f84: js 0x100099f9d
0x100099f86: vmovss xmm1, dword ptr [rdi + 0x14]
0x100099f8b: vucomiss xmm1, xmm0
0x100099f8f: jbe 0x100099f9d
0x100099f91: mov ebx, eax
0x100099f93: inc eax
0x100099f95: mov qword ptr [rbp + rbx*8 - 0x6100], rdi
0x100099f9d: cmp dword ptr [rdi + 0x7c], 0
0x100099fa1: js 0x100099fc1
0x100099fa3: vmovss xmm1, dword ptr [rdi + 0x84]
0x100099fab: vucomiss xmm1, xmm0
0x100099faf: jbe 0x100099fc1
0x100099fb1: lea rbx, [rdi + 0x70]
0x100099fb5: mov ecx, eax
0x100099fb7: inc eax
0x100099fb9: mov qword ptr [rbp + rcx*8 - 0x6100], rbx
0x100099fc1: add rsi, 2
0x100099fc5: add rdi, 0xe0
0x100099fcc: cmp rdx, rsi
0x100099fcf: jne 0x100099f80
0x100099fd1: test r8, r8
0x100099fd4: je 0x10009a00d
0x100099fd6: imul rcx, rsi, 0x70
0x100099fda: cmp dword ptr [r13 + rcx + 0x49a4], 0
0x100099fe3: js 0x10009a00d
0x100099fe5: vmovss xmm0, dword ptr [r13 + rcx + 0x49ac]
0x100099fef: vucomiss xmm0, dword ptr [rip + 0xa0caa5] ; 0x100aa6a9c
0x100099ff7: jbe 0x10009a00d
0x100099ff9: lea rcx, [r13 + rcx + 0x4998]
0x10009a001: mov edx, eax
0x10009a003: inc eax
0x10009a005: mov qword ptr [rbp + rdx*8 - 0x6100], rcx
0x10009a00d: test eax, eax
0x10009a00f: je 0x10009a958
0x10009a015: test r15d, r15d
0x10009a018: je 0x10009a06e
0x10009a01a: lea rcx, [rbp - 0x6010]
0x10009a021: mov edx, 0x120
0x10009a026: mov rsi, r15
0x10009a029: nop dword ptr [rax]
0x10009a030: mov rdi, qword ptr [r13 + 0x5838]
0x10009a037: vmovaps xmm0, xmmword ptr [rdi + rdx - 0x30]
0x10009a03d: vmovaps xmmword ptr [rcx], xmm0
0x10009a041: vmovaps xmm0, xmmword ptr [rdi + rdx - 0x10]
0x10009a047: vmovaps xmmword ptr [rcx - 0x20], xmm0
0x10009a04c: vmovaps xmm0, xmmword ptr [rdi + rdx]
0x10009a051: vmovaps xmmword ptr [rcx - 0x10], xmm0
0x10009a056: add rcx, 0x30
0x10009a05a: add rdx, 0xf0
0x10009a061: dec rsi
0x10009a064: jne 0x10009a030
0x10009a066: test eax, eax
0x10009a068: je 0x10009a8ee
0x10009a06e: mov r14d, r15d
0x10009a071: and r14d, 0xfffffffc
0x10009a075: mov eax, eax
0x10009a077: mov qword ptr [rbp - 0x6160], rax
0x10009a07e: mov rax, r14
0x10009a081: shl rax, 4
0x10009a085: lea rax, [rax + rax*2]
0x10009a089: lea rcx, [rbp + rax - 0x3030]
0x10009a091: mov qword ptr [rbp - 0x6158], rcx
0x10009a098: lea rax, [rbp + rax - 0x6030]
0x10009a0a0: mov qword ptr [rbp - 0x6150], rax
0x10009a0a7: mov rax, r15
0x10009a0aa: sub rax, r14
0x10009a0ad: mov qword ptr [rbp - 0x6148], rax
0x10009a0b4: xor eax, eax
0x10009a0b6: mov qword ptr [rbp - 0x6168], r13
0x10009a0bd: jmp 0x10009a0f0 ; 0x10009a0f0
0x10009a0bf: nop 
0x10009a0c0: mov dword ptr [rbp - 0x300c], 0
0x10009a0ca: cmp byte ptr [rbx + 0x4e], 0
0x10009a0ce: jne 0x10009a157
0x10009a0d4: mov dword ptr [rbp - 0x3010], 0
0x10009a0de: mov dword ptr [rbp - 0x3008], 0
0x10009a0e8: jmp 0x10009a157 ; 0x10009a157
0x10009a0ea: nop word ptr [rax + rax]
0x10009a0f0: mov qword ptr [rbp - 0x6170], rax
0x10009a0f7: mov rbx, qword ptr [rbp + rax*8 - 0x6100]
0x10009a0ff: movsxd rax, dword ptr [rbx + 0xc]
0x10009a103: mov rdi, qword ptr [r13 + rax*8 + 0x6020]
0x10009a10b: mov r10d, dword ptr [rbx + 0x10]
0x10009a10f: mov edx, dword ptr [rbx + 0x38]
0x10009a112: mov ecx, dword ptr [rbx + 0x3c]
0x10009a115: mov r8d, dword ptr [rbx + 0x40]
0x10009a119: mov r9d, dword ptr [rbx + 0x44]
0x10009a11d: vmovss xmm0, dword ptr [rbx + 0x48]
0x10009a122: movzx r11d, byte ptr [rbx + 0x61]
0x10009a127: movzx eax, byte ptr [rbx + 0x4c]
0x10009a12b: lea rsi, [rbp - 0x3030]
0x10009a132: push rax
0x10009a133: push qword ptr [rbx + 0x68]
0x10009a136: push r11
0x10009a138: push r10
0x10009a13a: call 0x1000e6900 ; 0x1000e6900
0x10009a13f: add rsp, 0x20
0x10009a143: cmp byte ptr [rbx + 0x4d], 0
0x10009a147: je 0x10009a0c0
0x10009a14d: cmp byte ptr [rbx + 0x4e], 0
0x10009a151: je 0x10009a0d4
0x10009a157: vmovss xmm1, dword ptr [rbx + 0x14]
0x10009a15c: vpermilps xmm0, xmm1, 0
0x10009a162: vmovaps xmmword ptr [rbp - 0x6140], xmm0
0x10009a16a: vmovss xmm0, dword ptr [rip + 0xa0af4e] ; 0x100aa50c0
0x10009a172: vmovaps xmmword ptr [rbp - 0x6110], xmm1
0x10009a17a: vsubss xmm0, xmm0, xmm1
0x10009a17e: vpermilps xmm0, xmm0, 0
0x10009a184: vmovaps xmmword ptr [rbp - 0x6120], xmm0
0x10009a18c: test r14d, r14d
0x10009a18f: vmovdqa xmm0, xmmword ptr [rip + 0xa0d769] ; 0x100aa7900
0x10009a197: vmovaps xmm8, xmmword ptr [rip + 0xa0af31] ; 0x100aa50d0
0x10009a19f: vmovaps xmm9, xmmword ptr [rip + 0xa0d4b9] ; 0x100aa7660
0x10009a1a7: je 0x10009a704
0x10009a1ad: vpxor xmm0, xmm0, xmmword ptr [rbp - 0x6140]
0x10009a1b5: vmovdqa xmmword ptr [rbp - 0x6130], xmm0
0x10009a1bd: lea rax, [rbp - 0x5f78]
0x10009a1c4: lea rcx, [rbp - 0x2f78]
0x10009a1cb: xor edx, edx
0x10009a1cd: nop dword ptr [rax]
0x10009a1d0: vmovss xmm2, dword ptr [rcx - 0xb8]
0x10009a1d8: vmovss xmm3, dword ptr [rcx - 0xb4]
0x10009a1e0: vinsertps xmm2, xmm2, dword ptr [rcx - 0x88], 0x10
0x10009a1ea: vinsertps xmm2, xmm2, dword ptr [rcx - 0x58], 0x20
0x10009a1f1: vmovss xmm4, dword ptr [rcx - 0x28]
0x10009a1f6: vinsertps xmm3, xmm3, dword ptr [rcx - 0x84], 0x10
0x10009a200: vmovss xmm5, dword ptr [rcx - 0x24]
0x10009a205: vinsertps xmm3, xmm3, dword ptr [rcx - 0x54], 0x20
0x10009a20c: vmovss xmm6, dword ptr [rcx - 0xb0]
0x10009a214: vinsertps xmm6, xmm6, dword ptr [rcx - 0x80], 0x10
0x10009a21b: vinsertps xmm6, xmm6, dword ptr [rcx - 0x50], 0x20
0x10009a222: vinsertps xmm2, xmm2, xmm4, 0x30
0x10009a228: vmovss xmm4, dword ptr [rcx - 0x20]
0x10009a22d: vmovss xmm7, dword ptr [rax - 0xb8]
0x10009a235: vmovss xmm0, dword ptr [rax - 0xb4]
0x10009a23d: vinsertps xmm3, xmm3, xmm5, 0x30
0x10009a243: vinsertps xmm5, xmm7, dword ptr [rax - 0x88], 0x10
0x10009a24d: vinsertps xmm5, xmm5, dword ptr [rax - 0x58], 0x20
0x10009a254: vmovss xmm7, dword ptr [rax - 0x28]
0x10009a259: vinsertps xmm4, xmm6, xmm4, 0x30
0x10009a25f: vinsertps xmm0, xmm0, dword ptr [rax - 0x84], 0x10
0x10009a269: vinsertps xmm0, xmm0, dword ptr [rax - 0x54], 0x20
0x10009a270: vmovss xmm6, dword ptr [rax - 0x24]
0x10009a275: vinsertps xmm5, xmm5, xmm7, 0x30
0x10009a27b: vmovss xmm7, dword ptr [rax - 0xb0]
0x10009a283: vinsertps xmm7, xmm7, dword ptr [rax - 0x80], 0x10
0x10009a28a: vinsertps xmm7, xmm7, dword ptr [rax - 0x50], 0x20
0x10009a291: vinsertps xmm0, xmm0, xmm6, 0x30
0x10009a297: vmovss xmm6, dword ptr [rax - 0x20]
0x10009a29c: vinsertps xmm6, xmm7, xmm6, 0x30
0x10009a2a2: vaddps xmm2, xmm2, xmm8
0x10009a2a7: vmovaps xmm15, xmmword ptr [rbp - 0x6140]
0x10009a2af: vmulps xmm2, xmm15, xmm2
0x10009a2b3: vaddps xmm2, xmm2, xmm9
0x10009a2b8: vaddps xmm3, xmm3, xmm8
0x10009a2bd: vmulps xmm3, xmm15, xmm3
0x10009a2c1: vmulps xmm2, xmm2, xmm5
0x10009a2c5: vaddps xmm3, xmm3, xmm9
0x10009a2ca: vaddps xmm4, xmm4, xmm8
0x10009a2cf: vmulps xmm4, xmm15, xmm4
0x10009a2d3: vmulps xmm0, xmm3, xmm0
0x10009a2d7: vaddps xmm3, xmm4, xmm9
0x10009a2dc: vmulps xmm3, xmm3, xmm6
0x10009a2e0: vextractps dword ptr [rax - 0xb8], xmm2, 0
0x10009a2ea: vextractps dword ptr [rax - 0xb4], xmm0, 0
0x10009a2f4: vextractps dword ptr [rax - 0xb0], xmm3, 0
0x10009a2fe: vextractps dword ptr [rax - 0x88], xmm2, 1
0x10009a308: vextractps dword ptr [rax - 0x84], xmm0, 1
0x10009a312: vmovss xmm4, dword ptr [rcx - 0x98]
0x10009a31a: vextractps dword ptr [rax - 0x80], xmm3, 1
0x10009a321: vmovss xmm5, dword ptr [rcx - 0x94]
0x10009a329: vinsertps xmm4, xmm4, dword ptr [rcx - 0x68], 0x10
0x10009a330: vextractps dword ptr [rax - 0x58], xmm2, 2
0x10009a337: vinsertps xmm4, xmm4, dword ptr [rcx - 0x38], 0x20
0x10009a33e: vmovss xmm6, dword ptr [rcx - 8]
0x10009a343: vextractps dword ptr [rax - 0x54], xmm0, 2
0x10009a34a: vinsertps xmm4, xmm4, xmm6, 0x30
0x10009a350: vinsertps xmm5, xmm5, dword ptr [rcx - 0x64], 0x10
0x10009a357: vextractps dword ptr [rax - 0x50], xmm3, 2
0x10009a35e: vinsertps xmm5, xmm5, dword ptr [rcx - 0x34], 0x20
0x10009a365: vmovss xmm6, dword ptr [rcx - 4]
0x10009a36a: vextractps dword ptr [rax - 0x28], xmm2, 3
0x10009a371: vinsertps xmm2, xmm5, xmm6, 0x30
0x10009a377: vmovss xmm5, dword ptr [rcx - 0x90]
0x10009a37f: vextractps dword ptr [rax - 0x24], xmm0, 3
0x10009a386: vinsertps xmm0, xmm5, dword ptr [rcx - 0x60], 0x10
0x10009a38d: vinsertps xmm0, xmm0, dword ptr [rcx - 0x30], 0x20
0x10009a394: vextractps dword ptr [rax - 0x20], xmm3, 3
0x10009a39b: vmovss xmm3, dword ptr [rcx]
0x10009a39f: vinsertps xmm0, xmm0, xmm3, 0x30
0x10009a3a5: vmovss xmm3, dword ptr [rax - 0x98]
0x10009a3ad: vmovss xmm5, dword ptr [rax - 0x94]
0x10009a3b5: vinsertps xmm3, xmm3, dword ptr [rax - 0x68], 0x10
0x10009a3bc: vinsertps xmm3, xmm3, dword ptr [rax - 0x38], 0x20
0x10009a3c3: vinsertps xmm5, xmm5, dword ptr [rax - 0x64], 0x10
0x10009a3ca: vinsertps xmm3, xmm3, dword ptr [rax - 8], 0x30
0x10009a3d1: vinsertps xmm5, xmm5, dword ptr [rax - 0x34], 0x20
0x10009a3d8: vmovss xmm6, dword ptr [rax - 0x90]
0x10009a3e0: vinsertps xmm6, xmm6, dword ptr [rax - 0x60], 0x10
0x10009a3e7: vinsertps xmm5, xmm5, dword ptr [rax - 4], 0x30
0x10009a3ee: vinsertps xmm6, xmm6, dword ptr [rax - 0x30], 0x20
0x10009a3f5: vinsertps xmm6, xmm6, dword ptr [rax], 0x30
0x10009a3fb: vmulps xmm4, xmm15, xmm4
0x10009a3ff: vaddps xmm4, xmm4, xmm3
0x10009a403: vmulps xmm2, xmm15, xmm2
0x10009a407: vaddps xmm5, xmm2, xmm5
0x10009a40b: vmulps xmm0, xmm15, xmm0
0x10009a40f: vaddps xmm0, xmm0, xmm6
0x10009a413: vextractps dword ptr [rax - 0x98], xmm4, 0
0x10009a41d: vextractps dword ptr [rax - 0x94], xmm5, 0
0x10009a427: vextractps dword ptr [rax - 0x90], xmm0, 0
0x10009a431: vextractps dword ptr [rax - 0x68], xmm4, 1
0x10009a438: vmovss xmm2, dword ptr [rcx - 0xa8]
0x10009a440: vextractps dword ptr [rax - 0x64], xmm5, 1
0x10009a447: vmovss xmm3, dword ptr [rcx - 0xa4]
0x10009a44f: vinsertps xmm2, xmm2, dword ptr [rcx - 0x78], 0x10
0x10009a456: vextractps dword ptr [rax - 0x60], xmm0, 1
0x10009a45d: vinsertps xmm2, xmm2, dword ptr [rcx - 0x48], 0x20
0x10009a464: vinsertps xmm10, xmm2, dword ptr [rcx - 0x18], 0x30
0x10009a46b: vextractps dword ptr [rax - 0x38], xmm4, 2
0x10009a472: vinsertps xmm3, xmm3, dword ptr [rcx - 0x74], 0x10
0x10009a479: vinsertps xmm3, xmm3, dword ptr [rcx - 0x44], 0x20
0x10009a480: vextractps dword ptr [rax - 0x34], xmm5, 2
0x10009a487: vinsertps xmm11, xmm3, dword ptr [rcx - 0x14], 0x30
0x10009a48e: vmovss xmm6, dword ptr [rcx - 0xa0]
0x10009a496: vextractps dword ptr [rax - 0x30], xmm0, 2
0x10009a49d: vinsertps xmm6, xmm6, dword ptr [rcx - 0x70], 0x10
0x10009a4a4: vinsertps xmm6, xmm6, dword ptr [rcx - 0x40], 0x20
0x10009a4ab: vextractps dword ptr [rax - 8], xmm4, 3
0x10009a4b2: vinsertps xmm12, xmm6, dword ptr [rcx - 0x10], 0x30
0x10009a4b9: vmovss xmm6, dword ptr [rcx - 0x9c]
0x10009a4c1: vextractps dword ptr [rax - 4], xmm5, 3
0x10009a4c8: vinsertps xmm5, xmm6, dword ptr [rcx - 0x6c], 0x10
0x10009a4cf: vinsertps xmm5, xmm5, dword ptr [rcx - 0x3c], 0x20
0x10009a4d6: vextractps dword ptr [rax], xmm0, 3
0x10009a4dc: vinsertps xmm0, xmm5, dword ptr [rcx - 0xc], 0x30
0x10009a4e3: vmovss xmm5, dword ptr [rax - 0xa8]
0x10009a4eb: vmovss xmm6, dword ptr [rax - 0xa4]
0x10009a4f3: vinsertps xmm5, xmm5, dword ptr [rax - 0x78], 0x10
0x10009a4fa: vinsertps xmm13, xmm5, dword ptr [rax - 0x48], 0x20
0x10009a501: vinsertps xmm6, xmm6, dword ptr [rax - 0x74], 0x10
0x10009a508: vmovss xmm7, dword ptr [rax - 0xa0]
0x10009a510: vinsertps xmm3, xmm6, dword ptr [rax - 0x44], 0x20
0x10009a517: vinsertps xmm7, xmm7, dword ptr [rax - 0x70], 0x10
0x10009a51e: vmovss xmm1, dword ptr [rax - 0x9c]
0x10009a526: vinsertps xmm1, xmm1, dword ptr [rax - 0x6c], 0x10
0x10009a52d: vxorps xmm2, xmm2, xmm2
0x10009a531: vinsertps xmm14, xmm7, dword ptr [rax - 0x40], 0x20
0x10009a538: vcmpltps xmm2, xmm0, xmm2
0x10009a53d: vblendvps xmm2, xmm15, xmmword ptr [rbp - 0x6130], xmm2
0x10009a547: vmulps xmm15, xmm10, xmm2
0x10009a54b: vinsertps xmm10, xmm1, dword ptr [rax - 0x3c], 0x20
0x10009a552: vmulps xmm8, xmm11, xmm2
0x10009a556: vmulps xmm11, xmm12, xmm2
0x10009a55a: vmulps xmm0, xmm0, xmm2
0x10009a55e: vinsertps xmm13, xmm13, dword ptr [rax - 0x18], 0x30
0x10009a565: vaddps xmm12, xmm0, xmmword ptr [rbp - 0x6120]
0x10009a56d: vmulps xmm4, xmm15, xmm15
0x10009a572: vmulps xmm5, xmm8, xmm8
0x10009a577: vinsertps xmm9, xmm3, dword ptr [rax - 0x14], 0x30
0x10009a57e: vaddps xmm4, xmm4, xmm5
0x10009a582: vmulps xmm5, xmm11, xmm11
0x10009a587: vaddps xmm5, xmm5, xmm4
0x10009a58b: vinsertps xmm4, xmm14, dword ptr [rax - 0x10], 0x30
0x10009a592: vmovaps xmm0, xmmword ptr [rip + 0xa0f126] ; 0x100aa96c0
0x10009a59a: vmovaps xmm2, xmm0
0x10009a59e: vmovaps xmm0, xmmword ptr [rip + 0xa0f10a] ; 0x100aa96b0
0x10009a5a6: vmulps xmm1, xmm12, xmm12
0x10009a5ab: vaddps xmm1, xmm1, xmm5
0x10009a5af: vrsqrtps xmm6, xmm1
0x10009a5b3: vinsertps xmm5, xmm10, dword ptr [rax - 0xc], 0x30
0x10009a5ba: vmulps xmm7, xmm6, xmm6
0x10009a5be: vmulps xmm1, xmm1, xmm7
0x10009a5c2: vsubps xmm1, xmm0, xmm1
0x10009a5c6: vmulps xmm1, xmm1, xmm2
0x10009a5ca: vmulps xmm1, xmm6, xmm1
0x10009a5ce: vmulps xmm6, xmm15, xmm1
0x10009a5d2: vmulps xmm7, xmm8, xmm1
0x10009a5d6: vmulps xmm0, xmm11, xmm1
0x10009a5da: vmulps xmm1, xmm12, xmm1
0x10009a5de: vmulps xmm8, xmm13, xmm1
0x10009a5e2: vmulps xmm2, xmm9, xmm0
0x10009a5e6: vsubps xmm8, xmm8, xmm2
0x10009a5ea: vmulps xmm10, xmm4, xmm7
0x10009a5ee: vmulps xmm11, xmm13, xmm0
0x10009a5f2: vmulps xmm2, xmm9, xmm1
0x10009a5f6: vaddps xmm8, xmm10, xmm8
0x10009a5fb: vaddps xmm10, xmm11, xmm2
0x10009a5ff: vmulps xmm11, xmm4, xmm6
0x10009a603: vmulps xmm12, xmm13, xmm7
0x10009a607: vsubps xmm10, xmm10, xmm11
0x10009a60c: vmulps xmm2, xmm9, xmm6
0x10009a610: vsubps xmm11, xmm2, xmm12
0x10009a615: vmulps xmm2, xmm5, xmm6
0x10009a619: vaddps xmm2, xmm2, xmm8
0x10009a61e: vmulps xmm3, xmm4, xmm1
0x10009a622: vaddps xmm8, xmm3, xmm11
0x10009a627: vmovaps xmm3, xmmword ptr [rip + 0xa0d2d1] ; 0x100aa7900
0x10009a62f: vmulps xmm6, xmm13, xmm6
0x10009a633: vxorps xmm6, xmm6, xmm3
0x10009a637: vmulps xmm3, xmm9, xmm7
0x10009a63b: vmovaps xmm9, xmmword ptr [rip + 0xa0d01d] ; 0x100aa7660
0x10009a643: vsubps xmm3, xmm6, xmm3
0x10009a647: vmulps xmm6, xmm5, xmm7
0x10009a64b: vaddps xmm6, xmm6, xmm10
0x10009a650: vmulps xmm4, xmm4, xmm0
0x10009a654: vsubps xmm3, xmm3, xmm4
0x10009a658: vmulps xmm0, xmm5, xmm0
0x10009a65c: vaddps xmm0, xmm0, xmm8
0x10009a661: vmovaps xmm8, xmmword ptr [rip + 0xa0aa67] ; 0x100aa50d0
0x10009a669: vmulps xmm1, xmm5, xmm1
0x10009a66d: vaddps xmm1, xmm1, xmm3
0x10009a671: vpunpckldq xmm3, xmm2, xmm6
0x10009a675: vmovddup xmm4, xmm0
0x10009a679: vpermilps xmm5, xmm1, 0x24
0x10009a67f: vpblendw xmm4, xmm4, xmm5, 0xc0
0x10009a685: vpunpckldq xmm5, xmm0, xmm1
0x10009a689: vpblendw xmm3, xmm3, xmm4, 0xf0
0x10009a68f: vpermilps xmm4, xmm2, 0xe5
0x10009a695: vpblendw xmm4, xmm4, xmm6, 0xc
0x10009a69b: vpblendw xmm4, xmm4, xmm5, 0xf0
0x10009a6a1: vmovdqa xmmword ptr [rax - 0xa8], xmm3
0x10009a6a9: vmovdqa xmmword ptr [rax - 0x78], xmm4
0x10009a6ae: vpunpckhdq xmm3, xmm2, xmm6
0x10009a6b2: vpermilps xmm4, xmm1, 0xa4
0x10009a6b8: vpblendw xmm4, xmm0, xmm4, 0xc0
0x10009a6be: vpblendw xmm3, xmm3, xmm4, 0xf0
0x10009a6c4: vmovdqa xmmword ptr [rax - 0x48], xmm3
0x10009a6c9: vpunpckhdq xmm0, xmm0, xmm1
0x10009a6cd: vpermilpd xmm1, xmm6, 1
0x10009a6d3: vpermilps xmm2, xmm2, 0xe7
0x10009a6d9: vpblendw xmm1, xmm2, xmm1, 0xc
0x10009a6df: vpblendw xmm0, xmm1, xmm0, 0xf0
0x10009a6e5: vmovdqa xmmword ptr [rax - 0x18], xmm0
0x10009a6ea: add rdx, 4
0x10009a6ee: add rcx, 0xc0
0x10009a6f5: add rax, 0xc0
0x10009a6fb: cmp rdx, r14
0x10009a6fe: jb 0x10009a1d0
0x10009a704: vmovaps xmm0, xmmword ptr [rbp - 0x6120]
0x10009a70c: mov rbx, r15
0x10009a70f: cmp r14d, r15d
0x10009a712: jae 0x10009a8cd
0x10009a718: vpermilps xmm1, xmmword ptr [rbp - 0x6110], 0xc0
0x10009a722: vmovaps xmmword ptr [rbp - 0x6130], xmm1
0x10009a72a: vmulps xmm0, xmm0, xmmword ptr [rip + 0xa0e2ce] ; 0x100aa8a00
0x10009a732: vmovaps xmmword ptr [rbp - 0x6120], xmm0
0x10009a73a: mov r13, qword ptr [rbp - 0x6148]
0x10009a741: mov r15, qword ptr [rbp - 0x6150]
0x10009a748: mov r12, qword ptr [rbp - 0x6158]
0x10009a74f: nop 
0x10009a750: vmovss xmm0, dword ptr [r12]
0x10009a756: vmovaps xmm1, xmmword ptr [rbp - 0x6110]
0x10009a75e: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x10009a763: vmulss xmm0, xmm0, dword ptr [r15]
0x10009a768: vmovss dword ptr [r15], xmm0
0x10009a76d: vmovss xmm0, dword ptr [r12 + 4]
0x10009a774: vmovaps xmm1, xmmword ptr [rbp - 0x6110]
0x10009a77c: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x10009a781: vmulss xmm0, xmm0, dword ptr [r15 + 4]
0x10009a787: vmovss dword ptr [r15 + 4], xmm0
0x10009a78d: vmovss xmm0, dword ptr [r12 + 8]
0x10009a794: vmovaps xmm1, xmmword ptr [rbp - 0x6110]
0x10009a79c: call 0x100aa2a2c ; 0x100aa2a2c _powf
0x10009a7a1: vmulss xmm0, xmm0, dword ptr [r15 + 8]
0x10009a7a7: vmovss dword ptr [r15 + 8], xmm0
0x10009a7ad: vmovaps xmm0, xmmword ptr [rbp - 0x6130]
0x10009a7b5: vmulps xmm0, xmm0, xmmword ptr [r12 + 0x20]
0x10009a7bc: vaddps xmm0, xmm0, xmmword ptr [r15 + 0x20]
0x10009a7c2: vmovaps xmmword ptr [r15 + 0x20], xmm0
0x10009a7c8: vmovaps xmm0, xmmword ptr [r12 + 0x10]
0x10009a7cf: vmulps xmm1, xmm0, xmmword ptr [rip + 0xa0e229] ; 0x100aa8a00
0x10009a7d7: vpermilpd xmm2, xmm1, 1
0x10009a7dd: vaddps xmm1, xmm1, xmm2
0x10009a7e1: vmovshdup xmm2, xmm1
0x10009a7e5: vaddss xmm1, xmm1, xmm2
0x10009a7e9: vxorps xmm2, xmm2, xmm2
0x10009a7ed: vucomiss xmm2, xmm1
0x10009a7f1: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x6140]
0x10009a7f9: jbe 0x10009a810
0x10009a7fb: vmovaps xmm1, xmmword ptr [rbp - 0x6120]
0x10009a803: vsubps xmm0, xmm1, xmm0
0x10009a807: jmp 0x10009a818 ; 0x10009a818
0x10009a809: nop dword ptr [rax]
0x10009a810: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x6120]
0x10009a818: vmulps xmm1, xmm0, xmm0
0x10009a81c: vpermilpd xmm2, xmm1, 1
0x10009a822: vaddps xmm1, xmm1, xmm2
0x10009a826: vmovshdup xmm2, xmm1
0x10009a82a: vaddss xmm1, xmm1, xmm2
0x10009a82e: vsqrtss xmm1, xmm1, xmm1
0x10009a832: vucomiss xmm1, dword ptr [rip + 0xa0d08a] ; 0x100aa78c4
0x10009a83a: jbe 0x10009a846
0x10009a83c: vpermilps xmm1, xmm1, 0
0x10009a842: vdivps xmm0, xmm0, xmm1
0x10009a846: vpermilps xmm1, xmm0, 0xe7
0x10009a84c: vpermilps xmm2, xmm0, 0xff
0x10009a852: vmovaps xmm3, xmmword ptr [r15 + 0x10]
0x10009a858: vmulps xmm2, xmm2, xmm3
0x10009a85c: vpermilps xmm4, xmm3, 0xe7
0x10009a862: vpermilps xmm5, xmm3, 0xff
0x10009a868: vmulps xmm5, xmm0, xmm5
0x10009a86c: vaddps xmm2, xmm2, xmm5
0x10009a870: vpermilps xmm5, xmm0, 0xd2
0x10009a876: vmulps xmm5, xmm5, xmm3
0x10009a87a: vpermilps xmm6, xmm3, 0xd2
0x10009a880: vmulps xmm6, xmm0, xmm6
0x10009a884: vsubps xmm5, xmm5, xmm6
0x10009a888: vpermilps xmm5, xmm5, 0xd2
0x10009a88e: vaddps xmm2, xmm2, xmm5
0x10009a892: vmulss xmm1, xmm1, xmm4
0x10009a896: vmulps xmm0, xmm0, xmm3
0x10009a89a: vmovshdup xmm3, xmm0
0x10009a89e: vaddss xmm3, xmm0, xmm3
0x10009a8a2: vpermilpd xmm0, xmm0, 1
0x10009a8a8: vaddss xmm0, xmm0, xmm3
0x10009a8ac: vsubss xmm0, xmm1, xmm0
0x10009a8b0: vinsertps xmm0, xmm2, xmm0, 0x30
0x10009a8b6: vmovaps xmmword ptr [r15 + 0x10], xmm0
0x10009a8bc: add r12, 0x30
0x10009a8c0: add r15, 0x30
0x10009a8c4: dec r13
0x10009a8c7: jne 0x10009a750
0x10009a8cd: mov rax, qword ptr [rbp - 0x6170]
0x10009a8d4: inc rax
0x10009a8d7: cmp rax, qword ptr [rbp - 0x6160]
0x10009a8de: mov r13, qword ptr [rbp - 0x6168]
0x10009a8e5: mov r15, rbx
0x10009a8e8: jne 0x10009a0f0
0x10009a8ee: test r15d, r15d
0x10009a8f1: je 0x10009a958
0x10009a8f3: movabs rax, 0x100000000
0x10009a8fd: lea rcx, [rbp - 0x6010]
0x10009a904: mov rdx, rax
0x10009a907: nop word ptr [rax + rax]
0x10009a910: mov rsi, qword ptr [r13 + 0x5838]
0x10009a917: mov rdi, rdx
0x10009a91a: sar rdi, 0x20
0x10009a91e: imul rdi, rdi, 0xf0
0x10009a925: vmovaps xmm0, xmmword ptr [rcx]
0x10009a929: vmovaps xmmword ptr [rsi + rdi], xmm0
0x10009a92e: vmovaps xmm0, xmmword ptr [rcx - 0x20]
0x10009a933: vmovaps xmmword ptr [rsi + rdi + 0x20], xmm0
0x10009a939: vmovaps xmm0, xmmword ptr [rcx - 0x10]
0x10009a93e: vmovaps xmmword ptr [rsi + rdi + 0x30], xmm0
0x10009a944: mov byte ptr [rsi + rdi + 0xe0], 1
0x10009a94c: add rcx, 0x30
0x10009a950: add rdx, rax
0x10009a953: dec r15
0x10009a956: jne 0x10009a910
0x10009a958: mov rax, qword ptr [rip + 0xb72f79] ; 0x100c0d8d8
0x10009a95f: mov rax, qword ptr [rax]
0x10009a962: cmp rax, qword ptr [rbp - 0x30]
0x10009a966: jne 0x10009a97a
0x10009a968: add rsp, 0x6148
0x10009a96f: pop rbx
0x10009a970: pop r12
0x10009a972: pop r13
0x10009a974: pop r14
0x10009a976: pop r15
0x10009a978: pop rbp
0x10009a979: ret 
0x10009a97a: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10009a97f: nop 
