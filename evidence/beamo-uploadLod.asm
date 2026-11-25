0x100197ab0: push rbp
0x100197ab1: mov rbp, rsp
0x100197ab4: push r15
0x100197ab6: push r14
0x100197ab8: push r13
0x100197aba: push r12
0x100197abc: push rbx
0x100197abd: sub rsp, 0xd8
0x100197ac4: mov r13, r9
0x100197ac7: mov qword ptr [rbp - 0x58], r8
0x100197acb: mov qword ptr [rbp - 0x40], rdx
0x100197acf: mov qword ptr [rbp - 0x30], rsi
0x100197ad3: mov qword ptr [rbp - 0x60], rdi
0x100197ad7: mov rax, qword ptr [rdi + 0x18]
0x100197adb: mov r15, qword ptr [rax + 0x48]
0x100197adf: mov ecx, ecx
0x100197ae1: mov rax, rcx
0x100197ae4: mov qword ptr [rbp - 0x88], rax
0x100197aeb: imul r12, rcx, 0xb8
0x100197af2: vmovaps xmm0, xmmword ptr [rip + 0x915ac6] ; 0x100aad5c0
0x100197afa: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x100197b02: lea rdi, [rbp - 0xa0]
0x100197b09: lea rsi, [rbp - 0xc0]
0x100197b10: vmovss xmm0, dword ptr [rip + 0x910aa0] ; 0x100aa85b8
0x100197b18: call 0x10077d310 ; 0x10077d310
0x100197b1d: vmovaps xmm0, xmmword ptr [rbp - 0xa0]
0x100197b25: vmovaps xmmword ptr [rbp - 0xf0], xmm0
0x100197b2d: vmovaps xmm0, xmmword ptr [rip + 0x91056b] ; 0x100aa80a0
0x100197b35: vmovaps xmmword ptr [rbp - 0xe0], xmm0
0x100197b3d: vmovss xmm0, dword ptr [rip + 0x90d57b] ; 0x100aa50c0
0x100197b45: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x100197b4d: lea rdi, [rbp - 0xf0]
0x100197b54: lea rsi, [rbp - 0xa0]
0x100197b5b: call 0x100414530 ; 0x100414530
0x100197b60: mov ebx, dword ptr [r15 + r12 + 0x34]
0x100197b65: call 0x1007c6c20 ; 0x1007c6c20
0x100197b6a: lea r14, [rip + 0x1eb0fdf] ; 0x102048b50
0x100197b71: mov rdx, qword ptr [r14]
0x100197b74: mov ecx, 1
0x100197b79: mov rdi, rax
0x100197b7c: mov qword ptr [rbp - 0x78], rbx
0x100197b80: mov rsi, rbx
0x100197b83: call 0x100795530 ; 0x100795530
0x100197b88: mov qword ptr [rbp - 0x70], rax
0x100197b8c: mov ebx, dword ptr [r15 + r12 + 0x34]
0x100197b91: call 0x1007c6c20 ; 0x1007c6c20
0x100197b96: shl rbx, 2
0x100197b9a: mov rdx, qword ptr [r14]
0x100197b9d: mov ecx, 4
0x100197ba2: mov rdi, rax
0x100197ba5: mov rsi, rbx
0x100197ba8: call 0x100795530 ; 0x100795530
0x100197bad: mov qword ptr [rbp - 0x68], rax
0x100197bb1: mov qword ptr [rbp - 0x38], r15
0x100197bb5: mov qword ptr [rbp - 0x50], r12
0x100197bb9: lea r12, [r15 + r12 + 0x34]
0x100197bbe: mov ebx, dword ptr [r12]
0x100197bc2: call 0x1007c6c20 ; 0x1007c6c20
0x100197bc7: shl rbx, 4
0x100197bcb: lea rcx, [rip + 0x1eb0f7e] ; 0x102048b50
0x100197bd2: mov rdx, qword ptr [rcx]
0x100197bd5: mov ecx, 0x10
0x100197bda: mov rdi, rax
0x100197bdd: mov rsi, rbx
0x100197be0: call 0x100795530 ; 0x100795530
0x100197be5: mov r14, rax
0x100197be8: mov r15d, dword ptr [r12]
0x100197bec: call 0x1007c6c20 ; 0x1007c6c20
0x100197bf1: shl r15, 2
0x100197bf5: lea rcx, [rip + 0x1eb0f54] ; 0x102048b50
0x100197bfc: mov rdx, qword ptr [rcx]
0x100197bff: mov ecx, 0x10
0x100197c04: mov rdi, rax
0x100197c07: mov rsi, r15
0x100197c0a: call 0x100795530 ; 0x100795530
0x100197c0f: mov r15d, dword ptr [r12]
0x100197c13: mov qword ptr [rbp - 0x48], rax
0x100197c17: call 0x1007c6c20 ; 0x1007c6c20
0x100197c1c: mov rbx, qword ptr [rbp - 0x60]
0x100197c20: shl r15, 2
0x100197c24: lea rcx, [rip + 0x1eb0f25] ; 0x102048b50
0x100197c2b: mov rdx, qword ptr [rcx]
0x100197c2e: mov ecx, 0x10
0x100197c33: mov rdi, rax
0x100197c36: mov rsi, r15
0x100197c39: call 0x100795530 ; 0x100795530
0x100197c3e: mov qword ptr [rbp - 0xa8], r15
0x100197c45: mov qword ptr [rbp - 0x80], rax
0x100197c49: mov rax, qword ptr [rbp - 0x38]
0x100197c4d: mov rcx, qword ptr [rbp - 0x50]
0x100197c51: lea rdx, [rax + rcx]
0x100197c55: cmp dword ptr [r12], 0
0x100197c5a: je 0x100197d3d
0x100197c60: mov rax, qword ptr [rbp - 0x38]
0x100197c64: mov rcx, qword ptr [rbp - 0x50]
0x100197c68: lea rax, [rax + rcx + 0x60]
0x100197c6d: xor ecx, ecx
0x100197c6f: nop 
0x100197c70: mov rdi, qword ptr [rax]
0x100197c73: mov esi, ecx
0x100197c75: shl rsi, 4
0x100197c79: vmovups xmm0, xmmword ptr [rdi + rsi]
0x100197c7e: vmovups xmmword ptr [r14 + rsi], xmm0
0x100197c84: vmovss xmm0, dword ptr [r14 + rsi]
0x100197c8a: vmovss xmm1, dword ptr [r14 + rsi + 4]
0x100197c91: vmovss xmm2, dword ptr [r14 + rsi + 8]
0x100197c98: vmovaps xmm3, xmmword ptr [rbx + 0x30]
0x100197c9d: vmovaps xmm4, xmmword ptr [rbx + 0x40]
0x100197ca2: vmovaps xmm5, xmmword ptr [rbx + 0x50]
0x100197ca7: vmovaps xmm6, xmmword ptr [rbx + 0x60]
0x100197cac: vmulss xmm8, xmm0, xmm3
0x100197cb0: vmulss xmm7, xmm1, xmm4
0x100197cb4: vaddss xmm8, xmm8, xmm7
0x100197cb8: vmulss xmm7, xmm2, xmm5
0x100197cbc: vaddss xmm7, xmm8, xmm7
0x100197cc0: vaddss xmm8, xmm6, xmm7
0x100197cc4: vmovshdup xmm7, xmm3
0x100197cc8: vmulss xmm9, xmm0, xmm7
0x100197ccc: vmovshdup xmm7, xmm4
0x100197cd0: vmulss xmm7, xmm1, xmm7
0x100197cd4: vaddss xmm9, xmm9, xmm7
0x100197cd8: vmovshdup xmm7, xmm5
0x100197cdc: vmulss xmm7, xmm2, xmm7
0x100197ce0: vaddss xmm9, xmm9, xmm7
0x100197ce4: vmovshdup xmm7, xmm6
0x100197ce8: vaddss xmm7, xmm7, xmm9
0x100197ced: vpermilpd xmm3, xmm3, 1
0x100197cf3: vmulss xmm0, xmm0, xmm3
0x100197cf7: vpermilpd xmm3, xmm4, 1
0x100197cfd: vmulss xmm1, xmm1, xmm3
0x100197d01: vaddss xmm0, xmm0, xmm1
0x100197d05: vpermilpd xmm1, xmm5, 1
0x100197d0b: vmulss xmm1, xmm2, xmm1
0x100197d0f: vaddss xmm0, xmm0, xmm1
0x100197d13: vpermilpd xmm1, xmm6, 1
0x100197d19: vaddss xmm0, xmm1, xmm0
0x100197d1d: vmovss dword ptr [r14 + rsi], xmm8
0x100197d23: vmovss dword ptr [r14 + rsi + 4], xmm7
0x100197d2a: vmovss dword ptr [r14 + rsi + 8], xmm0
0x100197d31: inc ecx
0x100197d33: cmp ecx, dword ptr [r12]
0x100197d37: jb 0x100197c70
0x100197d3d: mov rbx, qword ptr [rbp - 0x48]
0x100197d41: mov rdi, rbx
0x100197d44: mov rsi, r14
0x100197d47: call 0x10045edf0 ; 0x10045edf0
0x100197d4c: mov r15, qword ptr [rbp - 0x80]
0x100197d50: mov rdi, r15
0x100197d53: mov rsi, qword ptr [rbp - 0xa8]
0x100197d5a: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x100197d5f: mov edi, dword ptr [r12]
0x100197d63: mov rax, qword ptr [rbp - 0x60]
0x100197d67: movzx eax, byte ptr [rax + 0xf4]
0x100197d6e: mov dword ptr [rsp + 8], eax
0x100197d72: mov qword ptr [rsp], r15
0x100197d76: mov rcx, rbx
0x100197d79: mov r8, r14
0x100197d7c: mov r9, qword ptr [rbp - 0x40]
0x100197d80: call 0x1001975c0 ; 0x1001975c0
0x100197d85: cmp dword ptr [r12], 0
0x100197d8a: mov rsi, qword ptr [rbp - 0x80]
0x100197d8e: je 0x100197dd2
0x100197d90: xor eax, eax
0x100197d92: vmovss xmm0, dword ptr [rip + 0x90ff2a] ; 0x100aa7cc4
0x100197d9a: nop word ptr [rax + rax]
0x100197da0: mov ecx, eax
0x100197da2: vmovss xmm1, dword ptr [rsi + rcx*4]
0x100197da7: shl rcx, 4
0x100197dab: movzx edx, byte ptr [r14 + rcx + 0xf]
0x100197db1: vcvtsi2ss xmm2, xmm10, edx
0x100197db5: vdivss xmm2, xmm2, xmm0
0x100197db9: vmaxss xmm1, xmm1, xmm2
0x100197dbd: vmulss xmm1, xmm1, xmm0
0x100197dc1: vcvttss2si edx, xmm1
0x100197dc5: mov byte ptr [r14 + rcx + 0xf], dl
0x100197dca: inc eax
0x100197dcc: cmp eax, dword ptr [r12]
0x100197dd0: jb 0x100197da0
0x100197dd2: mov rax, qword ptr [rbp - 0x30]
0x100197dd6: test rax, rax
0x100197dd9: mov rdi, qword ptr [rbp - 0x70]
0x100197ddd: je 0x100197e9e
0x100197de3: mov rax, qword ptr [rax + 0x28]
0x100197de7: mov rcx, qword ptr [rbp - 0x88]
0x100197dee: lea r15, [rcx + rcx*2]
0x100197df2: cmp qword ptr [rax + r15*8 + 0x10], 0
0x100197df8: je 0x10019842c
0x100197dfe: mov rsi, qword ptr [rbp - 0x78]
0x100197e02: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x100197e07: mov rax, qword ptr [rbp - 0x38]
0x100197e0b: mov rcx, qword ptr [rbp - 0x50]
0x100197e0f: mov edx, dword ptr [rax + rcx + 0x38]
0x100197e13: lea eax, [rdx + 2]
0x100197e16: cmp eax, 5
0x100197e19: mov r11, qword ptr [rbp - 0x58]
0x100197e1d: jb 0x100197eb0
0x100197e23: mov rax, qword ptr [rbp - 0x38]
0x100197e27: mov rcx, qword ptr [rbp - 0x50]
0x100197e2b: mov r9, qword ptr [rax + rcx + 0x80]
0x100197e33: mov rax, qword ptr [rbp - 0x30]
0x100197e37: mov rcx, qword ptr [rax + 0x28]
0x100197e3b: mov r8, qword ptr [rcx + r15*8 + 0x10]
0x100197e40: movsxd rdx, edx
0x100197e43: imul r10, rdx, 0x55555556
0x100197e4a: mov rsi, r10
0x100197e4d: shr rsi, 0x3f
0x100197e51: shr r10, 0x20
0x100197e55: add r10d, esi
0x100197e58: mov esi, 2
0x100197e5d: xor edi, edi
0x100197e5f: nop 
0x100197e60: cmp byte ptr [r8 + rdi], 0
0x100197e65: jne 0x100197e91
0x100197e67: lea ecx, [rsi - 2]
0x100197e6a: mov eax, esi
0x100197e6c: lea edx, [rsi - 1]
0x100197e6f: mov ecx, ecx
0x100197e71: mov eax, dword ptr [r9 + rax*4]
0x100197e75: mov edx, dword ptr [r9 + rdx*4]
0x100197e79: mov ecx, dword ptr [r9 + rcx*4]
0x100197e7d: mov rbx, qword ptr [rbp - 0x70]
0x100197e81: mov byte ptr [rbx + rax], 1
0x100197e85: mov byte ptr [rbx + rdx], 1
0x100197e89: mov byte ptr [rbx + rcx], 1
0x100197e8d: mov rbx, qword ptr [rbp - 0x48]
0x100197e91: inc rdi
0x100197e94: add esi, 3
0x100197e97: cmp rdi, r10
0x100197e9a: jb 0x100197e60
0x100197e9c: jmp 0x100197eb0 ; 0x100197eb0
0x100197e9e: mov esi, 1
0x100197ea3: mov rdx, qword ptr [rbp - 0x78]
0x100197ea7: call 0x100aa2900 ; 0x100aa2900 _memset
0x100197eac: mov r11, qword ptr [rbp - 0x58]
0x100197eb0: xor eax, eax
0x100197eb2: mov qword ptr [rbp - 0x40], rax
0x100197eb6: cmp dword ptr [r12], 0
0x100197ebb: mov edi, 0
0x100197ec0: mov r10, qword ptr [rbp - 0x70]
0x100197ec4: je 0x100197fea
0x100197eca: mov rax, qword ptr [rbp - 0x38]
0x100197ece: mov rcx, qword ptr [rbp - 0x50]
0x100197ed2: lea r8, [rax + rcx + 0x70]
0x100197ed7: cmp qword ptr [rbp - 0x30], 0
0x100197edc: je 0x100197f7c
0x100197ee2: xor edi, edi
0x100197ee4: mov rax, qword ptr [rbp - 0x88]
0x100197eeb: lea r9, [rax + rax*2]
0x100197eef: xor edx, edx
0x100197ef1: nop word ptr cs:[rax + rax]
0x100197f00: mov edx, edx
0x100197f02: mov rax, qword ptr [rbp - 0x68]
0x100197f06: mov dword ptr [rax + rdx*4], edi
0x100197f09: cmp byte ptr [r10 + rdx], 0
0x100197f0e: je 0x100197f72
0x100197f10: lea esi, [rdi + 1]
0x100197f13: add edi, dword ptr [r11]
0x100197f16: lea rdi, [rdi + rdi*2]
0x100197f1a: shl rdi, 4
0x100197f1e: mov rax, rdx
0x100197f21: shl rax, 4
0x100197f25: vmovups xmm0, xmmword ptr [r14 + rax]
0x100197f2b: vmovups xmmword ptr [r13 + rdi], xmm0
0x100197f32: mov ecx, dword ptr [rbx + rdx*4]
0x100197f35: mov dword ptr [r13 + rdi + 0x10], ecx
0x100197f3a: mov rcx, qword ptr [r8]
0x100197f3d: vmovups xmm0, xmmword ptr [rcx + rax]
0x100197f42: vmovups xmmword ptr [r13 + rdi + 0x14], xmm0
0x100197f49: mov rax, qword ptr [rbp - 0x30]
0x100197f4d: mov rax, qword ptr [rax + 0x28]
0x100197f51: mov rax, qword ptr [rax + r9*8 + 8]
0x100197f56: lea rcx, [rdx + rdx*2]
0x100197f5a: mov ebx, dword ptr [rax + rcx*4 + 8]
0x100197f5e: mov dword ptr [r13 + rdi + 0x2c], ebx
0x100197f63: mov rbx, qword ptr [rbp - 0x48]
0x100197f67: mov rax, qword ptr [rax + rcx*4]
0x100197f6b: mov qword ptr [r13 + rdi + 0x24], rax
0x100197f70: mov edi, esi
0x100197f72: inc edx
0x100197f74: cmp edx, dword ptr [r12]
0x100197f78: jb 0x100197f00
0x100197f7a: jmp 0x100197fea ; 0x100197fea
0x100197f7c: xor edi, edi
0x100197f7e: xor ecx, ecx
0x100197f80: mov ecx, ecx
0x100197f82: mov rax, qword ptr [rbp - 0x68]
0x100197f86: mov dword ptr [rax + rcx*4], edi
0x100197f89: cmp byte ptr [r10 + rcx], 0
0x100197f8e: je 0x100197fe2
0x100197f90: lea eax, [rdi + 1]
0x100197f93: add edi, dword ptr [r11]
0x100197f96: lea rdx, [rdi + rdi*2]
0x100197f9a: shl rdx, 4
0x100197f9e: mov rsi, rcx
0x100197fa1: shl rsi, 4
0x100197fa5: vmovups xmm0, xmmword ptr [r14 + rsi]
0x100197fab: vmovups xmmword ptr [r13 + rdx], xmm0
0x100197fb2: mov edi, dword ptr [rbx + rcx*4]
0x100197fb5: mov dword ptr [r13 + rdx + 0x10], edi
0x100197fba: mov rdi, qword ptr [r8]
0x100197fbd: vmovups xmm0, xmmword ptr [rdi + rsi]
0x100197fc2: vmovups xmmword ptr [r13 + rdx + 0x14], xmm0
0x100197fc9: mov rsi, qword ptr [rbp - 0xa0]
0x100197fd0: mov qword ptr [r13 + rdx + 0x24], rsi
0x100197fd5: mov esi, dword ptr [rbp - 0x98]
0x100197fdb: mov dword ptr [r13 + rdx + 0x2c], esi
0x100197fe0: mov edi, eax
0x100197fe2: inc ecx
0x100197fe4: cmp ecx, dword ptr [r12]
0x100197fe8: jb 0x100197f80
0x100197fea: mov qword ptr [rbp - 0x78], rdi
0x100197fee: mov rcx, qword ptr [rbp - 0x38]
0x100197ff2: mov rdx, qword ptr [rbp - 0x50]
0x100197ff6: mov eax, dword ptr [rcx + rdx + 0x38]
0x100197ffa: add eax, 2
0x100197ffd: cmp eax, 5
0x100198000: jb 0x1001981f5
0x100198006: lea rdi, [rcx + rdx + 0x38]
0x10019800b: mov rax, qword ptr [rbp - 0x30]
0x10019800f: test rax, rax
0x100198012: mov qword ptr [rbp - 0x38], rdi
0x100198016: je 0x100198203
0x10019801c: mov r12, rbx
0x10019801f: mov rax, qword ptr [rax + 0x28]
0x100198023: mov rcx, qword ptr [rbp - 0x88]
0x10019802a: lea rcx, [rcx + rcx*2]
0x10019802e: mov rbx, qword ptr [rax + rcx*8 + 0x10]
0x100198033: xor eax, eax
0x100198035: mov qword ptr [rbp - 0x40], rax
0x100198039: mov esi, 2
0x10019803e: xor eax, eax
0x100198040: mov qword ptr [rbp - 0x30], rax
0x100198044: xor edx, edx
0x100198046: mov qword ptr [rbp - 0x50], rbx
0x10019804a: nop word ptr [rax + rax]
0x100198050: mov eax, edx
0x100198052: cmp byte ptr [rbx + rax], 0
0x100198056: jne 0x1001981cc
0x10019805c: mov rdi, qword ptr [rdi + 0x48]
0x100198060: lea r9d, [rsi - 2]
0x100198064: lea ebx, [rsi - 1]
0x100198067: mov r13d, esi
0x10019806a: mov r15, r11
0x10019806d: mov r11d, dword ptr [rdi + r9*4]
0x100198071: mov r8d, dword ptr [r15]
0x100198074: mov rcx, qword ptr [rbp - 0x68]
0x100198078: mov r10d, dword ptr [rcx + r11*4]
0x10019807c: add r10d, r8d
0x10019807f: mov ebx, dword ptr [rdi + rbx*4]
0x100198082: mov r12d, dword ptr [rcx + rbx*4]
0x100198086: add r12d, r8d
0x100198089: mov ebx, dword ptr [rdi + r13*4]
0x10019808d: add r8d, dword ptr [rcx + rbx*4]
0x100198091: mov rcx, qword ptr [rbp - 0x60]
0x100198095: cmp qword ptr [rcx + 0xe0], 0
0x10019809d: je 0x100198116
0x10019809f: shl r11, 4
0x1001980a3: mov ebx, dword ptr [rdi + r9*4 + 4]
0x1001980a8: mov edi, dword ptr [rdi + r9*4 + 8]
0x1001980ad: shl rbx, 4
0x1001980b1: shl rdi, 4
0x1001980b5: movzx ecx, byte ptr [r14 + r11 + 0xf]
0x1001980bb: movzx ebx, byte ptr [r14 + rbx + 0xf]
0x1001980c1: add ebx, ecx
0x1001980c3: movzx edi, byte ptr [r14 + rdi + 0xf]
0x1001980c9: add edi, ebx
0x1001980cb: cmp edi, 0x2a2
0x1001980d1: jbe 0x100198145
0x1001980d3: mov r11, qword ptr [rbp - 0x58]
0x1001980d7: mov ecx, dword ptr [r11 + 8]
0x1001980db: mov rbx, qword ptr [rbp - 0x30]
0x1001980df: lea edi, [rcx + rbx]
0x1001980e2: mov rax, qword ptr [rbp + 0x10]
0x1001980e6: mov dword ptr [rax + rdi*4], r10d
0x1001980ea: lea edi, [rcx + rbx + 1]
0x1001980ee: mov dword ptr [rax + rdi*4], r12d
0x1001980f2: lea ecx, [rcx + rbx + 2]
0x1001980f6: mov dword ptr [rax + rcx*4], r8d
0x1001980fa: lea eax, [rbx + 3]
0x1001980fd: movabs rcx, 0xffffffff00000000
0x100198107: and rbx, rcx
0x10019810a: or rbx, rax
0x10019810d: mov qword ptr [rbp - 0x30], rbx
0x100198111: jmp 0x1001981c0 ; 0x1001981c0
0x100198116: mov ecx, dword ptr [r15 + 4]
0x10019811a: mov rax, qword ptr [rbp - 0x40]
0x10019811e: lea edi, [rcx + rax]
0x100198121: mov rbx, qword ptr [rbp + 0x10]
0x100198125: mov dword ptr [rbx + rdi*4], r10d
0x100198129: lea edi, [rcx + rax + 1]
0x10019812d: mov dword ptr [rbx + rdi*4], r12d
0x100198131: lea ecx, [rcx + rax + 2]
0x100198135: mov dword ptr [rbx + rcx*4], r8d
0x100198139: add eax, 3
0x10019813c: mov qword ptr [rbp - 0x40], rax
0x100198140: mov r11, r15
0x100198143: jmp 0x1001981c0 ; 0x1001981c0
0x100198145: mov r11, qword ptr [rbp - 0x58]
0x100198149: mov ecx, dword ptr [r11 + 4]
0x10019814d: mov rax, qword ptr [rbp - 0x40]
0x100198151: lea ebx, [rcx + rax]
0x100198154: mov r9, qword ptr [rbp + 0x10]
0x100198158: mov dword ptr [r9 + rbx*4], r10d
0x10019815c: lea ebx, [rcx + rax + 1]
0x100198160: mov dword ptr [r9 + rbx*4], r12d
0x100198164: lea ecx, [rcx + rax + 2]
0x100198168: mov dword ptr [r9 + rcx*4], r8d
0x10019816c: add eax, 3
0x10019816f: mov qword ptr [rbp - 0x40], rax
0x100198173: dec edi
0x100198175: cmp edi, 0x2a1
0x10019817b: ja 0x1001981c0
0x10019817d: mov ecx, dword ptr [r11 + 0xc]
0x100198181: mov rax, qword ptr [rbp - 0x30]
0x100198185: mov rdi, rax
0x100198188: shr rdi, 0x20
0x10019818c: lea ebx, [rcx + rdi]
0x10019818f: mov dword ptr [r9 + rbx*4], r10d
0x100198193: lea ebx, [rcx + rdi + 1]
0x100198197: mov dword ptr [r9 + rbx*4], r12d
0x10019819b: lea ecx, [rcx + rdi + 2]
0x10019819f: mov dword ptr [r9 + rcx*4], r8d
0x1001981a3: movabs rcx, 0x300000000
0x1001981ad: add rax, rcx
0x1001981b0: mov qword ptr [rbp - 0x30], rax
0x1001981b4: nop word ptr cs:[rax + rax]
0x1001981c0: mov r12, qword ptr [rbp - 0x48]
0x1001981c4: mov rdi, qword ptr [rbp - 0x38]
0x1001981c8: mov rbx, qword ptr [rbp - 0x50]
0x1001981cc: inc edx
0x1001981ce: movsxd rax, dword ptr [rdi]
0x1001981d1: imul rax, rax, 0x55555556
0x1001981d8: mov rcx, rax
0x1001981db: shr rcx, 0x3f
0x1001981df: shr rax, 0x20
0x1001981e3: add eax, ecx
0x1001981e5: add esi, 3
0x1001981e8: cmp edx, eax
0x1001981ea: jb 0x100198050
0x1001981f0: jmp 0x1001983b2 ; 0x1001983b2
0x1001981f5: mov r12, rbx
0x1001981f8: xor eax, eax
0x1001981fa: mov qword ptr [rbp - 0x30], rax
0x1001981fe: jmp 0x1001983b2 ; 0x1001983b2
0x100198203: mov r8, qword ptr [rdi + 0x48]
0x100198207: mov rax, qword ptr [rbp - 0x60]
0x10019820b: mov rax, qword ptr [rax + 0xe0]
0x100198212: mov qword ptr [rbp - 0x60], rax
0x100198216: xor eax, eax
0x100198218: mov qword ptr [rbp - 0x40], rax
0x10019821c: mov edi, 2
0x100198221: xor eax, eax
0x100198223: mov qword ptr [rbp - 0x30], rax
0x100198227: xor r9d, r9d
0x10019822a: nop word ptr [rax + rax]
0x100198230: lea esi, [rdi - 2]
0x100198233: lea ebx, [rdi - 1]
0x100198236: mov edx, edi
0x100198238: mov ecx, dword ptr [r8 + rsi*4]
0x10019823c: mov eax, dword ptr [r11]
0x10019823f: mov r10, qword ptr [rbp - 0x68]
0x100198243: mov r12, r11
0x100198246: mov r11d, dword ptr [r10 + rcx*4]
0x10019824a: add r11d, eax
0x10019824d: mov ebx, dword ptr [r8 + rbx*4]
0x100198251: mov r13d, dword ptr [r10 + rbx*4]
0x100198255: add r13d, eax
0x100198258: mov edx, dword ptr [r8 + rdx*4]
0x10019825c: add eax, dword ptr [r10 + rdx*4]
0x100198260: cmp qword ptr [rbp - 0x60], 0
0x100198265: je 0x1001982e0
0x100198267: shl rcx, 4
0x10019826b: mov edx, dword ptr [r8 + rsi*4 + 4]
0x100198270: mov esi, dword ptr [r8 + rsi*4 + 8]
0x100198275: shl rdx, 4
0x100198279: shl rsi, 4
0x10019827d: movzx ecx, byte ptr [r14 + rcx + 0xf]
0x100198283: movzx edx, byte ptr [r14 + rdx + 0xf]
0x100198289: add edx, ecx
0x10019828b: movzx ecx, byte ptr [r14 + rsi + 0xf]
0x100198291: add ecx, edx
0x100198293: cmp ecx, 0x2a3
0x100198299: jb 0x100198310
0x10019829b: mov rcx, qword ptr [rbp - 0x58]
0x10019829f: mov ecx, dword ptr [rcx + 8]
0x1001982a2: mov rsi, qword ptr [rbp - 0x30]
0x1001982a6: lea edx, [rcx + rsi]
0x1001982a9: mov rbx, qword ptr [rbp + 0x10]
0x1001982ad: mov dword ptr [rbx + rdx*4], r11d
0x1001982b1: lea edx, [rcx + rsi + 1]
0x1001982b5: mov dword ptr [rbx + rdx*4], r13d
0x1001982b9: lea ecx, [rcx + rsi + 2]
0x1001982bd: mov dword ptr [rbx + rcx*4], eax
0x1001982c0: lea eax, [rsi + 3]
0x1001982c3: movabs rcx, 0xffffffff00000000
0x1001982cd: and rsi, rcx
0x1001982d0: or rsi, rax
0x1001982d3: mov qword ptr [rbp - 0x30], rsi
0x1001982d7: jmp 0x100198380 ; 0x100198380
0x1001982dc: nop dword ptr [rax]
0x1001982e0: mov ecx, dword ptr [r12 + 4]
0x1001982e5: mov rsi, qword ptr [rbp - 0x40]
0x1001982e9: lea edx, [rcx + rsi]
0x1001982ec: mov rbx, qword ptr [rbp + 0x10]
0x1001982f0: mov dword ptr [rbx + rdx*4], r11d
0x1001982f4: lea edx, [rcx + rsi + 1]
0x1001982f8: mov dword ptr [rbx + rdx*4], r13d
0x1001982fc: lea ecx, [rcx + rsi + 2]
0x100198300: mov dword ptr [rbx + rcx*4], eax
0x100198303: add esi, 3
0x100198306: mov qword ptr [rbp - 0x40], rsi
0x10019830a: jmp 0x100198380 ; 0x100198380
0x10019830c: nop dword ptr [rax]
0x100198310: mov r10, qword ptr [rbp - 0x58]
0x100198314: mov edx, dword ptr [r10 + 4]
0x100198318: mov rbx, qword ptr [rbp - 0x40]
0x10019831c: lea esi, [rdx + rbx]
0x10019831f: mov r12, qword ptr [rbp + 0x10]
0x100198323: mov dword ptr [r12 + rsi*4], r11d
0x100198327: lea esi, [rdx + rbx + 1]
0x10019832b: mov dword ptr [r12 + rsi*4], r13d
0x10019832f: lea edx, [rdx + rbx + 2]
0x100198333: mov dword ptr [r12 + rdx*4], eax
0x100198337: add ebx, 3
0x10019833a: mov qword ptr [rbp - 0x40], rbx
0x10019833e: dec ecx
0x100198340: cmp ecx, 0x2a1
0x100198346: ja 0x100198380
0x100198348: mov ecx, dword ptr [r10 + 0xc]
0x10019834c: mov rdx, qword ptr [rbp - 0x30]
0x100198350: mov rbx, rdx
0x100198353: shr rdx, 0x20
0x100198357: lea esi, [rcx + rdx]
0x10019835a: mov dword ptr [r12 + rsi*4], r11d
0x10019835e: lea esi, [rcx + rdx + 1]
0x100198362: mov dword ptr [r12 + rsi*4], r13d
0x100198366: lea ecx, [rcx + rdx + 2]
0x10019836a: mov dword ptr [r12 + rcx*4], eax
0x10019836e: movabs rax, 0x300000000
0x100198378: add rbx, rax
0x10019837b: mov qword ptr [rbp - 0x30], rbx
0x10019837f: nop 
0x100198380: mov r12, qword ptr [rbp - 0x48]
0x100198384: mov rax, qword ptr [rbp - 0x38]
0x100198388: inc r9d
0x10019838b: movsxd rax, dword ptr [rax]
0x10019838e: imul rax, rax, 0x55555556
0x100198395: mov rcx, rax
0x100198398: shr rcx, 0x3f
0x10019839c: shr rax, 0x20
0x1001983a0: add eax, ecx
0x1001983a2: add edi, 3
0x1001983a5: cmp r9d, eax
0x1001983a8: mov r11, qword ptr [rbp - 0x58]
0x1001983ac: jb 0x100198230
0x1001983b2: call 0x1007c6c20 ; 0x1007c6c20
0x1001983b7: mov rdi, rax
0x1001983ba: mov rsi, qword ptr [rbp - 0x80]
0x1001983be: call 0x100795a70 ; 0x100795a70
0x1001983c3: call 0x1007c6c20 ; 0x1007c6c20
0x1001983c8: mov rsi, r12
0x1001983cb: mov rdi, rax
0x1001983ce: call 0x100795a70 ; 0x100795a70
0x1001983d3: call 0x1007c6c20 ; 0x1007c6c20
0x1001983d8: mov rdi, rax
0x1001983db: mov rsi, r14
0x1001983de: call 0x100795a70 ; 0x100795a70
0x1001983e3: call 0x1007c6c20 ; 0x1007c6c20
0x1001983e8: mov rdi, rax
0x1001983eb: mov rsi, qword ptr [rbp - 0x68]
0x1001983ef: call 0x100795a70 ; 0x100795a70
0x1001983f4: call 0x1007c6c20 ; 0x1007c6c20
0x1001983f9: mov rdi, rax
0x1001983fc: mov rsi, qword ptr [rbp - 0x70]
0x100198400: call 0x100795a70 ; 0x100795a70
0x100198405: mov rax, qword ptr [rbp - 0x40]
0x100198409: mov rcx, rax
0x10019840c: shl rcx, 0x20
0x100198410: mov eax, dword ptr [rbp - 0x78]
0x100198413: or rax, rcx
0x100198416: mov rdx, qword ptr [rbp - 0x30]
0x10019841a: add rsp, 0xd8
0x100198421: pop rbx
0x100198422: pop r12
0x100198424: pop r13
0x100198426: pop r14
0x100198428: pop r15
0x10019842a: pop rbp
0x10019842b: ret 
0x10019842c: lea rdi, [rip + 0x9df002] ; 0x100b77435 bake->lods[ lodLevel ].trisCulled
0x100198433: lea rsi, [rip + 0x9dee57] ; 0x100b77291 Beamo.cpp
0x10019843a: mov edx, 0x1db
0x10019843f: mov ecx, 3
0x100198444: call 0x1007e5f70 ; 0x1007e5f70
0x100198449: ud2 
0x10019844b: mov rdi, rax
0x10019844e: call 0x100011bf0 ; 0x100011bf0
0x100198453: mov rdi, rax
0x100198456: call 0x100011bf0 ; 0x100011bf0
0x10019845b: mov rdi, rax
0x10019845e: call 0x100011bf0 ; 0x100011bf0
0x100198463: mov rdi, rax
0x100198466: call 0x100011bf0 ; 0x100011bf0
0x10019846b: mov rdi, rax
0x10019846e: call 0x100011bf0 ; 0x100011bf0
0x100198473: mov rbx, rax
0x100198476: call 0x1007c6c20 ; 0x1007c6c20
0x10019847b: mov rdi, rax
0x10019847e: mov rsi, qword ptr [rbp - 0x80]
0x100198482: call 0x100795a70 ; 0x100795a70
0x100198487: jmp 0x100198494 ; 0x100198494
0x100198489: mov rdi, rax
0x10019848c: call 0x100011bf0 ; 0x100011bf0
0x100198491: mov rbx, rax
0x100198494: call 0x1007c6c20 ; 0x1007c6c20
0x100198499: mov rdi, rax
0x10019849c: mov rsi, qword ptr [rbp - 0x48]
0x1001984a0: call 0x100795a70 ; 0x100795a70
0x1001984a5: jmp 0x1001984b2 ; 0x1001984b2
0x1001984a7: mov rdi, rax
0x1001984aa: call 0x100011bf0 ; 0x100011bf0
0x1001984af: mov rbx, rax
0x1001984b2: call 0x1007c6c20 ; 0x1007c6c20
0x1001984b7: mov rdi, rax
0x1001984ba: mov rsi, r14
0x1001984bd: call 0x100795a70 ; 0x100795a70
0x1001984c2: jmp 0x1001984cf ; 0x1001984cf
0x1001984c4: mov rdi, rax
0x1001984c7: call 0x100011bf0 ; 0x100011bf0
0x1001984cc: mov rbx, rax
0x1001984cf: call 0x1007c6c20 ; 0x1007c6c20
0x1001984d4: mov rdi, rax
0x1001984d7: mov rsi, qword ptr [rbp - 0x68]
0x1001984db: call 0x100795a70 ; 0x100795a70
0x1001984e0: jmp 0x1001984ed ; 0x1001984ed
0x1001984e2: mov rdi, rax
0x1001984e5: call 0x100011bf0 ; 0x100011bf0
0x1001984ea: mov rbx, rax
0x1001984ed: call 0x1007c6c20 ; 0x1007c6c20
0x1001984f2: mov rdi, rax
0x1001984f5: mov rsi, qword ptr [rbp - 0x70]
0x1001984f9: call 0x100795a70 ; 0x100795a70
0x1001984fe: mov rdi, rbx
0x100198501: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100198506: mov rdi, rax
0x100198509: call 0x100011bf0 ; 0x100011bf0
0x10019850e: nop 
