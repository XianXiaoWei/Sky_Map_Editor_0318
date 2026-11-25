0x100717a10: push rbp
0x100717a11: mov rbp, rsp
0x100717a14: push rbx
0x100717a15: push rax
0x100717a16: mov rbx, rsi
0x100717a19: mov rdi, rbx
0x100717a1c: call 0x10032eea0 ; 0x10032eea0
0x100717a21: mov rax, qword ptr [rip + 0x19233a8] ; 0x10203add0
0x100717a28: mov eax, dword ptr [rax + 0x38]
0x100717a2b: mov dword ptr [rbx + 8], eax
0x100717a2e: mov rax, qword ptr [rip + 0x4f2bb3] ; 0x100c0a5e8
0x100717a35: add rax, 0x10
0x100717a39: mov qword ptr [rbx], rax
0x100717a3c: mov rax, rbx
0x100717a3f: add rsp, 8
0x100717a43: pop rbx
0x100717a44: pop rbp
0x100717a45: ret 
0x100717a46: nop word ptr cs:[rax + rax]
