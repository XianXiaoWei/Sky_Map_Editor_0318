0x10055b4a0: push rbp
0x10055b4a1: mov rbp, rsp
0x10055b4a4: push r15
0x10055b4a6: push r14
0x10055b4a8: push rbx
0x10055b4a9: push rax
0x10055b4aa: mov r14d, esi
0x10055b4ad: mov r15, rdi
0x10055b4b0: cmp r14d, 1
0x10055b4b4: jbe 0x10055b50b
0x10055b4b6: mov rsi, qword ptr [r15 + 0x20]
0x10055b4ba: test rsi, rsi
0x10055b4bd: je 0x10055b4cb
0x10055b4bf: mov rdi, qword ptr [r15 + 0xf0]
0x10055b4c6: call 0x100795a70 ; 0x100795a70
0x10055b4cb: mov dword ptr [r15 + 0x28], r14d
0x10055b4cf: mov rdi, qword ptr [r15 + 0xf0]
0x10055b4d6: mov ebx, r14d
0x10055b4d9: shl rbx, 3
0x10055b4dd: mov rdx, qword ptr [rip + 0x1ac1dfc] ; 0x10201d2e0
0x10055b4e4: mov ecx, 0x10
0x10055b4e9: mov rsi, rbx
0x10055b4ec: call 0x100795530 ; 0x100795530
0x10055b4f1: mov qword ptr [r15 + 0x20], rax
0x10055b4f5: mov rdi, rax
0x10055b4f8: mov rsi, rbx
0x10055b4fb: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x10055b500: add rsp, 8
0x10055b504: pop rbx
0x10055b505: pop r14
0x10055b507: pop r15
0x10055b509: pop rbp
0x10055b50a: ret 
0x10055b50b: lea rdi, [rip + 0x63624d] ; 0x100b9175f numPoints >= 2
0x10055b512: lea rsi, [rip + 0x636213] ; 0x100b9172c Rail.cpp
0x10055b519: lea r8, [rip + 0x63624e] ; 0x100b9176e Rails must have atleast 2 points
0x10055b520: mov edx, 0x48e
0x10055b525: mov ecx, 4
0x10055b52a: xor eax, eax
0x10055b52c: call 0x1007e6030 ; 0x1007e6030
0x10055b531: ud2 
0x10055b533: nop word ptr cs:[rax + rax]
