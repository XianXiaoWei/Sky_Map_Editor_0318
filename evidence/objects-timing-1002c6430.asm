0x1002c6430: push rbp
0x1002c6431: mov rbp, rsp
0x1002c6434: push r15
0x1002c6436: push r14
0x1002c6438: push r13
0x1002c643a: push r12
0x1002c643c: push rbx
0x1002c643d: sub rsp, 0x18
0x1002c6441: mov r12, rdi
0x1002c6444: vxorps xmm0, xmm0, xmm0
0x1002c6448: cmp byte ptr [r12 + 0x3e], 0
0x1002c644e: jne 0x1002c649a
0x1002c6450: mov rax, qword ptr [rsi + 0x160]
0x1002c6457: lea rcx, [rip + 0x1d34c72] ; 0x101ffb0d0
0x1002c645e: cmp byte ptr [rcx], 0
0x1002c6461: je 0x1002c6470
0x1002c6463: lea rcx, [rip + 0x9f20d6] ; 0x100cb8540
0x1002c646a: vmovss xmm0, dword ptr [rcx]
0x1002c646e: jmp 0x1002c6478 ; 0x1002c6478
0x1002c6470: vmovss xmm0, dword ptr [rip + 0x7dec48] ; 0x100aa50c0
0x1002c6478: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x1002c647d: vmulss xmm0, xmm0, dword ptr [rax + 0x14]
0x1002c6482: vmovss xmm1, dword ptr [rip + 0x7e0612] ; 0x100aa6a9c
0x1002c648a: vmaxss xmm0, xmm1, xmm0
0x1002c648e: vmovss xmm1, dword ptr [rip + 0x7e060a] ; 0x100aa6aa0
0x1002c6496: vminss xmm0, xmm1, xmm0
0x1002c649a: vaddss xmm0, xmm0, dword ptr [r12 + 0x48]
0x1002c64a1: vmovss dword ptr [r12 + 0x48], xmm0
0x1002c64a8: vucomiss xmm0, dword ptr [r12 + 0x38]
0x1002c64af: jb 0x1002c6578
0x1002c64b5: cmp byte ptr [r12 + 0x3d], 0
0x1002c64bb: je 0x1002c64d9
0x1002c64bd: mov rax, qword ptr [rsi + 0x5c8]
0x1002c64c4: mov rdi, qword ptr [rax + 0x10]
0x1002c64c8: mov rax, qword ptr [rdi]
0x1002c64cb: call qword ptr [rax + 0x138]
0x1002c64d1: test al, al
0x1002c64d3: je 0x1002c6578
0x1002c64d9: cmp byte ptr [r12 + 0x3c], 0
0x1002c64df: je 0x1002c64f2
0x1002c64e1: mov rax, qword ptr [r12 + 0x40]
0x1002c64e6: mov ecx, dword ptr [rax + 0x10]
0x1002c64e9: dec ecx
0x1002c64eb: cmp dword ptr [r12 + 0x4c], ecx
0x1002c64f0: jne 0x1002c6510
0x1002c64f2: lea r13, [r12 + 0x40]
0x1002c64f7: mov rdi, r12
0x1002c64fa: call 0x10032ef60 ; 0x10032ef60
0x1002c64ff: mov rax, qword ptr [r12 + 0x40]
0x1002c6504: cmp byte ptr [r12 + 0x3c], 0
0x1002c650a: je 0x1002c65a9
0x1002c6510: mov ecx, dword ptr [r12 + 0x4c]
0x1002c6515: cmp dword ptr [rax + 0x10], ecx
0x1002c6518: jbe 0x1002c663c
0x1002c651e: mov rax, qword ptr [rax + 8]
0x1002c6522: mov rax, qword ptr [rax + rcx*8]
0x1002c6526: mov qword ptr [rbp - 0x38], rax
0x1002c652a: call 0x1007abc10 ; 0x1007abc10
0x1002c652f: mov r14, rax
0x1002c6532: mov qword ptr [rbp - 0x30], 0
0x1002c653a: call 0x1007abc10 ; 0x1007abc10
0x1002c653f: mov rbx, qword ptr [rax]
0x1002c6542: lea rsi, [rbp - 0x30]
0x1002c6546: lea rdx, [rbp - 0x38]
0x1002c654a: mov rdi, rax
0x1002c654d: mov rcx, r14
0x1002c6550: call qword ptr [rbx + 0x40]
0x1002c6553: mov rdi, qword ptr [rbp - 0x30]
0x1002c6557: test rdi, rdi
0x1002c655a: je 0x1002c661d
0x1002c6560: mov esi, 1
0x1002c6565: call 0x1004d1f60 ; 0x1004d1f60
0x1002c656a: inc dword ptr [r12 + 0x4c]
0x1002c656f: mov dword ptr [r12 + 0x48], 0
0x1002c6578: cmp byte ptr [r12 + 0x3e], 0
0x1002c657e: vxorps xmm0, xmm0, xmm0
0x1002c6582: je 0x1002c658c
0x1002c6584: vmovss xmm0, dword ptr [rip + 0x7deb34] ; 0x100aa50c0
0x1002c658c: vaddss xmm0, xmm0, dword ptr [r12 + 0x48]
0x1002c6593: vmovss dword ptr [r12 + 0x48], xmm0
0x1002c659a: add rsp, 0x18
0x1002c659e: pop rbx
0x1002c659f: pop r12
0x1002c65a1: pop r13
0x1002c65a3: pop r14
0x1002c65a5: pop r15
0x1002c65a7: pop rbp
0x1002c65a8: ret 
0x1002c65a9: cmp dword ptr [rax + 0x10], 0
0x1002c65ad: je 0x1002c6578
0x1002c65af: xor r14d, r14d
0x1002c65b2: nop word ptr cs:[rax + rax]
0x1002c65c0: mov rax, qword ptr [rax + 8]
0x1002c65c4: mov ecx, r14d
0x1002c65c7: mov rax, qword ptr [rax + rcx*8]
0x1002c65cb: mov qword ptr [rbp - 0x38], rax
0x1002c65cf: call 0x1007abc10 ; 0x1007abc10
0x1002c65d4: mov r15, rax
0x1002c65d7: mov qword ptr [rbp - 0x30], 0
0x1002c65df: call 0x1007abc10 ; 0x1007abc10
0x1002c65e4: mov rbx, qword ptr [rax]
0x1002c65e7: mov rdi, rax
0x1002c65ea: lea rsi, [rbp - 0x30]
0x1002c65ee: lea rdx, [rbp - 0x38]
0x1002c65f2: mov rcx, r15
0x1002c65f5: call qword ptr [rbx + 0x40]
0x1002c65f8: mov rdi, qword ptr [rbp - 0x30]
0x1002c65fc: test rdi, rdi
0x1002c65ff: je 0x1002c661d
0x1002c6601: mov esi, 1
0x1002c6606: call 0x1004d1f60 ; 0x1004d1f60
0x1002c660b: inc r14d
0x1002c660e: mov rax, qword ptr [r13]
0x1002c6612: cmp r14d, dword ptr [rax + 0x10]
0x1002c6616: jb 0x1002c65c0
0x1002c6618: jmp 0x1002c6578 ; 0x1002c6578
0x1002c661d: lea rdi, [rip + 0x89b4d4] ; 0x100b61af8 ret
0x1002c6624: lea rsi, [rip + 0x89b338] ; 0x100b61963 ./Clump.h
0x1002c662b: mov edx, 0x47
0x1002c6630: mov ecx, 3
0x1002c6635: call 0x1007e5f70 ; 0x1007e5f70
0x1002c663a: ud2 
0x1002c663c: lea rdi, [rip + 0x89b315] ; 0x100b61958 idx < size
0x1002c6643: lea rsi, [rip + 0x89b319] ; 0x100b61963 ./Clump.h
0x1002c664a: mov edx, 0x36
0x1002c664f: mov ecx, 3
0x1002c6654: call 0x1007e5f70 ; 0x1007e5f70
0x1002c6659: ud2 
0x1002c665b: nop dword ptr [rax + rax]
