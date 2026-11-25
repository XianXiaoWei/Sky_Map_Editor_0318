0x10022c000: push rbp
0x10022c001: mov rbp, rsp
0x10022c004: push r15
0x10022c006: push r14
0x10022c008: push rbx
0x10022c009: push rax
0x10022c00a: mov r15d, esi
0x10022c00d: mov r14, rdi
0x10022c010: mov rbx, qword ptr [r14 + 0x2a068]
0x10022c017: test rbx, rbx
0x10022c01a: je 0x10022c097
0x10022c01c: mov rax, qword ptr [rbx]
0x10022c01f: mov qword ptr [r14 + 0x2a068], rax
0x10022c026: call 0x1007abc10 ; 0x1007abc10
0x10022c02b: mov rax, qword ptr [rip + 0x1bb6c56] ; 0x101de2c88
0x10022c032: mov eax, dword ptr [rax + 0x38]
0x10022c035: mov dword ptr [rbx], eax
0x10022c037: mov qword ptr [rbx + 8], 0
0x10022c03f: mov dword ptr [rbx + 0x10], 0
0x10022c046: mov byte ptr [rbx + 0x14], 1
0x10022c04a: add r14, 0x10
0x10022c04e: mov qword ptr [rbx + 0x18], r14
0x10022c052: test r15d, r15d
0x10022c055: je 0x10022c089
0x10022c057: mov dword ptr [rbx + 0x10], r15d
0x10022c05b: mov esi, r15d
0x10022c05e: shl rsi, 3
0x10022c062: mov rdx, qword ptr [rip + 0x1bb700f] ; 0x101de3078
0x10022c069: mov ecx, 0x10
0x10022c06e: mov rdi, r14
0x10022c071: call 0x100795530 ; 0x100795530
0x10022c076: mov esi, dword ptr [rbx + 0x10]
0x10022c079: shl rsi, 3
0x10022c07d: mov qword ptr [rbx + 8], rax
0x10022c081: mov rdi, rax
0x10022c084: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x10022c089: mov rax, rbx
0x10022c08c: add rsp, 8
0x10022c090: pop rbx
0x10022c091: pop r14
0x10022c093: pop r15
0x10022c095: pop rbp
0x10022c096: ret 
0x10022c097: lea rdi, [rip + 0x94ec62] ; 0x100b7ad00 newClump
0x10022c09e: lea rsi, [rip + 0x94ebf9] ; 0x100b7ac9e Clump.cpp
0x10022c0a5: mov edx, 0x99
0x10022c0aa: mov ecx, 3
0x10022c0af: call 0x1007e5f70 ; 0x1007e5f70
0x10022c0b4: ud2 
0x10022c0b6: nop word ptr cs:[rax + rax]
