0x1003385f0: push rbp
0x1003385f1: mov rbp, rsp
0x1003385f4: push r14
0x1003385f6: push rbx
0x1003385f7: sub rsp, 0x10
0x1003385fb: mov qword ptr [rbp - 0x20], rdi
0x1003385ff: call 0x10074a170 ; 0x10074a170
0x100338604: mov r14, rax
0x100338607: mov qword ptr [rbp - 0x18], 0
0x10033860f: call 0x100262d70 ; 0x100262d70
0x100338614: mov rbx, qword ptr [rax]
0x100338617: lea rsi, [rbp - 0x18]
0x10033861b: lea rdx, [rbp - 0x20]
0x10033861f: mov rdi, rax
0x100338622: mov rcx, r14
0x100338625: call qword ptr [rbx + 0x40]
0x100338628: cmp qword ptr [rbp - 0x18], 0
0x10033862d: setne al
0x100338630: add rsp, 0x10
0x100338634: pop rbx
0x100338635: pop r14
0x100338637: pop rbp
0x100338638: ret 
0x100338639: nop dword ptr [rax]
