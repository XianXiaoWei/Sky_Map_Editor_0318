0x100717b20: push rbp
0x100717b21: mov rbp, rsp
0x100717b24: push r15
0x100717b26: push r14
0x100717b28: push r13
0x100717b2a: push r12
0x100717b2c: push rbx
0x100717b2d: sub rsp, 0x18
0x100717b31: mov r12, rdi
0x100717b34: mov rax, qword ptr [r12 + 0x40]
0x100717b39: mov r13d, dword ptr [rax + 0x10]
0x100717b3d: test r13, r13
0x100717b40: je 0x100717c4e
0x100717b46: vcvtsi2ss xmm0, xmm0, r13
0x100717b4b: vmovss xmm1, dword ptr [rip + 0x38d56d] ; 0x100aa50c0
0x100717b53: vdivss xmm0, xmm1, xmm0
0x100717b57: vmovss dword ptr [rbp - 0x30], xmm0
0x100717b5c: mov rax, qword ptr [r12 + 0x38]
0x100717b61: vmovss xmm0, dword ptr [rax + 0x10]
0x100717b66: vmovss dword ptr [rbp - 0x2c], xmm0
0x100717b6b: xor ebx, ebx
0x100717b6d: lea r14, [rbp - 0x38]
0x100717b71: lea r15, [rbp - 0x40]
0x100717b75: nop word ptr cs:[rax + rax]
0x100717b80: mov rax, qword ptr [r12 + 0x40]
0x100717b85: mov ecx, dword ptr [rax + 0x10]
0x100717b88: cmp rbx, rcx
0x100717b8b: jae 0x100717c64
0x100717b91: mov rax, qword ptr [rax + 8]
0x100717b95: mov rax, qword ptr [rax + rbx*8]
0x100717b99: mov qword ptr [rbp - 0x40], rax
0x100717b9d: call 0x1007abc10 ; 0x1007abc10
0x100717ba2: mov qword ptr [rbp - 0x38], 0
0x100717baa: mov rdi, qword ptr [rip + 0x1922e7f] ; 0x10203aa30
0x100717bb1: mov r8, qword ptr [rdi]
0x100717bb4: mov rsi, r14
0x100717bb7: mov rdx, r15
0x100717bba: mov rcx, rax
0x100717bbd: call qword ptr [r8 + 0x40]
0x100717bc1: mov rax, qword ptr [rbp - 0x38]
0x100717bc5: test rax, rax
0x100717bc8: je 0x100717c83
0x100717bce: mov ecx, ebx
0x100717bd0: vcvtsi2ss xmm0, xmm3, rcx
0x100717bd5: vmovss xmm2, dword ptr [rbp - 0x30]
0x100717bda: vmulss xmm0, xmm2, xmm0
0x100717bde: inc rbx
0x100717be1: mov ecx, ebx
0x100717be3: vcvtsi2ss xmm1, xmm3, rcx
0x100717be8: vmulss xmm1, xmm2, xmm1
0x100717bec: vsubss xmm1, xmm1, xmm0
0x100717bf0: vucomiss xmm1, dword ptr [rip + 0x38fccc] ; 0x100aa78c4
0x100717bf8: ja 0x100717c10
0x100717bfa: vmovss xmm2, dword ptr [rip + 0x3919ce] ; 0x100aa95d0
0x100717c02: vucomiss xmm2, xmm1
0x100717c06: vmovss xmm2, dword ptr [rip + 0x38d4b2] ; 0x100aa50c0
0x100717c0e: jbe 0x100717c1d
0x100717c10: vmovss xmm2, dword ptr [rbp - 0x2c]
0x100717c15: vsubss xmm0, xmm2, xmm0
0x100717c19: vdivss xmm2, xmm0, xmm1
0x100717c1d: vxorps xmm0, xmm0, xmm0
0x100717c21: vmaxss xmm0, xmm0, xmm2
0x100717c25: vmovss xmm1, dword ptr [rip + 0x38d493] ; 0x100aa50c0
0x100717c2d: vminss xmm0, xmm1, xmm0
0x100717c31: vmovss dword ptr [rax + 0x10], xmm0
0x100717c36: cmp rbx, r13
0x100717c39: jb 0x100717b80
0x100717c3f: add rsp, 0x18
0x100717c43: pop rbx
0x100717c44: pop r12
0x100717c46: pop r13
0x100717c48: pop r14
0x100717c4a: pop r15
0x100717c4c: pop rbp
0x100717c4d: ret 
0x100717c4e: mov rdi, r12
0x100717c51: add rsp, 0x18
0x100717c55: pop rbx
0x100717c56: pop r12
0x100717c58: pop r13
0x100717c5a: pop r14
0x100717c5c: pop r15
0x100717c5e: pop rbp
0x100717c5f: jmp 0x10032ef60 ; 0x10032ef60
0x100717c64: lea rdi, [rip + 0x449ced] ; 0x100b61958 idx < size
0x100717c6b: lea rsi, [rip + 0x449cf1] ; 0x100b61963 ./Clump.h
0x100717c72: mov edx, 0x36
0x100717c77: mov ecx, 3
0x100717c7c: call 0x1007e5f70 ; 0x1007e5f70
0x100717c81: ud2 
0x100717c83: lea rdi, [rip + 0x449e6e] ; 0x100b61af8 ret
0x100717c8a: lea rsi, [rip + 0x449cd2] ; 0x100b61963 ./Clump.h
0x100717c91: mov edx, 0x47
0x100717c96: mov ecx, 3
0x100717c9b: call 0x1007e5f70 ; 0x1007e5f70
0x100717ca0: ud2 
0x100717ca2: nop word ptr cs:[rax + rax]
