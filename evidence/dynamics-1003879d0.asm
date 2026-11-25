0x1003879d0: push rbp
0x1003879d1: mov rbp, rsp
0x1003879d4: push r15
0x1003879d6: push r14
0x1003879d8: push rbx
0x1003879d9: push rax
0x1003879da: mov r15, rsi
0x1003879dd: mov rbx, rdi
0x1003879e0: mov eax, dword ptr [rbx + 0x14]
0x1003879e3: mov dword ptr [rbx + 0x18], eax
0x1003879e6: call 0x100aa285e ; 0x100aa285e _mach_absolute_time
0x1003879eb: mov r14, rax
0x1003879ee: sub rax, qword ptr [rbx + 0x90]
0x1003879f5: mov rcx, qword ptr [rbx + 0x98]
0x1003879fc: mov esi, dword ptr [rcx]
0x1003879fe: mov ecx, dword ptr [rcx + 4]
0x100387a01: imul rax, rsi
0x100387a05: xor edx, edx
0x100387a07: div rcx
0x100387a0a: vmovq xmm0, rax
0x100387a0f: vmovdqa xmm1, xmmword ptr [rip + 0x71e479] ; 0x100aa5e90
0x100387a17: vpunpckldq xmm0, xmm0, xmm1
0x100387a1b: vmovapd xmm2, xmmword ptr [rip + 0x71e47d] ; 0x100aa5ea0
0x100387a23: vsubpd xmm0, xmm0, xmm2
0x100387a27: vhaddpd xmm0, xmm0, xmm0
0x100387a2b: vmovsd xmm3, qword ptr [rip + 0x736c1d] ; 0x100abe650
0x100387a33: vdivsd xmm0, xmm0, xmm3
0x100387a37: vcvtsd2ss xmm0, xmm0, xmm0
0x100387a3b: vmovd dword ptr [rbx + 0x14], xmm0
0x100387a40: mov rax, r14
0x100387a43: sub rax, qword ptr [rbx + 0x88]
0x100387a4a: imul rax, rsi
0x100387a4e: xor edx, edx
0x100387a50: div rcx
0x100387a53: vmovq xmm4, rax
0x100387a58: vpunpckldq xmm1, xmm4, xmm1
0x100387a5c: vsubpd xmm1, xmm1, xmm2
0x100387a60: vhaddpd xmm1, xmm1, xmm1
0x100387a64: vdivsd xmm1, xmm1, xmm3
0x100387a68: vcvtsd2ss xmm1, xmm1, xmm1
0x100387a6c: vmovss dword ptr [rbx + 0x1c], xmm1
0x100387a71: cmp byte ptr [rbx + 0xc], 0
0x100387a75: je 0x100387a81
0x100387a77: mov eax, dword ptr [rbx + 0x10]
0x100387a7a: mov dword ptr [rbx + 0x14], eax
0x100387a7d: vmovd xmm0, eax
0x100387a81: vcvtss2sd xmm1, xmm0, xmm0
0x100387a85: vaddsd xmm1, xmm1, qword ptr [rbx + 0xb0]
0x100387a8d: vmovsd qword ptr [rbx + 0xb0], xmm1
0x100387a95: cmp byte ptr [rip + 0x1c73634], 0 ; 0x101ffb0d0
0x100387a9c: je 0x100387aa8
0x100387a9e: vmovss xmm1, dword ptr [rip + 0x930a9a] ; 0x100cb8540
0x100387aa6: jmp 0x100387ab0 ; 0x100387ab0
0x100387aa8: vmovss xmm1, dword ptr [rip + 0x71d610] ; 0x100aa50c0
0x100387ab0: vmulss xmm1, xmm1, dword ptr [rbx + 0x20]
0x100387ab5: vmulss xmm0, xmm0, xmm1
0x100387ab9: vmovss xmm1, dword ptr [rip + 0x71efdb] ; 0x100aa6a9c
0x100387ac1: vmaxss xmm0, xmm1, xmm0
0x100387ac5: vmovss xmm1, dword ptr [rip + 0x71efd3] ; 0x100aa6aa0
0x100387acd: vminss xmm0, xmm1, xmm0
0x100387ad1: vaddss xmm0, xmm0, dword ptr [rbx + 0x24]
0x100387ad6: vucomiss xmm0, dword ptr [rip + 0x736b7a] ; 0x100abe658
0x100387ade: jbe 0x100387aed
0x100387ae0: vmovss xmm1, dword ptr [rip + 0x736b70] ; 0x100abe658
0x100387ae8: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x100387aed: vmovss dword ptr [rbx + 0x24], xmm0
0x100387af2: test r15, r15
0x100387af5: je 0x100387b02
0x100387af7: vmovsd xmm0, qword ptr [r15 + 0x3f3c8]
0x100387b00: jmp 0x100387b06 ; 0x100387b06
0x100387b02: vxorps xmm0, xmm0, xmm0
0x100387b06: vmovsd qword ptr [rbx + 0xc0], xmm0
0x100387b0e: call 0x1007e8490 ; 0x1007e8490
0x100387b13: vmovq xmm0, rax
0x100387b18: vpunpckldq xmm0, xmm0, xmmword ptr [rip + 0x71e370] ; 0x100aa5e90
0x100387b20: vsubpd xmm0, xmm0, xmmword ptr [rip + 0x71e378] ; 0x100aa5ea0
0x100387b28: vhaddpd xmm0, xmm0, xmm0
0x100387b2c: vdivsd xmm0, xmm0, qword ptr [rip + 0x72a2a4] ; 0x100ab1dd8
0x100387b34: vaddsd xmm0, xmm0, qword ptr [rbx + 0xc0]
0x100387b3c: vmovsd qword ptr [rbx + 0xb8], xmm0
0x100387b44: vmovdqu ymm3, ymmword ptr [rbx + 0x30]
0x100387b49: vmovdqu ymmword ptr [rbx + 0x2c], ymm3
0x100387b4e: mov ecx, dword ptr [rbx + 0x50]
0x100387b51: mov dword ptr [rbx + 0x4c], ecx
0x100387b54: mov eax, dword ptr [rbx + 0x54]
0x100387b57: mov dword ptr [rbx + 0x50], eax
0x100387b5a: mov edi, dword ptr [rbx + 0x58]
0x100387b5d: mov dword ptr [rbx + 0x54], edi
0x100387b60: mov esi, dword ptr [rbx + 0x5c]
0x100387b63: mov dword ptr [rbx + 0x58], esi
0x100387b66: mov r10d, dword ptr [rbx + 0x60]
0x100387b6a: mov dword ptr [rbx + 0x5c], r10d
0x100387b6e: mov r9d, dword ptr [rbx + 0x64]
0x100387b72: mov dword ptr [rbx + 0x60], r9d
0x100387b76: mov r8d, dword ptr [rbx + 0x68]
0x100387b7a: mov dword ptr [rbx + 0x64], r8d
0x100387b7e: mov edx, dword ptr [rbx + 0x14]
0x100387b81: mov dword ptr [rbx + 0x68], edx
0x100387b84: cmp byte ptr [rbx + 0xc], 0
0x100387b88: vmovd xmm1, edx
0x100387b8c: je 0x100387b99
0x100387b8e: mov eax, dword ptr [rbx + 0x10]
0x100387b91: mov dword ptr [rbx + 0x28], eax
0x100387b94: jmp 0x100387d58 ; 0x100387d58
0x100387b99: vmovd edx, xmm3
0x100387b9d: vmovd xmm4, edx
0x100387ba1: vmovshdup xmm6, xmm3
0x100387ba5: vpermilpd xmm5, xmm3, 1
0x100387bab: mov dword ptr [rbx + 0x28], 0
0x100387bb2: vxorpd xmm2, xmm2, xmm2
0x100387bb6: vxorps xmm7, xmm7, xmm7
0x100387bba: vucomiss xmm4, xmm7
0x100387bbe: jb 0x100387bcd
0x100387bc0: mov dword ptr [rbx + 0x28], edx
0x100387bc3: vinsertps xmm2, xmm4, dword ptr [rip + 0x71d4f3], 0x10 ; 0x100aa50c0
0x100387bcd: vpermilps xmm4, xmm3, 0xe7
0x100387bd3: vucomiss xmm6, xmm7
0x100387bd7: jb 0x100387bec
0x100387bd9: vinsertps xmm6, xmm6, dword ptr [rip + 0x71d4dd], 0x10 ; 0x100aa50c0
0x100387be3: vaddps xmm2, xmm2, xmm6
0x100387be7: vmovss dword ptr [rbx + 0x28], xmm2
0x100387bec: vextractf128 xmm3, ymm3, 1
0x100387bf2: vxorps xmm6, xmm6, xmm6
0x100387bf6: vucomiss xmm5, xmm6
0x100387bfa: jb 0x100387c0f
0x100387bfc: vinsertps xmm5, xmm5, dword ptr [rip + 0x71d4ba], 0x10 ; 0x100aa50c0
0x100387c06: vaddps xmm2, xmm2, xmm5
0x100387c0a: vmovss dword ptr [rbx + 0x28], xmm2
0x100387c0f: vmovshdup xmm5, xmm3
0x100387c13: vucomiss xmm4, xmm6
0x100387c17: jb 0x100387c2c
0x100387c19: vinsertps xmm4, xmm4, dword ptr [rip + 0x71d49d], 0x10 ; 0x100aa50c0
0x100387c23: vaddps xmm2, xmm2, xmm4
0x100387c27: vmovss dword ptr [rbx + 0x28], xmm2
0x100387c2c: vpermilpd xmm4, xmm3, 1
0x100387c32: vxorps xmm6, xmm6, xmm6
0x100387c36: vucomiss xmm3, xmm6
0x100387c3a: jae 0x100387dbc
0x100387c40: vpermilps xmm3, xmm3, 0xe7
0x100387c46: vucomiss xmm5, xmm6
0x100387c4a: jae 0x100387ddf
0x100387c50: vxorps xmm5, xmm5, xmm5
0x100387c54: vucomiss xmm4, xmm5
0x100387c58: jae 0x100387e00
0x100387c5e: vmovd xmm4, ecx
0x100387c62: vucomiss xmm3, xmm5
0x100387c66: jb 0x100387c7b
0x100387c68: vinsertps xmm3, xmm3, dword ptr [rip + 0x71d44e], 0x10 ; 0x100aa50c0
0x100387c72: vaddps xmm2, xmm2, xmm3
0x100387c76: vmovss dword ptr [rbx + 0x28], xmm2
0x100387c7b: vmovd xmm3, eax
0x100387c7f: vxorps xmm5, xmm5, xmm5
0x100387c83: vucomiss xmm4, xmm5
0x100387c87: jb 0x100387c9c
0x100387c89: vinsertps xmm4, xmm4, dword ptr [rip + 0x71d42d], 0x10 ; 0x100aa50c0
0x100387c93: vaddps xmm2, xmm2, xmm4
0x100387c97: vmovss dword ptr [rbx + 0x28], xmm2
0x100387c9c: vmovd xmm4, edi
0x100387ca0: vucomiss xmm3, xmm5
0x100387ca4: jb 0x100387cb9
0x100387ca6: vinsertps xmm3, xmm3, dword ptr [rip + 0x71d410], 0x10 ; 0x100aa50c0
0x100387cb0: vaddps xmm2, xmm2, xmm3
0x100387cb4: vmovss dword ptr [rbx + 0x28], xmm2
0x100387cb9: vmovd xmm3, esi
0x100387cbd: vxorps xmm5, xmm5, xmm5
0x100387cc1: vucomiss xmm4, xmm5
0x100387cc5: jb 0x100387cda
0x100387cc7: vinsertps xmm4, xmm4, dword ptr [rip + 0x71d3ef], 0x10 ; 0x100aa50c0
0x100387cd1: vaddps xmm2, xmm2, xmm4
0x100387cd5: vmovss dword ptr [rbx + 0x28], xmm2
0x100387cda: vmovd xmm4, r10d
0x100387cdf: vucomiss xmm3, xmm5
0x100387ce3: jb 0x100387cf8
0x100387ce5: vinsertps xmm3, xmm3, dword ptr [rip + 0x71d3d1], 0x10 ; 0x100aa50c0
0x100387cef: vaddps xmm2, xmm2, xmm3
0x100387cf3: vmovss dword ptr [rbx + 0x28], xmm2
0x100387cf8: vmovd xmm3, r9d
0x100387cfd: vxorps xmm5, xmm5, xmm5
0x100387d01: vucomiss xmm4, xmm5
0x100387d05: jae 0x100387e26
0x100387d0b: vmovd xmm4, r8d
0x100387d10: vucomiss xmm3, xmm5
0x100387d14: jae 0x100387e48
0x100387d1a: vxorps xmm3, xmm3, xmm3
0x100387d1e: vucomiss xmm4, xmm3
0x100387d22: jae 0x100387e69
0x100387d28: vucomiss xmm1, xmm3
0x100387d2c: jb 0x100387d41
0x100387d2e: vinsertps xmm3, xmm1, dword ptr [rip + 0x71d388], 0x10 ; 0x100aa50c0
0x100387d38: vaddps xmm2, xmm2, xmm3
0x100387d3c: vmovss dword ptr [rbx + 0x28], xmm2
0x100387d41: vmovshdup xmm3, xmm2
0x100387d45: vpxor xmm4, xmm4, xmm4
0x100387d49: vucomiss xmm3, xmm4
0x100387d4d: jbe 0x100387d58
0x100387d4f: vdivss xmm2, xmm2, xmm3
0x100387d53: vmovss dword ptr [rbx + 0x28], xmm2
0x100387d58: vmovss xmm5, dword ptr [rbx + 0x78]
0x100387d5d: vmovss xmm3, dword ptr [rbx + 0x80]
0x100387d65: vaddss xmm2, xmm3, dword ptr [rbx + 0x84]
0x100387d6d: vmovss xmm4, dword ptr [rbx + 0x7c]
0x100387d72: vaddss xmm2, xmm2, xmm4
0x100387d76: vucomiss xmm2, xmm5
0x100387d7a: mov al, byte ptr [rbx + 0x6c]
0x100387d7d: jbe 0x100387da6
0x100387d7f: test al, al
0x100387d81: je 0x100387e8b
0x100387d87: vmovd xmm6, dword ptr [rbx + 0x20]
0x100387d8c: cmp byte ptr [rip + 0x1c7333d], 0 ; 0x101ffb0d0
0x100387d93: je 0x100387ea6
0x100387d99: vmovss xmm7, dword ptr [rip + 0x93079f] ; 0x100cb8540
0x100387da1: jmp 0x100387eae ; 0x100387eae
0x100387da6: test al, al
0x100387da8: je 0x100387f91
0x100387dae: mov byte ptr [rbx + 0x6c], 0
0x100387db2: vmovss xmm1, dword ptr [rbx + 0x70]
0x100387db7: jmp 0x100387f84 ; 0x100387f84
0x100387dbc: vinsertps xmm7, xmm3, dword ptr [rip + 0x71d2fa], 0x10 ; 0x100aa50c0
0x100387dc6: vaddps xmm2, xmm2, xmm7
0x100387dca: vmovss dword ptr [rbx + 0x28], xmm2
0x100387dcf: vpermilps xmm3, xmm3, 0xe7
0x100387dd5: vucomiss xmm5, xmm6
0x100387dd9: jb 0x100387c50
0x100387ddf: vinsertps xmm5, xmm5, dword ptr [rip + 0x71d2d7], 0x10 ; 0x100aa50c0
0x100387de9: vaddps xmm2, xmm2, xmm5
0x100387ded: vmovss dword ptr [rbx + 0x28], xmm2
0x100387df2: vxorps xmm5, xmm5, xmm5
0x100387df6: vucomiss xmm4, xmm5
0x100387dfa: jb 0x100387c5e
0x100387e00: vinsertps xmm4, xmm4, dword ptr [rip + 0x71d2b6], 0x10 ; 0x100aa50c0
0x100387e0a: vaddps xmm2, xmm2, xmm4
0x100387e0e: vmovss dword ptr [rbx + 0x28], xmm2
0x100387e13: vmovd xmm4, ecx
0x100387e17: vucomiss xmm3, xmm5
0x100387e1b: jae 0x100387c68
0x100387e21: jmp 0x100387c7b ; 0x100387c7b
0x100387e26: vinsertps xmm4, xmm4, dword ptr [rip + 0x71d290], 0x10 ; 0x100aa50c0
0x100387e30: vaddps xmm2, xmm2, xmm4
0x100387e34: vmovss dword ptr [rbx + 0x28], xmm2
0x100387e39: vmovd xmm4, r8d
0x100387e3e: vucomiss xmm3, xmm5
0x100387e42: jb 0x100387d1a
0x100387e48: vinsertps xmm3, xmm3, dword ptr [rip + 0x71d26e], 0x10 ; 0x100aa50c0
0x100387e52: vaddps xmm2, xmm2, xmm3
0x100387e56: vmovss dword ptr [rbx + 0x28], xmm2
0x100387e5b: vxorps xmm3, xmm3, xmm3
0x100387e5f: vucomiss xmm4, xmm3
0x100387e63: jb 0x100387d28
0x100387e69: vinsertps xmm4, xmm4, dword ptr [rip + 0x71d24d], 0x10 ; 0x100aa50c0
0x100387e73: vaddps xmm2, xmm2, xmm4
0x100387e77: vmovss dword ptr [rbx + 0x28], xmm2
0x100387e7c: vucomiss xmm1, xmm3
0x100387e80: jae 0x100387d2e
0x100387e86: jmp 0x100387d41 ; 0x100387d41
0x100387e8b: mov byte ptr [rbx + 0x6c], 1
0x100387e8f: mov eax, dword ptr [rbx + 0x20]
0x100387e92: mov dword ptr [rbx + 0x70], eax
0x100387e95: vmovd xmm6, eax
0x100387e99: cmp byte ptr [rip + 0x1c73230], 0 ; 0x101ffb0d0
0x100387ea0: jne 0x100387d99
0x100387ea6: vmovss xmm7, dword ptr [rip + 0x71d212] ; 0x100aa50c0
0x100387eae: vmulss xmm6, xmm6, xmm7
0x100387eb2: vmulss xmm1, xmm6, xmm1
0x100387eb6: vmovss xmm6, dword ptr [rip + 0x71ebde] ; 0x100aa6a9c
0x100387ebe: vmaxss xmm1, xmm6, xmm1
0x100387ec2: vmovss xmm6, dword ptr [rip + 0x71ebd6] ; 0x100aa6aa0
0x100387eca: vminss xmm1, xmm6, xmm1
0x100387ece: vaddss xmm1, xmm5, xmm1
0x100387ed2: vmovss dword ptr [rbx + 0x78], xmm1
0x100387ed7: vucomiss xmm3, xmm1
0x100387edb: jbe 0x100387f1f
0x100387edd: vdivss xmm1, xmm1, xmm3
0x100387ee1: vcmpltss xmm2, xmm3, dword ptr [rip + 0x7216e6] ; 0x100aa95d0
0x100387eea: vandps xmm4, xmm2, xmm1
0x100387eee: vmovss xmm5, dword ptr [rip + 0x71d1ca] ; 0x100aa50c0
0x100387ef6: vandnps xmm2, xmm2, xmm5
0x100387efa: vorps xmm2, xmm2, xmm4
0x100387efe: vmovss xmm4, dword ptr [rip + 0x71f9be] ; 0x100aa78c4
0x100387f06: vcmpltss xmm3, xmm4, xmm3
0x100387f0b: vblendvps xmm1, xmm2, xmm1, xmm3
0x100387f11: vxorps xmm2, xmm2, xmm2
0x100387f15: vmaxss xmm1, xmm2, xmm1
0x100387f19: vminss xmm1, xmm5, xmm1
0x100387f1d: jmp 0x100387f6f ; 0x100387f6f
0x100387f1f: vaddss xmm3, xmm3, xmm4
0x100387f23: vucomiss xmm1, xmm3
0x100387f27: jbe 0x100387f67
0x100387f29: vsubss xmm4, xmm3, xmm2
0x100387f2d: vucomiss xmm4, dword ptr [rip + 0x71f98f] ; 0x100aa78c4
0x100387f35: vmovss xmm3, dword ptr [rip + 0x71d183] ; 0x100aa50c0
0x100387f3d: ja 0x100387f51
0x100387f3f: vmovss xmm5, dword ptr [rip + 0x721689] ; 0x100aa95d0
0x100387f47: vucomiss xmm5, xmm4
0x100387f4b: vmovaps xmm5, xmm3
0x100387f4f: jbe 0x100387f59
0x100387f51: vsubss xmm1, xmm1, xmm2
0x100387f55: vdivss xmm5, xmm1, xmm4
0x100387f59: vxorps xmm1, xmm1, xmm1
0x100387f5d: vmaxss xmm1, xmm1, xmm5
0x100387f61: vminss xmm1, xmm3, xmm1
0x100387f65: jmp 0x100387f6f ; 0x100387f6f
0x100387f67: vmovss xmm1, dword ptr [rip + 0x71d151] ; 0x100aa50c0
0x100387f6f: vmovss xmm2, dword ptr [rip + 0x71d149] ; 0x100aa50c0
0x100387f77: vsubss xmm2, xmm2, xmm1
0x100387f7b: vmulss xmm1, xmm1, dword ptr [rbx + 0x74]
0x100387f80: vaddss xmm1, xmm2, xmm1
0x100387f84: vmovss dword ptr [rbx + 0x20], xmm1
0x100387f89: vmovsd qword ptr [rbx + 0xc8], xmm0
0x100387f91: mov qword ptr [rbx + 0x90], r14
0x100387f98: add rsp, 8
0x100387f9c: pop rbx
0x100387f9d: pop r14
0x100387f9f: pop r15
0x100387fa1: pop rbp
0x100387fa2: vzeroupper 
0x100387fa5: ret 
0x100387fa6: nop word ptr cs:[rax + rax]
