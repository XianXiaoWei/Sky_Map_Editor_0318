0x1002de2d0: push rbp
0x1002de2d1: mov rbp, rsp
0x1002de2d4: push r15
0x1002de2d6: push r14
0x1002de2d8: push rbx
0x1002de2d9: push rax
0x1002de2da: mov r14, rdi
0x1002de2dd: lea rax, [r14 + 0x100010]
0x1002de2e4: lea rcx, [r14 + 0x210]
0x1002de2eb: mov edx, 2
0x1002de2f0: xor esi, esi
0x1002de2f2: nop word ptr cs:[rax + rax]
0x1002de300: mov qword ptr [rcx - 0x1f8], rcx
0x1002de307: mov qword ptr [rcx - 0x1f0], 0xffffffffffffffff
0x1002de312: mov qword ptr [rcx - 0x1e8], rax
0x1002de319: lea rdi, [rcx + 0x200]
0x1002de320: cmp rdx, 0x800
0x1002de327: cmovae rdi, rsi
0x1002de32b: mov qword ptr [rcx + 8], rdi
0x1002de32f: mov qword ptr [rcx + 0x10], 0xffffffffffffffff
0x1002de337: mov qword ptr [rcx + 0x18], rax
0x1002de33b: add rcx, 0x400
0x1002de342: add rdx, 2
0x1002de346: cmp rdx, 0x802
0x1002de34d: jne 0x1002de300
0x1002de34f: lea r15, [r14 + 0x10]
0x1002de353: mov qword ptr [r14 + 0x100010], r15
0x1002de35a: mov qword ptr [r14 + 0x100018], 0
0x1002de365: xor ebx, ebx
0x1002de367: nop word ptr [rax + rax]
0x1002de370: lea rdi, [r15 + rbx]
0x1002de374: call 0x1002da1e0 ; 0x1002da1e0
0x1002de379: add rbx, 0x200
0x1002de380: cmp rbx, 0x100000
0x1002de387: jne 0x1002de370
0x1002de389: cmp byte ptr [r14 + 0x120270], 0
0x1002de391: je 0x1002de438
0x1002de397: mov byte ptr [r14 + 0x120270], 0
0x1002de39f: movsxd rcx, dword ptr [r14 + 0x120064]
0x1002de3a6: test rcx, rcx
0x1002de3a9: jle 0x1002de438
0x1002de3af: mov eax, ecx
0x1002de3b1: and eax, 1
0x1002de3b4: cmp ecx, 1
0x1002de3b7: jne 0x1002de3c2
0x1002de3b9: xor edx, edx
0x1002de3bb: test rax, rax
0x1002de3be: jne 0x1002de41a
0x1002de3c0: jmp 0x1002de438 ; 0x1002de438
0x1002de3c2: sub rcx, rax
0x1002de3c5: xor edx, edx
0x1002de3c7: nop word ptr [rax + rax]
0x1002de3d0: mov rsi, qword ptr [r14 + rdx*8 + 0x120070]
0x1002de3d8: test rsi, rsi
0x1002de3db: je 0x1002de3ee
0x1002de3dd: mov dword ptr [rsi + 0x170], 0x47c35000
0x1002de3e7: mov byte ptr [rsi + 0xb1], 1
0x1002de3ee: mov rsi, qword ptr [r14 + rdx*8 + 0x120078]
0x1002de3f6: test rsi, rsi
0x1002de3f9: je 0x1002de40c
0x1002de3fb: mov dword ptr [rsi + 0x170], 0x47c35000
0x1002de405: mov byte ptr [rsi + 0xb1], 1
0x1002de40c: add rdx, 2
0x1002de410: cmp rcx, rdx
0x1002de413: jne 0x1002de3d0
0x1002de415: test rax, rax
0x1002de418: je 0x1002de438
0x1002de41a: mov rax, qword ptr [r14 + rdx*8 + 0x120070]
0x1002de422: test rax, rax
0x1002de425: je 0x1002de438
0x1002de427: mov dword ptr [rax + 0x170], 0x47c35000
0x1002de431: mov byte ptr [rax + 0xb1], 1
0x1002de438: add rsp, 8
0x1002de43c: pop rbx
0x1002de43d: pop r14
0x1002de43f: pop r15
0x1002de441: pop rbp
0x1002de442: ret 
0x1002de443: nop word ptr cs:[rax + rax]
