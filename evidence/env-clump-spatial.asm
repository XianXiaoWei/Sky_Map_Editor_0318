0x10031a6f0: push rbp
0x10031a6f1: mov rbp, rsp
0x10031a6f4: push r15
0x10031a6f6: push r14
0x10031a6f8: push r13
0x10031a6fa: push r12
0x10031a6fc: push rbx
0x10031a6fd: sub rsp, 0xc8
0x10031a704: mov r15, rsi
0x10031a707: mov r12, rdi
0x10031a70a: mov rax, qword ptr [r12]
0x10031a70e: mov qword ptr [rcx], rax
0x10031a711: vmovss xmm1, dword ptr [r12 + 0x2c]
0x10031a718: vxorps xmm0, xmm0, xmm0
0x10031a71c: vucomiss xmm1, xmm0
0x10031a720: jbe 0x10031ac56
0x10031a726: mov rax, qword ptr [r12 + 8]
0x10031a72b: test rax, rax
0x10031a72e: mov qword ptr [rbp - 0x48], rdx
0x10031a732: je 0x10031a9f4
0x10031a738: cmp dword ptr [rax + 0x10], 0
0x10031a73c: je 0x10031ac3d
0x10031a742: xor r13d, r13d
0x10031a745: vxorps xmm0, xmm0, xmm0
0x10031a749: vmovss dword ptr [rbp - 0x2c], xmm0
0x10031a74e: nop 
0x10031a750: mov rax, qword ptr [rax + 8]
0x10031a754: mov ecx, r13d
0x10031a757: mov rax, qword ptr [rax + rcx*8]
0x10031a75b: mov qword ptr [rbp - 0x50], rax
0x10031a75f: call 0x1007abc10 ; 0x1007abc10
0x10031a764: mov r14, rax
0x10031a767: mov qword ptr [rbp - 0x40], 0
0x10031a76f: call 0x10043ccc0 ; 0x10043ccc0
0x10031a774: mov rbx, qword ptr [rax]
0x10031a777: mov rdi, rax
0x10031a77a: lea rsi, [rbp - 0x40]
0x10031a77e: lea rdx, [rbp - 0x50]
0x10031a782: mov rcx, r14
0x10031a785: call qword ptr [rbx + 0x40]
0x10031a788: mov rsi, qword ptr [rbp - 0x40]
0x10031a78c: test rsi, rsi
0x10031a78f: je 0x10031ac6c
0x10031a795: vmovapd xmm0, xmmword ptr [rsi + 0x30]
0x10031a79a: vpermilpd xmm1, xmm0, 1
0x10031a7a0: vmaxss xmm2, xmm1, xmm0
0x10031a7a4: vcmpunordss xmm3, xmm0, xmm0
0x10031a7a9: vblendvps xmm1, xmm2, xmm1, xmm3
0x10031a7af: vmovshdup xmm2, xmm0
0x10031a7b3: vcmpunordss xmm3, xmm1, xmm1
0x10031a7b8: vmaxss xmm1, xmm2, xmm1
0x10031a7bc: vblendvps xmm1, xmm1, xmm2, xmm3
0x10031a7c2: vmulss xmm1, xmm1, dword ptr [rip + 0x7a1712] ; 0x100abbedc
0x10031a7ca: vaddss xmm2, xmm1, dword ptr [r12 + 0x18]
0x10031a7d1: vmovaps xmm8, xmmword ptr [r15]
0x10031a7d6: vsubps xmm3, xmm8, xmmword ptr [rsi + 0x10]
0x10031a7db: vmulps xmm3, xmm3, xmm3
0x10031a7df: vmovshdup xmm4, xmm3
0x10031a7e3: vaddss xmm4, xmm3, xmm4
0x10031a7e7: vpermilpd xmm3, xmm3, 1
0x10031a7ed: vaddss xmm3, xmm3, xmm4
0x10031a7f1: vmulss xmm2, xmm2, xmm2
0x10031a7f5: vucomiss xmm3, xmm2
0x10031a7f9: ja 0x10031a9dd
0x10031a7ff: vmovaps xmm2, xmmword ptr [rsi + 0x20]
0x10031a804: vmovshdup xmm3, xmm2
0x10031a808: vpermilpd xmm4, xmm2, 1
0x10031a80e: vpermilps xmm5, xmm2, 0xe7
0x10031a814: vaddss xmm6, xmm2, xmm2
0x10031a818: vaddss xmm7, xmm3, xmm3
0x10031a81c: vaddss xmm1, xmm4, xmm4
0x10031a820: vmulss xmm9, xmm2, xmm6
0x10031a824: vmulss xmm10, xmm2, xmm7
0x10031a828: vmulss xmm13, xmm2, xmm1
0x10031a82c: vmulss xmm14, xmm5, xmm6
0x10031a830: vmulss xmm11, xmm3, xmm7
0x10031a834: vmulss xmm3, xmm3, xmm1
0x10031a838: vmulss xmm7, xmm5, xmm7
0x10031a83c: vmulss xmm4, xmm4, xmm1
0x10031a840: vmulss xmm1, xmm5, xmm1
0x10031a844: vmovss xmm2, dword ptr [rip + 0x78a874] ; 0x100aa50c0
0x10031a84c: vmovaps xmm15, xmm2
0x10031a850: vsubss xmm5, xmm15, xmm11
0x10031a855: vsubss xmm5, xmm5, xmm4
0x10031a859: vaddss xmm2, xmm10, xmm1
0x10031a85d: vsubss xmm6, xmm13, xmm7
0x10031a861: vinsertps xmm2, xmm5, xmm2, 0x10
0x10031a867: vinsertps xmm12, xmm2, xmm6, 0x20
0x10031a86d: vsubss xmm1, xmm10, xmm1
0x10031a871: vsubss xmm2, xmm15, xmm9
0x10031a876: vsubss xmm4, xmm2, xmm4
0x10031a87a: vaddss xmm5, xmm3, xmm14
0x10031a87f: vinsertps xmm1, xmm1, xmm4, 0x10
0x10031a885: vinsertps xmm1, xmm1, xmm5, 0x20
0x10031a88b: vaddss xmm5, xmm13, xmm7
0x10031a88f: vsubss xmm3, xmm3, xmm14
0x10031a894: vsubss xmm4, xmm2, xmm11
0x10031a899: vinsertps xmm5, xmm5, xmm3, 0x10
0x10031a89f: vmulps xmm2, xmm12, xmm12
0x10031a8a4: vmovshdup xmm3, xmm2
0x10031a8a8: vaddss xmm3, xmm2, xmm3
0x10031a8ac: vpermilpd xmm2, xmm2, 1
0x10031a8b2: vaddss xmm2, xmm2, xmm3
0x10031a8b6: vsqrtss xmm6, xmm2, xmm2
0x10031a8ba: vucomiss xmm6, dword ptr [rip + 0x78d002] ; 0x100aa78c4
0x10031a8c2: jbe 0x10031a8ce
0x10031a8c4: vpermilps xmm2, xmm6, 0xc0
0x10031a8ca: vdivps xmm12, xmm12, xmm2
0x10031a8ce: vinsertps xmm4, xmm5, xmm4, 0x20
0x10031a8d4: vmulps xmm2, xmm1, xmm1
0x10031a8d8: vmovshdup xmm3, xmm2
0x10031a8dc: vaddss xmm3, xmm2, xmm3
0x10031a8e0: vpermilpd xmm2, xmm2, 1
0x10031a8e6: vaddss xmm2, xmm2, xmm3
0x10031a8ea: vsqrtss xmm5, xmm2, xmm2
0x10031a8ee: vucomiss xmm5, dword ptr [rip + 0x78cfce] ; 0x100aa78c4
0x10031a8f6: jbe 0x10031a902
0x10031a8f8: vpermilps xmm2, xmm5, 0xc0
0x10031a8fe: vdivps xmm1, xmm1, xmm2
0x10031a902: add rsi, 0x10
0x10031a906: vmulps xmm2, xmm4, xmm4
0x10031a90a: vmovshdup xmm3, xmm2
0x10031a90e: vaddss xmm3, xmm2, xmm3
0x10031a912: vpermilpd xmm2, xmm2, 1
0x10031a918: vaddss xmm2, xmm2, xmm3
0x10031a91c: vsqrtss xmm5, xmm2, xmm2
0x10031a920: vucomiss xmm5, dword ptr [rip + 0x78cf9c] ; 0x100aa78c4
0x10031a928: jbe 0x10031a934
0x10031a92a: vpermilps xmm2, xmm5, 0xc0
0x10031a930: vdivps xmm4, xmm4, xmm2
0x10031a934: vmovaps xmmword ptr [rbp - 0x90], xmm8
0x10031a93c: vmovaps xmmword ptr [rbp - 0xf0], xmm12
0x10031a944: vmovaps xmmword ptr [rbp - 0xe0], xmm1
0x10031a94c: vmovaps xmmword ptr [rbp - 0xd0], xmm4
0x10031a954: vmulps xmm0, xmm0, xmmword ptr [rip + 0x78cd14] ; 0x100aa7670
0x10031a95c: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x10031a961: lea rdi, [rbp - 0x90]
0x10031a968: vmovss xmm0, dword ptr [rip + 0x78cf54] ; 0x100aa78c4
0x10031a970: lea rdx, [rbp - 0xf0]
0x10031a977: lea rcx, [rbp - 0x80]
0x10031a97b: lea r8, [rbp - 0x40]
0x10031a97f: call 0x10078d0e0 ; 0x10078d0e0
0x10031a984: vmovss xmm0, dword ptr [rip + 0x78a734] ; 0x100aa50c0
0x10031a98c: test al, al
0x10031a98e: jne 0x10031a9cf
0x10031a990: vmovaps xmm0, xmmword ptr [r15]
0x10031a995: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x40]
0x10031a99a: vmulps xmm0, xmm0, xmm0
0x10031a99e: vmovshdup xmm1, xmm0
0x10031a9a2: vaddss xmm1, xmm0, xmm1
0x10031a9a6: vpermilpd xmm0, xmm0, 1
0x10031a9ac: vaddss xmm0, xmm0, xmm1
0x10031a9b0: vsqrtss xmm0, xmm0, xmm0
0x10031a9b4: vdivss xmm0, xmm0, dword ptr [r12 + 0x18]
0x10031a9bb: vmovss xmm1, dword ptr [rip + 0x78a6fd] ; 0x100aa50c0
0x10031a9c3: vsubss xmm0, xmm1, xmm0
0x10031a9c7: vxorps xmm1, xmm1, xmm1
0x10031a9cb: vmaxss xmm0, xmm1, xmm0
0x10031a9cf: vmovss xmm1, dword ptr [rbp - 0x2c]
0x10031a9d4: vmaxss xmm1, xmm1, xmm0
0x10031a9d8: vmovss dword ptr [rbp - 0x2c], xmm1
0x10031a9dd: inc r13d
0x10031a9e0: mov rax, qword ptr [r12 + 8]
0x10031a9e5: cmp r13d, dword ptr [rax + 0x10]
0x10031a9e9: jb 0x10031a750
0x10031a9ef: jmp 0x10031ac46 ; 0x10031ac46
0x10031a9f4: mov rsi, qword ptr [r12 + 0x10]
0x10031a9f9: vxorps xmm0, xmm0, xmm0
0x10031a9fd: vmovss dword ptr [rbp - 0x2c], xmm0
0x10031aa02: test rsi, rsi
0x10031aa05: je 0x10031ac46
0x10031aa0b: vmovapd xmm0, xmmword ptr [rsi + 0x80]
0x10031aa13: vpermilpd xmm1, xmm0, 1
0x10031aa19: vmaxss xmm2, xmm1, xmm0
0x10031aa1d: vcmpunordss xmm3, xmm0, xmm0
0x10031aa22: vblendvps xmm1, xmm2, xmm1, xmm3
0x10031aa28: vmovshdup xmm2, xmm0
0x10031aa2c: vcmpunordss xmm3, xmm1, xmm1
0x10031aa31: vmaxss xmm1, xmm2, xmm1
0x10031aa35: vblendvps xmm1, xmm1, xmm2, xmm3
0x10031aa3b: vmulss xmm1, xmm1, dword ptr [rip + 0x7a1499] ; 0x100abbedc
0x10031aa43: vaddss xmm2, xmm1, dword ptr [r12 + 0x18]
0x10031aa4a: vmovaps xmm8, xmmword ptr [r15]
0x10031aa4f: vsubps xmm3, xmm8, xmmword ptr [rsi + 0x60]
0x10031aa54: vmulps xmm3, xmm3, xmm3
0x10031aa58: vmovshdup xmm4, xmm3
0x10031aa5c: vaddss xmm4, xmm3, xmm4
0x10031aa60: vpermilpd xmm3, xmm3, 1
0x10031aa66: vaddss xmm3, xmm3, xmm4
0x10031aa6a: vmulss xmm2, xmm2, xmm2
0x10031aa6e: vucomiss xmm2, xmm3
0x10031aa72: jb 0x10031ac46
0x10031aa78: vmovaps xmm2, xmmword ptr [rsi + 0x70]
0x10031aa7d: vmovshdup xmm3, xmm2
0x10031aa81: vpermilpd xmm4, xmm2, 1
0x10031aa87: vpermilps xmm5, xmm2, 0xe7
0x10031aa8d: vaddss xmm6, xmm2, xmm2
0x10031aa91: vaddss xmm7, xmm3, xmm3
0x10031aa95: vaddss xmm1, xmm4, xmm4
0x10031aa99: vmulss xmm9, xmm2, xmm6
0x10031aa9d: vmulss xmm10, xmm2, xmm7
0x10031aaa1: vmulss xmm13, xmm2, xmm1
0x10031aaa5: vmulss xmm14, xmm5, xmm6
0x10031aaa9: vmulss xmm11, xmm3, xmm7
0x10031aaad: vmulss xmm3, xmm3, xmm1
0x10031aab1: vmulss xmm7, xmm5, xmm7
0x10031aab5: vmulss xmm4, xmm4, xmm1
0x10031aab9: vmulss xmm1, xmm5, xmm1
0x10031aabd: vmovss xmm15, dword ptr [rip + 0x78a5fb] ; 0x100aa50c0
0x10031aac5: vsubss xmm5, xmm15, xmm11
0x10031aaca: vsubss xmm5, xmm5, xmm4
0x10031aace: vaddss xmm2, xmm10, xmm1
0x10031aad2: vsubss xmm6, xmm13, xmm7
0x10031aad6: vinsertps xmm2, xmm5, xmm2, 0x10
0x10031aadc: vinsertps xmm12, xmm2, xmm6, 0x20
0x10031aae2: vsubss xmm1, xmm10, xmm1
0x10031aae6: vmovss dword ptr [rbp - 0x2c], xmm15
0x10031aaeb: vsubss xmm2, xmm15, xmm9
0x10031aaf0: vsubss xmm4, xmm2, xmm4
0x10031aaf4: vaddss xmm5, xmm3, xmm14
0x10031aaf9: vinsertps xmm1, xmm1, xmm4, 0x10
0x10031aaff: vinsertps xmm1, xmm1, xmm5, 0x20
0x10031ab05: vaddss xmm5, xmm13, xmm7
0x10031ab09: vsubss xmm3, xmm3, xmm14
0x10031ab0e: vsubss xmm4, xmm2, xmm11
0x10031ab13: vinsertps xmm5, xmm5, xmm3, 0x10
0x10031ab19: vmulps xmm2, xmm12, xmm12
0x10031ab1e: vmovshdup xmm3, xmm2
0x10031ab22: vaddss xmm3, xmm2, xmm3
0x10031ab26: vpermilpd xmm2, xmm2, 1
0x10031ab2c: vaddss xmm2, xmm2, xmm3
0x10031ab30: vsqrtss xmm6, xmm2, xmm2
0x10031ab34: vucomiss xmm6, dword ptr [rip + 0x78cd88] ; 0x100aa78c4
0x10031ab3c: jbe 0x10031ab48
0x10031ab3e: vpermilps xmm2, xmm6, 0xc0
0x10031ab44: vdivps xmm12, xmm12, xmm2
0x10031ab48: vinsertps xmm4, xmm5, xmm4, 0x20
0x10031ab4e: vmulps xmm2, xmm1, xmm1
0x10031ab52: vmovshdup xmm3, xmm2
0x10031ab56: vaddss xmm3, xmm2, xmm3
0x10031ab5a: vpermilpd xmm2, xmm2, 1
0x10031ab60: vaddss xmm2, xmm2, xmm3
0x10031ab64: vsqrtss xmm5, xmm2, xmm2
0x10031ab68: vucomiss xmm5, dword ptr [rip + 0x78cd54] ; 0x100aa78c4
0x10031ab70: jbe 0x10031ab7c
0x10031ab72: vpermilps xmm2, xmm5, 0xc0
0x10031ab78: vdivps xmm1, xmm1, xmm2
0x10031ab7c: add rsi, 0x60
0x10031ab80: vmulps xmm2, xmm4, xmm4
0x10031ab84: vmovshdup xmm3, xmm2
0x10031ab88: vaddss xmm3, xmm2, xmm3
0x10031ab8c: vpermilpd xmm2, xmm2, 1
0x10031ab92: vaddss xmm2, xmm2, xmm3
0x10031ab96: vsqrtss xmm5, xmm2, xmm2
0x10031ab9a: vucomiss xmm5, dword ptr [rip + 0x78cd22] ; 0x100aa78c4
0x10031aba2: jbe 0x10031abae
0x10031aba4: vpermilps xmm2, xmm5, 0xc0
0x10031abaa: vdivps xmm4, xmm4, xmm2
0x10031abae: vmovaps xmmword ptr [rbp - 0x70], xmm8
0x10031abb3: vmovaps xmmword ptr [rbp - 0xc0], xmm12
0x10031abbb: vmovaps xmmword ptr [rbp - 0xb0], xmm1
0x10031abc3: vmovaps xmmword ptr [rbp - 0xa0], xmm4
0x10031abcb: vmulps xmm0, xmm0, xmmword ptr [rip + 0x78ca9d] ; 0x100aa7670
0x10031abd3: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x10031abd8: lea rdi, [rbp - 0x70]
0x10031abdc: vmovss xmm0, dword ptr [rip + 0x78cce0] ; 0x100aa78c4
0x10031abe4: lea rdx, [rbp - 0xc0]
0x10031abeb: lea rcx, [rbp - 0x60]
0x10031abef: lea r8, [rbp - 0x40]
0x10031abf3: call 0x10078d0e0 ; 0x10078d0e0
0x10031abf8: test al, al
0x10031abfa: jne 0x10031ac46
0x10031abfc: vmovaps xmm0, xmmword ptr [r15]
0x10031ac01: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x40]
0x10031ac06: vmulps xmm0, xmm0, xmm0
0x10031ac0a: vmovshdup xmm1, xmm0
0x10031ac0e: vaddss xmm1, xmm0, xmm1
0x10031ac12: vpermilpd xmm0, xmm0, 1
0x10031ac18: vaddss xmm0, xmm0, xmm1
0x10031ac1c: vsqrtss xmm0, xmm0, xmm0
0x10031ac20: vdivss xmm0, xmm0, dword ptr [r12 + 0x18]
0x10031ac27: vmovss xmm1, dword ptr [rip + 0x78a491] ; 0x100aa50c0
0x10031ac2f: vsubss xmm0, xmm1, xmm0
0x10031ac33: vxorps xmm1, xmm1, xmm1
0x10031ac37: vmaxss xmm0, xmm1, xmm0
0x10031ac3b: jmp 0x10031ac41 ; 0x10031ac41
0x10031ac3d: vxorps xmm0, xmm0, xmm0
0x10031ac41: vmovss dword ptr [rbp - 0x2c], xmm0
0x10031ac46: vmovss xmm0, dword ptr [rbp - 0x2c]
0x10031ac4b: vmulss xmm0, xmm0, dword ptr [r12 + 0x2c]
0x10031ac52: mov rdx, qword ptr [rbp - 0x48]
0x10031ac56: vmovss dword ptr [rdx], xmm0
0x10031ac5a: add rsp, 0xc8
0x10031ac61: pop rbx
0x10031ac62: pop r12
0x10031ac64: pop r13
0x10031ac66: pop r14
0x10031ac68: pop r15
0x10031ac6a: pop rbp
0x10031ac6b: ret 
0x10031ac6c: lea rdi, [rip + 0x846e85] ; 0x100b61af8 ret
0x10031ac73: lea rsi, [rip + 0x846ce9] ; 0x100b61963 ./Clump.h
0x10031ac7a: mov edx, 0x47
0x10031ac7f: mov ecx, 3
0x10031ac84: call 0x1007e5f70 ; 0x1007e5f70
0x10031ac89: ud2 
0x10031ac8b: nop dword ptr [rax + rax]
