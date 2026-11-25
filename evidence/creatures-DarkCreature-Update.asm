0x10026bbc0: push rbp
0x10026bbc1: mov rbp, rsp
0x10026bbc4: push r15
0x10026bbc6: push r14
0x10026bbc8: push r13
0x10026bbca: push r12
0x10026bbcc: push rbx
0x10026bbcd: sub rsp, 0x68
0x10026bbd1: mov qword ptr [rbp - 0x60], r9
0x10026bbd5: mov r13, r8
0x10026bbd8: mov r14, rcx
0x10026bbdb: mov rbx, rdx
0x10026bbde: mov r15, rdi
0x10026bbe1: vmovss xmm0, dword ptr [rsi + 0x14]
0x10026bbe6: vmovss xmm1, dword ptr [rsi + 0x20]
0x10026bbeb: lea rax, [rip + 0x1d8f4de] ; 0x101ffb0d0
0x10026bbf2: cmp byte ptr [rax], 0
0x10026bbf5: je 0x10026bc04
0x10026bbf7: lea rax, [rip + 0xa4c942] ; 0x100cb8540
0x10026bbfe: vmovss xmm2, dword ptr [rax]
0x10026bc02: jmp 0x10026bc0c ; 0x10026bc0c
0x10026bc04: vmovss xmm2, dword ptr [rip + 0x8394b4] ; 0x100aa50c0
0x10026bc0c: vmulss xmm1, xmm1, xmm2
0x10026bc10: vmulss xmm0, xmm0, xmm1
0x10026bc14: vmovss xmm1, dword ptr [rip + 0x83ae80] ; 0x100aa6a9c
0x10026bc1c: vmaxss xmm0, xmm1, xmm0
0x10026bc20: vmovss dword ptr [rbp - 0x30], xmm0
0x10026bc25: call 0x1007e8490 ; 0x1007e8490
0x10026bc2a: vmovq xmm0, rax
0x10026bc2f: vpunpckldq xmm0, xmm0, xmmword ptr [rip + 0x83a259] ; 0x100aa5e90
0x10026bc37: vsubpd xmm0, xmm0, xmmword ptr [rip + 0x83a261] ; 0x100aa5ea0
0x10026bc3f: vhaddpd xmm0, xmm0, xmm0
0x10026bc43: vdivsd xmm0, xmm0, qword ptr [rip + 0x84618d] ; 0x100ab1dd8
0x10026bc4b: vmovsd xmm1, qword ptr [rip + 0x848d6d] ; 0x100ab49c0
0x10026bc53: call 0x100aa273e ; 0x100aa273e _fmod
0x10026bc58: vmovsd qword ptr [rbp - 0x38], xmm0
0x10026bc5d: mov rdi, rbx
0x10026bc60: call 0x1000fc260 ; 0x1000fc260
0x10026bc65: test rax, rax
0x10026bc68: mov qword ptr [rbp - 0x58], rbx
0x10026bc6c: mov qword ptr [rbp - 0x78], r14
0x10026bc70: je 0x10026bc82
0x10026bc72: mov rdi, rbx
0x10026bc75: call 0x1000fc260 ; 0x1000fc260
0x10026bc7a: add rax, 0xe0
0x10026bc80: jmp 0x10026bc89 ; 0x10026bc89
0x10026bc82: lea rax, [rip + 0xabf797] ; 0x100d2b420
0x10026bc89: vmovss xmm0, dword ptr [rip + 0x83ae0f] ; 0x100aa6aa0
0x10026bc91: vminss xmm0, xmm0, dword ptr [rbp - 0x30]
0x10026bc96: cmp dword ptr [r15 + 0xc], 0
0x10026bc9b: vmovss dword ptr [rbp - 0x30], xmm0
0x10026bca0: mov qword ptr [rbp - 0x48], r13
0x10026bca4: je 0x10026c165
0x10026bcaa: mov eax, dword ptr [rax]
0x10026bcac: mov dword ptr [rbp - 0x70], eax
0x10026bcaf: vmovsd xmm1, qword ptr [rbp - 0x38]
0x10026bcb4: vcvtsd2ss xmm1, xmm1, xmm1
0x10026bcb8: vmovss dword ptr [rbp - 0x3c], xmm1
0x10026bcbd: vmulss xmm1, xmm0, dword ptr [rip + 0x83cceb] ; 0x100aa89b0
0x10026bcc5: vmovss dword ptr [rbp - 0x64], xmm1
0x10026bcca: vminss xmm0, xmm0, dword ptr [rip + 0x83fb6a] ; 0x100aab83c
0x10026bcd2: vmovss dword ptr [rbp - 0x4c], xmm0
0x10026bcd7: xor r12d, r12d
0x10026bcda: nop word ptr [rax + rax]
0x10026bce0: mov r12d, r12d
0x10026bce3: imul r14, r12, 0x2f0
0x10026bcea: lea rdi, [r15 + r14 + 0x10]
0x10026bcef: movzx eax, byte ptr [r15 + r14 + 0x2d7]
0x10026bcf8: cmp byte ptr [r15 + r14 + 0x2ec], 0
0x10026bd01: mov qword ptr [rbp - 0x38], rdi
0x10026bd05: mov byte ptr [rbp - 0x29], al
0x10026bd08: je 0x10026be80
0x10026bd0e: mov rax, qword ptr [rbp + 0x48]
0x10026bd12: mov rdi, qword ptr [rax + 0x40]
0x10026bd16: call 0x1004a0a20 ; 0x1004a0a20
0x10026bd1b: mov rdi, qword ptr [rbp + 0x50]
0x10026bd1f: test al, al
0x10026bd21: je 0x10026bed0
0x10026bd27: call 0x100410c90 ; 0x100410c90
0x10026bd2c: mov rbx, rax
0x10026bd2f: mov rdi, qword ptr [rbp - 0x38]
0x10026bd33: vmovss xmm0, dword ptr [rbp - 0x30]
0x10026bd38: mov r13, qword ptr [rbp - 0x58]
0x10026bd3c: mov rsi, r13
0x10026bd3f: mov rdx, qword ptr [rbp - 0x60]
0x10026bd43: mov rax, qword ptr [rbp + 0x10]
0x10026bd47: mov rcx, rax
0x10026bd4a: mov rax, qword ptr [rbp + 0x20]
0x10026bd4e: mov r8, rax
0x10026bd51: call 0x10026d2a0 ; 0x10026d2a0
0x10026bd56: mov rdi, qword ptr [rbp - 0x38]
0x10026bd5a: vmovss xmm0, dword ptr [rbp - 0x30]
0x10026bd5f: vmovss xmm1, dword ptr [rbp - 0x3c]
0x10026bd64: mov rsi, r13
0x10026bd67: mov r13, qword ptr [rbp - 0x48]
0x10026bd6b: mov rdx, qword ptr [rbp - 0x60]
0x10026bd6f: mov rcx, qword ptr [rbp + 0x10]
0x10026bd73: mov r8, qword ptr [rbp + 0x20]
0x10026bd77: mov r9, qword ptr [rbp + 0x28]
0x10026bd7b: push qword ptr [rbp + 0x60]
0x10026bd7e: push qword ptr [rbp + 0x58]
0x10026bd81: push r13
0x10026bd83: push qword ptr [rbp + 0x40]
0x10026bd86: push qword ptr [rbp + 0x18]
0x10026bd89: push qword ptr [rbp + 0x30]
0x10026bd8c: call 0x10026ddb0 ; 0x10026ddb0
0x10026bd91: add rsp, 0x30
0x10026bd95: movzx eax, byte ptr [r15 + r14 + 0x2d3]
0x10026bd9e: lea rcx, [r12 + r12*4]
0x10026bda2: mov byte ptr [rbx + rcx*4 + 0xd3a], al
0x10026bda9: movzx eax, byte ptr [r15 + r14 + 0x2d5]
0x10026bdb2: mov byte ptr [rbx + rcx*4 + 0xd3b], al
0x10026bdb9: movzx eax, byte ptr [r15 + r14 + 0x2d6]
0x10026bdc2: mov byte ptr [rbx + rcx*4 + 0xd3c], al
0x10026bdc9: mov eax, dword ptr [r15 + r14 + 0x2e4]
0x10026bdd1: mov dword ptr [rbx + rcx*4 + 0xd40], eax
0x10026bdd8: mov rax, qword ptr [rbp - 0x38]
0x10026bddc: movzx eax, byte ptr [rax + 0x2c7]
0x10026bde3: mov byte ptr [rbx + rcx*4 + 0xd38], al
0x10026bdea: mov eax, dword ptr [r15 + r14 + 0x2d8]
0x10026bdf2: mov dword ptr [rbx + rcx*4 + 0xd30], eax
0x10026bdf9: mov eax, dword ptr [r15 + r14 + 0x2dc]
0x10026be01: mov dword ptr [rbx + rcx*4 + 0xd34], eax
0x10026be08: movzx eax, byte ptr [r15 + r14 + 0x2e0]
0x10026be11: mov byte ptr [rbx + rcx*4 + 0xd39], al
0x10026be18: movzx ebx, byte ptr [rbp - 0x29]
0x10026be1c: cmp bl, 1
0x10026be1f: je 0x10026c158
0x10026be25: mov rax, qword ptr [rbp - 0x38]
0x10026be29: cmp byte ptr [rax + 0x2c7], 1
0x10026be30: jne 0x10026c158
0x10026be36: mov eax, dword ptr [rbp - 0x70]
0x10026be39: cmp dword ptr [r15 + r14 + 0x2d8], eax
0x10026be41: jne 0x10026c158
0x10026be47: mov rax, qword ptr [rbp + 0x60]
0x10026be4b: mov rbx, qword ptr [rax + 0x240]
0x10026be52: mov esi, 0x1b
0x10026be57: mov rdi, rbx
0x10026be5a: call 0x1000438e0 ; 0x1000438e0
0x10026be5f: vaddss xmm0, xmm0, dword ptr [rip + 0x839259] ; 0x100aa50c0
0x10026be67: mov esi, 0x1b
0x10026be6c: mov rdi, rbx
0x10026be6f: call 0x100044920 ; 0x100044920
0x10026be74: jmp 0x10026c158 ; 0x10026c158
0x10026be79: nop dword ptr [rax]
0x10026be80: vmovss xmm0, dword ptr [rbp - 0x30]
0x10026be85: mov rbx, qword ptr [rbp - 0x58]
0x10026be89: mov rsi, rbx
0x10026be8c: mov r13, qword ptr [rbp - 0x60]
0x10026be90: mov rdx, r13
0x10026be93: mov rax, qword ptr [rbp + 0x10]
0x10026be97: mov rcx, rax
0x10026be9a: mov rax, qword ptr [rbp + 0x20]
0x10026be9e: mov r8, rax
0x10026bea1: call 0x10026d2a0 ; 0x10026d2a0
0x10026bea6: mov rdi, qword ptr [rbp - 0x38]
0x10026beaa: vmovss xmm0, dword ptr [rbp - 0x30]
0x10026beaf: vmovss xmm1, dword ptr [rbp - 0x3c]
0x10026beb4: mov rsi, rbx
0x10026beb7: movzx ebx, byte ptr [rbp - 0x29]
0x10026bebb: mov rdx, r13
0x10026bebe: mov r13, qword ptr [rbp - 0x48]
0x10026bec2: jmp 0x10026c129 ; 0x10026c129
0x10026bec7: nop word ptr [rax + rax]
0x10026bed0: call 0x100410ca0 ; 0x100410ca0
0x10026bed5: mov r13, rax
0x10026bed8: lea rbx, [r12 + r12*4]
0x10026bedc: movzx eax, byte ptr [r13 + rbx*4 + 0xd3a]
0x10026bee5: mov byte ptr [r15 + r14 + 0x2d3], al
0x10026beed: movzx ecx, byte ptr [r15 + r14 + 0x2d5]
0x10026bef6: movzx eax, byte ptr [r13 + rbx*4 + 0xd3b]
0x10026beff: mov byte ptr [r15 + r14 + 0x2d5], al
0x10026bf07: cmp cl, al
0x10026bf09: je 0x10026bf17
0x10026bf0b: movzx esi, al
0x10026bf0e: mov rdi, qword ptr [rbp - 0x38]
0x10026bf12: call 0x10026d0f0 ; 0x10026d0f0
0x10026bf17: movzx eax, byte ptr [r13 + rbx*4 + 0xd3c]
0x10026bf20: mov byte ptr [r15 + r14 + 0x2d6], al
0x10026bf28: vmovss xmm0, dword ptr [r15 + r14 + 0x2e8]
0x10026bf32: vmovss xmm2, dword ptr [r13 + rbx*4 + 0xd40]
0x10026bf3c: vsubss xmm0, xmm0, xmm2
0x10026bf40: vandps xmm0, xmm0, xmmword ptr [rip + 0x83b9c8] ; 0x100aa7910
0x10026bf48: vmovss xmm1, dword ptr [rip + 0x83b974] ; 0x100aa78c4
0x10026bf50: vucomiss xmm1, xmm0
0x10026bf54: jae 0x10026bfeb
0x10026bf5a: lea rcx, [r15 + r14 + 0x2e8]
0x10026bf62: vmovss xmm3, dword ptr [r15 + r14 + 0x2e4]
0x10026bf6c: vsubss xmm0, xmm3, xmm2
0x10026bf70: vandps xmm0, xmm0, xmmword ptr [rip + 0x83b998] ; 0x100aa7910
0x10026bf78: vmovss xmm1, dword ptr [rip + 0x83f8bc] ; 0x100aab83c
0x10026bf80: vucomiss xmm1, xmm0
0x10026bf84: jbe 0x10026bfd2
0x10026bf86: vmovss xmm0, dword ptr [rbp - 0x64]
0x10026bf8b: vmovss dword ptr [rbp - 0x6c], xmm2
0x10026bf90: mov qword ptr [rbp - 0x80], rcx
0x10026bf94: vmovss dword ptr [rbp - 0x68], xmm3
0x10026bf99: call 0x100aa2708 ; 0x100aa2708 _expf
0x10026bf9e: mov rcx, qword ptr [rbp - 0x80]
0x10026bfa2: vmovss xmm1, dword ptr [rip + 0x839116] ; 0x100aa50c0
0x10026bfaa: vsubss xmm0, xmm1, xmm0
0x10026bfae: vxorps xmm2, xmm2, xmm2
0x10026bfb2: vmaxss xmm0, xmm2, xmm0
0x10026bfb6: vmovss xmm2, dword ptr [rbp - 0x6c]
0x10026bfbb: vminss xmm0, xmm1, xmm0
0x10026bfbf: vsubss xmm1, xmm1, xmm0
0x10026bfc3: vmulss xmm1, xmm1, dword ptr [rbp - 0x68]
0x10026bfc8: vmulss xmm0, xmm2, xmm0
0x10026bfcc: vaddss xmm0, xmm0, xmm1
0x10026bfd0: jmp 0x10026bfe2 ; 0x10026bfe2
0x10026bfd2: test al, al
0x10026bfd4: je 0x10026bfdd
0x10026bfd6: vaddss xmm0, xmm3, dword ptr [rbp - 0x4c]
0x10026bfdb: jmp 0x10026bfe2 ; 0x10026bfe2
0x10026bfdd: vsubss xmm0, xmm3, dword ptr [rbp - 0x4c]
0x10026bfe2: vmovss dword ptr [rcx - 4], xmm0
0x10026bfe7: vmovss dword ptr [rcx], xmm2
0x10026bfeb: movzx eax, byte ptr [r13 + rbx*4 + 0xd38]
0x10026bff4: mov rcx, qword ptr [rbp - 0x38]
0x10026bff8: mov byte ptr [rcx + 0x2c7], al
0x10026bffe: mov eax, dword ptr [r13 + rbx*4 + 0xd30]
0x10026c006: mov dword ptr [r15 + r14 + 0x2d8], eax
0x10026c00e: mov eax, dword ptr [r13 + rbx*4 + 0xd34]
0x10026c016: mov dword ptr [r15 + r14 + 0x2dc], eax
0x10026c01e: movzx ecx, byte ptr [r15 + r14 + 0x2e0]
0x10026c027: movzx eax, byte ptr [r13 + rbx*4 + 0xd39]
0x10026c030: mov byte ptr [r15 + r14 + 0x2e0], al
0x10026c038: test cl, cl
0x10026c03a: jne 0x10026c0c8
0x10026c040: test al, al
0x10026c042: je 0x10026c0c8
0x10026c048: mov dword ptr [r15 + r14 + 0x190], 0x41200000
0x10026c054: mov rsi, qword ptr [r15 + r14 + 0x218]
0x10026c05c: lea rdi, [rbp - 0x90]
0x10026c063: call 0x1007f2a00 ; 0x1007f2a00
0x10026c068: vmovaps xmm0, xmmword ptr [rbp - 0x90]
0x10026c070: vmovaps xmmword ptr [r15 + r14 + 0x1a0], xmm0
0x10026c07a: mov dword ptr [r15 + r14 + 0x150], 0
0x10026c086: mov dword ptr [r15 + r14 + 0x110], 0
0x10026c092: vmovaps xmm0, xmmword ptr [rip + 0x83bec6] ; 0x100aa7f60
0x10026c09a: vmulps xmm0, xmm0, xmmword ptr [r15 + r14 + 0xb0]
0x10026c0a4: vmovaps xmmword ptr [r15 + r14 + 0xb0], xmm0
0x10026c0ae: mov dword ptr [r15 + r14 + 0x2f0], 4
0x10026c0ba: mov r13, qword ptr [rbp - 0x48]
0x10026c0be: mov rdi, qword ptr [rbp - 0x38]
0x10026c0c2: movzx ebx, byte ptr [rbp - 0x29]
0x10026c0c6: jmp 0x10026c117 ; 0x10026c117
0x10026c0c8: test cl, cl
0x10026c0ca: mov r13, qword ptr [rbp - 0x48]
0x10026c0ce: mov rdi, qword ptr [rbp - 0x38]
0x10026c0d2: movzx ebx, byte ptr [rbp - 0x29]
0x10026c0d6: je 0x10026c117
0x10026c0d8: test al, al
0x10026c0da: jne 0x10026c117
0x10026c0dc: lea rax, [r15 + r14 + 0x2e0]
0x10026c0e4: mov byte ptr [rax], 0
0x10026c0e7: mov dword ptr [r15 + r14 + 0x150], 0
0x10026c0f3: mov dword ptr [r15 + r14 + 0x188], 0
0x10026c0ff: mov dword ptr [r15 + r14 + 0x110], 0x40800000
0x10026c10b: mov dword ptr [r15 + r14 + 0x2f0], 0
0x10026c117: vmovss xmm0, dword ptr [rbp - 0x30]
0x10026c11c: vmovss xmm1, dword ptr [rbp - 0x3c]
0x10026c121: mov rsi, qword ptr [rbp - 0x58]
0x10026c125: mov rdx, qword ptr [rbp - 0x60]
0x10026c129: mov rcx, qword ptr [rbp + 0x10]
0x10026c12d: mov r8, qword ptr [rbp + 0x20]
0x10026c131: mov r9, qword ptr [rbp + 0x28]
0x10026c135: push qword ptr [rbp + 0x60]
0x10026c138: push qword ptr [rbp + 0x58]
0x10026c13b: push r13
0x10026c13d: push qword ptr [rbp + 0x40]
0x10026c140: push qword ptr [rbp + 0x18]
0x10026c143: push qword ptr [rbp + 0x30]
0x10026c146: call 0x10026ddb0 ; 0x10026ddb0
0x10026c14b: add rsp, 0x30
0x10026c14f: cmp bl, 1
0x10026c152: jne 0x10026be25
0x10026c158: inc r12d
0x10026c15b: cmp r12d, dword ptr [r15 + 0xc]
0x10026c15f: jb 0x10026bce0
0x10026c165: cmp dword ptr [r15 + 0x1790], 0
0x10026c16d: mov r13, qword ptr [rbp - 0x58]
0x10026c171: je 0x10026c1a9
0x10026c173: xor ebx, ebx
0x10026c175: nop word ptr cs:[rax + rax]
0x10026c180: mov eax, ebx
0x10026c182: imul rax, rax, 0x110
0x10026c189: lea rdi, [r15 + rax + 0x17a0]
0x10026c191: mov rsi, r13
0x10026c194: vmovss xmm0, dword ptr [rbp - 0x30]
0x10026c199: call 0x1005b77d0 ; 0x1005b77d0
0x10026c19e: inc ebx
0x10026c1a0: cmp ebx, dword ptr [r15 + 0x1790]
0x10026c1a7: jb 0x10026c180
0x10026c1a9: cmp dword ptr [r15 + 0x5ba0], 0
0x10026c1b1: mov r12, qword ptr [rbp - 0x78]
0x10026c1b5: mov r14, qword ptr [rbp - 0x48]
0x10026c1b9: je 0x10026c1f6
0x10026c1bb: xor ebx, ebx
0x10026c1bd: nop dword ptr [rax]
0x10026c1c0: mov eax, ebx
0x10026c1c2: imul rax, rax, 0x270
0x10026c1c9: lea rdi, [r15 + rax + 0x5bb0]
0x10026c1d1: mov rsi, r15
0x10026c1d4: mov rdx, r12
0x10026c1d7: mov rcx, r14
0x10026c1da: mov r8, qword ptr [rbp + 0x38]
0x10026c1de: mov r9, r13
0x10026c1e1: vmovss xmm0, dword ptr [rbp - 0x30]
0x10026c1e6: call 0x1005b7ed0 ; 0x1005b7ed0
0x10026c1eb: inc ebx
0x10026c1ed: cmp ebx, dword ptr [r15 + 0x5ba0]
0x10026c1f4: jb 0x10026c1c0
0x10026c1f6: add rsp, 0x68
0x10026c1fa: pop rbx
0x10026c1fb: pop r12
0x10026c1fd: pop r13
0x10026c1ff: pop r14
0x10026c201: pop r15
0x10026c203: pop rbp
0x10026c204: ret 
0x10026c205: nop word ptr cs:[rax + rax]
