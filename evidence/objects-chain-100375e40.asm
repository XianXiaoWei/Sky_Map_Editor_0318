0x100375e40: push rbp
0x100375e41: mov rbp, rsp
0x100375e44: push r15
0x100375e46: push r14
0x100375e48: push r13
0x100375e4a: push r12
0x100375e4c: push rbx
0x100375e4d: sub rsp, 0x208
0x100375e54: mov dword ptr [rbp - 0x220], r8d
0x100375e5b: mov r15, rcx
0x100375e5e: mov r13, rdx
0x100375e61: mov r12, rsi
0x100375e64: mov rbx, rdi
0x100375e67: mov rax, qword ptr [rip + 0x897a6a] ; 0x100c0d8d8
0x100375e6e: mov rax, qword ptr [rax]
0x100375e71: mov qword ptr [rbp - 0x30], rax
0x100375e75: call 0x1007e8580 ; 0x1007e8580
0x100375e7a: mov r14, rax
0x100375e7d: mov rdi, rbx
0x100375e80: mov rsi, r12
0x100375e83: mov qword ptr [rbp - 0x228], r15
0x100375e8a: mov rdx, r15
0x100375e8d: mov rcx, r13
0x100375e90: call 0x1007c38b0 ; 0x1007c38b0
0x100375e95: test al, al
0x100375e97: je 0x100376028
0x100375e9d: cmp qword ptr [rbx + 0x4c0], 0
0x100375ea5: je 0x100375ec5
0x100375ea7: movzx r15d, byte ptr [rbp - 0x220]
0x100375eaf: nop 
0x100375eb0: mov rdi, rbx
0x100375eb3: mov esi, r15d
0x100375eb6: call 0x1007c3d20 ; 0x1007c3d20
0x100375ebb: cmp qword ptr [rbx + 0x4c0], 0
0x100375ec3: jne 0x100375eb0
0x100375ec5: mov rdi, r14
0x100375ec8: call 0x1007e8590 ; 0x1007e8590
0x100375ecd: vmovsd qword ptr [rbp - 0x220], xmm0
0x100375ed5: lea r14, [rbp - 0xc8]
0x100375edc: lea r15, [rbp - 0x210]
0x100375ee3: mov rax, qword ptr [rip + 0x894636] ; 0x100c0a520
0x100375eea: lea rcx, [rax + 0x18]
0x100375eee: mov qword ptr [rbp - 0x218], rcx
0x100375ef5: add rax, 0x40
0x100375ef9: mov qword ptr [rbp - 0xc8], rax
0x100375f00: mov rdi, r14
0x100375f03: mov rsi, r15
0x100375f06: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x100375f0b: mov qword ptr [rbp - 0x40], 0
0x100375f13: mov dword ptr [rbp - 0x38], 0xffffffff
0x100375f1a: mov r12, qword ptr [rip + 0x8976a7] ; 0x100c0d5c8
0x100375f21: lea r13, [r12 + 0x18]
0x100375f26: mov qword ptr [rbp - 0x218], r13
0x100375f2d: add r12, 0x40
0x100375f31: mov qword ptr [rbp - 0xc8], r12
0x100375f38: lea rsi, [rip + 0x80d862] ; 0x100b837a1 Resources
0x100375f3f: mov edx, 2
0x100375f44: mov rdi, r15
0x100375f47: call 0x1007a56a0 ; 0x1007a56a0
0x100375f4c: lea rsi, [rip + 0x80d858] ; 0x100b837ab Loaded 
0x100375f53: lea rdi, [rbp - 0x218]
0x100375f5a: mov edx, 7
0x100375f5f: call 0x100011930 ; 0x100011930
0x100375f64: mov rbx, rax
0x100375f67: mov r14, qword ptr [rbp - 0x228]
0x100375f6e: mov rdi, r14
0x100375f71: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x100375f76: mov rdi, rbx
0x100375f79: mov rsi, r14
0x100375f7c: mov rdx, rax
0x100375f7f: call 0x100011930 ; 0x100011930
0x100375f84: lea rsi, [rip + 0x80d828] ; 0x100b837b3  in 
0x100375f8b: mov edx, 4
0x100375f90: mov rdi, rax
0x100375f93: call 0x100011930 ; 0x100011930
0x100375f98: vmovsd xmm0, qword ptr [rbp - 0x220]
0x100375fa0: vdivsd xmm0, xmm0, qword ptr [rip + 0x7470e0] ; 0x100abd088
0x100375fa8: vcvtsd2ss xmm0, xmm0, xmm0
0x100375fac: mov rdi, rax
0x100375faf: call 0x100aa23d2 ; 0x100aa23d2 __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEElsEf
0x100375fb4: lea rsi, [rip + 0x80d7fd] ; 0x100b837b8 ms
0x100375fbb: mov edx, 2
0x100375fc0: mov rdi, rax
0x100375fc3: call 0x100011930 ; 0x100011930
0x100375fc8: mov qword ptr [rbp - 0x218], r13
0x100375fcf: mov qword ptr [rbp - 0xc8], r12
0x100375fd6: mov rdi, r15
0x100375fd9: call 0x1007a58d0 ; 0x1007a58d0
0x100375fde: mov rsi, qword ptr [rip + 0x89459b] ; 0x100c0a580
0x100375fe5: add rsi, 8
0x100375fe9: lea rdi, [rbp - 0x218]
0x100375ff0: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100375ff5: lea rdi, [rbp - 0xc8]
0x100375ffc: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100376001: mov rax, qword ptr [rip + 0x8978d0] ; 0x100c0d8d8
0x100376008: mov rax, qword ptr [rax]
0x10037600b: cmp rax, qword ptr [rbp - 0x30]
0x10037600f: jne 0x100376023
0x100376011: add rsp, 0x208
0x100376018: pop rbx
0x100376019: pop r12
0x10037601b: pop r13
0x10037601d: pop r14
0x10037601f: pop r15
0x100376021: pop rbp
0x100376022: ret 
0x100376023: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100376028: lea rdi, [rip + 0x8035cc] ; 0x100b795fb success
0x10037602f: lea rsi, [rip + 0x80ce3b] ; 0x100b82e71 Game.cpp
0x100376036: lea r8, [rip + 0x80d749] ; 0x100b83786 ResourceScript "%s" failed
0x10037603d: mov edx, 0x232
0x100376042: mov ecx, 4
0x100376047: xor eax, eax
0x100376049: mov r9, qword ptr [rbp - 0x228]
0x100376050: call 0x1007e6030 ; 0x1007e6030
0x100376055: ud2 
0x100376057: mov rbx, rax
0x10037605a: mov rsi, qword ptr [rip + 0x89451f] ; 0x100c0a580
0x100376061: add rsi, 8
0x100376065: lea rdi, [rbp - 0x218]
0x10037606c: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x100376071: mov rdi, r14
0x100376074: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x100376079: mov rdi, rbx
0x10037607c: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100376081: mov rbx, rax
0x100376084: mov rdi, r14
0x100376087: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10037608c: mov rdi, rbx
0x10037608f: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100376094: mov rbx, rax
0x100376097: mov qword ptr [rbp - 0x218], r13
0x10037609e: mov qword ptr [rbp - 0xc8], r12
0x1003760a5: mov rdi, r15
0x1003760a8: call 0x1007a58d0 ; 0x1007a58d0
0x1003760ad: mov rsi, qword ptr [rip + 0x8944cc] ; 0x100c0a580
0x1003760b4: add rsi, 8
0x1003760b8: lea rdi, [rbp - 0x218]
0x1003760bf: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1003760c4: lea rdi, [rbp - 0xc8]
0x1003760cb: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1003760d0: mov rdi, rbx
0x1003760d3: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1003760d8: nop dword ptr [rax + rax]
