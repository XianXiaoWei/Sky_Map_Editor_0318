0x10033b350: push rbp
0x10033b351: mov rbp, rsp
0x10033b354: push r14
0x10033b356: push rbx
0x10033b357: mov rbx, rdi
0x10033b35a: mov byte ptr [rbx + 0xb4], 0
0x10033b361: mov byte ptr [rbx + 0x13e], 0
0x10033b368: mov dword ptr [rbx + 0x150], 0
0x10033b372: mov byte ptr [rbx + 0xb6], 0
0x10033b379: mov word ptr [rbx + 0x139], 0
0x10033b382: mov qword ptr [rbx + 0x110], 0
0x10033b38d: mov dword ptr [rbx + 0x118], 0
0x10033b397: mov rdi, qword ptr [rbx + 0x168]
0x10033b39e: test rdi, rdi
0x10033b3a1: je 0x10033b3c8
0x10033b3a3: mov r14, qword ptr [rbx + 0x170]
0x10033b3aa: test r14, r14
0x10033b3ad: je 0x10033b3c8
0x10033b3af: mov rax, qword ptr [rdi]
0x10033b3b2: call qword ptr [rax]
0x10033b3b4: cmp r14, rax
0x10033b3b7: jne 0x10033b3c8
0x10033b3b9: mov rdi, qword ptr [rbx + 0x168]
0x10033b3c0: mov rax, qword ptr [rdi]
0x10033b3c3: xor esi, esi
0x10033b3c5: call qword ptr [rax + 0x30]
0x10033b3c8: mov rdi, qword ptr [rbx + 0x188]
0x10033b3cf: test rdi, rdi
0x10033b3d2: je 0x10033b400
0x10033b3d4: mov r14, qword ptr [rbx + 0x190]
0x10033b3db: test r14, r14
0x10033b3de: je 0x10033b400
0x10033b3e0: mov rax, qword ptr [rdi]
0x10033b3e3: call qword ptr [rax]
0x10033b3e5: cmp r14, rax
0x10033b3e8: jne 0x10033b400
0x10033b3ea: mov rdi, qword ptr [rbx + 0x188]
0x10033b3f1: mov rax, qword ptr [rdi]
0x10033b3f4: mov rax, qword ptr [rax + 0x30]
0x10033b3f8: xor esi, esi
0x10033b3fa: pop rbx
0x10033b3fb: pop r14
0x10033b3fd: pop rbp
0x10033b3fe: jmp rax
0x10033b400: pop rbx
0x10033b401: pop r14
0x10033b403: pop rbp
0x10033b404: ret 
0x10033b405: nop word ptr cs:[rax + rax]
