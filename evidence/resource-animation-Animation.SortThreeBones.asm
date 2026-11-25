0x10009f220: push rbp
0x10009f221: mov rbp, rsp
0x10009f224: push r15
0x10009f226: push r14
0x10009f228: push r13
0x10009f22a: push r12
0x10009f22c: push rbx
0x10009f22d: sub rsp, 0x38
0x10009f231: mov r13, rcx
0x10009f234: mov r15, rdx
0x10009f237: mov qword ptr [rbp - 0x30], rsi
0x10009f23b: movzx ecx, word ptr [rsi]
0x10009f23e: mov qword ptr [rbp - 0x40], rdi
0x10009f242: movzx eax, word ptr [rdi]
0x10009f245: mov r12d, r8d
0x10009f248: mov qword ptr [rbp - 0x50], rcx
0x10009f24c: imul r14, rcx, 0x44
0x10009f250: add r14, r13
0x10009f253: add r14, r12
0x10009f256: mov qword ptr [rbp - 0x58], rax
0x10009f25a: imul rbx, rax, 0x44
0x10009f25e: add rbx, r13
0x10009f261: add rbx, r12
0x10009f264: mov rdi, r14
0x10009f267: mov rsi, rbx
0x10009f26a: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009f26f: mov dword ptr [rbp - 0x44], eax
0x10009f272: mov qword ptr [rbp - 0x38], r15
0x10009f276: movzx r15d, word ptr [r15]
0x10009f27a: imul rdi, r15, 0x44
0x10009f27e: add rdi, r13
0x10009f281: add rdi, r12
0x10009f284: mov rsi, r14
0x10009f287: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009f28c: mov ecx, eax
0x10009f28e: cmp dword ptr [rbp - 0x44], 0
0x10009f292: jns 0x10009f2b5
0x10009f294: test ecx, ecx
0x10009f296: jns 0x10009f312
0x10009f298: mov rax, qword ptr [rbp - 0x40]
0x10009f29c: mov word ptr [rax], r15w
0x10009f2a0: mov rax, qword ptr [rbp - 0x38]
0x10009f2a4: mov rcx, qword ptr [rbp - 0x58]
0x10009f2a8: mov word ptr [rax], cx
0x10009f2ab: mov eax, 1
0x10009f2b0: jmp 0x10009f366 ; 0x10009f366
0x10009f2b5: xor eax, eax
0x10009f2b7: test ecx, ecx
0x10009f2b9: jns 0x10009f366
0x10009f2bf: mov rax, qword ptr [rbp - 0x30]
0x10009f2c3: mov word ptr [rax], r15w
0x10009f2c7: mov rcx, qword ptr [rbp - 0x38]
0x10009f2cb: mov rdx, qword ptr [rbp - 0x50]
0x10009f2cf: mov word ptr [rcx], dx
0x10009f2d2: movzx r14d, word ptr [rax]
0x10009f2d6: mov rax, qword ptr [rbp - 0x40]
0x10009f2da: movzx ebx, word ptr [rax]
0x10009f2dd: imul rdi, r14, 0x44
0x10009f2e1: add rdi, r13
0x10009f2e4: add rdi, r12
0x10009f2e7: imul rsi, rbx, 0x44
0x10009f2eb: add rsi, r13
0x10009f2ee: add rsi, r12
0x10009f2f1: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009f2f6: mov ecx, eax
0x10009f2f8: mov eax, 1
0x10009f2fd: test ecx, ecx
0x10009f2ff: jns 0x10009f366
0x10009f301: mov rax, qword ptr [rbp - 0x40]
0x10009f305: mov word ptr [rax], r14w
0x10009f309: mov rax, qword ptr [rbp - 0x30]
0x10009f30d: mov word ptr [rax], bx
0x10009f310: jmp 0x10009f361 ; 0x10009f361
0x10009f312: mov rax, qword ptr [rbp - 0x40]
0x10009f316: mov rcx, qword ptr [rbp - 0x50]
0x10009f31a: mov word ptr [rax], cx
0x10009f31d: mov rax, qword ptr [rbp - 0x30]
0x10009f321: mov r15, qword ptr [rbp - 0x58]
0x10009f325: mov word ptr [rax], r15w
0x10009f329: mov rax, qword ptr [rbp - 0x38]
0x10009f32d: movzx r14d, word ptr [rax]
0x10009f331: imul rax, r14, 0x44
0x10009f335: add r13, rax
0x10009f338: add r13, r12
0x10009f33b: mov rdi, r13
0x10009f33e: mov rsi, rbx
0x10009f341: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009f346: mov ecx, eax
0x10009f348: mov eax, 1
0x10009f34d: test ecx, ecx
0x10009f34f: jns 0x10009f366
0x10009f351: mov rax, qword ptr [rbp - 0x30]
0x10009f355: mov word ptr [rax], r14w
0x10009f359: mov rax, qword ptr [rbp - 0x38]
0x10009f35d: mov word ptr [rax], r15w
0x10009f361: mov eax, 2
0x10009f366: add rsp, 0x38
0x10009f36a: pop rbx
0x10009f36b: pop r12
0x10009f36d: pop r13
0x10009f36f: pop r14
0x10009f371: pop r15
0x10009f373: pop rbp
0x10009f374: ret 
0x10009f375: nop word ptr cs:[rax + rax]
