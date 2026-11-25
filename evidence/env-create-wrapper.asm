0x10031cd70: push rbp
0x10031cd71: mov rbp, rsp
0x10031cd74: push r15
0x10031cd76: push r14
0x10031cd78: push r13
0x10031cd7a: push r12
0x10031cd7c: push rbx
0x10031cd7d: sub rsp, 0x18
0x10031cd81: mov r15, r8
0x10031cd84: mov rbx, rdx
0x10031cd87: mov r12, rdi
0x10031cd8a: cmp dword ptr [rbp + 0x10], 1
0x10031cd8e: jne 0x10031ce02
0x10031cd90: add rbx, rsi
0x10031cd93: test r12b, 1
0x10031cd97: mov qword ptr [rbp - 0x38], rcx
0x10031cd9b: je 0x10031cda5
0x10031cd9d: mov rax, qword ptr [rbx]
0x10031cda0: mov r12, qword ptr [rax + r12 - 1]
0x10031cda5: mov r13, qword ptr [r9]
0x10031cda8: mov r14, qword ptr [r9 + 8]
0x10031cdac: mov qword ptr [rbp - 0x30], 0
0x10031cdb4: call 0x1007abc30 ; 0x1007abc30
0x10031cdb9: mov r8, qword ptr [rax]
0x10031cdbc: lea rsi, [rbp - 0x30]
0x10031cdc0: mov rdi, rax
0x10031cdc3: mov rdx, r13
0x10031cdc6: mov rcx, r14
0x10031cdc9: call qword ptr [r8 + 0x40]
0x10031cdcd: mov rsi, qword ptr [rbp - 0x30]
0x10031cdd1: mov rdi, rbx
0x10031cdd4: call r12
0x10031cdd7: mov qword ptr [rbp - 0x30], rax
0x10031cddb: mov rax, qword ptr [r15]
0x10031cdde: mov rcx, qword ptr [rip + 0x1ad572b] ; 0x101df2510
0x10031cde5: lea rdx, [rbp - 0x30]
0x10031cde9: mov rdi, r15
0x10031cdec: mov rsi, qword ptr [rbp - 0x38]
0x10031cdf0: call qword ptr [rax + 0x40]
0x10031cdf3: add rsp, 0x18
0x10031cdf7: pop rbx
0x10031cdf8: pop r12
0x10031cdfa: pop r13
0x10031cdfc: pop r14
0x10031cdfe: pop r15
0x10031ce00: pop rbp
0x10031ce01: ret 
0x10031ce02: lea rdi, [rip + 0x8407f7] ; 0x100b5d600 1 == argCount
0x10031ce09: lea rsi, [rip + 0x8407c8] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10031ce10: mov edx, 0x23d
0x10031ce15: mov ecx, 3
0x10031ce1a: call 0x1007e5f70 ; 0x1007e5f70
0x10031ce1f: ud2 
0x10031ce21: nop word ptr cs:[rax + rax]
