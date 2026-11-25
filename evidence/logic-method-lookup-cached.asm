0x1004d2d70: push rbp
0x1004d2d71: mov rbp, rsp
0x1004d2d74: push r15
0x1004d2d76: push r14
0x1004d2d78: push r13
0x1004d2d7a: push r12
0x1004d2d7c: push rbx
0x1004d2d7d: sub rsp, 0x18
0x1004d2d81: mov r13, rsi
0x1004d2d84: lea r12, [rdi + 0x20]
0x1004d2d88: mov r15, qword ptr [rdi + 0x20]
0x1004d2d8c: test r15, r15
0x1004d2d8f: je 0x1004d2dc3
0x1004d2d91: mov rax, r12
0x1004d2d94: mov rcx, r15
0x1004d2d97: nop word ptr [rax + rax]
0x1004d2da0: lea rdx, [rcx + 8]
0x1004d2da4: cmp qword ptr [rcx + 0x20], r13
0x1004d2da8: cmovae rdx, rcx
0x1004d2dac: cmovae rax, rcx
0x1004d2db0: mov rcx, qword ptr [rdx]
0x1004d2db3: test rcx, rcx
0x1004d2db6: jne 0x1004d2da0
0x1004d2db8: cmp rax, r12
0x1004d2dbb: je 0x1004d2dc3
0x1004d2dbd: cmp qword ptr [rax + 0x20], r13
0x1004d2dc1: jbe 0x1004d2dc6
0x1004d2dc3: mov rax, r12
0x1004d2dc6: cmp r12, rax
0x1004d2dc9: je 0x1004d2dd4
0x1004d2dcb: mov rax, qword ptr [rax + 0x28]
0x1004d2dcf: jmp 0x1004d300a ; 0x1004d300a
0x1004d2dd4: lea rax, [rdi + 8]
0x1004d2dd8: mov qword ptr [rbp - 0x38], rdi
0x1004d2ddc: mov r14, qword ptr [rdi + 8]
0x1004d2de0: test r14, r14
0x1004d2de3: je 0x1004d2e2f
0x1004d2de5: mov qword ptr [rbp - 0x30], rax
0x1004d2de9: mov rbx, rax
0x1004d2dec: nop dword ptr [rax]
0x1004d2df0: mov rdi, qword ptr [r14 + 0x20]
0x1004d2df4: mov rsi, r13
0x1004d2df7: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1004d2dfc: lea rcx, [r14 + 8]
0x1004d2e00: test eax, eax
0x1004d2e02: cmovns rcx, r14
0x1004d2e06: cmovns rbx, r14
0x1004d2e0a: mov r14, qword ptr [rcx]
0x1004d2e0d: test r14, r14
0x1004d2e10: jne 0x1004d2df0
0x1004d2e12: mov rax, qword ptr [rbp - 0x30]
0x1004d2e16: cmp rbx, rax
0x1004d2e19: je 0x1004d2e2f
0x1004d2e1b: mov rsi, qword ptr [rbx + 0x20]
0x1004d2e1f: mov rdi, r13
0x1004d2e22: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1004d2e27: test eax, eax
0x1004d2e29: mov rax, qword ptr [rbp - 0x30]
0x1004d2e2d: jns 0x1004d2e32
0x1004d2e2f: mov rbx, rax
0x1004d2e32: cmp rax, rbx
0x1004d2e35: je 0x1004d2ea3
0x1004d2e37: mov rcx, qword ptr [rbx + 0x28]
0x1004d2e3b: test r15, r15
0x1004d2e3e: je 0x1004d2f03
0x1004d2e44: mov rax, qword ptr [rbp - 0x38]
0x1004d2e48: lea r14, [rax + 0x20]
0x1004d2e4c: cmp qword ptr [r15 + 0x20], r13
0x1004d2e50: jbe 0x1004d2e80
0x1004d2e52: jmp 0x1004d2e69 ; 0x1004d2e69
0x1004d2e54: nop word ptr cs:[rax + rax]
0x1004d2e60: mov r15, rax
0x1004d2e63: cmp qword ptr [r15 + 0x20], r13
0x1004d2e67: jbe 0x1004d2e80
0x1004d2e69: mov rax, qword ptr [r15]
0x1004d2e6c: mov r14, r15
0x1004d2e6f: test rax, rax
0x1004d2e72: jne 0x1004d2e60
0x1004d2e74: jmp 0x1004d2f28 ; 0x1004d2f28
0x1004d2e79: nop dword ptr [rax]
0x1004d2e80: jae 0x1004d2e8f
0x1004d2e82: lea r14, [r15 + 8]
0x1004d2e86: mov rax, qword ptr [r15 + 8]
0x1004d2e8a: test rax, rax
0x1004d2e8d: jne 0x1004d2e60
0x1004d2e8f: mov r12, r15
0x1004d2e92: mov r15, qword ptr [r14]
0x1004d2e95: test r15, r15
0x1004d2e98: jne 0x1004d2f93
0x1004d2e9e: jmp 0x1004d2f36 ; 0x1004d2f36
0x1004d2ea3: test r15, r15
0x1004d2ea6: je 0x1004d2f14
0x1004d2ea8: mov rax, qword ptr [rbp - 0x38]
0x1004d2eac: lea rbx, [rax + 0x20]
0x1004d2eb0: cmp qword ptr [r15 + 0x20], r13
0x1004d2eb4: jbe 0x1004d2ee0
0x1004d2eb6: jmp 0x1004d2ec9 ; 0x1004d2ec9
0x1004d2eb8: nop dword ptr [rax + rax]
0x1004d2ec0: mov r15, rax
0x1004d2ec3: cmp qword ptr [r15 + 0x20], r13
0x1004d2ec7: jbe 0x1004d2ee0
0x1004d2ec9: mov rax, qword ptr [r15]
0x1004d2ecc: mov rbx, r15
0x1004d2ecf: test rax, rax
0x1004d2ed2: jne 0x1004d2ec0
0x1004d2ed4: jmp 0x1004d2f9d ; 0x1004d2f9d
0x1004d2ed9: nop dword ptr [rax]
0x1004d2ee0: jae 0x1004d2eef
0x1004d2ee2: lea rbx, [r15 + 8]
0x1004d2ee6: mov rax, qword ptr [r15 + 8]
0x1004d2eea: test rax, rax
0x1004d2eed: jne 0x1004d2ec0
0x1004d2eef: mov r12, r15
0x1004d2ef2: mov r15, qword ptr [rbx]
0x1004d2ef5: test r15, r15
0x1004d2ef8: jne 0x1004d3000
0x1004d2efe: jmp 0x1004d2fab ; 0x1004d2fab
0x1004d2f03: mov r14, r12
0x1004d2f06: mov r15, qword ptr [r14]
0x1004d2f09: test r15, r15
0x1004d2f0c: jne 0x1004d2f93
0x1004d2f12: jmp 0x1004d2f36 ; 0x1004d2f36
0x1004d2f14: mov rbx, r12
0x1004d2f17: mov r15, qword ptr [rbx]
0x1004d2f1a: test r15, r15
0x1004d2f1d: jne 0x1004d3000
0x1004d2f23: jmp 0x1004d2fab ; 0x1004d2fab
0x1004d2f28: mov r12, r15
0x1004d2f2b: mov r14, r15
0x1004d2f2e: mov r15, qword ptr [r14]
0x1004d2f31: test r15, r15
0x1004d2f34: jne 0x1004d2f93
0x1004d2f36: mov qword ptr [rbp - 0x30], rcx
0x1004d2f3a: mov edi, 0x30
0x1004d2f3f: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1004d2f44: mov rcx, qword ptr [rbp - 0x38]
0x1004d2f48: mov r15, rax
0x1004d2f4b: mov qword ptr [r15 + 0x20], r13
0x1004d2f4f: mov qword ptr [r15 + 0x28], 0
0x1004d2f57: vxorps xmm0, xmm0, xmm0
0x1004d2f5b: vmovups xmmword ptr [r15], xmm0
0x1004d2f60: mov qword ptr [r15 + 0x10], r12
0x1004d2f64: mov qword ptr [r14], r15
0x1004d2f67: mov rax, qword ptr [rcx + 0x18]
0x1004d2f6b: mov rax, qword ptr [rax]
0x1004d2f6e: test rax, rax
0x1004d2f71: je 0x1004d2f7c
0x1004d2f73: mov qword ptr [rcx + 0x18], rax
0x1004d2f77: mov rsi, qword ptr [r14]
0x1004d2f7a: jmp 0x1004d2f7f ; 0x1004d2f7f
0x1004d2f7c: mov rsi, r15
0x1004d2f7f: mov r14, rcx
0x1004d2f82: mov rdi, qword ptr [r14 + 0x20]
0x1004d2f86: call 0x1001a7bb0 ; 0x1001a7bb0
0x1004d2f8b: inc qword ptr [r14 + 0x28]
0x1004d2f8f: mov rcx, qword ptr [rbp - 0x30]
0x1004d2f93: mov qword ptr [r15 + 0x28], rcx
0x1004d2f97: mov rax, qword ptr [rbx + 0x28]
0x1004d2f9b: jmp 0x1004d300a ; 0x1004d300a
0x1004d2f9d: mov r12, r15
0x1004d2fa0: mov rbx, r15
0x1004d2fa3: mov r15, qword ptr [rbx]
0x1004d2fa6: test r15, r15
0x1004d2fa9: jne 0x1004d3000
0x1004d2fab: mov edi, 0x30
0x1004d2fb0: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1004d2fb5: mov rcx, qword ptr [rbp - 0x38]
0x1004d2fb9: mov r15, rax
0x1004d2fbc: mov qword ptr [r15 + 0x20], r13
0x1004d2fc0: mov qword ptr [r15 + 0x28], 0
0x1004d2fc8: vxorps xmm0, xmm0, xmm0
0x1004d2fcc: vmovups xmmword ptr [r15], xmm0
0x1004d2fd1: mov qword ptr [r15 + 0x10], r12
0x1004d2fd5: mov qword ptr [rbx], r15
0x1004d2fd8: mov rax, qword ptr [rcx + 0x18]
0x1004d2fdc: mov rax, qword ptr [rax]
0x1004d2fdf: test rax, rax
0x1004d2fe2: je 0x1004d2fed
0x1004d2fe4: mov qword ptr [rcx + 0x18], rax
0x1004d2fe8: mov rsi, qword ptr [rbx]
0x1004d2feb: jmp 0x1004d2ff0 ; 0x1004d2ff0
0x1004d2fed: mov rsi, r15
0x1004d2ff0: mov rbx, rcx
0x1004d2ff3: mov rdi, qword ptr [rbx + 0x20]
0x1004d2ff7: call 0x1001a7bb0 ; 0x1001a7bb0
0x1004d2ffc: inc qword ptr [rbx + 0x28]
0x1004d3000: mov qword ptr [r15 + 0x28], 0
0x1004d3008: xor eax, eax
0x1004d300a: add rsp, 0x18
0x1004d300e: pop rbx
0x1004d300f: pop r12
0x1004d3011: pop r13
0x1004d3013: pop r14
0x1004d3015: pop r15
0x1004d3017: pop rbp
0x1004d3018: ret 
0x1004d3019: nop dword ptr [rax]
