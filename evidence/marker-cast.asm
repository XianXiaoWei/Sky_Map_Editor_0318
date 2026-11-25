0x100011cb0: push rbp
0x100011cb1: mov rbp, rsp
0x100011cb4: push r15
0x100011cb6: push r14
0x100011cb8: push rbx
0x100011cb9: push rax
0x100011cba: mov rbx, rdx
0x100011cbd: mov r14, rsi
0x100011cc0: mov r15, rdi
0x100011cc3: cmp r15, rcx
0x100011cc6: je 0x100011d2c
0x100011cc8: mov rax, qword ptr [rcx]
0x100011ccb: mov rdi, rcx
0x100011cce: call qword ptr [rax + 0x68]
0x100011cd1: test rax, rax
0x100011cd4: je 0x100011d31
0x100011cd6: mov rcx, qword ptr [rax]
0x100011cd9: mov rdi, rax
0x100011cdc: mov rsi, rbx
0x100011cdf: call qword ptr [rcx + 0xd0]
0x100011ce5: mov qword ptr [rbp - 0x20], rax
0x100011ce9: test rax, rax
0x100011cec: je 0x100011d39
0x100011cee: mov edi, dword ptr [rax]
0x100011cf0: call 0x1007abd30 ; 0x1007abd30
0x100011cf5: mov rcx, qword ptr [rax]
0x100011cf8: mov rdi, rax
0x100011cfb: call qword ptr [rcx + 0x68]
0x100011cfe: cmp rax, r15
0x100011d01: je 0x100011d1a
0x100011d03: cmp dword ptr [r15 + 0x3c], -1
0x100011d08: je 0x100011d39
0x100011d0a: mov rcx, qword ptr [r15 + 0x40]
0x100011d0e: mov rax, qword ptr [rax + 0x40]
0x100011d12: and rax, rcx
0x100011d15: cmp rax, rcx
0x100011d18: jne 0x100011d39
0x100011d1a: mov rax, qword ptr [r15]
0x100011d1d: lea rsi, [rbp - 0x20]
0x100011d21: mov rdi, r15
0x100011d24: call qword ptr [rax + 0xd8]
0x100011d2a: jmp 0x100011d3b ; 0x100011d3b
0x100011d2c: mov rax, qword ptr [rbx]
0x100011d2f: jmp 0x100011d3b ; 0x100011d3b
0x100011d31: mov qword ptr [rbp - 0x20], 0
0x100011d39: xor eax, eax
0x100011d3b: mov qword ptr [r14], rax
0x100011d3e: add rsp, 8
0x100011d42: pop rbx
0x100011d43: pop r14
0x100011d45: pop r15
0x100011d47: pop rbp
0x100011d48: ret 
0x100011d49: nop dword ptr [rax]
