0x10022c250: push rbp
0x10022c251: mov rbp, rsp
0x10022c254: push r14
0x10022c256: push rbx
0x10022c257: mov edi, 0x20
0x10022c25c: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x10022c261: mov rbx, rax
0x10022c264: call 0x1007abc10 ; 0x1007abc10
0x10022c269: mov rax, qword ptr [rip + 0x1bb6a18] ; 0x101de2c88
0x10022c270: mov eax, dword ptr [rax + 0x38]
0x10022c273: mov dword ptr [rbx], eax
0x10022c275: mov qword ptr [rbx + 8], 0
0x10022c27d: mov dword ptr [rbx + 0x10], 0
0x10022c284: mov qword ptr [rbx + 0x18], 0
0x10022c28c: mov rax, rbx
0x10022c28f: pop rbx
0x10022c290: pop r14
0x10022c292: pop rbp
0x10022c293: ret 
0x10022c294: mov r14, rax
0x10022c297: mov rdi, rbx
0x10022c29a: call 0x100aa248c ; 0x100aa248c __ZdlPv
0x10022c29f: mov rdi, r14
0x10022c2a2: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10022c2a7: nop word ptr [rax + rax]
