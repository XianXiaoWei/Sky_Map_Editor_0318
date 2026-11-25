0x10027a7c0: push rbp
0x10027a7c1: mov rbp, rsp
0x10027a7c4: push r15
0x10027a7c6: push r14
0x10027a7c8: push r13
0x10027a7ca: push r12
0x10027a7cc: push rbx
0x10027a7cd: sub rsp, 0xf8
0x10027a7d4: mov dword ptr [rbp - 0x7c], r9d
0x10027a7d8: mov r14, r8
0x10027a7db: mov r13, rcx
0x10027a7de: mov qword ptr [rbp - 0x78], rsi
0x10027a7e2: mov rbx, rdi
0x10027a7e5: mov eax, dword ptr [rbp + 0x10]
0x10027a7e8: mov dword ptr [rbx + 0x20], eax
0x10027a7eb: mov qword ptr [rbx + 0x28], r14
0x10027a7ef: mov rax, qword ptr [rbx]
0x10027a7f2: lea r15, [rbp - 0x120]
0x10027a7f9: mov rdi, r15
0x10027a7fc: mov rsi, rbx
0x10027a7ff: call qword ptr [rax + 0x18]
0x10027a802: mov rax, qword ptr [rbx]
0x10027a805: lea r12, [rbp - 0xc0]
0x10027a80c: mov rdi, r12
0x10027a80f: mov rsi, rbx
0x10027a812: call qword ptr [rax + 0x20]
0x10027a815: lea rdi, [rbp - 0x70]
0x10027a819: mov rsi, r15
0x10027a81c: mov rdx, r12
0x10027a81f: call 0x100076df0 ; 0x100076df0
0x10027a824: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10027a829: vmovaps xmmword ptr [rbx + 0x80], xmm0
0x10027a831: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x10027a836: vmovaps xmmword ptr [rbx + 0x90], xmm0
0x10027a83e: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x10027a843: vmovaps xmmword ptr [rbx + 0xa0], xmm0
0x10027a84b: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x10027a850: vmovaps xmmword ptr [rbx + 0xb0], xmm0
0x10027a858: vmovaps xmm0, xmmword ptr [rbp - 0x120]
0x10027a860: vmovaps xmm1, xmmword ptr [rbp - 0x110]
0x10027a868: vmovaps xmm2, xmmword ptr [rbp - 0x100]
0x10027a870: lea rsi, [rbx + 0x40]
0x10027a874: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x10027a879: vmovaps xmmword ptr [rbx + 0x50], xmm1
0x10027a87e: vmovaps xmmword ptr [rbx + 0x60], xmm2
0x10027a883: lea rdi, [rbp - 0x70]
0x10027a887: vmovss xmm0, dword ptr [rip + 0x82d035] ; 0x100aa78c4
0x10027a88f: call 0x10078a070 ; 0x10078a070
0x10027a894: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10027a899: vmovaps xmmword ptr [rbx + 0x70], xmm0
0x10027a89e: vmovaps xmmword ptr [rbx + 0xc0], xmm0
0x10027a8a6: movabs rax, 0x3f8000003f800000
0x10027a8b0: mov qword ptr [rbx + 0xd0], rax
0x10027a8b7: mov dword ptr [rbx + 0xd8], 0x3f800000
0x10027a8c1: mov byte ptr [rbx + 0x198], 0
0x10027a8c8: mov dword ptr [rbx + 0x104], 0
0x10027a8d2: mov dword ptr [rbx + 0xe0], 0xffffffff
0x10027a8dc: mov qword ptr [rbx + 0x10], r13
0x10027a8e0: mov eax, dword ptr [rbp - 0x7c]
0x10027a8e3: mov dword ptr [rbx + 0x140], eax
0x10027a8e9: vmovaps xmm0, xmmword ptr [rip + 0xab0b9f] ; 0x100d2b490
0x10027a8f1: vmovaps xmmword ptr [rbx + 0x150], xmm0
0x10027a8f9: lea rax, [rip + 0x1d899f0] ; 0x1020042f0
0x10027a900: vmovaps xmm0, xmmword ptr [rax]
0x10027a904: vmovaps xmmword ptr [rbx + 0x160], xmm0
0x10027a90c: vxorps xmm0, xmm0, xmm0
0x10027a910: vmovups xmmword ptr [rbx + 0x178], xmm0
0x10027a918: mov rax, qword ptr [rbp - 0x78]
0x10027a91c: mov qword ptr [rbx + 0x18], rax
0x10027a920: mov dword ptr [rbx + 0x188], 1
0x10027a92a: mov rax, qword ptr [r14]
0x10027a92d: mov rdi, r14
0x10027a930: call qword ptr [rax + 0x30]
0x10027a933: mov dword ptr [rbx + 0x18c], eax
0x10027a939: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10027a93e: vcvtsi2ss xmm0, xmm3, eax
0x10027a942: vmulss xmm0, xmm0, dword ptr [rip + 0x82c7a6] ; 0x100aa70f0
0x10027a94a: vmovss dword ptr [rbx + 0x34], xmm0
0x10027a94f: mov rdi, qword ptr [rbx + 0x28]
0x10027a953: mov qword ptr [rbp - 0x60], 0
0x10027a95b: mov byte ptr [rbp - 0x70], 0x1c
0x10027a95f: movabs rax, 0x726f6c6f43657375
0x10027a969: mov qword ptr [rbp - 0x69], rax
0x10027a96d: movabs rax, 0x7375666669645f75
0x10027a977: mov qword ptr [rbp - 0x6f], rax
0x10027a97b: mov byte ptr [rbp - 0x61], 0
0x10027a97f: vmovaps xmm0, xmmword ptr [rbx + 0x150]
0x10027a987: vmovaps xmmword ptr [rbp - 0xe0], xmm0
0x10027a98f: lea rdx, [rbp - 0x70]
0x10027a993: lea rcx, [rbp - 0xe0]
0x10027a99a: xor esi, esi
0x10027a99c: vxorps xmm0, xmm0, xmm0
0x10027a9a0: call 0x1003fff20 ; 0x1003fff20
0x10027a9a5: test byte ptr [rbp - 0x70], 1
0x10027a9a9: je 0x10027a9bf
0x10027a9ab: mov r14, qword ptr [rbp - 0x60]
0x10027a9af: call 0x1007e50d0 ; 0x1007e50d0
0x10027a9b4: mov rdi, rax
0x10027a9b7: mov rsi, r14
0x10027a9ba: call 0x1007e5db0 ; 0x1007e5db0
0x10027a9bf: mov r14, qword ptr [rbx + 0x28]
0x10027a9c3: test byte ptr [r14 + 0xb8], 1
0x10027a9cb: jne 0x10027a9d9
0x10027a9cd: lea rdi, [r14 + 0xb8]
0x10027a9d4: inc rdi
0x10027a9d7: jmp 0x10027a9e0 ; 0x10027a9e0
0x10027a9d9: mov rdi, qword ptr [r14 + 0xc8]
0x10027a9e0: lea rsi, [rip + 0x902695] ; 0x100b7d07c DarkStone
0x10027a9e7: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10027a9ec: test eax, eax
0x10027a9ee: sete byte ptr [rbx + 0x30]
0x10027a9f2: je 0x10027aa0d
0x10027a9f4: mov rax, qword ptr [rbx + 0x10]
0x10027a9f8: test rax, rax
0x10027a9fb: je 0x10027abf3
0x10027aa01: cmp byte ptr [rax + 0x38], 0
0x10027aa05: setne al
0x10027aa08: jmp 0x10027abf5 ; 0x10027abf5
0x10027aa0d: vxorps xmm0, xmm0, xmm0
0x10027aa11: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x10027aa16: mov qword ptr [rbp - 0x60], 0
0x10027aa1e: mov byte ptr [rbp - 0x70], 0x14
0x10027aa22: movabs rax, 0x6f70537865745f75
0x10027aa2c: mov qword ptr [rbp - 0x6f], rax
0x10027aa30: mov word ptr [rbp - 0x67], 0x7374
0x10027aa36: mov byte ptr [rbp - 0x65], 0
0x10027aa3a: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x10027aa42: mov qword ptr [rbp - 0xb0], 0
0x10027aa4d: mov byte ptr [rbp - 0xc0], 0x16
0x10027aa54: movabs rax, 0x746f705372656544
0x10027aa5e: mov qword ptr [rbp - 0xbf], rax
0x10027aa65: mov dword ptr [rbp - 0xb7], 0x786554
0x10027aa6f: lea rdx, [rbp - 0x70]
0x10027aa73: lea rcx, [rbp - 0xc0]
0x10027aa7a: xor esi, esi
0x10027aa7c: mov rdi, r14
0x10027aa7f: call 0x1003fffc0 ; 0x1003fffc0
0x10027aa84: test byte ptr [rbp - 0xc0], 1
0x10027aa8b: je 0x10027aaa4
0x10027aa8d: mov r14, qword ptr [rbp - 0xb0]
0x10027aa94: call 0x1007e50d0 ; 0x1007e50d0
0x10027aa99: mov rdi, rax
0x10027aa9c: mov rsi, r14
0x10027aa9f: call 0x1007e5db0 ; 0x1007e5db0
0x10027aaa4: test byte ptr [rbp - 0x70], 1
0x10027aaa8: je 0x10027aabe
0x10027aaaa: mov r14, qword ptr [rbp - 0x60]
0x10027aaae: call 0x1007e50d0 ; 0x1007e50d0
0x10027aab3: mov rdi, rax
0x10027aab6: mov rsi, r14
0x10027aab9: call 0x1007e5db0 ; 0x1007e5db0
0x10027aabe: mov rdi, qword ptr [rbx + 0x28]
0x10027aac2: vxorps xmm0, xmm0, xmm0
0x10027aac6: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x10027aacb: mov qword ptr [rbp - 0x60], 0
0x10027aad3: mov byte ptr [rbp - 0x70], 0x10
0x10027aad7: movabs rax, 0x6c616d726f6e5f75
0x10027aae1: mov qword ptr [rbp - 0x6f], rax
0x10027aae5: mov byte ptr [rbp - 0x67], 0
0x10027aae9: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x10027aaf1: mov qword ptr [rbp - 0xb0], 0
0x10027aafc: mov byte ptr [rbp - 0xc0], 0x1e
0x10027ab03: movabs rax, 0x786554726f4e656e
0x10027ab0d: mov qword ptr [rbp - 0xb8], rax
0x10027ab14: movabs rax, 0x6e6f74736b726144
0x10027ab1e: mov qword ptr [rbp - 0xbf], rax
0x10027ab25: mov byte ptr [rbp - 0xb0], 0
0x10027ab2c: lea rdx, [rbp - 0x70]
0x10027ab30: lea rcx, [rbp - 0xc0]
0x10027ab37: xor esi, esi
0x10027ab39: call 0x1003fffc0 ; 0x1003fffc0
0x10027ab3e: test byte ptr [rbp - 0xc0], 1
0x10027ab45: je 0x10027ab5e
0x10027ab47: mov r14, qword ptr [rbp - 0xb0]
0x10027ab4e: call 0x1007e50d0 ; 0x1007e50d0
0x10027ab53: mov rdi, rax
0x10027ab56: mov rsi, r14
0x10027ab59: call 0x1007e5db0 ; 0x1007e5db0
0x10027ab5e: test byte ptr [rbp - 0x70], 1
0x10027ab62: je 0x10027ab78
0x10027ab64: mov r14, qword ptr [rbp - 0x60]
0x10027ab68: call 0x1007e50d0 ; 0x1007e50d0
0x10027ab6d: mov rdi, rax
0x10027ab70: mov rsi, r14
0x10027ab73: call 0x1007e5db0 ; 0x1007e5db0
0x10027ab78: mov rdi, qword ptr [rbx + 0x28]
0x10027ab7c: vxorps xmm0, xmm0, xmm0
0x10027ab80: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x10027ab85: mov qword ptr [rbp - 0x60], 0
0x10027ab8d: mov byte ptr [rbp - 0x70], 0x18
0x10027ab91: movabs rax, 0x4373746f70735f75
0x10027ab9b: mov qword ptr [rbp - 0x6f], rax
0x10027ab9f: mov dword ptr [rbp - 0x67], 0x726f6c6f
0x10027aba6: mov byte ptr [rbp - 0x63], 0
0x10027abaa: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x10027abb2: lea rdx, [rbp - 0x70]
0x10027abb6: lea rcx, [rbp - 0xd0]
0x10027abbd: xor esi, esi
0x10027abbf: vxorps xmm0, xmm0, xmm0
0x10027abc3: call 0x1003fff20 ; 0x1003fff20
0x10027abc8: test byte ptr [rbp - 0x70], 1
0x10027abcc: je 0x10027abe2
0x10027abce: mov r14, qword ptr [rbp - 0x60]
0x10027abd2: call 0x1007e50d0 ; 0x1007e50d0
0x10027abd7: mov rdi, rax
0x10027abda: mov rsi, r14
0x10027abdd: call 0x1007e5db0 ; 0x1007e5db0
0x10027abe2: mov r14, qword ptr [rbx + 0x28]
0x10027abe6: mov rax, qword ptr [rbx + 0x10]
0x10027abea: test rax, rax
0x10027abed: jne 0x10027aa01
0x10027abf3: mov al, 1
0x10027abf5: movzx esi, al
0x10027abf8: mov rdi, r14
0x10027abfb: call 0x1003ffe50 ; 0x1003ffe50
0x10027ac00: mov rax, qword ptr [rbx + 0x10]
0x10027ac04: test rax, rax
0x10027ac07: je 0x10027ac1d
0x10027ac09: cmp byte ptr [rax + 0x38], 0
0x10027ac0d: vxorps xmm0, xmm0, xmm0
0x10027ac11: je 0x10027ac21
0x10027ac13: vmovss xmm0, dword ptr [rip + 0x82a4a5] ; 0x100aa50c0
0x10027ac1b: jmp 0x10027ac21 ; 0x10027ac21
0x10027ac1d: vxorps xmm0, xmm0, xmm0
0x10027ac21: vmovss dword ptr [rbx + 0x190], xmm0
0x10027ac29: mov eax, dword ptr [rbx + 0x20]
0x10027ac2c: vcvtsi2ss xmm0, xmm3, rax
0x10027ac31: vmulss xmm0, xmm0, dword ptr [rip + 0x82daa3] ; 0x100aa86dc
0x10027ac39: vmovss xmm1, dword ptr [rip + 0x82a47f] ; 0x100aa50c0
0x10027ac41: vminss xmm0, xmm1, xmm0
0x10027ac45: vsubss xmm1, xmm1, xmm0
0x10027ac49: vmulss xmm1, xmm1, dword ptr [rip + 0x82f857] ; 0x100aaa4a8
0x10027ac51: vmulss xmm0, xmm0, dword ptr [rip + 0x82ea1b] ; 0x100aa9674
0x10027ac59: vaddss xmm0, xmm0, xmm1
0x10027ac5d: vmulss xmm0, xmm0, dword ptr [rip + 0x82c48f] ; 0x100aa70f4
0x10027ac65: vmovss dword ptr [rbp - 0x78], xmm0
0x10027ac6a: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x10027ac6f: vcvtsi2ss xmm0, xmm3, eax
0x10027ac73: vmulss xmm0, xmm0, dword ptr [rip + 0x82c475] ; 0x100aa70f0
0x10027ac7b: vmovss xmm1, dword ptr [rip + 0x82a43d] ; 0x100aa50c0
0x10027ac83: vsubss xmm1, xmm1, xmm0
0x10027ac87: vmulss xmm1, xmm1, dword ptr [rip + 0x82d93d] ; 0x100aa85cc
0x10027ac8f: vmulss xmm0, xmm0, dword ptr [rip + 0x82e545] ; 0x100aa91dc
0x10027ac97: vaddss xmm0, xmm0, xmm1
0x10027ac9b: vmulss xmm0, xmm0, dword ptr [rbp - 0x78]
0x10027aca0: vmovss dword ptr [rbx + 0x194], xmm0
0x10027aca8: mov rax, qword ptr [rbx + 0x10]
0x10027acac: test rax, rax
0x10027acaf: je 0x10027ace3
0x10027acb1: cmp byte ptr [rax + 0x20], 0
0x10027acb5: je 0x10027ace3
0x10027acb7: mov rax, qword ptr [rax + 8]
0x10027acbb: test rax, rax
0x10027acbe: je 0x10027ace3
0x10027acc0: mov eax, dword ptr [rax + 0x10]
0x10027acc3: cmp eax, 2
0x10027acc6: jb 0x10027ace3
0x10027acc8: mov eax, eax
0x10027acca: vcvtsi2ss xmm1, xmm3, rax
0x10027accf: vmulss xmm1, xmm1, dword ptr [rip + 0x8298e1] ; 0x100aa45b8
0x10027acd7: vmulss xmm0, xmm0, xmm1
0x10027acdb: vmovss dword ptr [rbx + 0x194], xmm0
0x10027ace3: mov qword ptr [rbx + 0x170], 0
0x10027acee: add rsp, 0xf8
0x10027acf5: pop rbx
0x10027acf6: pop r12
0x10027acf8: pop r13
0x10027acfa: pop r14
0x10027acfc: pop r15
0x10027acfe: pop rbp
0x10027acff: ret 
0x10027ad00: mov rdi, rax
0x10027ad03: call 0x100011bf0 ; 0x100011bf0
0x10027ad08: mov r14, rax
0x10027ad0b: test byte ptr [rbp - 0x70], 1
0x10027ad0f: je 0x10027ae20
0x10027ad15: mov rbx, qword ptr [rbp - 0x60]
0x10027ad19: call 0x1007e50d0 ; 0x1007e50d0
0x10027ad1e: mov rdi, rax
0x10027ad21: mov rsi, rbx
0x10027ad24: call 0x1007e5db0 ; 0x1007e5db0
0x10027ad29: jmp 0x10027ae20 ; 0x10027ae20
0x10027ad2e: mov rdi, rax
0x10027ad31: call 0x100011bf0 ; 0x100011bf0
0x10027ad36: mov rdi, rax
0x10027ad39: call 0x100011bf0 ; 0x100011bf0
0x10027ad3e: mov rdi, rax
0x10027ad41: call 0x100011bf0 ; 0x100011bf0
0x10027ad46: mov r14, rax
0x10027ad49: test byte ptr [rbp - 0xc0], 1
0x10027ad50: je 0x10027ad69
0x10027ad52: mov rbx, qword ptr [rbp - 0xb0]
0x10027ad59: call 0x1007e50d0 ; 0x1007e50d0
0x10027ad5e: mov rdi, rax
0x10027ad61: mov rsi, rbx
0x10027ad64: call 0x1007e5db0 ; 0x1007e5db0
0x10027ad69: test byte ptr [rbp - 0x70], 1
0x10027ad6d: je 0x10027ae20
0x10027ad73: mov rbx, qword ptr [rbp - 0x60]
0x10027ad77: call 0x1007e50d0 ; 0x1007e50d0
0x10027ad7c: mov rdi, rax
0x10027ad7f: mov rsi, rbx
0x10027ad82: call 0x1007e5db0 ; 0x1007e5db0
0x10027ad87: jmp 0x10027ae20 ; 0x10027ae20
0x10027ad8c: mov rdi, rax
0x10027ad8f: call 0x100011bf0 ; 0x100011bf0
0x10027ad94: mov rdi, rax
0x10027ad97: call 0x100011bf0 ; 0x100011bf0
0x10027ad9c: mov rdi, rax
0x10027ad9f: call 0x100011bf0 ; 0x100011bf0
0x10027ada4: mov rdi, rax
0x10027ada7: call 0x100011bf0 ; 0x100011bf0
0x10027adac: mov r14, rax
0x10027adaf: test byte ptr [rbp - 0xc0], 1
0x10027adb6: je 0x10027adcf
0x10027adb8: mov rbx, qword ptr [rbp - 0xb0]
0x10027adbf: call 0x1007e50d0 ; 0x1007e50d0
0x10027adc4: mov rdi, rax
0x10027adc7: mov rsi, rbx
0x10027adca: call 0x1007e5db0 ; 0x1007e5db0
0x10027adcf: test byte ptr [rbp - 0x70], 1
0x10027add3: je 0x10027ae20
0x10027add5: mov rbx, qword ptr [rbp - 0x60]
0x10027add9: call 0x1007e50d0 ; 0x1007e50d0
0x10027adde: mov rdi, rax
0x10027ade1: mov rsi, rbx
0x10027ade4: call 0x1007e5db0 ; 0x1007e5db0
0x10027ade9: jmp 0x10027ae20 ; 0x10027ae20
0x10027adeb: mov rdi, rax
0x10027adee: call 0x100011bf0 ; 0x100011bf0
0x10027adf3: mov rdi, rax
0x10027adf6: call 0x100011bf0 ; 0x100011bf0
0x10027adfb: mov rdi, rax
0x10027adfe: call 0x100011bf0 ; 0x100011bf0
0x10027ae03: mov r14, rax
0x10027ae06: test byte ptr [rbp - 0x70], 1
0x10027ae0a: je 0x10027ae20
0x10027ae0c: mov rbx, qword ptr [rbp - 0x60]
0x10027ae10: call 0x1007e50d0 ; 0x1007e50d0
0x10027ae15: mov rdi, rax
0x10027ae18: mov rsi, rbx
0x10027ae1b: call 0x1007e5db0 ; 0x1007e5db0
0x10027ae20: mov rdi, r14
0x10027ae23: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10027ae28: mov rdi, rax
0x10027ae2b: call 0x100011bf0 ; 0x100011bf0
