0x10022cba0: push rbp
0x10022cba1: mov rbp, rsp
0x10022cba4: push r15
0x10022cba6: push r14
0x10022cba8: push r12
0x10022cbaa: push rbx
0x10022cbab: sub rsp, 0x10
0x10022cbaf: mov r15, r9
0x10022cbb2: mov rbx, rdx
0x10022cbb5: mov r12, rsi
0x10022cbb8: mov r14, rdi
0x10022cbbb: cmp dword ptr [rbp + 0x10], 1
0x10022cbbf: jne 0x10022cc16
0x10022cbc1: call 0x1007abbf0 ; 0x1007abbf0
0x10022cbc6: add rbx, r12
0x10022cbc9: test r14b, 1
0x10022cbcd: je 0x10022cbd7
0x10022cbcf: mov rax, qword ptr [rbx]
0x10022cbd2: mov r14, qword ptr [rax + r14 - 1]
0x10022cbd7: mov r12, qword ptr [r15]
0x10022cbda: mov r15, qword ptr [r15 + 8]
0x10022cbde: mov qword ptr [rbp - 0x28], 0
0x10022cbe6: call 0x100375c20 ; 0x100375c20
0x10022cbeb: mov r8, qword ptr [rax]
0x10022cbee: lea rsi, [rbp - 0x28]
0x10022cbf2: mov rdi, rax
0x10022cbf5: mov rdx, r12
0x10022cbf8: mov rcx, r15
0x10022cbfb: call qword ptr [r8 + 0x40]
0x10022cbff: mov rsi, qword ptr [rbp - 0x28]
0x10022cc03: mov rdi, rbx
0x10022cc06: call r14
0x10022cc09: add rsp, 0x10
0x10022cc0d: pop rbx
0x10022cc0e: pop r12
0x10022cc10: pop r14
0x10022cc12: pop r15
0x10022cc14: pop rbp
0x10022cc15: ret 
0x10022cc16: lea rdi, [rip + 0x9309e3] ; 0x100b5d600 1 == argCount
0x10022cc1d: lea rsi, [rip + 0x9309b4] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10022cc24: mov edx, 0x23d
0x10022cc29: mov ecx, 3
0x10022cc2e: call 0x1007e5f70 ; 0x1007e5f70
0x10022cc33: ud2 
0x10022cc35: nop word ptr cs:[rax + rax]
