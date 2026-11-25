0x100338a70: push rbp
0x100338a71: mov rbp, rsp
0x100338a74: push rbx
0x100338a75: push rax
0x100338a76: mov rbx, rsi
0x100338a79: call 0x1007abc10 ; 0x1007abc10
0x100338a7e: mov eax, dword ptr [rax + 0x38]
0x100338a81: mov dword ptr [rbx + 8], eax
0x100338a84: call 0x10074a170 ; 0x10074a170
0x100338a89: mov eax, dword ptr [rax + 0x38]
0x100338a8c: mov dword ptr [rbx + 8], eax
0x100338a8f: mov rax, qword ptr [rip + 0x8d4db2] ; 0x100c0d848
0x100338a96: add rax, 0x10
0x100338a9a: mov qword ptr [rbx], rax
0x100338a9d: call 0x100262d70 ; 0x100262d70
0x100338aa2: mov rax, qword ptr [rip + 0x1abc517] ; 0x101df4fc0
0x100338aa9: mov eax, dword ptr [rax + 0x38]
0x100338aac: mov dword ptr [rbx + 8], eax
0x100338aaf: lea rax, [rip + 0x8dc53a] ; 0x100c14ff0
0x100338ab6: mov qword ptr [rbx], rax
0x100338ab9: mov rax, rbx
0x100338abc: add rsp, 8
0x100338ac0: pop rbx
0x100338ac1: pop rbp
0x100338ac2: ret 
