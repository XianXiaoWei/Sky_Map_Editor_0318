0x100098be0: push rbp
0x100098be1: mov rbp, rsp
0x100098be4: push r15
0x100098be6: push r14
0x100098be8: push r13
0x100098bea: push r12
0x100098bec: push rbx
0x100098bed: sub rsp, 0x6518
0x100098bf4: mov r14d, esi
0x100098bf7: mov rax, qword ptr [rip + 0xb74cda] ; 0x100c0d8d8
0x100098bfe: mov rax, qword ptr [rax]
0x100098c01: mov qword ptr [rbp - 0x30], rax
0x100098c05: mov qword ptr [rbp - 0x64f8], rdi
0x100098c0c: movsxd r13, dword ptr [rdi + 8]
0x100098c10: mov dword ptr [rbp - 0x3030], 0
0x100098c1a: test r13, r13
0x100098c1d: jle 0x100098c70
0x100098c1f: imul rax, r13, 0x70
0x100098c23: inc r13
0x100098c26: mov rcx, qword ptr [rbp - 0x64f8]
0x100098c2d: lea rbx, [rcx + rax - 0x58]
0x100098c32: lea r12, [rbp - 0x3030]
0x100098c39: vmovss dword ptr [rbp - 0x6510], xmm0
0x100098c41: nop word ptr cs:[rax + rax]
0x100098c50: mov rdi, rbx
0x100098c53: vmovss xmm0, dword ptr [rbp - 0x6510]
0x100098c5b: mov rsi, r12
0x100098c5e: call 0x100097df0 ; 0x100097df0
0x100098c63: dec r13
0x100098c66: add rbx, -0x70
0x100098c6a: cmp r13, 1
0x100098c6e: jg 0x100098c50
0x100098c70: test r14b, r14b
0x100098c73: jne 0x1000995c8
0x100098c79: mov rbx, qword ptr [rbp - 0x64f8]
0x100098c80: mov rax, qword ptr [rbx + 0x6018]
0x100098c87: mov r15d, dword ptr [rax + 0x54]
0x100098c8b: lea rdi, [rbp - 0x6030]
0x100098c92: mov esi, 0x3000
0x100098c97: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x100098c9c: mov r9, rbx
0x100098c9f: mov edx, dword ptr [r9 + 8]
0x100098ca3: test rdx, rdx
0x100098ca6: je 0x100099506
0x100098cac: mov r8d, edx
0x100098caf: and r8d, 1
0x100098cb3: cmp edx, 1
0x100098cb6: jne 0x100098cc6
0x100098cb8: xor esi, esi
0x100098cba: xor eax, eax
0x100098cbc: test r8, r8
0x100098cbf: jne 0x100098d33
0x100098cc1: jmp 0x100098d61 ; 0x100098d61
0x100098cc6: sub rdx, r8
0x100098cc9: lea rdi, [r9 + 0x88]
0x100098cd0: xor esi, esi
0x100098cd2: vmovss xmm0, dword ptr [rip + 0xa0ddc2] ; 0x100aa6a9c
0x100098cda: xor eax, eax
0x100098cdc: nop dword ptr [rax]
0x100098ce0: cmp dword ptr [rdi - 0x64], 0
0x100098ce4: js 0x100098d01
0x100098ce6: vmovss xmm1, dword ptr [rdi - 0x5c]
0x100098ceb: vucomiss xmm1, xmm0
0x100098cef: jbe 0x100098d01
0x100098cf1: lea rbx, [rdi - 0x70]
0x100098cf5: mov ecx, eax
0x100098cf7: inc eax
0x100098cf9: mov qword ptr [rbp + rcx*8 - 0x64f0], rbx
0x100098d01: cmp dword ptr [rdi + 0xc], 0
0x100098d05: js 0x100098d1e
0x100098d07: vmovss xmm1, dword ptr [rdi + 0x14]
0x100098d0c: vucomiss xmm1, xmm0
0x100098d10: jbe 0x100098d1e
0x100098d12: mov ecx, eax
0x100098d14: inc eax
0x100098d16: mov qword ptr [rbp + rcx*8 - 0x64f0], rdi
0x100098d1e: add rsi, 2
0x100098d22: add rdi, 0xe0
0x100098d29: cmp rdx, rsi
0x100098d2c: jne 0x100098ce0
0x100098d2e: test r8, r8
0x100098d31: je 0x100098d61
0x100098d33: imul rcx, rsi, 0x70
0x100098d37: cmp dword ptr [r9 + rcx + 0x24], 0
0x100098d3d: js 0x100098d61
0x100098d3f: vmovss xmm0, dword ptr [r9 + rcx + 0x2c]
0x100098d46: vucomiss xmm0, dword ptr [rip + 0xa0dd4e] ; 0x100aa6a9c
0x100098d4e: jbe 0x100098d61
0x100098d50: lea rcx, [r9 + rcx + 0x18]
0x100098d55: mov edx, eax
0x100098d57: inc eax
0x100098d59: mov qword ptr [rbp + rdx*8 - 0x64f0], rcx
0x100098d61: test eax, eax
0x100098d63: je 0x100099506
0x100098d69: mov r12d, r15d
0x100098d6c: and r12d, 0xfffffffc
0x100098d70: mov eax, eax
0x100098d72: mov qword ptr [rbp - 0x6530], rax
0x100098d79: mov rax, r12
0x100098d7c: shl rax, 4
0x100098d80: lea rax, [rax + rax*2]
0x100098d84: lea rcx, [rbp + rax - 0x3010]
0x100098d8c: mov qword ptr [rbp - 0x6528], rcx
0x100098d93: lea rax, [rbp + rax - 0x6010]
0x100098d9b: mov qword ptr [rbp - 0x6520], rax
0x100098da2: mov rax, r15
0x100098da5: sub rax, r12
0x100098da8: mov qword ptr [rbp - 0x6518], rax
0x100098daf: xor r14d, r14d
0x100098db2: vxorps xmm8, xmm8, xmm8
0x100098db7: jmp 0x100098e20 ; 0x100098e20
0x100098db9: nop dword ptr [rax]
0x100098dc0: mov rax, qword ptr [r9 + 0x6018]
0x100098dc7: mov rax, qword ptr [rax + 0x58]
0x100098dcb: vmovss xmm0, dword ptr [rax + 0x24]
0x100098dd0: vmovss dword ptr [rbp - 0x300c], xmm0
0x100098dd8: cmp byte ptr [r13 + 0x4e], 0
0x100098ddd: vmovaps xmm1, xmmword ptr [rbp - 0x6510]
0x100098de5: jne 0x100098e9d
0x100098deb: mov rax, qword ptr [r9 + 0x6018]
0x100098df2: mov rax, qword ptr [rax + 0x58]
0x100098df6: vmovss xmm0, dword ptr [rax + 0x20]
0x100098dfb: vmovss dword ptr [rbp - 0x3010], xmm0
0x100098e03: vmovss xmm0, dword ptr [rax + 0x28]
0x100098e08: vmovss dword ptr [rbp - 0x3008], xmm0
0x100098e10: jmp 0x100098e9d ; 0x100098e9d
0x100098e15: nop word ptr cs:[rax + rax]
0x100098e20: vmovaps xmmword ptr [rbp - 0x6510], xmm8
0x100098e28: mov r13, qword ptr [rbp + r14*8 - 0x64f0]
0x100098e30: movsxd rax, dword ptr [r13 + 0xc]
0x100098e34: mov rdi, qword ptr [r9 + rax*8 + 0x6020]
0x100098e3c: mov r10d, dword ptr [r13 + 0x10]
0x100098e40: mov edx, dword ptr [r13 + 0x38]
0x100098e44: mov ecx, dword ptr [r13 + 0x3c]
0x100098e48: mov r8d, dword ptr [r13 + 0x40]
0x100098e4c: mov r9d, dword ptr [r13 + 0x44]
0x100098e50: vmovss xmm0, dword ptr [r13 + 0x48]
0x100098e56: movzx eax, byte ptr [r13 + 0x61]
0x100098e5b: movzx ebx, byte ptr [r13 + 0x4c]
0x100098e60: lea rsi, [rbp - 0x3030]
0x100098e67: push rbx
0x100098e68: push qword ptr [r13 + 0x68]
0x100098e6c: push rax
0x100098e6d: push r10
0x100098e6f: call 0x1000e6900 ; 0x1000e6900
0x100098e74: mov r9, qword ptr [rbp - 0x64f8]
0x100098e7b: add rsp, 0x20
0x100098e7f: cmp byte ptr [r13 + 0x4d], 0
0x100098e84: je 0x100098dc0
0x100098e8a: cmp byte ptr [r13 + 0x4e], 0
0x100098e8f: vmovaps xmm1, xmmword ptr [rbp - 0x6510]
0x100098e97: je 0x100098deb
0x100098e9d: vmovss xmm0, dword ptr [r13 + 0x14]
0x100098ea3: vmovaps xmmword ptr [rbp - 0x6540], xmm0
0x100098eab: vaddss xmm1, xmm1, xmm0
0x100098eaf: vmovaps xmmword ptr [rbp - 0x6510], xmm1
0x100098eb7: test r12d, r12d
0x100098eba: vmovaps xmm8, xmmword ptr [rip + 0xa107ee] ; 0x100aa96b0
0x100098ec2: vmovaps xmm15, xmmword ptr [rip + 0xa107f6] ; 0x100aa96c0
0x100098eca: je 0x1000993b4
0x100098ed0: vmovaps xmm0, xmmword ptr [rbp - 0x6540]
0x100098ed8: vpermilps xmm12, xmm0, 0
0x100098ede: vdivps xmm0, xmm0, xmmword ptr [rbp - 0x6510]
0x100098ee6: vpermilps xmm10, xmm0, 0
0x100098eec: vxorps xmm9, xmm10, xmmword ptr [rip + 0xa0ea0c] ; 0x100aa7900
0x100098ef4: vmovaps xmm0, xmmword ptr [rip + 0xa0e764] ; 0x100aa7660
0x100098efc: vsubps xmm11, xmm0, xmm10
0x100098f01: lea rax, [rbp - 0x5f78]
0x100098f08: lea rcx, [rbp - 0x2f78]
0x100098f0f: xor edx, edx
0x100098f11: nop word ptr cs:[rax + rax]
0x100098f20: vmovss xmm0, dword ptr [rcx - 0xb8]
0x100098f28: vmovss xmm5, dword ptr [rcx - 0xb4]
0x100098f30: vinsertps xmm0, xmm0, dword ptr [rcx - 0x88], 0x10
0x100098f3a: vmovss xmm6, dword ptr [rcx - 0x28]
0x100098f3f: vinsertps xmm5, xmm5, dword ptr [rcx - 0x84], 0x10
0x100098f49: vinsertps xmm0, xmm0, dword ptr [rcx - 0x58], 0x20
0x100098f50: vinsertps xmm5, xmm5, dword ptr [rcx - 0x54], 0x20
0x100098f57: vmovss xmm7, dword ptr [rcx - 0x24]
0x100098f5c: vmovss xmm3, dword ptr [rcx - 0xb0]
0x100098f64: vinsertps xmm0, xmm0, xmm6, 0x30
0x100098f6a: vinsertps xmm3, xmm3, dword ptr [rcx - 0x80], 0x10
0x100098f71: vinsertps xmm3, xmm3, dword ptr [rcx - 0x50], 0x20
0x100098f78: vmovss xmm6, dword ptr [rcx - 0x20]
0x100098f7d: vinsertps xmm5, xmm5, xmm7, 0x30
0x100098f83: vmovss xmm7, dword ptr [rax - 0xb8]
0x100098f8b: vmovss xmm2, dword ptr [rax - 0xb4]
0x100098f93: vinsertps xmm7, xmm7, dword ptr [rax - 0x88], 0x10
0x100098f9d: vinsertps xmm3, xmm3, xmm6, 0x30
0x100098fa3: vinsertps xmm6, xmm7, dword ptr [rax - 0x58], 0x20
0x100098faa: vmovss xmm7, dword ptr [rax - 0x28]
0x100098faf: vinsertps xmm2, xmm2, dword ptr [rax - 0x84], 0x10
0x100098fb9: vinsertps xmm6, xmm6, xmm7, 0x30
0x100098fbf: vinsertps xmm2, xmm2, dword ptr [rax - 0x54], 0x20
0x100098fc6: vmovss xmm7, dword ptr [rax - 0x24]
0x100098fcb: vmovss xmm4, dword ptr [rax - 0xb0]
0x100098fd3: vinsertps xmm2, xmm2, xmm7, 0x30
0x100098fd9: vinsertps xmm4, xmm4, dword ptr [rax - 0x80], 0x10
0x100098fe0: vinsertps xmm4, xmm4, dword ptr [rax - 0x50], 0x20
0x100098fe7: vmovss xmm7, dword ptr [rax - 0x20]
0x100098fec: vinsertps xmm4, xmm4, xmm7, 0x30
0x100098ff2: vmulps xmm0, xmm12, xmm0
0x100098ff6: vaddps xmm0, xmm0, xmm6
0x100098ffa: vmulps xmm5, xmm12, xmm5
0x100098ffe: vaddps xmm2, xmm5, xmm2
0x100099002: vmulps xmm3, xmm12, xmm3
0x100099006: vaddps xmm3, xmm3, xmm4
0x10009900a: vextractps dword ptr [rax - 0xb8], xmm0, 0
0x100099014: vextractps dword ptr [rax - 0xb4], xmm2, 0
0x10009901e: vextractps dword ptr [rax - 0xb0], xmm3, 0
0x100099028: vextractps dword ptr [rax - 0x88], xmm0, 1
0x100099032: vextractps dword ptr [rax - 0x84], xmm2, 1
0x10009903c: vmovss xmm4, dword ptr [rcx - 0x98]
0x100099044: vextractps dword ptr [rax - 0x80], xmm3, 1
0x10009904b: vmovss xmm5, dword ptr [rcx - 0x94]
0x100099053: vinsertps xmm4, xmm4, dword ptr [rcx - 0x68], 0x10
0x10009905a: vextractps dword ptr [rax - 0x58], xmm0, 2
0x100099061: vinsertps xmm4, xmm4, dword ptr [rcx - 0x38], 0x20
0x100099068: vmovss xmm6, dword ptr [rcx - 8]
0x10009906d: vextractps dword ptr [rax - 0x54], xmm2, 2
0x100099074: vinsertps xmm4, xmm4, xmm6, 0x30
0x10009907a: vinsertps xmm5, xmm5, dword ptr [rcx - 0x64], 0x10
0x100099081: vextractps dword ptr [rax - 0x50], xmm3, 2
0x100099088: vinsertps xmm5, xmm5, dword ptr [rcx - 0x34], 0x20
0x10009908f: vmovss xmm6, dword ptr [rcx - 4]
0x100099094: vextractps dword ptr [rax - 0x28], xmm0, 3
0x10009909b: vinsertps xmm0, xmm5, xmm6, 0x30
0x1000990a1: vmovss xmm5, dword ptr [rcx - 0x90]
0x1000990a9: vextractps dword ptr [rax - 0x24], xmm2, 3
0x1000990b0: vinsertps xmm2, xmm5, dword ptr [rcx - 0x60], 0x10
0x1000990b7: vinsertps xmm2, xmm2, dword ptr [rcx - 0x30], 0x20
0x1000990be: vextractps dword ptr [rax - 0x20], xmm3, 3
0x1000990c5: vmovss xmm3, dword ptr [rcx]
0x1000990c9: vinsertps xmm2, xmm2, xmm3, 0x30
0x1000990cf: vmovss xmm3, dword ptr [rax - 0x98]
0x1000990d7: vmovss xmm5, dword ptr [rax - 0x94]
0x1000990df: vinsertps xmm3, xmm3, dword ptr [rax - 0x68], 0x10
0x1000990e6: vinsertps xmm3, xmm3, dword ptr [rax - 0x38], 0x20
0x1000990ed: vinsertps xmm5, xmm5, dword ptr [rax - 0x64], 0x10
0x1000990f4: vinsertps xmm3, xmm3, dword ptr [rax - 8], 0x30
0x1000990fb: vinsertps xmm5, xmm5, dword ptr [rax - 0x34], 0x20
0x100099102: vmovss xmm6, dword ptr [rax - 0x90]
0x10009910a: vinsertps xmm6, xmm6, dword ptr [rax - 0x60], 0x10
0x100099111: vinsertps xmm5, xmm5, dword ptr [rax - 4], 0x30
0x100099118: vinsertps xmm6, xmm6, dword ptr [rax - 0x30], 0x20
0x10009911f: vinsertps xmm6, xmm6, dword ptr [rax], 0x30
0x100099125: vmulps xmm4, xmm12, xmm4
0x100099129: vaddps xmm3, xmm4, xmm3
0x10009912d: vmulps xmm0, xmm12, xmm0
0x100099131: vaddps xmm0, xmm0, xmm5
0x100099135: vmulps xmm2, xmm12, xmm2
0x100099139: vaddps xmm2, xmm2, xmm6
0x10009913d: vextractps dword ptr [rax - 0x98], xmm3, 0
0x100099147: vextractps dword ptr [rax - 0x94], xmm0, 0
0x100099151: vextractps dword ptr [rax - 0x90], xmm2, 0
0x10009915b: vextractps dword ptr [rax - 0x68], xmm3, 1
0x100099162: vmovss xmm4, dword ptr [rcx - 0xa8]
0x10009916a: vmovss xmm6, dword ptr [rcx - 0xa4]
0x100099172: vextractps dword ptr [rax - 0x64], xmm0, 1
0x100099179: vinsertps xmm4, xmm4, dword ptr [rcx - 0x78], 0x10
0x100099180: vinsertps xmm4, xmm4, dword ptr [rcx - 0x48], 0x20
0x100099187: vextractps dword ptr [rax - 0x60], xmm2, 1
0x10009918e: vinsertps xmm13, xmm4, dword ptr [rcx - 0x18], 0x30
0x100099195: vinsertps xmm4, xmm6, dword ptr [rcx - 0x74], 0x10
0x10009919c: vextractps dword ptr [rax - 0x38], xmm3, 2
0x1000991a3: vinsertps xmm4, xmm4, dword ptr [rcx - 0x44], 0x20
0x1000991aa: vinsertps xmm14, xmm4, dword ptr [rcx - 0x14], 0x30
0x1000991b1: vextractps dword ptr [rax - 0x34], xmm0, 2
0x1000991b8: vmovss xmm4, dword ptr [rcx - 0xa0]
0x1000991c0: vinsertps xmm4, xmm4, dword ptr [rcx - 0x70], 0x10
0x1000991c7: vextractps dword ptr [rax - 0x30], xmm2, 2
0x1000991ce: vinsertps xmm4, xmm4, dword ptr [rcx - 0x40], 0x20
0x1000991d5: vinsertps xmm7, xmm4, dword ptr [rcx - 0x10], 0x30
0x1000991dc: vextractps dword ptr [rax - 8], xmm3, 3
0x1000991e3: vmovss xmm3, dword ptr [rcx - 0x9c]
0x1000991eb: vinsertps xmm3, xmm3, dword ptr [rcx - 0x6c], 0x10
0x1000991f2: vextractps dword ptr [rax - 4], xmm0, 3
0x1000991f9: vinsertps xmm0, xmm3, dword ptr [rcx - 0x3c], 0x20
0x100099200: vinsertps xmm0, xmm0, dword ptr [rcx - 0xc], 0x30
0x100099207: vextractps dword ptr [rax], xmm2, 3
0x10009920d: vmovss xmm2, dword ptr [rax - 0xa8]
0x100099215: vmovss xmm3, dword ptr [rax - 0xa4]
0x10009921d: vinsertps xmm2, xmm2, dword ptr [rax - 0x78], 0x10
0x100099224: vinsertps xmm2, xmm2, dword ptr [rax - 0x48], 0x20
0x10009922b: vinsertps xmm2, xmm2, dword ptr [rax - 0x18], 0x30
0x100099232: vinsertps xmm3, xmm3, dword ptr [rax - 0x74], 0x10
0x100099239: vinsertps xmm3, xmm3, dword ptr [rax - 0x44], 0x20
0x100099240: vinsertps xmm3, xmm3, dword ptr [rax - 0x14], 0x30
0x100099247: vmovss xmm4, dword ptr [rax - 0xa0]
0x10009924f: vinsertps xmm4, xmm4, dword ptr [rax - 0x70], 0x10
0x100099256: vinsertps xmm4, xmm4, dword ptr [rax - 0x40], 0x20
0x10009925d: vinsertps xmm4, xmm4, dword ptr [rax - 0x10], 0x30
0x100099264: vmovss xmm1, dword ptr [rax - 0x9c]
0x10009926c: vinsertps xmm1, xmm1, dword ptr [rax - 0x6c], 0x10
0x100099273: vinsertps xmm1, xmm1, dword ptr [rax - 0x3c], 0x20
0x10009927a: vinsertps xmm1, xmm1, dword ptr [rax - 0xc], 0x30
0x100099281: vmulps xmm5, xmm13, xmm2
0x100099285: vmulps xmm6, xmm14, xmm3
0x100099289: vaddps xmm5, xmm5, xmm6
0x10009928d: vmulps xmm6, xmm7, xmm4
0x100099291: vaddps xmm5, xmm5, xmm6
0x100099295: vmulps xmm6, xmm0, xmm1
0x100099299: vaddps xmm5, xmm5, xmm6
0x10009929d: vcmpltps xmm5, xmm5, xmmword ptr [rip + 0xa0b2fa] ; 0x100aa45a0
0x1000992a6: vblendvps xmm5, xmm10, xmm9, xmm5
0x1000992ac: vmulps xmm2, xmm11, xmm2
0x1000992b0: vmulps xmm6, xmm13, xmm5
0x1000992b4: vaddps xmm2, xmm2, xmm6
0x1000992b8: vmulps xmm3, xmm11, xmm3
0x1000992bc: vmulps xmm6, xmm14, xmm5
0x1000992c0: vaddps xmm3, xmm3, xmm6
0x1000992c4: vmulps xmm4, xmm11, xmm4
0x1000992c8: vmulps xmm6, xmm7, xmm5
0x1000992cc: vmulps xmm1, xmm11, xmm1
0x1000992d0: vmulps xmm0, xmm0, xmm5
0x1000992d4: vaddps xmm4, xmm4, xmm6
0x1000992d8: vaddps xmm0, xmm1, xmm0
0x1000992dc: vmulps xmm1, xmm2, xmm2
0x1000992e0: vmulps xmm5, xmm3, xmm3
0x1000992e4: vaddps xmm1, xmm1, xmm5
0x1000992e8: vmulps xmm5, xmm4, xmm4
0x1000992ec: vaddps xmm1, xmm5, xmm1
0x1000992f0: vmulps xmm5, xmm0, xmm0
0x1000992f4: vaddps xmm1, xmm5, xmm1
0x1000992f8: vrsqrtps xmm5, xmm1
0x1000992fc: vmulps xmm6, xmm5, xmm5
0x100099300: vmulps xmm1, xmm6, xmm1
0x100099304: vsubps xmm1, xmm8, xmm1
0x100099308: vmulps xmm1, xmm1, xmm15
0x10009930d: vmulps xmm1, xmm5, xmm1
0x100099311: vmulps xmm2, xmm2, xmm1
0x100099315: vmulps xmm3, xmm3, xmm1
0x100099319: vmulps xmm4, xmm4, xmm1
0x10009931d: vmulps xmm0, xmm0, xmm1
0x100099321: vpunpckldq xmm1, xmm2, xmm3
0x100099325: vpermilps xmm5, xmm0, 0x24
0x10009932b: vmovddup xmm6, xmm4
0x10009932f: vpblendw xmm5, xmm6, xmm5, 0xc0
0x100099335: vpunpckldq xmm6, xmm4, xmm0
0x100099339: vpblendw xmm1, xmm1, xmm5, 0xf0
0x10009933f: vpermilps xmm5, xmm2, 0xe5
0x100099345: vpblendw xmm5, xmm5, xmm3, 0xc
0x10009934b: vpblendw xmm5, xmm5, xmm6, 0xf0
0x100099351: vmovdqa xmmword ptr [rax - 0xa8], xmm1
0x100099359: vmovdqa xmmword ptr [rax - 0x78], xmm5
0x10009935e: vpunpckhdq xmm1, xmm2, xmm3
0x100099362: vpermilps xmm5, xmm0, 0xa4
0x100099368: vpblendw xmm5, xmm4, xmm5, 0xc0
0x10009936e: vpblendw xmm1, xmm1, xmm5, 0xf0
0x100099374: vmovdqa xmmword ptr [rax - 0x48], xmm1
0x100099379: vpunpckhdq xmm0, xmm4, xmm0
0x10009937d: vpermilpd xmm1, xmm3, 1
0x100099383: vpermilps xmm2, xmm2, 0xe7
0x100099389: vpblendw xmm1, xmm2, xmm1, 0xc
0x10009938f: vpblendw xmm0, xmm1, xmm0, 0xf0
0x100099395: vmovdqa xmmword ptr [rax - 0x18], xmm0
0x10009939a: add rdx, 4
0x10009939e: add rcx, 0xc0
0x1000993a5: add rax, 0xc0
0x1000993ab: cmp rdx, r12
0x1000993ae: jb 0x100098f20
0x1000993b4: cmp r12d, r15d
0x1000993b7: vxorps xmm9, xmm9, xmm9
0x1000993bc: vmovss xmm7, dword ptr [rip + 0xa0e500] ; 0x100aa78c4
0x1000993c4: vmovaps xmm8, xmmword ptr [rbp - 0x6510]
0x1000993cc: jae 0x1000994b4
0x1000993d2: vmovss xmm0, dword ptr [rip + 0xa0bce6] ; 0x100aa50c0
0x1000993da: vmovaps xmm3, xmm0
0x1000993de: vdivss xmm0, xmm3, xmm8
0x1000993e3: vmovaps xmm2, xmmword ptr [rbp - 0x6540]
0x1000993eb: vpermilps xmm1, xmm2, 0xc0
0x1000993f1: vmulss xmm2, xmm2, xmm0
0x1000993f5: vsubss xmm0, xmm3, xmm2
0x1000993f9: vpermilps xmm0, xmm0, 0
0x1000993ff: vpermilps xmm2, xmm2, 0
0x100099405: mov rax, qword ptr [rbp - 0x6518]
0x10009940c: mov rcx, qword ptr [rbp - 0x6520]
0x100099413: mov rdx, qword ptr [rbp - 0x6528]
0x10009941a: nop word ptr [rax + rax]
0x100099420: vmulps xmm3, xmm1, xmmword ptr [rdx - 0x20]
0x100099425: vaddps xmm3, xmm3, xmmword ptr [rcx - 0x20]
0x10009942a: vmovaps xmmword ptr [rcx - 0x20], xmm3
0x10009942f: vmulps xmm3, xmm1, xmmword ptr [rdx]
0x100099433: vaddps xmm3, xmm3, xmmword ptr [rcx]
0x100099437: vmovaps xmmword ptr [rcx], xmm3
0x10009943b: vmovaps xmm3, xmmword ptr [rcx - 0x10]
0x100099440: vmovaps xmm4, xmmword ptr [rdx - 0x10]
0x100099445: vmulps xmm5, xmm3, xmm4
0x100099449: vpermilpd xmm6, xmm5, 1
0x10009944f: vaddps xmm5, xmm5, xmm6
0x100099453: vmovshdup xmm6, xmm5
0x100099457: vaddss xmm5, xmm5, xmm6
0x10009945b: vucomiss xmm9, xmm5
0x10009945f: vmulps xmm3, xmm0, xmm3
0x100099463: vmulps xmm4, xmm2, xmm4
0x100099467: jbe 0x100099470
0x100099469: vsubps xmm3, xmm3, xmm4
0x10009946d: jmp 0x100099474 ; 0x100099474
0x10009946f: nop 
0x100099470: vaddps xmm3, xmm3, xmm4
0x100099474: vmulps xmm4, xmm3, xmm3
0x100099478: vpermilpd xmm5, xmm4, 1
0x10009947e: vaddps xmm4, xmm4, xmm5
0x100099482: vmovshdup xmm5, xmm4
0x100099486: vaddss xmm4, xmm4, xmm5
0x10009948a: vsqrtss xmm4, xmm4, xmm4
0x10009948e: vucomiss xmm4, xmm7
0x100099492: jbe 0x10009949e
0x100099494: vpermilps xmm4, xmm4, 0
0x10009949a: vdivps xmm3, xmm3, xmm4
0x10009949e: vmovaps xmmword ptr [rcx - 0x10], xmm3
0x1000994a3: add rdx, 0x30
0x1000994a7: add rcx, 0x30
0x1000994ab: dec rax
0x1000994ae: jne 0x100099420
0x1000994b4: inc r14
0x1000994b7: cmp r14, qword ptr [rbp - 0x6530]
0x1000994be: jne 0x100098e20
0x1000994c4: vxorps xmm0, xmm0, xmm0
0x1000994c8: vucomiss xmm8, xmm0
0x1000994cc: jbe 0x100099506
0x1000994ce: test r15d, r15d
0x1000994d1: je 0x1000995c8
0x1000994d7: vmovss xmm0, dword ptr [rip + 0xa0bbe1] ; 0x100aa50c0
0x1000994df: vdivss xmm0, xmm0, xmm8
0x1000994e4: vpermilps xmm0, xmm0, 0xc0
0x1000994ea: mov eax, r15d
0x1000994ed: and eax, 1
0x1000994f0: cmp r15d, 1
0x1000994f4: jne 0x1000995f1
0x1000994fa: xor ecx, ecx
0x1000994fc: test rax, rax
0x1000994ff: je 0x100099559
0x100099501: jmp 0x10009963d ; 0x10009963d
0x100099506: test r15d, r15d
0x100099509: je 0x1000995c8
0x10009950f: mov rax, qword ptr [r9 + 0x6018]
0x100099516: mov ecx, 0x20
0x10009951b: mov rdx, r15
0x10009951e: nop 
0x100099520: mov rsi, qword ptr [rax + 0x58]
0x100099524: vmovaps xmm0, xmmword ptr [rsi + rcx - 0x20]
0x10009952a: vmovaps xmmword ptr [rbp + rcx - 0x6050], xmm0
0x100099533: vmovaps xmm0, xmmword ptr [rsi + rcx - 0x10]
0x100099539: vmovaps xmmword ptr [rbp + rcx - 0x6040], xmm0
0x100099542: vmovaps xmm0, xmmword ptr [rsi + rcx]
0x100099547: vmovaps xmmword ptr [rbp + rcx - 0x6030], xmm0
0x100099550: add rcx, 0x30
0x100099554: dec rdx
0x100099557: jne 0x100099520
0x100099559: test r15d, r15d
0x10009955c: je 0x1000995c8
0x10009955e: movabs rax, 0x100000000
0x100099568: lea rcx, [rbp - 0x6010]
0x10009956f: mov rdx, rax
0x100099572: nop word ptr cs:[rax + rax]
0x100099580: mov rsi, qword ptr [r9 + 0x5838]
0x100099587: mov rdi, rdx
0x10009958a: sar rdi, 0x20
0x10009958e: imul rdi, rdi, 0xf0
0x100099595: vmovaps xmm0, xmmword ptr [rcx]
0x100099599: vmovaps xmmword ptr [rsi + rdi], xmm0
0x10009959e: vmovaps xmm0, xmmword ptr [rcx - 0x20]
0x1000995a3: vmovaps xmmword ptr [rsi + rdi + 0x20], xmm0
0x1000995a9: vmovaps xmm0, xmmword ptr [rcx - 0x10]
0x1000995ae: vmovaps xmmword ptr [rsi + rdi + 0x30], xmm0
0x1000995b4: mov byte ptr [rsi + rdi + 0xe0], 1
0x1000995bc: add rcx, 0x30
0x1000995c0: add rdx, rax
0x1000995c3: dec r15
0x1000995c6: jne 0x100099580
0x1000995c8: mov rax, qword ptr [rip + 0xb74309] ; 0x100c0d8d8
0x1000995cf: mov rax, qword ptr [rax]
0x1000995d2: cmp rax, qword ptr [rbp - 0x30]
0x1000995d6: jne 0x100099677
0x1000995dc: add rsp, 0x6518
0x1000995e3: pop rbx
0x1000995e4: pop r12
0x1000995e6: pop r13
0x1000995e8: pop r14
0x1000995ea: pop r15
0x1000995ec: pop rbp
0x1000995ed: vzeroupper 
0x1000995f0: ret 
0x1000995f1: mov rdx, r15
0x1000995f4: sub rdx, rax
0x1000995f7: lea rsi, [rbp - 0x5fe0]
0x1000995fe: xor ecx, ecx
0x100099600: vmulps xmm1, xmm0, xmmword ptr [rsi - 0x50]
0x100099605: vmovaps xmmword ptr [rsi - 0x50], xmm1
0x10009960a: vmulps xmm1, xmm0, xmmword ptr [rsi - 0x30]
0x10009960f: vmulps xmm2, xmm0, xmmword ptr [rsi - 0x20]
0x100099614: vinsertf128 ymm1, ymm1, xmm2, 1
0x10009961a: vmovups ymmword ptr [rsi - 0x30], ymm1
0x10009961f: vmulps xmm1, xmm0, xmmword ptr [rsi]
0x100099623: vmovaps xmmword ptr [rsi], xmm1
0x100099627: add rcx, 2
0x10009962b: add rsi, 0x60
0x10009962f: cmp rdx, rcx
0x100099632: jne 0x100099600
0x100099634: test rax, rax
0x100099637: je 0x100099559
0x10009963d: lea rax, [rcx + rcx*2]
0x100099641: shl rax, 4
0x100099645: vmulps xmm1, xmm0, xmmword ptr [rbp + rax - 0x6030]
0x10009964e: vmovaps xmmword ptr [rbp + rax - 0x6030], xmm1
0x100099657: vmulps xmm0, xmm0, xmmword ptr [rbp + rax - 0x6010]
0x100099660: vmovaps xmmword ptr [rbp + rax - 0x6010], xmm0
0x100099669: test r15d, r15d
0x10009966c: jne 0x10009955e
0x100099672: jmp 0x1000995c8 ; 0x1000995c8
0x100099677: vzeroupper 
0x10009967a: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10009967f: nop 
