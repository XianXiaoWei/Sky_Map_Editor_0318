0x100403ac0: push rbp
0x100403ac1: mov rbp, rsp
0x100403ac4: push r15
0x100403ac6: push r14
0x100403ac8: push rbx
0x100403ac9: push rax
0x100403aca: mov r15, r8
0x100403acd: mov r14, rcx
0x100403ad0: mov rax, rdi
0x100403ad3: cmp dword ptr [rbp + 0x10], 0
0x100403ad7: jne 0x100403b1e
0x100403ad9: add rdx, rsi
0x100403adc: test al, 1
0x100403ade: je 0x100403ae8
0x100403ae0: mov rcx, qword ptr [rdx]
0x100403ae3: mov rax, qword ptr [rcx + rax - 1]
0x100403ae8: mov rdi, rdx
0x100403aeb: call rax
0x100403aed: mov byte ptr [rbp - 0x19], al
0x100403af0: mov rax, qword ptr [r15]
0x100403af3: mov rbx, qword ptr [rax + 0x40]
0x100403af7: mov byte ptr [rbp - 0x1a], 0
0x100403afb: lea rdi, [rbp - 0x1a]
0x100403aff: call 0x1007abbd0 ; 0x1007abbd0
0x100403b04: lea rdx, [rbp - 0x19]
0x100403b08: mov rdi, r15
0x100403b0b: mov rsi, r14
0x100403b0e: mov rcx, rax
0x100403b11: call rbx
0x100403b13: add rsp, 8
0x100403b17: pop rbx
0x100403b18: pop r14
0x100403b1a: pop r15
0x100403b1c: pop rbp
0x100403b1d: ret 
0x100403b1e: lea rdi, [rip + 0x759af7] ; 0x100b5d61c 0 == argCount
0x100403b25: lea rsi, [rip + 0x759aac] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x100403b2c: mov edx, 0x23d
0x100403b31: mov ecx, 3
0x100403b36: call 0x1007e5f70 ; 0x1007e5f70
0x100403b3b: ud2 
0x100403b3d: nop dword ptr [rax]
