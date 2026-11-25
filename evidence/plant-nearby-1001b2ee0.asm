0x1001b2ee0: push rbp
0x1001b2ee1: mov rbp, rsp
0x1001b2ee4: push r14
0x1001b2ee6: push rbx
0x1001b2ee7: mov edi, 0x50
0x1001b2eec: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001b2ef1: mov rbx, rax
0x1001b2ef4: mov rdi, rbx
0x1001b2ef7: call 0x10032eea0 ; 0x10032eea0
0x1001b2efc: mov rax, qword ptr [rip + 0x1c286fd] ; 0x101ddb600
0x1001b2f03: mov eax, dword ptr [rax + 0x38]
0x1001b2f06: mov dword ptr [rbx + 8], eax
0x1001b2f09: lea rax, [rip + 0xa5f9d8] ; 0x100c128e8
0x1001b2f10: mov qword ptr [rbx], rax
0x1001b2f13: mov rax, rbx
0x1001b2f16: pop rbx
0x1001b2f17: pop r14
0x1001b2f19: pop rbp
0x1001b2f1a: ret 
0x1001b2f1b: mov r14, rax
0x1001b2f1e: mov rdi, rbx
0x1001b2f21: call 0x100aa248c ; 0x100aa248c __ZdlPv
0x1001b2f26: mov rdi, r14
0x1001b2f29: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1001b2f2e: nop 
