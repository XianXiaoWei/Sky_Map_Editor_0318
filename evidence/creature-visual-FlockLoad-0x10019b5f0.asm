0x10019b5f0: push rbp
0x10019b5f1: mov rbp, rsp
0x10019b5f4: push r14
0x10019b5f6: push rbx
0x10019b5f7: mov r14, rdi
0x10019b5fa: mov rdi, qword ptr [r14 + 0x80068]
0x10019b601: test rdi, rdi
0x10019b604: je 0x10019b60d
0x10019b606: xor esi, esi
0x10019b608: call 0x100473d40 ; 0x100473d40
0x10019b60d: cmp dword ptr [r14 + 0x80cf0], 0
0x10019b615: je 0x10019b641
0x10019b617: xor ebx, ebx
0x10019b619: nop dword ptr [rax]
0x10019b620: mov eax, ebx
0x10019b622: imul rax, rax, 0xc8
0x10019b629: lea rdi, [r14 + rax + 0x80070]
0x10019b631: call 0x10019bd00 ; 0x10019bd00
0x10019b636: inc ebx
0x10019b638: cmp ebx, dword ptr [r14 + 0x80cf0]
0x10019b63f: jb 0x10019b620
0x10019b641: mov dword ptr [r14 + 0x80cf0], 0
0x10019b64c: lea rdi, [r14 + 0x10]
0x10019b650: call 0x100795650 ; 0x100795650
0x10019b655: mov rdi, qword ptr [r14 + 0x80068]
0x10019b65c: test rdi, rdi
0x10019b65f: je 0x10019b666
0x10019b661: call 0x1004740a0 ; 0x1004740a0
0x10019b666: mov qword ptr [r14 + 0x80068], 0
0x10019b671: pop rbx
0x10019b672: pop r14
0x10019b674: pop rbp
0x10019b675: ret 
0x10019b676: nop word ptr cs:[rax + rax]
