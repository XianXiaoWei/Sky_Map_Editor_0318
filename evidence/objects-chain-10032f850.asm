0x10032f850: push rbp
0x10032f851: mov rbp, rsp
0x10032f854: push r15
0x10032f856: push r14
0x10032f858: push r13
0x10032f85a: push r12
0x10032f85c: push rbx
0x10032f85d: sub rsp, 0x18
0x10032f861: mov r13, rcx
0x10032f864: mov r14, rdx
0x10032f867: mov rbx, rdi
0x10032f86a: mov qword ptr [rbp - 0x30], rsi
0x10032f86e: add r14, rsi
0x10032f871: lea rdx, [rip + 0x8519dc] ; 0x100b81254
0x10032f878: xor r15d, r15d
0x10032f87b: lea r12, [rbp - 0x30]
0x10032f87f: xor eax, eax
0x10032f881: mov rdi, r12
0x10032f884: mov rsi, r14
0x10032f887: call 0x10008d830 ; 0x10008d830
0x10032f88c: lea rdx, [rip + 0x851a08] ; 0x100b8129b
0x10032f893: xor eax, eax
0x10032f895: mov rdi, r12
0x10032f898: mov rsi, r14
0x10032f89b: mov rcx, r13
0x10032f89e: call 0x10008d830 ; 0x10008d830
0x10032f8a3: vxorpd xmm0, xmm0, xmm0
0x10032f8a7: mov r13d, 0x30
0x10032f8ad: nop dword ptr [rax]
0x10032f8b0: mov r12, qword ptr [rbx + r13]
0x10032f8b4: test r12, r12
0x10032f8b7: je 0x10032f930
0x10032f8b9: cmp byte ptr [r12 + 0x24], 0
0x10032f8bf: je 0x10032f930
0x10032f8c1: cmp byte ptr [r12 + 0x20], 0
0x10032f8c7: je 0x10032f930
0x10032f8c9: cmp byte ptr [r12 + 0x23], 0
0x10032f8cf: je 0x10032f930
0x10032f8d1: vmovsd qword ptr [rbp - 0x40], xmm0
0x10032f8d6: vmovsd xmm0, qword ptr [r12 + 0x30]
0x10032f8dd: vmovsd qword ptr [rbp - 0x38], xmm0
0x10032f8e2: mov edi, dword ptr [r12 + 8]
0x10032f8e7: call 0x1007abd30 ; 0x1007abd30
0x10032f8ec: mov rcx, qword ptr [rax]
0x10032f8ef: mov rdi, rax
0x10032f8f2: call qword ptr [rcx + 0x68]
0x10032f8f5: test rax, rax
0x10032f8f8: jne 0x10032f8ff
0x10032f8fa: call 0x1007abc60 ; 0x1007abc60
0x10032f8ff: mov r8, qword ptr [rax + 8]
0x10032f903: mov al, 1
0x10032f905: lea rdi, [rbp - 0x30]
0x10032f909: mov rsi, r14
0x10032f90c: lea rdx, [rip + 0x8519b4] ; 0x100b812c7
0x10032f913: mov ecx, r15d
0x10032f916: vmovsd xmm0, qword ptr [rbp - 0x38]
0x10032f91b: call 0x10008d830 ; 0x10008d830
0x10032f920: inc r15d
0x10032f923: vmovsd xmm0, qword ptr [rbp - 0x40]
0x10032f928: vaddsd xmm0, xmm0, qword ptr [r12 + 0x30]
0x10032f92f: nop 
0x10032f930: add r13, 0x10
0x10032f934: cmp r13, 0x5030
0x10032f93b: jne 0x10032f8b0
0x10032f941: lea rdx, [rip + 0x851992] ; 0x100b812da
0x10032f948: lea r12, [rbp - 0x30]
0x10032f94c: mov al, 1
0x10032f94e: mov rdi, r12
0x10032f951: mov rsi, r14
0x10032f954: mov ecx, r15d
0x10032f957: call 0x10008d830 ; 0x10008d830
0x10032f95c: lea rdx, [rip + 0x8519a3] ; 0x100b81306
0x10032f963: xor eax, eax
0x10032f965: mov rdi, r12
0x10032f968: mov rsi, r14
0x10032f96b: call 0x10008d830 ; 0x10008d830
0x10032f970: mov r13d, 0x30
0x10032f976: nop word ptr cs:[rax + rax]
0x10032f980: mov rax, qword ptr [rbx + r13]
0x10032f984: test rax, rax
0x10032f987: je 0x10032f995
0x10032f989: cmp byte ptr [rax + 0x20], 0
0x10032f98d: je 0x10032f995
0x10032f98f: cmp byte ptr [rax + 0x23], 0
0x10032f993: je 0x10032f9a4
0x10032f995: add r13, 0x10
0x10032f999: cmp r13, 0x5030
0x10032f9a0: jne 0x10032f980
0x10032f9a2: jmp 0x10032f9ea ; 0x10032f9ea
0x10032f9a4: mov edi, dword ptr [rax + 8]
0x10032f9a7: call 0x1007abd30 ; 0x1007abd30
0x10032f9ac: mov rcx, qword ptr [rax]
0x10032f9af: mov rdi, rax
0x10032f9b2: call qword ptr [rcx + 0x68]
0x10032f9b5: test rax, rax
0x10032f9b8: jne 0x10032f9bf
0x10032f9ba: call 0x1007abc60 ; 0x1007abc60
0x10032f9bf: mov r8, qword ptr [rax + 8]
0x10032f9c3: xor eax, eax
0x10032f9c5: mov rdi, r12
0x10032f9c8: mov rsi, r14
0x10032f9cb: lea rdx, [rip + 0x85195a] ; 0x100b8132c
0x10032f9d2: mov ecx, r15d
0x10032f9d5: call 0x10008d830 ; 0x10008d830
0x10032f9da: inc r15d
0x10032f9dd: add r13, 0x10
0x10032f9e1: cmp r13, 0x5030
0x10032f9e8: jne 0x10032f980
0x10032f9ea: add rsp, 0x18
0x10032f9ee: pop rbx
0x10032f9ef: pop r12
0x10032f9f1: pop r13
0x10032f9f3: pop r14
0x10032f9f5: pop r15
0x10032f9f7: pop rbp
0x10032f9f8: ret 
0x10032f9f9: nop dword ptr [rax]
