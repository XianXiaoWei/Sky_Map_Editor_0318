0x100591c00: push rbp
0x100591c01: mov rbp, rsp
0x100591c04: push r14
0x100591c06: push rbx
0x100591c07: mov edi, 0x60
0x100591c0c: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100591c11: mov rbx, rax
0x100591c14: mov rdi, rbx
0x100591c17: call 0x10032eea0 ; 0x10032eea0
0x100591c1c: mov rax, qword ptr [rip + 0x1a8e905] ; 0x102020528
0x100591c23: mov eax, dword ptr [rax + 0x38]
0x100591c26: mov dword ptr [rbx + 8], eax
0x100591c29: mov rax, qword ptr [rip + 0x67b708] ; 0x100c0d338
0x100591c30: add rax, 0x10
0x100591c34: mov qword ptr [rbx], rax
0x100591c37: mov rax, rbx
0x100591c3a: pop rbx
0x100591c3b: pop r14
0x100591c3d: pop rbp
0x100591c3e: ret 
0x100591c3f: mov r14, rax
0x100591c42: mov rdi, rbx
0x100591c45: call 0x100aa248c ; 0x100aa248c __ZdlPv
0x100591c4a: mov rdi, r14
0x100591c4d: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100591c52: nop word ptr cs:[rax + rax]
