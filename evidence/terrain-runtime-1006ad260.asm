0x1006ad260: push rbp
0x1006ad261: mov rbp, rsp
0x1006ad264: push r14
0x1006ad266: push rbx
0x1006ad267: mov edi, 0x28
0x1006ad26c: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1006ad271: mov rbx, rax
0x1006ad274: call 0x1007abc10 ; 0x1007abc10
0x1006ad279: mov eax, dword ptr [rax + 0x38]
0x1006ad27c: mov dword ptr [rbx + 8], eax
0x1006ad27f: call 0x10079ddd0 ; 0x10079ddd0
0x1006ad284: mov rax, qword ptr [rip + 0x19869b5] ; 0x102033c40
0x1006ad28b: mov eax, dword ptr [rax + 0x38]
0x1006ad28e: mov dword ptr [rbx + 8], eax
0x1006ad291: mov rax, qword ptr [rip + 0x55d400] ; 0x100c0a698
0x1006ad298: add rax, 0x10
0x1006ad29c: mov qword ptr [rbx], rax
0x1006ad29f: mov rax, rbx
0x1006ad2a2: pop rbx
0x1006ad2a3: pop r14
0x1006ad2a5: pop rbp
0x1006ad2a6: ret 
0x1006ad2a7: mov r14, rax
0x1006ad2aa: mov rdi, rbx
0x1006ad2ad: call 0x100aa248c ; 0x100aa248c __ZdlPv
0x1006ad2b2: mov rdi, r14
0x1006ad2b5: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006ad2ba: nop word ptr [rax + rax]
