0x1004d0fd0: push rbp
0x1004d0fd1: mov rbp, rsp
0x1004d0fd4: push r15
0x1004d0fd6: push r14
0x1004d0fd8: push rbx
0x1004d0fd9: push rax
0x1004d0fda: mov r15, rdi
0x1004d0fdd: test rsi, rsi
0x1004d0fe0: je 0x1004d0feb
0x1004d0fe2: mov edi, dword ptr [rsi]
0x1004d0fe4: call 0x1007abd30 ; 0x1007abd30
0x1004d0fe9: jmp 0x1004d0ff0 ; 0x1004d0ff0
0x1004d0feb: call 0x1007abbf0 ; 0x1007abbf0
0x1004d0ff0: mov rcx, qword ptr [rax]
0x1004d0ff3: mov rdi, rax
0x1004d0ff6: call qword ptr [rcx + 0x68]
0x1004d0ff9: mov r14, rax
0x1004d0ffc: test r14, r14
0x1004d0fff: jne 0x1004d1009
0x1004d1001: call 0x1007abc60 ; 0x1007abc60
0x1004d1006: mov r14, rax
0x1004d1009: add r15, 0x20
0x1004d100d: mov rbx, r14
0x1004d1010: jmp 0x1004d1025 ; 0x1004d1025
0x1004d1012: nop word ptr cs:[rax + rax]
0x1004d1020: call rax
0x1004d1022: mov rbx, rax
0x1004d1025: mov rcx, qword ptr [r15]
0x1004d1028: test rcx, rcx
0x1004d102b: je 0x1004d1053
0x1004d102d: mov rax, r15
0x1004d1030: lea rdx, [rcx + 8]
0x1004d1034: cmp qword ptr [rcx + 0x20], rbx
0x1004d1038: cmovae rdx, rcx
0x1004d103c: cmovae rax, rcx
0x1004d1040: mov rcx, qword ptr [rdx]
0x1004d1043: test rcx, rcx
0x1004d1046: jne 0x1004d1030
0x1004d1048: cmp rax, r15
0x1004d104b: je 0x1004d1053
0x1004d104d: cmp qword ptr [rax + 0x20], rbx
0x1004d1051: jbe 0x1004d106e
0x1004d1053: mov rax, qword ptr [rbx + 0x30]
0x1004d1057: test rax, rax
0x1004d105a: je 0x1004d10b1
0x1004d105c: call rax
0x1004d105e: mov rax, qword ptr [rbx + 0x30]
0x1004d1062: mov ebx, 0
0x1004d1067: test rax, rax
0x1004d106a: je 0x1004d1025
0x1004d106c: jmp 0x1004d1020 ; 0x1004d1020
0x1004d106e: mov r15, qword ptr [rax + 0x28]
0x1004d1072: mov r14, qword ptr [rax + 0x30]
0x1004d1076: mov qword ptr [rbp - 0x20], 0
0x1004d107e: call 0x1007b0280 ; 0x1007b0280
0x1004d1083: mov rbx, qword ptr [rax]
0x1004d1086: lea rsi, [rbp - 0x20]
0x1004d108a: mov rdi, rax
0x1004d108d: mov rdx, r15
0x1004d1090: mov rcx, r14
0x1004d1093: call qword ptr [rbx + 0x40]
0x1004d1096: mov rax, qword ptr [rbp - 0x20]
0x1004d109a: test rax, rax
0x1004d109d: je 0x1004d10a4
0x1004d109f: mov eax, dword ptr [rax + 4]
0x1004d10a2: jmp 0x1004d10a6 ; 0x1004d10a6
0x1004d10a4: xor eax, eax
0x1004d10a6: add rsp, 8
0x1004d10aa: pop rbx
0x1004d10ab: pop r14
0x1004d10ad: pop r15
0x1004d10af: pop rbp
0x1004d10b0: ret 
0x1004d10b1: mov r9, qword ptr [r14 + 8]
0x1004d10b5: lea rdi, [rip + 0x6bce2f] ; 0x100b8deeb it != m_factoryMap.end()
0x1004d10bc: lea rsi, [rip + 0x6bcbdf] ; 0x100b8dca2 ObjectFactory.cpp
0x1004d10c3: lea r8, [rip + 0x6bce3a] ; 0x100b8df04 Unable to find factory for type %s.
0x1004d10ca: mov edx, 0x91
0x1004d10cf: mov ecx, 4
0x1004d10d4: xor eax, eax
0x1004d10d6: call 0x1007e6030 ; 0x1007e6030
0x1004d10db: ud2 
0x1004d10dd: nop dword ptr [rax]
