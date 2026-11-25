0x10034d360: push rbp
0x10034d361: mov rbp, rsp
0x10034d364: push r15
0x10034d366: push r14
0x10034d368: push r13
0x10034d36a: push r12
0x10034d36c: push rbx
0x10034d36d: sub rsp, 0xe8
0x10034d374: mov r14, rdi
0x10034d377: cmp dword ptr [r14 + 0x10], 2
0x10034d37c: jb 0x10034d5a4
0x10034d382: test dl, dl
0x10034d384: je 0x10034d5a1
0x10034d38a: cmp byte ptr [r14], 0
0x10034d38e: je 0x10034d5b6
0x10034d394: mov byte ptr [r14], dl
0x10034d397: lea rbx, [r14 + 0x30]
0x10034d39b: lea rsi, [r14 + 0x40]
0x10034d39f: mov rdi, qword ptr [rsi]
0x10034d3a2: call 0x100098b20 ; 0x100098b20
0x10034d3a7: lea rdi, [rbp - 0xb0]
0x10034d3ae: mov rsi, rax
0x10034d3b1: call 0x1007f26e0 ; 0x1007f26e0
0x10034d3b6: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x10034d3be: vmovaps xmm1, xmmword ptr [rbp - 0xa0]
0x10034d3c6: vmovaps xmm2, xmmword ptr [rbp - 0x90]
0x10034d3ce: vmovaps xmmword ptr [rbp - 0xe0], xmm0
0x10034d3d6: vmovaps xmmword ptr [rbp - 0xd0], xmm1
0x10034d3de: vmovaps xmmword ptr [rbp - 0xc0], xmm2
0x10034d3e6: lea rdi, [rbp - 0x70]
0x10034d3ea: lea rsi, [rbp - 0xe0]
0x10034d3f1: call 0x100789e80 ; 0x100789e80
0x10034d3f6: vmovaps xmm0, xmmword ptr [rbx]
0x10034d3fa: vmovaps xmm1, xmmword ptr [rbp - 0x70]
0x10034d3ff: vsubss xmm2, xmm0, xmm1
0x10034d403: vmovaps xmm5, xmmword ptr [rip + 0x75a505] ; 0x100aa7910
0x10034d40b: vandps xmm2, xmm2, xmm5
0x10034d40f: vandps xmm3, xmm0, xmm5
0x10034d413: vandps xmm4, xmm1, xmm5
0x10034d417: vmaxss xmm3, xmm3, xmm4
0x10034d41b: vmulss xmm3, xmm3, dword ptr [rip + 0x75b18d] ; 0x100aa85b0
0x10034d423: vucomiss xmm3, xmm2
0x10034d427: jb 0x10034d485
0x10034d429: vmovshdup xmm2, xmm0
0x10034d42d: vmovshdup xmm3, xmm1
0x10034d431: vsubss xmm4, xmm2, xmm3
0x10034d435: vandps xmm4, xmm4, xmm5
0x10034d439: vandps xmm2, xmm2, xmm5
0x10034d43d: vandps xmm3, xmm3, xmm5
0x10034d441: vmaxss xmm2, xmm2, xmm3
0x10034d445: vmulss xmm2, xmm2, dword ptr [rip + 0x75b163] ; 0x100aa85b0
0x10034d44d: vucomiss xmm2, xmm4
0x10034d451: jb 0x10034d485
0x10034d453: vpermilpd xmm0, xmm0, 1
0x10034d459: vpermilpd xmm1, xmm1, 1
0x10034d45f: vsubss xmm2, xmm0, xmm1
0x10034d463: vandps xmm2, xmm2, xmm5
0x10034d467: vandps xmm0, xmm0, xmm5
0x10034d46b: vandps xmm1, xmm1, xmm5
0x10034d46f: vmaxss xmm0, xmm0, xmm1
0x10034d473: vmulss xmm0, xmm0, dword ptr [rip + 0x75b135] ; 0x100aa85b0
0x10034d47b: vucomiss xmm0, xmm2
0x10034d47f: jae 0x10034dd8c
0x10034d485: mov r13d, dword ptr [r14 + 0x10]
0x10034d489: test r13, r13
0x10034d48c: je 0x10034d506
0x10034d48e: mov rbx, qword ptr [r14 + 8]
0x10034d492: mov dword ptr [rbx + 0x20], 0
0x10034d499: cmp r13d, 1
0x10034d49d: je 0x10034d506
0x10034d49f: add rbx, 0x58
0x10034d4a3: mov r12d, 1
0x10034d4a9: lea r15, [rbp - 0xe0]
0x10034d4b0: mov rsi, qword ptr [rbx - 0x30]
0x10034d4b4: lea rdi, [rbp - 0xb0]
0x10034d4bb: call 0x1007f26b0 ; 0x1007f26b0
0x10034d4c0: mov rsi, qword ptr [rbx]
0x10034d4c3: mov rdi, r15
0x10034d4c6: call 0x1007f26b0 ; 0x1007f26b0
0x10034d4cb: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x10034d4d3: vsubps xmm0, xmm0, xmmword ptr [rbp - 0xe0]
0x10034d4db: vmulps xmm0, xmm0, xmm0
0x10034d4df: vmovshdup xmm1, xmm0
0x10034d4e3: vaddss xmm1, xmm0, xmm1
0x10034d4e7: vpermilpd xmm0, xmm0, 1
0x10034d4ed: vaddss xmm0, xmm0, xmm1
0x10034d4f1: vsqrtss xmm0, xmm0, xmm0
0x10034d4f5: vmovss dword ptr [rbx - 8], xmm0
0x10034d4fa: inc r12
0x10034d4fd: add rbx, 0x30
0x10034d501: cmp r12, r13
0x10034d504: jb 0x10034d4b0
0x10034d506: mov rdi, qword ptr [r14 + 0x40]
0x10034d50a: call 0x100098b20 ; 0x100098b20
0x10034d50f: lea rdi, [rbp - 0xb0]
0x10034d516: mov rsi, rax
0x10034d519: call 0x1007f26e0 ; 0x1007f26e0
0x10034d51e: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x10034d526: vmovaps xmm1, xmmword ptr [rbp - 0xa0]
0x10034d52e: vmovaps xmm2, xmmword ptr [rbp - 0x90]
0x10034d536: vmovaps xmmword ptr [rbp - 0xe0], xmm0
0x10034d53e: vmovaps xmmword ptr [rbp - 0xd0], xmm1
0x10034d546: vmovaps xmmword ptr [rbp - 0xc0], xmm2
0x10034d54e: lea rdi, [rbp - 0x70]
0x10034d552: lea rsi, [rbp - 0xe0]
0x10034d559: call 0x100789e80 ; 0x100789e80
0x10034d55e: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10034d563: vmovaps xmmword ptr [r14 + 0x30], xmm0
0x10034d569: mov rax, qword ptr [r14 + 8]
0x10034d56d: mov edx, dword ptr [r14 + 0x10]
0x10034d571: test rdx, rdx
0x10034d574: je 0x10034d698
0x10034d57a: lea rsi, [rdx - 1]
0x10034d57e: mov ecx, edx
0x10034d580: and ecx, 3
0x10034d583: cmp rsi, 3
0x10034d587: jae 0x10034d69e
0x10034d58d: vxorps xmm0, xmm0, xmm0
0x10034d591: xor esi, esi
0x10034d593: test rcx, rcx
0x10034d596: jne 0x10034d6db
0x10034d59c: jmp 0x10034d6fd ; 0x10034d6fd
0x10034d5a1: mov byte ptr [r14], dl
0x10034d5a4: add rsp, 0xe8
0x10034d5ab: pop rbx
0x10034d5ac: pop r12
0x10034d5ae: pop r13
0x10034d5b0: pop r14
0x10034d5b2: pop r15
0x10034d5b4: pop rbp
0x10034d5b5: ret 
0x10034d5b6: mov dword ptr [rbp - 0x3c], edx
0x10034d5b9: mov rax, qword ptr [r14 + 8]
0x10034d5bd: mov qword ptr [rbp - 0x58], rax
0x10034d5c1: mov r12, qword ptr [r14 + 0x40]
0x10034d5c5: mov rdi, r12
0x10034d5c8: call 0x100093d60 ; 0x100093d60
0x10034d5cd: xor r13d, r13d
0x10034d5d0: mov r15d, 0
0x10034d5d6: test eax, eax
0x10034d5d8: je 0x10034d60f
0x10034d5da: xor ebx, ebx
0x10034d5dc: xor r15d, r15d
0x10034d5df: nop 
0x10034d5e0: mov rdi, r12
0x10034d5e3: mov esi, ebx
0x10034d5e5: call 0x10009e070 ; 0x10009e070
0x10034d5ea: mov rdi, rax
0x10034d5ed: lea rsi, [rip + 0x834494] ; 0x100b81a88 _Sim
0x10034d5f4: call 0x100aa2cae ; 0x100aa2cae _strstr
0x10034d5f9: cmp rax, 1
0x10034d5fd: sbb r15d, -1
0x10034d601: inc ebx
0x10034d603: mov rdi, r12
0x10034d606: call 0x100093d60 ; 0x100093d60
0x10034d60b: cmp ebx, eax
0x10034d60d: jb 0x10034d5e0
0x10034d60f: lea rax, [r14 + 0x40]
0x10034d613: mov qword ptr [rbp - 0x50], rax
0x10034d617: call 0x1007c6c20 ; 0x1007c6c20
0x10034d61c: mov esi, r15d
0x10034d61f: shl rsi, 3
0x10034d623: lea rcx, [rip + 0x1cfb526] ; 0x102048b50
0x10034d62a: mov rdx, qword ptr [rcx]
0x10034d62d: mov ecx, 8
0x10034d632: mov rdi, rax
0x10034d635: call 0x100795530 ; 0x100795530
0x10034d63a: mov qword ptr [rbp - 0x30], rax
0x10034d63e: lea r15, [rip + 0x834443] ; 0x100b81a88 _Sim
0x10034d645: xor ebx, ebx
0x10034d647: jmp 0x10034d653 ; 0x10034d653
0x10034d649: nop dword ptr [rax]
0x10034d650: inc r13d
0x10034d653: mov rdi, r12
0x10034d656: call 0x100093d60 ; 0x100093d60
0x10034d65b: cmp r13d, eax
0x10034d65e: jae 0x10034dcf7
0x10034d664: mov rdi, r12
0x10034d667: mov esi, r13d
0x10034d66a: call 0x10009e070 ; 0x10009e070
0x10034d66f: mov rdi, rax
0x10034d672: mov rsi, r15
0x10034d675: call 0x100aa2cae ; 0x100aa2cae _strstr
0x10034d67a: test rax, rax
0x10034d67d: je 0x10034d650
0x10034d67f: mov rdi, r12
0x10034d682: mov esi, r13d
0x10034d685: call 0x10009e090 ; 0x10009e090
0x10034d68a: mov ecx, ebx
0x10034d68c: inc ebx
0x10034d68e: mov rdx, qword ptr [rbp - 0x30]
0x10034d692: mov qword ptr [rdx + rcx*8], rax
0x10034d696: jmp 0x10034d650 ; 0x10034d650
0x10034d698: vxorps xmm0, xmm0, xmm0
0x10034d69c: jmp 0x10034d6fd ; 0x10034d6fd
0x10034d69e: sub rdx, rcx
0x10034d6a1: lea rdi, [rax + 0xb0]
0x10034d6a8: vxorps xmm0, xmm0, xmm0
0x10034d6ac: xor esi, esi
0x10034d6ae: nop 
0x10034d6b0: vaddss xmm0, xmm0, dword ptr [rdi - 0x90]
0x10034d6b8: vaddss xmm0, xmm0, dword ptr [rdi - 0x60]
0x10034d6bd: vaddss xmm0, xmm0, dword ptr [rdi - 0x30]
0x10034d6c2: vaddss xmm0, xmm0, dword ptr [rdi]
0x10034d6c6: add rsi, 4
0x10034d6ca: add rdi, 0xc0
0x10034d6d1: cmp rdx, rsi
0x10034d6d4: jne 0x10034d6b0
0x10034d6d6: test rcx, rcx
0x10034d6d9: je 0x10034d6fd
0x10034d6db: lea rdx, [rsi + rsi*2]
0x10034d6df: shl rdx, 4
0x10034d6e3: lea rdx, [rax + rdx + 0x20]
0x10034d6e8: neg rcx
0x10034d6eb: nop dword ptr [rax + rax]
0x10034d6f0: vaddss xmm0, xmm0, dword ptr [rdx]
0x10034d6f4: add rdx, 0x30
0x10034d6f8: inc rcx
0x10034d6fb: jne 0x10034d6f0
0x10034d6fd: lea r13, [r14 + 8]
0x10034d701: vmovss dword ptr [r14 + 0x28], xmm0
0x10034d707: mov rsi, qword ptr [rax + 0x28]
0x10034d70b: lea rdi, [rbp - 0xb0]
0x10034d712: call 0x1007f26b0 ; 0x1007f26b0
0x10034d717: mov rax, qword ptr [r13]
0x10034d71b: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x10034d723: vmovaps xmmword ptr [rax], xmm0
0x10034d727: mov r12, qword ptr [r14 + 8]
0x10034d72b: mov rbx, qword ptr [r14 + 0x18]
0x10034d72f: vmovss xmm0, dword ptr [r14 + 0x28]
0x10034d735: vmulss xmm0, xmm0, dword ptr [rip + 0x75aec3] ; 0x100aa8600
0x10034d73d: vmulss xmm0, xmm0, dword ptr [rip + 0x75ba97] ; 0x100aa91dc
0x10034d745: vmulss xmm0, xmm0, dword ptr [rip + 0x76f593] ; 0x100abcce0
0x10034d74d: vmovaps xmm1, xmmword ptr [rbx]
0x10034d751: vsubps xmm1, xmm1, xmmword ptr [r12]
0x10034d757: vmulps xmm1, xmm1, xmm1
0x10034d75b: vmovshdup xmm2, xmm1
0x10034d75f: vaddss xmm2, xmm1, xmm2
0x10034d763: vpermilpd xmm1, xmm1, 1
0x10034d769: vaddss xmm1, xmm1, xmm2
0x10034d76d: vmulss xmm0, xmm0, xmm0
0x10034d771: vucomiss xmm1, xmm0
0x10034d775: jbe 0x10034d7c5
0x10034d777: mov r15, qword ptr [r14 + 0x20]
0x10034d77b: lea rdi, [rbx + 0x10]
0x10034d77f: mov edx, 0x7f0
0x10034d784: mov rsi, rbx
0x10034d787: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x10034d78c: lea rdi, [r15 + 0x10]
0x10034d790: mov edx, 0x7f0
0x10034d795: mov rsi, r15
0x10034d798: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x10034d79d: vmovaps xmm0, xmmword ptr [r12]
0x10034d7a3: vmovaps xmmword ptr [rbx], xmm0
0x10034d7a7: mov rsi, qword ptr [r12 + 0x28]
0x10034d7ac: lea rdi, [rbp - 0xb0]
0x10034d7b3: call 0x1007f3b70 ; 0x1007f3b70
0x10034d7b8: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x10034d7c0: vmovaps xmmword ptr [r15], xmm0
0x10034d7c5: mov ebx, dword ptr [r14 + 0x10]
0x10034d7c9: call 0x1007c6c20 ; 0x1007c6c20
0x10034d7ce: shl rbx, 4
0x10034d7d2: lea rcx, [rip + 0x1cfb377] ; 0x102048b50
0x10034d7d9: mov rdx, qword ptr [rcx]
0x10034d7dc: mov ecx, 0x10
0x10034d7e1: mov rdi, rax
0x10034d7e4: mov rsi, rbx
0x10034d7e7: call 0x100795530 ; 0x100795530
0x10034d7ec: mov r10, rax
0x10034d7ef: mov rax, qword ptr [r13]
0x10034d7f3: vmovaps xmm0, xmmword ptr [rax]
0x10034d7f7: vmovaps xmmword ptr [r10], xmm0
0x10034d7fc: mov edi, dword ptr [r14 + 0x10]
0x10034d800: cmp edi, 2
0x10034d803: mov qword ptr [rbp - 0x30], r10
0x10034d807: jb 0x10034d9a0
0x10034d80d: mov ecx, 1
0x10034d812: xor r8d, r8d
0x10034d815: vmovss xmm1, dword ptr [rip + 0x75a09b] ; 0x100aa78b8
0x10034d81d: vmovss xmm8, dword ptr [rip + 0x75a09f] ; 0x100aa78c4
0x10034d825: vmovaps xmm2, xmmword ptr [rip + 0x75a0e3] ; 0x100aa7910
0x10034d82d: nop dword ptr [rax]
0x10034d830: mov edx, 0x80
0x10034d835: sub edx, r8d
0x10034d838: je 0x10034e0df
0x10034d83e: mov eax, ecx
0x10034d840: lea rsi, [rax + rax*2]
0x10034d844: shl rax, 4
0x10034d848: add rax, r10
0x10034d84b: shl rsi, 4
0x10034d84f: mov rdi, qword ptr [r14 + 8]
0x10034d853: mov r9, qword ptr [r14 + 0x18]
0x10034d857: vmovss xmm3, dword ptr [rdi + rsi + 0x20]
0x10034d85d: mov ebx, r8d
0x10034d860: shl rbx, 4
0x10034d864: add rbx, r9
0x10034d867: mov edi, edx
0x10034d869: xor edx, edx
0x10034d86b: vxorps xmm5, xmm5, xmm5
0x10034d86f: xor esi, esi
0x10034d871: vmovaps xmm4, xmm1
0x10034d875: nop word ptr cs:[rax + rax]
0x10034d880: vmovaps xmm6, xmmword ptr [rbx]
0x10034d884: vsubps xmm6, xmm6, xmm0
0x10034d888: vmulps xmm6, xmm6, xmm6
0x10034d88c: vmovshdup xmm7, xmm6
0x10034d890: vaddss xmm7, xmm6, xmm7
0x10034d894: vpermilpd xmm6, xmm6, 1
0x10034d89a: vaddss xmm6, xmm6, xmm7
0x10034d89e: vucomiss xmm3, xmm5
0x10034d8a2: vsqrtss xmm5, xmm6, xmm6
0x10034d8a6: jbe 0x10034d8b3
0x10034d8a8: test rdx, rdx
0x10034d8ab: je 0x10034d8b3
0x10034d8ad: vucomiss xmm5, xmm3
0x10034d8b1: ja 0x10034d8e0
0x10034d8b3: vsubss xmm6, xmm5, xmm3
0x10034d8b7: vandps xmm6, xmm6, xmm2
0x10034d8bb: vucomiss xmm4, xmm6
0x10034d8bf: cmova esi, edx
0x10034d8c2: vminss xmm4, xmm6, xmm4
0x10034d8c6: inc rdx
0x10034d8c9: add rbx, 0x10
0x10034d8cd: cmp rdx, rdi
0x10034d8d0: jb 0x10034d880
0x10034d8d2: jmp 0x10034d8e2 ; 0x10034d8e2
0x10034d8d4: nop word ptr cs:[rax + rax]
0x10034d8e0: mov esi, edx
0x10034d8e2: add esi, r8d
0x10034d8e5: mov rdx, rsi
0x10034d8e8: shl rdx, 4
0x10034d8ec: vmovaps xmm4, xmmword ptr [r9 + rdx]
0x10034d8f2: vmovaps xmmword ptr [rax], xmm4
0x10034d8f6: vsubps xmm4, xmm4, xmm0
0x10034d8fa: vmulps xmm5, xmm4, xmm4
0x10034d8fe: vmovshdup xmm6, xmm5
0x10034d902: vaddss xmm6, xmm5, xmm6
0x10034d906: vpermilpd xmm5, xmm5, 1
0x10034d90c: vaddss xmm5, xmm5, xmm6
0x10034d910: vsqrtss xmm5, xmm5, xmm5
0x10034d914: vucomiss xmm5, xmm8
0x10034d919: jbe 0x10034d925
0x10034d91b: vpermilps xmm5, xmm5, 0xc0
0x10034d921: vdivps xmm4, xmm4, xmm5
0x10034d925: vpermilps xmm3, xmm3, 0xc0
0x10034d92b: vmulps xmm3, xmm3, xmm4
0x10034d92f: vaddps xmm0, xmm0, xmm3
0x10034d933: vmovaps xmmword ptr [rax], xmm0
0x10034d937: inc ecx
0x10034d939: mov edi, dword ptr [r14 + 0x10]
0x10034d93d: mov r8d, esi
0x10034d940: cmp ecx, edi
0x10034d942: jb 0x10034d830
0x10034d948: cmp edi, 2
0x10034d94b: jb 0x10034d9a0
0x10034d94d: mov eax, 1
0x10034d952: vmovaps xmm0, xmmword ptr [rip + 0x75b366] ; 0x100aa8cc0 333?333?333?
0x10034d95a: vmovaps xmm1, xmmword ptr [rip + 0x75c6ee] ; 0x100aaa050
0x10034d962: nop word ptr cs:[rax + rax]
0x10034d970: mov rcx, qword ptr [r14 + 8]
0x10034d974: mov edx, eax
0x10034d976: lea rsi, [rdx + rdx*2]
0x10034d97a: shl rsi, 4
0x10034d97e: shl rdx, 4
0x10034d982: vmulps xmm2, xmm0, xmmword ptr [rcx + rsi]
0x10034d987: vmulps xmm3, xmm1, xmmword ptr [r10 + rdx]
0x10034d98d: vaddps xmm2, xmm2, xmm3
0x10034d991: vmovaps xmmword ptr [rcx + rsi], xmm2
0x10034d996: inc eax
0x10034d998: mov edi, dword ptr [r14 + 0x10]
0x10034d99c: cmp eax, edi
0x10034d99e: jb 0x10034d970
0x10034d9a0: xor r8d, r8d
0x10034d9a3: vmovss xmm6, dword ptr [rip + 0x759f19] ; 0x100aa78c4
0x10034d9ab: vmovaps xmm0, xmmword ptr [rip + 0x759cbd] ; 0x100aa7670
0x10034d9b3: nop word ptr cs:[rax + rax]
0x10034d9c0: cmp edi, 2
0x10034d9c3: jb 0x10034da61
0x10034d9c9: xor ecx, ecx
0x10034d9cb: nop dword ptr [rax + rax]
0x10034d9d0: lea edx, [rcx + 1]
0x10034d9d3: mov rsi, qword ptr [r13]
0x10034d9d7: mov eax, ecx
0x10034d9d9: lea rdi, [rax + rax*2]
0x10034d9dd: shl rdi, 4
0x10034d9e1: lea rbx, [rdx + rdx*2]
0x10034d9e5: shl rbx, 4
0x10034d9e9: vmovaps xmm2, xmmword ptr [rsi + rdi]
0x10034d9ee: vmovaps xmm1, xmmword ptr [rsi + rbx]
0x10034d9f3: vsubps xmm3, xmm2, xmm1
0x10034d9f7: vmulps xmm4, xmm3, xmm3
0x10034d9fb: vmovshdup xmm5, xmm4
0x10034d9ff: vaddss xmm5, xmm4, xmm5
0x10034da03: vpermilpd xmm4, xmm4, 1
0x10034da09: vaddss xmm4, xmm4, xmm5
0x10034da0d: vsqrtss xmm4, xmm4, xmm4
0x10034da11: vucomiss xmm4, xmm6
0x10034da15: jbe 0x10034da21
0x10034da17: vpermilps xmm5, xmm4, 0xc0
0x10034da1d: vdivps xmm3, xmm3, xmm5
0x10034da21: lea rax, [rsi + rbx]
0x10034da25: vsubss xmm4, xmm4, dword ptr [rsi + rbx + 0x20]
0x10034da2b: vpermilps xmm4, xmm4, 0xc0
0x10034da31: vmulps xmm3, xmm3, xmm4
0x10034da35: test ecx, ecx
0x10034da37: je 0x10034da48
0x10034da39: add rsi, rdi
0x10034da3c: vmulps xmm3, xmm3, xmm0
0x10034da40: vsubps xmm2, xmm2, xmm3
0x10034da44: vmovaps xmmword ptr [rsi], xmm2
0x10034da48: vaddps xmm1, xmm1, xmm3
0x10034da4c: vmovaps xmmword ptr [rax], xmm1
0x10034da50: mov edi, dword ptr [r14 + 0x10]
0x10034da54: add ecx, 2
0x10034da57: cmp ecx, edi
0x10034da59: mov ecx, edx
0x10034da5b: jb 0x10034d9d0
0x10034da61: inc r8d
0x10034da64: cmp r8d, 0xa
0x10034da68: jne 0x10034d9c0
0x10034da6e: cmp edi, 2
0x10034da71: jb 0x10034daf7
0x10034da77: mov eax, 1
0x10034da7c: nop dword ptr [rax]
0x10034da80: mov rdx, qword ptr [r13]
0x10034da84: lea ecx, [rax - 1]
0x10034da87: mov esi, eax
0x10034da89: lea rdi, [rcx + rcx*2]
0x10034da8d: shl rdi, 4
0x10034da91: lea rsi, [rsi + rsi*2]
0x10034da95: shl rsi, 4
0x10034da99: lea rcx, [rdx + rsi]
0x10034da9d: vmovss xmm0, dword ptr [rdx + rsi + 0x20]
0x10034daa3: vmovaps xmm2, xmmword ptr [rdx + rsi]
0x10034daa8: vmovaps xmm1, xmmword ptr [rdx + rdi]
0x10034daad: vsubps xmm2, xmm2, xmm1
0x10034dab1: vmulps xmm3, xmm2, xmm2
0x10034dab5: vmovshdup xmm4, xmm3
0x10034dab9: vaddss xmm4, xmm3, xmm4
0x10034dabd: vpermilpd xmm3, xmm3, 1
0x10034dac3: vaddss xmm3, xmm3, xmm4
0x10034dac7: vsqrtss xmm3, xmm3, xmm3
0x10034dacb: vucomiss xmm3, xmm6
0x10034dacf: jbe 0x10034dadb
0x10034dad1: vpermilps xmm3, xmm3, 0xc0
0x10034dad7: vdivps xmm2, xmm2, xmm3
0x10034dadb: vpermilps xmm0, xmm0, 0xc0
0x10034dae1: vmulps xmm0, xmm0, xmm2
0x10034dae5: vaddps xmm0, xmm1, xmm0
0x10034dae9: vmovaps xmmword ptr [rcx], xmm0
0x10034daed: inc eax
0x10034daef: mov edi, dword ptr [r14 + 0x10]
0x10034daf3: cmp eax, edi
0x10034daf5: jb 0x10034da80
0x10034daf7: mov ecx, 1
0x10034dafc: cmp edi, 1
0x10034daff: je 0x10034dbaf
0x10034db05: xor ebx, ebx
0x10034db07: lea r15, [rbp - 0x110]
0x10034db0e: lea r12, [rbp - 0x100]
0x10034db15: nop word ptr cs:[rax + rax]
0x10034db20: mov rax, qword ptr [r13]
0x10034db24: mov ecx, ebx
0x10034db26: inc ebx
0x10034db28: lea rdx, [rbx + rbx*2]
0x10034db2c: shl rdx, 4
0x10034db30: mov rsi, qword ptr [rax + rdx + 0x28]
0x10034db35: vmovaps xmm0, xmmword ptr [rsi]
0x10034db39: vmulps xmm1, xmm0, xmm0
0x10034db3d: vmovshdup xmm2, xmm1
0x10034db41: vaddss xmm2, xmm1, xmm2
0x10034db45: vpermilpd xmm1, xmm1, 1
0x10034db4b: vaddss xmm1, xmm1, xmm2
0x10034db4f: vsqrtss xmm1, xmm1, xmm1
0x10034db53: vucomiss xmm1, xmm6
0x10034db57: jbe 0x10034db63
0x10034db59: vpermilps xmm1, xmm1, 0xc0
0x10034db5f: vdivps xmm0, xmm0, xmm1
0x10034db63: lea rcx, [rcx + rcx*2]
0x10034db67: shl rcx, 4
0x10034db6b: mov rdi, qword ptr [rax + rcx + 0x28]
0x10034db70: vmovaps xmm1, xmmword ptr [rax + rdx]
0x10034db75: vmovaps xmmword ptr [rbp - 0x110], xmm1
0x10034db7d: vmovaps xmmword ptr [rbp - 0x100], xmm0
0x10034db85: mov rsi, r15
0x10034db88: mov rdx, r12
0x10034db8b: vmovss xmm0, dword ptr [rip + 0x75752d] ; 0x100aa50c0
0x10034db93: call 0x1007f3180 ; 0x1007f3180
0x10034db98: mov ecx, dword ptr [r14 + 0x10]
0x10034db9c: lea eax, [rcx - 1]
0x10034db9f: cmp ebx, eax
0x10034dba1: vmovss xmm6, dword ptr [rip + 0x759d1b] ; 0x100aa78c4
0x10034dba9: jb 0x10034db20
0x10034dbaf: cmp byte ptr [rip + 0x1aa86b2], 0 ; 0x101df6268
0x10034dbb6: je 0x10034dc02
0x10034dbb8: cmp ecx, 1
0x10034dbbb: jne 0x10034dc18
0x10034dbbd: xor r12d, r12d
0x10034dbc0: lea r15, [rip + 0x1cf1a49] ; 0x10203f610
0x10034dbc7: xor r13d, r13d
0x10034dbca: nop word ptr [rax + rax]
0x10034dbd0: mov rbx, qword ptr [r14 + 0x18]
0x10034dbd4: call 0x1002b9810 ; 0x1002b9810
0x10034dbd9: lea rdx, [rbx + r12 + 0x10]
0x10034dbde: add rbx, r12
0x10034dbe1: mov r8d, 1
0x10034dbe7: mov rdi, rax
0x10034dbea: mov rsi, rbx
0x10034dbed: mov rcx, r15
0x10034dbf0: call 0x1002b9d50 ; 0x1002b9d50
0x10034dbf5: inc r13
0x10034dbf8: add r12, 0x10
0x10034dbfc: cmp r13, 0x7f
0x10034dc00: jb 0x10034dbd0
0x10034dc02: call 0x1007c6c20 ; 0x1007c6c20
0x10034dc07: mov rdi, rax
0x10034dc0a: mov rsi, qword ptr [rbp - 0x30]
0x10034dc0e: call 0x100795a70 ; 0x100795a70
0x10034dc13: jmp 0x10034d5a4 ; 0x10034d5a4
0x10034dc18: xor eax, eax
0x10034dc1a: mov qword ptr [rbp - 0x38], rax
0x10034dc1e: mov rbx, qword ptr [r13]
0x10034dc22: call 0x1002b9810 ; 0x1002b9810
0x10034dc27: mov rcx, qword ptr [rbp - 0x38]
0x10034dc2b: lea ecx, [rcx + 1]
0x10034dc2e: mov qword ptr [rbp - 0x48], rcx
0x10034dc32: lea r15, [rcx + rcx*2]
0x10034dc36: shl r15, 4
0x10034dc3a: add r15, rbx
0x10034dc3d: mov ecx, 1
0x10034dc42: mov rdi, rax
0x10034dc45: mov rsi, r15
0x10034dc48: vmovss xmm0, dword ptr [rip + 0x75a980] ; 0x100aa85d0
0x10034dc50: lea rdx, [rip + 0x1cf19b9] ; 0x10203f610
0x10034dc57: call 0x1002bb510 ; 0x1002bb510
0x10034dc5c: call 0x1002b9810 ; 0x1002b9810
0x10034dc61: mov r12, qword ptr [rbp - 0x48]
0x10034dc65: shl r12, 4
0x10034dc69: add r12, qword ptr [rbp - 0x30]
0x10034dc6d: mov ecx, 1
0x10034dc72: mov rdi, rax
0x10034dc75: mov rsi, r12
0x10034dc78: vmovss xmm0, dword ptr [rip + 0x759b68] ; 0x100aa77e8
0x10034dc80: lea rdx, [rip + 0x1cf1a09] ; 0x10203f690
0x10034dc87: call 0x1002bb510 ; 0x1002bb510
0x10034dc8c: call 0x1002b9810 ; 0x1002b9810
0x10034dc91: mov r8d, 1
0x10034dc97: mov rdi, rax
0x10034dc9a: mov rsi, r15
0x10034dc9d: mov rdx, r12
0x10034dca0: lea rcx, [rip + 0x1cf19e9] ; 0x10203f690
0x10034dca7: call 0x1002b9d50 ; 0x1002b9d50
0x10034dcac: call 0x1002b9810 ; 0x1002b9810
0x10034dcb1: mov ecx, dword ptr [rbp - 0x38]
0x10034dcb4: lea rcx, [rcx + rcx*2]
0x10034dcb8: shl rcx, 4
0x10034dcbc: add rbx, rcx
0x10034dcbf: mov r8d, 1
0x10034dcc5: mov rdi, rax
0x10034dcc8: mov rsi, rbx
0x10034dccb: mov rdx, r15
0x10034dcce: lea rcx, [rip + 0x1cf195b] ; 0x10203f630
0x10034dcd5: call 0x1002b9d50 ; 0x1002b9d50
0x10034dcda: mov eax, dword ptr [r14 + 0x10]
0x10034dcde: dec eax
0x10034dce0: mov rcx, qword ptr [rbp - 0x48]
0x10034dce4: mov edx, ecx
0x10034dce6: mov qword ptr [rbp - 0x38], rdx
0x10034dcea: cmp ecx, eax
0x10034dcec: jb 0x10034dc1e
0x10034dcf2: jmp 0x10034dbbd ; 0x10034dbbd
0x10034dcf7: test ebx, ebx
0x10034dcf9: je 0x10034e0fe
0x10034dcff: mov ecx, ebx
0x10034dd01: lea r15, [rcx*8]
0x10034dd09: test r15, r15
0x10034dd0c: mov qword ptr [rbp - 0x38], rcx
0x10034dd10: je 0x10034dd99
0x10034dd16: mov rax, qword ptr [rbp - 0x30]
0x10034dd1a: lea r13, [rax + rcx*8]
0x10034dd1e: xor r12d, r12d
0x10034dd21: xor eax, eax
0x10034dd23: mov qword ptr [rbp - 0xe8], rax
0x10034dd2a: mov rax, qword ptr [rbp - 0x30]
0x10034dd2e: mov rdi, qword ptr [rax + r12*8]
0x10034dd32: mov qword ptr [rbp - 0x48], rdi
0x10034dd36: call 0x1007f2f10 ; 0x1007f2f10
0x10034dd3b: nop dword ptr [rax + rax]
0x10034dd40: test rax, rax
0x10034dd43: je 0x10034dd71
0x10034dd45: mov rdx, r15
0x10034dd48: mov rcx, qword ptr [rbp - 0x30]
0x10034dd4c: nop dword ptr [rax]
0x10034dd50: cmp qword ptr [rcx], rax
0x10034dd53: je 0x10034dd62
0x10034dd55: add rcx, 8
0x10034dd59: add rdx, -8
0x10034dd5d: jne 0x10034dd50
0x10034dd5f: mov rcx, r13
0x10034dd62: cmp r13, rcx
0x10034dd65: jne 0x10034dd77
0x10034dd67: mov rdi, rax
0x10034dd6a: call 0x1007f2f20 ; 0x1007f2f20
0x10034dd6f: jmp 0x10034dd40 ; 0x10034dd40
0x10034dd71: mov rcx, qword ptr [rbp - 0x48]
0x10034dd75: jmp 0x10034dd7e ; 0x10034dd7e
0x10034dd77: mov rcx, qword ptr [rbp - 0xe8]
0x10034dd7e: inc r12
0x10034dd81: mov rax, rcx
0x10034dd84: cmp r12, qword ptr [rbp - 0x38]
0x10034dd88: jb 0x10034dd23
0x10034dd8a: jmp 0x10034ddcb ; 0x10034ddcb
0x10034dd8c: lea r13, [r14 + 8]
0x10034dd90: mov rax, qword ptr [r14 + 8]
0x10034dd94: jmp 0x10034d707 ; 0x10034d707
0x10034dd99: xor r15d, r15d
0x10034dd9c: mov rax, qword ptr [rbp - 0x30]
0x10034dda0: mov rdi, qword ptr [rax + r15*8]
0x10034dda4: mov r12, rdi
0x10034dda7: call 0x1007f2f10 ; 0x1007f2f10
0x10034ddac: nop dword ptr [rax]
0x10034ddb0: test rax, rax
0x10034ddb3: je 0x10034ddbf
0x10034ddb5: mov rdi, rax
0x10034ddb8: call 0x1007f2f20 ; 0x1007f2f20
0x10034ddbd: jmp 0x10034ddb0 ; 0x10034ddb0
0x10034ddbf: inc r15
0x10034ddc2: cmp r15, qword ptr [rbp - 0x38]
0x10034ddc6: mov rcx, r12
0x10034ddc9: jb 0x10034dd9c
0x10034ddcb: test rcx, rcx
0x10034ddce: je 0x10034e0fe
0x10034ddd4: mov r12d, ebx
0x10034ddd7: dec r12d
0x10034ddda: js 0x10034de3f
0x10034dddc: movsxd rax, r12d
0x10034dddf: lea r13, [rax + rax*2]
0x10034dde3: shl r13, 4
0x10034dde7: add r13, qword ptr [rbp - 0x58]
0x10034ddeb: test rcx, rcx
0x10034ddee: je 0x10034e11d
0x10034ddf4: mov qword ptr [r13 + 0x28], rcx
0x10034ddf8: lea rdi, [rbp - 0xb0]
0x10034ddff: mov rsi, rcx
0x10034de02: mov r15, rcx
0x10034de05: call 0x1007f26b0 ; 0x1007f26b0
0x10034de0a: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x10034de12: vmovaps xmmword ptr [r13], xmm0
0x10034de18: mov rdi, r15
0x10034de1b: call 0x1007f2ea0 ; 0x1007f2ea0
0x10034de20: mov rcx, rax
0x10034de23: add r13, -0x30
0x10034de27: dec r12d
0x10034de2a: jns 0x10034ddeb
0x10034de2c: mov r13, qword ptr [rbp - 0x58]
0x10034de30: mov dword ptr [r13 + 0x20], 0
0x10034de38: cmp ebx, 1
0x10034de3b: jne 0x10034de4b
0x10034de3d: jmp 0x10034deb7 ; 0x10034deb7
0x10034de3f: mov r13, qword ptr [rbp - 0x58]
0x10034de43: mov dword ptr [r13 + 0x20], 0
0x10034de4b: add r13, 0x58
0x10034de4f: mov ebx, 1
0x10034de54: lea r15, [rbp - 0xb0]
0x10034de5b: lea r12, [rbp - 0xe0]
0x10034de62: mov rsi, qword ptr [r13 - 0x30]
0x10034de66: mov rdi, r15
0x10034de69: call 0x1007f26b0 ; 0x1007f26b0
0x10034de6e: mov rsi, qword ptr [r13]
0x10034de72: mov rdi, r12
0x10034de75: call 0x1007f26b0 ; 0x1007f26b0
0x10034de7a: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x10034de82: vsubps xmm0, xmm0, xmmword ptr [rbp - 0xe0]
0x10034de8a: vmulps xmm0, xmm0, xmm0
0x10034de8e: vmovshdup xmm1, xmm0
0x10034de92: vaddss xmm1, xmm0, xmm1
0x10034de96: vpermilpd xmm0, xmm0, 1
0x10034de9c: vaddss xmm0, xmm0, xmm1
0x10034dea0: vsqrtss xmm0, xmm0, xmm0
0x10034dea4: vmovss dword ptr [r13 - 8], xmm0
0x10034deaa: inc rbx
0x10034dead: add r13, 0x30
0x10034deb1: cmp rbx, qword ptr [rbp - 0x38]
0x10034deb5: jb 0x10034de62
0x10034deb7: call 0x1007c6c20 ; 0x1007c6c20
0x10034debc: mov rdi, rax
0x10034debf: mov rsi, qword ptr [rbp - 0x30]
0x10034dec3: call 0x100795a70 ; 0x100795a70
0x10034dec8: mov rdi, qword ptr [r14 + 0x40]
0x10034decc: call 0x100098b20 ; 0x100098b20
0x10034ded1: lea rdi, [rbp - 0xb0]
0x10034ded8: mov rsi, rax
0x10034dedb: call 0x1007f26e0 ; 0x1007f26e0
0x10034dee0: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x10034dee8: vmovaps xmm1, xmmword ptr [rbp - 0xa0]
0x10034def0: vmovaps xmm2, xmmword ptr [rbp - 0x90]
0x10034def8: vmovaps xmmword ptr [rbp - 0xe0], xmm0
0x10034df00: vmovaps xmmword ptr [rbp - 0xd0], xmm1
0x10034df08: vmovaps xmmword ptr [rbp - 0xc0], xmm2
0x10034df10: lea rdi, [rbp - 0x70]
0x10034df14: lea rsi, [rbp - 0xe0]
0x10034df1b: call 0x100789e80 ; 0x100789e80
0x10034df20: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10034df25: vmovaps xmmword ptr [r14 + 0x30], xmm0
0x10034df2b: mov r8d, dword ptr [r14 + 0x10]
0x10034df2f: test r8, r8
0x10034df32: je 0x10034df55
0x10034df34: mov r9, qword ptr [r14 + 8]
0x10034df38: lea rax, [r8 - 1]
0x10034df3c: mov edx, r8d
0x10034df3f: and edx, 3
0x10034df42: cmp rax, 3
0x10034df46: jae 0x10034df6c
0x10034df48: vxorps xmm0, xmm0, xmm0
0x10034df4c: xor eax, eax
0x10034df4e: test rdx, rdx
0x10034df51: jne 0x10034dfaa
0x10034df53: jmp 0x10034dfc7 ; 0x10034dfc7
0x10034df55: mov dword ptr [r14 + 0x28], 0
0x10034df5d: mov r15, qword ptr [r14 + 0x18]
0x10034df61: mov r11, qword ptr [r14 + 0x20]
0x10034df65: xor ecx, ecx
0x10034df67: jmp 0x10034e073 ; 0x10034e073
0x10034df6c: mov rcx, r8
0x10034df6f: sub rcx, rdx
0x10034df72: lea rsi, [r9 + 0xb0]
0x10034df79: vxorps xmm0, xmm0, xmm0
0x10034df7d: xor eax, eax
0x10034df7f: vaddss xmm0, xmm0, dword ptr [rsi - 0x90]
0x10034df87: vaddss xmm0, xmm0, dword ptr [rsi - 0x60]
0x10034df8c: vaddss xmm0, xmm0, dword ptr [rsi - 0x30]
0x10034df91: vaddss xmm0, xmm0, dword ptr [rsi]
0x10034df95: add rax, 4
0x10034df99: add rsi, 0xc0
0x10034dfa0: cmp rcx, rax
0x10034dfa3: jne 0x10034df7f
0x10034dfa5: test rdx, rdx
0x10034dfa8: je 0x10034dfc7
0x10034dfaa: lea rax, [rax + rax*2]
0x10034dfae: shl rax, 4
0x10034dfb2: lea rax, [r9 + rax + 0x20]
0x10034dfb7: neg rdx
0x10034dfba: vaddss xmm0, xmm0, dword ptr [rax]
0x10034dfbe: add rax, 0x30
0x10034dfc2: inc rdx
0x10034dfc5: jne 0x10034dfba
0x10034dfc7: vmovss dword ptr [r14 + 0x28], xmm0
0x10034dfcd: mov r15, qword ptr [r14 + 0x18]
0x10034dfd1: mov r11, qword ptr [r14 + 0x20]
0x10034dfd5: mov r10d, r8d
0x10034dfd8: and r10d, 1
0x10034dfdc: cmp r8d, 1
0x10034dfe0: jne 0x10034dfee
0x10034dfe2: xor edi, edi
0x10034dfe4: test r10, r10
0x10034dfe7: jne 0x10034e044
0x10034dfe9: jmp 0x10034e070 ; 0x10034e070
0x10034dfee: mov rax, r8
0x10034dff1: sub rax, r10
0x10034dff4: lea rcx, [r15 + 0x10]
0x10034dff8: lea rbx, [r11 + 0x10]
0x10034dffc: xor edi, edi
0x10034dffe: vmovaps xmm1, xmmword ptr [rip + 0x75a09a] ; 0x100aa80a0
0x10034e006: mov rdx, r9
0x10034e009: vinsertps xmm0, xmm1, xmm0, 0xf5
0x10034e00f: vmovaps xmm2, xmmword ptr [rdx]
0x10034e013: vmovaps xmmword ptr [rcx - 0x10], xmm2
0x10034e018: vmovaps xmmword ptr [rbx - 0x10], xmm0
0x10034e01d: vmovaps xmm2, xmmword ptr [rdx + 0x30]
0x10034e022: vmovaps xmmword ptr [rcx], xmm2
0x10034e026: vmovaps xmmword ptr [rbx], xmm0
0x10034e02a: add rdi, 2
0x10034e02e: add rdx, 0x60
0x10034e032: add rcx, 0x20
0x10034e036: add rbx, 0x20
0x10034e03a: cmp rax, rdi
0x10034e03d: jne 0x10034e009
0x10034e03f: test r10, r10
0x10034e042: je 0x10034e070
0x10034e044: lea rax, [rdi + rdi*2]
0x10034e048: shl rax, 4
0x10034e04c: shl rdi, 4
0x10034e050: vmovaps xmm1, xmmword ptr [r9 + rax]
0x10034e056: vmovaps xmmword ptr [r15 + rdi], xmm1
0x10034e05c: vmovaps xmm1, xmmword ptr [rip + 0x75a03c] ; 0x100aa80a0
0x10034e064: vinsertps xmm0, xmm1, xmm0, 0xf5
0x10034e06a: vmovaps xmmword ptr [r11 + rdi], xmm0
0x10034e070: mov rcx, r8
0x10034e073: mov r9d, dword ptr [rbp - 0x3c]
0x10034e077: mov rsi, qword ptr [rbp - 0x50]
0x10034e07b: lea rbx, [r14 + 0x30]
0x10034e07f: shl rcx, 4
0x10034e083: mov edi, 0x800
0x10034e088: sub rdi, rcx
0x10034e08b: jle 0x10034e0d7
0x10034e08d: add rcx, r15
0x10034e090: dec r8d
0x10034e093: shl r8, 4
0x10034e097: add r15, r8
0x10034e09a: shr rdi, 4
0x10034e09e: lea rax, [rdi + 1]
0x10034e0a2: mov rdx, rcx
0x10034e0a5: vmovaps xmm0, xmmword ptr [r15]
0x10034e0aa: vmovaps xmmword ptr [rdx], xmm0
0x10034e0ae: add rdx, 0x10
0x10034e0b2: dec rax
0x10034e0b5: cmp rax, 1
0x10034e0b9: jg 0x10034e0a5
0x10034e0bb: add r11, r8
0x10034e0be: inc rdi
0x10034e0c1: vmovaps xmm0, xmmword ptr [r11]
0x10034e0c6: vmovaps xmmword ptr [rcx], xmm0
0x10034e0ca: add rcx, 0x10
0x10034e0ce: dec rdi
0x10034e0d1: cmp rdi, 1
0x10034e0d5: jg 0x10034e0c1
0x10034e0d7: mov byte ptr [r14], r9b
0x10034e0da: jmp 0x10034d39f ; 0x10034d39f
0x10034e0df: lea rdi, [rip + 0x8339b1] ; 0x100b81a97 historyCount
0x10034e0e6: lea rsi, [rip + 0x83394b] ; 0x100b81a38 FloppySpine.cpp
0x10034e0ed: mov edx, 0xa2
0x10034e0f2: mov ecx, 3
0x10034e0f7: call 0x1007e5f70 ; 0x1007e5f70
0x10034e0fc: ud2 
0x10034e0fe: lea rdi, [rip + 0x833988] ; 0x100b81a8d tail
0x10034e105: lea rsi, [rip + 0x83392c] ; 0x100b81a38 FloppySpine.cpp
0x10034e10c: mov edx, 0x6f
0x10034e111: mov ecx, 3
0x10034e116: call 0x1007e5f70 ; 0x1007e5f70
0x10034e11b: jmp 0x10034e0fc ; 0x10034e0fc
0x10034e11d: lea rdi, [rip + 0x83396e] ; 0x100b81a92 node
0x10034e124: lea rsi, [rip + 0x83390d] ; 0x100b81a38 FloppySpine.cpp
0x10034e12b: mov edx, 0x77
0x10034e130: mov ecx, 3
0x10034e135: call 0x1007e5f70 ; 0x1007e5f70
0x10034e13a: jmp 0x10034e0fc ; 0x10034e0fc
0x10034e13c: jmp 0x10034e182 ; 0x10034e182
0x10034e13e: jmp 0x10034e182 ; 0x10034e182
0x10034e140: jmp 0x10034e164 ; 0x10034e164
0x10034e142: mov rdi, rax
0x10034e145: call 0x100011bf0 ; 0x100011bf0
0x10034e14a: mov rdi, rax
0x10034e14d: call 0x100011bf0 ; 0x100011bf0
0x10034e152: jmp 0x10034e182 ; 0x10034e182
0x10034e154: jmp 0x10034e182 ; 0x10034e182
0x10034e156: jmp 0x10034e182 ; 0x10034e182
0x10034e158: jmp 0x10034e182 ; 0x10034e182
0x10034e15a: jmp 0x10034e182 ; 0x10034e182
0x10034e15c: jmp 0x10034e182 ; 0x10034e182
0x10034e15e: jmp 0x10034e182 ; 0x10034e182
0x10034e160: jmp 0x10034e164 ; 0x10034e164
0x10034e162: jmp 0x10034e164 ; 0x10034e164
0x10034e164: mov r14, rax
0x10034e167: call 0x1007c6c20 ; 0x1007c6c20
0x10034e16c: mov rsi, qword ptr [rbp - 0x30]
0x10034e170: mov rdi, rax
0x10034e173: call 0x100795a70 ; 0x100795a70
0x10034e178: jmp 0x10034e196 ; 0x10034e196
0x10034e17a: mov rdi, rax
0x10034e17d: call 0x100011bf0 ; 0x100011bf0
0x10034e182: mov r14, rax
0x10034e185: call 0x1007c6c20 ; 0x1007c6c20
0x10034e18a: mov rdi, rax
0x10034e18d: mov rsi, qword ptr [rbp - 0x30]
0x10034e191: call 0x100795a70 ; 0x100795a70
0x10034e196: mov rdi, r14
0x10034e199: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10034e19e: mov rdi, rax
0x10034e1a1: call 0x100011bf0 ; 0x100011bf0
0x10034e1a6: nop word ptr cs:[rax + rax]
