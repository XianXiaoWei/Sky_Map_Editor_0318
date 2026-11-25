0x10071e7f0: push rbp
0x10071e7f1: mov rbp, rsp
0x10071e7f4: push r15
0x10071e7f6: push r14
0x10071e7f8: push r12
0x10071e7fa: push rbx
0x10071e7fb: sub rsp, 0x30
0x10071e7ff: vmovaps xmm14, xmmword ptr [rdx]
0x10071e803: vmovaps xmm9, xmmword ptr [rdx + 0x10]
0x10071e808: vmovaps xmm4, xmmword ptr [rdx + 0x20]
0x10071e80d: vmovaps xmm7, xmmword ptr [rdx + 0x30]
0x10071e812: vinsertps xmm1, xmm9, xmm14, 0x4c
0x10071e818: vinsertps xmm1, xmm1, xmm4, 0x68
0x10071e81e: vinsertps xmm1, xmm1, xmm7, 0x70
0x10071e824: vmulps xmm1, xmm1, xmm1
0x10071e828: vmovshdup xmm2, xmm1
0x10071e82c: vaddss xmm2, xmm1, xmm2
0x10071e830: vpermilpd xmm1, xmm1, 1
0x10071e836: vaddss xmm1, xmm1, xmm2
0x10071e83a: vsqrtss xmm1, xmm1, xmm1
0x10071e83e: vmovss xmm2, dword ptr [rip + 0x39e49a] ; 0x100abcce0
0x10071e846: vdivss xmm1, xmm2, xmm1
0x10071e84a: prefetcht0 byte ptr [rdi]
0x10071e84d: prefetcht0 byte ptr [rdi + 0x40]
0x10071e851: prefetcht0 byte ptr [rdi + 0x80]
0x10071e858: prefetcht0 byte ptr [rdi + 0xc0]
0x10071e85f: prefetcht0 byte ptr [rdi + 0x100]
0x10071e866: prefetcht0 byte ptr [rdi + 0x140]
0x10071e86d: prefetcht0 byte ptr [rdi + 0x180]
0x10071e874: prefetcht0 byte ptr [rdi + 0x1c0]
0x10071e87b: prefetcht0 byte ptr [rdi + 0x200]
0x10071e882: prefetcht0 byte ptr [rdi + 0x240]
0x10071e889: prefetcht0 byte ptr [rdi + 0x280]
0x10071e890: prefetcht0 byte ptr [rdi + 0x2c0]
0x10071e897: prefetcht0 byte ptr [rdi + 0x300]
0x10071e89e: prefetcht0 byte ptr [rdi + 0x340]
0x10071e8a5: prefetcht0 byte ptr [rdi + 0x380]
0x10071e8ac: prefetcht0 byte ptr [rdi + 0x3c0]
0x10071e8b3: prefetcht0 byte ptr [rdi + 0x400]
0x10071e8ba: prefetcht0 byte ptr [rdi + 0x440]
0x10071e8c1: prefetcht0 byte ptr [rdi + 0x480]
0x10071e8c8: prefetcht0 byte ptr [rdi + 0x4c0]
0x10071e8cf: prefetcht0 byte ptr [rdi + 0x500]
0x10071e8d6: prefetcht0 byte ptr [rdi + 0x540]
0x10071e8dd: prefetcht0 byte ptr [rdi + 0x580]
0x10071e8e4: prefetcht0 byte ptr [rdi + 0x5c0]
0x10071e8eb: prefetcht0 byte ptr [rdi + 0x600]
0x10071e8f2: prefetcht0 byte ptr [rdi + 0x640]
0x10071e8f9: prefetcht0 byte ptr [rdi + 0x680]
0x10071e900: prefetcht0 byte ptr [rdi + 0x6c0]
0x10071e907: prefetcht0 byte ptr [rdi + 0x700]
0x10071e90e: prefetcht0 byte ptr [rdi + 0x740]
0x10071e915: prefetcht0 byte ptr [rdi + 0x780]
0x10071e91c: prefetcht0 byte ptr [rdi + 0x7c0]
0x10071e923: test esi, esi
0x10071e925: vmovaps xmmword ptr [rbp - 0x30], xmm1
0x10071e92a: je 0x10071ec88
0x10071e930: mov r8d, esi
0x10071e933: and r8d, 0xfffffffc
0x10071e937: vpermilpd xmm6, xmm7, 3
0x10071e93d: vpermilps xmm13, xmm6, 0x55
0x10071e943: vpermilpd xmm0, xmm4, 3
0x10071e949: vpermilps xmm15, xmm0, 0x55
0x10071e94f: vpermilpd xmm5, xmm9, 3
0x10071e955: vpermilps xmm12, xmm5, 0x55
0x10071e95b: vpermilpd xmm3, xmm14, 3
0x10071e961: vpermilps xmm8, xmm3, 0x55
0x10071e967: vmovddup xmm7, xmm7
0x10071e96b: vpermilps xmm2, xmm7, 0
0x10071e971: vmovaps xmmword ptr [rbp - 0x40], xmm2
0x10071e976: vpermilps xmm11, xmm7, 0x55
0x10071e97c: vpermilps xmm2, xmm6, 0
0x10071e982: vmovaps xmmword ptr [rbp - 0xd0], xmm2
0x10071e98a: vmovddup xmm6, xmm4
0x10071e98e: vpermilps xmm2, xmm6, 0
0x10071e994: vmovaps xmmword ptr [rbp - 0xc0], xmm2
0x10071e99c: vpermilps xmm2, xmm6, 0x55
0x10071e9a2: vmovaps xmmword ptr [rbp - 0xb0], xmm2
0x10071e9aa: vpermilps xmm0, xmm0, 0
0x10071e9b0: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x10071e9b8: vmovddup xmm0, xmm9
0x10071e9bd: vpermilps xmm2, xmm0, 0
0x10071e9c3: vmovaps xmmword ptr [rbp - 0x90], xmm2
0x10071e9cb: vpermilps xmm0, xmm0, 0x55
0x10071e9d1: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x10071e9d6: vpermilps xmm0, xmm5, 0
0x10071e9dc: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x10071e9e1: vmovddup xmm7, xmm14
0x10071e9e6: vpermilps xmm0, xmm7, 0
0x10071e9ec: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x10071e9f1: vpermilps xmm9, xmm7, 0x55
0x10071e9f7: vpermilps xmm4, xmm3, 0
0x10071e9fd: xor r11d, r11d
0x10071ea00: xor r9d, r9d
0x10071ea03: vpermilps xmm0, xmm1, 0
0x10071ea09: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x10071ea0e: vmovdqa xmm2, xmmword ptr [rip + 0x3bae4a] ; 0x100ad9860
0x10071ea16: vmovaps xmm10, xmmword ptr [rip + 0x39a822] ; 0x100ab9240
0x10071ea1e: nop 
0x10071ea20: add r9d, 0x200
0x10071ea27: cmp r9d, r8d
0x10071ea2a: mov r10d, r8d
0x10071ea2d: cmovb r10d, r9d
0x10071ea31: cmp r11d, r10d
0x10071ea34: jae 0x10071ec7d
0x10071ea3a: nop word ptr [rax + rax]
0x10071ea40: mov eax, r11d
0x10071ea43: sub eax, -0x80
0x10071ea46: mov r14d, r11d
0x10071ea49: shl rax, 4
0x10071ea4d: shl r14, 4
0x10071ea51: lea r15d, [r11 + 1]
0x10071ea55: lea r12d, [r11 + 2]
0x10071ea59: shl r15, 4
0x10071ea5d: shl r12, 4
0x10071ea61: lea ebx, [r11 + 3]
0x10071ea65: shl rbx, 4
0x10071ea69: prefetcht0 byte ptr [rdi + rax]
0x10071ea6d: vmovss xmm0, dword ptr [rdi + r14]
0x10071ea73: vmovss xmm5, dword ptr [rdi + r14 + 4]
0x10071ea7a: vinsertps xmm0, xmm0, dword ptr [rdi + r15], 0x10
0x10071ea81: vinsertps xmm0, xmm0, dword ptr [rdi + r12], 0x20
0x10071ea88: vinsertps xmm5, xmm5, dword ptr [rdi + r15 + 4], 0x10
0x10071ea90: vinsertps xmm5, xmm5, dword ptr [rdi + r12 + 4], 0x20
0x10071ea98: vmovaps xmm3, xmm11
0x10071ea9c: vmovss xmm14, dword ptr [rdi + r14 + 8]
0x10071eaa3: vinsertps xmm11, xmm5, dword ptr [rdi + rbx + 4], 0x30
0x10071eaab: vinsertps xmm5, xmm14, dword ptr [rdi + r15 + 8], 0x10
0x10071eab3: vinsertps xmm5, xmm5, dword ptr [rdi + r12 + 8], 0x20
0x10071eabb: vinsertps xmm5, xmm5, dword ptr [rdi + rbx + 8], 0x30
0x10071eac3: vinsertps xmm0, xmm0, dword ptr [rdi + rbx], 0x30
0x10071eaca: vmovss xmm6, dword ptr [rdi + r14 + 0xc]
0x10071ead1: vinsertps xmm6, xmm6, dword ptr [rdi + r15 + 0xc], 0x10
0x10071ead9: vinsertps xmm6, xmm6, dword ptr [rdi + r12 + 0xc], 0x20
0x10071eae1: vinsertps xmm6, xmm6, dword ptr [rdi + rbx + 0xc], 0x30
0x10071eae9: vpshufb xmm6, xmm6, xmm2
0x10071eaee: vpshufb xmm6, xmm6, xmm2
0x10071eaf3: vpshufd xmm7, xmm6, 0x4e
0x10071eaf8: vpmovsxbw xmm6, xmm6
0x10071eafd: vpmovsxbw xmm7, xmm7
0x10071eb02: vmulps xmm1, xmm15, xmm5
0x10071eb06: vmulps xmm2, xmm12, xmm11
0x10071eb0b: vaddps xmm1, xmm13, xmm1
0x10071eb0f: vaddps xmm1, xmm2, xmm1
0x10071eb13: vmulps xmm2, xmm8, xmm0
0x10071eb17: vaddps xmm1, xmm2, xmm1
0x10071eb1b: vpmovsxwd xmm2, xmm6
0x10071eb20: vpshufd xmm6, xmm6, 0x4e
0x10071eb25: vpmovsxwd xmm6, xmm6
0x10071eb2a: vpmovsxwd xmm7, xmm7
0x10071eb2f: vcvtdq2ps xmm2, xmm2
0x10071eb33: vcvtdq2ps xmm6, xmm6
0x10071eb37: vcvtdq2ps xmm7, xmm7
0x10071eb3b: vmulps xmm1, xmm1, xmmword ptr [rbp - 0x50]
0x10071eb40: vmulps xmm2, xmm2, xmm1
0x10071eb44: vsubps xmm0, xmm0, xmm2
0x10071eb48: vmulps xmm2, xmm6, xmm1
0x10071eb4c: vmulps xmm1, xmm7, xmm1
0x10071eb50: vsubps xmm2, xmm11, xmm2
0x10071eb54: vsubps xmm1, xmm5, xmm1
0x10071eb58: vmulps xmm5, xmm1, xmmword ptr [rbp - 0xc0]
0x10071eb60: vmulps xmm6, xmm1, xmmword ptr [rbp - 0xb0]
0x10071eb68: vmovaps xmm7, xmmword ptr [rbp - 0x40]
0x10071eb6d: vaddps xmm5, xmm7, xmm5
0x10071eb71: vmovaps xmm11, xmm3
0x10071eb75: vaddps xmm6, xmm3, xmm6
0x10071eb79: vmulps xmm7, xmm1, xmmword ptr [rbp - 0xa0]
0x10071eb81: vmulps xmm3, xmm2, xmmword ptr [rbp - 0x90]
0x10071eb89: vaddps xmm3, xmm3, xmm5
0x10071eb8d: vmulps xmm5, xmm2, xmmword ptr [rbp - 0x80]
0x10071eb92: vaddps xmm5, xmm5, xmm6
0x10071eb96: vmulps xmm6, xmm2, xmmword ptr [rbp - 0x70]
0x10071eb9b: vaddps xmm7, xmm7, xmmword ptr [rbp - 0xd0]
0x10071eba3: vaddps xmm6, xmm6, xmm7
0x10071eba7: vmovaps xmm7, xmmword ptr [rip + 0x388d61] ; 0x100aa7910
0x10071ebaf: vmulps xmm1, xmm15, xmm1
0x10071ebb3: vmulps xmm2, xmm12, xmm2
0x10071ebb7: vaddps xmm1, xmm13, xmm1
0x10071ebbb: vaddps xmm1, xmm2, xmm1
0x10071ebbf: vmulps xmm2, xmm0, xmmword ptr [rbp - 0x60]
0x10071ebc4: vaddps xmm2, xmm2, xmm3
0x10071ebc8: vmulps xmm3, xmm9, xmm0
0x10071ebcc: vaddps xmm3, xmm3, xmm5
0x10071ebd0: vmulps xmm5, xmm4, xmm0
0x10071ebd4: vmulps xmm0, xmm8, xmm0
0x10071ebd8: vaddps xmm5, xmm5, xmm6
0x10071ebdc: vaddps xmm0, xmm0, xmm1
0x10071ebe0: vrcpps xmm1, xmm0
0x10071ebe4: vmulps xmm6, xmm1, xmm0
0x10071ebe8: vsubps xmm6, xmm10, xmm6
0x10071ebec: vmulps xmm1, xmm1, xmm6
0x10071ebf0: vandps xmm6, xmm1, xmm7
0x10071ebf4: vmulps xmm2, xmm2, xmm6
0x10071ebf8: vmulps xmm3, xmm3, xmm6
0x10071ebfc: vmulps xmm1, xmm5, xmm1
0x10071ec00: vxorps xmm5, xmm5, xmm5
0x10071ec04: vcmpltps xmm0, xmm5, xmm0
0x10071ec09: vextractps dword ptr [rcx + r14], xmm2, 0
0x10071ec10: vandps xmm0, xmm0, xmm1
0x10071ec14: vextractps dword ptr [rcx + r14 + 4], xmm3, 0
0x10071ec1c: vmovss dword ptr [rcx + r14 + 8], xmm0
0x10071ec23: vextractps dword ptr [rcx + r15], xmm2, 1
0x10071ec2a: vextractps dword ptr [rcx + r15 + 4], xmm3, 1
0x10071ec32: vpextrd dword ptr [rcx + r15 + 8], xmm0, 1
0x10071ec3a: vextractps dword ptr [rcx + r12], xmm2, 2
0x10071ec41: vextractps dword ptr [rcx + r12 + 4], xmm3, 2
0x10071ec49: vpextrd dword ptr [rcx + r12 + 8], xmm0, 2
0x10071ec51: vextractps dword ptr [rcx + rbx], xmm2, 3
0x10071ec58: vmovdqa xmm2, xmmword ptr [rip + 0x3bac00] ; 0x100ad9860
0x10071ec60: vextractps dword ptr [rcx + rbx + 4], xmm3, 3
0x10071ec68: vpextrd dword ptr [rcx + rbx + 8], xmm0, 3
0x10071ec70: add r11d, 4
0x10071ec74: cmp r11d, r10d
0x10071ec77: jb 0x10071ea40
0x10071ec7d: cmp r9d, esi
0x10071ec80: jb 0x10071ea20
0x10071ec86: jmp 0x10071ec8b ; 0x10071ec8b
0x10071ec88: xor r11d, r11d
0x10071ec8b: lea eax, [r11 - 4]
0x10071ec8f: cmp eax, esi
0x10071ec91: vmovaps xmm15, xmmword ptr [rbp - 0x30]
0x10071ec96: jae 0x10071ee50
0x10071ec9c: mov eax, eax
0x10071ec9e: shl rax, 4
0x10071eca2: lea rdi, [rdi + rax + 0xe]
0x10071eca7: add rcx, rax
0x10071ecaa: add esi, 4
0x10071ecad: sub esi, r11d
0x10071ecb0: vmovss xmm10, dword ptr [rip + 0x386408] ; 0x100aa50c0
0x10071ecb8: vmovaps xmm8, xmmword ptr [rip + 0x388c50] ; 0x100aa7910
0x10071ecc0: vxorps xmm9, xmm9, xmm9
0x10071ecc5: nop word ptr cs:[rax + rax]
0x10071ecd0: movsx eax, byte ptr [rdi - 2]
0x10071ecd4: vxorps xmm12, xmm12, xmm12
0x10071ecd9: vcvtsi2ss xmm4, xmm12, eax
0x10071ecdd: movsx eax, byte ptr [rdi - 1]
0x10071ece1: vxorps xmm12, xmm12, xmm12
0x10071ece6: vcvtsi2ss xmm5, xmm12, eax
0x10071ecea: movsx eax, byte ptr [rdi]
0x10071eced: vxorps xmm12, xmm12, xmm12
0x10071ecf2: vcvtsi2ss xmm6, xmm12, eax
0x10071ecf6: vinsertps xmm4, xmm4, xmm5, 0x10
0x10071ecfc: vinsertps xmm1, xmm4, xmm6, 0x20
0x10071ed02: vmovaps xmm7, xmmword ptr [rdx]
0x10071ed06: vmovaps xmm6, xmmword ptr [rdx + 0x10]
0x10071ed0b: vmovaps xmm5, xmmword ptr [rdx + 0x20]
0x10071ed10: vmovaps xmm4, xmmword ptr [rdx + 0x30]
0x10071ed15: vshufps xmm2, xmm6, xmm7, 0x33
0x10071ed1a: vshufps xmm2, xmm2, xmm7, 0xe2
0x10071ed1f: vinsertps xmm2, xmm2, xmm5, 0xe8
0x10071ed25: vblendps xmm2, xmm2, xmm4, 8
0x10071ed2b: vmovaps xmm0, xmmword ptr [rdi - 0xe]
0x10071ed30: vinsertps xmm3, xmm0, xmm10, 0x30
0x10071ed36: vmulps xmm2, xmm2, xmm3
0x10071ed3a: vpermilpd xmm3, xmm2, 1
0x10071ed40: vaddps xmm2, xmm2, xmm3
0x10071ed44: vmovshdup xmm3, xmm2
0x10071ed48: vaddss xmm2, xmm2, xmm3
0x10071ed4c: vmulss xmm2, xmm15, xmm2
0x10071ed50: vpermilps xmm2, xmm2, 0xc0
0x10071ed56: vmulps xmm1, xmm1, xmm2
0x10071ed5a: vsubps xmm0, xmm0, xmm1
0x10071ed5e: vmulss xmm1, xmm7, xmm0
0x10071ed62: vmovshdup xmm2, xmm0
0x10071ed66: vmulss xmm3, xmm6, xmm2
0x10071ed6a: vaddss xmm12, xmm1, xmm3
0x10071ed6e: vpermilpd xmm3, xmm0, 1
0x10071ed74: vmulss xmm1, xmm5, xmm3
0x10071ed78: vaddss xmm1, xmm1, xmm12
0x10071ed7d: vaddss xmm12, xmm4, xmm1
0x10071ed81: vmovshdup xmm1, xmm7
0x10071ed85: vmulss xmm13, xmm1, xmm0
0x10071ed89: vmovshdup xmm1, xmm6
0x10071ed8d: vmulss xmm1, xmm1, xmm2
0x10071ed91: vaddss xmm13, xmm13, xmm1
0x10071ed95: vmovshdup xmm1, xmm5
0x10071ed99: vmulss xmm1, xmm1, xmm3
0x10071ed9d: vaddss xmm13, xmm1, xmm13
0x10071eda2: vmovshdup xmm1, xmm4
0x10071eda6: vaddss xmm13, xmm1, xmm13
0x10071edab: vpermilpd xmm1, xmm7, 1
0x10071edb1: vmulss xmm14, xmm1, xmm0
0x10071edb5: vpermilpd xmm1, xmm6, 1
0x10071edbb: vmulss xmm1, xmm1, xmm2
0x10071edbf: vaddss xmm14, xmm14, xmm1
0x10071edc3: vpermilpd xmm1, xmm5, 1
0x10071edc9: vmulss xmm1, xmm1, xmm3
0x10071edcd: vaddss xmm14, xmm1, xmm14
0x10071edd2: vpermilpd xmm1, xmm4, 1
0x10071edd8: vaddss xmm1, xmm1, xmm14
0x10071eddd: vpermilps xmm7, xmm7, 0xe7
0x10071ede3: vmulss xmm0, xmm7, xmm0
0x10071ede7: vpermilps xmm6, xmm6, 0xe7
0x10071eded: vmulss xmm2, xmm6, xmm2
0x10071edf1: vaddss xmm0, xmm0, xmm2
0x10071edf5: vpermilps xmm2, xmm5, 0xe7
0x10071edfb: vmulss xmm2, xmm2, xmm3
0x10071edff: vaddss xmm0, xmm2, xmm0
0x10071ee03: vpermilps xmm2, xmm4, 0xe7
0x10071ee09: vaddss xmm0, xmm2, xmm0
0x10071ee0d: vinsertps xmm2, xmm12, xmm13, 0x10
0x10071ee13: vinsertps xmm1, xmm2, xmm1, 0x20
0x10071ee19: vdivss xmm2, xmm10, xmm0
0x10071ee1d: vandps xmm2, xmm2, xmm8
0x10071ee22: vpshufd xmm2, xmm2, 0xc0
0x10071ee27: vmulps xmm4, xmm1, xmm2
0x10071ee2b: vucomiss xmm0, xmm9
0x10071ee30: ja 0x10071ee38
0x10071ee32: vinsertps xmm4, xmm4, xmm11, 0xf4
0x10071ee38: vmovaps xmmword ptr [rcx], xmm4
0x10071ee3c: add rdi, 0x10
0x10071ee40: add rcx, 0x10
0x10071ee44: vmovaps xmm11, xmm4
0x10071ee48: dec esi
0x10071ee4a: jne 0x10071ecd0
0x10071ee50: add rsp, 0x30
0x10071ee54: pop rbx
0x10071ee55: pop r12
0x10071ee57: pop r14
0x10071ee59: pop r15
0x10071ee5b: pop rbp
0x10071ee5c: ret 
0x10071ee5d: nop dword ptr [rax]
