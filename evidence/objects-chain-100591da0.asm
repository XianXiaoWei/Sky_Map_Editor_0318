0x100591da0: push rbp
0x100591da1: mov rbp, rsp
0x100591da4: push r15
0x100591da6: push r14
0x100591da8: push r13
0x100591daa: push r12
0x100591dac: push rbx
0x100591dad: sub rsp, 0x18
0x100591db1: mov r12, rdi
0x100591db4: mov rax, qword ptr [rsi + 0x160]
0x100591dbb: lea rcx, [rip + 0x1a6930e] ; 0x101ffb0d0
0x100591dc2: cmp byte ptr [rcx], 0
0x100591dc5: je 0x100591dd4
0x100591dc7: lea rcx, [rip + 0x726772] ; 0x100cb8540
0x100591dce: vmovss xmm0, dword ptr [rcx]
0x100591dd2: jmp 0x100591ddc ; 0x100591ddc
0x100591dd4: vmovss xmm0, dword ptr [rip + 0x5132e4] ; 0x100aa50c0
0x100591ddc: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x100591de1: vmulss xmm0, xmm0, dword ptr [rax + 0x14]
0x100591de6: vmovss xmm1, dword ptr [rip + 0x514cae] ; 0x100aa6a9c
0x100591dee: vmaxss xmm0, xmm1, xmm0
0x100591df2: vmovss xmm1, dword ptr [rip + 0x514ca6] ; 0x100aa6aa0
0x100591dfa: vminss xmm0, xmm1, xmm0
0x100591dfe: vaddss xmm0, xmm0, dword ptr [r12 + 0x58]
0x100591e05: vmovss dword ptr [r12 + 0x58], xmm0
0x100591e0c: vmovss xmm1, dword ptr [r12 + 0x4c]
0x100591e13: vucomiss xmm1, xmm0
0x100591e17: jbe 0x100591e1f
0x100591e19: vdivss xmm2, xmm0, xmm1
0x100591e1d: jmp 0x100591e51 ; 0x100591e51
0x100591e1f: vmovss xmm2, dword ptr [r12 + 0x50]
0x100591e26: vaddss xmm3, xmm1, xmm2
0x100591e2a: vucomiss xmm0, xmm3
0x100591e2e: jbe 0x100591e49
0x100591e30: vsubss xmm3, xmm1, xmm0
0x100591e34: vaddss xmm2, xmm2, xmm3
0x100591e38: vdivss xmm2, xmm2, dword ptr [r12 + 0x54]
0x100591e3f: vaddss xmm2, xmm2, dword ptr [rip + 0x513279] ; 0x100aa50c0
0x100591e47: jmp 0x100591e51 ; 0x100591e51
0x100591e49: vmovss xmm2, dword ptr [rip + 0x51326f] ; 0x100aa50c0
0x100591e51: vmovss dword ptr [rbp - 0x2c], xmm2
0x100591e56: mov rax, qword ptr [r12 + 0x38]
0x100591e5b: cmp dword ptr [rax + 0x10], 0
0x100591e5f: je 0x100591f2e
0x100591e65: vmovss xmm0, dword ptr [rip + 0x513253] ; 0x100aa50c0
0x100591e6d: vsubss xmm0, xmm0, dword ptr [rbp - 0x2c]
0x100591e72: vxorps xmm1, xmm1, xmm1
0x100591e76: vmulss xmm0, xmm0, xmm1
0x100591e7a: vmovss dword ptr [rbp - 0x30], xmm0
0x100591e7f: xor ebx, ebx
0x100591e81: lea r14, [rbp - 0x38]
0x100591e85: lea r15, [rbp - 0x40]
0x100591e89: nop dword ptr [rax]
0x100591e90: mov rax, qword ptr [rax + 8]
0x100591e94: mov ecx, ebx
0x100591e96: mov rax, qword ptr [rax + rcx*8]
0x100591e9a: mov qword ptr [rbp - 0x40], rax
0x100591e9e: call 0x1007abc10 ; 0x1007abc10
0x100591ea3: mov r13, rax
0x100591ea6: mov qword ptr [rbp - 0x38], 0
0x100591eae: call 0x1001ddf40 ; 0x1001ddf40
0x100591eb3: mov r8, qword ptr [rax]
0x100591eb6: mov rdi, rax
0x100591eb9: mov rsi, r14
0x100591ebc: mov rdx, r15
0x100591ebf: mov rcx, r13
0x100591ec2: call qword ptr [r8 + 0x40]
0x100591ec6: mov rax, qword ptr [rbp - 0x38]
0x100591eca: test rax, rax
0x100591ecd: je 0x100591f59
0x100591ed3: vmovss xmm1, dword ptr [rbp - 0x2c]
0x100591ed8: vmulss xmm0, xmm1, dword ptr [r12 + 0x40]
0x100591edf: vmovss xmm2, dword ptr [rbp - 0x30]
0x100591ee4: vaddss xmm0, xmm2, xmm0
0x100591ee8: vmovss dword ptr [rax + 0x78], xmm0
0x100591eed: vmulss xmm0, xmm1, dword ptr [r12 + 0x44]
0x100591ef4: vaddss xmm0, xmm2, xmm0
0x100591ef8: vmovss dword ptr [rax + 0x7c], xmm0
0x100591efd: vmulss xmm0, xmm1, dword ptr [r12 + 0x48]
0x100591f04: vaddss xmm0, xmm2, xmm0
0x100591f08: vmovss dword ptr [rax + 0x80], xmm0
0x100591f10: inc ebx
0x100591f12: mov rax, qword ptr [r12 + 0x38]
0x100591f17: cmp ebx, dword ptr [rax + 0x10]
0x100591f1a: jb 0x100591e90
0x100591f20: vmovss xmm1, dword ptr [r12 + 0x4c]
0x100591f27: vmovss xmm0, dword ptr [r12 + 0x58]
0x100591f2e: vaddss xmm1, xmm1, dword ptr [r12 + 0x50]
0x100591f35: vaddss xmm1, xmm1, dword ptr [r12 + 0x54]
0x100591f3c: vucomiss xmm0, xmm1
0x100591f40: jb 0x100591f4a
0x100591f42: mov rdi, r12
0x100591f45: call 0x10032ef60 ; 0x10032ef60
0x100591f4a: add rsp, 0x18
0x100591f4e: pop rbx
0x100591f4f: pop r12
0x100591f51: pop r13
0x100591f53: pop r14
0x100591f55: pop r15
0x100591f57: pop rbp
0x100591f58: ret 
0x100591f59: lea rdi, [rip + 0x5cfb98] ; 0x100b61af8 ret
0x100591f60: lea rsi, [rip + 0x5cf9fc] ; 0x100b61963 ./Clump.h
0x100591f67: mov edx, 0x47
0x100591f6c: mov ecx, 3
0x100591f71: call 0x1007e5f70 ; 0x1007e5f70
0x100591f76: ud2 
0x100591f78: nop dword ptr [rax + rax]
