0x10034d0d0: push rbp
0x10034d0d1: mov rbp, rsp
0x10034d0d4: push r15
0x10034d0d6: push r14
0x10034d0d8: push r13
0x10034d0da: push r12
0x10034d0dc: push rbx
0x10034d0dd: sub rsp, 0x1f8
0x10034d0e4: mov r15, rsi
0x10034d0e7: mov r14, rdi
0x10034d0ea: mov rax, qword ptr [rip + 0x8c07e7] ; 0x100c0d8d8
0x10034d0f1: mov rax, qword ptr [rax]
0x10034d0f4: mov qword ptr [rbp - 0x30], rax
0x10034d0f8: mov qword ptr [r14 + 0x40], r15
0x10034d0fc: mov qword ptr [r14 + 0x48], rdx
0x10034d100: mov rdi, r15
0x10034d103: call 0x100093d60 ; 0x100093d60
0x10034d108: test eax, eax
0x10034d10a: je 0x10034d1be
0x10034d110: xor ebx, ebx
0x10034d112: lea r12, [rip + 0x83496f] ; 0x100b81a88 _Sim
0x10034d119: xor r13d, r13d
0x10034d11c: nop dword ptr [rax]
0x10034d120: mov rdi, r15
0x10034d123: mov esi, ebx
0x10034d125: call 0x10009e070 ; 0x10009e070
0x10034d12a: mov rdi, rax
0x10034d12d: mov rsi, r12
0x10034d130: call 0x100aa2cae ; 0x100aa2cae _strstr
0x10034d135: cmp rax, 1
0x10034d139: sbb r13d, -1
0x10034d13d: inc ebx
0x10034d13f: mov rdi, r15
0x10034d142: call 0x100093d60 ; 0x100093d60
0x10034d147: cmp ebx, eax
0x10034d149: jb 0x10034d120
0x10034d14b: mov dword ptr [r14 + 0x10], r13d
0x10034d14f: cmp r13d, 1
0x10034d153: jbe 0x10034d1c6
0x10034d155: mov rdi, qword ptr [r14 + 0x48]
0x10034d159: mov rdx, qword ptr [rip + 0x1aa9100] ; 0x101df6260
0x10034d160: mov eax, r13d
0x10034d163: shl rax, 4
0x10034d167: lea rsi, [rax + rax*2]
0x10034d16b: mov ecx, 0x10
0x10034d170: call 0x100795530 ; 0x100795530
0x10034d175: mov qword ptr [r14 + 8], rax
0x10034d179: mov rdi, qword ptr [r14 + 0x48]
0x10034d17d: mov rdx, qword ptr [rip + 0x1aa90dc] ; 0x101df6260
0x10034d184: mov esi, 0x800
0x10034d189: mov ecx, 0x10
0x10034d18e: call 0x100795530 ; 0x100795530
0x10034d193: mov qword ptr [r14 + 0x18], rax
0x10034d197: mov rdi, qword ptr [r14 + 0x48]
0x10034d19b: mov rdx, qword ptr [rip + 0x1aa90be] ; 0x101df6260
0x10034d1a2: mov esi, 0x800
0x10034d1a7: mov ecx, 0x10
0x10034d1ac: call 0x100795530 ; 0x100795530
0x10034d1b1: mov qword ptr [r14 + 0x20], rax
0x10034d1b5: mov byte ptr [r14], 0
0x10034d1b9: jmp 0x10034d289 ; 0x10034d289
0x10034d1be: mov dword ptr [r14 + 0x10], 0
0x10034d1c6: lea r14, [rbp - 0xc8]
0x10034d1cd: lea r12, [rbp - 0x210]
0x10034d1d4: mov rax, qword ptr [rip + 0x8bd345] ; 0x100c0a520
0x10034d1db: lea rcx, [rax + 0x18]
0x10034d1df: mov qword ptr [rbp - 0x218], rcx
0x10034d1e6: add rax, 0x40
0x10034d1ea: mov qword ptr [rbp - 0xc8], rax
0x10034d1f1: mov rdi, r14
0x10034d1f4: mov rsi, r12
0x10034d1f7: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x10034d1fc: mov qword ptr [rbp - 0x40], 0
0x10034d204: mov dword ptr [rbp - 0x38], 0xffffffff
0x10034d20b: mov rbx, qword ptr [rip + 0x8c03b6] ; 0x100c0d5c8
0x10034d212: lea r13, [rbx + 0x18]
0x10034d216: mov qword ptr [rbp - 0x218], r13
0x10034d21d: add rbx, 0x40
0x10034d221: mov qword ptr [rbp - 0xc8], rbx
0x10034d228: lea rsi, [rip + 0x818c5c] ; 0x100b65e8b Animation
0x10034d22f: mov edx, 1
0x10034d234: mov rdi, r12
0x10034d237: call 0x1007a56a0 ; 0x1007a56a0
0x10034d23c: lea rsi, [rip + 0x83480c] ; 0x100b81a4f FloppySpine warning: not enough _Sim joints to simulate.
0x10034d243: lea rdi, [rbp - 0x218]
0x10034d24a: mov edx, 0x38
0x10034d24f: call 0x100011930 ; 0x100011930
0x10034d254: mov qword ptr [rbp - 0x218], r13
0x10034d25b: mov qword ptr [rbp - 0xc8], rbx
0x10034d262: mov rdi, r12
0x10034d265: call 0x1007a58d0 ; 0x1007a58d0
0x10034d26a: mov rsi, qword ptr [rip + 0x8bd30f] ; 0x100c0a580
0x10034d271: add rsi, 8
0x10034d275: lea rdi, [rbp - 0x218]
0x10034d27c: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10034d281: mov rdi, r14
0x10034d284: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10034d289: mov rax, qword ptr [rip + 0x8c0648] ; 0x100c0d8d8
0x10034d290: mov rax, qword ptr [rax]
0x10034d293: cmp rax, qword ptr [rbp - 0x30]
0x10034d297: jne 0x10034d2ab
0x10034d299: add rsp, 0x1f8
0x10034d2a0: pop rbx
0x10034d2a1: pop r12
0x10034d2a3: pop r13
0x10034d2a5: pop r14
0x10034d2a7: pop r15
0x10034d2a9: pop rbp
0x10034d2aa: ret 
0x10034d2ab: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10034d2b0: mov r15, rax
0x10034d2b3: mov qword ptr [rbp - 0x218], r13
0x10034d2ba: mov qword ptr [rbp - 0xc8], rbx
0x10034d2c1: mov rdi, r12
0x10034d2c4: call 0x1007a58d0 ; 0x1007a58d0
0x10034d2c9: jmp 0x10034d2ce ; 0x10034d2ce
0x10034d2cb: mov r15, rax
0x10034d2ce: mov rsi, qword ptr [rip + 0x8bd2ab] ; 0x100c0a580
0x10034d2d5: add rsi, 8
0x10034d2d9: lea rdi, [rbp - 0x218]
0x10034d2e0: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10034d2e5: jmp 0x10034d2ea ; 0x10034d2ea
0x10034d2e7: mov r15, rax
0x10034d2ea: mov rdi, r14
0x10034d2ed: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10034d2f2: mov rdi, r15
0x10034d2f5: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10034d2fa: nop word ptr [rax + rax]
