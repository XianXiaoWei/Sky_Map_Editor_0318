0x1001b2c30: push rbp
0x1001b2c31: mov rbp, rsp
0x1001b2c34: push r14
0x1001b2c36: push rbx
0x1001b2c37: mov edi, 0x20
0x1001b2c3c: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001b2c41: mov rbx, rax
0x1001b2c44: call 0x1007abc10 ; 0x1007abc10
0x1001b2c49: mov eax, dword ptr [rax + 0x38]
0x1001b2c4c: mov dword ptr [rbx + 8], eax
0x1001b2c4f: call 0x1004b1530 ; 0x1004b1530
0x1001b2c54: mov rax, qword ptr [rip + 0x1c28945] ; 0x101ddb5a0
0x1001b2c5b: mov eax, dword ptr [rax + 0x38]
0x1001b2c5e: mov dword ptr [rbx + 8], eax
0x1001b2c61: lea rax, [rip + 0xa5fc28] ; 0x100c12890
0x1001b2c68: mov qword ptr [rbx], rax
0x1001b2c6b: mov dword ptr [rbx + 0x1c], 0
0x1001b2c72: mov rax, rbx
0x1001b2c75: pop rbx
0x1001b2c76: pop r14
0x1001b2c78: pop rbp
0x1001b2c79: ret 
0x1001b2c7a: mov r14, rax
0x1001b2c7d: mov rdi, rbx
0x1001b2c80: call 0x100aa248c ; 0x100aa248c __ZdlPv
0x1001b2c85: mov rdi, r14
0x1001b2c88: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1001b2c8d: nop dword ptr [rax]
