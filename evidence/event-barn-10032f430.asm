0x10032f430: push rbp
0x10032f431: mov rbp, rsp
0x10032f434: push r15
0x10032f436: push r14
0x10032f438: push r13
0x10032f43a: push r12
0x10032f43c: push rbx
0x10032f43d: push rax
0x10032f43e: mov r14d, edx
0x10032f441: mov r15, rsi
0x10032f444: mov r13, rdi
0x10032f447: test r15, r15
0x10032f44a: je 0x10032f590
0x10032f450: mov rax, qword ptr [rip + 0x1ac4db1] ; 0x101df4208
0x10032f457: cmp rax, r15
0x10032f45a: je 0x10032f47a
0x10032f45c: cmp dword ptr [rax + 0x3c], -1
0x10032f460: je 0x10032f571
0x10032f466: mov rax, qword ptr [rax + 0x40]
0x10032f46a: mov rcx, qword ptr [r15 + 0x40]
0x10032f46e: and rcx, rax
0x10032f471: cmp rcx, rax
0x10032f474: jne 0x10032f571
0x10032f47a: mov rcx, qword ptr [r13 + 0x20]
0x10032f47e: test rcx, rcx
0x10032f481: je 0x10032f545
0x10032f487: mov eax, dword ptr [r15 + 0x38]
0x10032f48b: lea rsi, [r13 + 0x20]
0x10032f48f: mov rdx, rsi
0x10032f492: nop word ptr cs:[rax + rax]
0x10032f4a0: lea rdi, [rcx + 8]
0x10032f4a4: cmp dword ptr [rcx + 0x1c], eax
0x10032f4a7: cmovae rdi, rcx
0x10032f4ab: cmovae rdx, rcx
0x10032f4af: mov rcx, qword ptr [rdi]
0x10032f4b2: test rcx, rcx
0x10032f4b5: jne 0x10032f4a0
0x10032f4b7: cmp rdx, rsi
0x10032f4ba: je 0x10032f545
0x10032f4c0: cmp eax, dword ptr [rdx + 0x1c]
0x10032f4c3: jb 0x10032f545
0x10032f4c9: add r13, 0x30
0x10032f4cd: xor ebx, ebx
0x10032f4cf: nop 
0x10032f4d0: mov r12, qword ptr [r13]
0x10032f4d4: test r12, r12
0x10032f4d7: je 0x10032f520
0x10032f4d9: mov edi, dword ptr [r12 + 8]
0x10032f4de: call 0x1007abd30 ; 0x1007abd30
0x10032f4e3: mov rcx, qword ptr [rax]
0x10032f4e6: mov rdi, rax
0x10032f4e9: call qword ptr [rcx + 0x68]
0x10032f4ec: test rax, rax
0x10032f4ef: je 0x10032f510
0x10032f4f1: mov eax, dword ptr [rax + 0x38]
0x10032f4f4: cmp eax, dword ptr [r15 + 0x38]
0x10032f4f8: jne 0x10032f520
0x10032f4fa: cmp byte ptr [r12 + 0x2e], r14b
0x10032f4ff: jne 0x10032f520
0x10032f501: jmp 0x10032f533 ; 0x10032f533
0x10032f503: nop word ptr cs:[rax + rax]
0x10032f510: call 0x1007abc60 ; 0x1007abc60
0x10032f515: mov eax, dword ptr [rax + 0x38]
0x10032f518: cmp eax, dword ptr [r15 + 0x38]
0x10032f51c: je 0x10032f4fa
0x10032f51e: nop 
0x10032f520: inc rbx
0x10032f523: add r13, 0x10
0x10032f527: cmp rbx, 0x500
0x10032f52e: jb 0x10032f4d0
0x10032f530: xor r12d, r12d
0x10032f533: mov rax, r12
0x10032f536: add rsp, 8
0x10032f53a: pop rbx
0x10032f53b: pop r12
0x10032f53d: pop r13
0x10032f53f: pop r14
0x10032f541: pop r15
0x10032f543: pop rbp
0x10032f544: ret 
0x10032f545: mov r9, qword ptr [r15 + 8]
0x10032f549: lea rdi, [rip + 0x851c8b] ; 0x100b811db it != m_idxMap.end()
0x10032f550: lea rsi, [rip + 0x851bf4] ; 0x100b8114b Event.cpp
0x10032f557: lea r8, [rip + 0x851c92] ; 0x100b811f0 Type %s is not present in the typeIdxMap
0x10032f55e: mov edx, 0x115
0x10032f563: mov ecx, 4
0x10032f568: xor eax, eax
0x10032f56a: call 0x1007e6030 ; 0x1007e6030
0x10032f56f: ud2 
0x10032f571: lea rdi, [rip + 0x831038] ; 0x100b605b0 metaClass->IsArgClassOrSuperclass( GetMetaClassByType< Event >() )
0x10032f578: lea rsi, [rip + 0x851bcc] ; 0x100b8114b Event.cpp
0x10032f57f: mov edx, 0x112
0x10032f584: mov ecx, 3
0x10032f589: call 0x1007e5f70 ; 0x1007e5f70
0x10032f58e: ud2 
0x10032f590: lea rdi, [rip + 0x831005] ; 0x100b6059c metaClass
0x10032f597: lea rsi, [rip + 0x851bad] ; 0x100b8114b Event.cpp
0x10032f59e: mov edx, 0x111
0x10032f5a3: mov ecx, 3
0x10032f5a8: call 0x1007e5f70 ; 0x1007e5f70
0x10032f5ad: ud2 
0x10032f5af: nop 
