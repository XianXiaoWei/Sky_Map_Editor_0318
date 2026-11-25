0x1002c6260: push rbp
0x1002c6261: mov rbp, rsp
0x1002c6264: push r14
0x1002c6266: push rbx
0x1002c6267: mov edi, 0x50
0x1002c626c: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1002c6271: mov rbx, rax
0x1002c6274: mov rdi, rbx
0x1002c6277: call 0x10032eea0 ; 0x10032eea0
0x1002c627c: mov rax, qword ptr [rip + 0x1b27775] ; 0x101ded9f8
0x1002c6283: mov eax, dword ptr [rax + 0x38]
0x1002c6286: mov dword ptr [rbx + 8], eax
0x1002c6289: mov rax, qword ptr [rip + 0x9471d0] ; 0x100c0d460
0x1002c6290: add rax, 0x10
0x1002c6294: mov qword ptr [rbx], rax
0x1002c6297: mov dword ptr [rbx + 0x38], 0
0x1002c629e: mov qword ptr [rbx + 0x40], 0
0x1002c62a6: mov rax, rbx
0x1002c62a9: pop rbx
0x1002c62aa: pop r14
0x1002c62ac: pop rbp
0x1002c62ad: ret 
0x1002c62ae: mov r14, rax
0x1002c62b1: mov rdi, rbx
0x1002c62b4: call 0x100aa248c ; 0x100aa248c __ZdlPv
0x1002c62b9: mov rdi, r14
0x1002c62bc: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1002c62c1: nop word ptr cs:[rax + rax]
