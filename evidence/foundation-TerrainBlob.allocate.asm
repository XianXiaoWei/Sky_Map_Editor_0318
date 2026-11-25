0x1006b0ea0: push rbp
0x1006b0ea1: mov rbp, rsp
0x1006b0ea4: push r14
0x1006b0ea6: push rbx
0x1006b0ea7: mov edi, 0x280
0x1006b0eac: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1006b0eb1: mov rbx, rax
0x1006b0eb4: call 0x1007abc10 ; 0x1007abc10
0x1006b0eb9: mov rax, qword ptr [rip + 0x19832a0] ; 0x102034160
0x1006b0ec0: mov eax, dword ptr [rax + 0x38]
0x1006b0ec3: mov dword ptr [rbx], eax
0x1006b0ec5: mov qword ptr [rbx + 0x1e8], 0
0x1006b0ed0: mov byte ptr [rbx + 0x1f0], 0
0x1006b0ed7: vmovaps xmm0, xmmword ptr [rip + 0x4086a1] ; 0x100ab9580
0x1006b0edf: vmovups xmmword ptr [rbx + 0x1f4], xmm0
0x1006b0ee7: mov rax, rbx
0x1006b0eea: pop rbx
0x1006b0eeb: pop r14
0x1006b0eed: pop rbp
0x1006b0eee: ret 
0x1006b0eef: mov r14, rax
0x1006b0ef2: mov rdi, rbx
0x1006b0ef5: call 0x100aa248c ; 0x100aa248c __ZdlPv
0x1006b0efa: mov rdi, r14
0x1006b0efd: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006b0f02: nop word ptr cs:[rax + rax]
