0x1004d1e40: push rbp
0x1004d1e41: mov rbp, rsp
0x1004d1e44: push r15
0x1004d1e46: push r14
0x1004d1e48: push r12
0x1004d1e4a: push rbx
0x1004d1e4b: sub rsp, 0x60
0x1004d1e4f: mov rbx, rdi
0x1004d1e52: mov qword ptr [rbp - 0x28], rsi
0x1004d1e56: vmovss xmm0, dword ptr [rip + 0x5d3262] ; 0x100aa50c0
0x1004d1e5e: vmovaps xmmword ptr [rbx], xmm0
0x1004d1e62: vmovaps xmm0, xmmword ptr [rip + 0x5d6236] ; 0x100aa80a0
0x1004d1e6a: vmovaps xmmword ptr [rbx + 0x10], xmm0
0x1004d1e6f: vmovaps xmm0, xmmword ptr [rip + 0x5d6bb9] ; 0x100aa8a30
0x1004d1e77: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x1004d1e7c: vmovaps xmm0, xmmword ptr [rip + 0x5d6b7c] ; 0x100aa8a00
0x1004d1e84: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x1004d1e89: test rsi, rsi
0x1004d1e8c: je 0x1004d1f24
0x1004d1e92: mov edi, dword ptr [rsi]
0x1004d1e94: call 0x1007abd30 ; 0x1007abd30
0x1004d1e99: mov rcx, qword ptr [rax]
0x1004d1e9c: mov rdi, rax
0x1004d1e9f: call qword ptr [rcx + 0x68]
0x1004d1ea2: test rax, rax
0x1004d1ea5: jne 0x1004d1eac
0x1004d1ea7: call 0x1007abc60 ; 0x1007abc60
0x1004d1eac: movzx edx, byte ptr [rip + 0x80126d] ; 0x100cd3120
0x1004d1eb3: lea rsi, [rip + 0x6a13a5] ; 0x100b7325f GetTransform
0x1004d1eba: mov rdi, rax
0x1004d1ebd: call 0x1004d2330 ; 0x1004d2330
0x1004d1ec2: mov r14, rax
0x1004d1ec5: test r14, r14
0x1004d1ec8: je 0x1004d1f24
0x1004d1eca: call 0x1007abc10 ; 0x1007abc10
0x1004d1ecf: mov r12, rax
0x1004d1ed2: lea rdi, [rbp - 0x70]
0x1004d1ed6: call 0x1007fa3b0 ; 0x1007fa3b0
0x1004d1edb: mov r15, rax
0x1004d1ede: mov qword ptr [rbp - 0x70], 0
0x1004d1ee6: call qword ptr [r14 + 0x58]
0x1004d1eea: mov r8, qword ptr [rax]
0x1004d1eed: lea rsi, [rbp - 0x70]
0x1004d1ef1: lea rdx, [rbp - 0x28]
0x1004d1ef5: mov rdi, rax
0x1004d1ef8: mov rcx, r12
0x1004d1efb: call qword ptr [r8 + 0x40]
0x1004d1eff: mov rdx, qword ptr [rbp - 0x70]
0x1004d1f03: test rdx, rdx
0x1004d1f06: je 0x1004d1f34
0x1004d1f08: mov rdi, qword ptr [r14 + 0x38]
0x1004d1f0c: mov rsi, qword ptr [r14 + 0x40]
0x1004d1f10: mov dword ptr [rsp], 0
0x1004d1f17: xor r9d, r9d
0x1004d1f1a: mov rcx, rbx
0x1004d1f1d: mov r8, r15
0x1004d1f20: call qword ptr [r14 + 0x48]
0x1004d1f24: mov rax, rbx
0x1004d1f27: add rsp, 0x60
0x1004d1f2b: pop rbx
0x1004d1f2c: pop r12
0x1004d1f2e: pop r14
0x1004d1f30: pop r15
0x1004d1f32: pop rbp
0x1004d1f33: ret 
0x1004d1f34: lea rdi, [rip + 0x6a5f3b] ; 0x100b77e76 c
0x1004d1f3b: lea rsi, [rip + 0x68b696] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x1004d1f42: mov edx, 0x443
0x1004d1f47: mov ecx, 3
0x1004d1f4c: call 0x1007e5f70 ; 0x1007e5f70
0x1004d1f51: ud2 
0x1004d1f53: nop word ptr cs:[rax + rax]
