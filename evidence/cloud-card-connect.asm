0x10021fa30: push rbp
0x10021fa31: mov rbp, rsp
0x10021fa34: push r15
0x10021fa36: push r14
0x10021fa38: push r13
0x10021fa3a: push r12
0x10021fa3c: push rbx
0x10021fa3d: push rax
0x10021fa3e: mov r13, rcx
0x10021fa41: mov qword ptr [rbp - 0x30], rdx
0x10021fa45: mov r14d, esi
0x10021fa48: mov ecx, edi
0x10021fa4a: cmp dword ptr [r13 + rcx*4], -1
0x10021fa50: je 0x10021fa56
0x10021fa52: xor eax, eax
0x10021fa54: jmp 0x10021faa2 ; 0x10021faa2
0x10021fa56: mov dword ptr [r13 + rcx*4], r14d
0x10021fa5b: shl rcx, 4
0x10021fa5f: mov al, 1
0x10021fa61: mov rdx, qword ptr [rbp - 0x30]
0x10021fa65: cmp dword ptr [rdx + rcx], 0
0x10021fa69: je 0x10021faa2
0x10021fa6b: mov rax, qword ptr [rbp - 0x30]
0x10021fa6f: lea rbx, [rax + rcx]
0x10021fa73: lea r15, [rax + rcx + 8]
0x10021fa78: xor r12d, r12d
0x10021fa7b: nop dword ptr [rax + rax]
0x10021fa80: mov rax, qword ptr [r15]
0x10021fa83: mov ecx, r12d
0x10021fa86: mov edi, dword ptr [rax + rcx*4]
0x10021fa89: mov esi, r14d
0x10021fa8c: mov rdx, qword ptr [rbp - 0x30]
0x10021fa90: mov rcx, r13
0x10021fa93: call 0x10021fa30 ; 0x10021fa30
0x10021fa98: inc r12d
0x10021fa9b: cmp r12d, dword ptr [rbx]
0x10021fa9e: jb 0x10021fa80
0x10021faa0: mov al, 1
0x10021faa2: add rsp, 8
0x10021faa6: pop rbx
0x10021faa7: pop r12
0x10021faa9: pop r13
0x10021faab: pop r14
0x10021faad: pop r15
0x10021faaf: pop rbp
0x10021fab0: ret 
0x10021fab1: nop word ptr cs:[rax + rax]
