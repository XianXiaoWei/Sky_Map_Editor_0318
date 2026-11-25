0x100338570: push rbp
0x100338571: mov rbp, rsp
0x100338574: push r14
0x100338576: push rbx
0x100338577: sub rsp, 0x10
0x10033857b: mov qword ptr [rbp - 0x20], rdi
0x10033857f: call 0x10074a170 ; 0x10074a170
0x100338584: mov r14, rax
0x100338587: mov qword ptr [rbp - 0x18], 0
0x10033858f: call 0x1000f8400 ; 0x1000f8400
0x100338594: mov rbx, qword ptr [rax]
0x100338597: lea rsi, [rbp - 0x18]
0x10033859b: lea rdx, [rbp - 0x20]
0x10033859f: mov rdi, rax
0x1003385a2: mov rcx, r14
0x1003385a5: call qword ptr [rbx + 0x40]
0x1003385a8: cmp qword ptr [rbp - 0x18], 0
0x1003385ad: mov al, 1
0x1003385af: jne 0x1003385e2
0x1003385b1: call 0x10074a170 ; 0x10074a170
0x1003385b6: mov r14, rax
0x1003385b9: mov qword ptr [rbp - 0x18], 0
0x1003385c1: call 0x100262d70 ; 0x100262d70
0x1003385c6: mov rbx, qword ptr [rax]
0x1003385c9: lea rsi, [rbp - 0x18]
0x1003385cd: lea rdx, [rbp - 0x20]
0x1003385d1: mov rdi, rax
0x1003385d4: mov rcx, r14
0x1003385d7: call qword ptr [rbx + 0x40]
0x1003385da: cmp qword ptr [rbp - 0x18], 0
0x1003385df: setne al
0x1003385e2: add rsp, 0x10
0x1003385e6: pop rbx
0x1003385e7: pop r14
0x1003385e9: pop rbp
0x1003385ea: ret 
0x1003385eb: nop dword ptr [rax + rax]
