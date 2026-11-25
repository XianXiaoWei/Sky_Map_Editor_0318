0x100a6d9c0: push rbp
0x100a6d9c1: mov rbp, rsp
0x100a6d9c4: push r14
0x100a6d9c6: push rbx
0x100a6d9c7: mov ebx, esi
0x100a6d9c9: mov r14, rdi
0x100a6d9cc: cmp dword ptr [r14 + 0x24], ebx
0x100a6d9d0: je 0x100a6d9fb
0x100a6d9d2: mov rdi, qword ptr [r14 + 0x38]
0x100a6d9d6: xor eax, eax
0x100a6d9d8: cmp ebx, 2
0x100a6d9db: sete al
0x100a6d9de: cmp ebx, 1
0x100a6d9e1: mov edx, 2
0x100a6d9e6: cmovne rdx, rax
0x100a6d9ea: mov rsi, qword ptr [rip + 0x1fc6ef] ; 0x100c6a0e0
0x100a6d9f1: call qword ptr [rip + 0x1a0119] ; 0x100c0db10
0x100a6d9f7: mov dword ptr [r14 + 0x24], ebx
0x100a6d9fb: pop rbx
0x100a6d9fc: pop r14
0x100a6d9fe: pop rbp
0x100a6d9ff: ret 
