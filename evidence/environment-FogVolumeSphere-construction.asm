0x1003594f0: push rbp
0x1003594f1: mov rbp, rsp
0x1003594f4: push r14
0x1003594f6: push rbx
0x1003594f7: mov rbx, rsi
0x1003594fa: call 0x1007abc10 ; 0x1007abc10
0x1003594ff: mov rax, qword ptr [rip + 0x1a9de7a] ; 0x101df7380
0x100359506: mov eax, dword ptr [rax + 0x38]
0x100359509: mov dword ptr [rbx + 8], eax
0x10035950c: mov rax, qword ptr [rip + 0x8b39ad] ; 0x100c0cec0
0x100359513: add rax, 0x10
0x100359517: mov qword ptr [rbx], rax
0x10035951a: lea r14, [rbx + 0x68]
0x10035951e: mov rdi, r14
0x100359521: call 0x1007f5010 ; 0x1007f5010
0x100359526: lea rdi, [rbx + 0x4a0]
0x10035952d: call 0x1007f5d80 ; 0x1007f5d80
0x100359532: mov rax, rbx
0x100359535: pop rbx
0x100359536: pop r14
0x100359538: pop rbp
0x100359539: ret 
