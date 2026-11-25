0x100718210: push rbp
0x100718211: mov rbp, rsp
0x100718214: push rbx
0x100718215: push rax
0x100718216: mov rbx, rsi
0x100718219: mov rdi, rbx
0x10071821c: call 0x10032eea0 ; 0x10032eea0
0x100718221: mov rax, qword ptr [rip + 0x1922ce8] ; 0x10203af10
0x100718228: mov eax, dword ptr [rax + 0x38]
0x10071822b: mov dword ptr [rbx + 8], eax
0x10071822e: mov rax, qword ptr [rip + 0x4f5383] ; 0x100c0d5b8
0x100718235: add rax, 0x10
0x100718239: mov qword ptr [rbx], rax
0x10071823c: mov rax, rbx
0x10071823f: add rsp, 8
0x100718243: pop rbx
0x100718244: pop rbp
0x100718245: ret 
0x100718246: nop word ptr cs:[rax + rax]
