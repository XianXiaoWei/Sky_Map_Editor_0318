0x1007c2bd0: push rbp
0x1007c2bd1: mov rbp, rsp
0x1007c2bd4: push r15
0x1007c2bd6: push r14
0x1007c2bd8: push r13
0x1007c2bda: push r12
0x1007c2bdc: push rbx
0x1007c2bdd: sub rsp, 0x228
0x1007c2be4: mov qword ptr [rbp - 0x228], rdx
0x1007c2beb: mov rbx, rsi
0x1007c2bee: mov r12, rdi
0x1007c2bf1: mov rax, qword ptr [rip + 0x44ace0] ; 0x100c0d8d8
0x1007c2bf8: mov rax, qword ptr [rax]
0x1007c2bfb: mov qword ptr [rbp - 0x30], rax
0x1007c2bff: lea rdi, [rbp - 0xd0]
0x1007c2c06: lea r13, [rbp - 0x218]
0x1007c2c0d: mov rax, qword ptr [rip + 0x44790c] ; 0x100c0a520
0x1007c2c14: lea rcx, [rax + 0x18]
0x1007c2c18: mov qword ptr [rbp - 0x220], rcx
0x1007c2c1f: add rax, 0x40
0x1007c2c23: mov qword ptr [rbp - 0xd0], rax
0x1007c2c2a: mov rsi, r13
0x1007c2c2d: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1007c2c32: mov qword ptr [rbp - 0x238], rbx
0x1007c2c39: mov qword ptr [rbp - 0x48], 0
0x1007c2c41: mov dword ptr [rbp - 0x40], 0xffffffff
0x1007c2c48: mov r14, qword ptr [rip + 0x44a979] ; 0x100c0d5c8
0x1007c2c4f: lea r15, [r14 + 0x18]
0x1007c2c53: mov qword ptr [rbp - 0x220], r15
0x1007c2c5a: add r14, 0x40
0x1007c2c5e: mov qword ptr [rbp - 0xd0], r14
0x1007c2c65: lea rsi, [rip + 0x3c0b35] ; 0x100b837a1 Resources
0x1007c2c6c: mov edx, 2
0x1007c2c71: mov rdi, r13
0x1007c2c74: call 0x1007a56a0 ; 0x1007a56a0
0x1007c2c79: lea rsi, [rip + 0x3e1aea] ; 0x100ba476a Unloading: Queuing resources from 
0x1007c2c80: lea rdi, [rbp - 0x220]
0x1007c2c87: mov edx, 0x22
0x1007c2c8c: call 0x100011930 ; 0x100011930
0x1007c2c91: mov rbx, rax
0x1007c2c94: mov r13, qword ptr [rbp - 0x228]
0x1007c2c9b: mov rdi, r13
0x1007c2c9e: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1007c2ca3: mov rdi, rbx
0x1007c2ca6: mov rsi, r13
0x1007c2ca9: mov rdx, rax
0x1007c2cac: call 0x100011930 ; 0x100011930
0x1007c2cb1: mov qword ptr [rbp - 0x220], r15
0x1007c2cb8: mov qword ptr [rbp - 0xd0], r14
0x1007c2cbf: lea rdi, [rbp - 0x218]
0x1007c2cc6: call 0x1007a58d0 ; 0x1007a58d0
0x1007c2ccb: mov rsi, qword ptr [rip + 0x4478ae] ; 0x100c0a580
0x1007c2cd2: add rsi, 8
0x1007c2cd6: lea rdi, [rbp - 0x220]
0x1007c2cdd: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1007c2ce2: lea rdi, [rbp - 0xd0]
0x1007c2ce9: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1007c2cee: mov r15d, dword ptr [r12 + 0x420]
0x1007c2cf6: mov rdi, r13
0x1007c2cf9: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1007c2cfe: inc eax
0x1007c2d00: cmp eax, 0x41
0x1007c2d03: jae 0x1007c2ef4
0x1007c2d09: lea r14, [r12 + 0x20]
0x1007c2d0e: lea rdi, [rbp - 0x220]
0x1007c2d15: mov rsi, r13
0x1007c2d18: call 0x100aa2c5a ; 0x100aa2c5a _strcpy
0x1007c2d1d: mov rbx, r14
0x1007c2d20: test r15d, r15d
0x1007c2d23: je 0x1007c2d67
0x1007c2d25: shl r15, 6
0x1007c2d29: lea rax, [r12 + r15 + 0x20]
0x1007c2d2e: mov qword ptr [rbp - 0x230], rax
0x1007c2d35: lea r13, [rbp - 0x220]
0x1007c2d3c: mov rbx, r14
0x1007c2d3f: nop 
0x1007c2d40: mov rdi, rbx
0x1007c2d43: mov rsi, r13
0x1007c2d46: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007c2d4b: test eax, eax
0x1007c2d4d: je 0x1007c2d60
0x1007c2d4f: add rbx, 0x40
0x1007c2d53: add r15, -0x40
0x1007c2d57: jne 0x1007c2d40
0x1007c2d59: mov rbx, qword ptr [rbp - 0x230]
0x1007c2d60: mov r13, qword ptr [rbp - 0x228]
0x1007c2d67: mov eax, dword ptr [r12 + 0x420]
0x1007c2d6f: mov rcx, rax
0x1007c2d72: shl rcx, 6
0x1007c2d76: lea rcx, [r12 + rcx + 0x20]
0x1007c2d7b: cmp rcx, rbx
0x1007c2d7e: je 0x1007c2f13
0x1007c2d84: cmp r14, rbx
0x1007c2d87: ja 0x1007c2ed5
0x1007c2d8d: cmp rcx, rbx
0x1007c2d90: jbe 0x1007c2ed5
0x1007c2d96: lea rdx, [rbx + 0x40]
0x1007c2d9a: cmp rdx, rcx
0x1007c2d9d: je 0x1007c2dd7
0x1007c2d9f: nop 
0x1007c2da0: vmovups ymm0, ymmword ptr [rbx + 0x40]
0x1007c2da5: vmovups ymm1, ymmword ptr [rbx + 0x60]
0x1007c2daa: vmovups ymmword ptr [rbx + 0x20], ymm1
0x1007c2daf: vmovups ymmword ptr [rbx], ymm0
0x1007c2db3: mov eax, dword ptr [r12 + 0x420]
0x1007c2dbb: mov rcx, rax
0x1007c2dbe: shl rcx, 6
0x1007c2dc2: lea rcx, [r12 + rcx + 0x20]
0x1007c2dc7: lea rdx, [rbx + 0x40]
0x1007c2dcb: sub rbx, -0x80
0x1007c2dcf: cmp rbx, rcx
0x1007c2dd2: mov rbx, rdx
0x1007c2dd5: jne 0x1007c2da0
0x1007c2dd7: dec eax
0x1007c2dd9: mov dword ptr [r12 + 0x420], eax
0x1007c2de1: mov rbx, qword ptr [r12 + 0x4d0]
0x1007c2de9: mov qword ptr [r12 + 0x4d0], 0
0x1007c2df5: lea rsi, [rip + 0x3e18af] ; 0x100ba46ab resourceTable = {}
0x1007c2dfc: mov r14, qword ptr [rbp - 0x238]
0x1007c2e03: mov rdi, r14
0x1007c2e06: vzeroupper 
0x1007c2e09: call 0x1007a6ef0 ; 0x1007a6ef0
0x1007c2e0e: mov rdi, r14
0x1007c2e11: mov rsi, r13
0x1007c2e14: call 0x1007a6cf0 ; 0x1007a6cf0
0x1007c2e19: mov qword ptr [rbp - 0x240], r12
0x1007c2e20: lea rax, [rbp - 0x240]
0x1007c2e27: mov qword ptr [rbp - 0x220], rax
0x1007c2e2e: mov rax, qword ptr [rip + 0x18858a3] ; 0x1020486d8
0x1007c2e35: mov qword ptr [rbp - 0x218], rax
0x1007c2e3c: call 0x1007abbf0 ; 0x1007abbf0
0x1007c2e41: mov dword ptr [rsp], 1
0x1007c2e48: lea rdx, [rip + 0x3e1970] ; 0x100ba47bf QueueResourcesForUnload
0x1007c2e4f: lea r9, [rbp - 0x220]
0x1007c2e56: xor esi, esi
0x1007c2e58: xor ecx, ecx
0x1007c2e5a: mov rdi, r14
0x1007c2e5d: mov r8, rax
0x1007c2e60: call 0x1000f0760 ; 0x1000f0760
0x1007c2e65: lea rsi, [rip + 0x3e1868] ; 0x100ba46d4 resourceTable = nil
0x1007c2e6c: mov rdi, r14
0x1007c2e6f: call 0x1007a6ef0 ; 0x1007a6ef0
0x1007c2e74: mov rax, qword ptr [r12 + 0x4d0]
0x1007c2e7c: mov qword ptr [r12 + 0x4d0], rbx
0x1007c2e84: test rbx, rbx
0x1007c2e87: je 0x1007c2ea3
0x1007c2e89: nop dword ptr [rax]
0x1007c2e90: mov r12, rbx
0x1007c2e93: mov rbx, qword ptr [r12 + 0x68]
0x1007c2e98: test rbx, rbx
0x1007c2e9b: jne 0x1007c2e90
0x1007c2e9d: add r12, 0x68
0x1007c2ea1: jmp 0x1007c2eaa ; 0x1007c2eaa
0x1007c2ea3: add r12, 0x4d0
0x1007c2eaa: mov qword ptr [r12], rax
0x1007c2eae: mov rax, qword ptr [rip + 0x44aa23] ; 0x100c0d8d8
0x1007c2eb5: mov rax, qword ptr [rax]
0x1007c2eb8: cmp rax, qword ptr [rbp - 0x30]
0x1007c2ebc: jne 0x1007c2ed0
0x1007c2ebe: add rsp, 0x228
0x1007c2ec5: pop rbx
0x1007c2ec6: pop r12
0x1007c2ec8: pop r13
0x1007c2eca: pop r14
0x1007c2ecc: pop r15
0x1007c2ece: pop rbp
0x1007c2ecf: ret 
0x1007c2ed0: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1007c2ed5: lea rdi, [rip + 0x3e1ba6] ; 0x100ba4a82 it.getPtr() >= begin().getPtr() && it.getPtr() < end().getPtr()
0x1007c2edc: lea rsi, [rip + 0x3e1b6e] ; 0x100ba4a51 ../../Code/Base/FixedVector.h
0x1007c2ee3: mov edx, 0x8a
0x1007c2ee8: mov ecx, 3
0x1007c2eed: call 0x1007e5f70 ; 0x1007e5f70
0x1007c2ef2: ud2 
0x1007c2ef4: lea rdi, [rip + 0x3a1f61] ; 0x100b64e5c len + 1 <= N
0x1007c2efb: lea rsi, [rip + 0x3df555] ; 0x100ba2457 ../../Code/Base/FixedString.h
0x1007c2f02: mov edx, 0x30
0x1007c2f07: mov ecx, 3
0x1007c2f0c: call 0x1007e5f70 ; 0x1007e5f70
0x1007c2f11: ud2 
0x1007c2f13: lea rdi, [rip + 0x3e1873] ; 0x100ba478d m_loadedLists.end().getPtr() != itr
0x1007c2f1a: lea rsi, [rip + 0x3e166d] ; 0x100ba458e Resource.cpp
0x1007c2f21: lea r8, [rip + 0x3e1889] ; 0x100ba47b1 %s not loaded
0x1007c2f28: mov edx, 0x14a
0x1007c2f2d: mov ecx, 4
0x1007c2f32: xor eax, eax
0x1007c2f34: mov r9, r13
0x1007c2f37: call 0x1007e6030 ; 0x1007e6030
0x1007c2f3c: ud2 
0x1007c2f3e: mov rbx, rax
0x1007c2f41: jmp 0x1007c2f65 ; 0x1007c2f65
0x1007c2f43: mov rbx, rax
0x1007c2f46: jmp 0x1007c2f7c ; 0x1007c2f7c
0x1007c2f48: mov rbx, rax
0x1007c2f4b: mov qword ptr [rbp - 0x220], r15
0x1007c2f52: mov qword ptr [rbp - 0xd0], r14
0x1007c2f59: lea rdi, [rbp - 0x218]
0x1007c2f60: call 0x1007a58d0 ; 0x1007a58d0
0x1007c2f65: mov rsi, qword ptr [rip + 0x447614] ; 0x100c0a580
0x1007c2f6c: add rsi, 8
0x1007c2f70: lea rdi, [rbp - 0x220]
0x1007c2f77: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1007c2f7c: lea rdi, [rbp - 0xd0]
0x1007c2f83: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1007c2f88: mov rdi, rbx
0x1007c2f8b: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
