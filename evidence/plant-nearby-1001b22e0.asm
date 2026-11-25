0x1001b22e0: push rbp
0x1001b22e1: mov rbp, rsp
0x1001b22e4: push rbx
0x1001b22e5: push rax
0x1001b22e6: mov rbx, rdi
0x1001b22e9: mov byte ptr [rbp - 9], 0
0x1001b22ed: lea rdi, [rbp - 9]
0x1001b22f1: call 0x1007abbd0 ; 0x1007abbd0
0x1001b22f6: mov qword ptr [rbx], rax
0x1001b22f9: mov dword ptr [rbx + 0x10], 0
0x1001b2300: add rsp, 8
0x1001b2304: pop rbx
0x1001b2305: pop rbp
0x1001b2306: ret 
0x1001b2307: nop word ptr [rax + rax]
