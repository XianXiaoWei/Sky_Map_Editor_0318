0x10019b680: push rbp
0x10019b681: mov rbp, rsp
0x10019b684: push r14
0x10019b686: push rbx
0x10019b687: mov r14, rdi
0x10019b68a: mov rdi, qword ptr [r14 + 0x80068]
0x10019b691: test rdi, rdi
0x10019b694: je 0x10019b69d
0x10019b696: xor esi, esi
0x10019b698: call 0x100473d40 ; 0x100473d40
0x10019b69d: cmp dword ptr [r14 + 0x80cf0], 0
0x10019b6a5: je 0x10019b6d1
0x10019b6a7: xor ebx, ebx
0x10019b6a9: nop dword ptr [rax]
0x10019b6b0: mov eax, ebx
0x10019b6b2: imul rax, rax, 0xc8
0x10019b6b9: lea rdi, [r14 + rax + 0x80070]
0x10019b6c1: call 0x10019bd00 ; 0x10019bd00
0x10019b6c6: inc ebx
0x10019b6c8: cmp ebx, dword ptr [r14 + 0x80cf0]
0x10019b6cf: jb 0x10019b6b0
0x10019b6d1: mov dword ptr [r14 + 0x80cf0], 0
0x10019b6dc: add r14, 0x10
0x10019b6e0: mov rdi, r14
0x10019b6e3: pop rbx
0x10019b6e4: pop r14
0x10019b6e6: pop rbp
0x10019b6e7: jmp 0x100795650 ; 0x100795650
0x10019b6ec: nop dword ptr [rax]
