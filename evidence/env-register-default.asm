0x10031b2e0: push rbp
0x10031b2e1: mov rbp, rsp
0x10031b2e4: push r15
0x10031b2e6: push r14
0x10031b2e8: push r12
0x10031b2ea: push rbx
0x10031b2eb: mov r14, rsi
0x10031b2ee: mov r12, rdi
0x10031b2f1: test r14, r14
0x10031b2f4: je 0x10031b300
0x10031b2f6: mov edi, dword ptr [r14]
0x10031b2f9: call 0x1007abd30 ; 0x1007abd30
0x10031b2fe: jmp 0x10031b305 ; 0x10031b305
0x10031b300: call 0x1007abbf0 ; 0x1007abbf0
0x10031b305: mov rcx, qword ptr [rax]
0x10031b308: mov rdi, rax
0x10031b30b: call qword ptr [rcx + 0x68]
0x10031b30e: mov r15, rax
0x10031b311: test r15, r15
0x10031b314: jne 0x10031b31e
0x10031b316: call 0x1007abc60 ; 0x1007abc60
0x10031b31b: mov r15, rax
0x10031b31e: cmp dword ptr [r12 + 0x90], 0
0x10031b327: je 0x10031b379
0x10031b329: xor ebx, ebx
0x10031b32b: nop dword ptr [rax + rax]
0x10031b330: mov ebx, ebx
0x10031b332: mov rax, qword ptr [r12 + rbx*8 + 0x10]
0x10031b337: test rax, rax
0x10031b33a: je 0x10031b350
0x10031b33c: mov edi, dword ptr [rax]
0x10031b33e: call 0x1007abd30 ; 0x1007abd30
0x10031b343: jmp 0x10031b355 ; 0x10031b355
0x10031b345: nop word ptr cs:[rax + rax]
0x10031b350: call 0x1007abbf0 ; 0x1007abbf0
0x10031b355: mov rcx, qword ptr [rax]
0x10031b358: mov rdi, rax
0x10031b35b: call qword ptr [rcx + 0x68]
0x10031b35e: test rax, rax
0x10031b361: jne 0x10031b368
0x10031b363: call 0x1007abc60 ; 0x1007abc60
0x10031b368: cmp rax, r15
0x10031b36b: je 0x10031b3a5
0x10031b36d: inc ebx
0x10031b36f: cmp ebx, dword ptr [r12 + 0x90]
0x10031b377: jb 0x10031b330
0x10031b379: mov r9, qword ptr [r15 + 8]
0x10031b37d: lea rdi, [rip + 0x887ca8] ; 0x100ba302c false
0x10031b384: lea rsi, [rip + 0x865641] ; 0x100b809cc Environment.cpp
0x10031b38b: lea r8, [rip + 0x8657aa] ; 0x100b80b3c No EnvVars of type %s registered with Environment system
0x10031b392: mov edx, 0x1a0
0x10031b397: mov ecx, 4
0x10031b39c: xor eax, eax
0x10031b39e: call 0x1007e6030 ; 0x1007e6030
0x10031b3a3: ud2 
0x10031b3a5: mov qword ptr [r12 + rbx*8 + 0x98], r14
0x10031b3ad: pop rbx
0x10031b3ae: pop r12
0x10031b3b0: pop r14
0x10031b3b2: pop r15
0x10031b3b4: pop rbp
0x10031b3b5: ret 
0x10031b3b6: nop word ptr cs:[rax + rax]
