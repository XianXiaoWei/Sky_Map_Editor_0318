0x100466710: push rbp
0x100466711: mov rbp, rsp
0x100466714: push r15
0x100466716: push r14
0x100466718: push r12
0x10046671a: push rbx
0x10046671b: sub rsp, 0x10
0x10046671f: vmovss dword ptr [rbp - 0x24], xmm0
0x100466724: mov r14d, edx
0x100466727: mov r12, rdi
0x10046672a: mov eax, dword ptr [r12 + 0x8c]
0x100466732: test eax, eax
0x100466734: je 0x100466785
0x100466736: mov r15d, esi
0x100466739: xor ebx, ebx
0x10046673b: nop dword ptr [rax + rax]
0x100466740: mov rcx, qword ptr [r12 + 8]
0x100466745: mov ebx, ebx
0x100466747: mov rcx, qword ptr [rcx + rbx*8]
0x10046674b: cmp byte ptr [rcx + 0x14], 0
0x10046674f: je 0x10046677f
0x100466751: mov rax, qword ptr [r12 + r15*8 + 0x28]
0x100466756: mov rdi, qword ptr [rax + rbx*8]
0x10046675a: cmp byte ptr [rdi + 0x538], 0
0x100466761: je 0x100466792
0x100466763: add rdi, 0x270
0x10046676a: mov esi, r14d
0x10046676d: vmovss xmm0, dword ptr [rbp - 0x24]
0x100466772: call 0x1007be0b0 ; 0x1007be0b0
0x100466777: mov eax, dword ptr [r12 + 0x8c]
0x10046677f: inc ebx
0x100466781: cmp ebx, eax
0x100466783: jb 0x100466740
0x100466785: add rsp, 0x10
0x100466789: pop rbx
0x10046678a: pop r12
0x10046678c: pop r14
0x10046678e: pop r15
0x100466790: pop rbp
0x100466791: ret 
0x100466792: lea rdi, [rip + 0x710551] ; 0x100b76cea IsInitialized()
0x100466799: lea rsi, [rip + 0x6fbadb] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1004667a0: mov edx, 0xa8
0x1004667a5: mov ecx, 3
0x1004667aa: call 0x1007e5f70 ; 0x1007e5f70
0x1004667af: ud2 
0x1004667b1: nop word ptr cs:[rax + rax]
