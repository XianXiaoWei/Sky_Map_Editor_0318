0x100523dc0: push rbp
0x100523dc1: mov rbp, rsp
0x100523dc4: push r14
0x100523dc6: push rbx
0x100523dc7: mov edi, 0x90
0x100523dcc: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100523dd1: mov rbx, rax
0x100523dd4: call 0x1007abc10 ; 0x1007abc10
0x100523dd9: mov rax, qword ptr [rip + 0x1af3ed8] ; 0x102017cb8
0x100523de0: mov eax, dword ptr [rax + 0x38]
0x100523de3: mov dword ptr [rbx], eax
0x100523de5: vxorps xmm0, xmm0, xmm0
0x100523de9: vmovups xmmword ptr [rbx + 0x20], xmm0
0x100523dee: mov qword ptr [rbx + 0x30], 0
0x100523df6: vxorps ymm0, ymm0, ymm0
0x100523dfa: vmovups ymmword ptr [rbx + 0x69], ymm0
0x100523dff: vmovups ymmword ptr [rbx + 0x60], ymm0
0x100523e04: mov rax, rbx
0x100523e07: pop rbx
0x100523e08: pop r14
0x100523e0a: pop rbp
0x100523e0b: vzeroupper 
0x100523e0e: ret 
0x100523e0f: mov r14, rax
0x100523e12: mov rdi, rbx
0x100523e15: call 0x100aa248c ; 0x100aa248c __ZdlPv
0x100523e1a: mov rdi, r14
0x100523e1d: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100523e22: nop word ptr cs:[rax + rax]
