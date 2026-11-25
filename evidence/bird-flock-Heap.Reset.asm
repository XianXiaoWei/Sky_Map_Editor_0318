0x100795650: push rbp
0x100795651: mov rbp, rsp
0x100795654: push rbx
0x100795655: push rax
0x100795656: mov rbx, rdi
0x100795659: mov rdi, qword ptr [rbx + 0x20]
0x10079565d: test rdi, rdi
0x100795660: je 0x100795667
0x100795662: call 0x100782e20 ; 0x100782e20
0x100795667: cmp byte ptr [rbx + 0x47], 0
0x10079566b: je 0x10079567a
0x10079566d: mov rdi, qword ptr [rbx + 8]
0x100795671: mov rsi, qword ptr [rbx + 0x10]
0x100795675: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x10079567a: mov rdi, qword ptr [rbx + 8]
0x10079567e: mov rsi, qword ptr [rbx + 0x10]
0x100795682: xor edx, edx
0x100795684: call 0x100782930 ; 0x100782930
0x100795689: mov qword ptr [rbx + 0x20], rax
0x10079568d: mov rsi, qword ptr [rbx + 0x10]
0x100795691: mov rdi, rax
0x100795694: add rsp, 8
0x100795698: pop rbx
0x100795699: pop rbp
0x10079569a: jmp 0x1007860d0 ; 0x1007860d0
0x10079569f: nop 
