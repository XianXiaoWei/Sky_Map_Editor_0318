0x1007c38b0: push rbp
0x1007c38b1: mov rbp, rsp
0x1007c38b4: push r15
0x1007c38b6: push r14
0x1007c38b8: push r13
0x1007c38ba: push r12
0x1007c38bc: push rbx
0x1007c38bd: sub rsp, 0x228
0x1007c38c4: mov qword ptr [rbp - 0x238], rcx
0x1007c38cb: mov r13, rdx
0x1007c38ce: mov rbx, rsi
0x1007c38d1: mov r15, rdi
0x1007c38d4: mov rax, qword ptr [rip + 0x449ffd] ; 0x100c0d8d8
0x1007c38db: mov rax, qword ptr [rax]
0x1007c38de: mov qword ptr [rbp - 0x30], rax
0x1007c38e2: cmp byte ptr [r15 + 0x748], 0
0x1007c38ea: mov qword ptr [rbp - 0x228], r13
0x1007c38f1: mov qword ptr [rbp - 0x240], rbx
0x1007c38f8: je 0x1007c39ed
0x1007c38fe: lea rdi, [rbp - 0xd0]
0x1007c3905: lea r12, [rbp - 0x218]
0x1007c390c: mov rax, qword ptr [rip + 0x446c0d] ; 0x100c0a520
0x1007c3913: lea rcx, [rax + 0x18]
0x1007c3917: mov qword ptr [rbp - 0x220], rcx
0x1007c391e: add rax, 0x40
0x1007c3922: mov qword ptr [rbp - 0xd0], rax
0x1007c3929: mov rsi, r12
0x1007c392c: call 0x100aa2450 ; 0x100aa2450 __ZNSt3__18ios_base4initEPv
0x1007c3931: mov qword ptr [rbp - 0x48], 0
0x1007c3939: mov dword ptr [rbp - 0x40], 0xffffffff
0x1007c3940: mov r13, qword ptr [rip + 0x449c81] ; 0x100c0d5c8
0x1007c3947: lea r14, [r13 + 0x18]
0x1007c394b: mov qword ptr [rbp - 0x220], r14
0x1007c3952: add r13, 0x40
0x1007c3956: mov qword ptr [rbp - 0xd0], r13
0x1007c395d: lea rsi, [rip + 0x3bfe3d] ; 0x100b837a1 Resources
0x1007c3964: mov edx, 2
0x1007c3969: mov rdi, r12
0x1007c396c: call 0x1007a56a0 ; 0x1007a56a0
0x1007c3971: lea rsi, [rip + 0x3e0c79] ; 0x100ba45f1 Loading: Queuing resources from 
0x1007c3978: lea rdi, [rbp - 0x220]
0x1007c397f: mov edx, 0x20
0x1007c3984: call 0x100011930 ; 0x100011930
0x1007c3989: mov rbx, rax
0x1007c398c: mov r12, qword ptr [rbp - 0x228]
0x1007c3993: mov rdi, r12
0x1007c3996: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1007c399b: mov rdi, rbx
0x1007c399e: mov rsi, r12
0x1007c39a1: mov rdx, rax
0x1007c39a4: call 0x100011930 ; 0x100011930
0x1007c39a9: mov qword ptr [rbp - 0x220], r14
0x1007c39b0: mov qword ptr [rbp - 0xd0], r13
0x1007c39b7: lea rdi, [rbp - 0x218]
0x1007c39be: call 0x1007a58d0 ; 0x1007a58d0
0x1007c39c3: mov rsi, qword ptr [rip + 0x446bb6] ; 0x100c0a580
0x1007c39ca: add rsi, 8
0x1007c39ce: lea rdi, [rbp - 0x220]
0x1007c39d5: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1007c39da: lea rdi, [rbp - 0xd0]
0x1007c39e1: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1007c39e6: mov r13, qword ptr [rbp - 0x228]
0x1007c39ed: lea r14, [r15 + 0x20]
0x1007c39f1: cmp qword ptr [r15 + 0x4c0], 0
0x1007c39f9: jne 0x1007c3c2a
0x1007c39ff: mov ebx, dword ptr [r15 + 0x420]
0x1007c3a06: mov rdi, r13
0x1007c3a09: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1007c3a0e: inc eax
0x1007c3a10: cmp eax, 0x41
0x1007c3a13: jae 0x1007c3c0b
0x1007c3a19: shl rbx, 6
0x1007c3a1d: lea r12, [r15 + rbx + 0x20]
0x1007c3a22: lea rdi, [rbp - 0x220]
0x1007c3a29: mov rsi, r13
0x1007c3a2c: call 0x100aa2c5a ; 0x100aa2c5a _strcpy
0x1007c3a31: cmp r14, r12
0x1007c3a34: je 0x1007c3a63
0x1007c3a36: lea r13, [rbp - 0x220]
0x1007c3a3d: nop dword ptr [rax]
0x1007c3a40: mov rdi, r14
0x1007c3a43: mov rsi, r13
0x1007c3a46: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x1007c3a4b: test eax, eax
0x1007c3a4d: je 0x1007c3a5c
0x1007c3a4f: add r14, 0x40
0x1007c3a53: add rbx, -0x40
0x1007c3a57: jne 0x1007c3a40
0x1007c3a59: mov r14, r12
0x1007c3a5c: mov r13, qword ptr [rbp - 0x228]
0x1007c3a63: mov eax, dword ptr [r15 + 0x420]
0x1007c3a6a: test rax, rax
0x1007c3a6d: mov rbx, qword ptr [rbp - 0x240]
0x1007c3a74: je 0x1007c3a84
0x1007c3a76: shl rax, 6
0x1007c3a7a: lea rax, [r15 + rax + 0x20]
0x1007c3a7f: cmp rax, r14
0x1007c3a82: jne 0x1007c3ae3
0x1007c3a84: mov rdi, r13
0x1007c3a87: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1007c3a8c: inc eax
0x1007c3a8e: cmp eax, 0x41
0x1007c3a91: jae 0x1007c3c0b
0x1007c3a97: lea rdi, [rbp - 0x220]
0x1007c3a9e: mov rsi, r13
0x1007c3aa1: call 0x100aa2c5a ; 0x100aa2c5a _strcpy
0x1007c3aa6: mov eax, dword ptr [r15 + 0x420]
0x1007c3aad: cmp rax, 0x10
0x1007c3ab1: jae 0x1007c3c61
0x1007c3ab7: lea ecx, [rax + 1]
0x1007c3aba: mov dword ptr [r15 + 0x420], ecx
0x1007c3ac1: shl rax, 6
0x1007c3ac5: vmovups ymm0, ymmword ptr [rbp - 0x220]
0x1007c3acd: vmovups ymm1, ymmword ptr [rbp - 0x200]
0x1007c3ad5: vmovups ymmword ptr [r15 + rax + 0x40], ymm1
0x1007c3adc: vmovups ymmword ptr [r15 + rax + 0x20], ymm0
0x1007c3ae3: lea rsi, [rip + 0x3e0bc1] ; 0x100ba46ab resourceTable = {}
0x1007c3aea: mov rdi, rbx
0x1007c3aed: vzeroupper 
0x1007c3af0: call 0x1007a6ef0 ; 0x1007a6ef0
0x1007c3af5: mov rdi, rbx
0x1007c3af8: mov rsi, r13
0x1007c3afb: call 0x1007a6cf0 ; 0x1007a6cf0
0x1007c3b00: mov qword ptr [rbp - 0x230], r15
0x1007c3b07: mov rax, qword ptr [rbp - 0x238]
0x1007c3b0e: mov qword ptr [rbp - 0x248], rax
0x1007c3b15: lea rax, [rbp - 0x230]
0x1007c3b1c: mov qword ptr [rbp - 0x220], rax
0x1007c3b23: mov rax, qword ptr [rip + 0x1884bae] ; 0x1020486d8
0x1007c3b2a: mov qword ptr [rbp - 0x218], rax
0x1007c3b31: lea rax, [rbp - 0x248]
0x1007c3b38: mov qword ptr [rbp - 0x210], rax
0x1007c3b3f: call 0x100795180 ; 0x100795180
0x1007c3b44: mov qword ptr [rbp - 0x208], rax
0x1007c3b4b: call 0x1007abbf0 ; 0x1007abbf0
0x1007c3b50: mov dword ptr [rsp], 2
0x1007c3b57: lea rdx, [rip + 0x3e0b60] ; 0x100ba46be QueueResourcesForLoad
0x1007c3b5e: lea r9, [rbp - 0x220]
0x1007c3b65: xor esi, esi
0x1007c3b67: xor ecx, ecx
0x1007c3b69: mov rdi, rbx
0x1007c3b6c: mov r8, rax
0x1007c3b6f: call 0x1000f0760 ; 0x1000f0760
0x1007c3b74: lea rsi, [rip + 0x3e0b59] ; 0x100ba46d4 resourceTable = nil
0x1007c3b7b: mov rdi, rbx
0x1007c3b7e: call 0x1007a6ef0 ; 0x1007a6ef0
0x1007c3b83: lea rsi, [rip + 0x3e0b5e] ; 0x100ba46e8 function GetErrorCode() if resourceErrorCode then return resourceErrorCode else return 0 end end
0x1007c3b8a: mov rdi, rbx
0x1007c3b8d: call 0x1007a6ef0 ; 0x1007a6ef0
0x1007c3b92: mov dword ptr [rbp - 0x230], 0
0x1007c3b9c: mov dword ptr [rbp - 0x220], 0
0x1007c3ba6: lea rdi, [rbp - 0x220]
0x1007c3bad: call 0x1007abaf0 ; 0x1007abaf0
0x1007c3bb2: mov dword ptr [rsp], 0
0x1007c3bb9: lea rdx, [rip + 0x3e0b89] ; 0x100ba4749 GetErrorCode
0x1007c3bc0: lea rcx, [rbp - 0x230]
0x1007c3bc7: mov esi, 0
0x1007c3bcc: xor r9d, r9d
0x1007c3bcf: mov rdi, rbx
0x1007c3bd2: mov r8, rax
0x1007c3bd5: call 0x1000f0760 ; 0x1000f0760
0x1007c3bda: cmp dword ptr [rbp - 0x230], 0
0x1007c3be1: sete al
0x1007c3be4: mov rcx, qword ptr [rip + 0x449ced] ; 0x100c0d8d8
0x1007c3beb: mov rcx, qword ptr [rcx]
0x1007c3bee: cmp rcx, qword ptr [rbp - 0x30]
0x1007c3bf2: jne 0x1007c3c06
0x1007c3bf4: add rsp, 0x228
0x1007c3bfb: pop rbx
0x1007c3bfc: pop r12
0x1007c3bfe: pop r13
0x1007c3c00: pop r14
0x1007c3c02: pop r15
0x1007c3c04: pop rbp
0x1007c3c05: ret 
0x1007c3c06: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1007c3c0b: lea rdi, [rip + 0x3a124a] ; 0x100b64e5c len + 1 <= N
0x1007c3c12: lea rsi, [rip + 0x3de83e] ; 0x100ba2457 ../../Code/Base/FixedString.h
0x1007c3c19: mov edx, 0x30
0x1007c3c1e: mov ecx, 3
0x1007c3c23: call 0x1007e5f70 ; 0x1007e5f70
0x1007c3c28: ud2 
0x1007c3c2a: mov rdi, r14
0x1007c3c2d: call 0x1007c2f90 ; 0x1007c2f90
0x1007c3c32: mov qword ptr [rsp], rax
0x1007c3c36: lea rdi, [rip + 0x3e09d5] ; 0x100ba4612 !m_toLoadList
0x1007c3c3d: lea rsi, [rip + 0x3e094a] ; 0x100ba458e Resource.cpp
0x1007c3c44: lea r8, [rip + 0x3e09d5] ; 0x100ba4620 Resource list '%s' queued for load while '%s' still loading. Finish calling LoadNext() on the previous resource list to avoid this assert.
0x1007c3c4b: mov edx, 0x113
0x1007c3c50: mov ecx, 4
0x1007c3c55: xor eax, eax
0x1007c3c57: mov r9, r13
0x1007c3c5a: call 0x1007e6030 ; 0x1007e6030
0x1007c3c5f: ud2 
0x1007c3c61: lea rdi, [rip + 0x3e0e07] ; 0x100ba4a6f curSize < CAPACITY
0x1007c3c68: lea rsi, [rip + 0x3e0de2] ; 0x100ba4a51 ../../Code/Base/FixedVector.h
0x1007c3c6f: mov edx, 0x4f
0x1007c3c74: mov ecx, 3
0x1007c3c79: call 0x1007e5f70 ; 0x1007e5f70
0x1007c3c7e: ud2 
0x1007c3c80: lea r14, [rbp - 0xd0]
0x1007c3c87: mov rbx, rax
0x1007c3c8a: mov rsi, qword ptr [rip + 0x4468ef] ; 0x100c0a580
0x1007c3c91: add rsi, 8
0x1007c3c95: lea rdi, [rbp - 0x220]
0x1007c3c9c: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1007c3ca1: mov rdi, r14
0x1007c3ca4: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1007c3ca9: mov rdi, rbx
0x1007c3cac: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1007c3cb1: lea r14, [rbp - 0xd0]
0x1007c3cb8: mov rbx, rax
0x1007c3cbb: mov rdi, r14
0x1007c3cbe: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1007c3cc3: mov rdi, rbx
0x1007c3cc6: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1007c3ccb: mov rbx, rax
0x1007c3cce: mov qword ptr [rbp - 0x220], r14
0x1007c3cd5: mov qword ptr [rbp - 0xd0], r13
0x1007c3cdc: lea rdi, [rbp - 0x218]
0x1007c3ce3: call 0x1007a58d0 ; 0x1007a58d0
0x1007c3ce8: mov rsi, qword ptr [rip + 0x446891] ; 0x100c0a580
0x1007c3cef: add rsi, 8
0x1007c3cf3: lea rdi, [rbp - 0x220]
0x1007c3cfa: call 0x100aa23ba ; 0x100aa23ba __ZNSt3__113basic_ostreamIcNS_11char_traitsIcEEED2Ev
0x1007c3cff: lea rdi, [rbp - 0xd0]
0x1007c3d06: call 0x100aa245c ; 0x100aa245c __ZNSt3__19basic_iosIcNS_11char_traitsIcEEED2Ev
0x1007c3d0b: mov rdi, rbx
0x1007c3d0e: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1007c3d13: nop word ptr cs:[rax + rax]
