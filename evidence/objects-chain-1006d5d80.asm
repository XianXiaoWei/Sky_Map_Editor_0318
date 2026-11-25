0x1006d5d80: push rbp
0x1006d5d81: mov rbp, rsp
0x1006d5d84: push r15
0x1006d5d86: push r14
0x1006d5d88: push r13
0x1006d5d8a: push r12
0x1006d5d8c: push rbx
0x1006d5d8d: sub rsp, 0x58
0x1006d5d91: mov r14, rdx
0x1006d5d94: mov r12, rdi
0x1006d5d97: mov rax, qword ptr [r12 + 0x40]
0x1006d5d9c: test rax, rax
0x1006d5d9f: je 0x1006d5dbd
0x1006d5da1: mov eax, dword ptr [rax + 0x10]
0x1006d5da4: mov rcx, qword ptr [r12 + 0x48]
0x1006d5da9: cmp eax, dword ptr [rcx + 0x10]
0x1006d5dac: jne 0x1006d5fef
0x1006d5db2: lea rcx, [r12 + 0x48]
0x1006d5db7: mov qword ptr [rbp - 0x30], rcx
0x1006d5dbb: jmp 0x1006d5dda ; 0x1006d5dda
0x1006d5dbd: cmp qword ptr [r12 + 0x38], 0
0x1006d5dc3: je 0x1006d600e
0x1006d5dc9: lea rax, [r12 + 0x48]
0x1006d5dce: mov qword ptr [rbp - 0x30], rax
0x1006d5dd2: mov rax, qword ptr [r12 + 0x48]
0x1006d5dd7: mov eax, dword ptr [rax + 0x10]
0x1006d5dda: mov esi, eax
0x1006d5ddc: shl rsi, 6
0x1006d5de0: mov rdx, qword ptr [rip + 0x1960e59] ; 0x102036c40
0x1006d5de7: mov ecx, 0x10
0x1006d5dec: mov rdi, r14
0x1006d5def: call 0x100795530 ; 0x100795530
0x1006d5df4: mov qword ptr [r12 + 0xa8], rax
0x1006d5dfc: mov rax, qword ptr [r12 + 0x40]
0x1006d5e01: test rax, rax
0x1006d5e04: je 0x1006d5e0f
0x1006d5e06: mov esi, dword ptr [rax + 0x10]
0x1006d5e09: shl rsi, 6
0x1006d5e0d: jmp 0x1006d5e14 ; 0x1006d5e14
0x1006d5e0f: mov esi, 0x40
0x1006d5e14: mov rdx, qword ptr [rip + 0x1960e25] ; 0x102036c40
0x1006d5e1b: mov ecx, 0x10
0x1006d5e20: mov rdi, r14
0x1006d5e23: call 0x100795530 ; 0x100795530
0x1006d5e28: mov qword ptr [r12 + 0xb0], rax
0x1006d5e30: cmp byte ptr [r12 + 0x7a], 0
0x1006d5e36: je 0x1006d5e60
0x1006d5e38: mov rax, qword ptr [r12 + 0x48]
0x1006d5e3d: mov esi, dword ptr [rax + 0x10]
0x1006d5e40: shl rsi, 6
0x1006d5e44: mov rdx, qword ptr [rip + 0x1960df5] ; 0x102036c40
0x1006d5e4b: mov ecx, 0x10
0x1006d5e50: mov rdi, r14
0x1006d5e53: call 0x100795530 ; 0x100795530
0x1006d5e58: mov qword ptr [r12 + 0xb8], rax
0x1006d5e60: cmp byte ptr [r12 + 0x78], 0
0x1006d5e66: jne 0x1006d5e74
0x1006d5e68: cmp byte ptr [r12 + 0x7a], 0
0x1006d5e6e: je 0x1006d5f70
0x1006d5e74: mov rax, qword ptr [rbp - 0x30]
0x1006d5e78: mov rax, qword ptr [rax]
0x1006d5e7b: cmp dword ptr [rax + 0x10], 0
0x1006d5e7f: je 0x1006d5f70
0x1006d5e85: xor r15d, r15d
0x1006d5e88: lea r14, [rbp - 0x80]
0x1006d5e8c: nop dword ptr [rax]
0x1006d5e90: mov rax, qword ptr [rax + 8]
0x1006d5e94: mov r15d, r15d
0x1006d5e97: mov rax, qword ptr [rax + r15*8]
0x1006d5e9b: mov qword ptr [rbp - 0x38], rax
0x1006d5e9f: call 0x1007abc10 ; 0x1007abc10
0x1006d5ea4: mov r13, rax
0x1006d5ea7: mov qword ptr [rbp - 0x80], 0
0x1006d5eaf: call 0x1007abc10 ; 0x1007abc10
0x1006d5eb4: mov rbx, qword ptr [rax]
0x1006d5eb7: mov rdi, rax
0x1006d5eba: mov rsi, r14
0x1006d5ebd: lea rdx, [rbp - 0x38]
0x1006d5ec1: mov rcx, r13
0x1006d5ec4: call qword ptr [rbx + 0x40]
0x1006d5ec7: mov rsi, qword ptr [rbp - 0x80]
0x1006d5ecb: test rsi, rsi
0x1006d5ece: je 0x1006d5fb1
0x1006d5ed4: mov rdi, r14
0x1006d5ed7: call 0x1004d1e40 ; 0x1004d1e40
0x1006d5edc: mov rcx, qword ptr [r12 + 0xa8]
0x1006d5ee4: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x1006d5ee9: mov rax, r15
0x1006d5eec: shl rax, 6
0x1006d5ef0: vmovaps xmmword ptr [rcx + rax], xmm0
0x1006d5ef5: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1006d5efa: vmovaps xmmword ptr [rcx + rax + 0x10], xmm0
0x1006d5f00: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1006d5f05: vmovaps xmmword ptr [rcx + rax + 0x20], xmm0
0x1006d5f0b: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1006d5f10: vmovaps xmmword ptr [rcx + rax + 0x30], xmm0
0x1006d5f16: cmp byte ptr [r12 + 0x7a], 0
0x1006d5f1c: je 0x1006d5f5c
0x1006d5f1e: mov rcx, qword ptr [r12 + 0xa8]
0x1006d5f26: mov rdx, qword ptr [r12 + 0xb8]
0x1006d5f2e: vmovaps xmm0, xmmword ptr [rcx + rax]
0x1006d5f33: vmovaps xmmword ptr [rdx + rax], xmm0
0x1006d5f38: vmovaps xmm0, xmmword ptr [rcx + rax + 0x10]
0x1006d5f3e: vmovaps xmmword ptr [rdx + rax + 0x10], xmm0
0x1006d5f44: vmovaps xmm0, xmmword ptr [rcx + rax + 0x20]
0x1006d5f4a: vmovaps xmmword ptr [rdx + rax + 0x20], xmm0
0x1006d5f50: vmovaps xmm0, xmmword ptr [rcx + rax + 0x30]
0x1006d5f56: vmovaps xmmword ptr [rdx + rax + 0x30], xmm0
0x1006d5f5c: inc r15d
0x1006d5f5f: mov rax, qword ptr [rbp - 0x30]
0x1006d5f63: mov rax, qword ptr [rax]
0x1006d5f66: cmp r15d, dword ptr [rax + 0x10]
0x1006d5f6a: jb 0x1006d5e90
0x1006d5f70: mov dword ptr [r12 + 0xa4], 0x3f800000
0x1006d5f7c: mov byte ptr [r12 + 0xd0], 0
0x1006d5f85: mov dword ptr [r12 + 0x9c], 0
0x1006d5f91: vmovss xmm0, dword ptr [r12 + 0x6c]
0x1006d5f98: vxorps xmm1, xmm1, xmm1
0x1006d5f9c: vucomiss xmm0, xmm1
0x1006d5fa0: jb 0x1006d5fd0
0x1006d5fa2: add rsp, 0x58
0x1006d5fa6: pop rbx
0x1006d5fa7: pop r12
0x1006d5fa9: pop r13
0x1006d5fab: pop r14
0x1006d5fad: pop r15
0x1006d5faf: pop rbp
0x1006d5fb0: ret 
0x1006d5fb1: lea rdi, [rip + 0x48bb40] ; 0x100b61af8 ret
0x1006d5fb8: lea rsi, [rip + 0x48b9a4] ; 0x100b61963 ./Clump.h
0x1006d5fbf: mov edx, 0x47
0x1006d5fc4: mov ecx, 3
0x1006d5fc9: call 0x1007e5f70 ; 0x1007e5f70
0x1006d5fce: ud2 
0x1006d5fd0: lea rdi, [rip + 0x4c5338] ; 0x100b9b30f staggeredDelay >= 0
0x1006d5fd7: lea rsi, [rip + 0x4c52d8] ; 0x100b9b2b6 TransformObject.cpp
0x1006d5fde: mov edx, 0x4a
0x1006d5fe3: mov ecx, 3
0x1006d5fe8: call 0x1007e5f70 ; 0x1007e5f70
0x1006d5fed: ud2 
0x1006d5fef: lea rdi, [rip + 0x4c52e3] ; 0x100b9b2d9 targets == NULL || targets->Size() == objects->Size()
0x1006d5ff6: lea rsi, [rip + 0x4c52b9] ; 0x100b9b2b6 TransformObject.cpp
0x1006d5ffd: mov edx, 0x32
0x1006d6002: mov ecx, 3
0x1006d6007: call 0x1007e5f70 ; 0x1007e5f70
0x1006d600c: ud2 
0x1006d600e: lea rdi, [rip + 0x4c527f] ; 0x100b9b294 targets != NULL || target != NULL
0x1006d6015: lea rsi, [rip + 0x4c529a] ; 0x100b9b2b6 TransformObject.cpp
0x1006d601c: lea r8, [rip + 0x4c52a7] ; 0x100b9b2ca has no target!
0x1006d6023: mov edx, 0x31
0x1006d6028: mov ecx, 4
0x1006d602d: xor eax, eax
0x1006d602f: call 0x1007e6030 ; 0x1007e6030
0x1006d6034: ud2 
0x1006d6036: nop word ptr cs:[rax + rax]
