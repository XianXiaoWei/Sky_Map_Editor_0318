0x1004038e0: push rbp
0x1004038e1: mov rbp, rsp
0x1004038e4: push r15
0x1004038e6: push r14
0x1004038e8: push r12
0x1004038ea: push rbx
0x1004038eb: sub rsp, 0x80
0x1004038f2: mov r12, r8
0x1004038f5: mov r14, rcx
0x1004038f8: mov rax, rdi
0x1004038fb: cmp dword ptr [rbp + 0x10], 0
0x1004038ff: jne 0x10040394e
0x100403901: add rdx, rsi
0x100403904: test al, 1
0x100403906: je 0x100403910
0x100403908: mov rcx, qword ptr [rdx]
0x10040390b: mov rax, qword ptr [rcx + rax - 1]
0x100403910: lea r15, [rbp - 0x60]
0x100403914: mov rdi, r15
0x100403917: mov rsi, rdx
0x10040391a: call rax
0x10040391c: mov rax, qword ptr [r12]
0x100403920: mov rbx, qword ptr [rax + 0x40]
0x100403924: lea rdi, [rbp - 0xa0]
0x10040392b: call 0x1007fa3b0 ; 0x1007fa3b0
0x100403930: mov rdi, r12
0x100403933: mov rsi, r14
0x100403936: mov rdx, r15
0x100403939: mov rcx, rax
0x10040393c: call rbx
0x10040393e: add rsp, 0x80
0x100403945: pop rbx
0x100403946: pop r12
0x100403948: pop r14
0x10040394a: pop r15
0x10040394c: pop rbp
0x10040394d: ret 
0x10040394e: lea rdi, [rip + 0x759cc7] ; 0x100b5d61c 0 == argCount
0x100403955: lea rsi, [rip + 0x759c7c] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10040395c: mov edx, 0x23d
0x100403961: mov ecx, 3
0x100403966: call 0x1007e5f70 ; 0x1007e5f70
0x10040396b: ud2 
0x10040396d: nop dword ptr [rax]
