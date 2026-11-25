0x100388280: push rbp
0x100388281: mov rbp, rsp
0x100388284: push r14
0x100388286: push rbx
0x100388287: sub rsp, 0x10
0x10038828b: mov r14, rcx
0x10038828e: mov rax, rdx
0x100388291: mov rcx, rsi
0x100388294: mov qword ptr [rbp - 0x18], 0
0x10038829c: mov rbx, qword ptr [rdi]
0x10038829f: lea rsi, [rbp - 0x18]
0x1003882a3: mov rdx, rcx
0x1003882a6: mov rcx, rax
0x1003882a9: call qword ptr [rbx + 0x40]
0x1003882ac: mov rax, qword ptr [rbp - 0x18]
0x1003882b0: test rax, rax
0x1003882b3: je 0x1003882c1
0x1003882b5: add rax, r14
0x1003882b8: add rsp, 0x10
0x1003882bc: pop rbx
0x1003882bd: pop r14
0x1003882bf: pop rbp
0x1003882c0: ret 
0x1003882c1: lea rdi, [rip + 0x81adf4] ; 0x100ba30bc t
0x1003882c8: lea rsi, [rip + 0x7d5309] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1003882cf: mov edx, 0x3a9
0x1003882d4: mov ecx, 3
0x1003882d9: call 0x1007e5f70 ; 0x1007e5f70
0x1003882de: ud2 
