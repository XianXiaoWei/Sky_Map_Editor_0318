0x10025f0d0: push rbp
0x10025f0d1: mov rbp, rsp
0x10025f0d4: push r15
0x10025f0d6: push r14
0x10025f0d8: push r13
0x10025f0da: push r12
0x10025f0dc: push rbx
0x10025f0dd: sub rsp, 0xa8
0x10025f0e4: mov rax, qword ptr [rip + 0x9ae7ed] ; 0x100c0d8d8
0x10025f0eb: mov rax, qword ptr [rax]
0x10025f0ee: mov qword ptr [rbp - 0x30], rax
0x10025f0f2: test ecx, ecx
0x10025f0f4: je 0x10025f27c
0x10025f0fa: vmovss dword ptr [rbp - 0xb8], xmm0
0x10025f102: mov qword ptr [rbp - 0xc0], rsp
0x10025f109: mov dword ptr [rbp - 0xb4], 0
0x10025f113: mov r9d, ecx
0x10025f116: lea rax, [r9*8 + 0xf]
0x10025f11e: movabs rsi, 0xffffffff0
0x10025f128: and rsi, rax
0x10025f12b: mov r15, rsp
0x10025f12e: sub r15, rsi
0x10025f131: mov rsp, r15
0x10025f134: mov r11d, dword ptr [r8]
0x10025f137: mov r8d, r9d
0x10025f13a: and r8d, 1
0x10025f13e: cmp ecx, 1
0x10025f141: jne 0x10025f151
0x10025f143: xor esi, esi
0x10025f145: xor ebx, ebx
0x10025f147: test r8, r8
0x10025f14a: jne 0x10025f1bd
0x10025f14c: jmp 0x10025f1e7 ; 0x10025f1e7
0x10025f151: sub r9, r8
0x10025f154: xor esi, esi
0x10025f156: vxorps xmm0, xmm0, xmm0
0x10025f15a: xor ebx, ebx
0x10025f15c: nop dword ptr [rax]
0x10025f160: mov rax, qword ptr [rdx + rbx*8]
0x10025f164: cmp dword ptr [rax + 0x598], r11d
0x10025f16b: jne 0x10025f187
0x10025f16d: vucomiss xmm0, dword ptr [rax + 0xdc]
0x10025f175: jb 0x10025f187
0x10025f177: mov r10d, esi
0x10025f17a: lea esi, [rsi + 1]
0x10025f17d: mov dword ptr [rbp - 0xb4], esi
0x10025f183: mov qword ptr [r15 + r10*8], rax
0x10025f187: mov rax, qword ptr [rdx + rbx*8 + 8]
0x10025f18c: cmp dword ptr [rax + 0x598], r11d
0x10025f193: jne 0x10025f1af
0x10025f195: vucomiss xmm0, dword ptr [rax + 0xdc]
0x10025f19d: jb 0x10025f1af
0x10025f19f: mov r10d, esi
0x10025f1a2: lea esi, [rsi + 1]
0x10025f1a5: mov dword ptr [rbp - 0xb4], esi
0x10025f1ab: mov qword ptr [r15 + r10*8], rax
0x10025f1af: add rbx, 2
0x10025f1b3: cmp r9, rbx
0x10025f1b6: jne 0x10025f160
0x10025f1b8: test r8, r8
0x10025f1bb: je 0x10025f1e7
0x10025f1bd: mov rdx, qword ptr [rdx + rbx*8]
0x10025f1c1: cmp dword ptr [rdx + 0x598], r11d
0x10025f1c8: jne 0x10025f1e7
0x10025f1ca: vxorps xmm0, xmm0, xmm0
0x10025f1ce: vucomiss xmm0, dword ptr [rdx + 0xdc]
0x10025f1d6: jb 0x10025f1e7
0x10025f1d8: lea eax, [rsi + 1]
0x10025f1db: mov dword ptr [rbp - 0xb4], eax
0x10025f1e1: mov eax, esi
0x10025f1e3: mov qword ptr [r15 + rax*8], rdx
0x10025f1e7: lea rsi, [rbp - 0xb4]
0x10025f1ee: xor r14d, r14d
0x10025f1f1: xor edx, edx
0x10025f1f3: mov qword ptr [rbp - 0xc8], rdi
0x10025f1fa: mov r13d, ecx
0x10025f1fd: call 0x10076ad40 ; 0x10076ad40
0x10025f202: cmp dword ptr [rbp - 0xb4], 0
0x10025f209: je 0x10025f275
0x10025f20b: lea r12, [rbp - 0xb0]
0x10025f212: nop word ptr cs:[rax + rax]
0x10025f220: mov eax, r14d
0x10025f223: mov rbx, qword ptr [r15 + rax*8]
0x10025f227: mov dword ptr [rbp - 0xa0], 0
0x10025f231: mov dword ptr [rbp - 0x3c], 0
0x10025f238: mov dword ptr [rbp - 0xa8], r13d
0x10025f23f: mov rdi, rbx
0x10025f242: mov rsi, r12
0x10025f245: call 0x10025ead0 ; 0x10025ead0
0x10025f24a: mov rdi, r12
0x10025f24d: mov rsi, qword ptr [rbp - 0xc8]
0x10025f254: call 0x1002582b0 ; 0x1002582b0
0x10025f259: vmovss xmm0, dword ptr [rbp - 0xb8]
0x10025f261: vmovss dword ptr [rbx + 0xdc], xmm0
0x10025f269: inc r14d
0x10025f26c: cmp r14d, dword ptr [rbp - 0xb4]
0x10025f273: jb 0x10025f220
0x10025f275: mov rsp, qword ptr [rbp - 0xc0]
0x10025f27c: mov rax, qword ptr [rip + 0x9ae655] ; 0x100c0d8d8
0x10025f283: mov rax, qword ptr [rax]
0x10025f286: cmp rax, qword ptr [rbp - 0x30]
0x10025f28a: jne 0x10025f29b
0x10025f28c: lea rsp, [rbp - 0x28]
0x10025f290: pop rbx
0x10025f291: pop r12
0x10025f293: pop r13
0x10025f295: pop r14
0x10025f297: pop r15
0x10025f299: pop rbp
0x10025f29a: ret 
0x10025f29b: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
