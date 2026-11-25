0x10071d9b0: push rbp
0x10071d9b1: mov rbp, rsp
0x10071d9b4: push r14
0x10071d9b6: push rbx
0x10071d9b7: mov r14, rsi
0x10071d9ba: mov rbx, rdi
0x10071d9bd: mov rsi, qword ptr [rbx + 0x10]
0x10071d9c1: test rsi, rsi
0x10071d9c4: je 0x10071d9ce
0x10071d9c6: mov rdi, r14
0x10071d9c9: call 0x100795a70 ; 0x100795a70
0x10071d9ce: mov rsi, qword ptr [rbx + 0x20]
0x10071d9d2: test rsi, rsi
0x10071d9d5: je 0x10071d9e3
0x10071d9d7: mov rdi, r14
0x10071d9da: pop rbx
0x10071d9db: pop r14
0x10071d9dd: pop rbp
0x10071d9de: jmp 0x100795a70 ; 0x100795a70
0x10071d9e3: pop rbx
0x10071d9e4: pop r14
0x10071d9e6: pop rbp
0x10071d9e7: ret 
0x10071d9e8: nop dword ptr [rax + rax]
