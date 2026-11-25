0x1007168d0: push rbp
0x1007168d1: mov rbp, rsp
0x1007168d4: push r14
0x1007168d6: push rbx
0x1007168d7: mov edi, 0x18
0x1007168dc: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1007168e1: mov rbx, rax
0x1007168e4: call 0x1007abc10 ; 0x1007abc10
0x1007168e9: mov rax, qword ptr [rip + 0x1924140] ; 0x10203aa30
0x1007168f0: mov eax, dword ptr [rax + 0x38]
0x1007168f3: mov dword ptr [rbx], eax
0x1007168f5: mov rax, rbx
0x1007168f8: pop rbx
0x1007168f9: pop r14
0x1007168fb: pop rbp
0x1007168fc: ret 
0x1007168fd: mov r14, rax
0x100716900: mov rdi, rbx
0x100716903: call 0x100aa248c ; 0x100aa248c __ZdlPv
0x100716908: mov rdi, r14
0x10071690b: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
