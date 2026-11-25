0x1000dd230: push rbp
0x1000dd231: mov rbp, rsp
0x1000dd234: push r15
0x1000dd236: push r14
0x1000dd238: push r13
0x1000dd23a: push r12
0x1000dd23c: push rbx
0x1000dd23d: sub rsp, 0x18
0x1000dd241: mov r13, rsi
0x1000dd244: mov rbx, rdi
0x1000dd247: mov r12d, dword ptr [rbx + 8]
0x1000dd24b: test r12d, r12d
0x1000dd24e: jle 0x1000dd2fb
0x1000dd254: mov qword ptr [rbp - 0x40], rdx
0x1000dd258: xor ecx, ecx
0x1000dd25a: mov qword ptr [rbp - 0x30], rbx
0x1000dd25e: mov r15, qword ptr [rbx + rcx*8 + 0x10]
0x1000dd263: test byte ptr [r15 + 8], 1
0x1000dd268: mov qword ptr [rbp - 0x38], rcx
0x1000dd26c: jne 0x1000dd280
0x1000dd26e: add r15, 8
0x1000dd272: inc r15
0x1000dd275: jmp 0x1000dd284 ; 0x1000dd284
0x1000dd277: nop word ptr [rax + rax]
0x1000dd280: mov r15, qword ptr [r15 + 0x18]
0x1000dd284: mov rdi, r15
0x1000dd287: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1000dd28c: mov r14, rax
0x1000dd28f: mov rdi, r13
0x1000dd292: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1000dd297: cmp r14d, eax
0x1000dd29a: jne 0x1000dd2e8
0x1000dd29c: test r14d, r14d
0x1000dd29f: je 0x1000dd2ff
0x1000dd2a1: mov r14d, r14d
0x1000dd2a4: xor r12d, r12d
0x1000dd2a7: nop word ptr [rax + rax]
0x1000dd2b0: movsx edi, byte ptr [r15 + r12]
0x1000dd2b5: call 0x100aa2522 ; 0x100aa2522 ___tolower
0x1000dd2ba: mov ebx, eax
0x1000dd2bc: movsx edi, byte ptr [r13 + r12]
0x1000dd2c2: call 0x100aa2522 ; 0x100aa2522 ___tolower
0x1000dd2c7: cmp ebx, eax
0x1000dd2c9: jne 0x1000dd2e0
0x1000dd2cb: inc r12
0x1000dd2ce: cmp r12, r14
0x1000dd2d1: jb 0x1000dd2b0
0x1000dd2d3: jmp 0x1000dd2ff ; 0x1000dd2ff
0x1000dd2d5: nop word ptr cs:[rax + rax]
0x1000dd2e0: mov rbx, qword ptr [rbp - 0x30]
0x1000dd2e4: mov r12d, dword ptr [rbx + 8]
0x1000dd2e8: mov rcx, qword ptr [rbp - 0x38]
0x1000dd2ec: inc rcx
0x1000dd2ef: movsxd rax, r12d
0x1000dd2f2: cmp rcx, rax
0x1000dd2f5: jl 0x1000dd25e
0x1000dd2fb: xor eax, eax
0x1000dd2fd: jmp 0x1000dd317 ; 0x1000dd317
0x1000dd2ff: mov rax, qword ptr [rbp - 0x40]
0x1000dd303: test rax, rax
0x1000dd306: mov rcx, qword ptr [rbp - 0x38]
0x1000dd30a: je 0x1000dd30e
0x1000dd30c: mov dword ptr [rax], ecx
0x1000dd30e: mov rax, qword ptr [rbp - 0x30]
0x1000dd312: mov rax, qword ptr [rax + rcx*8 + 0x10]
0x1000dd317: add rsp, 0x18
0x1000dd31b: pop rbx
0x1000dd31c: pop r12
0x1000dd31e: pop r13
0x1000dd320: pop r14
0x1000dd322: pop r15
0x1000dd324: pop rbp
0x1000dd325: ret 
0x1000dd326: nop word ptr cs:[rax + rax]
