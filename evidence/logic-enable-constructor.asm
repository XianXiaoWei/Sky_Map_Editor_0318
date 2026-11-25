0x100316bc0: push rbp
0x100316bc1: mov rbp, rsp
0x100316bc4: push r14
0x100316bc6: push rbx
0x100316bc7: mov edi, 0x48
0x100316bcc: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x100316bd1: mov rbx, rax
0x100316bd4: mov rdi, rbx
0x100316bd7: call 0x10032eea0 ; 0x10032eea0
0x100316bdc: mov rax, qword ptr [rip + 0x1ad977d] ; 0x101df0360
0x100316be3: mov eax, dword ptr [rax + 0x38]
0x100316be6: mov dword ptr [rbx + 8], eax
0x100316be9: lea rax, [rip + 0x8fe170] ; 0x100c14d60  f1
0x100316bf0: mov qword ptr [rbx], rax
0x100316bf3: mov qword ptr [rbx + 0x38], 0
0x100316bfb: mov byte ptr [rbx + 0x42], 0
0x100316bff: mov rax, rbx
0x100316c02: pop rbx
0x100316c03: pop r14
0x100316c05: pop rbp
0x100316c06: ret 
0x100316c07: mov r14, rax
0x100316c0a: mov rdi, rbx
0x100316c0d: call 0x100aa248c ; 0x100aa248c __ZdlPv
0x100316c12: mov rdi, r14
0x100316c15: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100316c1a: nop word ptr [rax + rax]
