0x10032ec50: push rbp
0x10032ec51: mov rbp, rsp
0x10032ec54: push r15
0x10032ec56: push r14
0x10032ec58: push rbx
0x10032ec59: push rax
0x10032ec5a: mov r14, rsi
0x10032ec5d: mov r15, rdi
0x10032ec60: mov ebx, 0x30
0x10032ec65: nop word ptr cs:[rax + rax]
0x10032ec70: mov rdi, qword ptr [r15 + rbx]
0x10032ec74: test rdi, rdi
0x10032ec77: je 0x10032eca0
0x10032ec79: cmp byte ptr [rdi + 0x24], 0
0x10032ec7d: je 0x10032eca0
0x10032ec7f: cmp byte ptr [rdi + 0x20], 0
0x10032ec83: je 0x10032eca0
0x10032ec85: cmp byte ptr [rdi + 0x23], 0
0x10032ec89: je 0x10032eca0
0x10032ec8b: mov rax, qword ptr [rdi]
0x10032ec8e: mov rsi, r14
0x10032ec91: call qword ptr [rax + 0x58]
0x10032ec94: nop word ptr cs:[rax + rax]
0x10032eca0: add rbx, 0x10
0x10032eca4: cmp rbx, 0x5030
0x10032ecab: jne 0x10032ec70
0x10032ecad: add rsp, 8
0x10032ecb1: pop rbx
0x10032ecb2: pop r14
0x10032ecb4: pop r15
0x10032ecb6: pop rbp
0x10032ecb7: ret 
0x10032ecb8: nop dword ptr [rax + rax]
