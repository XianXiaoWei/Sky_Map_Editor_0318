0x100319d90: push rbp
0x100319d91: mov rbp, rsp
0x100319d94: push r15
0x100319d96: push r14
0x100319d98: push r13
0x100319d9a: push r12
0x100319d9c: push rbx
0x100319d9d: sub rsp, 0x48
0x100319da1: mov rbx, rdx
0x100319da4: mov r12, rdi
0x100319da7: mov rax, qword ptr [rip + 0x8f3b2a] ; 0x100c0d8d8
0x100319dae: mov rax, qword ptr [rax]
0x100319db1: mov qword ptr [rbp - 0x30], rax
0x100319db5: mov rax, qword ptr [rbx + 0x48]
0x100319db9: mov rcx, qword ptr [rax + 0x10]
0x100319dbd: mov dword ptr [r12 + 8], ecx
0x100319dc2: test ecx, ecx
0x100319dc4: je 0x10031a147
0x100319dca: shl rcx, 3
0x100319dce: movabs rax, 0x7fffffff8
0x100319dd8: and rax, rcx
0x100319ddb: mov rdx, qword ptr [rip + 0x1ad6c76] ; 0x101df0a58
0x100319de2: mov ecx, 0x10
0x100319de7: mov rdi, rsi
0x100319dea: mov rsi, rax
0x100319ded: call 0x100795530 ; 0x100795530
0x100319df2: mov qword ptr [r12], rax
0x100319df6: mov rax, qword ptr [rbx]
0x100319df9: mov r14, qword ptr [rax + 0xc0]
0x100319e00: mov rdi, rbx
0x100319e03: call qword ptr [rax + 0xa0]
0x100319e09: add rax, 0xf
0x100319e0d: and rax, 0xfffffffffffffff0
0x100319e11: mov rsi, rsp
0x100319e14: sub rsi, rax
0x100319e17: mov rsp, rsi
0x100319e1a: mov rdi, rbx
0x100319e1d: call r14
0x100319e20: mov qword ptr [rbp - 0x58], rax
0x100319e24: call 0x1007abbf0 ; 0x1007abbf0
0x100319e29: mov rax, qword ptr [rbx + 0x48]
0x100319e2d: mov r14, qword ptr [rax]
0x100319e30: add rax, 8
0x100319e34: cmp r14, rax
0x100319e37: je 0x10031a0a7
0x100319e3d: mov dword ptr [rbp - 0x44], 0
0x100319e44: lea r13, [rbp - 0x40]
0x100319e48: mov qword ptr [rbp - 0x50], rbx
0x100319e4c: mov qword ptr [rbp - 0x60], r12
0x100319e50: mov rax, qword ptr [r14 + 0x28]
0x100319e54: mov rcx, qword ptr [r12]
0x100319e58: mov qword ptr [rbp - 0x68], rcx
0x100319e5c: mov r15, rax
0x100319e5f: call qword ptr [rax + 0x28]
0x100319e62: mov rbx, rax
0x100319e65: mov byte ptr [rbp - 0x40], 0
0x100319e69: mov rdi, r13
0x100319e6c: call 0x1007aba50 ; 0x1007aba50
0x100319e71: mov ecx, 0
0x100319e76: cmp rax, rbx
0x100319e79: je 0x100319fd0
0x100319e7f: mov byte ptr [rbp - 0x40], 0
0x100319e83: mov rdi, r13
0x100319e86: call 0x1007aba70 ; 0x1007aba70
0x100319e8b: cmp rax, rbx
0x100319e8e: je 0x100319f80
0x100319e94: mov word ptr [rbp - 0x40], 0
0x100319e9a: mov rdi, r13
0x100319e9d: call 0x1007aba90 ; 0x1007aba90
0x100319ea2: cmp rax, rbx
0x100319ea5: je 0x100319f87
0x100319eab: mov word ptr [rbp - 0x40], 0
0x100319eb1: mov rdi, r13
0x100319eb4: call 0x1007abab0 ; 0x1007abab0
0x100319eb9: cmp rax, rbx
0x100319ebc: je 0x100319f8e
0x100319ec2: mov dword ptr [rbp - 0x40], 0
0x100319ec9: mov rdi, r13
0x100319ecc: call 0x1007abad0 ; 0x1007abad0
0x100319ed1: cmp rax, rbx
0x100319ed4: je 0x100319f95
0x100319eda: mov dword ptr [rbp - 0x40], 0
0x100319ee1: mov rdi, r13
0x100319ee4: call 0x1007abaf0 ; 0x1007abaf0
0x100319ee9: cmp rax, rbx
0x100319eec: je 0x100319f9c
0x100319ef2: mov dword ptr [rbp - 0x40], 0
0x100319ef9: mov rdi, r13
0x100319efc: call 0x1007abb50 ; 0x1007abb50
0x100319f01: cmp rax, rbx
0x100319f04: je 0x100319fa3
0x100319f0a: mov qword ptr [rbp - 0x40], 0
0x100319f12: mov rdi, r13
0x100319f15: call 0x1007abb70 ; 0x1007abb70
0x100319f1a: cmp rax, rbx
0x100319f1d: je 0x100319faa
0x100319f23: mov rdi, r13
0x100319f26: call 0x1007fa330 ; 0x1007fa330
0x100319f2b: cmp rax, rbx
0x100319f2e: je 0x100319fb1
0x100319f34: mov rdi, r13
0x100319f37: call 0x1007fa350 ; 0x1007fa350
0x100319f3c: cmp rax, rbx
0x100319f3f: je 0x100319fb8
0x100319f41: lea rax, [rip + 0x1d25798] ; 0x10203f6e0
0x100319f48: vmovaps xmm0, xmmword ptr [rax]
0x100319f4c: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x100319f51: mov rdi, r13
0x100319f54: call 0x10077d810 ; 0x10077d810
0x100319f59: cmp rax, rbx
0x100319f5c: je 0x100319fbf
0x100319f5e: mov byte ptr [rbp - 0x40], 0
0x100319f62: mov rdi, r13
0x100319f65: call 0x1007abbd0 ; 0x1007abbd0
0x100319f6a: mov ecx, 0xb
0x100319f6f: cmp rax, rbx
0x100319f72: je 0x100319fd0
0x100319f74: jmp 0x10031a11b ; 0x10031a11b
0x100319f79: nop dword ptr [rax]
0x100319f80: mov ecx, 1
0x100319f85: jmp 0x100319fd0 ; 0x100319fd0
0x100319f87: mov ecx, 2
0x100319f8c: jmp 0x100319fd0 ; 0x100319fd0
0x100319f8e: mov ecx, 3
0x100319f93: jmp 0x100319fd0 ; 0x100319fd0
0x100319f95: mov ecx, 4
0x100319f9a: jmp 0x100319fd0 ; 0x100319fd0
0x100319f9c: mov ecx, 5
0x100319fa1: jmp 0x100319fd0 ; 0x100319fd0
0x100319fa3: mov ecx, 6
0x100319fa8: jmp 0x100319fd0 ; 0x100319fd0
0x100319faa: mov ecx, 7
0x100319faf: jmp 0x100319fd0 ; 0x100319fd0
0x100319fb1: mov ecx, 8
0x100319fb6: jmp 0x100319fd0 ; 0x100319fd0
0x100319fb8: mov ecx, 9
0x100319fbd: jmp 0x100319fd0 ; 0x100319fd0
0x100319fbf: mov ecx, 0xa
0x100319fc4: nop word ptr cs:[rax + rax]
0x100319fd0: mov r13d, dword ptr [rbp - 0x44]
0x100319fd4: mov rax, qword ptr [rbp - 0x68]
0x100319fd8: mov dword ptr [rax + r13*8], ecx
0x100319fdc: call qword ptr [r15 + 0x30]
0x100319fe0: mov rbx, rax
0x100319fe3: mov rax, qword ptr [rbx]
0x100319fe6: mov r12, qword ptr [rax + 0xe0]
0x100319fed: mov rdi, qword ptr [rbp - 0x50]
0x100319ff1: mov rax, qword ptr [rdi]
0x100319ff4: call qword ptr [rax + 0x68]
0x100319ff7: mov rcx, qword ptr [r15 + 0x20]
0x100319ffb: mov rdi, rbx
0x100319ffe: lea rsi, [rbp - 0x58]
0x10031a002: mov rdx, rax
0x10031a005: call r12
0x10031a008: cmp qword ptr [r15 + 0x38], -1
0x10031a00d: je 0x10031a022
0x10031a00f: cmp qword ptr [r15 + 0x48], 0
0x10031a014: jne 0x10031a022
0x10031a016: mov rax, qword ptr [rax]
0x10031a019: test rax, rax
0x10031a01c: je 0x10031a0e0
0x10031a022: sub eax, dword ptr [rbp - 0x58]
0x10031a025: mov rcx, qword ptr [rbp - 0x68]
0x10031a029: mov dword ptr [rcx + r13*8 + 4], eax
0x10031a02e: mov rcx, qword ptr [r14 + 8]
0x10031a032: test rcx, rcx
0x10031a035: je 0x10031a060
0x10031a037: mov rbx, qword ptr [rbp - 0x50]
0x10031a03b: mov r12, qword ptr [rbp - 0x60]
0x10031a03f: lea r13, [rbp - 0x40]
0x10031a043: nop word ptr cs:[rax + rax]
0x10031a050: mov rax, rcx
0x10031a053: mov rcx, qword ptr [rax]
0x10031a056: test rcx, rcx
0x10031a059: jne 0x10031a050
0x10031a05b: jmp 0x10031a090 ; 0x10031a090
0x10031a05d: nop dword ptr [rax]
0x10031a060: mov rax, qword ptr [r14 + 0x10]
0x10031a064: cmp qword ptr [rax], r14
0x10031a067: mov rbx, qword ptr [rbp - 0x50]
0x10031a06b: mov r12, qword ptr [rbp - 0x60]
0x10031a06f: lea r13, [rbp - 0x40]
0x10031a073: je 0x10031a090
0x10031a075: add r14, 0x10
0x10031a079: nop dword ptr [rax]
0x10031a080: mov rcx, qword ptr [r14]
0x10031a083: mov rax, qword ptr [rcx + 0x10]
0x10031a087: cmp qword ptr [rax], rcx
0x10031a08a: lea r14, [rcx + 0x10]
0x10031a08e: jne 0x10031a080
0x10031a090: inc dword ptr [rbp - 0x44]
0x10031a093: mov rcx, qword ptr [rbx + 0x48]
0x10031a097: add rcx, 8
0x10031a09b: mov r14, rax
0x10031a09e: cmp rax, rcx
0x10031a0a1: jne 0x100319e50
0x10031a0a7: mov rax, qword ptr [rbx]
0x10031a0aa: lea rsi, [rbp - 0x58]
0x10031a0ae: mov rdi, rbx
0x10031a0b1: call qword ptr [rax + 0xc8]
0x10031a0b7: mov qword ptr [r12 + 0x10], rbx
0x10031a0bc: mov rax, qword ptr [rip + 0x8f3815] ; 0x100c0d8d8
0x10031a0c3: mov rax, qword ptr [rax]
0x10031a0c6: cmp rax, qword ptr [rbp - 0x30]
0x10031a0ca: jne 0x10031a0db
0x10031a0cc: lea rsp, [rbp - 0x28]
0x10031a0d0: pop rbx
0x10031a0d1: pop r12
0x10031a0d3: pop r13
0x10031a0d5: pop r14
0x10031a0d7: pop r15
0x10031a0d9: pop rbp
0x10031a0da: ret 
0x10031a0db: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10031a0e0: call qword ptr [r15 + 0x30]
0x10031a0e4: mov r9, qword ptr [rax + 8]
0x10031a0e8: sub rsp, 8
0x10031a0ec: lea rdi, [rip + 0x864697] ; 0x100b7e78a !m_countAddress || m_staticArraySize > 0 || *(void**)v != 0
0x10031a0f3: lea rsi, [rip + 0x8434de] ; 0x100b5d5d8 ../../../Code/Base/Meta.h
0x10031a0fa: lea r8, [rip + 0x8646c5] ; 0x100b7e7c6 %s::%s is a null array
0x10031a101: mov edx, 0x40b
0x10031a106: mov ecx, 4
0x10031a10b: xor eax, eax
0x10031a10d: push qword ptr [r15]
0x10031a110: call 0x1007e6030 ; 0x1007e6030
0x10031a115: add rsp, 0x10
0x10031a119: ud2 
0x10031a11b: mov r9, qword ptr [rbx + 8]
0x10031a11f: lea rdi, [rip + 0x888f06] ; 0x100ba302c false
0x10031a126: lea rsi, [rip + 0x86689f] ; 0x100b809cc Environment.cpp
0x10031a12d: lea r8, [rip + 0x8668a8] ; 0x100b809dc Field with unsupported type: %s
0x10031a134: mov edx, 0x8a
0x10031a139: mov ecx, 4
0x10031a13e: xor eax, eax
0x10031a140: call 0x1007e6030 ; 0x1007e6030
0x10031a145: ud2 
0x10031a147: lea rdi, [rip + 0x86686d] ; 0x100b809bb m_fieldCount > 0
0x10031a14e: lea rsi, [rip + 0x866877] ; 0x100b809cc Environment.cpp
0x10031a155: mov edx, 0x6e
0x10031a15a: mov ecx, 3
0x10031a15f: call 0x1007e5f70 ; 0x1007e5f70
0x10031a164: ud2 
0x10031a166: nop word ptr cs:[rax + rax]
