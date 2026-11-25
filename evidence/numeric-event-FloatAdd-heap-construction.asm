0x100719310: push rbp
0x100719311: mov rbp, rsp
0x100719314: push r14
0x100719316: push rbx
0x100719317: mov edi, 0x60
0x10071931c: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100719321: mov rbx, rax
0x100719324: mov rdi, rbx
0x100719327: call 0x10032eea0 ; 0x10032eea0
0x10071932c: mov rax, qword ptr [rip + 0x1921f3d] ; 0x10203b270
0x100719333: mov eax, dword ptr [rax + 0x38]
0x100719336: mov dword ptr [rbx + 8], eax
0x100719339: mov rax, qword ptr [rip + 0x4f41c8] ; 0x100c0d508
0x100719340: add rax, 0x10
0x100719344: mov qword ptr [rbx], rax
0x100719347: mov rax, rbx
0x10071934a: pop rbx
0x10071934b: pop r14
0x10071934d: pop rbp
0x10071934e: ret 
0x10071934f: mov r14, rax
0x100719352: mov rdi, rbx
0x100719355: call 0x100aa248c ; 0x100aa248c __ZdlPv
0x10071935a: mov rdi, r14
0x10071935d: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100719362: nop word ptr cs:[rax + rax]
