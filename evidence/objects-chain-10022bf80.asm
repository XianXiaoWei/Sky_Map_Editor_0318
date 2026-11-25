0x10022bf80: push rbp
0x10022bf81: mov rbp, rsp
0x10022bf84: push r14
0x10022bf86: push rbx
0x10022bf87: mov r14, rdi
0x10022bf8a: mov rbx, qword ptr [r14 + 0x2a068]
0x10022bf91: test rbx, rbx
0x10022bf94: je 0x10022bfd4
0x10022bf96: mov rax, qword ptr [rbx]
0x10022bf99: mov qword ptr [r14 + 0x2a068], rax
0x10022bfa0: call 0x1007abc10 ; 0x1007abc10
0x10022bfa5: mov rax, qword ptr [rip + 0x1bb6cdc] ; 0x101de2c88
0x10022bfac: mov eax, dword ptr [rax + 0x38]
0x10022bfaf: mov dword ptr [rbx], eax
0x10022bfb1: mov qword ptr [rbx + 8], 0
0x10022bfb9: mov dword ptr [rbx + 0x10], 0
0x10022bfc0: mov byte ptr [rbx + 0x14], 1
0x10022bfc4: add r14, 0x10
0x10022bfc8: mov qword ptr [rbx + 0x18], r14
0x10022bfcc: mov rax, rbx
0x10022bfcf: pop rbx
0x10022bfd0: pop r14
0x10022bfd2: pop rbp
0x10022bfd3: ret 
0x10022bfd4: lea rdi, [rip + 0x94ed25] ; 0x100b7ad00 newClump
0x10022bfdb: lea rsi, [rip + 0x94ecbc] ; 0x100b7ac9e Clump.cpp
0x10022bfe2: mov edx, 0x99
0x10022bfe7: mov ecx, 3
0x10022bfec: call 0x1007e5f70 ; 0x1007e5f70
0x10022bff1: ud2 
0x10022bff3: nop word ptr cs:[rax + rax]
