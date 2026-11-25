0x1001a9dc0: push rbp
0x1001a9dc1: mov rbp, rsp
0x1001a9dc4: mov rax, qword ptr [rdi + 0x38]
0x1001a9dc8: test rax, rax
0x1001a9dcb: je 0x1001a9ddf
0x1001a9dcd: mov rcx, qword ptr [rdi + 0x40]
0x1001a9dd1: mov qword ptr [rcx + 0x80], rax
0x1001a9dd8: mov qword ptr [rcx + 0xe8], rax
0x1001a9ddf: mov dword ptr [rdi + 0x4c], 0
0x1001a9de6: pop rbp
0x1001a9de7: ret 
0x1001a9de8: nop dword ptr [rax + rax]
