0x1001aa750: push rbp
0x1001aa751: mov rbp, rsp
0x1001aa754: push rbx
0x1001aa755: push rax
0x1001aa756: mov rbx, rsi
0x1001aa759: mov rdi, rbx
0x1001aa75c: call 0x10032eea0 ; 0x10032eea0
0x1001aa761: mov rax, qword ptr [rip + 0x1c305a8] ; 0x101ddad10
0x1001aa768: mov eax, dword ptr [rax + 0x38]
0x1001aa76b: mov dword ptr [rbx + 8], eax
0x1001aa76e: mov rax, qword ptr [rip + 0xa600ab] ; 0x100c0a820
0x1001aa775: add rax, 0x10
0x1001aa779: mov qword ptr [rbx], rax
0x1001aa77c: mov qword ptr [rbx + 0x38], 0
0x1001aa784: mov dword ptr [rbx + 0x40], 0x41c80000
0x1001aa78b: mov rax, rbx
0x1001aa78e: add rsp, 8
0x1001aa792: pop rbx
0x1001aa793: pop rbp
0x1001aa794: ret 
