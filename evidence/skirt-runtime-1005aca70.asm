0x1005aca70: push rbp
0x1005aca71: mov rbp, rsp
0x1005aca74: push r14
0x1005aca76: push rbx
0x1005aca77: mov r14, rdi
0x1005aca7a: cmp dword ptr [r14 + 0x24], 0
0x1005aca7f: je 0x1005acaab
0x1005aca81: xor ebx, ebx
0x1005aca83: nop word ptr cs:[rax + rax]
0x1005aca90: mov eax, ebx
0x1005aca92: imul rax, rax, 0x3540
0x1005aca99: lea rdi, [r14 + rax + 0x30]
0x1005aca9e: call 0x1007f6b80 ; 0x1007f6b80
0x1005acaa3: inc ebx
0x1005acaa5: cmp ebx, dword ptr [r14 + 0x24]
0x1005acaa9: jb 0x1005aca90
0x1005acaab: lea rdi, [r14 + 0x63db0]
0x1005acab2: call 0x1007f5250 ; 0x1007f5250
0x1005acab7: mov qword ptr [r14 + 0x1c], 0
0x1005acabf: mov dword ptr [r14 + 0x24], 0
0x1005acac7: mov rsi, qword ptr [r14 + 0x641f0]
0x1005acace: test rsi, rsi
0x1005acad1: je 0x1005acadf
0x1005acad3: mov rdi, qword ptr [r14 + 0x641e8]
0x1005acada: call 0x100795a70 ; 0x100795a70
0x1005acadf: mov qword ptr [r14 + 0x641f0], 0
0x1005acaea: pop rbx
0x1005acaeb: pop r14
0x1005acaed: pop rbp
0x1005acaee: ret 
0x1005acaef: nop 
