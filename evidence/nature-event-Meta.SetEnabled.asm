0x1004d1f60: push rbp
0x1004d1f61: mov rbp, rsp
0x1004d1f64: push r15
0x1004d1f66: push r14
0x1004d1f68: push rbx
0x1004d1f69: sub rsp, 0x38
0x1004d1f6d: mov qword ptr [rbp - 0x30], rdi
0x1004d1f71: mov byte ptr [rbp - 0x19], sil
0x1004d1f75: test rdi, rdi
0x1004d1f78: je 0x1004d2023
0x1004d1f7e: mov edi, dword ptr [rdi]
0x1004d1f80: call 0x1007abd30 ; 0x1007abd30
0x1004d1f85: mov rcx, qword ptr [rax]
0x1004d1f88: mov rdi, rax
0x1004d1f8b: call qword ptr [rcx + 0x68]
0x1004d1f8e: test rax, rax
0x1004d1f91: jne 0x1004d1f98
0x1004d1f93: call 0x1007abc60 ; 0x1007abc60
0x1004d1f98: movzx edx, byte ptr [rip + 0x801181] ; 0x100cd3120
0x1004d1f9f: lea rsi, [rip + 0x6a50a8] ; 0x100b7704e SetEnabled
0x1004d1fa6: mov rdi, rax
0x1004d1fa9: call 0x1004d2330 ; 0x1004d2330
0x1004d1fae: mov rbx, rax
0x1004d1fb1: test rbx, rbx
0x1004d1fb4: je 0x1004d2023
0x1004d1fb6: lea rax, [rbp - 0x19]
0x1004d1fba: mov qword ptr [rbp - 0x40], rax
0x1004d1fbe: mov byte ptr [rbp - 0x28], 0
0x1004d1fc2: lea rdi, [rbp - 0x28]
0x1004d1fc6: call 0x1007abbd0 ; 0x1007abbd0
0x1004d1fcb: mov qword ptr [rbp - 0x38], rax
0x1004d1fcf: call 0x1007abc10 ; 0x1007abc10
0x1004d1fd4: mov r15, rax
0x1004d1fd7: call 0x1007abbf0 ; 0x1007abbf0
0x1004d1fdc: mov r14, rax
0x1004d1fdf: mov qword ptr [rbp - 0x28], 0
0x1004d1fe7: call qword ptr [rbx + 0x58]
0x1004d1fea: mov r8, qword ptr [rax]
0x1004d1fed: lea rsi, [rbp - 0x28]
0x1004d1ff1: lea rdx, [rbp - 0x30]
0x1004d1ff5: mov rdi, rax
0x1004d1ff8: mov rcx, r15
0x1004d1ffb: call qword ptr [r8 + 0x40]
0x1004d1fff: mov rdx, qword ptr [rbp - 0x28]
0x1004d2003: test rdx, rdx
0x1004d2006: je 0x1004d202e
0x1004d2008: mov rdi, qword ptr [rbx + 0x38]
0x1004d200c: mov rsi, qword ptr [rbx + 0x40]
0x1004d2010: mov dword ptr [rsp], 1
0x1004d2017: lea r9, [rbp - 0x40]
0x1004d201b: xor ecx, ecx
0x1004d201d: mov r8, r14
0x1004d2020: call qword ptr [rbx + 0x48]
0x1004d2023: add rsp, 0x38
0x1004d2027: pop rbx
0x1004d2028: pop r14
0x1004d202a: pop r15
0x1004d202c: pop rbp
0x1004d202d: ret 
0x1004d202e: lea rdi, [rip + 0x6a5e41] ; 0x100b77e76 c
0x1004d2035: lea rsi, [rip + 0x68b59c] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1004d203c: mov edx, 0x443
0x1004d2041: mov ecx, 3
0x1004d2046: call 0x1007e5f70 ; 0x1007e5f70
0x1004d204b: ud2 
0x1004d204d: nop dword ptr [rax]
