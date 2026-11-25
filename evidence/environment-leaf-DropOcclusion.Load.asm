0x1002ce410: push rbp
0x1002ce411: mov rbp, rsp
0x1002ce414: push rbx
0x1002ce415: push rax
0x1002ce416: mov rbx, rdi
0x1002ce419: mov rax, qword ptr [rbx + 0x38]
0x1002ce41d: mov esi, dword ptr [rax + 0x10]
0x1002ce420: shl rsi, 2
0x1002ce424: mov rax, qword ptr [rip + 0x1b20105] ; 0x101dee530
0x1002ce42b: mov ecx, 0x10
0x1002ce430: mov rdi, rdx
0x1002ce433: mov rdx, rax
0x1002ce436: call 0x100795530 ; 0x100795530
0x1002ce43b: mov qword ptr [rbx + 0x78], rax
0x1002ce43f: mov rcx, qword ptr [rbx + 0x38]
0x1002ce443: mov esi, dword ptr [rcx + 0x10]
0x1002ce446: shl rsi, 2
0x1002ce44a: mov rdi, rax
0x1002ce44d: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x1002ce452: add rsp, 8
0x1002ce456: pop rbx
0x1002ce457: pop rbp
0x1002ce458: ret 
0x1002ce459: nop dword ptr [rax]
