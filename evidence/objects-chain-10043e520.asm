0x10043e520: push rbp
0x10043e521: mov rbp, rsp
0x10043e524: push r15
0x10043e526: push r14
0x10043e528: push r13
0x10043e52a: push r12
0x10043e52c: push rbx
0x10043e52d: sub rsp, 0x48
0x10043e531: mov r15, r9
0x10043e534: mov rbx, rdx
0x10043e537: mov r12, rsi
0x10043e53a: mov r14, rdi
0x10043e53d: cmp dword ptr [rbp + 0x10], 1
0x10043e541: jne 0x10043e598
0x10043e543: call 0x1007abbf0 ; 0x1007abbf0
0x10043e548: add rbx, r12
0x10043e54b: test r14b, 1
0x10043e54f: je 0x10043e559
0x10043e551: mov rax, qword ptr [rbx]
0x10043e554: mov r14, qword ptr [rax + r14 - 1]
0x10043e559: mov r12, qword ptr [r15]
0x10043e55c: mov r15, qword ptr [r15 + 8]
0x10043e560: lea rdi, [rbp - 0x70]
0x10043e564: call 0x1007fa3b0 ; 0x1007fa3b0
0x10043e569: mov r8, qword ptr [rax]
0x10043e56c: lea r13, [rbp - 0x70]
0x10043e570: mov rdi, rax
0x10043e573: mov rsi, r13
0x10043e576: mov rdx, r12
0x10043e579: mov rcx, r15
0x10043e57c: call qword ptr [r8 + 0x40]
0x10043e580: mov rdi, rbx
0x10043e583: mov rsi, r13
0x10043e586: call r14
0x10043e589: add rsp, 0x48
0x10043e58d: pop rbx
0x10043e58e: pop r12
0x10043e590: pop r13
0x10043e592: pop r14
0x10043e594: pop r15
0x10043e596: pop rbp
0x10043e597: ret 
0x10043e598: lea rdi, [rip + 0x71f061] ; 0x100b5d600 1 == argCount
0x10043e59f: lea rsi, [rip + 0x71f032] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10043e5a6: mov edx, 0x23d
0x10043e5ab: mov ecx, 3
0x10043e5b0: call 0x1007e5f70 ; 0x1007e5f70
0x10043e5b5: ud2 
0x10043e5b7: nop word ptr [rax + rax]
