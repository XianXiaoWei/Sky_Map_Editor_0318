0x1003881b0: push rbp
0x1003881b1: mov rbp, rsp
0x1003881b4: push r14
0x1003881b6: push rbx
0x1003881b7: mov edi, 0xd0
0x1003881bc: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1003881c1: mov rbx, rax
0x1003881c4: call 0x1007abc10 ; 0x1007abc10
0x1003881c9: mov eax, dword ptr [rax + 0x38]
0x1003881cc: mov dword ptr [rbx], eax
0x1003881ce: call 0x1007b0280 ; 0x1007b0280
0x1003881d3: mov rax, qword ptr [rip + 0x1c72cde] ; 0x101ffaeb8
0x1003881da: mov eax, dword ptr [rax + 0x38]
0x1003881dd: mov dword ptr [rbx], eax
0x1003881df: mov rax, rbx
0x1003881e2: pop rbx
0x1003881e3: pop r14
0x1003881e5: pop rbp
0x1003881e6: ret 
0x1003881e7: mov r14, rax
0x1003881ea: mov rdi, rbx
0x1003881ed: call 0x100aa248c ; 0x100aa248c __ZdlPv
0x1003881f2: mov rdi, r14
0x1003881f5: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1003881fa: nop word ptr [rax + rax]
