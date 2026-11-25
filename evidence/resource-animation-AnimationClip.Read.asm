0x1000e4c40: push rbp
0x1000e4c41: mov rbp, rsp
0x1000e4c44: push r15
0x1000e4c46: push r14
0x1000e4c48: push r13
0x1000e4c4a: push r12
0x1000e4c4c: push rbx
0x1000e4c4d: sub rsp, 0x48
0x1000e4c51: mov r14d, r9d
0x1000e4c54: mov r13, rcx
0x1000e4c57: mov r15d, edx
0x1000e4c5a: mov rbx, rsi
0x1000e4c5d: mov r12, rdi
0x1000e4c60: mov rdi, rbx
0x1000e4c63: mov rsi, r12
0x1000e4c66: call 0x10076a240 ; 0x10076a240
0x1000e4c6b: lea rsi, [r12 + 4]
0x1000e4c70: mov rdi, rbx
0x1000e4c73: call 0x10076a240 ; 0x10076a240
0x1000e4c78: lea rsi, [r12 + 8]
0x1000e4c7d: mov qword ptr [rbp - 0x30], rbx
0x1000e4c81: mov rdi, rbx
0x1000e4c84: call 0x10076a240 ; 0x10076a240
0x1000e4c89: cmp r14d, 9
0x1000e4c8d: jl 0x1000e4cad
0x1000e4c8f: lea rsi, [r12 + 0x10]
0x1000e4c94: mov rbx, qword ptr [rbp - 0x30]
0x1000e4c98: mov rdi, rbx
0x1000e4c9b: call 0x10076a360 ; 0x10076a360
0x1000e4ca0: lea rsi, [r12 + 0x20]
0x1000e4ca5: mov rdi, rbx
0x1000e4ca8: call 0x10076a360 ; 0x10076a360
0x1000e4cad: mov r14d, dword ptr [r13 + 0x44]
0x1000e4cb1: mov qword ptr [rbp - 0x50], r12
0x1000e4cb5: mov dword ptr [r12 + 0x60], r14d
0x1000e4cba: mov rax, qword ptr [r13 + 0x30]
0x1000e4cbe: mov qword ptr [rbp - 0x40], rax
0x1000e4cc2: mov qword ptr [rbp - 0x38], r15
0x1000e4cc6: test r15d, r15d
0x1000e4cc9: mov r15, qword ptr [rbp - 0x30]
0x1000e4ccd: jle 0x1000e4d1b
0x1000e4ccf: lea eax, [r14 + 1]
0x1000e4cd3: mov dword ptr [r13 + 0x44], eax
0x1000e4cd7: mov rax, qword ptr [rbp - 0x40]
0x1000e4cdb: lea rsi, [rax + r14]
0x1000e4cdf: mov rdi, r15
0x1000e4ce2: call 0x10076a260 ; 0x10076a260
0x1000e4ce7: cmp dword ptr [rbp - 0x38], 1
0x1000e4ceb: je 0x1000e4d1b
0x1000e4ced: mov rax, qword ptr [rbp - 0x38]
0x1000e4cf1: lea ebx, [rax - 1]
0x1000e4cf4: nop word ptr cs:[rax + rax]
0x1000e4d00: mov esi, dword ptr [r13 + 0x44]
0x1000e4d04: lea eax, [rsi + 1]
0x1000e4d07: mov dword ptr [r13 + 0x44], eax
0x1000e4d0b: add rsi, qword ptr [r13 + 0x30]
0x1000e4d0f: mov rdi, r15
0x1000e4d12: call 0x10076a260 ; 0x10076a260
0x1000e4d17: dec ebx
0x1000e4d19: jne 0x1000e4d00
0x1000e4d1b: add qword ptr [rbp - 0x40], r14
0x1000e4d1f: mov eax, dword ptr [r13 + 0x38]
0x1000e4d23: mov r14, qword ptr [rbp - 0x50]
0x1000e4d27: mov dword ptr [r14 + 0x34], eax
0x1000e4d2b: mov ecx, dword ptr [r13 + 0x3c]
0x1000e4d2f: mov dword ptr [r14 + 0x30], ecx
0x1000e4d33: mov ecx, dword ptr [r13 + 0x40]
0x1000e4d37: mov dword ptr [r14 + 0x38], ecx
0x1000e4d3b: cmp dword ptr [rbp - 0x38], 0
0x1000e4d3f: jle 0x1000e4e73
0x1000e4d45: mov r15d, dword ptr [rbp - 0x38]
0x1000e4d49: mov qword ptr [rbp - 0x58], r15
0x1000e4d4d: mov rbx, qword ptr [rbp - 0x40]
0x1000e4d51: mov r12, qword ptr [rbp - 0x30]
0x1000e4d55: nop word ptr cs:[rax + rax]
0x1000e4d60: test byte ptr [rbx], 8
0x1000e4d63: je 0x1000e4daf
0x1000e4d65: mov rcx, qword ptr [r13 + 0x20]
0x1000e4d69: mov qword ptr [rbp - 0x48], rcx
0x1000e4d6d: mov eax, eax
0x1000e4d6f: lea r14, [rax + rax*2]
0x1000e4d73: lea rsi, [rcx + r14*4]
0x1000e4d77: mov rdi, r12
0x1000e4d7a: call 0x10076a2a0 ; 0x10076a2a0
0x1000e4d7f: mov rax, qword ptr [rbp - 0x48]
0x1000e4d83: lea rsi, [rax + r14*4 + 4]
0x1000e4d88: mov rdi, r12
0x1000e4d8b: call 0x10076a2a0 ; 0x10076a2a0
0x1000e4d90: mov rax, qword ptr [rbp - 0x48]
0x1000e4d94: lea rsi, [rax + r14*4 + 8]
0x1000e4d99: mov r14, qword ptr [rbp - 0x50]
0x1000e4d9d: mov rdi, r12
0x1000e4da0: call 0x10076a2a0 ; 0x10076a2a0
0x1000e4da5: mov eax, dword ptr [r13 + 0x38]
0x1000e4da9: inc eax
0x1000e4dab: mov dword ptr [r13 + 0x38], eax
0x1000e4daf: inc rbx
0x1000e4db2: dec r15
0x1000e4db5: jne 0x1000e4d60
0x1000e4db7: cmp dword ptr [rbp - 0x38], 0
0x1000e4dbb: mov r15, qword ptr [rbp - 0x30]
0x1000e4dbf: mov rax, qword ptr [rbp - 0x58]
0x1000e4dc3: jle 0x1000e4e73
0x1000e4dc9: mov r15, rax
0x1000e4dcc: mov rbx, qword ptr [rbp - 0x40]
0x1000e4dd0: mov rax, qword ptr [rbp - 0x38]
0x1000e4dd4: nop word ptr cs:[rax + rax]
0x1000e4de0: test byte ptr [rbx], 0x10
0x1000e4de3: je 0x1000e4e02
0x1000e4de5: mov esi, dword ptr [r13 + 0x3c]
0x1000e4de9: shl rsi, 4
0x1000e4ded: add rsi, qword ptr [r13 + 0x18]
0x1000e4df1: mov rdi, qword ptr [rbp - 0x30]
0x1000e4df5: call 0x10076a4f0 ; 0x10076a4f0
0x1000e4dfa: mov rax, qword ptr [rbp - 0x38]
0x1000e4dfe: inc dword ptr [r13 + 0x3c]
0x1000e4e02: inc rbx
0x1000e4e05: dec r15
0x1000e4e08: jne 0x1000e4de0
0x1000e4e0a: test eax, eax
0x1000e4e0c: mov r15, qword ptr [rbp - 0x30]
0x1000e4e10: mov rax, qword ptr [rbp - 0x58]
0x1000e4e14: jle 0x1000e4e73
0x1000e4e16: mov rbx, qword ptr [rbp - 0x40]
0x1000e4e1a: nop word ptr [rax + rax]
0x1000e4e20: test byte ptr [rbx], 0x20
0x1000e4e23: je 0x1000e4e6b
0x1000e4e25: mov r14, qword ptr [r13 + 0x28]
0x1000e4e29: mov r12, rax
0x1000e4e2c: mov eax, dword ptr [r13 + 0x40]
0x1000e4e30: lea r15, [rax + rax*2]
0x1000e4e34: lea rsi, [r14 + r15*4]
0x1000e4e38: mov rdi, qword ptr [rbp - 0x30]
0x1000e4e3c: call 0x10076a2a0 ; 0x10076a2a0
0x1000e4e41: lea rsi, [r14 + r15*4 + 4]
0x1000e4e46: mov rdi, qword ptr [rbp - 0x30]
0x1000e4e4a: call 0x10076a2a0 ; 0x10076a2a0
0x1000e4e4f: lea rsi, [r14 + r15*4 + 8]
0x1000e4e54: mov r15, qword ptr [rbp - 0x30]
0x1000e4e58: mov r14, qword ptr [rbp - 0x50]
0x1000e4e5c: mov rdi, r15
0x1000e4e5f: call 0x10076a2a0 ; 0x10076a2a0
0x1000e4e64: mov rax, r12
0x1000e4e67: inc dword ptr [r13 + 0x40]
0x1000e4e6b: inc rbx
0x1000e4e6e: dec rax
0x1000e4e71: jne 0x1000e4e20
0x1000e4e73: mov eax, dword ptr [r13 + 0x38]
0x1000e4e77: mov dword ptr [r14 + 0x40], eax
0x1000e4e7b: mov eax, dword ptr [r13 + 0x3c]
0x1000e4e7f: mov dword ptr [r14 + 0x3c], eax
0x1000e4e83: mov eax, dword ptr [r13 + 0x40]
0x1000e4e87: mov dword ptr [r14 + 0x44], eax
0x1000e4e8b: mov ecx, dword ptr [r14]
0x1000e4e8e: mov eax, dword ptr [r14 + 4]
0x1000e4e92: mov edx, eax
0x1000e4e94: sub edx, ecx
0x1000e4e96: jl 0x1000e4ff4
0x1000e4e9c: lea edi, [rax + 1]
0x1000e4e9f: sub edi, ecx
0x1000e4ea1: mov rsi, qword ptr [rbp - 0x38]
0x1000e4ea5: test esi, esi
0x1000e4ea7: jle 0x1000e4fc3
0x1000e4ead: mov eax, esi
0x1000e4eaf: mov qword ptr [rbp - 0x48], rax
0x1000e4eb3: xor eax, eax
0x1000e4eb5: mov qword ptr [rbp - 0x68], r13
0x1000e4eb9: mov qword ptr [rbp - 0x60], rdi
0x1000e4ebd: nop dword ptr [rax]
0x1000e4ec0: mov dword ptr [rbp - 0x58], eax
0x1000e4ec3: mov r14, qword ptr [rbp - 0x48]
0x1000e4ec7: mov rbx, qword ptr [rbp - 0x40]
0x1000e4ecb: nop dword ptr [rax + rax]
0x1000e4ed0: test byte ptr [rbx], 1
0x1000e4ed3: je 0x1000e4f11
0x1000e4ed5: mov r15, qword ptr [r13 + 0x20]
0x1000e4ed9: mov eax, dword ptr [r13 + 0x38]
0x1000e4edd: lea r12, [rax + rax*2]
0x1000e4ee1: lea rsi, [r15 + r12*4]
0x1000e4ee5: mov rdi, qword ptr [rbp - 0x30]
0x1000e4ee9: call 0x10076a2a0 ; 0x10076a2a0
0x1000e4eee: lea rsi, [r15 + r12*4 + 4]
0x1000e4ef3: mov rdi, qword ptr [rbp - 0x30]
0x1000e4ef7: call 0x10076a2a0 ; 0x10076a2a0
0x1000e4efc: lea rsi, [r15 + r12*4 + 8]
0x1000e4f01: mov r15, qword ptr [rbp - 0x30]
0x1000e4f05: mov rdi, r15
0x1000e4f08: call 0x10076a2a0 ; 0x10076a2a0
0x1000e4f0d: inc dword ptr [r13 + 0x38]
0x1000e4f11: inc rbx
0x1000e4f14: dec r14
0x1000e4f17: jne 0x1000e4ed0
0x1000e4f19: mov r14, qword ptr [rbp - 0x48]
0x1000e4f1d: mov rbx, qword ptr [rbp - 0x40]
0x1000e4f21: nop word ptr cs:[rax + rax]
0x1000e4f30: test byte ptr [rbx], 2
0x1000e4f33: je 0x1000e4f4d
0x1000e4f35: mov esi, dword ptr [r13 + 0x3c]
0x1000e4f39: shl rsi, 4
0x1000e4f3d: add rsi, qword ptr [r13 + 0x18]
0x1000e4f41: mov rdi, r15
0x1000e4f44: call 0x10076a4f0 ; 0x10076a4f0
0x1000e4f49: inc dword ptr [r13 + 0x3c]
0x1000e4f4d: inc rbx
0x1000e4f50: dec r14
0x1000e4f53: jne 0x1000e4f30
0x1000e4f55: mov r15, qword ptr [rbp - 0x48]
0x1000e4f59: mov r14, qword ptr [rbp - 0x40]
0x1000e4f5d: nop dword ptr [rax]
0x1000e4f60: test byte ptr [r14], 4
0x1000e4f64: je 0x1000e4fa4
0x1000e4f66: mov rbx, qword ptr [r13 + 0x28]
0x1000e4f6a: mov eax, dword ptr [r13 + 0x40]
0x1000e4f6e: lea r12, [rax + rax*2]
0x1000e4f72: lea rsi, [rbx + r12*4]
0x1000e4f76: mov r13, qword ptr [rbp - 0x30]
0x1000e4f7a: mov rdi, r13
0x1000e4f7d: call 0x10076a2a0 ; 0x10076a2a0
0x1000e4f82: lea rsi, [rbx + r12*4 + 4]
0x1000e4f87: mov rdi, r13
0x1000e4f8a: call 0x10076a2a0 ; 0x10076a2a0
0x1000e4f8f: lea rsi, [rbx + r12*4 + 8]
0x1000e4f94: mov rdi, r13
0x1000e4f97: mov r13, qword ptr [rbp - 0x68]
0x1000e4f9b: call 0x10076a2a0 ; 0x10076a2a0
0x1000e4fa0: inc dword ptr [r13 + 0x40]
0x1000e4fa4: inc r14
0x1000e4fa7: dec r15
0x1000e4faa: jne 0x1000e4f60
0x1000e4fac: mov eax, dword ptr [rbp - 0x58]
0x1000e4faf: inc eax
0x1000e4fb1: mov rdi, qword ptr [rbp - 0x60]
0x1000e4fb5: cmp eax, edi
0x1000e4fb7: mov r15, qword ptr [rbp - 0x30]
0x1000e4fbb: jne 0x1000e4ec0
0x1000e4fc1: jmp 0x1000e4ff4 ; 0x1000e4ff4
0x1000e4fc3: and edi, 7
0x1000e4fc6: cmp edx, 7
0x1000e4fc9: jb 0x1000e4fe5
0x1000e4fcb: lea ecx, [rcx + rdi - 1]
0x1000e4fcf: sub ecx, eax
0x1000e4fd1: nop word ptr cs:[rax + rax]
0x1000e4fe0: add ecx, 8
0x1000e4fe3: jne 0x1000e4fe0
0x1000e4fe5: test edi, edi
0x1000e4fe7: je 0x1000e4ff4
0x1000e4fe9: neg edi
0x1000e4feb: nop dword ptr [rax + rax]
0x1000e4ff0: inc edi
0x1000e4ff2: jne 0x1000e4ff0
0x1000e4ff4: mov rdi, qword ptr [rbp - 0x50]
0x1000e4ff8: mov rsi, qword ptr [rbp - 0x38]
0x1000e4ffc: mov rdx, r13
0x1000e4fff: add rsp, 0x48
0x1000e5003: pop rbx
0x1000e5004: pop r12
0x1000e5006: pop r13
0x1000e5008: pop r14
0x1000e500a: pop r15
0x1000e500c: pop rbp
0x1000e500d: jmp 0x1000e46e0 ; 0x1000e46e0
0x1000e5012: nop word ptr cs:[rax + rax]
