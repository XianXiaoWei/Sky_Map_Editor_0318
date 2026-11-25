0x100400180: push rbp
0x100400181: mov rbp, rsp
0x100400184: push r15
0x100400186: push r14
0x100400188: push r13
0x10040018a: push r12
0x10040018c: push rbx
0x10040018d: push rax
0x10040018e: mov r15, r9
0x100400191: mov r12, rcx
0x100400194: mov r13, rsi
0x100400197: mov rbx, rdi
0x10040019a: cmp dword ptr [rbx + 0x185110], 0
0x1004001a1: je 0x1004001dc
0x1004001a3: xor r14d, r14d
0x1004001a6: movzx eax, byte ptr [rdx + 0xd]
0x1004001aa: mov dword ptr [rbp - 0x2c], eax
0x1004001ad: nop dword ptr [rax]
0x1004001b0: mov eax, r14d
0x1004001b3: imul rax, rax, 0xa60
0x1004001ba: lea rdi, [rbx + rax + 0x10]
0x1004001bf: mov rsi, r13
0x1004001c2: mov rdx, r12
0x1004001c5: mov ecx, dword ptr [rbp - 0x2c]
0x1004001c8: mov r8, r15
0x1004001cb: call 0x100400ed0 ; 0x100400ed0
0x1004001d0: inc r14d
0x1004001d3: cmp r14d, dword ptr [rbx + 0x185110]
0x1004001da: jb 0x1004001b0
0x1004001dc: add rsp, 8
0x1004001e0: pop rbx
0x1004001e1: pop r12
0x1004001e3: pop r13
0x1004001e5: pop r14
0x1004001e7: pop r15
0x1004001e9: pop rbp
0x1004001ea: ret 
0x1004001eb: nop dword ptr [rax + rax]
