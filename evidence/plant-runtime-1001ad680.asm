0x1001ad680: push rbp
0x1001ad681: mov rbp, rsp
0x1001ad684: push r15
0x1001ad686: push r14
0x1001ad688: push rbx
0x1001ad689: push rax
0x1001ad68a: mov r14, rsi
0x1001ad68d: mov r15, rdi
0x1001ad690: mov rbx, 0xfffffffffffee000
0x1001ad697: nop word ptr [rax + rax]
0x1001ad6a0: cmp byte ptr [r15 + rbx + 0x120b1], 0
0x1001ad6a9: je 0x1001ad6bb
0x1001ad6ab: lea rdi, [r15 + rbx + 0x12010]
0x1001ad6b3: mov rsi, r14
0x1001ad6b6: call 0x1001ae8e0 ; 0x1001ae8e0
0x1001ad6bb: add rbx, 0x120
0x1001ad6c2: jne 0x1001ad6a0
0x1001ad6c4: add rsp, 8
0x1001ad6c8: pop rbx
0x1001ad6c9: pop r14
0x1001ad6cb: pop r15
0x1001ad6cd: pop rbp
0x1001ad6ce: ret 
0x1001ad6cf: nop 
