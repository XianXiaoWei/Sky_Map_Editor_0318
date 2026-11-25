0x1001aa370: push rbp
0x1001aa371: mov rbp, rsp
0x1001aa374: push rbx
0x1001aa375: push rax
0x1001aa376: mov rbx, rsi
0x1001aa379: mov rdi, rbx
0x1001aa37c: call 0x10032eea0 ; 0x10032eea0
0x1001aa381: mov rax, qword ptr [rip + 0x1c30908] ; 0x101ddac90
0x1001aa388: mov eax, dword ptr [rax + 0x38]
0x1001aa38b: mov dword ptr [rbx + 8], eax
0x1001aa38e: mov rax, qword ptr [rip + 0xa62ee3] ; 0x100c0d278
0x1001aa395: add rax, 0x10
0x1001aa399: mov qword ptr [rbx], rax
0x1001aa39c: mov qword ptr [rbx + 0x38], 0
0x1001aa3a4: mov rax, rbx
0x1001aa3a7: add rsp, 8
0x1001aa3ab: pop rbx
0x1001aa3ac: pop rbp
0x1001aa3ad: ret 
