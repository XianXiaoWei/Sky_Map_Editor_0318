0x100717550: push rbp
0x100717551: mov rbp, rsp
0x100717554: push r14
0x100717556: push rbx
0x100717557: mov edi, 0x58
0x10071755c: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100717561: mov rbx, rax
0x100717564: mov rdi, rbx
0x100717567: call 0x10032eea0 ; 0x10032eea0
0x10071756c: mov rax, qword ptr [rip + 0x19237dd] ; 0x10203ad50
0x100717573: mov eax, dword ptr [rax + 0x38]
0x100717576: mov dword ptr [rbx + 8], eax
0x100717579: mov rax, qword ptr [rip + 0x4f5fb8] ; 0x100c0d538
0x100717580: add rax, 0x10
0x100717584: mov qword ptr [rbx], rax
0x100717587: mov rax, rbx
0x10071758a: pop rbx
0x10071758b: pop r14
0x10071758d: pop rbp
0x10071758e: ret 
0x10071758f: mov r14, rax
0x100717592: mov rdi, rbx
0x100717595: call 0x100aa248c ; 0x100aa248c __ZdlPv
0x10071759a: mov rdi, r14
0x10071759d: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1007175a2: nop word ptr cs:[rax + rax]
