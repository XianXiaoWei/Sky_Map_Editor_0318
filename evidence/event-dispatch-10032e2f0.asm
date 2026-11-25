0x10032e2f0: push rbp
0x10032e2f1: mov rbp, rsp
0x10032e2f4: push r15
0x10032e2f6: push r14
0x10032e2f8: push r13
0x10032e2fa: push r12
0x10032e2fc: push rbx
0x10032e2fd: sub rsp, 0x1f8
0x10032e304: mov rbx, rdi
0x10032e307: mov rax, qword ptr [rip + 0x8df5ca] ; 0x100c0d8d8
0x10032e30e: mov rax, qword ptr [rax]
0x10032e311: mov qword ptr [rbp - 0x30], rax
0x10032e315: cmp byte ptr [rbx + 0x21], 0
0x10032e319: jne 0x10032e404
0x10032e31f: mov rax, qword ptr [rbx + 0x18]
0x10032e323: test rax, rax
0x10032e326: je 0x10032e339
0x10032e328: mov ecx, dword ptr [rax + 0x10]
0x10032e32b: lea edx, [rcx + 1]
0x10032e32e: mov dword ptr [rax + 0x10], edx
0x10032e331: mov dword ptr [rbx + 0x10], ecx
0x10032e334: jmp 0x10032e404 ; 0x10032e404
0x10032e339: mov dword ptr [rbx + 0x10], 0
0x10032e340: lea r14, [rbp - 0xc8]
0x10032e347: lea r15, [rbp - 0x210]
0x10032e34e: mov rax, qword ptr [rip + 0x8dc1cb] ; 0x100c0a520
0x10032e355: lea rcx, [rax + 0x18]
0x10032e359: mov qword ptr [rbp - 0x218], rcx
0x10032e360: add rax, 0x40
0x10032e364: mov qword ptr [rbp - 0xc8], rax
0x10032e36b: mov rdi, r14
0x10032e36e: mov rsi, r15
0x10032e371: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x10032e376: mov qword ptr [rbp - 0x40], 0
0x10032e37e: mov dword ptr [rbp - 0x38], 0xffffffff
0x10032e385: mov r12, qword ptr [rip + 0x8df23c] ; 0x100c0d5c8
0x10032e38c: lea r13, [r12 + 0x18]
0x10032e391: mov qword ptr [rbp - 0x218], r13
0x10032e398: add r12, 0x40
0x10032e39c: mov qword ptr [rbp - 0xc8], r12
0x10032e3a3: lea rsi, [rip + 0x84f867] ; 0x100b7dc11 Event
0x10032e3aa: mov edx, 1
0x10032e3af: mov rdi, r15
0x10032e3b2: call 0x1007a56a0 ; 0x1007a56a0
0x10032e3b7: lea rsi, [rip + 0x852d28] ; 0x100b810e6 Called Start() on an Event with a null m_eventBarn, will have 0 seq (undefined order).
0x10032e3be: lea rdi, [rbp - 0x218]
0x10032e3c5: mov edx, 0x56
0x10032e3ca: call 0x100011930 ; 0x100011930
0x10032e3cf: mov qword ptr [rbp - 0x218], r13
0x10032e3d6: mov qword ptr [rbp - 0xc8], r12
0x10032e3dd: mov rdi, r15
0x10032e3e0: call 0x1007a58d0 ; 0x1007a58d0
0x10032e3e5: mov rsi, qword ptr [rip + 0x8dc194] ; 0x100c0a580
0x10032e3ec: add rsi, 8
0x10032e3f0: lea rdi, [rbp - 0x218]
0x10032e3f7: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10032e3fc: mov rdi, r14
0x10032e3ff: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10032e404: mov word ptr [rbx + 0x21], 1
0x10032e40a: mov rax, qword ptr [rip + 0x8df4c7] ; 0x100c0d8d8
0x10032e411: mov rax, qword ptr [rax]
0x10032e414: cmp rax, qword ptr [rbp - 0x30]
0x10032e418: jne 0x10032e42c
0x10032e41a: add rsp, 0x1f8
0x10032e421: pop rbx
0x10032e422: pop r12
0x10032e424: pop r13
0x10032e426: pop r14
0x10032e428: pop r15
0x10032e42a: pop rbp
0x10032e42b: ret 
0x10032e42c: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10032e431: mov rbx, rax
0x10032e434: mov qword ptr [rbp - 0x218], r13
0x10032e43b: mov qword ptr [rbp - 0xc8], r12
0x10032e442: mov rdi, r15
0x10032e445: call 0x1007a58d0 ; 0x1007a58d0
0x10032e44a: jmp 0x10032e44f ; 0x10032e44f
0x10032e44c: mov rbx, rax
0x10032e44f: mov rsi, qword ptr [rip + 0x8dc12a] ; 0x100c0a580
0x10032e456: add rsi, 8
0x10032e45a: lea rdi, [rbp - 0x218]
0x10032e461: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x10032e466: jmp 0x10032e46b ; 0x10032e46b
0x10032e468: mov rbx, rax
0x10032e46b: mov rdi, r14
0x10032e46e: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x10032e473: mov rdi, rbx
0x10032e476: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10032e47b: nop dword ptr [rax + rax]
