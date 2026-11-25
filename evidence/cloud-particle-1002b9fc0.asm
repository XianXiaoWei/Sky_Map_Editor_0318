0x1002b9fc0: push rbp
0x1002b9fc1: mov rbp, rsp
0x1002b9fc4: push r15
0x1002b9fc6: push r14
0x1002b9fc8: push r13
0x1002b9fca: push r12
0x1002b9fcc: push rbx
0x1002b9fcd: sub rsp, 0xa8
0x1002b9fd4: mov dword ptr [rbp - 0x2c], r8d
0x1002b9fd8: mov qword ptr [rbp - 0x58], rdx
0x1002b9fdc: mov qword ptr [rbp - 0x38], rsi
0x1002b9fe0: mov r13, rdi
0x1002b9fe3: cmp byte ptr [r13 + 0x1390], 0
0x1002b9feb: je 0x1002ba27e
0x1002b9ff1: vmovaps xmm5, xmmword ptr [rcx]
0x1002b9ff5: vmulps xmm1, xmm5, xmm5
0x1002b9ff9: vmovshdup xmm2, xmm1
0x1002b9ffd: vaddss xmm2, xmm1, xmm2
0x1002ba001: vpermilpd xmm1, xmm1, 1
0x1002ba007: vaddss xmm1, xmm1, xmm2
0x1002ba00b: vsqrtss xmm1, xmm1, xmm1
0x1002ba00f: vandps xmm2, xmm1, xmmword ptr [rip + 0x7ed8f9] ; 0x100aa7910
0x1002ba017: vmovss xmm1, dword ptr [rip + 0x7ed8a5] ; 0x100aa78c4
0x1002ba01f: vucomiss xmm1, xmm2
0x1002ba023: jae 0x1002ba290
0x1002ba029: vmovaps xmm2, xmmword ptr [rip + 0x7ee9ff] ; 0x100aa8a30
0x1002ba031: vsubps xmm3, xmm2, xmm5
0x1002ba035: vmulps xmm3, xmm3, xmm3
0x1002ba039: vmovshdup xmm4, xmm3
0x1002ba03d: vaddss xmm4, xmm3, xmm4
0x1002ba041: vpermilpd xmm3, xmm3, 1
0x1002ba047: vaddss xmm3, xmm3, xmm4
0x1002ba04b: vsqrtss xmm3, xmm3, xmm3
0x1002ba04f: vandps xmm3, xmm3, xmmword ptr [rip + 0x7ed8b9] ; 0x100aa7910
0x1002ba057: vucomiss xmm1, xmm3
0x1002ba05b: vmovss xmm3, dword ptr [rip + 0x7eb05d] ; 0x100aa50c0
0x1002ba063: jae 0x1002ba069
0x1002ba065: vmovaps xmm3, xmm2
0x1002ba069: vpermilps xmm2, xmm3, 0xd2
0x1002ba06f: vmulps xmm2, xmm5, xmm2
0x1002ba073: vpermilps xmm4, xmm5, 0xd2
0x1002ba079: vmulps xmm3, xmm4, xmm3
0x1002ba07d: vsubps xmm3, xmm2, xmm3
0x1002ba081: vpermilps xmm2, xmm3, 0xd2
0x1002ba087: vmulps xmm3, xmm3, xmm3
0x1002ba08b: vpermilpd xmm4, xmm3, 1
0x1002ba091: vaddss xmm4, xmm4, xmm3
0x1002ba095: vmovshdup xmm3, xmm3
0x1002ba099: vaddss xmm3, xmm3, xmm4
0x1002ba09d: vsqrtss xmm3, xmm3, xmm3
0x1002ba0a1: mov r15, rcx
0x1002ba0a4: vucomiss xmm3, xmm1
0x1002ba0a8: jbe 0x1002ba0b4
0x1002ba0aa: vpermilps xmm1, xmm3, 0xc0
0x1002ba0b0: vdivps xmm2, xmm2, xmm1
0x1002ba0b4: vpermilps xmm0, xmm0, 0xc0
0x1002ba0ba: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x1002ba0c2: vmulps xmm0, xmm0, xmm2
0x1002ba0c6: mov rax, qword ptr [rbp - 0x38]
0x1002ba0ca: vmovaps xmm1, xmmword ptr [rax]
0x1002ba0ce: vmovaps xmmword ptr [rbp - 0x50], xmm1
0x1002ba0d3: vaddps xmm0, xmm1, xmm0
0x1002ba0d7: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1002ba0dc: vpermilps xmm0, xmm2, 0xc0
0x1002ba0e2: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x1002ba0ea: vpermilps xmm0, xmm2, 0xd5
0x1002ba0f0: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x1002ba0f8: vpermilps xmm0, xmm2, 0xea
0x1002ba0fe: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x1002ba106: vxorps xmm0, xmm0, xmm0
0x1002ba10a: mov r12b, 1
0x1002ba10d: mov r14d, 0xf
0x1002ba113: vmovaps xmmword ptr [rbp - 0x70], xmm5
0x1002ba118: jmp 0x1002ba147 ; 0x1002ba147
0x1002ba11a: nop word ptr [rax + rax]
0x1002ba120: vmovaps xmm0, xmmword ptr [r15]
0x1002ba125: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1002ba12a: mov rax, qword ptr [rbp - 0x38]
0x1002ba12e: vmovaps xmm0, xmmword ptr [rax]
0x1002ba132: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1002ba137: movzx r12d, byte ptr [r13 + 0x1390]
0x1002ba13f: dec r14d
0x1002ba142: vmovss xmm0, dword ptr [rbp - 0x30]
0x1002ba147: vaddss xmm0, xmm0, dword ptr [rip + 0x7fe9c1] ; 0x100ab8b10
0x1002ba14f: vmovss dword ptr [rbp - 0x30], xmm0
0x1002ba154: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x1002ba159: vmovshdup xmm12, xmm0
0x1002ba15d: vmovaps xmm1, xmmword ptr [rbp - 0x70]
0x1002ba162: vmovshdup xmm2, xmm1
0x1002ba166: vpermilpd xmm3, xmm1, 1
0x1002ba16c: vmulss xmm4, xmm1, xmm2
0x1002ba170: vmulss xmm8, xmm3, xmm1
0x1002ba174: vmovss xmm5, dword ptr [rip + 0x7eaf44] ; 0x100aa50c0
0x1002ba17c: vsubss xmm6, xmm5, xmm12
0x1002ba181: vmulss xmm7, xmm1, xmm1
0x1002ba185: vmulss xmm7, xmm6, xmm7
0x1002ba189: vaddss xmm9, xmm12, xmm7
0x1002ba18d: vmulss xmm4, xmm6, xmm4
0x1002ba191: vmulss xmm5, xmm0, xmm3
0x1002ba195: vaddss xmm10, xmm5, xmm4
0x1002ba199: vmulss xmm8, xmm6, xmm8
0x1002ba19e: vmulss xmm11, xmm0, xmm2
0x1002ba1a2: vinsertps xmm9, xmm9, xmm10, 0x10
0x1002ba1a8: vsubss xmm7, xmm8, xmm11
0x1002ba1ad: vinsertps xmm7, xmm9, xmm7, 0x20
0x1002ba1b3: vsubss xmm4, xmm4, xmm5
0x1002ba1b7: vmulss xmm0, xmm0, xmm1
0x1002ba1bb: vmulss xmm5, xmm2, xmm3
0x1002ba1bf: vmulss xmm2, xmm2, xmm2
0x1002ba1c3: vmulss xmm2, xmm6, xmm2
0x1002ba1c7: vaddss xmm2, xmm12, xmm2
0x1002ba1cb: vmulss xmm5, xmm6, xmm5
0x1002ba1cf: vinsertps xmm2, xmm4, xmm2, 0x10
0x1002ba1d5: vaddss xmm4, xmm0, xmm5
0x1002ba1d9: vinsertps xmm2, xmm2, xmm4, 0x20
0x1002ba1df: vmulps xmm4, xmm7, xmmword ptr [rbp - 0xb0]
0x1002ba1e7: vmulps xmm2, xmm2, xmmword ptr [rbp - 0xa0]
0x1002ba1ef: vaddps xmm2, xmm2, xmm4
0x1002ba1f3: vaddss xmm4, xmm11, xmm8
0x1002ba1f8: vsubss xmm0, xmm5, xmm0
0x1002ba1fc: vmulss xmm3, xmm3, xmm3
0x1002ba200: vmulss xmm3, xmm6, xmm3
0x1002ba204: vaddss xmm1, xmm12, xmm3
0x1002ba208: vinsertps xmm0, xmm4, xmm0, 0x10
0x1002ba20e: vinsertps xmm0, xmm0, xmm1, 0x20
0x1002ba214: vmulps xmm0, xmm0, xmmword ptr [rbp - 0x90]
0x1002ba21c: vaddps xmm0, xmm0, xmm2
0x1002ba220: vmulps xmm0, xmm0, xmmword ptr [rbp - 0xc0]
0x1002ba228: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x50]
0x1002ba22d: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x1002ba235: test r12b, r12b
0x1002ba238: je 0x1002ba270
0x1002ba23a: mov rdi, r13
0x1002ba23d: lea rsi, [rbp - 0x80]
0x1002ba241: mov r12, qword ptr [rbp - 0x58]
0x1002ba245: mov rdx, r12
0x1002ba248: mov ebx, dword ptr [rbp - 0x2c]
0x1002ba24b: mov ecx, ebx
0x1002ba24d: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1002ba252: call 0x1002b9df0 ; 0x1002b9df0
0x1002ba257: mov rdi, r13
0x1002ba25a: lea rsi, [rbp - 0xd0]
0x1002ba261: mov rdx, r12
0x1002ba264: mov ecx, ebx
0x1002ba266: call 0x1002b9df0 ; 0x1002b9df0
0x1002ba26b: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1002ba270: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1002ba275: test r14d, r14d
0x1002ba278: jne 0x1002ba120
0x1002ba27e: add rsp, 0xa8
0x1002ba285: pop rbx
0x1002ba286: pop r12
0x1002ba288: pop r13
0x1002ba28a: pop r14
0x1002ba28c: pop r15
0x1002ba28e: pop rbp
0x1002ba28f: ret 
0x1002ba290: lea rdi, [rip + 0x8c4adb] ; 0x100b7ed72 Math::IsCloseAbs( length( normal ), 0.0f ) == false
0x1002ba297: lea rsi, [rip + 0x8c4a55] ; 0x100b7ecf3 DebugLines.cpp
0x1002ba29e: lea r8, [rip + 0x8c4b01] ; 0x100b7eda6 Normal can not be a zero vector!
0x1002ba2a5: mov edx, 0xac
0x1002ba2aa: mov ecx, 4
0x1002ba2af: xor eax, eax
0x1002ba2b1: call 0x1007e6030 ; 0x1007e6030
0x1002ba2b6: ud2 
0x1002ba2b8: nop dword ptr [rax + rax]
