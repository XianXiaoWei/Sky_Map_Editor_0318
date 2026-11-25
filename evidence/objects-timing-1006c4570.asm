0x1006c4570: push rbp
0x1006c4571: mov rbp, rsp
0x1006c4574: push r15
0x1006c4576: push r14
0x1006c4578: push r13
0x1006c457a: push r12
0x1006c457c: push rbx
0x1006c457d: push rax
0x1006c457e: mov r15, rsi
0x1006c4581: mov r13, rdi
0x1006c4584: test byte ptr [r15], 1
0x1006c4588: jne 0x1006c45f2
0x1006c458a: inc r15
0x1006c458d: add r13, 0x40
0x1006c4591: xor r14d, r14d
0x1006c4594: nop word ptr cs:[rax + rax]
0x1006c45a0: test byte ptr [r13 - 0x10], 1
0x1006c45a5: jne 0x1006c45b0
0x1006c45a7: lea r12, [r13 - 0xf]
0x1006c45ab: jmp 0x1006c45b4 ; 0x1006c45b4
0x1006c45ad: nop dword ptr [rax]
0x1006c45b0: mov r12, qword ptr [r13]
0x1006c45b4: mov rdi, r15
0x1006c45b7: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1006c45bc: mov rbx, rax
0x1006c45bf: mov rdi, r12
0x1006c45c2: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1006c45c7: cmp rbx, rax
0x1006c45ca: cmovbe rbx, rax
0x1006c45ce: mov rdi, r15
0x1006c45d1: mov rsi, r12
0x1006c45d4: mov rdx, rbx
0x1006c45d7: call 0x100aa2c8a ; 0x100aa2c8a _strncmp
0x1006c45dc: test eax, eax
0x1006c45de: je 0x1006c4654
0x1006c45e0: inc r14
0x1006c45e3: add r13, 0x10a0
0x1006c45ea: cmp r14, 0x40
0x1006c45ee: jb 0x1006c45a0
0x1006c45f0: jmp 0x1006c4650 ; 0x1006c4650
0x1006c45f2: mov r15, qword ptr [r15 + 0x10]
0x1006c45f6: add r13, 0x40
0x1006c45fa: xor r14d, r14d
0x1006c45fd: nop dword ptr [rax]
0x1006c4600: test byte ptr [r13 - 0x10], 1
0x1006c4605: jne 0x1006c4610
0x1006c4607: lea r12, [r13 - 0xf]
0x1006c460b: jmp 0x1006c4614 ; 0x1006c4614
0x1006c460d: nop dword ptr [rax]
0x1006c4610: mov r12, qword ptr [r13]
0x1006c4614: mov rdi, r15
0x1006c4617: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1006c461c: mov rbx, rax
0x1006c461f: mov rdi, r12
0x1006c4622: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1006c4627: cmp rbx, rax
0x1006c462a: cmovbe rbx, rax
0x1006c462e: mov rdi, r15
0x1006c4631: mov rsi, r12
0x1006c4634: mov rdx, rbx
0x1006c4637: call 0x100aa2c8a ; 0x100aa2c8a _strncmp
0x1006c463c: test eax, eax
0x1006c463e: je 0x1006c4654
0x1006c4640: inc r14
0x1006c4643: add r13, 0x10a0
0x1006c464a: cmp r14, 0x3f
0x1006c464e: jbe 0x1006c4600
0x1006c4650: xor eax, eax
0x1006c4652: jmp 0x1006c465b ; 0x1006c465b
0x1006c4654: add r13, -0x30
0x1006c4658: mov rax, r13
0x1006c465b: add rsp, 8
0x1006c465f: pop rbx
0x1006c4660: pop r12
0x1006c4662: pop r13
0x1006c4664: pop r14
0x1006c4666: pop r15
0x1006c4668: pop rbp
0x1006c4669: ret 
0x1006c466a: nop word ptr [rax + rax]
