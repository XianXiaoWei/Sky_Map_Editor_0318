0x1003ffe50: push rbp
0x1003ffe51: mov rbp, rsp
0x1003ffe54: push r14
0x1003ffe56: push rbx
0x1003ffe57: mov ebx, esi
0x1003ffe59: mov r14, rdi
0x1003ffe5c: mov byte ptr [r14 + 0xd0], bl
0x1003ffe63: mov rdi, qword ptr [r14 + 0x228]
0x1003ffe6a: test rdi, rdi
0x1003ffe6d: je 0x1003ffe77
0x1003ffe6f: movzx esi, bl
0x1003ffe72: call 0x1004636d0 ; 0x1004636d0
0x1003ffe77: test bl, bl
0x1003ffe79: jne 0x1003ffe83
0x1003ffe7b: mov byte ptr [r14 + 0xa55], 1
0x1003ffe83: pop rbx
0x1003ffe84: pop r14
0x1003ffe86: pop rbp
0x1003ffe87: ret 
0x1003ffe88: nop dword ptr [rax + rax]
