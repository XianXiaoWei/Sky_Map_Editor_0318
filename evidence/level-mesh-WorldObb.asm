0x100402b60: push rbp
0x100402b61: mov rbp, rsp
0x100402b64: push r15
0x100402b66: push r14
0x100402b68: push r12
0x100402b6a: push rbx
0x100402b6b: sub rsp, 0x80
0x100402b72: mov rbx, rsi
0x100402b75: mov r14, rdi
0x100402b78: mov rax, qword ptr [rbx]
0x100402b7b: lea r15, [rbp - 0xa0]
0x100402b82: mov rdi, r15
0x100402b85: call qword ptr [rax + 0x18]
0x100402b88: mov rax, qword ptr [rbx]
0x100402b8b: lea r12, [rbp - 0x60]
0x100402b8f: mov rdi, r12
0x100402b92: mov rsi, rbx
0x100402b95: call qword ptr [rax + 0x20]
0x100402b98: mov rdi, r14
0x100402b9b: mov rsi, r15
0x100402b9e: mov rdx, r12
0x100402ba1: call 0x100076df0 ; 0x100076df0
0x100402ba6: mov rax, r14
0x100402ba9: add rsp, 0x80
0x100402bb0: pop rbx
0x100402bb1: pop r12
0x100402bb3: pop r14
0x100402bb5: pop r15
0x100402bb7: pop rbp
0x100402bb8: ret 
0x100402bb9: nop dword ptr [rax]
