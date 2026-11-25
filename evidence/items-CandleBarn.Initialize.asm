0x1001e8d00: push rbp
0x1001e8d01: mov rbp, rsp
0x1001e8d04: push r15
0x1001e8d06: push r14
0x1001e8d08: push r13
0x1001e8d0a: push r12
0x1001e8d0c: push rbx
0x1001e8d0d: sub rsp, 0x98
0x1001e8d14: mov qword ptr [rbp - 0x68], r9
0x1001e8d18: mov r13, r8
0x1001e8d1b: mov r14, rcx
0x1001e8d1e: mov r15, rdx
0x1001e8d21: mov r12, rsi
0x1001e8d24: mov rbx, rdi
0x1001e8d27: mov rax, qword ptr [rip + 0xa24baa] ; 0x100c0d8d8
0x1001e8d2e: mov rax, qword ptr [rax]
0x1001e8d31: mov qword ptr [rbp - 0x30], rax
0x1001e8d35: lea rdi, [rbx + 0x10]
0x1001e8d39: mov esi, 0x7000
0x1001e8d3e: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x1001e8d43: mov dword ptr [rbx + 0xf6d0], 0
0x1001e8d4d: cmp qword ptr [rip + 0x1bf59ab], 0 ; 0x101dde700
0x1001e8d55: jne 0x1001e9275
0x1001e8d5b: mov qword ptr [rip + 0x1bf599e], rbx ; 0x101dde700
0x1001e8d62: mov qword ptr [rbp - 0x70], r12
0x1001e8d66: mov qword ptr [rbx + 0x669d0], r12
0x1001e8d6d: mov qword ptr [rbx + 0x669c0], r15
0x1001e8d74: mov qword ptr [rbx + 0x669d8], r14
0x1001e8d7b: mov qword ptr [rbx + 0x669e0], r13
0x1001e8d82: mov rax, qword ptr [rbp - 0x68]
0x1001e8d86: mov qword ptr [rbx + 0x669c8], rax
0x1001e8d8d: lea r13, [rip + 0x990841] ; 0x100b795d5 CandleDefault
0x1001e8d94: vmovq xmm0, r13
0x1001e8d99: lea rax, [rip + 0x99084e] ; 0x100b795ee CandlePlayer
0x1001e8da0: vmovq xmm1, rax
0x1001e8da5: vpunpcklqdq xmm1, xmm1, xmm0
0x1001e8da9: lea rcx, [rip + 0x990833] ; 0x100b795e3 Candles_02
0x1001e8db0: vmovq xmm2, rcx
0x1001e8db5: vpunpcklqdq xmm0, xmm0, xmm2
0x1001e8db9: vinsertf128 ymm0, ymm0, xmm1, 1
0x1001e8dbf: vmovups ymmword ptr [rbp - 0x60], ymm0
0x1001e8dc4: mov qword ptr [rbp - 0x40], rax
0x1001e8dc8: mov qword ptr [rbp - 0x38], rcx
0x1001e8dcc: mov qword ptr [rbp - 0x68], rbx
0x1001e8dd0: lea rbx, [rbx + 0xf74c]
0x1001e8dd7: xor r15d, r15d
0x1001e8dda: mov r14d, 1
0x1001e8de0: lea r12, [rbp - 0xa8]
0x1001e8de7: jmp 0x1001e8dfc ; 0x1001e8dfc
0x1001e8de9: nop dword ptr [rax]
0x1001e8df0: mov r13, qword ptr [rbp + r14*8 - 0x60]
0x1001e8df5: add rbx, 0x70
0x1001e8df9: inc r14
0x1001e8dfc: mov rdi, r12
0x1001e8dff: vzeroupper 
0x1001e8e02: call 0x1007c2530 ; 0x1007c2530
0x1001e8e07: call 0x1004559d0 ; 0x1004559d0
0x1001e8e0c: mov rdi, qword ptr [rbp - 0x70]
0x1001e8e10: mov rsi, rax
0x1001e8e13: mov rdx, r13
0x1001e8e16: call 0x1007c4360 ; 0x1007c4360
0x1001e8e1b: test rax, rax
0x1001e8e1e: je 0x1001e924a
0x1001e8e24: mov rdi, rax
0x1001e8e27: mov rsi, r12
0x1001e8e2a: call 0x1007c2310 ; 0x1007c2310
0x1001e8e2f: mov rax, qword ptr [rbp - 0xa8]
0x1001e8e36: test rax, rax
0x1001e8e39: je 0x1001e922b
0x1001e8e3f: mov rax, qword ptr [rax + 0x10]
0x1001e8e43: test rax, rax
0x1001e8e46: je 0x1001e922b
0x1001e8e4c: lea rcx, [rax + 0xa8]
0x1001e8e53: mov qword ptr [rbx - 0xc], rcx
0x1001e8e57: mov rax, qword ptr [rax + 0xf0]
0x1001e8e5e: vmovss xmm0, dword ptr [rax + 0xc]
0x1001e8e63: vmovsd xmm1, qword ptr [rax + 4]
0x1001e8e68: vinsertps xmm0, xmm1, xmm0, 0x20
0x1001e8e6e: vmovsd xmm1, qword ptr [rax + 0x10]
0x1001e8e73: vinsertps xmm1, xmm1, dword ptr [rax + 0x18], 0x20
0x1001e8e7a: vaddps xmm0, xmm0, xmm1
0x1001e8e7e: vmulps xmm0, xmm0, xmmword ptr [rip + 0x8be7ea] ; 0x100aa7670
0x1001e8e86: vinsertps xmm2, xmm0, dword ptr [rip + 0x8bc230], 0x30 ; 0x100aa50c0
0x1001e8e90: vsubps xmm0, xmm1, xmm0
0x1001e8e94: vpermilps xmm1, xmm0, 0
0x1001e8e9a: vmovss xmm3, dword ptr [rip + 0x8bc21e] ; 0x100aa50c0
0x1001e8ea2: vmulps xmm1, xmm1, xmm3
0x1001e8ea6: vpermilps xmm3, xmm0, 0x55
0x1001e8eac: vmulps xmm3, xmm3, xmmword ptr [rip + 0x8bf1ec] ; 0x100aa80a0
0x1001e8eb4: vpermilps xmm0, xmm0, 0xaa
0x1001e8eba: vmulps xmm0, xmm0, xmmword ptr [rip + 0x8bfb6e] ; 0x100aa8a30
0x1001e8ec2: vmovaps xmmword ptr [rbx - 0x6c], xmm1
0x1001e8ec7: vmovaps xmmword ptr [rbx - 0x5c], xmm3
0x1001e8ecc: vmovaps xmmword ptr [rbx - 0x4c], xmm0
0x1001e8ed1: vmovaps xmmword ptr [rbx - 0x3c], xmm2
0x1001e8ed6: vaddps xmm0, xmm2, xmm3
0x1001e8eda: vmulps xmm1, xmm1, xmm1
0x1001e8ede: vpermilpd xmm2, xmm1, 1
0x1001e8ee4: vaddps xmm1, xmm1, xmm2
0x1001e8ee8: vmovshdup xmm2, xmm1
0x1001e8eec: vaddss xmm1, xmm1, xmm2
0x1001e8ef0: vsqrtss xmm1, xmm1, xmm1
0x1001e8ef4: vinsertps xmm0, xmm0, xmm1, 0x30
0x1001e8efa: vmovaps xmmword ptr [rbx - 0x2c], xmm0
0x1001e8eff: movabs rcx, 0x3dcccccd3f800000
0x1001e8f09: mov qword ptr [rbx - 4], rcx
0x1001e8f0d: lea rcx, [rip + 0x1e1b36c] ; 0x102004280
0x1001e8f14: vmovaps xmm0, xmmword ptr [rcx]
0x1001e8f18: vmovaps xmmword ptr [rbx - 0x1c], xmm0
0x1001e8f1d: lea rcx, [r14 - 1]
0x1001e8f21: cmp ecx, 5
0x1001e8f24: ja 0x1001e8f98
0x1001e8f26: mov ecx, ecx
0x1001e8f28: lea rdx, [rip + 0x3d1] ; 0x1001e9300
0x1001e8f2f: movsxd rcx, dword ptr [rdx + rcx*4]
0x1001e8f33: add rcx, rdx
0x1001e8f36: jmp rcx
0x1001e8f38: vmovaps xmmword ptr [rbx - 0x1c], xmm0
0x1001e8f3d: jmp 0x1001e8f98 ; 0x1001e8f98
0x1001e8f3f: movabs rcx, 0x3e99999a3fa66666
0x1001e8f49: mov qword ptr [rbx - 4], rcx
0x1001e8f4d: jmp 0x1001e8f55 ; 0x1001e8f55
0x1001e8f4f: mov dword ptr [rbx], 0x3e99999a
0x1001e8f55: lea rcx, [rip + 0x1e1b334] ; 0x102004290
0x1001e8f5c: vmovaps xmm0, xmmword ptr [rcx]
0x1001e8f60: vmovaps xmmword ptr [rbx - 0x1c], xmm0
0x1001e8f65: jmp 0x1001e8f98 ; 0x1001e8f98
0x1001e8f67: vmovaps xmmword ptr [rbx - 0x1c], xmm0
0x1001e8f6c: vmovss xmm0, dword ptr [rip + 0x8c0250] ; 0x100aa91c4
0x1001e8f74: jmp 0x1001e8f8e ; 0x1001e8f8e
0x1001e8f76: lea rcx, [rip + 0x1e1b313] ; 0x102004290
0x1001e8f7d: vmovaps xmm0, xmmword ptr [rcx]
0x1001e8f81: vmovaps xmmword ptr [rbx - 0x1c], xmm0
0x1001e8f86: vmovss xmm0, dword ptr [rip + 0x8bb62a] ; 0x100aa45b8
0x1001e8f8e: vmulss xmm0, xmm0, dword ptr [rbx - 0x20]
0x1001e8f93: vmovss dword ptr [rbx - 0x20], xmm0
0x1001e8f98: add r15d, dword ptr [rax + 0x34]
0x1001e8f9c: mov rdi, r12
0x1001e8f9f: call 0x1007c2570 ; 0x1007c2570
0x1001e8fa4: cmp r14, 5
0x1001e8fa8: jbe 0x1001e8df0
0x1001e8fae: mov rbx, qword ptr [rbp - 0x68]
0x1001e8fb2: lea r14, [rbx + 0x669e8]
0x1001e8fb9: lea rsi, [rip + 0x990662] ; 0x100b79622 Candles
0x1001e8fc0: mov rdi, r14
0x1001e8fc3: mov edx, r15d
0x1001e8fc6: call 0x1007f53c0 ; 0x1007f53c0
0x1001e8fcb: lea rcx, [rbp - 0x94]
0x1001e8fd2: vmovdqa ymm0, ymmword ptr [rip + 0x8c6966] ; 0x100aaf940
0x1001e8fda: vmovdqu ymmword ptr [rbp - 0xa8], ymm0
0x1001e8fe2: movabs rax, 0x600000005
0x1001e8fec: mov qword ptr [rbp - 0x88], rax
0x1001e8ff3: mov qword ptr [rsp + 8], 0
0x1001e8ffc: mov dword ptr [rsp], 0
0x1001e9003: xor r15d, r15d
0x1001e9006: lea rdx, [rbp - 0xa8]
0x1001e900d: mov esi, 0
0x1001e9012: mov r8d, 5
0x1001e9018: mov r9d, 1
0x1001e901e: mov qword ptr [rbp - 0x78], r14
0x1001e9022: mov rdi, r14
0x1001e9025: vzeroupper 
0x1001e9028: call 0x1007f5430 ; 0x1007f5430
0x1001e902d: lea rdi, [rbx + 0x66b30]
0x1001e9034: mov qword ptr [rbp - 0x80], rdi
0x1001e9038: call 0x1007950d0 ; 0x1007950d0
0x1001e903d: mov qword ptr [rbp - 0x70], rax
0x1001e9041: xor r13d, r13d
0x1001e9044: imul rax, r15, 0x70
0x1001e9048: mov rax, qword ptr [rbx + rax + 0xf740]
0x1001e9050: mov r12, qword ptr [rax + 0x48]
0x1001e9054: mov ebx, dword ptr [r12 + 0x34]
0x1001e9059: call 0x1007c6c20 ; 0x1007c6c20
0x1001e905e: shl rbx, 2
0x1001e9062: lea rcx, [rip + 0x1e5fae7] ; 0x102048b50
0x1001e9069: mov rdx, qword ptr [rcx]
0x1001e906c: mov ecx, 4
0x1001e9071: mov rdi, rax
0x1001e9074: mov rsi, rbx
0x1001e9077: call 0x100795530 ; 0x100795530
0x1001e907c: mov rbx, rax
0x1001e907f: mov rsi, qword ptr [r12 + 0x60]
0x1001e9084: mov rdi, rbx
0x1001e9087: mov rdx, r12
0x1001e908a: call 0x10045edf0 ; 0x10045edf0
0x1001e908f: mov edi, dword ptr [r12 + 0x34]
0x1001e9094: mov rsi, qword ptr [r12 + 0x60]
0x1001e9099: mov rcx, qword ptr [r12 + 0x70]
0x1001e909e: mov eax, r13d
0x1001e90a1: lea rax, [rax + rax*8]
0x1001e90a5: mov rdx, qword ptr [rbp - 0x70]
0x1001e90a9: lea r8, [rdx + rax*4]
0x1001e90ad: mov rdx, rbx
0x1001e90b0: call 0x10045c9e0 ; 0x10045c9e0
0x1001e90b5: call 0x1007c6c20 ; 0x1007c6c20
0x1001e90ba: lea rcx, [rip + 0x1e5fa8f] ; 0x102048b50
0x1001e90c1: mov rdx, qword ptr [rcx]
0x1001e90c4: mov esi, 0x4000
0x1001e90c9: mov ecx, 2
0x1001e90ce: mov rdi, rax
0x1001e90d1: call 0x100795530 ; 0x100795530
0x1001e90d6: mov r14, rax
0x1001e90d9: mov r8d, dword ptr [r12 + 0x38]
0x1001e90de: test r8, r8
0x1001e90e1: je 0x1001e9100
0x1001e90e3: mov rax, qword ptr [r12 + 0x80]
0x1001e90eb: cmp r8d, 0xf
0x1001e90ef: ja 0x1001e9110
0x1001e90f1: xor ecx, ecx
0x1001e90f3: jmp 0x1001e9190 ; 0x1001e9190
0x1001e90f8: nop dword ptr [rax + rax]
0x1001e9100: xor r8d, r8d
0x1001e9103: jmp 0x1001e91a3 ; 0x1001e91a3
0x1001e9108: nop dword ptr [rax + rax]
0x1001e9110: mov r9d, r8d
0x1001e9113: and r9d, 0xf
0x1001e9117: mov rcx, r8
0x1001e911a: sub rcx, r9
0x1001e911d: vmovd xmm0, r13d
0x1001e9122: vpshufd xmm0, xmm0, 0
0x1001e9127: lea rsi, [rax + 0x30]
0x1001e912b: mov rdi, r14
0x1001e912e: add rdi, 0x18
0x1001e9132: mov rdx, rcx
0x1001e9135: vmovdqa xmm5, xmmword ptr [rip + 0x8c3cb3] ; 0x100aacdf0
0x1001e913d: nop dword ptr [rax]
0x1001e9140: vpaddw xmm1, xmm0, xmmword ptr [rsi - 0x30]
0x1001e9145: vpshufb xmm1, xmm1, xmm5
0x1001e914a: vpaddw xmm2, xmm0, xmmword ptr [rsi - 0x20]
0x1001e914f: vpaddw xmm3, xmm0, xmmword ptr [rsi - 0x10]
0x1001e9154: vpaddw xmm4, xmm0, xmmword ptr [rsi]
0x1001e9158: vmovq qword ptr [rdi - 0x18], xmm1
0x1001e915d: vpshufb xmm1, xmm2, xmm5
0x1001e9162: vmovq qword ptr [rdi - 0x10], xmm1
0x1001e9167: vpshufb xmm1, xmm3, xmm5
0x1001e916c: vmovq qword ptr [rdi - 8], xmm1
0x1001e9171: vpshufb xmm1, xmm4, xmm5
0x1001e9176: vmovq qword ptr [rdi], xmm1
0x1001e917a: add rsi, 0x40
0x1001e917e: add rdi, 0x20
0x1001e9182: add rdx, -0x10
0x1001e9186: jne 0x1001e9140
0x1001e9188: test r9d, r9d
0x1001e918b: je 0x1001e91a3
0x1001e918d: nop dword ptr [rax]
0x1001e9190: mov edx, dword ptr [rax + rcx*4]
0x1001e9193: add edx, r13d
0x1001e9196: mov word ptr [r14 + rcx*2], dx
0x1001e919b: inc rcx
0x1001e919e: cmp rcx, r8
0x1001e91a1: jb 0x1001e9190
0x1001e91a3: mov edx, 0x11
0x1001e91a8: mov ecx, 1
0x1001e91ad: mov rdi, qword ptr [rbp - 0x78]
0x1001e91b1: mov esi, r15d
0x1001e91b4: mov r9, r14
0x1001e91b7: call 0x1007f55d0 ; 0x1007f55d0
0x1001e91bc: add r13d, dword ptr [r12 + 0x34]
0x1001e91c1: call 0x1007c6c20 ; 0x1007c6c20
0x1001e91c6: mov rdi, rax
0x1001e91c9: mov rsi, r14
0x1001e91cc: call 0x100795a70 ; 0x100795a70
0x1001e91d1: call 0x1007c6c20 ; 0x1007c6c20
0x1001e91d6: mov rdi, rax
0x1001e91d9: mov rsi, rbx
0x1001e91dc: call 0x100795a70 ; 0x100795a70
0x1001e91e1: inc r15
0x1001e91e4: cmp r15, 6
0x1001e91e8: mov rbx, qword ptr [rbp - 0x68]
0x1001e91ec: jb 0x1001e9044
0x1001e91f2: mov rdi, qword ptr [rbp - 0x80]
0x1001e91f6: call 0x100795120 ; 0x100795120
0x1001e91fb: mov rdi, qword ptr [rbp - 0x78]
0x1001e91ff: call 0x1007f5690 ; 0x1007f5690
0x1001e9204: mov rax, qword ptr [rip + 0xa246cd] ; 0x100c0d8d8
0x1001e920b: mov rax, qword ptr [rax]
0x1001e920e: cmp rax, qword ptr [rbp - 0x30]
0x1001e9212: jne 0x1001e9226
0x1001e9214: add rsp, 0x98
0x1001e921b: pop rbx
0x1001e921c: pop r12
0x1001e921e: pop r13
0x1001e9220: pop r14
0x1001e9222: pop r15
0x1001e9224: pop rbp
0x1001e9225: ret 
0x1001e9226: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1001e922b: lea rdi, [rip + 0x97cc33] ; 0x100b65e65 Observed()
0x1001e9232: lea rsi, [rip + 0x97cc37] ; 0x100b65e70 ./Mesh.h
0x1001e9239: mov edx, 0x6d
0x1001e923e: mov ecx, 3
0x1001e9243: call 0x1007e5f70 ; 0x1007e5f70
0x1001e9248: jmp 0x1001e9273 ; 0x1001e9273
0x1001e924a: lea rdi, [rip + 0x9903aa] ; 0x100b795fb success
0x1001e9251: lea rsi, [rip + 0x990202] ; 0x100b7945a Candle.cpp
0x1001e9258: lea r8, [rip + 0x9903a4] ; 0x100b79603 Failed to load candle mesh: %s
0x1001e925f: mov edx, 0xfd
0x1001e9264: mov ecx, 4
0x1001e9269: xor eax, eax
0x1001e926b: mov r9, r13
0x1001e926e: call 0x1007e6030 ; 0x1007e6030
0x1001e9273: ud2 
0x1001e9275: lea rdi, [rip + 0x990341] ; 0x100b795bd g_candleBarn == nullptr
0x1001e927c: lea rsi, [rip + 0x9901d7] ; 0x100b7945a Candle.cpp
0x1001e9283: mov edx, 0xec
0x1001e9288: mov ecx, 3
0x1001e928d: call 0x1007e5f70 ; 0x1007e5f70
0x1001e9292: ud2 
0x1001e9294: jmp 0x1001e92e8 ; 0x1001e92e8
0x1001e9296: mov r15, rax
0x1001e9299: call 0x1007c6c20 ; 0x1007c6c20
0x1001e929e: mov rdi, rax
0x1001e92a1: mov rsi, r14
0x1001e92a4: call 0x100795a70 ; 0x100795a70
0x1001e92a9: jmp 0x1001e92c8 ; 0x1001e92c8
0x1001e92ab: mov rdi, rax
0x1001e92ae: call 0x100011bf0 ; 0x100011bf0
0x1001e92b3: mov rdi, rax
0x1001e92b6: call 0x100011bf0 ; 0x100011bf0
0x1001e92bb: mov rdi, rax
0x1001e92be: call 0x100011bf0 ; 0x100011bf0
0x1001e92c3: jmp 0x1001e92c5 ; 0x1001e92c5
0x1001e92c5: mov r15, rax
0x1001e92c8: call 0x1007c6c20 ; 0x1007c6c20
0x1001e92cd: mov rdi, rax
0x1001e92d0: mov rsi, rbx
0x1001e92d3: call 0x100795a70 ; 0x100795a70
0x1001e92d8: mov rdi, r15
0x1001e92db: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1001e92e0: mov rdi, rax
0x1001e92e3: call 0x100011bf0 ; 0x100011bf0
0x1001e92e8: mov r15, rax
0x1001e92eb: lea rdi, [rbp - 0xa8]
0x1001e92f2: call 0x1007c2570 ; 0x1007c2570
0x1001e92f7: mov rdi, r15
0x1001e92fa: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1001e92ff: nop 
