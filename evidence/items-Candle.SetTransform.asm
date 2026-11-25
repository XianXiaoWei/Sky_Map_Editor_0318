0x1001eaf00: push rbp
0x1001eaf01: mov rbp, rsp
0x1001eaf04: push r15
0x1001eaf06: push r14
0x1001eaf08: push r12
0x1001eaf0a: push rbx
0x1001eaf0b: sub rsp, 0x80
0x1001eaf12: mov r14, rsi
0x1001eaf15: mov rbx, rdi
0x1001eaf18: cmp byte ptr [rbx + 0x54a], 1
0x1001eaf1f: je 0x1001eb0d3
0x1001eaf25: vmovaps xmm0, xmmword ptr [r14]
0x1001eaf2a: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x1001eaf2f: vmovaps xmm0, xmmword ptr [r14 + 0x10]
0x1001eaf35: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x1001eaf3a: vmovaps xmm0, xmmword ptr [r14 + 0x20]
0x1001eaf40: vmovaps xmmword ptr [rbx + 0x50], xmm0
0x1001eaf45: vmovaps xmm0, xmmword ptr [r14 + 0x30]
0x1001eaf4b: vmovaps xmmword ptr [rbx + 0x60], xmm0
0x1001eaf50: cmp byte ptr [rip + 0xaa53e9], 0 ; 0x100c90340
0x1001eaf57: je 0x1001eafa6
0x1001eaf59: cmp byte ptr [rbx + 0x568], 0
0x1001eaf60: je 0x1001eafa6
0x1001eaf62: mov rax, qword ptr [rbx + 0x18]
0x1001eaf66: vmovaps xmm0, xmmword ptr [rax + 0x40]
0x1001eaf6b: vpermilps xmm1, xmm0, 0xff
0x1001eaf71: vbroadcastss xmm2, dword ptr [rip + 0xaa53ca] ; 0x100c90344
0x1001eaf7a: vmulps xmm1, xmm1, xmm2
0x1001eaf7e: vmulps xmm3, xmm1, xmmword ptr [rip + 0x8c499a] ; 0x100aaf920
0x1001eaf86: vxorps xmm4, xmm4, xmm4
0x1001eaf8a: vblendps xmm1, xmm4, xmm3, 1
0x1001eaf90: vblendps xmm2, xmm4, xmm3, 2
0x1001eaf96: vblendpd xmm3, xmm3, xmm4, 1
0x1001eaf9c: vsubps xmm0, xmm0, xmmword ptr [rip + 0x8bda6c] ; 0x100aa8a10
0x1001eafa4: jmp 0x1001eafe0 ; 0x1001eafe0
0x1001eafa6: mov rax, qword ptr [rbx + 0x18]
0x1001eafaa: vmovaps xmm0, xmmword ptr [rax + 0x40]
0x1001eafaf: vpermilps xmm1, xmm0, 0xff
0x1001eafb5: vbroadcastss xmm2, dword ptr [rip + 0xaa5386] ; 0x100c90344
0x1001eafbe: vmulps xmm1, xmm1, xmm2
0x1001eafc2: vmulps xmm3, xmm1, xmmword ptr [rip + 0x8bd0c6] ; 0x100aa8090
0x1001eafca: vxorps xmm4, xmm4, xmm4
0x1001eafce: vblendps xmm1, xmm4, xmm3, 1
0x1001eafd4: vblendps xmm2, xmm4, xmm3, 2
0x1001eafda: vblendpd xmm3, xmm3, xmm4, 1
0x1001eafe0: vxorps xmm4, xmm4, xmm4
0x1001eafe4: vblendps xmm1, xmm1, xmm4, 8
0x1001eafea: vmovaps xmmword ptr [rbp - 0xa0], xmm1
0x1001eaff2: vblendps xmm1, xmm2, xmm4, 8
0x1001eaff8: vmovaps xmmword ptr [rbp - 0x90], xmm1
0x1001eb000: vblendps xmm1, xmm3, xmm4, 8
0x1001eb006: vmovaps xmmword ptr [rbp - 0x80], xmm1
0x1001eb00b: vinsertps xmm0, xmm0, dword ptr [rip + 0x8ba0ab], 0x30 ; 0x100aa50c0
0x1001eb015: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1001eb01a: mov r15, qword ptr [rbx + 0x10]
0x1001eb01e: lea r12, [rbp - 0x60]
0x1001eb022: lea rdx, [rbp - 0xa0]
0x1001eb029: mov rdi, r12
0x1001eb02c: mov rsi, r14
0x1001eb02f: call 0x100076df0 ; 0x100076df0
0x1001eb034: mov rdi, r15
0x1001eb037: mov rsi, r12
0x1001eb03a: call 0x10033abc0 ; 0x10033abc0
0x1001eb03f: mov rdx, qword ptr [rbx + 0x18]
0x1001eb043: lea rdi, [rbp - 0x60]
0x1001eb047: mov rsi, r14
0x1001eb04a: call 0x100076df0 ; 0x100076df0
0x1001eb04f: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1001eb054: vmovaps xmm1, xmmword ptr [rbp - 0x50]
0x1001eb059: vmovaps xmm2, xmmword ptr [rbp - 0x40]
0x1001eb05e: vmovaps xmm3, xmmword ptr [rbp - 0x30]
0x1001eb063: vmulps xmm0, xmm0, xmm0
0x1001eb067: vpermilpd xmm4, xmm0, 1
0x1001eb06d: vaddps xmm0, xmm0, xmm4
0x1001eb071: vmovshdup xmm4, xmm0
0x1001eb075: vaddss xmm0, xmm0, xmm4
0x1001eb079: vsqrtss xmm0, xmm0, xmm0
0x1001eb07d: vmulps xmm1, xmm1, xmm1
0x1001eb081: vpermilpd xmm4, xmm1, 1
0x1001eb087: vaddps xmm1, xmm1, xmm4
0x1001eb08b: vmovshdup xmm4, xmm1
0x1001eb08f: vaddss xmm1, xmm1, xmm4
0x1001eb093: vsqrtss xmm1, xmm1, xmm1
0x1001eb097: vmaxss xmm0, xmm0, xmm1
0x1001eb09b: vmulps xmm1, xmm2, xmm2
0x1001eb09f: vpermilpd xmm2, xmm1, 1
0x1001eb0a5: vaddps xmm1, xmm1, xmm2
0x1001eb0a9: vmovshdup xmm2, xmm1
0x1001eb0ad: vaddss xmm1, xmm1, xmm2
0x1001eb0b1: vsqrtss xmm1, xmm1, xmm1
0x1001eb0b5: vmaxss xmm0, xmm0, xmm1
0x1001eb0b9: vinsertps xmm0, xmm3, xmm0, 0x30
0x1001eb0bf: vmovaps xmmword ptr [rbx], xmm0
0x1001eb0c3: add rsp, 0x80
0x1001eb0ca: pop rbx
0x1001eb0cb: pop r12
0x1001eb0cd: pop r14
0x1001eb0cf: pop r15
0x1001eb0d1: pop rbp
0x1001eb0d2: ret 
0x1001eb0d3: lea rdi, [rip + 0x977197] ; 0x100b62271 !m_queued
0x1001eb0da: lea rsi, [rip + 0x97719a] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1001eb0e1: lea r8, [rip + 0x9771af] ; 0x100b62297 VertexRender has already been committed!
0x1001eb0e8: mov edx, 0x8c
0x1001eb0ed: mov ecx, 4
0x1001eb0f2: xor eax, eax
0x1001eb0f4: call 0x1007e6030 ; 0x1007e6030
0x1001eb0f9: ud2 
0x1001eb0fb: nop dword ptr [rax + rax]
