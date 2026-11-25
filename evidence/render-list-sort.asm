0x1007b9cd0: push rbp
0x1007b9cd1: mov rbp, rsp
0x1007b9cd4: push r15
0x1007b9cd6: push r14
0x1007b9cd8: push r13
0x1007b9cda: push r12
0x1007b9cdc: push rbx
0x1007b9cdd: sub rsp, 0x98
0x1007b9ce4: mov r15, rsi
0x1007b9ce7: mov r12, rdi
0x1007b9cea: mov rax, qword ptr [rip + 0x453be7] ; 0x100c0d8d8
0x1007b9cf1: mov rax, qword ptr [rax]
0x1007b9cf4: mov qword ptr [rbp - 0x30], rax
0x1007b9cf8: mov eax, dword ptr [r12 + 8]
0x1007b9cfd: mov r14, rsp
0x1007b9d00: mov rcx, rax
0x1007b9d03: shl rcx, 4
0x1007b9d07: sub r14, rcx
0x1007b9d0a: mov rsp, r14
0x1007b9d0d: mov ecx, dword ptr [r12 + 0x1c]
0x1007b9d12: lea edx, [rcx - 1]
0x1007b9d15: cmp edx, 2
0x1007b9d18: jb 0x1007b9d76
0x1007b9d1a: test ecx, ecx
0x1007b9d1c: je 0x1007b9f67
0x1007b9d22: cmp ecx, 3
0x1007b9d25: jne 0x1007b9ed0
0x1007b9d2b: xor ebx, ebx
0x1007b9d2d: test eax, eax
0x1007b9d2f: je 0x1007b9ea5
0x1007b9d35: mov rax, qword ptr [r12 + 0x10]
0x1007b9d3a: nop word ptr [rax + rax]
0x1007b9d40: mov r15d, ebx
0x1007b9d43: mov rdi, qword ptr [rax + r15*8]
0x1007b9d47: call 0x1007f6a50 ; 0x1007f6a50
0x1007b9d4c: mov rcx, r15
0x1007b9d4f: shl rcx, 4
0x1007b9d53: mov dword ptr [r14 + rcx + 4], eax
0x1007b9d58: mov rax, qword ptr [r12 + 0x10]
0x1007b9d5d: mov rdx, qword ptr [rax + r15*8]
0x1007b9d61: mov qword ptr [r14 + rcx + 8], rdx
0x1007b9d66: inc ebx
0x1007b9d68: mov esi, dword ptr [r12 + 8]
0x1007b9d6d: cmp ebx, esi
0x1007b9d6f: jb 0x1007b9d40
0x1007b9d71: jmp 0x1007b9ea7 ; 0x1007b9ea7
0x1007b9d76: xor edx, edx
0x1007b9d78: cmp byte ptr [rip + 0x55959a], 0 ; 0x100d13319
0x1007b9d7f: sete bl
0x1007b9d82: xor ecx, ecx
0x1007b9d84: test eax, eax
0x1007b9d86: je 0x1007b9e93
0x1007b9d8c: mov dl, bl
0x1007b9d8e: lea rax, [rip + 0x2eed3b] ; 0x100aa8ad0
0x1007b9d95: vmovss xmm0, dword ptr [rax + rdx*4]
0x1007b9d9a: vmovss dword ptr [rbp - 0x34], xmm0
0x1007b9d9f: mov rax, qword ptr [r12 + 0x10]
0x1007b9da4: lea rbx, [rbp - 0x80]
0x1007b9da8: mov qword ptr [rbp - 0x60], r14
0x1007b9dac: mov qword ptr [rbp - 0x58], r12
0x1007b9db0: mov r13d, ecx
0x1007b9db3: mov rdx, qword ptr [rax + r13*8]
0x1007b9db7: lea rsi, [rdx + 0x10]
0x1007b9dbb: add rdx, 0x50
0x1007b9dbf: lea r12, [rbp - 0xc0]
0x1007b9dc6: mov rdi, r12
0x1007b9dc9: call 0x100076df0 ; 0x100076df0
0x1007b9dce: lea rdi, [rbp - 0x70]
0x1007b9dd2: mov r14, r15
0x1007b9dd5: mov rsi, r15
0x1007b9dd8: call 0x10076be90 ; 0x10076be90
0x1007b9ddd: vxorps xmm0, xmm0, xmm0
0x1007b9de1: vmovlps qword ptr [rbp - 0x50], xmm0
0x1007b9de6: mov dword ptr [rbp - 0x48], 0
0x1007b9ded: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1007b9df2: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1007b9df7: mov r15, rbx
0x1007b9dfa: mov rdi, rbx
0x1007b9dfd: mov rsi, r12
0x1007b9e00: lea rdx, [rbp - 0x50]
0x1007b9e04: call 0x10078cae0 ; 0x10078cae0
0x1007b9e09: test al, al
0x1007b9e0b: je 0x1007b9e27
0x1007b9e0d: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1007b9e12: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1007b9e17: lea rdi, [rbp - 0x50]
0x1007b9e1b: lea rsi, [rbp - 0xc0]
0x1007b9e22: call 0x10078d5c0 ; 0x10078d5c0
0x1007b9e27: mov rbx, r15
0x1007b9e2a: mov rdi, rbx
0x1007b9e2d: mov r15, r14
0x1007b9e30: mov rsi, r15
0x1007b9e33: call 0x10076be90 ; 0x10076be90
0x1007b9e38: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1007b9e3d: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x80]
0x1007b9e42: vmulps xmm0, xmm0, xmm0
0x1007b9e46: vmovshdup xmm1, xmm0
0x1007b9e4a: vaddss xmm1, xmm0, xmm1
0x1007b9e4e: vpermilpd xmm0, xmm0, 1
0x1007b9e54: vaddss xmm0, xmm0, xmm1
0x1007b9e58: vmulss xmm0, xmm0, dword ptr [rbp - 0x34]
0x1007b9e5d: mov rcx, r13
0x1007b9e60: shl rcx, 4
0x1007b9e64: mov r14, qword ptr [rbp - 0x60]
0x1007b9e68: vmovss dword ptr [r14 + rcx], xmm0
0x1007b9e6e: mov r12, qword ptr [rbp - 0x58]
0x1007b9e72: mov rax, qword ptr [r12 + 0x10]
0x1007b9e77: mov rdx, qword ptr [rax + r13*8]
0x1007b9e7b: mov qword ptr [r14 + rcx + 8], rdx
0x1007b9e80: lea ecx, [r13 + 1]
0x1007b9e84: mov esi, dword ptr [r12 + 8]
0x1007b9e89: cmp ecx, esi
0x1007b9e8b: jb 0x1007b9db0
0x1007b9e91: jmp 0x1007b9e95 ; 0x1007b9e95
0x1007b9e93: xor esi, esi
0x1007b9e95: shl rsi, 4
0x1007b9e99: add rsi, r14
0x1007b9e9c: lea rax, [rip + 0xfd] ; 0x1007b9fa0
0x1007b9ea3: jmp 0x1007b9eb5 ; 0x1007b9eb5
0x1007b9ea5: xor esi, esi
0x1007b9ea7: shl rsi, 4
0x1007b9eab: add rsi, r14
0x1007b9eae: lea rax, [rip + 0xdb] ; 0x1007b9f90
0x1007b9eb5: mov qword ptr [rbp - 0xc0], rax
0x1007b9ebc: lea rdx, [rbp - 0xc0]
0x1007b9ec3: mov rdi, r14
0x1007b9ec6: call 0x1007ba0c0 ; 0x1007ba0c0
0x1007b9ecb: mov eax, dword ptr [r12 + 8]
0x1007b9ed0: test eax, eax
0x1007b9ed2: je 0x1007b9f67
0x1007b9ed8: mov edx, eax
0x1007b9eda: lea rcx, [rdx - 1]
0x1007b9ede: mov eax, edx
0x1007b9ee0: and eax, 3
0x1007b9ee3: cmp rcx, 3
0x1007b9ee7: jae 0x1007b9ef2
0x1007b9ee9: xor ecx, ecx
0x1007b9eeb: test rax, rax
0x1007b9eee: jne 0x1007b9f48
0x1007b9ef0: jmp 0x1007b9f67 ; 0x1007b9f67
0x1007b9ef2: sub rdx, rax
0x1007b9ef5: lea rsi, [r14 + 0x38]
0x1007b9ef9: xor ecx, ecx
0x1007b9efb: nop dword ptr [rax + rax]
0x1007b9f00: mov rdi, qword ptr [rsi - 0x30]
0x1007b9f04: mov rbx, qword ptr [r12 + 0x10]
0x1007b9f09: mov qword ptr [rbx + rcx*8], rdi
0x1007b9f0d: mov rdi, qword ptr [rsi - 0x20]
0x1007b9f11: mov rbx, qword ptr [r12 + 0x10]
0x1007b9f16: mov qword ptr [rbx + rcx*8 + 8], rdi
0x1007b9f1b: mov rdi, qword ptr [rsi - 0x10]
0x1007b9f1f: mov rbx, qword ptr [r12 + 0x10]
0x1007b9f24: mov qword ptr [rbx + rcx*8 + 0x10], rdi
0x1007b9f29: mov rdi, qword ptr [rsi]
0x1007b9f2c: mov rbx, qword ptr [r12 + 0x10]
0x1007b9f31: mov qword ptr [rbx + rcx*8 + 0x18], rdi
0x1007b9f36: add rcx, 4
0x1007b9f3a: add rsi, 0x40
0x1007b9f3e: cmp rdx, rcx
0x1007b9f41: jne 0x1007b9f00
0x1007b9f43: test rax, rax
0x1007b9f46: je 0x1007b9f67
0x1007b9f48: shl rcx, 3
0x1007b9f4c: neg rax
0x1007b9f4f: nop 
0x1007b9f50: mov rdx, qword ptr [r14 + rcx*2 + 8]
0x1007b9f55: mov rsi, qword ptr [r12 + 0x10]
0x1007b9f5a: mov qword ptr [rsi + rcx], rdx
0x1007b9f5e: add rcx, 8
0x1007b9f62: inc rax
0x1007b9f65: jne 0x1007b9f50
0x1007b9f67: mov rax, qword ptr [rip + 0x45396a] ; 0x100c0d8d8
0x1007b9f6e: mov rax, qword ptr [rax]
0x1007b9f71: cmp rax, qword ptr [rbp - 0x30]
0x1007b9f75: jne 0x1007b9f86
0x1007b9f77: lea rsp, [rbp - 0x28]
0x1007b9f7b: pop rbx
0x1007b9f7c: pop r12
0x1007b9f7e: pop r13
0x1007b9f80: pop r14
0x1007b9f82: pop r15
0x1007b9f84: pop rbp
0x1007b9f85: ret 
0x1007b9f86: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1007b9f8b: nop dword ptr [rax + rax]
