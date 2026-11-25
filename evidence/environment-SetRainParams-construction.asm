0x10056b060: push rbp
0x10056b061: mov rbp, rsp
0x10056b064: push rbx
0x10056b065: push rax
0x10056b066: mov rbx, rsi
0x10056b069: mov rdi, rbx
0x10056b06c: call 0x10032eea0 ; 0x10032eea0
0x10056b071: mov rax, qword ptr [rip + 0x1ab2870] ; 0x10201d8e8
0x10056b078: mov eax, dword ptr [rax + 0x38]
0x10056b07b: mov dword ptr [rbx + 8], eax
0x10056b07e: mov rax, qword ptr [rip + 0x6a1a13] ; 0x100c0ca98
0x10056b085: add rax, 0x10
0x10056b089: mov qword ptr [rbx], rax
0x10056b08c: mov byte ptr [rbx + 0x4c], 0
0x10056b090: mov rax, rbx
0x10056b093: add rsp, 8
0x10056b097: pop rbx
0x10056b098: pop rbp
0x10056b099: ret 
