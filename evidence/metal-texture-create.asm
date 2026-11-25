0x100a69d80: push rbp
0x100a69d81: mov rbp, rsp
0x100a69d84: push r15
0x100a69d86: push r14
0x100a69d88: push r13
0x100a69d8a: push r12
0x100a69d8c: push rbx
0x100a69d8d: sub rsp, 0xc8
0x100a69d94: mov r12, rsi
0x100a69d97: mov eax, dword ptr [rdi + 0x9c]
0x100a69d9d: cmp eax, dword ptr [rdi + 0x98]
0x100a69da3: jae 0x100a6a625
0x100a69da9: inc eax
0x100a69dab: mov dword ptr [rdi + 0x9c], eax
0x100a69db1: mov rdx, qword ptr [rdi + 0xa8]
0x100a69db8: mov eax, 0xffffffff
0x100a69dbd: mov r13d, 0xffffffe0
0x100a69dc3: nop word ptr cs:[rax + rax]
0x100a69dd0: inc eax
0x100a69dd2: mov ebx, dword ptr [rdx + rax*4]
0x100a69dd5: add r13d, 0x20
0x100a69dd9: cmp ebx, -1
0x100a69ddc: je 0x100a69dd0
0x100a69dde: mov r8d, eax
0x100a69de1: mov ecx, ebx
0x100a69de3: not ecx
0x100a69de5: bsf ecx, ecx
0x100a69de8: mov esi, 1
0x100a69ded: shl esi, cl
0x100a69def: or ebx, esi
0x100a69df1: mov dword ptr [rdx + r8*4], ebx
0x100a69df5: or r13d, ecx
0x100a69df8: mov rcx, qword ptr [rdi + 0xa0]
0x100a69dff: mov rbx, r13
0x100a69e02: shl rbx, 5
0x100a69e06: mov qword ptr [rcx + rbx + 0x18], 0
0x100a69e0f: mov qword ptr [rcx + rbx + 0x10], 0
0x100a69e18: mov qword ptr [rcx + rbx + 8], 0
0x100a69e21: mov qword ptr [rcx + rbx], 0
0x100a69e29: cmp dword ptr [rdi + 0x98], r13d
0x100a69e30: jbe 0x100a6a64c
0x100a69e36: mov rcx, qword ptr [rdi + 0xa8]
0x100a69e3d: and eax, 0x7ffffff
0x100a69e42: test dword ptr [rcx + rax*4], esi
0x100a69e45: je 0x100a6a676
0x100a69e4b: mov qword ptr [rbp - 0x58], rdi
0x100a69e4f: mov r14, qword ptr [rdi + 0xa0]
0x100a69e56: mov rdi, qword ptr [rip + 0x201753] ; 0x100c6b5b0
0x100a69e5d: mov rsi, qword ptr [rip + 0x2000ec] ; 0x100c69f50
0x100a69e64: call qword ptr [rip + 0x1a3ca6] ; 0x100c0db10
0x100a69e6a: mov rdi, rax
0x100a69e6d: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a69e72: lea rcx, [r14 + rbx + 8]
0x100a69e77: mov qword ptr [rbp - 0x30], rcx
0x100a69e7b: mov rdi, qword ptr [r14 + rbx + 8]
0x100a69e80: mov qword ptr [r14 + rbx + 8], rax
0x100a69e85: mov r15, qword ptr [rip + 0x1a3c8c] ; 0x100c0db18
0x100a69e8c: call r15
0x100a69e8f: mov rdi, qword ptr [rip + 0x2010ca] ; 0x100c6af60
0x100a69e96: mov rdx, qword ptr [r12]
0x100a69e9a: mov rsi, qword ptr [rip + 0x1fd787] ; 0x100c67628
0x100a69ea1: call qword ptr [rip + 0x1a3c69] ; 0x100c0db10
0x100a69ea7: mov rdi, rax
0x100a69eaa: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a69eaf: mov rdi, qword ptr [r14 + rbx]
0x100a69eb3: mov qword ptr [r14 + rbx], rax
0x100a69eb7: call r15
0x100a69eba: movups xmm0, xmmword ptr [r12 + 0xc8]
0x100a69ec3: movups xmmword ptr [r14 + rbx + 0x10], xmm0
0x100a69ec9: mov rbx, qword ptr [rip + 0x1a3c40] ; 0x100c0db10
0x100a69ed0: mov rax, qword ptr [rip + 0x1fffb1] ; 0x100c69e88
0x100a69ed7: mov qword ptr [rbp - 0x48], rax
0x100a69edb: mov rax, qword ptr [rip + 0x1fd83e] ; 0x100c67720
0x100a69ee2: mov qword ptr [rbp - 0x40], rax
0x100a69ee6: mov rax, qword ptr [rip + 0x20006b] ; 0x100c69f58
0x100a69eed: mov qword ptr [rbp - 0x78], rax
0x100a69ef1: mov rax, qword ptr [rip + 0x200080] ; 0x100c69f78
0x100a69ef8: mov qword ptr [rbp - 0xb0], rax
0x100a69eff: mov rax, qword ptr [rip + 0x20005a] ; 0x100c69f60
0x100a69f06: mov qword ptr [rbp - 0x70], rax
0x100a69f0a: mov rax, qword ptr [rip + 0x200057] ; 0x100c69f68
0x100a69f11: mov qword ptr [rbp - 0x68], rax
0x100a69f15: mov rax, qword ptr [rip + 0x200054] ; 0x100c69f70
0x100a69f1c: mov qword ptr [rbp - 0xa8], rax
0x100a69f23: mov qword ptr [rbp - 0x50], r12
0x100a69f27: lea r12, [r12 + 0x20]
0x100a69f2c: xor eax, eax
0x100a69f2e: mov qword ptr [rbp - 0x38], rax
0x100a69f32: nop word ptr cs:[rax + rax]
0x100a69f40: mov r8d, dword ptr [r12 - 0x18]
0x100a69f45: test r8d, r8d
0x100a69f48: js 0x100a6a1c5
0x100a69f4e: mov rdx, qword ptr [rbp - 0x58]
0x100a69f52: cmp dword ptr [rdx + 0xd8], r8d
0x100a69f59: jbe 0x100a6a597
0x100a69f5f: mov rax, qword ptr [rdx + 0xe8]
0x100a69f66: mov ecx, r8d
0x100a69f69: shr ecx, 5
0x100a69f6c: mov eax, dword ptr [rax + rcx*4]
0x100a69f6f: bt eax, r8d
0x100a69f73: jae 0x100a6a5be
0x100a69f79: mov rax, qword ptr [rdx + 0xe0]
0x100a69f80: lea rcx, [r8 + r8*2]
0x100a69f84: shl rcx, 4
0x100a69f88: cmp dword ptr [rax + rcx + 0xc], 1
0x100a69f8d: jne 0x100a6a5e5
0x100a69f93: mov r14, qword ptr [rax + rcx + 0x18]
0x100a69f98: mov rax, qword ptr [rbp - 0x30]
0x100a69f9c: mov rdi, qword ptr [rax]
0x100a69f9f: mov rsi, qword ptr [rbp - 0x48]
0x100a69fa3: call rbx
0x100a69fa5: mov rdi, rax
0x100a69fa8: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a69fad: mov r15, rax
0x100a69fb0: mov rdi, r15
0x100a69fb3: mov rsi, qword ptr [rbp - 0x40]
0x100a69fb7: mov rdx, qword ptr [rbp - 0x38]
0x100a69fbb: call rbx
0x100a69fbd: mov qword ptr [rbp - 0x60], r12
0x100a69fc1: mov rdi, rax
0x100a69fc4: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a69fc9: mov r12, rbx
0x100a69fcc: mov rbx, rax
0x100a69fcf: mov rdi, rbx
0x100a69fd2: mov rsi, qword ptr [rbp - 0x78]
0x100a69fd6: mov rdx, r14
0x100a69fd9: call r12
0x100a69fdc: mov rdi, rbx
0x100a69fdf: mov rax, qword ptr [rip + 0x1a3b32] ; 0x100c0db18
0x100a69fe6: mov rbx, rax
0x100a69fe9: call rbx
0x100a69feb: mov rdi, r15
0x100a69fee: call rbx
0x100a69ff0: mov rax, qword ptr [rbp - 0x60]
0x100a69ff4: mov r14d, dword ptr [rax - 0x14]
0x100a69ff8: mov rax, qword ptr [rbp - 0x30]
0x100a69ffc: mov rdi, qword ptr [rax]
0x100a69fff: mov rsi, qword ptr [rbp - 0x48]
0x100a6a003: call r12
0x100a6a006: mov rdi, rax
0x100a6a009: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a6a00e: mov r15, rax
0x100a6a011: mov rdi, r15
0x100a6a014: mov rsi, qword ptr [rbp - 0x40]
0x100a6a018: mov rdx, qword ptr [rbp - 0x38]
0x100a6a01c: call r12
0x100a6a01f: xor ebx, ebx
0x100a6a021: cmp r14d, 1
0x100a6a025: sete bl
0x100a6a028: add rbx, rbx
0x100a6a02b: cmp r14d, 2
0x100a6a02f: mov ecx, 1
0x100a6a034: cmove rbx, rcx
0x100a6a038: mov rdi, rax
0x100a6a03b: call qword ptr [rip + 0x1a3adf] ; 0x100c0db20
0x100a6a041: mov r14, rax
0x100a6a044: mov rdi, r14
0x100a6a047: mov rsi, qword ptr [rbp - 0x70]
0x100a6a04b: mov rdx, rbx
0x100a6a04e: mov rbx, qword ptr [rip + 0x1a3abb] ; 0x100c0db10
0x100a6a055: call rbx
0x100a6a057: mov rdi, r14
0x100a6a05a: mov rax, qword ptr [rip + 0x1a3ab7] ; 0x100c0db18
0x100a6a061: mov r14, rax
0x100a6a064: call r14
0x100a6a067: mov rdi, r15
0x100a6a06a: call r14
0x100a6a06d: mov rax, qword ptr [rbp - 0x60]
0x100a6a071: mov r14d, dword ptr [rax - 0x10]
0x100a6a075: mov rax, qword ptr [rbp - 0x30]
0x100a6a079: mov rdi, qword ptr [rax]
0x100a6a07c: mov rsi, qword ptr [rbp - 0x48]
0x100a6a080: call rbx
0x100a6a082: mov rdi, rax
0x100a6a085: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a6a08a: mov r15, rax
0x100a6a08d: mov rdi, r15
0x100a6a090: mov rsi, qword ptr [rbp - 0x40]
0x100a6a094: mov rdx, qword ptr [rbp - 0x38]
0x100a6a098: call rbx
0x100a6a09a: xor ebx, ebx
0x100a6a09c: cmp r14d, 1
0x100a6a0a0: sete bl
0x100a6a0a3: cmp r14d, 2
0x100a6a0a7: mov ecx, 2
0x100a6a0ac: cmove rbx, rcx
0x100a6a0b0: mov rdi, rax
0x100a6a0b3: call qword ptr [rip + 0x1a3a67] ; 0x100c0db20
0x100a6a0b9: mov r14, rax
0x100a6a0bc: mov rdi, r14
0x100a6a0bf: mov rsi, qword ptr [rbp - 0x68]
0x100a6a0c3: mov rdx, rbx
0x100a6a0c6: mov r12, qword ptr [rip + 0x1a3a43] ; 0x100c0db10
0x100a6a0cd: call r12
0x100a6a0d0: mov rdi, r14
0x100a6a0d3: mov rax, qword ptr [rip + 0x1a3a3e] ; 0x100c0db18
0x100a6a0da: mov rbx, rax
0x100a6a0dd: call rbx
0x100a6a0df: mov rdi, r15
0x100a6a0e2: call rbx
0x100a6a0e4: mov rax, qword ptr [rbp - 0x60]
0x100a6a0e8: movsd xmm0, qword ptr [rax - 8]
0x100a6a0ed: movaps xmmword ptr [rbp - 0xa0], xmm0
0x100a6a0f4: movsd xmm0, qword ptr [rax]
0x100a6a0f8: movaps xmmword ptr [rbp - 0x90], xmm0
0x100a6a0ff: mov rax, qword ptr [rbp - 0x30]
0x100a6a103: mov rdi, qword ptr [rax]
0x100a6a106: mov rsi, qword ptr [rbp - 0x48]
0x100a6a10a: call r12
0x100a6a10d: mov rdi, rax
0x100a6a110: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a6a115: mov r15, rax
0x100a6a118: mov rdi, r15
0x100a6a11b: mov rsi, qword ptr [rbp - 0x40]
0x100a6a11f: mov rdx, qword ptr [rbp - 0x38]
0x100a6a123: call r12
0x100a6a126: cvtps2pd xmm0, qword ptr [rbp - 0x90]
0x100a6a12d: movaps xmmword ptr [rbp - 0x90], xmm0
0x100a6a134: cvtps2pd xmm0, qword ptr [rbp - 0xa0]
0x100a6a13b: movaps xmmword ptr [rbp - 0xa0], xmm0
0x100a6a142: mov rdi, rax
0x100a6a145: call qword ptr [rip + 0x1a39d5] ; 0x100c0db20
0x100a6a14b: mov rbx, rax
0x100a6a14e: movaps xmm0, xmmword ptr [rbp - 0xa0]
0x100a6a155: movaps xmmword ptr [rbp - 0xd0], xmm0
0x100a6a15c: movaps xmm0, xmmword ptr [rbp - 0x90]
0x100a6a163: movaps xmmword ptr [rbp - 0xc0], xmm0
0x100a6a16a: mov rax, qword ptr [rbp - 0xb8]
0x100a6a171: mov qword ptr [rsp + 0x18], rax
0x100a6a176: mov rax, qword ptr [rbp - 0xc0]
0x100a6a17d: mov qword ptr [rsp + 0x10], rax
0x100a6a182: mov rax, qword ptr [rbp - 0xd0]
0x100a6a189: mov rcx, qword ptr [rbp - 0xc8]
0x100a6a190: mov qword ptr [rsp + 8], rcx
0x100a6a195: mov qword ptr [rsp], rax
0x100a6a199: mov rdi, rbx
0x100a6a19c: mov rsi, qword ptr [rbp - 0xa8]
0x100a6a1a3: call r12
0x100a6a1a6: mov rdi, rbx
0x100a6a1a9: mov rax, qword ptr [rip + 0x1a3968] ; 0x100c0db18
0x100a6a1b0: mov rbx, rax
0x100a6a1b3: call rbx
0x100a6a1b5: mov rdi, r15
0x100a6a1b8: call rbx
0x100a6a1ba: mov rbx, qword ptr [rip + 0x1a394f] ; 0x100c0db10
0x100a6a1c1: mov r12, qword ptr [rbp - 0x60]
0x100a6a1c5: mov r8d, dword ptr [r12 - 0xc]
0x100a6a1ca: test r8d, r8d
0x100a6a1cd: js 0x100a6a27a
0x100a6a1d3: mov rdx, qword ptr [rbp - 0x58]
0x100a6a1d7: cmp dword ptr [rdx + 0xd8], r8d
0x100a6a1de: jbe 0x100a6a597
0x100a6a1e4: mov rax, qword ptr [rdx + 0xe8]
0x100a6a1eb: mov ecx, r8d
0x100a6a1ee: shr ecx, 5
0x100a6a1f1: mov eax, dword ptr [rax + rcx*4]
0x100a6a1f4: bt eax, r8d
0x100a6a1f8: jae 0x100a6a5be
0x100a6a1fe: mov rax, qword ptr [rdx + 0xe0]
0x100a6a205: lea rcx, [r8 + r8*2]
0x100a6a209: shl rcx, 4
0x100a6a20d: cmp dword ptr [rax + rcx + 0xc], 1
0x100a6a212: jne 0x100a6a605
0x100a6a218: mov r14, qword ptr [rax + rcx + 0x18]
0x100a6a21d: mov rax, qword ptr [rbp - 0x30]
0x100a6a221: mov rdi, qword ptr [rax]
0x100a6a224: mov rsi, qword ptr [rbp - 0x48]
0x100a6a228: call rbx
0x100a6a22a: mov rdi, rax
0x100a6a22d: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a6a232: mov r15, rax
0x100a6a235: mov rdi, r15
0x100a6a238: mov rsi, qword ptr [rbp - 0x40]
0x100a6a23c: mov rdx, qword ptr [rbp - 0x38]
0x100a6a240: call rbx
0x100a6a242: mov rdi, rax
0x100a6a245: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a6a24a: mov rcx, rbx
0x100a6a24d: mov rbx, rax
0x100a6a250: mov rdi, rbx
0x100a6a253: mov rsi, qword ptr [rbp - 0xb0]
0x100a6a25a: mov rdx, r14
0x100a6a25d: call rcx
0x100a6a25f: mov rdi, rbx
0x100a6a262: mov rax, qword ptr [rip + 0x1a38af] ; 0x100c0db18
0x100a6a269: mov rbx, rax
0x100a6a26c: call rbx
0x100a6a26e: mov rdi, r15
0x100a6a271: call rbx
0x100a6a273: mov rbx, qword ptr [rip + 0x1a3896] ; 0x100c0db10
0x100a6a27a: mov rax, qword ptr [rbp - 0x38]
0x100a6a27e: mov rcx, rax
0x100a6a281: inc rcx
0x100a6a284: add r12, 0x20
0x100a6a288: mov rax, rcx
0x100a6a28b: mov qword ptr [rbp - 0x38], rax
0x100a6a28f: cmp rcx, 4
0x100a6a293: jb 0x100a69f40
0x100a6a299: mov rax, qword ptr [rbp - 0x50]
0x100a6a29d: mov r8d, dword ptr [rax + 0x88]
0x100a6a2a4: test r8d, r8d
0x100a6a2a7: js 0x100a6a413
0x100a6a2ad: mov rdx, qword ptr [rbp - 0x58]
0x100a6a2b1: cmp dword ptr [rdx + 0xd8], r8d
0x100a6a2b8: jbe 0x100a6a597
0x100a6a2be: mov rax, qword ptr [rdx + 0xe8]
0x100a6a2c5: mov ecx, r8d
0x100a6a2c8: shr ecx, 5
0x100a6a2cb: mov eax, dword ptr [rax + rcx*4]
0x100a6a2ce: bt eax, r8d
0x100a6a2d2: jae 0x100a6a5be
0x100a6a2d8: mov rax, qword ptr [rdx + 0xe0]
0x100a6a2df: lea rcx, [r8 + r8*2]
0x100a6a2e3: shl rcx, 4
0x100a6a2e7: cmp dword ptr [rax + rcx + 0xc], 1
0x100a6a2ec: jne 0x100a6a6a0
0x100a6a2f2: mov r15, qword ptr [rax + rcx + 0x18]
0x100a6a2f7: mov rax, qword ptr [rbp - 0x30]
0x100a6a2fb: mov rdi, qword ptr [rax]
0x100a6a2fe: mov rsi, qword ptr [rip + 0x1ffc7b] ; 0x100c69f80
0x100a6a305: call rbx
0x100a6a307: mov rdi, rax
0x100a6a30a: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a6a30f: mov r14, rbx
0x100a6a312: mov rbx, rax
0x100a6a315: mov rdi, rbx
0x100a6a318: mov rsi, qword ptr [rbp - 0x78]
0x100a6a31c: mov rdx, r15
0x100a6a31f: call r14
0x100a6a322: mov rdi, rbx
0x100a6a325: call qword ptr [rip + 0x1a37ed] ; 0x100c0db18
0x100a6a32b: mov r12, qword ptr [rbp - 0x50]
0x100a6a32f: mov eax, dword ptr [r12 + 0x8c]
0x100a6a337: xor ecx, ecx
0x100a6a339: cmp eax, 1
0x100a6a33c: sete cl
0x100a6a33f: add rcx, rcx
0x100a6a342: cmp eax, 2
0x100a6a345: mov ebx, 1
0x100a6a34a: cmovne rbx, rcx
0x100a6a34e: mov rax, qword ptr [rbp - 0x30]
0x100a6a352: mov rdi, qword ptr [rax]
0x100a6a355: mov rsi, qword ptr [rip + 0x1ffc24] ; 0x100c69f80
0x100a6a35c: call r14
0x100a6a35f: mov rdi, rax
0x100a6a362: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a6a367: mov r15, rax
0x100a6a36a: mov rdi, r15
0x100a6a36d: mov rsi, qword ptr [rbp - 0x70]
0x100a6a371: mov rdx, rbx
0x100a6a374: call r14
0x100a6a377: mov rdi, r15
0x100a6a37a: call qword ptr [rip + 0x1a3798] ; 0x100c0db18
0x100a6a380: mov eax, dword ptr [r12 + 0x90]
0x100a6a388: xor ecx, ecx
0x100a6a38a: cmp eax, 1
0x100a6a38d: sete cl
0x100a6a390: cmp eax, 2
0x100a6a393: mov ebx, 2
0x100a6a398: cmovne rbx, rcx
0x100a6a39c: mov rax, qword ptr [rbp - 0x30]
0x100a6a3a0: mov rdi, qword ptr [rax]
0x100a6a3a3: mov rsi, qword ptr [rip + 0x1ffbd6] ; 0x100c69f80
0x100a6a3aa: call r14
0x100a6a3ad: mov rdi, rax
0x100a6a3b0: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a6a3b5: mov r15, rax
0x100a6a3b8: mov rdi, r15
0x100a6a3bb: mov rsi, qword ptr [rbp - 0x68]
0x100a6a3bf: mov rdx, rbx
0x100a6a3c2: call r14
0x100a6a3c5: mov rdi, r15
0x100a6a3c8: call qword ptr [rip + 0x1a374a] ; 0x100c0db18
0x100a6a3ce: mov rax, qword ptr [rbp - 0x30]
0x100a6a3d2: mov rdi, qword ptr [rax]
0x100a6a3d5: mov rsi, qword ptr [rip + 0x1ffba4] ; 0x100c69f80
0x100a6a3dc: call r14
0x100a6a3df: mov rdi, rax
0x100a6a3e2: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a6a3e7: mov rbx, rax
0x100a6a3ea: mov rsi, qword ptr [rip + 0x1ffb97] ; 0x100c69f88
0x100a6a3f1: movsd xmm0, qword ptr [rip + 0x3bab7] ; 0x100aa5eb0
0x100a6a3f9: mov rdi, rbx
0x100a6a3fc: call r14
0x100a6a3ff: mov rdi, rbx
0x100a6a402: call qword ptr [rip + 0x1a3710] ; 0x100c0db18
0x100a6a408: mov rbx, qword ptr [rip + 0x1a3701] ; 0x100c0db10
0x100a6a40f: mov rax, qword ptr [rbp - 0x50]
0x100a6a413: mov r8d, dword ptr [rax + 0xa8]
0x100a6a41a: test r8d, r8d
0x100a6a41d: mov rdx, qword ptr [rbp - 0x58]
0x100a6a421: js 0x100a6a582
0x100a6a427: cmp dword ptr [rdx + 0xd8], r8d
0x100a6a42e: jbe 0x100a6a597
0x100a6a434: mov rax, qword ptr [rdx + 0xe8]
0x100a6a43b: mov ecx, r8d
0x100a6a43e: shr ecx, 5
0x100a6a441: mov eax, dword ptr [rax + rcx*4]
0x100a6a444: bt eax, r8d
0x100a6a448: jae 0x100a6a5be
0x100a6a44e: mov rax, qword ptr [rdx + 0xe0]
0x100a6a455: lea rcx, [r8 + r8*2]
0x100a6a459: shl rcx, 4
0x100a6a45d: cmp dword ptr [rax + rcx + 0xc], 1
0x100a6a462: jne 0x100a6a6c0
0x100a6a468: mov r15, qword ptr [rax + rcx + 0x18]
0x100a6a46d: mov rax, qword ptr [rbp - 0x30]
0x100a6a471: mov rdi, qword ptr [rax]
0x100a6a474: mov rsi, qword ptr [rip + 0x1ffb15] ; 0x100c69f90
0x100a6a47b: call rbx
0x100a6a47d: mov rdi, rax
0x100a6a480: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a6a485: mov r14, rbx
0x100a6a488: mov rbx, rax
0x100a6a48b: mov rdi, rbx
0x100a6a48e: mov rsi, qword ptr [rbp - 0x78]
0x100a6a492: mov rdx, r15
0x100a6a495: call r14
0x100a6a498: mov rdi, rbx
0x100a6a49b: call qword ptr [rip + 0x1a3677] ; 0x100c0db18
0x100a6a4a1: mov r12, qword ptr [rbp - 0x50]
0x100a6a4a5: mov eax, dword ptr [r12 + 0xac]
0x100a6a4ad: xor ecx, ecx
0x100a6a4af: cmp eax, 1
0x100a6a4b2: sete cl
0x100a6a4b5: add rcx, rcx
0x100a6a4b8: cmp eax, 2
0x100a6a4bb: mov ebx, 1
0x100a6a4c0: cmovne rbx, rcx
0x100a6a4c4: mov rax, qword ptr [rbp - 0x30]
0x100a6a4c8: mov rdi, qword ptr [rax]
0x100a6a4cb: mov rsi, qword ptr [rip + 0x1ffabe] ; 0x100c69f90
0x100a6a4d2: call r14
0x100a6a4d5: mov rdi, rax
0x100a6a4d8: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a6a4dd: mov r15, rax
0x100a6a4e0: mov rdi, r15
0x100a6a4e3: mov rsi, qword ptr [rbp - 0x70]
0x100a6a4e7: mov rdx, rbx
0x100a6a4ea: call r14
0x100a6a4ed: mov rdi, r15
0x100a6a4f0: call qword ptr [rip + 0x1a3622] ; 0x100c0db18
0x100a6a4f6: mov eax, dword ptr [r12 + 0xb0]
0x100a6a4fe: xor ecx, ecx
0x100a6a500: cmp eax, 1
0x100a6a503: sete cl
0x100a6a506: cmp eax, 2
0x100a6a509: mov ebx, 2
0x100a6a50e: cmovne rbx, rcx
0x100a6a512: mov rax, qword ptr [rbp - 0x30]
0x100a6a516: mov rdi, qword ptr [rax]
0x100a6a519: mov rsi, qword ptr [rip + 0x1ffa70] ; 0x100c69f90
0x100a6a520: call r14
0x100a6a523: mov rdi, rax
0x100a6a526: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a6a52b: mov r15, rax
0x100a6a52e: mov rdi, r15
0x100a6a531: mov rsi, qword ptr [rbp - 0x68]
0x100a6a535: mov rdx, rbx
0x100a6a538: call r14
0x100a6a53b: mov rdi, r15
0x100a6a53e: call qword ptr [rip + 0x1a35d4] ; 0x100c0db18
0x100a6a544: movzx r15d, byte ptr [r12 + 0xb8]
0x100a6a54d: mov rax, qword ptr [rbp - 0x30]
0x100a6a551: mov rdi, qword ptr [rax]
0x100a6a554: mov rsi, qword ptr [rip + 0x1ffa35] ; 0x100c69f90
0x100a6a55b: call r14
0x100a6a55e: mov rdi, rax
0x100a6a561: call 0x100aa29c0 ; 0x100aa29c0 _objc_retainAutoreleasedReturnValue
0x100a6a566: mov rbx, rax
0x100a6a569: mov rsi, qword ptr [rip + 0x1ffa28] ; 0x100c69f98
0x100a6a570: mov rdi, rbx
0x100a6a573: mov edx, r15d
0x100a6a576: call r14
0x100a6a579: mov rdi, rbx
0x100a6a57c: call qword ptr [rip + 0x1a3596] ; 0x100c0db18
0x100a6a582: mov eax, r13d
0x100a6a585: add rsp, 0xc8
0x100a6a58c: pop rbx
0x100a6a58d: pop r12
0x100a6a58f: pop r13
0x100a6a591: pop r14
0x100a6a593: pop r15
0x100a6a595: pop rbp
0x100a6a596: ret 
0x100a6a597: mov rcx, qword ptr [rdx + 0xd0]
0x100a6a59e: lea rdi, [rip + 0x1573fb] ; 0x100bc19a0 ../../../Code/Renderer/RendererUtils.h
0x100a6a5a5: lea rdx, [rip + 0x157439] ; 0x100bc19e5 %s: Attempted to access out of bounds [%u]
0x100a6a5ac: mov esi, 0x64
0x100a6a5b1: xor eax, eax
0x100a6a5b3: call qword ptr [rip + 0x12fdd4f] ; 0x101d68308
0x100a6a5b9: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6a5be: mov rcx, qword ptr [rdx + 0xd0]
0x100a6a5c5: lea rdi, [rip + 0x1573d4] ; 0x100bc19a0 ../../../Code/Renderer/RendererUtils.h
0x100a6a5cc: lea rdx, [rip + 0x15743d] ; 0x100bc1a10 %s: Attempted to access unallocated slot [%u]
0x100a6a5d3: mov esi, 0x65
0x100a6a5d8: xor eax, eax
0x100a6a5da: call qword ptr [rip + 0x12fdd28] ; 0x101d68308
0x100a6a5e0: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6a5e5: lea rdi, [rip + 0x156757] ; 0x100bc0d43 /Users/buildserver/.jenkins/workspace/Sky-Test/Code/Renderer/MetalRenderer/MetalRenderer.mm
0x100a6a5ec: lea rdx, [rip + 0x156b7c] ; 0x100bc116f m_textures[ desc.color[ i ].texture ].textureCount == 1
0x100a6a5f3: mov esi, 0x40b
0x100a6a5f8: xor eax, eax
0x100a6a5fa: call qword ptr [rip + 0x12fdd08] ; 0x101d68308
0x100a6a600: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6a605: lea rdi, [rip + 0x156737] ; 0x100bc0d43 /Users/buildserver/.jenkins/workspace/Sky-Test/Code/Renderer/MetalRenderer/MetalRenderer.mm
0x100a6a60c: lea rdx, [rip + 0x156b94] ; 0x100bc11a7 m_textures[ desc.color[ i ].resolve ].textureCount == 1
0x100a6a613: mov esi, 0x414
0x100a6a618: xor eax, eax
0x100a6a61a: call qword ptr [rip + 0x12fdce8] ; 0x101d68308
0x100a6a620: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6a625: mov rcx, qword ptr [rdi + 0x90]
0x100a6a62c: lea rdi, [rip + 0x15736d] ; 0x100bc19a0 ../../../Code/Renderer/RendererUtils.h
0x100a6a633: lea rdx, [rip + 0x15738d] ; 0x100bc19c7 %s: Exceeded maximum capacity
0x100a6a63a: mov esi, 0x6c
0x100a6a63f: xor eax, eax
0x100a6a641: call qword ptr [rip + 0x12fdcc1] ; 0x101d68308
0x100a6a647: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6a64c: mov rcx, qword ptr [rdi + 0x90]
0x100a6a653: lea rdi, [rip + 0x157346] ; 0x100bc19a0 ../../../Code/Renderer/RendererUtils.h
0x100a6a65a: lea rdx, [rip + 0x157384] ; 0x100bc19e5 %s: Attempted to access out of bounds [%u]
0x100a6a661: mov esi, 0x64
0x100a6a666: xor eax, eax
0x100a6a668: mov r8d, r13d
0x100a6a66b: call qword ptr [rip + 0x12fdc97] ; 0x101d68308
0x100a6a671: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6a676: mov rcx, qword ptr [rdi + 0x90]
0x100a6a67d: lea rdi, [rip + 0x15731c] ; 0x100bc19a0 ../../../Code/Renderer/RendererUtils.h
0x100a6a684: lea rdx, [rip + 0x157385] ; 0x100bc1a10 %s: Attempted to access unallocated slot [%u]
0x100a6a68b: mov esi, 0x65
0x100a6a690: xor eax, eax
0x100a6a692: mov r8d, r13d
0x100a6a695: call qword ptr [rip + 0x12fdc6d] ; 0x101d68308
0x100a6a69b: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6a6a0: lea rdi, [rip + 0x15669c] ; 0x100bc0d43 /Users/buildserver/.jenkins/workspace/Sky-Test/Code/Renderer/MetalRenderer/MetalRenderer.mm
0x100a6a6a7: lea rdx, [rip + 0x156b31] ; 0x100bc11df m_textures[ desc.depth.texture ].textureCount == 1
0x100a6a6ae: mov esi, 0x41b
0x100a6a6b3: xor eax, eax
0x100a6a6b5: call qword ptr [rip + 0x12fdc4d] ; 0x101d68308
0x100a6a6bb: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6a6c0: lea rdi, [rip + 0x15667c] ; 0x100bc0d43 /Users/buildserver/.jenkins/workspace/Sky-Test/Code/Renderer/MetalRenderer/MetalRenderer.mm
0x100a6a6c7: lea rdx, [rip + 0x156b44] ; 0x100bc1212 m_textures[ desc.stencil.texture ].textureCount == 1
0x100a6a6ce: mov esi, 0x425
0x100a6a6d3: xor eax, eax
0x100a6a6d5: call qword ptr [rip + 0x12fdc2d] ; 0x101d68308
0x100a6a6db: call 0x100aa2564 ; 0x100aa2564 _abort
0x100a6a6e0: jmp 0x100a6a6fa ; 0x100a6a6fa
0x100a6a6e2: mov r12, rax
0x100a6a6e5: jmp 0x100a6a73e ; 0x100a6a73e
0x100a6a6e7: mov r12, rax
0x100a6a6ea: jmp 0x100a6a73e ; 0x100a6a73e
0x100a6a6ec: jmp 0x100a6a6fa ; 0x100a6a6fa
0x100a6a6ee: jmp 0x100a6a6fa ; 0x100a6a6fa
0x100a6a6f0: mov r12, rax
0x100a6a6f3: jmp 0x100a6a73e ; 0x100a6a73e
0x100a6a6f5: mov r12, rax
0x100a6a6f8: jmp 0x100a6a73e ; 0x100a6a73e
0x100a6a6fa: mov r12, rax
0x100a6a6fd: mov rdi, rbx
0x100a6a700: call qword ptr [rip + 0x1a3412] ; 0x100c0db18
0x100a6a706: mov rdi, r12
0x100a6a709: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100a6a70e: ud2 
0x100a6a710: jmp 0x100a6a732 ; 0x100a6a732
0x100a6a712: mov r12, rax
0x100a6a715: jmp 0x100a6a73e ; 0x100a6a73e
0x100a6a717: jmp 0x100a6a732 ; 0x100a6a732
0x100a6a719: jmp 0x100a6a725 ; 0x100a6a725
0x100a6a71b: mov r12, rax
0x100a6a71e: jmp 0x100a6a73e ; 0x100a6a73e
0x100a6a720: mov r12, rax
0x100a6a723: jmp 0x100a6a73e ; 0x100a6a73e
0x100a6a725: mov r12, rax
0x100a6a728: mov rdi, r14
0x100a6a72b: jmp 0x100a6a738 ; 0x100a6a738
0x100a6a72d: mov r12, rax
0x100a6a730: jmp 0x100a6a73e ; 0x100a6a73e
0x100a6a732: mov r12, rax
0x100a6a735: mov rdi, rbx
0x100a6a738: call qword ptr [rip + 0x1a33da] ; 0x100c0db18
0x100a6a73e: mov rdi, r15
0x100a6a741: call qword ptr [rip + 0x1a33d1] ; 0x100c0db18
0x100a6a747: mov rdi, r12
0x100a6a74a: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100a6a74f: ud2 
0x100a6a751: mov r12, rax
0x100a6a754: jmp 0x100a6a73e ; 0x100a6a73e
0x100a6a756: nop word ptr cs:[rax + rax]
