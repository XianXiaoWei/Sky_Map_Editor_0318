0x100794f80: push rbp
0x100794f81: mov rbp, rsp
0x100794f84: push r14
0x100794f86: push rbx
0x100794f87: mov r14, rdi
0x100794f8a: cmp qword ptr [r14], 0
0x100794f8e: je 0x100794faa
0x100794f90: call 0x1007c1470 ; 0x1007c1470
0x100794f95: mov rcx, qword ptr [rax]
0x100794f98: mov edx, dword ptr [r14 + 0x10]
0x100794f9c: mov esi, dword ptr [r14 + rdx*4 + 0x1c]
0x100794fa1: mov rdi, rax
0x100794fa4: call qword ptr [rcx + 0x160]
0x100794faa: cmp dword ptr [r14 + 0x18], 0
0x100794faf: je 0x100794fe0
0x100794fb1: xor ebx, ebx
0x100794fb3: nop word ptr cs:[rax + rax]
0x100794fc0: call 0x1007c1470 ; 0x1007c1470
0x100794fc5: mov rcx, qword ptr [rax]
0x100794fc8: mov edx, ebx
0x100794fca: mov esi, dword ptr [r14 + rdx*4 + 0x1c]
0x100794fcf: mov rdi, rax
0x100794fd2: call qword ptr [rcx + 0x150]
0x100794fd8: inc ebx
0x100794fda: cmp ebx, dword ptr [r14 + 0x18]
0x100794fde: jb 0x100794fc0
0x100794fe0: vxorps ymm0, ymm0, ymm0
0x100794fe4: vmovups ymmword ptr [r14], ymm0
0x100794fe9: mov qword ptr [r14 + 0x20], 0
0x100794ff1: pop rbx
0x100794ff2: pop r14
0x100794ff4: pop rbp
0x100794ff5: vzeroupper 
0x100794ff8: ret 
0x100794ff9: nop dword ptr [rax]

