0x1000198c0: push rbp
0x1000198c1: mov rbp, rsp
0x1000198c4: push r15
0x1000198c6: push r14
0x1000198c8: push r13
0x1000198ca: push r12
0x1000198cc: push rbx
0x1000198cd: sub rsp, 0x18
0x1000198d1: mov r12, r8
0x1000198d4: mov r15, rcx
0x1000198d7: mov rbx, rdx
0x1000198da: mov r13, rsi
0x1000198dd: mov eax, 0xfef
0x1000198e2: sub rax, r13
0x1000198e5: cmp rax, rbx
0x1000198e8: jb 0x1000199e4
0x1000198ee: test byte ptr [rdi], 1
0x1000198f1: jne 0x1000198f9
0x1000198f3: lea rax, [rdi + 1]
0x1000198f7: jmp 0x1000198fd ; 0x1000198fd
0x1000198f9: mov rax, qword ptr [rdi + 0x10]
0x1000198fd: mov qword ptr [rbp - 0x30], rax
0x100019901: cmp r13, 0x7e7
0x100019908: mov qword ptr [rbp - 0x38], rdi
0x10001990c: mov qword ptr [rbp - 0x40], r9
0x100019910: ja 0x10001992e
0x100019912: add rbx, r13
0x100019915: lea rax, [r13 + r13]
0x10001991a: cmp rbx, rax
0x10001991d: cmovb rbx, rax
0x100019921: cmp rbx, 0x17
0x100019925: jae 0x100019935
0x100019927: mov ebx, 0x17
0x10001992c: jmp 0x10001993d ; 0x10001993d
0x10001992e: mov ebx, 0xff0
0x100019933: jmp 0x10001993d ; 0x10001993d
0x100019935: add rbx, 0x10
0x100019939: and rbx, 0xfffffffffffffff0
0x10001993d: call 0x1007e50d0 ; 0x1007e50d0
0x100019942: mov rdi, rax
0x100019945: mov rsi, rbx
0x100019948: call 0x1007e5790 ; 0x1007e5790
0x10001994d: mov r14, rax
0x100019950: test r12, r12
0x100019953: je 0x100019964
0x100019955: mov rdi, r14
0x100019958: mov rsi, qword ptr [rbp - 0x30]
0x10001995c: mov rdx, r12
0x10001995f: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x100019964: mov rdx, qword ptr [rbp + 0x10]
0x100019968: test rdx, rdx
0x10001996b: je 0x10001997a
0x10001996d: mov rsi, qword ptr [rbp + 0x18]
0x100019971: lea rdi, [r14 + r12]
0x100019975: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x10001997a: mov rax, qword ptr [rbp - 0x40]
0x10001997e: sub r15, rax
0x100019981: mov rdx, r15
0x100019984: sub rdx, r12
0x100019987: je 0x1000199a2
0x100019989: mov rdi, r14
0x10001998c: add rdi, r12
0x10001998f: add rdi, qword ptr [rbp + 0x10]
0x100019993: add r12, qword ptr [rbp - 0x30]
0x100019997: add r12, rax
0x10001999a: mov rsi, r12
0x10001999d: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1000199a2: cmp r13, 0x16
0x1000199a6: je 0x1000199b9
0x1000199a8: call 0x1007e50d0 ; 0x1007e50d0
0x1000199ad: mov rdi, rax
0x1000199b0: mov rsi, qword ptr [rbp - 0x30]
0x1000199b4: call 0x1007e5db0 ; 0x1007e5db0
0x1000199b9: mov rax, qword ptr [rbp - 0x38]
0x1000199bd: mov qword ptr [rax + 0x10], r14
0x1000199c1: or rbx, 1
0x1000199c5: mov qword ptr [rax], rbx
0x1000199c8: add r15, qword ptr [rbp + 0x10]
0x1000199cc: mov qword ptr [rax + 8], r15
0x1000199d0: mov byte ptr [r14 + r15], 0
0x1000199d5: add rsp, 0x18
0x1000199d9: pop rbx
0x1000199da: pop r12
0x1000199dc: pop r13
0x1000199de: pop r14
0x1000199e0: pop r15
0x1000199e2: pop rbp
0x1000199e3: ret 
0x1000199e4: call 0x100aa230c ; 0x100aa230c __ZNKSt3__121__basic_string_commonILb1EE20__throw_length_errorEv
0x1000199e9: mov rdi, rax
0x1000199ec: call 0x100011bf0 ; 0x100011bf0
0x1000199f1: nop word ptr cs:[rax + rax]
