0x1006a88c0: push rbp
0x1006a88c1: mov rbp, rsp
0x1006a88c4: push r15
0x1006a88c6: push r14
0x1006a88c8: push r13
0x1006a88ca: push r12
0x1006a88cc: push rbx
0x1006a88cd: and rsp, 0xffffffffffffffe0
0x1006a88d1: sub rsp, 0x1e0
0x1006a88d8: mov r12d, edx
0x1006a88db: mov r14, rsi
0x1006a88de: mov rbx, rdi
0x1006a88e1: mov rax, qword ptr [rip + 0x564ff0] ; 0x100c0d8d8
0x1006a88e8: mov rax, qword ptr [rax]
0x1006a88eb: mov qword ptr [rsp + 0x1c0], rax
0x1006a88f3: mov rcx, qword ptr [r14 + 0x1a8]
0x1006a88fa: mov r15d, r12d
0x1006a88fd: imul r13, r15, 0x3e0
0x1006a8904: movzx eax, word ptr [rcx + r15*2]
0x1006a8909: cmp eax, 2
0x1006a890c: jne 0x1006a89c6
0x1006a8912: lea rsi, [rbx + 0x470]
0x1006a8919: lea rdi, [rsp + 0xc0]
0x1006a8921: call 0x1007e9360 ; 0x1007e9360
0x1006a8926: mov rax, r15
0x1006a8929: mov rcx, qword ptr [r14 + 0x1a8]
0x1006a8930: mov rsi, qword ptr [r14 + 0x1b0]
0x1006a8937: mov qword ptr [rsp + 0x38], rax
0x1006a893c: movzx eax, word ptr [rcx + rax*2]
0x1006a8940: cmp eax, 2
0x1006a8943: ja 0x1006a8998
0x1006a8945: mov qword ptr [rsp + 0x40], rsi
0x1006a894a: mov qword ptr [rsp + 0x30], rcx
0x1006a894f: mov r15, rbx
0x1006a8952: mov rbx, qword ptr [r14 + 0x1c8]
0x1006a8959: lea rdi, [r15 + 0x4b8]
0x1006a8960: lea rsi, [rbx + r13 + 0x20]
0x1006a8965: call 0x10077e4b0 ; 0x10077e4b0
0x1006a896a: add r15, 0x4f0
0x1006a8971: lea rsi, [rbx + r13 + 0x30]
0x1006a8976: mov rdi, r15
0x1006a8979: call 0x10077e4b0 ; 0x10077e4b0
0x1006a897e: add rbx, r13
0x1006a8981: mov esi, 0x3e0
0x1006a8986: mov rdi, rbx
0x1006a8989: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x1006a898e: mov rcx, qword ptr [rsp + 0x30]
0x1006a8993: mov rsi, qword ptr [rsp + 0x40]
0x1006a8998: mov rax, qword ptr [rsp + 0x38]
0x1006a899d: mov word ptr [rcx + rax*2], 0xffff
0x1006a89a3: mov word ptr [rsi + rax*2], 0xfffe
0x1006a89a9: lea rdi, [rsp + 0xc0]
0x1006a89b1: call 0x1007e9480 ; 0x1007e9480
0x1006a89b6: mov rsi, r14
0x1006a89b9: mov edx, r12d
0x1006a89bc: call 0x1006a7b50 ; 0x1006a7b50
0x1006a89c1: jmp 0x1006a8eda ; 0x1006a8eda
0x1006a89c6: mov qword ptr [rsp + 0x40], rcx
0x1006a89cb: mov r12, qword ptr [r14 + 0x1c8]
0x1006a89d2: lea rsi, [rbx + 0x470]
0x1006a89d9: lea rdi, [rsp + 0x48]
0x1006a89de: call 0x1007e9360 ; 0x1007e9360
0x1006a89e3: vmovss xmm0, dword ptr [r14 + 0x5e0]
0x1006a89ec: vmovss dword ptr [rsp + 0x28], xmm0
0x1006a89f2: mov rax, qword ptr [r14 + 0x1a0]
0x1006a89f9: mov rcx, r15
0x1006a89fc: shl rcx, 4
0x1006a8a00: vmovaps xmm0, xmmword ptr [rax + rcx]
0x1006a8a05: vmovaps xmmword ptr [rsp + 0x50], xmm0
0x1006a8a0b: mov eax, dword ptr [r12 + r13 + 0x48]
0x1006a8a10: add eax, dword ptr [r12 + r13 + 0x38]
0x1006a8a15: add eax, dword ptr [r12 + r13 + 0x58]
0x1006a8a1a: add eax, dword ptr [r12 + r13 + 0x68]
0x1006a8a1f: add eax, dword ptr [r12 + r13 + 0x78]
0x1006a8a24: add eax, dword ptr [r12 + r13 + 0x88]
0x1006a8a2c: add eax, dword ptr [r12 + r13 + 0x98]
0x1006a8a34: add eax, dword ptr [r12 + r13 + 0xa8]
0x1006a8a3c: add eax, dword ptr [r12 + r13 + 0xb8]
0x1006a8a44: add eax, dword ptr [r12 + r13 + 0xc8]
0x1006a8a4c: add eax, dword ptr [r12 + r13 + 0xd8]
0x1006a8a54: add eax, dword ptr [r12 + r13 + 0xe8]
0x1006a8a5c: add eax, dword ptr [r12 + r13 + 0xf8]
0x1006a8a64: add eax, dword ptr [r12 + r13 + 0x108]
0x1006a8a6c: add eax, dword ptr [r12 + r13 + 0x118]
0x1006a8a74: add eax, dword ptr [r12 + r13 + 0x128]
0x1006a8a7c: add eax, dword ptr [r12 + r13 + 0x138]
0x1006a8a84: add eax, dword ptr [r12 + r13 + 0x148]
0x1006a8a8c: add eax, dword ptr [r12 + r13 + 0x158]
0x1006a8a94: add eax, dword ptr [r12 + r13 + 0x168]
0x1006a8a9c: add eax, dword ptr [r12 + r13 + 0x178]
0x1006a8aa4: add eax, dword ptr [r12 + r13 + 0x188]
0x1006a8aac: add eax, dword ptr [r12 + r13 + 0x198]
0x1006a8ab4: add eax, dword ptr [r12 + r13 + 0x1a8]
0x1006a8abc: add eax, dword ptr [r12 + r13 + 0x1b8]
0x1006a8ac4: add eax, dword ptr [r12 + r13 + 0x1c8]
0x1006a8acc: add eax, dword ptr [r12 + r13 + 0x1d8]
0x1006a8ad4: add eax, dword ptr [r12 + r13 + 0x1e8]
0x1006a8adc: add eax, dword ptr [r12 + r13 + 0x1f8]
0x1006a8ae4: add eax, dword ptr [r12 + r13 + 0x208]
0x1006a8aec: add eax, dword ptr [r12 + r13 + 0x218]
0x1006a8af4: add eax, dword ptr [r12 + r13 + 0x228]
0x1006a8afc: add eax, dword ptr [r12 + r13 + 0x238]
0x1006a8b04: add eax, dword ptr [r12 + r13 + 0x248]
0x1006a8b0c: add eax, dword ptr [r12 + r13 + 0x258]
0x1006a8b14: add eax, dword ptr [r12 + r13 + 0x268]
0x1006a8b1c: add eax, dword ptr [r12 + r13 + 0x278]
0x1006a8b24: add eax, dword ptr [r12 + r13 + 0x288]
0x1006a8b2c: add eax, dword ptr [r12 + r13 + 0x298]
0x1006a8b34: add eax, dword ptr [r12 + r13 + 0x2a8]
0x1006a8b3c: add eax, dword ptr [r12 + r13 + 0x2b8]
0x1006a8b44: add eax, dword ptr [r12 + r13 + 0x2c8]
0x1006a8b4c: add eax, dword ptr [r12 + r13 + 0x2d8]
0x1006a8b54: add eax, dword ptr [r12 + r13 + 0x2e8]
0x1006a8b5c: add eax, dword ptr [r12 + r13 + 0x2f8]
0x1006a8b64: add eax, dword ptr [r12 + r13 + 0x308]
0x1006a8b6c: add eax, dword ptr [r12 + r13 + 0x318]
0x1006a8b74: add eax, dword ptr [r12 + r13 + 0x328]
0x1006a8b7c: add eax, dword ptr [r12 + r13 + 0x338]
0x1006a8b84: add eax, dword ptr [r12 + r13 + 0x348]
0x1006a8b8c: add eax, dword ptr [r12 + r13 + 0x358]
0x1006a8b94: add eax, dword ptr [r12 + r13 + 0x368]
0x1006a8b9c: add eax, dword ptr [r12 + r13 + 0x378]
0x1006a8ba4: add eax, dword ptr [r12 + r13 + 0x388]
0x1006a8bac: add eax, dword ptr [r12 + r13 + 0x398]
0x1006a8bb4: add eax, dword ptr [r12 + r13 + 0x3a8]
0x1006a8bbc: add eax, dword ptr [r12 + r13 + 0x3b8]
0x1006a8bc4: add eax, dword ptr [r12 + r13 + 0x3c8]
0x1006a8bcc: add eax, dword ptr [r12 + r13 + 0x3d8]
0x1006a8bd4: mov dword ptr [rsp + 0x20], eax
0x1006a8bd8: mov eax, dword ptr [r12 + r13 + 0x28]
0x1006a8bdd: mov dword ptr [rsp + 0x24], eax
0x1006a8be1: vxorps ymm0, ymm0, ymm0
0x1006a8be5: vmovups ymmword ptr [rsp + 0x18c], ymm0
0x1006a8bee: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x1006a8bf7: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x1006a8c00: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x1006a8c09: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x1006a8c12: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x1006a8c1b: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x1006a8c24: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x1006a8c2d: mov rax, rbx
0x1006a8c30: mov rbx, qword ptr [rax + 0x3a0]
0x1006a8c37: mov qword ptr [rsp + 0x38], rax
0x1006a8c3c: lea rdi, [rax + 0x3a8]
0x1006a8c43: mov qword ptr [rsp + 0x30], rdi
0x1006a8c48: vzeroupper 
0x1006a8c4b: call 0x1007e9220 ; 0x1007e9220
0x1006a8c50: lea rax, [r12 + r13]
0x1006a8c54: vmovss xmm0, dword ptr [rsp + 0x28]
0x1006a8c5a: vmulss xmm0, xmm0, dword ptr [rip + 0x3fb956] ; 0x100aa45b8
0x1006a8c62: vpermilps xmm0, xmm0, 0xc0
0x1006a8c68: lea rdi, [r12 + r13 + 0x28]
0x1006a8c6d: lea r9, [rbx + 0x80000]
0x1006a8c74: vmovaps xmm2, xmmword ptr [rsp + 0x50]
0x1006a8c7a: vaddps xmm1, xmm2, xmm0
0x1006a8c7e: vsubps xmm2, xmm2, xmm0
0x1006a8c82: vcvttss2si rcx, dword ptr [r14 + 8]
0x1006a8c88: vmovss xmm0, dword ptr [r14 + 0x10]
0x1006a8c8e: vcvttss2si rdx, xmm0
0x1006a8c93: mov rsi, qword ptr [rip + 0x56460e] ; 0x100c0d2a8
0x1006a8c9a: add rsi, 0x10
0x1006a8c9e: mov qword ptr [rsp + 0x90], rsi
0x1006a8ca6: mov dword ptr [rsp + 0x98], ecx
0x1006a8cad: mov dword ptr [rsp + 0x9c], edx
0x1006a8cb4: vmovaps xmmword ptr [rsp + 0xa0], xmm2
0x1006a8cbd: vmovaps xmmword ptr [rsp + 0xb0], xmm1
0x1006a8cc6: mov rax, qword ptr [rax]
0x1006a8cc9: mov ecx, dword ptr [r12 + r13 + 8]
0x1006a8cce: mov rdx, qword ptr [r12 + r13 + 0x10]
0x1006a8cd3: mov esi, dword ptr [r12 + r13 + 0x18]
0x1006a8cd8: mov qword ptr [rsp + 0x70], rax
0x1006a8cdd: mov qword ptr [rsp + 0x78], rdx
0x1006a8ce2: mov dword ptr [rsp + 0x80], esi
0x1006a8ce9: mov dword ptr [rsp + 0x84], ecx
0x1006a8cf0: mov dword ptr [rsp + 0x88], 2
0x1006a8cfb: mov rdx, qword ptr [r12 + r13 + 0x20]
0x1006a8d00: mov qword ptr [rsp + 0x68], rdi
0x1006a8d05: mov ecx, dword ptr [rdi]
0x1006a8d07: mov rax, qword ptr [rsp + 0x40]
0x1006a8d0c: movsx eax, word ptr [rax + r15*2]
0x1006a8d11: mov esi, 3
0x1006a8d16: sub esi, eax
0x1006a8d18: mov dword ptr [rsp + 0x10], esi
0x1006a8d1c: lea rax, [rsp + 0x24]
0x1006a8d21: mov qword ptr [rsp + 8], rax
0x1006a8d26: lea rax, [rsp + 0x20]
0x1006a8d2b: mov qword ptr [rsp], rax
0x1006a8d2f: lea rdi, [rsp + 0x90]
0x1006a8d37: lea rsi, [rsp + 0x70]
0x1006a8d3c: mov r8, rbx
0x1006a8d3f: mov qword ptr [rsp + 0x50], r9
0x1006a8d44: call 0x100aa21b0 ; 0x100aa21b0 __Z14TessellateDownItEbP17TessVertInterfaceRK12TessMeshInfoPKvjPT_PvPjSA_jf
0x1006a8d49: mov r14d, eax
0x1006a8d4c: call 0x1007c6c20 ; 0x1007c6c20
0x1006a8d51: lea rcx, [rip + 0x199fdf8] ; 0x102048b50
0x1006a8d58: mov rdx, qword ptr [rcx]
0x1006a8d5b: mov esi, 0x80000
0x1006a8d60: mov ecx, 2
0x1006a8d65: mov rdi, rax
0x1006a8d68: call 0x100795530 ; 0x100795530
0x1006a8d6d: mov esi, dword ptr [rsp + 0x20]
0x1006a8d71: mov rcx, qword ptr [rsp + 0x38]
0x1006a8d76: lea r8, [rcx + 0xe10]
0x1006a8d7d: mov r9d, dword ptr [rcx + 0xe08]
0x1006a8d84: lea rcx, [rsp + 0xc0]
0x1006a8d8c: mov qword ptr [rsp + 8], rcx
0x1006a8d91: mov qword ptr [rsp + 0x28], rax
0x1006a8d96: mov qword ptr [rsp], rax
0x1006a8d9a: mov ecx, 0x28
0x1006a8d9f: mov rdi, rbx
0x1006a8da2: mov rdx, qword ptr [rsp + 0x50]
0x1006a8da7: call 0x1006a7280 ; 0x1006a7280
0x1006a8dac: mov dword ptr [rsp + 0x20], eax
0x1006a8db0: mov rdi, qword ptr [rsp + 0x30]
0x1006a8db5: call 0x1007e9280 ; 0x1007e9280
0x1006a8dba: test r14b, r14b
0x1006a8dbd: je 0x1006a8ebe
0x1006a8dc3: mov rdi, qword ptr [rsp + 0x30]
0x1006a8dc8: call 0x1007e91c0 ; 0x1007e91c0
0x1006a8dcd: lea rbx, [r12 + r13 + 0x20]
0x1006a8dd2: mov rax, qword ptr [rsp + 0x38]
0x1006a8dd7: lea rdi, [rax + 0x4b8]
0x1006a8dde: mov eax, dword ptr [rsp + 0x24]
0x1006a8de2: shl rax, 3
0x1006a8de6: lea rdx, [rax + rax*4]
0x1006a8dea: mov rsi, rbx
0x1006a8ded: call 0x10077e5d0 ; 0x10077e5d0
0x1006a8df2: mov rdi, qword ptr [rbx]
0x1006a8df5: mov eax, dword ptr [rsp + 0x24]
0x1006a8df9: shl rax, 3
0x1006a8dfd: lea rdx, [rax + rax*4]
0x1006a8e01: mov rsi, qword ptr [rsp + 0x50]
0x1006a8e06: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1006a8e0b: mov eax, dword ptr [rsp + 0x24]
0x1006a8e0f: mov rcx, qword ptr [rsp + 0x68]
0x1006a8e14: mov dword ptr [rcx], eax
0x1006a8e16: mov rdi, qword ptr [rsp + 0x38]
0x1006a8e1b: add rdi, 0x4f0
0x1006a8e22: lea rbx, [r12 + r13 + 0x30]
0x1006a8e27: mov edx, dword ptr [rsp + 0x20]
0x1006a8e2b: add rdx, rdx
0x1006a8e2e: mov rsi, rbx
0x1006a8e31: call 0x10077e5d0 ; 0x10077e5d0
0x1006a8e36: mov rdi, qword ptr [rbx]
0x1006a8e39: mov edx, dword ptr [rsp + 0x20]
0x1006a8e3d: add rdx, rdx
0x1006a8e40: mov rsi, qword ptr [rsp + 0x28]
0x1006a8e45: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1006a8e4a: lea rax, [r12 + r13 + 0x48]
0x1006a8e4f: xor ecx, ecx
0x1006a8e51: xor edx, edx
0x1006a8e53: jmp 0x1006a8e89 ; 0x1006a8e89
0x1006a8e55: nop word ptr cs:[rax + rax]
0x1006a8e60: add edx, dword ptr [rsp + rcx + 0xc0]
0x1006a8e67: mov esi, edx
0x1006a8e69: add rsi, rsi
0x1006a8e6c: add rsi, qword ptr [rbx]
0x1006a8e6f: mov qword ptr [rax + rcx*4 - 8], rsi
0x1006a8e74: mov esi, dword ptr [rsp + rcx + 0xc4]
0x1006a8e7b: mov dword ptr [rax + rcx*4], esi
0x1006a8e7e: add edx, dword ptr [rsp + rcx + 0xc4]
0x1006a8e85: add rcx, 8
0x1006a8e89: mov esi, edx
0x1006a8e8b: add rsi, rsi
0x1006a8e8e: add rsi, qword ptr [rbx]
0x1006a8e91: mov qword ptr [rax + rcx*4 - 0x18], rsi
0x1006a8e96: mov esi, dword ptr [rsp + rcx + 0xc0]
0x1006a8e9d: mov dword ptr [rax + rcx*4 - 0x10], esi
0x1006a8ea1: cmp rcx, 0xe8
0x1006a8ea8: jne 0x1006a8e60
0x1006a8eaa: mov rdi, qword ptr [rsp + 0x30]
0x1006a8eaf: call 0x1007e9280 ; 0x1007e9280
0x1006a8eb4: mov rax, qword ptr [rsp + 0x40]
0x1006a8eb9: inc word ptr [rax + r15*2]
0x1006a8ebe: call 0x1007c6c20 ; 0x1007c6c20
0x1006a8ec3: mov rdi, rax
0x1006a8ec6: mov rsi, qword ptr [rsp + 0x28]
0x1006a8ecb: call 0x100795a70 ; 0x100795a70
0x1006a8ed0: lea rdi, [rsp + 0x48]
0x1006a8ed5: call 0x1007e9480 ; 0x1007e9480
0x1006a8eda: mov rax, qword ptr [rip + 0x5649f7] ; 0x100c0d8d8
0x1006a8ee1: mov rax, qword ptr [rax]
0x1006a8ee4: cmp rax, qword ptr [rsp + 0x1c0]
0x1006a8eec: jne 0x1006a8efd
0x1006a8eee: lea rsp, [rbp - 0x28]
0x1006a8ef2: pop rbx
0x1006a8ef3: pop r12
0x1006a8ef5: pop r13
0x1006a8ef7: pop r14
0x1006a8ef9: pop r15
0x1006a8efb: pop rbp
0x1006a8efc: ret 
0x1006a8efd: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1006a8f02: jmp 0x1006a8f2d ; 0x1006a8f2d
0x1006a8f04: jmp 0x1006a8f28 ; 0x1006a8f28
0x1006a8f06: mov rbx, rax
0x1006a8f09: lea rdi, [rsp + 0xc0]
0x1006a8f11: call 0x1007e9480 ; 0x1007e9480
0x1006a8f16: mov rdi, rbx
0x1006a8f19: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a8f1e: jmp 0x1006a8f28 ; 0x1006a8f28
0x1006a8f20: mov rdi, rax
0x1006a8f23: call 0x100011bf0 ; 0x100011bf0
0x1006a8f28: mov rbx, rax
0x1006a8f2b: jmp 0x1006a8f42 ; 0x1006a8f42
0x1006a8f2d: mov rbx, rax
0x1006a8f30: call 0x1007c6c20 ; 0x1007c6c20
0x1006a8f35: mov rdi, rax
0x1006a8f38: mov rsi, qword ptr [rsp + 0x28]
0x1006a8f3d: call 0x100795a70 ; 0x100795a70
0x1006a8f42: lea rdi, [rsp + 0x48]
0x1006a8f47: call 0x1007e9480 ; 0x1007e9480
0x1006a8f4c: mov rdi, rbx
0x1006a8f4f: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a8f54: mov rdi, rax
0x1006a8f57: call 0x100011bf0 ; 0x100011bf0
0x1006a8f5c: nop dword ptr [rax]
