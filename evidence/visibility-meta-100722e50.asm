0x100722e50: push rbp
0x100722e51: mov rbp, rsp
0x100722e54: push r14
0x100722e56: push rbx
0x100722e57: mov edi, 0x238
0x100722e5c: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100722e61: mov rbx, rax
0x100722e64: call 0x1007abc10 ; 0x1007abc10
0x100722e69: mov eax, dword ptr [rax + 0x38]
0x100722e6c: mov dword ptr [rbx], eax
0x100722e6e: call 0x1007b0280 ; 0x1007b0280
0x100722e73: mov rax, qword ptr [rip + 0x1918d7e] ; 0x10203bbf8
0x100722e7a: mov eax, dword ptr [rax + 0x38]
0x100722e7d: mov dword ptr [rbx], eax
0x100722e7f: mov qword ptr [rbx + 0x10], 0
0x100722e87: mov dword ptr [rbx + 0x218], 0
0x100722e91: vxorps xmm0, xmm0, xmm0
0x100722e95: vmovups xmmword ptr [rbx + 0x20], xmm0
0x100722e9a: vmovups xmmword ptr [rbx + 0x220], xmm0
0x100722ea2: mov rax, rbx
0x100722ea5: pop rbx
0x100722ea6: pop r14
0x100722ea8: pop rbp
0x100722ea9: ret 
0x100722eaa: mov r14, rax
0x100722ead: mov rdi, rbx
0x100722eb0: call 0x100aa248c ; 0x100aa248c __ZdlPv
0x100722eb5: mov rdi, r14
0x100722eb8: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100722ebd: nop dword ptr [rax]
