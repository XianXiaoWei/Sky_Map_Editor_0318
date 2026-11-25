0x1001b19f0: push rbp
0x1001b19f1: mov rbp, rsp
0x1001b19f4: push r14
0x1001b19f6: push rbx
0x1001b19f7: mov rbx, rdi
0x1001b19fa: mov byte ptr [rbx + 0xa1], 0
0x1001b1a01: mov byte ptr [rbx + 0x56], 0
0x1001b1a05: mov rdi, qword ptr [rbx + 0x100]
0x1001b1a0c: test rdi, rdi
0x1001b1a0f: je 0x1001b1a3d
0x1001b1a11: mov r14, qword ptr [rbx + 0x108]
0x1001b1a18: test r14, r14
0x1001b1a1b: je 0x1001b1a3d
0x1001b1a1d: mov rax, qword ptr [rdi]
0x1001b1a20: call qword ptr [rax]
0x1001b1a22: cmp r14, rax
0x1001b1a25: jne 0x1001b1a3d
0x1001b1a27: mov rdi, qword ptr [rbx + 0x100]
0x1001b1a2e: mov rax, qword ptr [rdi]
0x1001b1a31: mov rax, qword ptr [rax + 0x30]
0x1001b1a35: xor esi, esi
0x1001b1a37: pop rbx
0x1001b1a38: pop r14
0x1001b1a3a: pop rbp
0x1001b1a3b: jmp rax
0x1001b1a3d: pop rbx
0x1001b1a3e: pop r14
0x1001b1a40: pop rbp
0x1001b1a41: ret 
0x1001b1a42: nop word ptr cs:[rax + rax]
