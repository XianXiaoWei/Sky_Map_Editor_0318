0x1007bdb70: push rbp
0x1007bdb71: mov rbp, rsp
0x1007bdb74: push r15
0x1007bdb76: push r14
0x1007bdb78: push r13
0x1007bdb7a: push r12
0x1007bdb7c: push rbx
0x1007bdb7d: sub rsp, 0x218
0x1007bdb84: mov dword ptr [rbp - 0x234], edx
0x1007bdb8a: mov rax, qword ptr [rip + 0x44fd47] ; 0x100c0d8d8
0x1007bdb91: mov rax, qword ptr [rax]
0x1007bdb94: mov qword ptr [rbp - 0x30], rax
0x1007bdb98: mov qword ptr [rbp - 0x240], rdi
0x1007bdb9f: mov rax, qword ptr [rdi + 0x158]
0x1007bdba6: mov rax, qword ptr [rax + 8]
0x1007bdbaa: mov rbx, qword ptr [rax + 0x40]
0x1007bdbae: mov r15d, dword ptr [rax + 0x38]
0x1007bdbb2: lea rdi, [rbp - 0x218]
0x1007bdbb9: mov edx, 0x1c
0x1007bdbbe: mov qword ptr [rbp - 0x228], rsi
0x1007bdbc5: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1007bdbca: lea rax, [r15 + r15*2]
0x1007bdbce: shl rax, 4
0x1007bdbd2: add rax, rbx
0x1007bdbd5: mov qword ptr [rbp - 0x230], rax
0x1007bdbdc: mov qword ptr [rbp - 0x220], rbx
0x1007bdbe3: test r15, r15
0x1007bdbe6: je 0x1007bdc3b
0x1007bdbe8: lea r13, [rbp - 0x218]
0x1007bdbef: mov rbx, qword ptr [rbp - 0x220]
0x1007bdbf6: nop word ptr cs:[rax + rax]
0x1007bdc00: mov r14, r15
0x1007bdc03: shr r14, 0x3f
0x1007bdc07: add r14, r15
0x1007bdc0a: sar r14, 1
0x1007bdc0d: lea r12, [r14 + r14*2]
0x1007bdc11: shl r12, 4
0x1007bdc15: lea rdi, [rbx + r12]
0x1007bdc19: mov rsi, r13
0x1007bdc1c: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007bdc21: dec r15
0x1007bdc24: sub r15, r14
0x1007bdc27: test eax, eax
0x1007bdc29: lea rax, [rbx + r12 + 0x30]
0x1007bdc2e: cmovns r15, r14
0x1007bdc32: cmovs rbx, rax
0x1007bdc36: test r15, r15
0x1007bdc39: jne 0x1007bdc00
0x1007bdc3b: cmp rbx, qword ptr [rbp - 0x230]
0x1007bdc42: je 0x1007bdc5b
0x1007bdc44: mov rdi, qword ptr [rbp - 0x228]
0x1007bdc4b: mov rsi, rbx
0x1007bdc4e: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007bdc53: test eax, eax
0x1007bdc55: je 0x1007bde62
0x1007bdc5b: mov rax, qword ptr [rbp - 0x240]
0x1007bdc62: mov rax, qword ptr [rax + 0x158]
0x1007bdc69: mov rax, qword ptr [rax + 8]
0x1007bdc6d: mov r15, qword ptr [rax + 0x30]
0x1007bdc71: mov ebx, dword ptr [rax + 0x28]
0x1007bdc74: lea rdi, [rbp - 0x218]
0x1007bdc7b: mov edx, 0x1c
0x1007bdc80: mov rsi, qword ptr [rbp - 0x228]
0x1007bdc87: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1007bdc8c: mov rax, rbx
0x1007bdc8f: shl rax, 5
0x1007bdc93: add rax, r15
0x1007bdc96: mov qword ptr [rbp - 0x230], rax
0x1007bdc9d: mov qword ptr [rbp - 0x220], r15
0x1007bdca4: test rbx, rbx
0x1007bdca7: je 0x1007bdcfa
0x1007bdca9: lea r13, [rbp - 0x218]
0x1007bdcb0: mov r15, qword ptr [rbp - 0x220]
0x1007bdcb7: nop word ptr [rax + rax]
0x1007bdcc0: mov r14, rbx
0x1007bdcc3: shr r14, 0x3f
0x1007bdcc7: add r14, rbx
0x1007bdcca: sar r14, 1
0x1007bdccd: mov r12, r14
0x1007bdcd0: shl r12, 5
0x1007bdcd4: lea rdi, [r15 + r12]
0x1007bdcd8: mov rsi, r13
0x1007bdcdb: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007bdce0: dec rbx
0x1007bdce3: sub rbx, r14
0x1007bdce6: test eax, eax
0x1007bdce8: lea rax, [r15 + r12 + 0x20]
0x1007bdced: cmovns rbx, r14
0x1007bdcf1: cmovs r15, rax
0x1007bdcf5: test rbx, rbx
0x1007bdcf8: jne 0x1007bdcc0
0x1007bdcfa: mov r13d, 0xffffffff
0x1007bdd00: cmp r15, qword ptr [rbp - 0x230]
0x1007bdd07: je 0x1007bdd20
0x1007bdd09: mov rdi, qword ptr [rbp - 0x228]
0x1007bdd10: mov rsi, r15
0x1007bdd13: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007bdd18: test eax, eax
0x1007bdd1a: je 0x1007bde7e
0x1007bdd20: test r13d, r13d
0x1007bdd23: jns 0x1007bde95
0x1007bdd29: cmp byte ptr [rbp - 0x234], 0
0x1007bdd30: je 0x1007bde95
0x1007bdd36: lea rdi, [rbp - 0xc8]
0x1007bdd3d: lea rbx, [rbp - 0x210]
0x1007bdd44: mov rax, qword ptr [rip + 0x44c7d5] ; 0x100c0a520
0x1007bdd4b: lea rcx, [rax + 0x18]
0x1007bdd4f: mov qword ptr [rbp - 0x218], rcx
0x1007bdd56: add rax, 0x40
0x1007bdd5a: mov qword ptr [rbp - 0xc8], rax
0x1007bdd61: mov rsi, rbx
0x1007bdd64: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1007bdd69: mov qword ptr [rbp - 0x40], 0
0x1007bdd71: mov dword ptr [rbp - 0x38], 0xffffffff
0x1007bdd78: mov r14, qword ptr [rip + 0x44f849] ; 0x100c0d5c8
0x1007bdd7f: lea rax, [r14 + 0x18]
0x1007bdd83: mov r12, rax
0x1007bdd86: mov qword ptr [rbp - 0x218], rax
0x1007bdd8d: add r14, 0x40
0x1007bdd91: mov qword ptr [rbp - 0xc8], r14
0x1007bdd98: lea rsi, [rip + 0x3dcb5b] ; 0x100b9a8fa Shader
0x1007bdd9f: mov edx, 1
0x1007bdda4: mov rdi, rbx
0x1007bdda7: call 0x1007a56a0 ; 0x1007a56a0
0x1007bddac: lea rsi, [rip + 0x3e61df] ; 0x100ba3f92 Shader 
0x1007bddb3: lea rdi, [rbp - 0x218]
0x1007bddba: mov edx, 7
0x1007bddbf: call 0x100011930 ; 0x100011930
0x1007bddc4: mov r15, rax
0x1007bddc7: mov rax, qword ptr [rbp - 0x240]
0x1007bddce: mov rax, qword ptr [rax + 0x158]
0x1007bddd5: mov rbx, qword ptr [rax + 8]
0x1007bddd9: mov rdi, rbx
0x1007bdddc: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1007bdde1: mov rdi, r15
0x1007bdde4: mov rsi, rbx
0x1007bdde7: mov rdx, rax
0x1007bddea: call 0x100011930 ; 0x100011930
0x1007bddef: lea rsi, [rip + 0x3e61a4] ; 0x100ba3f9a  has no uniform called 
0x1007bddf6: mov edx, 0x17
0x1007bddfb: mov rdi, rax
0x1007bddfe: call 0x100011930 ; 0x100011930
0x1007bde03: mov r15, rax
0x1007bde06: mov rbx, qword ptr [rbp - 0x228]
0x1007bde0d: mov rdi, rbx
0x1007bde10: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1007bde15: mov rdi, r15
0x1007bde18: mov rsi, rbx
0x1007bde1b: mov rdx, rax
0x1007bde1e: call 0x100011930 ; 0x100011930
0x1007bde23: mov qword ptr [rbp - 0x218], r12
0x1007bde2a: mov qword ptr [rbp - 0xc8], r14
0x1007bde31: lea rdi, [rbp - 0x210]
0x1007bde38: call 0x1007a58d0 ; 0x1007a58d0
0x1007bde3d: mov rsi, qword ptr [rip + 0x44c73c] ; 0x100c0a580
0x1007bde44: add rsi, 8
0x1007bde48: lea rdi, [rbp - 0x218]
0x1007bde4f: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1007bde54: lea rdi, [rbp - 0xc8]
0x1007bde5b: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1007bde60: jmp 0x1007bde95 ; 0x1007bde95
0x1007bde62: sub rbx, qword ptr [rbp - 0x220]
0x1007bde69: shr rbx, 4
0x1007bde6d: imul r13d, ebx, 0xaaaaaaab
0x1007bde74: test r13d, r13d
0x1007bde77: jns 0x1007bde95
0x1007bde79: jmp 0x1007bdc5b ; 0x1007bdc5b
0x1007bde7e: sub r15, qword ptr [rbp - 0x220]
0x1007bde85: shr r15, 5
0x1007bde89: mov r13d, r15d
0x1007bde8c: test r13d, r13d
0x1007bde8f: js 0x1007bdd29
0x1007bde95: mov rax, qword ptr [rip + 0x44fa3c] ; 0x100c0d8d8
0x1007bde9c: mov rax, qword ptr [rax]
0x1007bde9f: cmp rax, qword ptr [rbp - 0x30]
0x1007bdea3: jne 0x1007bdeba
0x1007bdea5: mov eax, r13d
0x1007bdea8: add rsp, 0x218
0x1007bdeaf: pop rbx
0x1007bdeb0: pop r12
0x1007bdeb2: pop r13
0x1007bdeb4: pop r14
0x1007bdeb6: pop r15
0x1007bdeb8: pop rbp
0x1007bdeb9: ret 
0x1007bdeba: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1007bdebf: mov rbx, rax
0x1007bdec2: jmp 0x1007bdee6 ; 0x1007bdee6
0x1007bdec4: mov rbx, rax
0x1007bdec7: jmp 0x1007bdefd ; 0x1007bdefd
0x1007bdec9: mov rbx, rax
0x1007bdecc: mov qword ptr [rbp - 0x218], r12
0x1007bded3: mov qword ptr [rbp - 0xc8], r14
0x1007bdeda: lea rdi, [rbp - 0x210]
0x1007bdee1: call 0x1007a58d0 ; 0x1007a58d0
0x1007bdee6: mov rsi, qword ptr [rip + 0x44c693] ; 0x100c0a580
0x1007bdeed: add rsi, 8
0x1007bdef1: lea rdi, [rbp - 0x218]
0x1007bdef8: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1007bdefd: lea rdi, [rbp - 0xc8]
0x1007bdf04: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1007bdf09: mov rdi, rbx
0x1007bdf0c: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1007bdf11: nop word ptr cs:[rax + rax]

