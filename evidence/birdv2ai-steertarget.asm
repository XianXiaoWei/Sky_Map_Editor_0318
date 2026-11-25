0x1001a0d20: push rbp
0x1001a0d21: mov rbp, rsp
0x1001a0d24: push r15
0x1001a0d26: push r14
0x1001a0d28: push rbx
0x1001a0d29: sub rsp, 0x68
0x1001a0d2d: vmovss dword ptr [rbp - 0x1c], xmm0
0x1001a0d32: mov r14, rdx
0x1001a0d35: mov rbx, rdi
0x1001a0d38: lea r15, [rbx + 0x90]
0x1001a0d3f: mov rax, qword ptr [rbx + 8]
0x1001a0d43: vmovss xmm1, dword ptr [rax + 0x60]
0x1001a0d48: vmovss xmm0, dword ptr [rax + 0x78]
0x1001a0d4d: lea rsi, [rbx + 0x30]
0x1001a0d51: mov rdi, r15
0x1001a0d54: call 0x10062f710 ; 0x10062f710
0x1001a0d59: cmp byte ptr [rbx + 0x48], 0
0x1001a0d5d: vmovss xmm0, dword ptr [rip + 0x90435b] ; 0x100aa50c0
0x1001a0d65: je 0x1001a0d6b
0x1001a0d67: vxorps xmm0, xmm0, xmm0
0x1001a0d6b: mov rax, qword ptr [rbx + 8]
0x1001a0d6f: vmulss xmm0, xmm0, dword ptr [rax + 0x74]
0x1001a0d74: vmovss xmm3, dword ptr [rax + 0x50]
0x1001a0d79: vmovss xmm1, dword ptr [rax + 0x54]
0x1001a0d7e: vmovss xmm2, dword ptr [rax + 0x58]
0x1001a0d83: vmovss xmm4, dword ptr [rax + 0x5c]
0x1001a0d88: mov rdi, r15
0x1001a0d8b: call 0x10062e8f0 ; 0x10062e8f0
0x1001a0d90: vmovss xmm0, dword ptr [rbp - 0x1c]
0x1001a0d95: vmulss xmm0, xmm0, dword ptr [rip + 0x90381b] ; 0x100aa45b8
0x1001a0d9d: vxorps xmm1, xmm1, xmm1
0x1001a0da1: vmaxss xmm0, xmm1, xmm0
0x1001a0da5: vmovss xmm1, dword ptr [rip + 0x904313] ; 0x100aa50c0
0x1001a0dad: vminss xmm0, xmm1, xmm0
0x1001a0db1: mov rax, qword ptr [rbx + 8]
0x1001a0db5: mov rsi, qword ptr [rbx + 0x10]
0x1001a0db9: vmulss xmm0, xmm0, dword ptr [rax + 0x70]
0x1001a0dbe: vmovss xmm2, dword ptr [rax + 0x48]
0x1001a0dc3: vmovss xmm1, dword ptr [rax + 0x40]
0x1001a0dc8: vmovss xmm3, dword ptr [rax + 0x44]
0x1001a0dcd: vmovss xmm4, dword ptr [rax + 0x4c]
0x1001a0dd2: lea rdx, [rip + 0x5987] ; 0x1001a6760
0x1001a0dd9: mov rdi, r15
0x1001a0ddc: call 0x10062f800 ; 0x10062f800
0x1001a0de1: mov rax, qword ptr [rbx + 8]
0x1001a0de5: mov rcx, qword ptr [rax + 0x20]
0x1001a0de9: test rcx, rcx
0x1001a0dec: je 0x1001a0e5d
0x1001a0dee: vmovaps xmm0, xmmword ptr [rcx + 0x10]
0x1001a0df3: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1001a0df8: mov rcx, qword ptr [rip + 0xa6cd09] ; 0x100c0db08
0x1001a0dff: vmovups ymm0, ymmword ptr [rcx]
0x1001a0e03: vmovups ymm1, ymmword ptr [rcx + 0x10]
0x1001a0e08: vmovups ymmword ptr [rbp - 0x60], ymm1
0x1001a0e0d: vmovups ymmword ptr [rbp - 0x70], ymm0
0x1001a0e12: vxorps xmm0, xmm0, xmm0
0x1001a0e16: vmovlps qword ptr [rbp - 0x40], xmm0
0x1001a0e1b: mov dword ptr [rbp - 0x38], 0
0x1001a0e22: mov ecx, dword ptr [r14 + 0x50]
0x1001a0e26: mov dword ptr [rbp - 0x30], ecx
0x1001a0e29: mov qword ptr [rbp - 0x2c], 0x3f800000
0x1001a0e31: vmovss xmm0, dword ptr [rax + 0x6c]
0x1001a0e36: lea rsi, [rbp - 0x80]
0x1001a0e3a: vmovss xmm1, dword ptr [rip + 0x9069ae] ; 0x100aa77f0
0x1001a0e42: vmovss xmm2, dword ptr [rip + 0x905c5a] ; 0x100aa6aa4
0x1001a0e4a: vmovss xmm3, dword ptr [rip + 0x90426e] ; 0x100aa50c0
0x1001a0e52: mov rdi, r15
0x1001a0e55: vzeroupper 
0x1001a0e58: call 0x10062f540 ; 0x10062f540
0x1001a0e5d: add rsp, 0x68
0x1001a0e61: pop rbx
0x1001a0e62: pop r14
0x1001a0e64: pop r15
0x1001a0e66: pop rbp
0x1001a0e67: ret 
0x1001a0e68: nop dword ptr [rax + rax]
