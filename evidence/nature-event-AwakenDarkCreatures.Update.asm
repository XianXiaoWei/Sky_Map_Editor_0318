0x100273c50: push rbp
0x100273c51: mov rbp, rsp
0x100273c54: push r15
0x100273c56: push r14
0x100273c58: push r13
0x100273c5a: push r12
0x100273c5c: push rbx
0x100273c5d: sub rsp, 0x18
0x100273c61: mov r13, rdi
0x100273c64: mov qword ptr [rbp - 0x38], rsi
0x100273c68: mov rax, qword ptr [rsi + 0x178]
0x100273c6f: mov rax, qword ptr [rax + 0x40]
0x100273c73: mov eax, dword ptr [rax + 0x820]
0x100273c79: cmp eax, dword ptr [rip + 0xab77a1] ; 0x100d2b420
0x100273c7f: je 0x100273d51
0x100273c85: mov rax, qword ptr [r13 + 0x38]
0x100273c89: test rax, rax
0x100273c8c: je 0x100273d7f
0x100273c92: mov r14d, dword ptr [rax + 0x10]
0x100273c96: test r14, r14
0x100273c99: je 0x100273d49
0x100273c9f: xor r15d, r15d
0x100273ca2: nop word ptr cs:[rax + rax]
0x100273cb0: mov rax, qword ptr [rax + 8]
0x100273cb4: mov rax, qword ptr [rax + r15*8]
0x100273cb8: mov qword ptr [rbp - 0x40], rax
0x100273cbc: call 0x1007abc10 ; 0x1007abc10
0x100273cc1: mov qword ptr [rbp - 0x30], 0
0x100273cc9: mov rdi, qword ptr [rip + 0x1b739d0] ; 0x101de76a0
0x100273cd0: mov rbx, qword ptr [rdi]
0x100273cd3: lea rsi, [rbp - 0x30]
0x100273cd7: lea rdx, [rbp - 0x40]
0x100273cdb: mov rcx, rax
0x100273cde: call qword ptr [rbx + 0x40]
0x100273ce1: mov r12, qword ptr [rbp - 0x30]
0x100273ce5: test r12, r12
0x100273ce8: je 0x100273d60
0x100273cea: cmp byte ptr [r12 + 0x2dc], 0
0x100273cf3: je 0x100273d0d
0x100273cf5: mov rax, qword ptr [rbp - 0x38]
0x100273cf9: mov rax, qword ptr [rax + 0x178]
0x100273d00: mov rdi, qword ptr [rax + 0x40]
0x100273d04: call 0x1004a0a20 ; 0x1004a0a20
0x100273d09: test al, al
0x100273d0b: je 0x100273d16
0x100273d0d: mov byte ptr [r12 + 0x2c3], 1
0x100273d16: inc r15
0x100273d19: cmp r15, r14
0x100273d1c: jae 0x100273d49
0x100273d1e: mov rax, qword ptr [r13 + 0x38]
0x100273d22: mov ecx, dword ptr [rax + 0x10]
0x100273d25: cmp r15, rcx
0x100273d28: jb 0x100273cb0
0x100273d2a: lea rdi, [rip + 0x8edc27] ; 0x100b61958 idx < size
0x100273d31: lea rsi, [rip + 0x8edc2b] ; 0x100b61963 ./Clump.h
0x100273d38: mov edx, 0x36
0x100273d3d: mov ecx, 3
0x100273d42: call 0x1007e5f70 ; 0x1007e5f70
0x100273d47: ud2 
0x100273d49: mov rdi, r13
0x100273d4c: call 0x10032ef60 ; 0x10032ef60
0x100273d51: add rsp, 0x18
0x100273d55: pop rbx
0x100273d56: pop r12
0x100273d58: pop r13
0x100273d5a: pop r14
0x100273d5c: pop r15
0x100273d5e: pop rbp
0x100273d5f: ret 
0x100273d60: lea rdi, [rip + 0x8edd91] ; 0x100b61af8 ret
0x100273d67: lea rsi, [rip + 0x8edbf5] ; 0x100b61963 ./Clump.h
0x100273d6e: mov edx, 0x47
0x100273d73: mov ecx, 3
0x100273d78: call 0x1007e5f70 ; 0x1007e5f70
0x100273d7d: ud2 
0x100273d7f: lea rdi, [rip + 0x909019] ; 0x100b7cd9f creatures
0x100273d86: lea rsi, [rip + 0x908e79] ; 0x100b7cc06 DarkCreature.cpp
0x100273d8d: mov edx, 0x5aa
0x100273d92: mov ecx, 3
0x100273d97: call 0x1007e5f70 ; 0x1007e5f70
0x100273d9c: ud2 
0x100273d9e: nop 
