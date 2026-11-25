0x10032e670: push rbp
0x10032e671: mov rbp, rsp
0x10032e674: push r15
0x10032e676: push r14
0x10032e678: push r13
0x10032e67a: push r12
0x10032e67c: push rbx
0x10032e67d: sub rsp, 0x208
0x10032e684: mov qword ptr [rbp - 0x228], rsi
0x10032e68b: mov r13, rdi
0x10032e68e: mov rax, qword ptr [rip + 0x8df243] ; 0x100c0d8d8
0x10032e695: mov rax, qword ptr [rax]
0x10032e698: mov qword ptr [rbp - 0x30], rax
0x10032e69c: mov ebx, 0x30
0x10032e6a1: nop word ptr cs:[rax + rax]
0x10032e6b0: mov rdi, qword ptr [r13 + rbx]
0x10032e6b5: test rdi, rdi
0x10032e6b8: je 0x10032e6e0
0x10032e6ba: cmp dword ptr [rdi + 0x28], 2
0x10032e6be: je 0x10032e6e0
0x10032e6c0: cmp byte ptr [rdi + 0x23], 0
0x10032e6c4: je 0x10032e6e0
0x10032e6c6: mov rax, qword ptr [rdi]
0x10032e6c9: mov rsi, qword ptr [rbp - 0x228]
0x10032e6d0: call qword ptr [rax + 0x40]
0x10032e6d3: nop word ptr cs:[rax + rax]
0x10032e6e0: add rbx, 0x10
0x10032e6e4: cmp rbx, 0x5030
0x10032e6eb: jne 0x10032e6b0
0x10032e6ed: lea r12, [r13 + 0x5040]
0x10032e6f4: lea rax, [r13 + 0x85098]
0x10032e6fb: mov qword ptr [rbp - 0x220], rax
0x10032e702: lea rbx, [r13 + 0x5020]
0x10032e709: xor r15d, r15d
0x10032e70c: nop dword ptr [rax]
0x10032e710: mov rdi, qword ptr [rbx + r15]
0x10032e714: test rdi, rdi
0x10032e717: je 0x10032e778
0x10032e719: cmp dword ptr [rdi + 0x28], 2
0x10032e71d: je 0x10032e778
0x10032e71f: lea r14, [rbx + r15]
0x10032e723: cmp byte ptr [rdi + 0x20], 0
0x10032e727: je 0x10032e741
0x10032e729: mov rax, qword ptr [rdi]
0x10032e72c: mov rsi, qword ptr [rbp - 0x228]
0x10032e733: mov rdx, qword ptr [rbp - 0x220]
0x10032e73a: call qword ptr [rax + 0x18]
0x10032e73d: mov rdi, qword ptr [rbx + r15]
0x10032e741: mov rax, qword ptr [rdi]
0x10032e744: call qword ptr [rax]
0x10032e746: mov rsi, qword ptr [r13 + r15 + 0x5020]
0x10032e74e: mov rdi, r12
0x10032e751: call 0x100795a70 ; 0x100795a70
0x10032e756: mov qword ptr [r13 + r15 + 0x5020], 0
0x10032e762: mov rax, qword ptr [r13 + 0x5030]
0x10032e769: mov qword ptr [r13 + r15 + 0x5028], rax
0x10032e771: mov qword ptr [r13 + 0x5030], r14
0x10032e778: add r15, -0x10
0x10032e77c: cmp r15, -0x5000
0x10032e783: jne 0x10032e710
0x10032e785: mov word ptr [r13 + 0xc], 0
0x10032e78c: lea rdi, [r13 + 0x18]
0x10032e790: lea rbx, [r13 + 0x20]
0x10032e794: mov rsi, qword ptr [r13 + 0x20]
0x10032e798: call 0x10032fa30 ; 0x10032fa30
0x10032e79d: mov qword ptr [r13 + 0x18], rbx
0x10032e7a1: vxorps xmm0, xmm0, xmm0
0x10032e7a5: vmovups xmmword ptr [r13 + 0x20], xmm0
0x10032e7ab: mov byte ptr [r13 + 0x5038], 1
0x10032e7b3: lea rdi, [rbp - 0xc8]
0x10032e7ba: lea rbx, [rbp - 0x210]
0x10032e7c1: mov rax, qword ptr [rip + 0x8dbd58] ; 0x100c0a520
0x10032e7c8: lea rcx, [rax + 0x18]
0x10032e7cc: mov qword ptr [rbp - 0x218], rcx
0x10032e7d3: add rax, 0x40
0x10032e7d7: mov qword ptr [rbp - 0xc8], rax
0x10032e7de: mov rsi, rbx
0x10032e7e1: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x10032e7e6: mov qword ptr [rbp - 0x40], 0
0x10032e7ee: mov dword ptr [rbp - 0x38], 0xffffffff
0x10032e7f5: mov r14, qword ptr [rip + 0x8dedcc] ; 0x100c0d5c8
0x10032e7fc: lea r12, [r14 + 0x18]
0x10032e800: mov qword ptr [rbp - 0x218], r12
0x10032e807: add r14, 0x40
0x10032e80b: mov qword ptr [rbp - 0xc8], r14
0x10032e812: lea rsi, [rip + 0x852891] ; 0x100b810aa EventBarn
0x10032e819: mov edx, 2
0x10032e81e: mov r15, rbx
0x10032e821: mov rdi, rbx
0x10032e824: call 0x1007a56a0 ; 0x1007a56a0
0x10032e829: lea rsi, [rip + 0x852964] ; 0x100b81194 OnLevelUnload(): memory change after LevelLoad and LevelUnload: cycle 
0x10032e830: lea rdi, [rbp - 0x218]
0x10032e837: mov edx, 0x46
0x10032e83c: call 0x100011930 ; 0x100011930
0x10032e841: mov rbx, rax
0x10032e844: mov rdi, qword ptr [rbp - 0x220]
0x10032e84b: call 0x100795b00 ; 0x100795b00
0x10032e850: mov ecx, dword ptr [r13 + 0x1050f0]
0x10032e857: sub rax, rcx
0x10032e85a: mov rdi, rbx
0x10032e85d: mov rsi, rax
0x10032e860: call 0x100aa23e4 ; 0x100aa23e4 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEm
0x10032e865: mov qword ptr [rbp - 0x218], r12
0x10032e86c: mov qword ptr [rbp - 0xc8], r14
0x10032e873: mov rdi, r15
0x10032e876: call 0x1007a58d0 ; 0x1007a58d0
0x10032e87b: mov rsi, qword ptr [rip + 0x8dbcfe] ; 0x100c0a580
0x10032e882: add rsi, 8
0x10032e886: lea rdi, [rbp - 0x218]
0x10032e88d: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10032e892: lea rdi, [rbp - 0xc8]
0x10032e899: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10032e89e: mov rax, qword ptr [rip + 0x8df033] ; 0x100c0d8d8
0x10032e8a5: mov rax, qword ptr [rax]
0x10032e8a8: cmp rax, qword ptr [rbp - 0x30]
0x10032e8ac: jne 0x10032e8c0
0x10032e8ae: add rsp, 0x208
0x10032e8b5: pop rbx
0x10032e8b6: pop r12
0x10032e8b8: pop r13
0x10032e8ba: pop r14
0x10032e8bc: pop r15
0x10032e8be: pop rbp
0x10032e8bf: ret 
0x10032e8c0: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10032e8c5: mov rbx, rax
0x10032e8c8: jmp 0x10032e8e8 ; 0x10032e8e8
0x10032e8ca: mov rbx, rax
0x10032e8cd: jmp 0x10032e8ff ; 0x10032e8ff
0x10032e8cf: mov rbx, rax
0x10032e8d2: mov qword ptr [rbp - 0x218], r12
0x10032e8d9: mov qword ptr [rbp - 0xc8], r14
0x10032e8e0: mov rdi, r15
0x10032e8e3: call 0x1007a58d0 ; 0x1007a58d0
0x10032e8e8: mov rsi, qword ptr [rip + 0x8dbc91] ; 0x100c0a580
0x10032e8ef: add rsi, 8
0x10032e8f3: lea rdi, [rbp - 0x218]
0x10032e8fa: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10032e8ff: lea rdi, [rbp - 0xc8]
0x10032e906: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10032e90b: mov rdi, rbx
0x10032e90e: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10032e913: nop word ptr cs:[rax + rax]
