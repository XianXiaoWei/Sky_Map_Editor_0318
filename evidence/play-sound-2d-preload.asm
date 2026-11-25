0x100534710: push rbp
0x100534711: mov rbp, rsp
0x100534714: push r15
0x100534716: push r14
0x100534718: push rbx
0x100534719: push rax
0x10053471a: mov r14, rsi
0x10053471d: mov rbx, rdi
0x100534720: movzx eax, byte ptr [rbx + 0x38]
0x100534724: test al, 1
0x100534726: jne 0x100534735
0x100534728: mov rcx, rax
0x10053472b: shr rcx, 1
0x10053472e: test rcx, rcx
0x100534731: jne 0x10053473e
0x100534733: jmp 0x100534795 ; 0x100534795
0x100534735: mov rcx, qword ptr [rbx + 0x40]
0x100534739: test rcx, rcx
0x10053473c: je 0x100534795
0x10053473e: lea r15, [rbx + 0x38]
0x100534742: mov rdi, qword ptr [r14 + 0x5c8]
0x100534749: test al, 1
0x10053474b: jne 0x100534753
0x10053474d: lea rsi, [r15 + 1]
0x100534751: jmp 0x100534757 ; 0x100534757
0x100534753: mov rsi, qword ptr [rbx + 0x48]
0x100534757: mov edx, 1
0x10053475c: call 0x100602d20 ; 0x100602d20
0x100534761: mov rax, qword ptr [r14 + 0x5c8]
0x100534768: test byte ptr [r15], 1
0x10053476c: jne 0x100534773
0x10053476e: inc r15
0x100534771: jmp 0x100534777 ; 0x100534777
0x100534773: mov r15, qword ptr [rbx + 0x48]
0x100534777: mov rdi, qword ptr [rax + 0x10]
0x10053477b: mov rax, qword ptr [rdi]
0x10053477e: mov rsi, r15
0x100534781: call qword ptr [rax + 0x80]
0x100534787: test rax, rax
0x10053478a: je 0x100534795
0x10053478c: mov rcx, qword ptr [rax]
0x10053478f: mov rdi, rax
0x100534792: call qword ptr [rcx + 0x48]
0x100534795: add rsp, 8
0x100534799: pop rbx
0x10053479a: pop r14
0x10053479c: pop r15
0x10053479e: pop rbp
0x10053479f: ret 
