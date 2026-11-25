0x10045ee30: push rbp
0x10045ee31: mov rbp, rsp
0x10045ee34: push r15
0x10045ee36: push r14
0x10045ee38: push r13
0x10045ee3a: push r12
0x10045ee3c: push rbx
0x10045ee3d: sub rsp, 0x28
0x10045ee41: mov qword ptr [rbp - 0x40], r9
0x10045ee45: mov dword ptr [rbp - 0x2c], r8d
0x10045ee49: mov r12, rcx
0x10045ee4c: mov dword ptr [rbp - 0x30], edx
0x10045ee4f: mov r13, rsi
0x10045ee52: mov r14, rdi
0x10045ee55: mov r15d, dword ptr [rbp + 0x10]
0x10045ee59: call 0x1007c6c20 ; 0x1007c6c20
0x10045ee5e: mov rbx, r15
0x10045ee61: shl rbx, 4
0x10045ee65: lea rcx, [rip + 0x1be9ce4] ; 0x102048b50
0x10045ee6c: mov rdx, qword ptr [rcx]
0x10045ee6f: mov ecx, 0x10
0x10045ee74: mov rdi, rax
0x10045ee77: mov rsi, rbx
0x10045ee7a: call 0x100795530 ; 0x100795530
0x10045ee7f: mov qword ptr [rbp - 0x38], rax
0x10045ee83: mov rdi, rax
0x10045ee86: mov rsi, rbx
0x10045ee89: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x10045ee8e: mov edx, dword ptr [rbp - 0x2c]
0x10045ee91: mov r11, qword ptr [rbp - 0x40]
0x10045ee95: mov r10, qword ptr [rbp - 0x38]
0x10045ee99: test edx, edx
0x10045ee9b: je 0x10045f069
0x10045eea1: mov al, byte ptr [rbp + 0x20]
0x10045eea4: test al, al
0x10045eea6: je 0x10045ef95
0x10045eeac: xor ecx, ecx
0x10045eeae: nop 
0x10045eeb0: mov edi, ecx
0x10045eeb2: lea r8d, [rcx + 1]
0x10045eeb6: lea r9d, [rcx + 2]
0x10045eeba: mov edi, dword ptr [r12 + rdi*4]
0x10045eebe: mov ebx, dword ptr [r12 + r8*4]
0x10045eec2: mov rax, qword ptr [rbp + 0x18]
0x10045eec6: mov rsi, r11
0x10045eec9: mov r11, rax
0x10045eecc: mov eax, dword ptr [r11 + rdi*4]
0x10045eed0: mov ebx, dword ptr [r11 + rbx*4]
0x10045eed4: mov edx, dword ptr [r12 + r9*4]
0x10045eed8: shl rax, 4
0x10045eedc: shl rbx, 4
0x10045eee0: mov edx, dword ptr [r11 + rdx*4]
0x10045eee4: mov r11, rsi
0x10045eee7: shl rdx, 4
0x10045eeeb: vmovsd xmm0, qword ptr [r13 + rax]
0x10045eef2: vinsertps xmm0, xmm0, dword ptr [r13 + rax + 8], 0x20
0x10045eefa: vmovsd xmm1, qword ptr [r13 + rbx]
0x10045ef01: vinsertps xmm1, xmm1, dword ptr [r13 + rbx + 8], 0x20
0x10045ef09: vmovsd xmm2, qword ptr [r13 + rdx]
0x10045ef10: vinsertps xmm2, xmm2, dword ptr [r13 + rdx + 8], 0x20
0x10045ef18: vsubps xmm1, xmm1, xmm0
0x10045ef1c: vsubps xmm0, xmm2, xmm0
0x10045ef20: vpermilps xmm2, xmm1, 0xd2
0x10045ef26: vmulps xmm2, xmm2, xmm0
0x10045ef2a: vpermilps xmm0, xmm0, 0xd2
0x10045ef30: vmulps xmm0, xmm1, xmm0
0x10045ef34: vsubps xmm0, xmm2, xmm0
0x10045ef38: vpermilps xmm0, xmm0, 0xd2
0x10045ef3e: mov eax, dword ptr [r11 + rdi*4]
0x10045ef42: shl rax, 4
0x10045ef46: vaddps xmm1, xmm0, xmmword ptr [r10 + rax]
0x10045ef4c: vmovaps xmmword ptr [r10 + rax], xmm1
0x10045ef52: mov eax, dword ptr [r12 + r8*4]
0x10045ef56: mov eax, dword ptr [r11 + rax*4]
0x10045ef5a: shl rax, 4
0x10045ef5e: vaddps xmm1, xmm0, xmmword ptr [r10 + rax]
0x10045ef64: vmovaps xmmword ptr [r10 + rax], xmm1
0x10045ef6a: mov eax, dword ptr [r12 + r9*4]
0x10045ef6e: mov edx, dword ptr [rbp - 0x2c]
0x10045ef71: mov eax, dword ptr [r11 + rax*4]
0x10045ef75: shl rax, 4
0x10045ef79: vaddps xmm0, xmm0, xmmword ptr [r10 + rax]
0x10045ef7f: add ecx, 3
0x10045ef82: cmp ecx, edx
0x10045ef84: vmovaps xmmword ptr [r10 + rax], xmm0
0x10045ef8a: jb 0x10045eeb0
0x10045ef90: jmp 0x10045f069 ; 0x10045f069
0x10045ef95: mov eax, 1
0x10045ef9a: nop word ptr [rax + rax]
0x10045efa0: lea esi, [rax - 1]
0x10045efa3: mov r9d, eax
0x10045efa6: lea r8d, [rax + 1]
0x10045efaa: mov edi, dword ptr [r12 + rsi*4]
0x10045efae: mov esi, dword ptr [r12 + r9*4]
0x10045efb2: mov ebx, dword ptr [r11 + rdi*4]
0x10045efb6: shl rdi, 4
0x10045efba: shl rsi, 4
0x10045efbe: mov ecx, dword ptr [r12 + r8*4]
0x10045efc2: shl rcx, 4
0x10045efc6: vmovsd xmm0, qword ptr [r13 + rdi]
0x10045efcd: vinsertps xmm0, xmm0, dword ptr [r13 + rdi + 8], 0x20
0x10045efd5: vmovsd xmm1, qword ptr [r13 + rsi]
0x10045efdc: vinsertps xmm1, xmm1, dword ptr [r13 + rsi + 8], 0x20
0x10045efe4: vmovsd xmm2, qword ptr [r13 + rcx]
0x10045efeb: vinsertps xmm2, xmm2, dword ptr [r13 + rcx + 8], 0x20
0x10045eff3: vsubps xmm1, xmm1, xmm0
0x10045eff7: vsubps xmm0, xmm2, xmm0
0x10045effb: vpermilps xmm2, xmm1, 0xd2
0x10045f001: vmulps xmm2, xmm2, xmm0
0x10045f005: vpermilps xmm0, xmm0, 0xd2
0x10045f00b: vmulps xmm0, xmm1, xmm0
0x10045f00f: vsubps xmm0, xmm2, xmm0
0x10045f013: vpermilps xmm0, xmm0, 0xd2
0x10045f019: shl rbx, 4
0x10045f01d: vaddps xmm1, xmm0, xmmword ptr [r10 + rbx]
0x10045f023: vmovaps xmmword ptr [r10 + rbx], xmm1
0x10045f029: mov ecx, dword ptr [r12 + r9*4]
0x10045f02d: mov ecx, dword ptr [r11 + rcx*4]
0x10045f031: shl rcx, 4
0x10045f035: vaddps xmm1, xmm0, xmmword ptr [r10 + rcx]
0x10045f03b: vmovaps xmmword ptr [r10 + rcx], xmm1
0x10045f041: mov ecx, dword ptr [r12 + r8*4]
0x10045f045: mov ecx, dword ptr [r11 + rcx*4]
0x10045f049: shl rcx, 4
0x10045f04d: vaddps xmm0, xmm0, xmmword ptr [r10 + rcx]
0x10045f053: vmovaps xmmword ptr [r10 + rcx], xmm0
0x10045f059: lea ecx, [rax + 3]
0x10045f05c: add eax, 2
0x10045f05f: cmp eax, edx
0x10045f061: mov eax, ecx
0x10045f063: jb 0x10045efa0
0x10045f069: mov r13, r11
0x10045f06c: mov r12, r10
0x10045f06f: call 0x1007c6c20 ; 0x1007c6c20
0x10045f074: lea rsi, [r15*4]
0x10045f07c: lea rcx, [rip + 0x1be9acd] ; 0x102048b50
0x10045f083: mov rdx, qword ptr [rcx]
0x10045f086: mov ecx, 4
0x10045f08b: mov rdi, rax
0x10045f08e: call 0x100795530 ; 0x100795530
0x10045f093: mov rbx, rax
0x10045f096: test r15d, r15d
0x10045f099: mov rcx, r12
0x10045f09c: je 0x10045f126
0x10045f0a2: vmovaps xmm0, xmmword ptr [rip + 0x6636a6] ; 0x100ac2750
0x10045f0aa: vmovaps xmm1, xmmword ptr [rip + 0x652a8e] ; 0x100ab1b40
0x10045f0b2: vmovaps xmm2, xmmword ptr [rip + 0x652176] ; 0x100ab1230
0x10045f0ba: vmovdqa xmm3, xmmword ptr [rip + 0x66369e] ; 0x100ac2760
0x10045f0c2: mov rax, rbx
0x10045f0c5: nop word ptr cs:[rax + rax]
0x10045f0d0: vmovaps xmm4, xmmword ptr [rcx]
0x10045f0d4: vmulps xmm5, xmm4, xmm4
0x10045f0d8: vmovshdup xmm6, xmm5
0x10045f0dc: vaddss xmm6, xmm5, xmm6
0x10045f0e0: vpermilpd xmm5, xmm5, 1
0x10045f0e6: vaddss xmm5, xmm5, xmm6
0x10045f0ea: vrsqrtss xmm5, xmm5, xmm5
0x10045f0ee: vpermilps xmm5, xmm5, 0xc0
0x10045f0f4: vmulps xmm4, xmm4, xmm5
0x10045f0f8: vmulps xmm4, xmm4, xmm0
0x10045f0fc: vmaxps xmm4, xmm4, xmm1
0x10045f100: vminps xmm4, xmm4, xmm2
0x10045f104: vcvttps2dq xmm4, xmm4
0x10045f108: vpshufb xmm4, xmm4, xmm3
0x10045f10d: vmovd edx, xmm4
0x10045f111: and edx, 0xffffff
0x10045f117: mov dword ptr [rax], edx
0x10045f119: add rcx, 0x10
0x10045f11d: add rax, 4
0x10045f121: dec r15
0x10045f124: jne 0x10045f0d0
0x10045f126: mov eax, dword ptr [rbp - 0x30]
0x10045f129: test eax, eax
0x10045f12b: mov rsi, r13
0x10045f12e: je 0x10045f25e
0x10045f134: mov r9d, eax
0x10045f137: lea rax, [r9 - 1]
0x10045f13b: mov r8d, r9d
0x10045f13e: and r8d, 7
0x10045f142: cmp rax, 7
0x10045f146: jae 0x10045f158
0x10045f148: xor edi, edi
0x10045f14a: test r8, r8
0x10045f14d: jne 0x10045f234
0x10045f153: jmp 0x10045f25e ; 0x10045f25e
0x10045f158: sub r9, r8
0x10045f15b: xor eax, eax
0x10045f15d: xor edi, edi
0x10045f15f: nop 
0x10045f160: mov ecx, dword ptr [rsi + rax]
0x10045f163: movzx edx, byte ptr [rbx + rcx*4 + 2]
0x10045f168: mov byte ptr [r14 + rax + 2], dl
0x10045f16d: movzx ecx, word ptr [rbx + rcx*4]
0x10045f171: mov word ptr [r14 + rax], cx
0x10045f176: mov ecx, dword ptr [rsi + rax + 4]
0x10045f17a: movzx edx, byte ptr [rbx + rcx*4 + 2]
0x10045f17f: mov byte ptr [r14 + rax + 6], dl
0x10045f184: movzx ecx, word ptr [rbx + rcx*4]
0x10045f188: mov word ptr [r14 + rax + 4], cx
0x10045f18e: mov ecx, dword ptr [rsi + rax + 8]
0x10045f192: movzx edx, byte ptr [rbx + rcx*4 + 2]
0x10045f197: mov byte ptr [r14 + rax + 0xa], dl
0x10045f19c: movzx ecx, word ptr [rbx + rcx*4]
0x10045f1a0: mov word ptr [r14 + rax + 8], cx
0x10045f1a6: mov ecx, dword ptr [rsi + rax + 0xc]
0x10045f1aa: movzx edx, byte ptr [rbx + rcx*4 + 2]
0x10045f1af: mov byte ptr [r14 + rax + 0xe], dl
0x10045f1b4: movzx ecx, word ptr [rbx + rcx*4]
0x10045f1b8: mov word ptr [r14 + rax + 0xc], cx
0x10045f1be: mov ecx, dword ptr [rsi + rax + 0x10]
0x10045f1c2: movzx edx, word ptr [rbx + rcx*4]
0x10045f1c6: mov word ptr [r14 + rax + 0x10], dx
0x10045f1cc: movzx ecx, byte ptr [rbx + rcx*4 + 2]
0x10045f1d1: mov byte ptr [r14 + rax + 0x12], cl
0x10045f1d6: mov ecx, dword ptr [rsi + rax + 0x14]
0x10045f1da: movzx edx, byte ptr [rbx + rcx*4 + 2]
0x10045f1df: mov byte ptr [r14 + rax + 0x16], dl
0x10045f1e4: movzx ecx, word ptr [rbx + rcx*4]
0x10045f1e8: mov word ptr [r14 + rax + 0x14], cx
0x10045f1ee: mov ecx, dword ptr [rsi + rax + 0x18]
0x10045f1f2: movzx edx, byte ptr [rbx + rcx*4 + 2]
0x10045f1f7: mov byte ptr [r14 + rax + 0x1a], dl
0x10045f1fc: movzx ecx, word ptr [rbx + rcx*4]
0x10045f200: mov word ptr [r14 + rax + 0x18], cx
0x10045f206: mov ecx, dword ptr [rsi + rax + 0x1c]
0x10045f20a: movzx edx, byte ptr [rbx + rcx*4 + 2]
0x10045f20f: mov byte ptr [r14 + rax + 0x1e], dl
0x10045f214: movzx ecx, word ptr [rbx + rcx*4]
0x10045f218: mov word ptr [r14 + rax + 0x1c], cx
0x10045f21e: add rdi, 8
0x10045f222: add rax, 0x20
0x10045f226: cmp r9, rdi
0x10045f229: jne 0x10045f160
0x10045f22f: test r8, r8
0x10045f232: je 0x10045f25e
0x10045f234: lea rax, [rsi + rdi*4]
0x10045f238: lea rdx, [r14 + rdi*4]
0x10045f23c: neg r8
0x10045f23f: nop 
0x10045f240: mov esi, dword ptr [rax]
0x10045f242: movzx ecx, byte ptr [rbx + rsi*4 + 2]
0x10045f247: mov byte ptr [rdx + 2], cl
0x10045f24a: movzx ecx, word ptr [rbx + rsi*4]
0x10045f24e: mov word ptr [rdx], cx
0x10045f251: add rax, 4
0x10045f255: add rdx, 4
0x10045f259: inc r8
0x10045f25c: jne 0x10045f240
0x10045f25e: call 0x1007c6c20 ; 0x1007c6c20
0x10045f263: mov rdi, rax
0x10045f266: mov rsi, rbx
0x10045f269: call 0x100795a70 ; 0x100795a70
0x10045f26e: call 0x1007c6c20 ; 0x1007c6c20
0x10045f273: mov rdi, rax
0x10045f276: mov rsi, r12
0x10045f279: call 0x100795a70 ; 0x100795a70
0x10045f27e: add rsp, 0x28
0x10045f282: pop rbx
0x10045f283: pop r12
0x10045f285: pop r13
0x10045f287: pop r14
0x10045f289: pop r15
0x10045f28b: pop rbp
0x10045f28c: ret 
0x10045f28d: mov rdi, rax
0x10045f290: call 0x100011bf0 ; 0x100011bf0
0x10045f295: mov rdi, rax
0x10045f298: call 0x100011bf0 ; 0x100011bf0
0x10045f29d: mov rbx, rax
0x10045f2a0: call 0x1007c6c20 ; 0x1007c6c20
0x10045f2a5: mov rdi, rax
0x10045f2a8: mov rsi, r12
0x10045f2ab: call 0x100795a70 ; 0x100795a70
0x10045f2b0: mov rdi, rbx
0x10045f2b3: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10045f2b8: mov rdi, rax
0x10045f2bb: call 0x100011bf0 ; 0x100011bf0
