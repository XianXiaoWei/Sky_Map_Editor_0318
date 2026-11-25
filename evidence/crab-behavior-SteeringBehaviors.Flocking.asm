0x10062f800: push rbp
0x10062f801: mov rbp, rsp
0x10062f804: push r15
0x10062f806: push r14
0x10062f808: push r13
0x10062f80a: push r12
0x10062f80c: push rbx
0x10062f80d: sub rsp, 0xce8
0x10062f814: mov rax, rdx
0x10062f817: mov qword ptr [rbp - 0xcd8], rsi
0x10062f81e: vmovss dword ptr [rbp - 0xc98], xmm4
0x10062f826: vmovaps xmmword ptr [rbp - 0xcf0], xmm3
0x10062f82e: vmovaps xmmword ptr [rbp - 0xd00], xmm2
0x10062f836: vmovaps xmmword ptr [rbp - 0xd10], xmm1
0x10062f83e: vmovaps xmm12, xmm0
0x10062f842: mov rbx, rdi
0x10062f845: mov rcx, qword ptr [rip + 0x5de08c] ; 0x100c0d8d8
0x10062f84c: mov rcx, qword ptr [rcx]
0x10062f84f: mov qword ptr [rbp - 0x30], rcx
0x10062f853: cmp byte ptr [rbx + 0x10], 0
0x10062f857: je 0x10062fde2
0x10062f85d: vandps xmm0, xmm12, xmmword ptr [rip + 0x4780ab] ; 0x100aa7910
0x10062f865: vmovss xmm3, dword ptr [rip + 0x478057] ; 0x100aa78c4
0x10062f86d: vucomiss xmm3, xmm0
0x10062f871: jae 0x10062fdbb
0x10062f877: mov ecx, dword ptr [rbx + 0x1bc]
0x10062f87d: lea edx, [rcx - 1]
0x10062f880: mov dword ptr [rbx + 0x1bc], edx
0x10062f886: test ecx, ecx
0x10062f888: vmovaps xmmword ptr [rbp - 0xcb0], xmm12
0x10062f890: jle 0x10062f8a8
0x10062f892: lea rax, [rbx + 0x1b8]
0x10062f899: mov qword ptr [rbp - 0xcb8], rax
0x10062f8a0: mov eax, dword ptr [rbx + 0x1b8]
0x10062f8a6: jmp 0x10062f900 ; 0x10062f900
0x10062f8a8: mov rdi, qword ptr [rbx + 0x1d0]
0x10062f8af: lea rsi, [rbx + 0x20]
0x10062f8b3: lea rdx, [rbx + 0xb8]
0x10062f8ba: mov ecx, 0x20
0x10062f8bf: xor r9d, r9d
0x10062f8c2: vmovss xmm0, dword ptr [rbp - 0xc98]
0x10062f8ca: mov r8, rax
0x10062f8cd: call 0x1004ce4b0 ; 0x1004ce4b0
0x10062f8d2: vmovss xmm3, dword ptr [rip + 0x477fea] ; 0x100aa78c4
0x10062f8da: vmovaps xmm12, xmmword ptr [rbp - 0xcb0]
0x10062f8e2: lea rcx, [rbx + 0x1b8]
0x10062f8e9: mov qword ptr [rbp - 0xcb8], rcx
0x10062f8f0: mov dword ptr [rbx + 0x1b8], eax
0x10062f8f6: mov dword ptr [rbx + 0x1bc], 8
0x10062f900: vxorps xmm0, xmm0, xmm0
0x10062f904: vmovaps xmmword ptr [rbp - 0xcd0], xmm0
0x10062f90c: test eax, eax
0x10062f90e: je 0x10062fda5
0x10062f914: xor r14d, r14d
0x10062f917: lea r15, [rbp - 0xc90]
0x10062f91e: xor esi, esi
0x10062f920: mov qword ptr [rbp - 0xca0], rbx
0x10062f927: jmp 0x10062fa00 ; 0x10062fa00
0x10062f92c: mov rsi, qword ptr [r13]
0x10062f930: mov rax, qword ptr [rsi]
0x10062f933: mov rdi, r15
0x10062f936: call qword ptr [rax + 0x28]
0x10062f939: vmovaps xmm0, xmmword ptr [rbp - 0xc90]
0x10062f941: vmovaps xmm1, xmmword ptr [rbp - 0xc70]
0x10062f949: vmovaps xmm2, xmmword ptr [rbp - 0xc60]
0x10062f951: mov esi, dword ptr [rbp - 0xc94]
0x10062f957: mov eax, esi
0x10062f959: lea rax, [rax + rax*2]
0x10062f95d: shl rax, 5
0x10062f961: vmovaps xmmword ptr [rbp + rax - 0xc30], xmm2
0x10062f96a: vaddps xmm0, xmm0, xmmword ptr [rbp - 0xc80]
0x10062f972: vaddps xmm0, xmm0, xmm1
0x10062f976: vmulps xmm0, xmm0, xmm0
0x10062f97a: vmovshdup xmm2, xmm0
0x10062f97e: vaddss xmm2, xmm0, xmm2
0x10062f982: vpermilpd xmm0, xmm0, 1
0x10062f988: vaddss xmm0, xmm0, xmm2
0x10062f98c: vsqrtss xmm0, xmm0, xmm0
0x10062f990: vmovss dword ptr [rbp + rax - 0xbe0], xmm0
0x10062f999: vxorps xmm0, xmm1, xmmword ptr [rip + 0x477f5f] ; 0x100aa7900
0x10062f9a1: vmulps xmm1, xmm1, xmm1
0x10062f9a5: vmovshdup xmm2, xmm1
0x10062f9a9: vaddss xmm2, xmm1, xmm2
0x10062f9ad: vpermilpd xmm1, xmm1, 1
0x10062f9b3: vaddss xmm1, xmm1, xmm2
0x10062f9b7: vsqrtss xmm1, xmm1, xmm1
0x10062f9bb: vmovss xmm3, dword ptr [rip + 0x477f01] ; 0x100aa78c4
0x10062f9c3: vucomiss xmm1, xmm3
0x10062f9c7: jbe 0x10062f9d3
0x10062f9c9: vpermilps xmm1, xmm1, 0xc0
0x10062f9cf: vdivps xmm0, xmm0, xmm1
0x10062f9d3: mov rbx, qword ptr [rbp - 0xca0]
0x10062f9da: vmovaps xmm12, xmmword ptr [rbp - 0xcb0]
0x10062f9e2: vmovaps xmmword ptr [rbp + rax - 0xbf0], xmm0
0x10062f9eb: mov dword ptr [rbp + rax - 0xbdc], 0x3f800000
0x10062f9f6: jmp 0x10062fbcf ; 0x10062fbcf
0x10062f9fb: nop dword ptr [rax + rax]
0x10062fa00: mov ecx, r14d
0x10062fa03: mov rdx, qword ptr [rbp - 0xcd8]
0x10062fa0a: cmp qword ptr [rbx + rcx*8 + 0xb8], rdx
0x10062fa12: je 0x10062fbda
0x10062fa18: mov dword ptr [rbp - 0xc94], esi
0x10062fa1e: lea r13, [rbx + rcx*8 + 0xb8]
0x10062fa26: call 0x10074a170 ; 0x10074a170
0x10062fa2b: mov r12, rax
0x10062fa2e: mov qword ptr [rbp - 0xc90], 0
0x10062fa39: call 0x100262d70 ; 0x100262d70
0x10062fa3e: mov rbx, qword ptr [rax]
0x10062fa41: mov rdi, rax
0x10062fa44: mov rsi, r15
0x10062fa47: mov rdx, r13
0x10062fa4a: mov rcx, r12
0x10062fa4d: call qword ptr [rbx + 0x40]
0x10062fa50: cmp qword ptr [rbp - 0xc90], 0
0x10062fa58: je 0x10062faf0
0x10062fa5e: mov rax, qword ptr [r13]
0x10062fa62: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x10062fa67: vmovaps xmm1, xmmword ptr [rax + 0x20]
0x10062fa6c: vmovaps xmm2, xmmword ptr [rax + 0x30]
0x10062fa71: vmovaps xmm3, xmmword ptr [rax + 0x40]
0x10062fa76: vmovaps xmm4, xmmword ptr [rax + 0x50]
0x10062fa7b: mov ecx, dword ptr [rax + 0x68]
0x10062fa7e: mov dword ptr [rbp - 0xc88], ecx
0x10062fa84: mov rax, qword ptr [rax + 0x60]
0x10062fa88: mov qword ptr [rbp - 0xc90], rax
0x10062fa8f: mov esi, dword ptr [rbp - 0xc94]
0x10062fa95: mov eax, esi
0x10062fa97: lea rax, [rax + rax*2]
0x10062fa9b: shl rax, 5
0x10062fa9f: vmovaps xmmword ptr [rbp + rax - 0xc30], xmm0
0x10062faa8: vmovaps xmmword ptr [rbp + rax - 0xc20], xmm1
0x10062fab1: vmovaps xmmword ptr [rbp + rax - 0xc10], xmm2
0x10062faba: vmovaps xmmword ptr [rbp + rax - 0xc00], xmm3
0x10062fac3: vmovaps xmmword ptr [rbp + rax - 0xbf0], xmm4
0x10062facc: mov ecx, dword ptr [rbp - 0xc88]
0x10062fad2: mov dword ptr [rbp + rax - 0xbd8], ecx
0x10062fad9: mov rcx, qword ptr [rbp - 0xc90]
0x10062fae0: jmp 0x10062fbb0 ; 0x10062fbb0
0x10062fae5: nop word ptr cs:[rax + rax]
0x10062faf0: call 0x10074a170 ; 0x10074a170
0x10062faf5: mov r12, rax
0x10062faf8: mov qword ptr [rbp - 0xc90], 0
0x10062fb03: call 0x1000f8400 ; 0x1000f8400
0x10062fb08: mov rbx, qword ptr [rax]
0x10062fb0b: mov rdi, rax
0x10062fb0e: mov rsi, r15
0x10062fb11: mov rdx, r13
0x10062fb14: mov rcx, r12
0x10062fb17: call qword ptr [rbx + 0x40]
0x10062fb1a: cmp qword ptr [rbp - 0xc90], 0
0x10062fb22: je 0x10062f92c
0x10062fb28: mov rsi, qword ptr [r13]
0x10062fb2c: mov rdi, r15
0x10062fb2f: call 0x100101450 ; 0x100101450
0x10062fb34: mov esi, dword ptr [rbp - 0xc94]
0x10062fb3a: mov eax, esi
0x10062fb3c: lea rax, [rax + rax*2]
0x10062fb40: shl rax, 5
0x10062fb44: vmovaps xmm0, xmmword ptr [rbp - 0xc90]
0x10062fb4c: vmovaps xmmword ptr [rbp + rax - 0xc30], xmm0
0x10062fb55: vmovaps xmm0, xmmword ptr [rbp - 0xc80]
0x10062fb5d: vmovaps xmmword ptr [rbp + rax - 0xc20], xmm0
0x10062fb66: vmovaps xmm0, xmmword ptr [rbp - 0xc70]
0x10062fb6e: vmovaps xmmword ptr [rbp + rax - 0xc10], xmm0
0x10062fb77: vmovaps xmm0, xmmword ptr [rbp - 0xc60]
0x10062fb7f: vmovaps xmmword ptr [rbp + rax - 0xc00], xmm0
0x10062fb88: vmovaps xmm0, xmmword ptr [rbp - 0xc50]
0x10062fb90: vmovaps xmmword ptr [rbp + rax - 0xbf0], xmm0
0x10062fb99: lea rcx, [rbp - 0xc40]
0x10062fba0: mov rdx, rcx
0x10062fba3: mov ecx, dword ptr [rdx + 8]
0x10062fba6: mov dword ptr [rbp + rax - 0xbd8], ecx
0x10062fbad: mov rcx, qword ptr [rdx]
0x10062fbb0: mov qword ptr [rbp + rax - 0xbe0], rcx
0x10062fbb8: mov rbx, qword ptr [rbp - 0xca0]
0x10062fbbf: vmovaps xmm12, xmmword ptr [rbp - 0xcb0]
0x10062fbc7: vmovss xmm3, dword ptr [rip + 0x477cf5] ; 0x100aa78c4
0x10062fbcf: inc esi
0x10062fbd1: mov rax, qword ptr [rbp - 0xcb8]
0x10062fbd8: mov eax, dword ptr [rax]
0x10062fbda: inc r14d
0x10062fbdd: cmp r14d, eax
0x10062fbe0: jb 0x10062fa00
0x10062fbe6: test esi, esi
0x10062fbe8: je 0x10062fda5
0x10062fbee: vmovss xmm0, dword ptr [rbp - 0xc98]
0x10062fbf6: vmulss xmm10, xmm0, xmm0
0x10062fbfa: vmovaps xmm11, xmmword ptr [rbx + 0x20]
0x10062fbff: mov eax, esi
0x10062fc01: lea rcx, [rbp - 0xbd8]
0x10062fc08: vxorps xmm13, xmm13, xmm13
0x10062fc0d: vxorps xmm4, xmm4, xmm4
0x10062fc11: vxorps xmm9, xmm9, xmm9
0x10062fc16: vxorps xmm6, xmm6, xmm6
0x10062fc1a: vxorps xmm8, xmm8, xmm8
0x10062fc1f: nop 
0x10062fc20: vmovaps xmm1, xmmword ptr [rcx - 0x58]
0x10062fc25: vsubps xmm7, xmm11, xmm1
0x10062fc29: vmulps xmm0, xmm7, xmm7
0x10062fc2d: vmovshdup xmm5, xmm0
0x10062fc31: vaddss xmm5, xmm0, xmm5
0x10062fc35: vpermilpd xmm0, xmm0, 1
0x10062fc3b: vaddss xmm0, xmm0, xmm5
0x10062fc3f: vucomiss xmm0, xmm3
0x10062fc43: jbe 0x10062fc6a
0x10062fc45: vucomiss xmm10, xmm0
0x10062fc49: jbe 0x10062fc6a
0x10062fc4b: vmovss xmm5, dword ptr [rcx]
0x10062fc4f: vpermilps xmm2, xmm5, 0
0x10062fc55: vmulps xmm1, xmm1, xmm2
0x10062fc59: vaddps xmm13, xmm13, xmm1
0x10062fc5d: vmulps xmm1, xmm2, xmmword ptr [rcx - 0x18]
0x10062fc62: vaddps xmm6, xmm6, xmm1
0x10062fc66: vaddss xmm4, xmm4, xmm5
0x10062fc6a: vucomiss xmm0, xmm3
0x10062fc6e: jbe 0x10062fca4
0x10062fc70: vmovss xmm1, dword ptr [rbx + 0x70]
0x10062fc75: vaddss xmm1, xmm1, dword ptr [rcx - 8]
0x10062fc7a: vmulss xmm1, xmm1, xmm1
0x10062fc7e: vucomiss xmm1, xmm0
0x10062fc82: jbe 0x10062fca4
0x10062fc84: vpermilps xmm0, xmm0, 0xc0
0x10062fc8a: vdivps xmm0, xmm7, xmm0
0x10062fc8e: vmovss xmm1, dword ptr [rcx]
0x10062fc92: vpermilps xmm2, xmm1, 0
0x10062fc98: vmulps xmm0, xmm0, xmm2
0x10062fc9c: vaddps xmm8, xmm8, xmm0
0x10062fca0: vaddss xmm9, xmm9, xmm1
0x10062fca4: add rcx, 0x60
0x10062fca8: dec rax
0x10062fcab: jne 0x10062fc20
0x10062fcb1: vxorps xmm2, xmm2, xmm2
0x10062fcb5: vxorps xmm5, xmm5, xmm5
0x10062fcb9: vucomiss xmm4, xmm5
0x10062fcbd: jbe 0x10062fd43
0x10062fcc3: vpermilps xmm0, xmm4, 0xc0
0x10062fcc9: vdivps xmm1, xmm13, xmm0
0x10062fccd: vdivps xmm0, xmm6, xmm0
0x10062fcd1: vsubps xmm2, xmm1, xmm11
0x10062fcd6: vmulps xmm1, xmm2, xmm2
0x10062fcda: vmovshdup xmm3, xmm1
0x10062fcde: vaddss xmm3, xmm1, xmm3
0x10062fce2: vpermilpd xmm1, xmm1, 1
0x10062fce8: vaddss xmm1, xmm1, xmm3
0x10062fcec: vsqrtss xmm1, xmm1, xmm1
0x10062fcf0: vucomiss xmm1, dword ptr [rip + 0x477bcc] ; 0x100aa78c4
0x10062fcf8: jbe 0x10062fd04
0x10062fcfa: vpermilps xmm1, xmm1, 0xc0
0x10062fd00: vdivps xmm2, xmm2, xmm1
0x10062fd04: vbroadcastss xmm1, dword ptr [rbx + 0x74]
0x10062fd0a: vmulps xmm1, xmm2, xmm1
0x10062fd0e: vmovaps xmm2, xmmword ptr [rbx + 0x60]
0x10062fd13: vsubps xmm1, xmm1, xmm2
0x10062fd17: vsubps xmm0, xmm0, xmm2
0x10062fd1b: vpermilps xmm2, xmmword ptr [rbp - 0xd00], 0xc0
0x10062fd25: vmulps xmm1, xmm2, xmm1
0x10062fd29: vpermilps xmm2, xmmword ptr [rbp - 0xd10], 0xc0
0x10062fd33: vmulps xmm0, xmm2, xmm0
0x10062fd37: vaddps xmm0, xmm0, xmm1
0x10062fd3b: vxorps xmm1, xmm1, xmm1
0x10062fd3f: vaddps xmm2, xmm0, xmm1
0x10062fd43: vucomiss xmm9, xmm5
0x10062fd47: jbe 0x10062fd9d
0x10062fd49: vmulps xmm0, xmm8, xmm8
0x10062fd4e: vmovshdup xmm1, xmm0
0x10062fd52: vaddss xmm1, xmm0, xmm1
0x10062fd56: vpermilpd xmm0, xmm0, 1
0x10062fd5c: vaddss xmm0, xmm0, xmm1
0x10062fd60: vsqrtss xmm0, xmm0, xmm0
0x10062fd64: vucomiss xmm0, dword ptr [rip + 0x477b58] ; 0x100aa78c4
0x10062fd6c: jbe 0x10062fd78
0x10062fd6e: vpermilps xmm0, xmm0, 0xc0
0x10062fd74: vdivps xmm8, xmm8, xmm0
0x10062fd78: vmovaps xmm1, xmmword ptr [rbp - 0xcf0]
0x10062fd80: vbroadcastss xmm0, dword ptr [rbx + 0x74]
0x10062fd86: vmulps xmm0, xmm8, xmm0
0x10062fd8a: vsubps xmm0, xmm0, xmmword ptr [rbx + 0x60]
0x10062fd8f: vpermilps xmm1, xmm1, 0xc0
0x10062fd95: vmulps xmm0, xmm1, xmm0
0x10062fd99: vaddps xmm2, xmm2, xmm0
0x10062fd9d: vmovaps xmmword ptr [rbp - 0xcd0], xmm2
0x10062fda5: vpermilps xmm0, xmm12, 0xc0
0x10062fdab: vmulps xmm0, xmm0, xmmword ptr [rbp - 0xcd0]
0x10062fdb3: vaddps xmm0, xmm0, xmmword ptr [rbx]
0x10062fdb7: vmovaps xmmword ptr [rbx], xmm0
0x10062fdbb: mov rax, qword ptr [rip + 0x5ddb16] ; 0x100c0d8d8
0x10062fdc2: mov rax, qword ptr [rax]
0x10062fdc5: cmp rax, qword ptr [rbp - 0x30]
0x10062fdc9: jne 0x10062fddd
0x10062fdcb: add rsp, 0xce8
0x10062fdd2: pop rbx
0x10062fdd3: pop r12
0x10062fdd5: pop r13
0x10062fdd7: pop r14
0x10062fdd9: pop r15
0x10062fddb: pop rbp
0x10062fddc: ret 
0x10062fddd: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10062fde2: lea rdi, [rip + 0x5678b8] ; 0x100b976a1 m_accum
0x10062fde9: lea rsi, [rip + 0x5678b9] ; 0x100b976a9 SteeringBehaviors.cpp
0x10062fdf0: mov edx, 0x258
0x10062fdf5: mov ecx, 3
0x10062fdfa: call 0x1007e5f70 ; 0x1007e5f70
0x10062fdff: ud2 
0x10062fe01: nop word ptr cs:[rax + rax]
