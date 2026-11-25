0x1001a29d0: push rbp
0x1001a29d1: mov rbp, rsp
0x1001a29d4: push r15
0x1001a29d6: push r14
0x1001a29d8: push r13
0x1001a29da: push r12
0x1001a29dc: push rbx
0x1001a29dd: sub rsp, 0x68
0x1001a29e1: mov rax, qword ptr [rip + 0xa6aef0] ; 0x100c0d8d8
0x1001a29e8: mov rax, qword ptr [rax]
0x1001a29eb: mov qword ptr [rbp - 0x30], rax
0x1001a29ef: mov qword ptr [rbp - 0x70], rdi
0x1001a29f3: mov rax, qword ptr [rdi + 0xe8]
0x1001a29fa: mov qword ptr [rbp - 0x48], rax
0x1001a29fe: mov rax, qword ptr [rax + 0x30]
0x1001a2a02: test rax, rax
0x1001a2a05: je 0x1001a2bfa
0x1001a2a0b: cmp dword ptr [rax + 0x10], 0
0x1001a2a0f: je 0x1001a2bfa
0x1001a2a15: mov rcx, qword ptr [rsi + 0x18]
0x1001a2a19: vmovaps xmm0, xmmword ptr [rcx + 0x10]
0x1001a2a1e: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1001a2a23: mov rcx, qword ptr [rbp - 0x48]
0x1001a2a27: mov rcx, qword ptr [rcx + 0x38]
0x1001a2a2b: mov qword ptr [rbp - 0x68], rcx
0x1001a2a2f: xor r14d, r14d
0x1001a2a32: vmovss xmm0, dword ptr [rip + 0x904e7e] ; 0x100aa78b8
0x1001a2a3a: vmovss dword ptr [rbp - 0x34], xmm0
0x1001a2a3f: lea r12, [rbp - 0x40]
0x1001a2a43: xor r15d, r15d
0x1001a2a46: nop word ptr cs:[rax + rax]
0x1001a2a50: mov rax, qword ptr [rax + 8]
0x1001a2a54: mov ecx, r15d
0x1001a2a57: mov rax, qword ptr [rax + rcx*8]
0x1001a2a5b: mov qword ptr [rbp - 0x40], rax
0x1001a2a5f: call 0x1007abc10 ; 0x1007abc10
0x1001a2a64: mov r13, rax
0x1001a2a67: mov qword ptr [rbp - 0x60], 0
0x1001a2a6f: call 0x10043ccc0 ; 0x10043ccc0
0x1001a2a74: mov rbx, qword ptr [rax]
0x1001a2a77: mov rdi, rax
0x1001a2a7a: lea rsi, [rbp - 0x60]
0x1001a2a7e: mov rdx, r12
0x1001a2a81: mov rcx, r13
0x1001a2a84: call qword ptr [rbx + 0x40]
0x1001a2a87: mov rbx, qword ptr [rbp - 0x60]
0x1001a2a8b: test rbx, rbx
0x1001a2a8e: je 0x1001a2eef
0x1001a2a94: mov rax, qword ptr [rbx]
0x1001a2a97: mov rdi, rbx
0x1001a2a9a: call qword ptr [rax + 0x10]
0x1001a2a9d: test al, al
0x1001a2a9f: je 0x1001a2b0d
0x1001a2aa1: vmovaps xmm1, xmmword ptr [rbx + 0x10]
0x1001a2aa6: vsubps xmm0, xmm1, xmmword ptr [rbp - 0x80]
0x1001a2aab: mov rax, qword ptr [rbp - 0x48]
0x1001a2aaf: mov rax, qword ptr [rax + 0x38]
0x1001a2ab3: test rax, rax
0x1001a2ab6: je 0x1001a2ae1
0x1001a2ab8: vmovaps xmm2, xmmword ptr [rax + 0x10]
0x1001a2abd: vsubps xmm1, xmm2, xmm1
0x1001a2ac1: vmulps xmm1, xmm0, xmm1
0x1001a2ac5: vmovshdup xmm2, xmm1
0x1001a2ac9: vaddss xmm2, xmm1, xmm2
0x1001a2acd: vpermilpd xmm1, xmm1, 1
0x1001a2ad3: vaddss xmm1, xmm1, xmm2
0x1001a2ad7: vxorps xmm2, xmm2, xmm2
0x1001a2adb: vucomiss xmm2, xmm1
0x1001a2adf: ja 0x1001a2b0d
0x1001a2ae1: vmulps xmm0, xmm0, xmm0
0x1001a2ae5: vmovshdup xmm1, xmm0
0x1001a2ae9: vaddss xmm1, xmm0, xmm1
0x1001a2aed: vpermilpd xmm0, xmm0, 1
0x1001a2af3: vaddss xmm0, xmm0, xmm1
0x1001a2af7: vmovss xmm1, dword ptr [rbp - 0x34]
0x1001a2afc: vucomiss xmm1, xmm0
0x1001a2b00: vminss xmm1, xmm0, xmm1
0x1001a2b04: vmovss dword ptr [rbp - 0x34], xmm1
0x1001a2b09: cmova r14, rbx
0x1001a2b0d: inc r15d
0x1001a2b10: mov rax, qword ptr [rbp - 0x48]
0x1001a2b14: mov rax, qword ptr [rax + 0x30]
0x1001a2b18: cmp r15d, dword ptr [rax + 0x10]
0x1001a2b1c: jb 0x1001a2a50
0x1001a2b22: test r14, r14
0x1001a2b25: mov rbx, r14
0x1001a2b28: mov rax, qword ptr [rbp - 0x68]
0x1001a2b2c: cmove rbx, rax
0x1001a2b30: test rax, rax
0x1001a2b33: cmove rbx, r14
0x1001a2b37: test rbx, rbx
0x1001a2b3a: je 0x1001a2bfa
0x1001a2b40: call 0x1007abc10 ; 0x1007abc10
0x1001a2b45: call 0x1003f0590 ; 0x1003f0590
0x1001a2b4a: call 0x100268810 ; 0x100268810
0x1001a2b4f: call 0x100268830 ; 0x100268830
0x1001a2b54: mov eax, dword ptr [rax + 0x38]
0x1001a2b57: mov dword ptr [rbp - 0x60], eax
0x1001a2b5a: lea rax, [rbx + 8]
0x1001a2b5e: lea r15, [rbp - 0x58]
0x1001a2b62: mov qword ptr [rbp - 0x58], rax
0x1001a2b66: mov byte ptr [rbp - 0x50], 0
0x1001a2b6a: call 0x1007abc10 ; 0x1007abc10
0x1001a2b6f: mov r14, rax
0x1001a2b72: mov qword ptr [rbp - 0x40], 0
0x1001a2b7a: call 0x10043ccc0 ; 0x10043ccc0
0x1001a2b7f: mov r8, qword ptr [rax]
0x1001a2b82: lea rsi, [rbp - 0x40]
0x1001a2b86: mov rdi, rax
0x1001a2b89: mov rdx, r15
0x1001a2b8c: mov rcx, r14
0x1001a2b8f: call qword ptr [r8 + 0x40]
0x1001a2b93: mov rax, qword ptr [rbp - 0x40]
0x1001a2b97: mov r14, qword ptr [rbp - 0x70]
0x1001a2b9b: mov qword ptr [r14 + 0xf8], rax
0x1001a2ba2: mov al, byte ptr [rbp - 0x50]
0x1001a2ba5: mov byte ptr [r14 + 0x100], al
0x1001a2bac: mov byte ptr [r14 + 0x128], 0
0x1001a2bb4: mov qword ptr [r14 + 0x130], rbx
0x1001a2bbb: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a2bc0: vcvtsi2ss xmm0, xmm3, eax
0x1001a2bc4: vmulss xmm0, xmm0, dword ptr [rip + 0x904524] ; 0x100aa70f0
0x1001a2bcc: vmovss xmm1, dword ptr [rip + 0x9024ec] ; 0x100aa50c0
0x1001a2bd4: vsubss xmm1, xmm1, xmm0
0x1001a2bd8: vmulss xmm1, xmm1, dword ptr [rip + 0x90ad6c] ; 0x100aad94c
0x1001a2be0: vmulss xmm0, xmm0, dword ptr [rip + 0x90ad68] ; 0x100aad950
0x1001a2be8: vaddss xmm0, xmm0, xmm1
0x1001a2bec: vmovss dword ptr [r14 + 0x50c], xmm0
0x1001a2bf5: jmp 0x1001a2ecb ; 0x1001a2ecb
0x1001a2bfa: mov rax, qword ptr [rbp - 0x48]
0x1001a2bfe: mov rax, qword ptr [rax + 8]
0x1001a2c02: xor edx, edx
0x1001a2c04: mov esi, 0
0x1001a2c09: test rax, rax
0x1001a2c0c: je 0x1001a2c11
0x1001a2c0e: mov esi, dword ptr [rax + 0x10]
0x1001a2c11: mov rax, qword ptr [rbp - 0x48]
0x1001a2c15: mov rax, qword ptr [rax + 0x10]
0x1001a2c19: test rax, rax
0x1001a2c1c: je 0x1001a2c21
0x1001a2c1e: mov edx, dword ptr [rax + 0x10]
0x1001a2c21: mov rcx, rsp
0x1001a2c24: add edx, esi
0x1001a2c26: mov rax, rdx
0x1001a2c29: shl rax, 4
0x1001a2c2d: mov r14, rsp
0x1001a2c30: sub r14, rax
0x1001a2c33: mov rsp, r14
0x1001a2c36: mov qword ptr [rbp - 0x80], rdx
0x1001a2c3a: test edx, edx
0x1001a2c3c: mov qword ptr [rbp - 0x88], rcx
0x1001a2c43: je 0x1001a2da3
0x1001a2c49: mov eax, esi
0x1001a2c4b: mov qword ptr [rbp - 0x68], rax
0x1001a2c4f: neg esi
0x1001a2c51: mov qword ptr [rbp - 0x90], rsi
0x1001a2c58: vxorps xmm0, xmm0, xmm0
0x1001a2c5c: vmovss dword ptr [rbp - 0x34], xmm0
0x1001a2c61: xor r15d, r15d
0x1001a2c64: xor r12d, r12d
0x1001a2c67: nop word ptr [rax + rax]
0x1001a2c70: cmp r15, qword ptr [rbp - 0x68]
0x1001a2c74: jae 0x1001a2ce0
0x1001a2c76: mov rax, qword ptr [rbp - 0x48]
0x1001a2c7a: mov rax, qword ptr [rax + 8]
0x1001a2c7e: mov ecx, dword ptr [rax + 0x10]
0x1001a2c81: cmp r15, rcx
0x1001a2c84: jae 0x1001a2f0e
0x1001a2c8a: mov rax, qword ptr [rax + 8]
0x1001a2c8e: mov rax, qword ptr [rax + r15*8]
0x1001a2c92: mov qword ptr [rbp - 0x40], rax
0x1001a2c96: call 0x1007abc10 ; 0x1007abc10
0x1001a2c9b: mov r13, rax
0x1001a2c9e: mov qword ptr [rbp - 0x60], 0
0x1001a2ca6: call 0x10043ccc0 ; 0x10043ccc0
0x1001a2cab: mov rbx, qword ptr [rax]
0x1001a2cae: mov rdi, rax
0x1001a2cb1: lea rsi, [rbp - 0x60]
0x1001a2cb5: lea rdx, [rbp - 0x40]
0x1001a2cb9: mov rcx, r13
0x1001a2cbc: call qword ptr [rbx + 0x40]
0x1001a2cbf: mov rbx, qword ptr [rbp - 0x60]
0x1001a2cc3: test rbx, rbx
0x1001a2cc6: je 0x1001a2eef
0x1001a2ccc: xor r13d, r13d
0x1001a2ccf: jmp 0x1001a2d43 ; 0x1001a2d43
0x1001a2cd1: nop word ptr cs:[rax + rax]
0x1001a2ce0: mov rax, qword ptr [rbp - 0x48]
0x1001a2ce4: mov rcx, qword ptr [rax + 0x10]
0x1001a2ce8: mov rax, qword ptr [rbp - 0x90]
0x1001a2cef: lea rax, [rax + r15]
0x1001a2cf3: cmp dword ptr [rcx + 0x10], eax
0x1001a2cf6: jbe 0x1001a2f0e
0x1001a2cfc: mov rcx, qword ptr [rcx + 8]
0x1001a2d00: mov eax, eax
0x1001a2d02: mov rax, qword ptr [rcx + rax*8]
0x1001a2d06: mov qword ptr [rbp - 0x40], rax
0x1001a2d0a: call 0x1007abc10 ; 0x1007abc10
0x1001a2d0f: mov r13, rax
0x1001a2d12: mov qword ptr [rbp - 0x60], 0
0x1001a2d1a: call 0x10043ccc0 ; 0x10043ccc0
0x1001a2d1f: mov rbx, qword ptr [rax]
0x1001a2d22: mov rdi, rax
0x1001a2d25: lea rsi, [rbp - 0x60]
0x1001a2d29: lea rdx, [rbp - 0x40]
0x1001a2d2d: mov rcx, r13
0x1001a2d30: call qword ptr [rbx + 0x40]
0x1001a2d33: mov rbx, qword ptr [rbp - 0x60]
0x1001a2d37: mov r13b, 1
0x1001a2d3a: test rbx, rbx
0x1001a2d3d: je 0x1001a2eef
0x1001a2d43: mov rax, qword ptr [rbx]
0x1001a2d46: mov rdi, rbx
0x1001a2d49: call qword ptr [rax + 0x10]
0x1001a2d4c: test al, al
0x1001a2d4e: je 0x1001a2d87
0x1001a2d50: mov eax, r12d
0x1001a2d53: shl rax, 4
0x1001a2d57: mov qword ptr [r14 + rax], rbx
0x1001a2d5b: vmovss xmm0, dword ptr [rbx + 0x30]
0x1001a2d60: vmulss xmm0, xmm0, dword ptr [rbx + 0x34]
0x1001a2d65: vmulss xmm0, xmm0, dword ptr [rbx + 0x38]
0x1001a2d6a: vmovss dword ptr [r14 + rax + 8], xmm0
0x1001a2d71: mov byte ptr [r14 + rax + 0xc], r13b
0x1001a2d76: vmovss xmm1, dword ptr [rbp - 0x34]
0x1001a2d7b: vaddss xmm1, xmm1, xmm0
0x1001a2d7f: vmovss dword ptr [rbp - 0x34], xmm1
0x1001a2d84: inc r12d
0x1001a2d87: inc r15
0x1001a2d8a: cmp r15, qword ptr [rbp - 0x80]
0x1001a2d8e: jb 0x1001a2c70
0x1001a2d94: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a2d99: test r12d, r12d
0x1001a2d9c: jne 0x1001a2dbd
0x1001a2d9e: jmp 0x1001a2ec4 ; 0x1001a2ec4
0x1001a2da3: xor r12d, r12d
0x1001a2da6: vxorps xmm0, xmm0, xmm0
0x1001a2daa: vmovss dword ptr [rbp - 0x34], xmm0
0x1001a2daf: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a2db4: test r12d, r12d
0x1001a2db7: je 0x1001a2ec4
0x1001a2dbd: vcvtsi2ss xmm0, xmm3, eax
0x1001a2dc1: vmulss xmm0, xmm0, dword ptr [rip + 0x904327] ; 0x100aa70f0
0x1001a2dc9: vmulss xmm1, xmm0, dword ptr [rbp - 0x34]
0x1001a2dce: vmovss xmm2, dword ptr [rip + 0x9022ea] ; 0x100aa50c0
0x1001a2dd6: vsubss xmm2, xmm2, xmm0
0x1001a2dda: vxorps xmm0, xmm0, xmm0
0x1001a2dde: vmulss xmm2, xmm2, xmm0
0x1001a2de2: vaddss xmm1, xmm1, xmm2
0x1001a2de6: mov eax, r12d
0x1001a2de9: add r14, 0xc
0x1001a2ded: xor ecx, ecx
0x1001a2def: nop 
0x1001a2df0: vsubss xmm1, xmm1, dword ptr [r14 - 4]
0x1001a2df6: vucomiss xmm0, xmm1
0x1001a2dfa: jae 0x1001a2e0d
0x1001a2dfc: inc rcx
0x1001a2dff: add r14, 0x10
0x1001a2e03: cmp rcx, rax
0x1001a2e06: jb 0x1001a2df0
0x1001a2e08: jmp 0x1001a2ec4 ; 0x1001a2ec4
0x1001a2e0d: call 0x1007abc10 ; 0x1007abc10
0x1001a2e12: call 0x1003f0590 ; 0x1003f0590
0x1001a2e17: call 0x100268810 ; 0x100268810
0x1001a2e1c: call 0x100268830 ; 0x100268830
0x1001a2e21: mov eax, dword ptr [rax + 0x38]
0x1001a2e24: mov dword ptr [rbp - 0x60], eax
0x1001a2e27: mov rax, qword ptr [r14 - 0xc]
0x1001a2e2b: lea rcx, [rax + 8]
0x1001a2e2f: test rax, rax
0x1001a2e32: cmove rcx, rax
0x1001a2e36: lea r15, [rbp - 0x58]
0x1001a2e3a: mov qword ptr [rbp - 0x58], rcx
0x1001a2e3e: mov al, byte ptr [r14]
0x1001a2e41: mov byte ptr [rbp - 0x50], al
0x1001a2e44: call 0x1007abc10 ; 0x1007abc10
0x1001a2e49: mov r14, rax
0x1001a2e4c: mov qword ptr [rbp - 0x40], 0
0x1001a2e54: call 0x10043ccc0 ; 0x10043ccc0
0x1001a2e59: mov rbx, qword ptr [rax]
0x1001a2e5c: lea rsi, [rbp - 0x40]
0x1001a2e60: mov rdi, rax
0x1001a2e63: mov rdx, r15
0x1001a2e66: mov rcx, r14
0x1001a2e69: call qword ptr [rbx + 0x40]
0x1001a2e6c: mov rax, qword ptr [rbp - 0x40]
0x1001a2e70: mov rbx, qword ptr [rbp - 0x70]
0x1001a2e74: mov qword ptr [rbx + 0xf8], rax
0x1001a2e7b: mov al, byte ptr [rbp - 0x50]
0x1001a2e7e: mov byte ptr [rbx + 0x100], al
0x1001a2e84: mov byte ptr [rbx + 0x128], 0
0x1001a2e8b: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a2e90: vcvtsi2ss xmm0, xmm3, eax
0x1001a2e94: vmulss xmm0, xmm0, dword ptr [rip + 0x904254] ; 0x100aa70f0
0x1001a2e9c: vmovss xmm1, dword ptr [rip + 0x90221c] ; 0x100aa50c0
0x1001a2ea4: vsubss xmm1, xmm1, xmm0
0x1001a2ea8: vmulss xmm1, xmm1, dword ptr [rip + 0x90aa9c] ; 0x100aad94c
0x1001a2eb0: vmulss xmm0, xmm0, dword ptr [rip + 0x90aa98] ; 0x100aad950
0x1001a2eb8: vaddss xmm0, xmm0, xmm1
0x1001a2ebc: vmovss dword ptr [rbx + 0x50c], xmm0
0x1001a2ec4: mov rsp, qword ptr [rbp - 0x88]
0x1001a2ecb: mov rax, qword ptr [rip + 0xa6aa06] ; 0x100c0d8d8
0x1001a2ed2: mov rax, qword ptr [rax]
0x1001a2ed5: cmp rax, qword ptr [rbp - 0x30]
0x1001a2ed9: jne 0x1001a2eea
0x1001a2edb: lea rsp, [rbp - 0x28]
0x1001a2edf: pop rbx
0x1001a2ee0: pop r12
0x1001a2ee2: pop r13
0x1001a2ee4: pop r14
0x1001a2ee6: pop r15
0x1001a2ee8: pop rbp
0x1001a2ee9: ret 
0x1001a2eea: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1001a2eef: lea rdi, [rip + 0x9bec02] ; 0x100b61af8 ret
0x1001a2ef6: lea rsi, [rip + 0x9bea66] ; 0x100b61963 ./Clump.h
0x1001a2efd: mov edx, 0x47
0x1001a2f02: mov ecx, 3
0x1001a2f07: call 0x1007e5f70 ; 0x1007e5f70
0x1001a2f0c: ud2 
0x1001a2f0e: lea rdi, [rip + 0x9bea43] ; 0x100b61958 idx < size
0x1001a2f15: lea rsi, [rip + 0x9bea47] ; 0x100b61963 ./Clump.h
0x1001a2f1c: mov edx, 0x36
0x1001a2f21: mov ecx, 3
0x1001a2f26: call 0x1007e5f70 ; 0x1007e5f70
0x1001a2f2b: ud2 
0x1001a2f2d: nop dword ptr [rax]
