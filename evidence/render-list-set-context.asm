0x1007b9fc0: push rbp
0x1007b9fc1: mov rbp, rsp
0x1007b9fc4: push r15
0x1007b9fc6: push r14
0x1007b9fc8: push r12
0x1007b9fca: push rbx
0x1007b9fcb: mov r12, rdi
0x1007b9fce: vmovups ymm0, ymmword ptr [rsi]
0x1007b9fd2: vmovups ymmword ptr [r12 + 0xc0], ymm0
0x1007b9fdc: vmovups ymm0, ymmword ptr [rdx]
0x1007b9fe0: vmovups ymm1, ymmword ptr [rdx + 0x20]
0x1007b9fe5: vmovups ymm2, ymmword ptr [rdx + 0x40]
0x1007b9fea: vmovups ymm3, ymmword ptr [rdx + 0x60]
0x1007b9fef: vmovups ymmword ptr [r12 + 0xa0], ymm3
0x1007b9ff9: vmovups ymmword ptr [r12 + 0x80], ymm2
0x1007ba003: vmovups ymmword ptr [r12 + 0x60], ymm1
0x1007ba00a: vmovups ymmword ptr [r12 + 0x40], ymm0
0x1007ba011: mov byte ptr [r12 + 0xe0], cl
0x1007ba019: mov eax, dword ptr [r12 + 0x18]
0x1007ba01e: test eax, eax
0x1007ba020: je 0x1007ba068
0x1007ba022: lea r14, [r12 + 0xc0]
0x1007ba02a: lea r15, [r12 + 0x40]
0x1007ba02f: xor ebx, ebx
0x1007ba031: nop word ptr cs:[rax + rax]
0x1007ba040: mov rcx, qword ptr [r12]
0x1007ba044: mov edx, ebx
0x1007ba046: mov rdi, qword ptr [rcx + rdx*8]
0x1007ba04a: test rdi, rdi
0x1007ba04d: je 0x1007ba062
0x1007ba04f: mov rsi, r14
0x1007ba052: mov rdx, r15
0x1007ba055: vzeroupper 
0x1007ba058: call 0x1007f6280 ; 0x1007f6280
0x1007ba05d: mov eax, dword ptr [r12 + 0x18]
0x1007ba062: inc ebx
0x1007ba064: cmp ebx, eax
0x1007ba066: jb 0x1007ba040
0x1007ba068: mov byte ptr [r12 + 0x3c], 1
0x1007ba06e: pop rbx
0x1007ba06f: pop r12
0x1007ba071: pop r14
0x1007ba073: pop r15
0x1007ba075: pop rbp
0x1007ba076: vzeroupper 
0x1007ba079: ret 
0x1007ba07a: nop word ptr [rax + rax]

