0x10055d820: push rbp
0x10055d821: mov rbp, rsp
0x10055d824: push r15
0x10055d826: push r14
0x10055d828: push r13
0x10055d82a: push r12
0x10055d82c: push rbx
0x10055d82d: sub rsp, 0x88
0x10055d834: mov rbx, rdx
0x10055d837: mov r13, rsi
0x10055d83a: mov r14, rdi
0x10055d83d: vmovaps xmm0, xmmword ptr [r13]
0x10055d843: vmovaps xmmword ptr [rbp - 0xa0], xmm0
0x10055d84b: cmp dword ptr [r14 + 0x28], 1
0x10055d850: mov qword ptr [rbp - 0x50], rbx
0x10055d854: jne 0x10055d878
0x10055d856: xor r15d, r15d
0x10055d859: vmovss xmm2, dword ptr [rip + 0x55119f] ; 0x100aaea00
0x10055d861: mov edi, 1
0x10055d866: xor esi, esi
0x10055d868: cmp byte ptr [r14 + 0x2c], 0
0x10055d86d: jne 0x10055d8ef
0x10055d873: jmp 0x10055d929 ; 0x10055d929
0x10055d878: mov qword ptr [rbp - 0x80], r13
0x10055d87c: vmovss xmm2, dword ptr [rip + 0x55117c] ; 0x100aaea00
0x10055d884: xor r15d, r15d
0x10055d887: lea r12, [rbp - 0xa0]
0x10055d88e: xor ebx, ebx
0x10055d890: vmovaps xmmword ptr [rbp - 0x40], xmm2
0x10055d895: mov rax, qword ptr [r14 + 0x90]
0x10055d89c: mov esi, ebx
0x10055d89e: shl rsi, 4
0x10055d8a2: add rsi, rax
0x10055d8a5: lea r13d, [rbx + 1]
0x10055d8a9: mov rdx, r13
0x10055d8ac: shl rdx, 4
0x10055d8b0: add rdx, rax
0x10055d8b3: mov rdi, r12
0x10055d8b6: call 0x100789ac0 ; 0x100789ac0
0x10055d8bb: vmovaps xmm2, xmmword ptr [rbp - 0x40]
0x10055d8c0: vucomiss xmm2, xmm0
0x10055d8c4: vcmpnless xmm1, xmm0, xmm2
0x10055d8c9: vblendvps xmm2, xmm0, xmm2, xmm1
0x10055d8cf: cmovae r15d, ebx
0x10055d8d3: mov edi, dword ptr [r14 + 0x28]
0x10055d8d7: lea eax, [rdi - 1]
0x10055d8da: mov ebx, r13d
0x10055d8dd: cmp r13d, eax
0x10055d8e0: jb 0x10055d890
0x10055d8e2: mov esi, eax
0x10055d8e4: mov r13, qword ptr [rbp - 0x80]
0x10055d8e8: cmp byte ptr [r14 + 0x2c], 0
0x10055d8ed: je 0x10055d929
0x10055d8ef: mov rdx, qword ptr [r14 + 0x90]
0x10055d8f6: shl rsi, 4
0x10055d8fa: add rsi, rdx
0x10055d8fd: lea rdi, [rbp - 0xa0]
0x10055d904: vmovaps xmmword ptr [rbp - 0x40], xmm2
0x10055d909: call 0x100789ac0 ; 0x100789ac0
0x10055d90e: vmovaps xmm1, xmmword ptr [rbp - 0x40]
0x10055d913: vucomiss xmm1, xmm0
0x10055d917: mov eax, dword ptr [r14 + 0x28]
0x10055d91b: jae 0x10055d922
0x10055d91d: mov rdi, rax
0x10055d920: jmp 0x10055d929 ; 0x10055d929
0x10055d922: mov rdi, rax
0x10055d925: lea r15d, [rax - 1]
0x10055d929: mov rbx, rdi
0x10055d92c: lea r8d, [rbx - 1]
0x10055d930: lea eax, [r15 + 1]
0x10055d934: cmp r15d, r8d
0x10055d937: mov r12, qword ptr [r14 + 0x90]
0x10055d93e: mov ecx, 0
0x10055d943: cmovne rcx, rax
0x10055d947: shl rcx, 4
0x10055d94b: mov eax, r15d
0x10055d94e: mov rdx, rax
0x10055d951: shl rdx, 4
0x10055d955: vmovaps xmm0, xmmword ptr [r12 + rcx]
0x10055d95b: vmovaps xmm1, xmmword ptr [r12 + rdx]
0x10055d961: vsubps xmm0, xmm0, xmm1
0x10055d965: vmovaps xmm2, xmmword ptr [rbp - 0xa0]
0x10055d96d: vsubps xmm1, xmm2, xmm1
0x10055d971: vmulps xmm1, xmm0, xmm1
0x10055d975: vmovshdup xmm2, xmm1
0x10055d979: vaddss xmm2, xmm1, xmm2
0x10055d97d: vpermilpd xmm1, xmm1, 1
0x10055d983: vaddss xmm1, xmm1, xmm2
0x10055d987: vmulps xmm0, xmm0, xmm0
0x10055d98b: vmovshdup xmm2, xmm0
0x10055d98f: vaddss xmm2, xmm0, xmm2
0x10055d993: vpermilpd xmm0, xmm0, 1
0x10055d999: vaddss xmm0, xmm0, xmm2
0x10055d99d: vdivss xmm0, xmm1, xmm0
0x10055d9a1: vxorps xmm1, xmm1, xmm1
0x10055d9a5: vmaxss xmm0, xmm1, xmm0
0x10055d9a9: vmovss xmm1, dword ptr [rip + 0x54770f] ; 0x100aa50c0
0x10055d9b1: vminss xmm0, xmm1, xmm0
0x10055d9b5: movsx esi, byte ptr [r14 + 0x2c]
0x10055d9ba: test esi, esi
0x10055d9bc: je 0x10055dcfb
0x10055d9c2: mov qword ptr [rbp - 0x48], rbx
0x10055d9c6: lea ecx, [rbx + rsi - 1]
0x10055d9ca: vcvtsi2ss xmm2, xmm3, rcx
0x10055d9cf: vcvtsi2ss xmm1, xmm3, rax
0x10055d9d4: vaddss xmm0, xmm0, xmm1
0x10055d9d8: vdivss xmm0, xmm0, xmm2
0x10055d9dc: vmovss xmm1, dword ptr [rip + 0x549710] ; 0x100aa70f4
0x10055d9e4: vmovss dword ptr [rbp - 0x54], xmm2
0x10055d9e9: vdivss xmm1, xmm1, xmm2
0x10055d9ed: vsubss xmm2, xmm0, xmm1
0x10055d9f1: vaddss xmm0, xmm0, xmm1
0x10055d9f5: vmovss dword ptr [rbp - 0x5c], xmm2
0x10055d9fa: vsubss xmm0, xmm0, xmm2
0x10055d9fe: vmovss dword ptr [rbp - 0x58], xmm0
0x10055da03: vcvtsi2ss xmm10, xmm3, r8
0x10055da08: lea r9d, [rbx - 2]
0x10055da0c: vmovaps xmm0, xmmword ptr [r13]
0x10055da12: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x10055da1a: mov eax, ebx
0x10055da1c: vcvtsi2ss xmm0, xmm3, rax
0x10055da21: vmovss dword ptr [rbp - 0x2c], xmm0
0x10055da26: vxorps xmm12, xmm12, xmm12
0x10055da2b: vmovss xmm11, dword ptr [rip + 0x550fcd] ; 0x100aaea00
0x10055da33: vxorps xmm9, xmm9, xmm9
0x10055da38: xor ebx, ebx
0x10055da3a: mov r15, r8
0x10055da3d: mov r13, r9
0x10055da40: vmovss dword ptr [rbp - 0x30], xmm10
0x10055da45: nop word ptr cs:[rax + rax]
0x10055da50: vcvtsi2ss xmm0, xmm14, ebx
0x10055da54: vaddss xmm0, xmm0, dword ptr [rip + 0x546b5c] ; 0x100aa45b8
0x10055da5c: vmulss xmm0, xmm0, dword ptr [rbp - 0x58]
0x10055da61: vmulss xmm0, xmm0, dword ptr [rip + 0x54ef3b] ; 0x100aac9a4
0x10055da69: vaddss xmm13, xmm0, dword ptr [rbp - 0x5c]
0x10055da6e: vroundss xmm0, xmm13, xmm13, 9
0x10055da74: vsubss xmm0, xmm13, xmm0
0x10055da78: mov r14, rsi
0x10055da7b: test sil, sil
0x10055da7e: je 0x10055db20
0x10055da84: vmovss xmm1, dword ptr [rip + 0x547634] ; 0x100aa50c0
0x10055da8c: vmovaps xmmword ptr [rbp - 0x40], xmm9
0x10055da91: vmovss dword ptr [rbp - 0x80], xmm11
0x10055da96: vmovaps xmmword ptr [rbp - 0x70], xmm12
0x10055da9b: vmovaps xmmword ptr [rbp - 0x90], xmm13
0x10055daa3: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x10055daa8: vmovaps xmm13, xmmword ptr [rbp - 0x90]
0x10055dab0: vmovaps xmm12, xmmword ptr [rbp - 0x70]
0x10055dab5: vmovss xmm11, dword ptr [rbp - 0x80]
0x10055daba: vmovss xmm10, dword ptr [rbp - 0x30]
0x10055dabf: vmovaps xmm9, xmmword ptr [rbp - 0x40]
0x10055dac4: mov r9, r13
0x10055dac7: vaddss xmm1, xmm0, dword ptr [rip + 0x5475f1] ; 0x100aa50c0
0x10055dacf: vcmpltss xmm2, xmm0, dword ptr [rip + 0x54960c] ; 0x100aa70e4
0x10055dad8: vblendvps xmm0, xmm0, xmm1, xmm2
0x10055dade: vmovss xmm2, dword ptr [rbp - 0x2c]
0x10055dae3: vmulss xmm1, xmm0, xmm2
0x10055dae7: vcvttss2si rcx, xmm1
0x10055daec: lea eax, [rcx + 1]
0x10055daef: cmp r15d, ecx
0x10055daf2: mov edi, 0
0x10055daf7: cmove eax, edi
0x10055dafa: test ecx, ecx
0x10055dafc: mov edx, ecx
0x10055dafe: cmove edx, dword ptr [rbp - 0x48]
0x10055db02: dec edx
0x10055db04: lea esi, [rax + 1]
0x10055db07: cmp r9d, ecx
0x10055db0a: cmove esi, edi
0x10055db0d: vmovaps xmm1, xmm2
0x10055db11: jmp 0x10055db61 ; 0x10055db61
0x10055db13: nop word ptr cs:[rax + rax]
0x10055db20: vxorps xmm1, xmm1, xmm1
0x10055db24: vmaxss xmm0, xmm1, xmm0
0x10055db28: vmovss xmm1, dword ptr [rip + 0x547590] ; 0x100aa50c0
0x10055db30: vminss xmm0, xmm1, xmm0
0x10055db34: vmulss xmm1, xmm0, xmm10
0x10055db39: vcvttss2si rcx, xmm1
0x10055db3e: cmp r15d, ecx
0x10055db41: cmove ecx, r9d
0x10055db45: lea eax, [rcx + 1]
0x10055db48: lea edx, [rcx - 1]
0x10055db4b: test ecx, ecx
0x10055db4d: cmove edx, ecx
0x10055db50: xor esi, esi
0x10055db52: cmp eax, r15d
0x10055db55: setne sil
0x10055db59: lea esi, [rcx + rsi + 1]
0x10055db5d: vmovaps xmm1, xmm10
0x10055db61: vmulss xmm0, xmm0, xmm1
0x10055db65: mov ecx, ecx
0x10055db67: vcvtsi2ss xmm1, xmm14, rcx
0x10055db6c: vsubss xmm8, xmm0, xmm1
0x10055db70: mov edx, edx
0x10055db72: shl rdx, 4
0x10055db76: vmovaps xmm1, xmmword ptr [r12 + rdx]
0x10055db7c: shl rcx, 4
0x10055db80: vmovaps xmm2, xmmword ptr [r12 + rcx]
0x10055db86: mov eax, eax
0x10055db88: shl rax, 4
0x10055db8c: vmovaps xmm3, xmmword ptr [r12 + rax]
0x10055db92: mov eax, esi
0x10055db94: shl rax, 4
0x10055db98: vmovaps xmm4, xmmword ptr [r12 + rax]
0x10055db9e: vaddps xmm5, xmm2, xmm2
0x10055dba2: vsubps xmm6, xmm3, xmm1
0x10055dba6: vaddps xmm7, xmm1, xmm1
0x10055dbaa: vmulps xmm0, xmm2, xmmword ptr [rip + 0x549bce] ; 0x100aa7780
0x10055dbb2: vsubps xmm0, xmm7, xmm0
0x10055dbb6: vmulps xmm7, xmm3, xmmword ptr [rip + 0x54a392] ; 0x100aa7f50
0x10055dbbe: vaddps xmm0, xmm0, xmm7
0x10055dbc2: vsubps xmm0, xmm0, xmm4
0x10055dbc6: vmovaps xmm7, xmmword ptr [rip + 0x54a4b2] ; 0x100aa8080
0x10055dbce: vmulps xmm2, xmm2, xmm7
0x10055dbd2: vsubps xmm1, xmm2, xmm1
0x10055dbd6: vmulps xmm2, xmm3, xmm7
0x10055dbda: vsubps xmm1, xmm1, xmm2
0x10055dbde: vaddps xmm1, xmm4, xmm1
0x10055dbe2: vpermilps xmm2, xmm8, 0xc0
0x10055dbe8: vmulps xmm1, xmm2, xmm1
0x10055dbec: vaddps xmm0, xmm0, xmm1
0x10055dbf0: vmulps xmm0, xmm2, xmm0
0x10055dbf4: vaddps xmm0, xmm6, xmm0
0x10055dbf8: vmulps xmm0, xmm2, xmm0
0x10055dbfc: vaddps xmm0, xmm5, xmm0
0x10055dc00: vmulps xmm0, xmm0, xmmword ptr [rip + 0x549a68] ; 0x100aa7670
0x10055dc08: vmovaps xmm1, xmmword ptr [rbp - 0xb0]
0x10055dc10: vsubps xmm5, xmm1, xmm0
0x10055dc14: vmulps xmm0, xmm5, xmm5
0x10055dc18: vmovshdup xmm1, xmm0
0x10055dc1c: vaddss xmm1, xmm0, xmm1
0x10055dc20: vpermilpd xmm0, xmm0, 1
0x10055dc26: vaddss xmm0, xmm0, xmm1
0x10055dc2a: vucomiss xmm11, xmm0
0x10055dc2e: ja 0x10055dc34
0x10055dc30: vmovaps xmm5, xmm12
0x10055dc34: vminss xmm4, xmm0, xmm11
0x10055dc39: vcmpltss xmm0, xmm0, xmm11
0x10055dc3f: vblendvps xmm9, xmm9, xmm13, xmm0
0x10055dc45: inc ebx
0x10055dc47: vmovaps xmm11, xmm4
0x10055dc4b: vmovaps xmm12, xmm5
0x10055dc4f: cmp ebx, 0x10
0x10055dc52: mov rsi, r14
0x10055dc55: jne 0x10055da50
0x10055dc5b: vroundss xmm0, xmm9, xmm9, 9
0x10055dc61: vsubss xmm0, xmm9, xmm0
0x10055dc65: test sil, sil
0x10055dc68: vmovaps xmmword ptr [rbp - 0x40], xmm9
0x10055dc6d: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x10055dc72: je 0x10055dd1e
0x10055dc78: vmovss xmm1, dword ptr [rip + 0x547440] ; 0x100aa50c0
0x10055dc80: vmovaps xmmword ptr [rbp - 0x70], xmm5
0x10055dc85: vmovss dword ptr [rbp - 0x90], xmm4
0x10055dc8d: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x10055dc92: vmovss xmm4, dword ptr [rbp - 0x90]
0x10055dc9a: vmovaps xmm5, xmmword ptr [rbp - 0x70]
0x10055dc9f: mov rsi, r14
0x10055dca2: vmovss xmm10, dword ptr [rbp - 0x30]
0x10055dca7: vmovaps xmm9, xmmword ptr [rbp - 0x40]
0x10055dcac: mov r9, r13
0x10055dcaf: vaddss xmm1, xmm0, dword ptr [rip + 0x547409] ; 0x100aa50c0
0x10055dcb7: vxorps xmm2, xmm2, xmm2
0x10055dcbb: vcmpltss xmm2, xmm0, xmm2
0x10055dcc0: vblendvps xmm0, xmm0, xmm1, xmm2
0x10055dcc6: vmovss xmm2, dword ptr [rbp - 0x2c]
0x10055dccb: vmulss xmm1, xmm0, xmm2
0x10055dccf: vcvttss2si rcx, xmm1
0x10055dcd4: lea eax, [rcx + 1]
0x10055dcd7: xor r8d, r8d
0x10055dcda: cmp r15d, ecx
0x10055dcdd: cmove eax, r8d
0x10055dce1: test ecx, ecx
0x10055dce3: mov edx, ecx
0x10055dce5: cmove edx, dword ptr [rbp - 0x48]
0x10055dce9: dec edx
0x10055dceb: lea ebx, [rax + 1]
0x10055dcee: cmp r9d, ecx
0x10055dcf1: cmove ebx, r8d
0x10055dcf5: vmovaps xmm1, xmm2
0x10055dcf9: jmp 0x10055dd5e ; 0x10055dd5e
0x10055dcfb: test r15d, r15d
0x10055dcfe: jne 0x10055df5b
0x10055dd04: vxorps xmm9, xmm9, xmm9
0x10055dd09: vucomiss xmm9, xmm0
0x10055dd0d: jb 0x10055df5b
0x10055dd13: vmovaps xmm0, xmmword ptr [r12]
0x10055dd19: jmp 0x10055e265 ; 0x10055e265
0x10055dd1e: vxorps xmm1, xmm1, xmm1
0x10055dd22: vmaxss xmm0, xmm1, xmm0
0x10055dd26: vmovss xmm1, dword ptr [rip + 0x547392] ; 0x100aa50c0
0x10055dd2e: vminss xmm0, xmm1, xmm0
0x10055dd32: vmulss xmm1, xmm0, xmm10
0x10055dd37: vcvttss2si rcx, xmm1
0x10055dd3c: cmp r15d, ecx
0x10055dd3f: cmove ecx, r9d
0x10055dd43: lea eax, [rcx + 1]
0x10055dd46: lea edx, [rcx - 1]
0x10055dd49: test ecx, ecx
0x10055dd4b: cmove edx, ecx
0x10055dd4e: xor ebx, ebx
0x10055dd50: cmp eax, r15d
0x10055dd53: setne bl
0x10055dd56: lea ebx, [rcx + rbx + 1]
0x10055dd5a: vmovaps xmm1, xmm10
0x10055dd5e: vmulss xmm0, xmm0, xmm1
0x10055dd62: mov ecx, ecx
0x10055dd64: vcvtsi2ss xmm1, xmm14, rcx
0x10055dd69: vsubss xmm11, xmm0, xmm1
0x10055dd6d: mov edx, edx
0x10055dd6f: shl rdx, 4
0x10055dd73: vmovaps xmm1, xmmword ptr [r12 + rdx]
0x10055dd79: shl rcx, 4
0x10055dd7d: vmovaps xmm2, xmmword ptr [r12 + rcx]
0x10055dd83: mov eax, eax
0x10055dd85: shl rax, 4
0x10055dd89: vmovaps xmm3, xmmword ptr [r12 + rax]
0x10055dd8f: mov eax, ebx
0x10055dd91: shl rax, 4
0x10055dd95: vmovaps xmm0, xmmword ptr [r12 + rax]
0x10055dd9b: vsubps xmm8, xmm3, xmm1
0x10055dd9f: vaddps xmm6, xmm1, xmm1
0x10055dda3: vmulps xmm7, xmm2, xmmword ptr [rip + 0x5499d5] ; 0x100aa7780
0x10055ddab: vsubps xmm6, xmm6, xmm7
0x10055ddaf: vmulps xmm7, xmm3, xmmword ptr [rip + 0x54a199] ; 0x100aa7f50
0x10055ddb7: vaddps xmm6, xmm7, xmm6
0x10055ddbb: vsubps xmm6, xmm6, xmm0
0x10055ddbf: vaddps xmm6, xmm6, xmm6
0x10055ddc3: vmovaps xmm7, xmmword ptr [rip + 0x54a2b5] ; 0x100aa8080
0x10055ddcb: vmulps xmm2, xmm2, xmm7
0x10055ddcf: vsubps xmm1, xmm2, xmm1
0x10055ddd3: vmulps xmm2, xmm3, xmm7
0x10055ddd7: vsubps xmm1, xmm1, xmm2
0x10055dddb: vaddps xmm1, xmm0, xmm1
0x10055dddf: vpermilps xmm0, xmm11, 0xc0
0x10055dde5: vmulps xmm1, xmm0, xmm1
0x10055dde9: vmulps xmm1, xmm1, xmm7
0x10055dded: vaddps xmm1, xmm6, xmm1
0x10055ddf1: vmulps xmm0, xmm0, xmm1
0x10055ddf5: vaddps xmm0, xmm8, xmm0
0x10055ddf9: vmulps xmm0, xmm0, xmmword ptr [rip + 0x54986f] ; 0x100aa7670
0x10055de01: vmulps xmm1, xmm0, xmm0
0x10055de05: vmovshdup xmm2, xmm1
0x10055de09: vaddss xmm2, xmm1, xmm2
0x10055de0d: vpermilpd xmm1, xmm1, 1
0x10055de13: vaddss xmm1, xmm1, xmm2
0x10055de17: vxorps xmm2, xmm2, xmm2
0x10055de1b: vucomiss xmm1, xmm2
0x10055de1f: jbe 0x10055deea
0x10055de25: vsqrtss xmm11, xmm4, xmm4
0x10055de29: vsqrtss xmm1, xmm1, xmm1
0x10055de2d: vmulps xmm0, xmm5, xmm0
0x10055de31: vmovshdup xmm2, xmm0
0x10055de35: vaddss xmm2, xmm0, xmm2
0x10055de39: vpermilpd xmm0, xmm0, 1
0x10055de3f: vaddss xmm0, xmm0, xmm2
0x10055de43: vdivss xmm0, xmm0, xmm1
0x10055de47: vdivss xmm0, xmm0, xmm1
0x10055de4b: vdivss xmm0, xmm0, dword ptr [rbp - 0x54]
0x10055de50: vaddss xmm0, xmm9, xmm0
0x10055de54: vroundss xmm1, xmm0, xmm0, 9
0x10055de5a: vsubss xmm9, xmm0, xmm1
0x10055de5e: test sil, sil
0x10055de61: je 0x10055df8f
0x10055de67: vmovaps xmm0, xmm9
0x10055de6b: vmovss xmm1, dword ptr [rip + 0x54724d] ; 0x100aa50c0
0x10055de73: vmovss dword ptr [rbp - 0x40], xmm11
0x10055de78: vmovaps xmmword ptr [rbp - 0x70], xmm9
0x10055de7d: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x10055de82: vmovaps xmm9, xmmword ptr [rbp - 0x70]
0x10055de87: vmovss xmm11, dword ptr [rbp - 0x40]
0x10055de8c: mov rsi, r14
0x10055de8f: vmovss xmm10, dword ptr [rbp - 0x30]
0x10055de94: mov r9, r13
0x10055de97: vaddss xmm1, xmm0, dword ptr [rip + 0x547221] ; 0x100aa50c0
0x10055de9f: vxorps xmm2, xmm2, xmm2
0x10055dea3: vcmpltss xmm2, xmm0, xmm2
0x10055dea8: vblendvps xmm0, xmm0, xmm1, xmm2
0x10055deae: vmovss xmm2, dword ptr [rbp - 0x2c]
0x10055deb3: vmulss xmm1, xmm0, xmm2
0x10055deb7: vcvttss2si rax, xmm1
0x10055debc: lea ecx, [rax + 1]
0x10055debf: xor r8d, r8d
0x10055dec2: cmp r15d, eax
0x10055dec5: cmove ecx, r8d
0x10055dec9: test eax, eax
0x10055decb: mov edx, eax
0x10055decd: mov r14, qword ptr [rbp - 0x48]
0x10055ded1: cmove edx, r14d
0x10055ded5: dec edx
0x10055ded7: lea ebx, [rcx + 1]
0x10055deda: cmp r9d, eax
0x10055dedd: cmove ebx, r8d
0x10055dee1: vmovaps xmm1, xmm2
0x10055dee5: jmp 0x10055dfd4 ; 0x10055dfd4
0x10055deea: test sil, sil
0x10055deed: je 0x10055e122
0x10055def3: vmovaps xmm0, xmm9
0x10055def7: vmovss xmm1, dword ptr [rip + 0x5471c1] ; 0x100aa50c0
0x10055deff: mov rbx, r9
0x10055df02: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x10055df07: vmovaps xmm9, xmmword ptr [rbp - 0x40]
0x10055df0c: vaddss xmm1, xmm0, dword ptr [rip + 0x5471ac] ; 0x100aa50c0
0x10055df14: vxorps xmm2, xmm2, xmm2
0x10055df18: vcmpltss xmm2, xmm0, xmm2
0x10055df1d: vblendvps xmm0, xmm0, xmm1, xmm2
0x10055df23: vmovss xmm2, dword ptr [rbp - 0x2c]
0x10055df28: vmulss xmm1, xmm0, xmm2
0x10055df2c: vcvttss2si rdx, xmm1
0x10055df31: lea eax, [rdx + 1]
0x10055df34: xor edi, edi
0x10055df36: cmp r15d, edx
0x10055df39: cmove eax, edi
0x10055df3c: test edx, edx
0x10055df3e: mov rsi, qword ptr [rbp - 0x48]
0x10055df42: cmovne esi, edx
0x10055df45: dec esi
0x10055df47: lea ecx, [rax + 1]
0x10055df4a: cmp ebx, edx
0x10055df4c: cmove ecx, edi
0x10055df4f: mov r9d, edx
0x10055df52: vmovaps xmm10, xmm2
0x10055df56: jmp 0x10055e164 ; 0x10055e164
0x10055df5b: vucomiss xmm0, dword ptr [rip + 0x54715d] ; 0x100aa50c0
0x10055df63: mov rbx, rdi
0x10055df66: jb 0x10055d9c2
0x10055df6c: lea ecx, [rbx - 2]
0x10055df6f: cmp r15d, ecx
0x10055df72: jne 0x10055d9c2
0x10055df78: shl r8, 4
0x10055df7c: vmovaps xmm0, xmmword ptr [r12 + r8]
0x10055df82: vmovss xmm9, dword ptr [rip + 0x547136] ; 0x100aa50c0
0x10055df8a: jmp 0x10055e265 ; 0x10055e265
0x10055df8f: vxorps xmm0, xmm0, xmm0
0x10055df93: vmaxss xmm0, xmm0, xmm9
0x10055df98: vmovss xmm1, dword ptr [rip + 0x547120] ; 0x100aa50c0
0x10055dfa0: vminss xmm0, xmm1, xmm0
0x10055dfa4: vmulss xmm1, xmm0, xmm10
0x10055dfa9: vcvttss2si rax, xmm1
0x10055dfae: cmp r15d, eax
0x10055dfb1: cmove eax, r9d
0x10055dfb5: lea ecx, [rax + 1]
0x10055dfb8: lea edx, [rax - 1]
0x10055dfbb: test eax, eax
0x10055dfbd: cmove edx, eax
0x10055dfc0: xor ebx, ebx
0x10055dfc2: cmp ecx, r15d
0x10055dfc5: setne bl
0x10055dfc8: lea ebx, [rax + rbx + 1]
0x10055dfcc: vmovaps xmm1, xmm10
0x10055dfd0: mov r14, qword ptr [rbp - 0x48]
0x10055dfd4: vmulss xmm0, xmm0, xmm1
0x10055dfd8: mov edx, edx
0x10055dfda: shl rdx, 4
0x10055dfde: mov eax, eax
0x10055dfe0: vcvtsi2ss xmm1, xmm13, rax
0x10055dfe5: shl rax, 4
0x10055dfe9: mov ecx, ecx
0x10055dfeb: shl rcx, 4
0x10055dfef: mov ebx, ebx
0x10055dff1: shl rbx, 4
0x10055dff5: vsubss xmm0, xmm0, xmm1
0x10055dff9: vmovaps xmm1, xmmword ptr [r12 + rdx]
0x10055dfff: vmovaps xmm2, xmmword ptr [r12 + rax]
0x10055e005: vmovaps xmm3, xmmword ptr [r12 + rcx]
0x10055e00b: vmovaps xmm4, xmmword ptr [r12 + rbx]
0x10055e011: vaddps xmm8, xmm2, xmm2
0x10055e015: vsubps xmm6, xmm3, xmm1
0x10055e019: vaddps xmm7, xmm1, xmm1
0x10055e01d: vmulps xmm5, xmm2, xmmword ptr [rip + 0x54975b] ; 0x100aa7780
0x10055e025: vsubps xmm5, xmm7, xmm5
0x10055e029: vmulps xmm7, xmm3, xmmword ptr [rip + 0x549f1f] ; 0x100aa7f50
0x10055e031: vaddps xmm5, xmm5, xmm7
0x10055e035: vsubps xmm5, xmm5, xmm4
0x10055e039: vmovaps xmm7, xmmword ptr [rip + 0x54a03f] ; 0x100aa8080
0x10055e041: vmulps xmm2, xmm2, xmm7
0x10055e045: vsubps xmm1, xmm2, xmm1
0x10055e049: vmulps xmm2, xmm3, xmm7
0x10055e04d: vsubps xmm1, xmm1, xmm2
0x10055e051: vaddps xmm1, xmm4, xmm1
0x10055e055: vpermilps xmm0, xmm0, 0xc0
0x10055e05b: vmulps xmm1, xmm0, xmm1
0x10055e05f: vaddps xmm1, xmm5, xmm1
0x10055e063: vmulps xmm1, xmm0, xmm1
0x10055e067: vaddps xmm1, xmm6, xmm1
0x10055e06b: vmulps xmm0, xmm0, xmm1
0x10055e06f: vaddps xmm0, xmm8, xmm0
0x10055e073: vmulps xmm0, xmm0, xmmword ptr [rip + 0x5495f5] ; 0x100aa7670
0x10055e07b: vmovaps xmm1, xmmword ptr [rbp - 0xb0]
0x10055e083: vsubps xmm0, xmm1, xmm0
0x10055e087: vmulps xmm0, xmm0, xmm0
0x10055e08b: vmovshdup xmm1, xmm0
0x10055e08f: vaddss xmm1, xmm0, xmm1
0x10055e093: vpermilpd xmm0, xmm0, 1
0x10055e099: vaddss xmm0, xmm0, xmm1
0x10055e09d: vmulss xmm1, xmm11, xmm11
0x10055e0a2: vcmpltss xmm0, xmm1, xmm0
0x10055e0a7: vblendvps xmm9, xmm9, xmmword ptr [rbp - 0x80], xmm0
0x10055e0ae: test sil, sil
0x10055e0b1: je 0x10055e179
0x10055e0b7: vmovaps xmm0, xmm9
0x10055e0bb: vmovss xmm1, dword ptr [rip + 0x546ffd] ; 0x100aa50c0
0x10055e0c3: mov rbx, r9
0x10055e0c6: vmovaps xmmword ptr [rbp - 0x40], xmm9
0x10055e0cb: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x10055e0d0: vmovaps xmm9, xmmword ptr [rbp - 0x40]
0x10055e0d5: vaddss xmm1, xmm0, dword ptr [rip + 0x546fe3] ; 0x100aa50c0
0x10055e0dd: vxorps xmm2, xmm2, xmm2
0x10055e0e1: vcmpltss xmm2, xmm0, xmm2
0x10055e0e6: vblendvps xmm0, xmm0, xmm1, xmm2
0x10055e0ec: vmovss xmm2, dword ptr [rbp - 0x2c]
0x10055e0f1: vmulss xmm1, xmm0, xmm2
0x10055e0f5: vcvttss2si rdx, xmm1
0x10055e0fa: lea eax, [rdx + 1]
0x10055e0fd: xor esi, esi
0x10055e0ff: cmp r15d, edx
0x10055e102: cmove eax, esi
0x10055e105: test edx, edx
0x10055e107: cmovne r14d, edx
0x10055e10b: dec r14d
0x10055e10e: lea ecx, [rax + 1]
0x10055e111: cmp ebx, edx
0x10055e113: cmove ecx, esi
0x10055e116: mov r9d, edx
0x10055e119: vmovaps xmm10, xmm2
0x10055e11d: jmp 0x10055e1bb ; 0x10055e1bb
0x10055e122: vxorps xmm0, xmm0, xmm0
0x10055e126: vmaxss xmm0, xmm0, xmm9
0x10055e12b: vmovss xmm1, dword ptr [rip + 0x546f8d] ; 0x100aa50c0
0x10055e133: vminss xmm0, xmm1, xmm0
0x10055e137: vmulss xmm1, xmm0, xmm10
0x10055e13c: vcvttss2si rax, xmm1
0x10055e141: cmp r15d, eax
0x10055e144: cmovne r9d, eax
0x10055e148: lea eax, [r9 + 1]
0x10055e14c: lea esi, [r9 - 1]
0x10055e150: test r9d, r9d
0x10055e153: cmove esi, r9d
0x10055e157: xor ecx, ecx
0x10055e159: cmp eax, r15d
0x10055e15c: setne cl
0x10055e15f: lea ecx, [r9 + rcx + 1]
0x10055e164: vmulss xmm0, xmm0, xmm10
0x10055e169: mov edx, r9d
0x10055e16c: vcvtsi2ss xmm1, xmm13, rdx
0x10055e171: vsubss xmm8, xmm0, xmm1
0x10055e175: mov esi, esi
0x10055e177: jmp 0x10055e1cf ; 0x10055e1cf
0x10055e179: vxorps xmm0, xmm0, xmm0
0x10055e17d: vmaxss xmm0, xmm0, xmm9
0x10055e182: vmovss xmm1, dword ptr [rip + 0x546f36] ; 0x100aa50c0
0x10055e18a: vminss xmm0, xmm1, xmm0
0x10055e18e: vmulss xmm1, xmm0, xmm10
0x10055e193: vcvttss2si rax, xmm1
0x10055e198: cmp r15d, eax
0x10055e19b: cmovne r9d, eax
0x10055e19f: lea eax, [r9 + 1]
0x10055e1a3: lea r14d, [r9 - 1]
0x10055e1a7: test r9d, r9d
0x10055e1aa: cmove r14d, r9d
0x10055e1ae: xor ecx, ecx
0x10055e1b0: cmp eax, r15d
0x10055e1b3: setne cl
0x10055e1b6: lea ecx, [r9 + rcx + 1]
0x10055e1bb: vmulss xmm0, xmm0, xmm10
0x10055e1c0: mov edx, r9d
0x10055e1c3: vcvtsi2ss xmm1, xmm12, rdx
0x10055e1c8: vsubss xmm8, xmm0, xmm1
0x10055e1cc: mov esi, r14d
0x10055e1cf: shl rsi, 4
0x10055e1d3: vmovaps xmm1, xmmword ptr [r12 + rsi]
0x10055e1d9: shl rdx, 4
0x10055e1dd: vmovaps xmm2, xmmword ptr [r12 + rdx]
0x10055e1e3: mov eax, eax
0x10055e1e5: shl rax, 4
0x10055e1e9: vmovaps xmm3, xmmword ptr [r12 + rax]
0x10055e1ef: mov eax, ecx
0x10055e1f1: shl rax, 4
0x10055e1f5: vmovaps xmm4, xmmword ptr [r12 + rax]
0x10055e1fb: vaddps xmm5, xmm2, xmm2
0x10055e1ff: vsubps xmm6, xmm3, xmm1
0x10055e203: vaddps xmm7, xmm1, xmm1
0x10055e207: vmulps xmm0, xmm2, xmmword ptr [rip + 0x549571] ; 0x100aa7780
0x10055e20f: vsubps xmm0, xmm7, xmm0
0x10055e213: vmulps xmm7, xmm3, xmmword ptr [rip + 0x549d35] ; 0x100aa7f50
0x10055e21b: vaddps xmm0, xmm0, xmm7
0x10055e21f: vsubps xmm0, xmm0, xmm4
0x10055e223: vmovaps xmm7, xmmword ptr [rip + 0x549e55] ; 0x100aa8080
0x10055e22b: vmulps xmm2, xmm2, xmm7
0x10055e22f: vsubps xmm1, xmm2, xmm1
0x10055e233: vmulps xmm2, xmm3, xmm7
0x10055e237: vsubps xmm1, xmm1, xmm2
0x10055e23b: vaddps xmm1, xmm4, xmm1
0x10055e23f: vpermilps xmm2, xmm8, 0xc0
0x10055e245: vmulps xmm1, xmm2, xmm1
0x10055e249: vaddps xmm0, xmm0, xmm1
0x10055e24d: vmulps xmm0, xmm2, xmm0
0x10055e251: vaddps xmm0, xmm6, xmm0
0x10055e255: vmulps xmm0, xmm2, xmm0
0x10055e259: vaddps xmm0, xmm5, xmm0
0x10055e25d: vmulps xmm0, xmm0, xmmword ptr [rip + 0x54940b] ; 0x100aa7670
0x10055e265: mov rax, qword ptr [rbp - 0x50]
0x10055e269: vmovaps xmmword ptr [rax], xmm0
0x10055e26d: vmovaps xmm0, xmm9
0x10055e271: add rsp, 0x88
0x10055e278: pop rbx
0x10055e279: pop r12
0x10055e27b: pop r13
0x10055e27d: pop r14
0x10055e27f: pop r15
0x10055e281: pop rbp
0x10055e282: ret 
0x10055e283: nop word ptr cs:[rax + rax]
