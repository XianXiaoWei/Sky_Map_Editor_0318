0x10009f600: push rbp
0x10009f601: mov rbp, rsp
0x10009f604: push r15
0x10009f606: push r14
0x10009f608: push r13
0x10009f60a: push r12
0x10009f60c: push rbx
0x10009f60d: sub rsp, 0x38
0x10009f611: mov r14, rdx
0x10009f614: mov r12, rsi
0x10009f617: mov r13, rdi
0x10009f61a: mov rax, r12
0x10009f61d: sub rax, r13
0x10009f620: sar rax, 1
0x10009f623: cmp rax, 5
0x10009f627: ja 0x10009f6ae
0x10009f62d: lea rcx, [rip + 0x1f8] ; 0x10009f82c
0x10009f634: movsxd rdx, dword ptr [rcx + rax*4]
0x10009f638: add rdx, rcx
0x10009f63b: mov al, 1
0x10009f63d: jmp rdx
0x10009f63f: movzx ebx, word ptr [r12 - 2]
0x10009f645: movzx r15d, word ptr [r13]
0x10009f64a: mov rax, qword ptr [r14]
0x10009f64d: mov rcx, qword ptr [r14 + 8]
0x10009f651: mov ecx, dword ptr [rcx + 0x5810]
0x10009f657: imul rdi, rbx, 0x44
0x10009f65b: add rdi, rax
0x10009f65e: add rdi, rcx
0x10009f661: imul rsi, r15, 0x44
0x10009f665: add rsi, rax
0x10009f668: add rsi, rcx
0x10009f66b: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009f670: test eax, eax
0x10009f672: jns 0x10009f819
0x10009f678: mov word ptr [r13], bx
0x10009f67d: mov word ptr [r12 - 2], r15w
0x10009f683: jmp 0x10009f819 ; 0x10009f819
0x10009f688: lea rsi, [r13 + 2]
0x10009f68c: add r12, -2
0x10009f690: mov rcx, qword ptr [r14]
0x10009f693: mov rax, qword ptr [r14 + 8]
0x10009f697: mov r8d, dword ptr [rax + 0x5810]
0x10009f69e: mov rdi, r13
0x10009f6a1: mov rdx, r12
0x10009f6a4: call 0x10009f220 ; 0x10009f220
0x10009f6a9: jmp 0x10009f819 ; 0x10009f819
0x10009f6ae: lea rbx, [r13 + 4]
0x10009f6b2: lea rsi, [r13 + 2]
0x10009f6b6: mov rcx, qword ptr [r14]
0x10009f6b9: mov rax, qword ptr [r14 + 8]
0x10009f6bd: mov r8d, dword ptr [rax + 0x5810]
0x10009f6c4: mov rdi, r13
0x10009f6c7: mov rdx, rbx
0x10009f6ca: call 0x10009f220 ; 0x10009f220
0x10009f6cf: lea rax, [r13 + 6]
0x10009f6d3: cmp rax, r12
0x10009f6d6: je 0x10009f819
0x10009f6dc: mov rcx, qword ptr [r14]
0x10009f6df: mov qword ptr [rbp - 0x50], rcx
0x10009f6e3: mov rcx, qword ptr [r14 + 8]
0x10009f6e7: mov r14d, dword ptr [rcx + 0x5810]
0x10009f6ee: mov dword ptr [rbp - 0x2c], 0
0x10009f6f5: mov ecx, 6
0x10009f6fa: mov qword ptr [rbp - 0x40], rcx
0x10009f6fe: mov qword ptr [rbp - 0x38], r12
0x10009f702: nop word ptr cs:[rax + rax]
0x10009f710: movzx r15d, word ptr [rbx]
0x10009f714: mov qword ptr [rbp - 0x48], rax
0x10009f718: movzx r12d, word ptr [rax]
0x10009f71c: imul rbx, r12, 0x44
0x10009f720: mov rax, qword ptr [rbp - 0x50]
0x10009f724: add rbx, rax
0x10009f727: add rbx, r14
0x10009f72a: imul rsi, r15, 0x44
0x10009f72e: add rsi, rax
0x10009f731: add rsi, r14
0x10009f734: mov rdi, rbx
0x10009f737: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009f73c: test eax, eax
0x10009f73e: jns 0x10009f790
0x10009f740: mov qword ptr [rbp - 0x58], r12
0x10009f744: mov r12, qword ptr [rbp - 0x40]
0x10009f748: nop dword ptr [rax + rax]
0x10009f750: mov word ptr [r13 + r12], r15w
0x10009f756: cmp r12, 2
0x10009f75a: je 0x10009f7a0
0x10009f75c: movzx r15d, word ptr [r13 + r12 - 4]
0x10009f762: imul rsi, r15, 0x44
0x10009f766: add rsi, qword ptr [rbp - 0x50]
0x10009f76a: add rsi, r14
0x10009f76d: mov rdi, rbx
0x10009f770: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009f775: add r12, -2
0x10009f779: test eax, eax
0x10009f77b: js 0x10009f750
0x10009f77d: add r12, r13
0x10009f780: jmp 0x10009f7a3 ; 0x10009f7a3
0x10009f782: nop word ptr cs:[rax + rax]
0x10009f790: mov rbx, qword ptr [rbp - 0x48]
0x10009f794: mov r12, qword ptr [rbp - 0x38]
0x10009f798: jmp 0x10009f7cb ; 0x10009f7cb
0x10009f79a: nop word ptr [rax + rax]
0x10009f7a0: mov r12, r13
0x10009f7a3: mov rax, qword ptr [rbp - 0x58]
0x10009f7a7: mov word ptr [r12], ax
0x10009f7ac: mov ecx, dword ptr [rbp - 0x2c]
0x10009f7af: inc ecx
0x10009f7b1: mov rbx, qword ptr [rbp - 0x48]
0x10009f7b5: lea rax, [rbx + 2]
0x10009f7b9: mov r12, qword ptr [rbp - 0x38]
0x10009f7bd: cmp rax, r12
0x10009f7c0: sete al
0x10009f7c3: mov dword ptr [rbp - 0x2c], ecx
0x10009f7c6: cmp ecx, 8
0x10009f7c9: je 0x10009f81b
0x10009f7cb: lea rax, [rbx + 2]
0x10009f7cf: add qword ptr [rbp - 0x40], 2
0x10009f7d4: cmp rax, r12
0x10009f7d7: jne 0x10009f710
0x10009f7dd: jmp 0x10009f819 ; 0x10009f819
0x10009f7df: lea rsi, [r13 + 2]
0x10009f7e3: lea rdx, [r13 + 4]
0x10009f7e7: add r12, -2
0x10009f7eb: mov rdi, r13
0x10009f7ee: mov rcx, r12
0x10009f7f1: mov r8, r14
0x10009f7f4: call 0x10009f380 ; 0x10009f380
0x10009f7f9: jmp 0x10009f819 ; 0x10009f819
0x10009f7fb: lea rdx, [r13 + 4]
0x10009f7ff: lea rcx, [r13 + 6]
0x10009f803: add r12, -2
0x10009f807: lea rsi, [r13 + 2]
0x10009f80b: mov rdi, r13
0x10009f80e: mov r8, r12
0x10009f811: mov r9, r14
0x10009f814: call 0x10009f4a0 ; 0x10009f4a0
0x10009f819: mov al, 1
0x10009f81b: add rsp, 0x38
0x10009f81f: pop rbx
0x10009f820: pop r12
0x10009f822: pop r13
0x10009f824: pop r14
0x10009f826: pop r15
0x10009f828: pop rbp
0x10009f829: ret 
0x10009f82a: nop 
