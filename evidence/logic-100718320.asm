0x100718320: push rbp
0x100718321: mov rbp, rsp
0x100718324: push r15
0x100718326: push r14
0x100718328: push rbx
0x100718329: push rax
0x10071832a: mov r14, rdi
0x10071832d: mov rax, qword ptr [r14 + 0x38]
0x100718331: cmp dword ptr [rax + 0x10], 0
0x100718335: je 0x1007183cf
0x10071833b: mov bx, 1
0x10071833f: xor r15d, r15d
0x100718342: nop word ptr cs:[rax + rax]
0x100718350: lea ecx, [rbx - 1]
0x100718353: mov rax, qword ptr [rax + 8]
0x100718357: movzx ecx, cx
0x10071835a: mov rdi, qword ptr [rax + rcx*8]
0x10071835e: call 0x1004d2050 ; 0x1004d2050
0x100718363: test r15b, 1
0x100718367: mov r15b, 1
0x10071836a: jne 0x100718379
0x10071836c: cmp byte ptr [r14 + 0x40], 0
0x100718371: setne cl
0x100718374: xor al, cl
0x100718376: mov r15b, al
0x100718379: movzx ecx, bx
0x10071837c: mov rax, qword ptr [r14 + 0x38]
0x100718380: lea ebx, [rbx + 1]
0x100718383: cmp dword ptr [rax + 0x10], ecx
0x100718386: ja 0x100718350
0x100718388: test r15b, r15b
0x10071838b: je 0x1007183cf
0x10071838d: mov rax, qword ptr [r14 + 0x48]
0x100718391: cmp dword ptr [rax + 0x10], 0
0x100718395: je 0x1007183c7
0x100718397: mov bx, 1
0x10071839b: nop dword ptr [rax + rax]
0x1007183a0: lea ecx, [rbx - 1]
0x1007183a3: mov rax, qword ptr [rax + 8]
0x1007183a7: movzx ecx, cx
0x1007183aa: mov rdi, qword ptr [rax + rcx*8]
0x1007183ae: mov esi, 1
0x1007183b3: call 0x1004d1f60 ; 0x1004d1f60
0x1007183b8: movzx ecx, bx
0x1007183bb: mov rax, qword ptr [r14 + 0x48]
0x1007183bf: lea ebx, [rbx + 1]
0x1007183c2: cmp dword ptr [rax + 0x10], ecx
0x1007183c5: ja 0x1007183a0
0x1007183c7: mov rdi, r14
0x1007183ca: call 0x10032ef60 ; 0x10032ef60
0x1007183cf: cmp byte ptr [r14 + 0x50], 0
0x1007183d4: je 0x1007183e8
0x1007183d6: mov rdi, r14
0x1007183d9: add rsp, 8
0x1007183dd: pop rbx
0x1007183de: pop r14
0x1007183e0: pop r15
0x1007183e2: pop rbp
0x1007183e3: jmp 0x10032ef60 ; 0x10032ef60
0x1007183e8: add rsp, 8
0x1007183ec: pop rbx
0x1007183ed: pop r14
0x1007183ef: pop r15
0x1007183f1: pop rbp
0x1007183f2: ret 
0x1007183f3: nop word ptr cs:[rax + rax]
