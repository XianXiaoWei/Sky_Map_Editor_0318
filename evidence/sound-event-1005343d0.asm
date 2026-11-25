0x1005343d0: push rbp
0x1005343d1: mov rbp, rsp
0x1005343d4: push r14
0x1005343d6: push rbx
0x1005343d7: mov rbx, rdi
0x1005343da: mov rdi, qword ptr [rbx + 0x60]
0x1005343de: test rdi, rdi
0x1005343e1: je 0x100534402
0x1005343e3: mov r14, qword ptr [rbx + 0x68]
0x1005343e7: test r14, r14
0x1005343ea: je 0x100534402
0x1005343ec: mov rax, qword ptr [rdi]
0x1005343ef: call qword ptr [rax]
0x1005343f1: cmp r14, rax
0x1005343f4: jne 0x100534402
0x1005343f6: mov rdi, qword ptr [rbx + 0x60]
0x1005343fa: mov rax, qword ptr [rdi]
0x1005343fd: xor esi, esi
0x1005343ff: call qword ptr [rax + 0x30]
0x100534402: mov rdi, rbx
0x100534405: pop rbx
0x100534406: pop r14
0x100534408: pop rbp
0x100534409: jmp 0x10032ef60 ; 0x10032ef60
0x10053440e: nop 
