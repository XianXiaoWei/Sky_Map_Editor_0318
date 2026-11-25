0x10032fe80: push rbp
0x10032fe81: mov rbp, rsp
0x10032fe84: push r15
0x10032fe86: push r14
0x10032fe88: push rbx
0x10032fe89: push rax
0x10032fe8a: mov r15, r8
0x10032fe8d: mov r14, rcx
0x10032fe90: mov rax, rdi
0x10032fe93: cmp dword ptr [rbp + 0x10], 0
0x10032fe97: jne 0x10032fede
0x10032fe99: add rdx, rsi
0x10032fe9c: test al, 1
0x10032fe9e: je 0x10032fea8
0x10032fea0: mov rcx, qword ptr [rdx]
0x10032fea3: mov rax, qword ptr [rcx + rax - 1]
0x10032fea8: mov rdi, rdx
0x10032feab: call rax
0x10032fead: mov byte ptr [rbp - 0x19], al
0x10032feb0: mov rax, qword ptr [r15]
0x10032feb3: mov rbx, qword ptr [rax + 0x40]
0x10032feb7: mov byte ptr [rbp - 0x1a], 0
0x10032febb: lea rdi, [rbp - 0x1a]
0x10032febf: call 0x1007abbd0 ; 0x1007abbd0
0x10032fec4: lea rdx, [rbp - 0x19]
0x10032fec8: mov rdi, r15
0x10032fecb: mov rsi, r14
0x10032fece: mov rcx, rax
0x10032fed1: call rbx
0x10032fed3: add rsp, 8
0x10032fed7: pop rbx
0x10032fed8: pop r14
0x10032feda: pop r15
0x10032fedc: pop rbp
0x10032fedd: ret 
0x10032fede: lea rdi, [rip + 0x82d737] ; 0x100b5d61c 0 == argCount
0x10032fee5: lea rsi, [rip + 0x82d6ec] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10032feec: mov edx, 0x23d
0x10032fef1: mov ecx, 3
0x10032fef6: call 0x1007e5f70 ; 0x1007e5f70
0x10032fefb: ud2 
0x10032fefd: nop dword ptr [rax]
