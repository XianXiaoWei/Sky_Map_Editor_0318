0x100462440: push rbp
0x100462441: mov rbp, rsp
0x100462444: push rbx
0x100462445: push rax
0x100462446: mov rbx, rsi
0x100462449: mov rdi, rbx
0x10046244c: call 0x10032eea0 ; 0x10032eea0
0x100462451: mov rax, qword ptr [rip + 0x1ba4cf0] ; 0x102007148
0x100462458: mov eax, dword ptr [rax + 0x38]
0x10046245b: mov dword ptr [rbx + 8], eax
0x10046245e: mov rax, qword ptr [rip + 0x7aa9db] ; 0x100c0ce40
0x100462465: add rax, 0x10
0x100462469: mov qword ptr [rbx], rax
0x10046246c: mov qword ptr [rbx + 0x58], 0
0x100462474: mov dword ptr [rbx + 0x88], 0
0x10046247e: mov dword ptr [rbx + 0x18a0], 1
0x100462488: mov rax, rbx
0x10046248b: add rsp, 8
0x10046248f: pop rbx
0x100462490: pop rbp
0x100462491: ret 
