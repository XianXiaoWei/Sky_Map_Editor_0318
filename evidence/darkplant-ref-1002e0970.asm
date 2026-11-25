0x1002e0970: push rbp
0x1002e0971: mov rbp, rsp
0x1002e0974: push r15
0x1002e0976: push r14
0x1002e0978: push r13
0x1002e097a: push r12
0x1002e097c: push rbx
0x1002e097d: sub rsp, 0x48
0x1002e0981: mov rbx, rsi
0x1002e0984: mov r12, rdi
0x1002e0987: mov rax, qword ptr [rip + 0x92cf4a] ; 0x100c0d8d8
0x1002e098e: mov rax, qword ptr [rax]
0x1002e0991: mov qword ptr [rbp - 0x30], rax
0x1002e0995: lea rsi, [rip + 0x89eea5] ; 0x100b7f841 dummyEmitterDef
0x1002e099c: lea r15, [rbp - 0x70]
0x1002e09a0: mov edx, 0x40
0x1002e09a5: mov rdi, r15
0x1002e09a8: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e09ad: movsx edi, byte ptr [rbp - 0x70]
0x1002e09b1: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e09b6: mov byte ptr [rbp - 0x70], al
0x1002e09b9: mov rdx, qword ptr [rip + 0x1b0eca8] ; 0x101def668
0x1002e09c0: mov esi, 0x120
0x1002e09c5: mov ecx, 0x10
0x1002e09ca: mov rdi, rbx
0x1002e09cd: call 0x100795530 ; 0x100795530
0x1002e09d2: vmovaps xmm0, xmmword ptr [rip + 0x7cc486] ; 0x100aace60
0x1002e09da: vmovups xmmword ptr [rax], xmm0
0x1002e09de: mov word ptr [rax + 0x10], 0x100
0x1002e09e4: mov byte ptr [rax + 0x12], 0
0x1002e09e8: mov qword ptr [rax + 0x14], 0
0x1002e09f0: vxorps xmm0, xmm0, xmm0
0x1002e09f4: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e09f9: mov dword ptr [rax + 0x28], 0
0x1002e0a00: vmovaps xmm0, xmmword ptr [rip + 0x7d8ca8] ; 0x100ab96b0
0x1002e0a08: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e0a0d: mov byte ptr [rax + 0x40], 0
0x1002e0a11: vxorps ymm0, ymm0, ymm0
0x1002e0a15: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e0a1d: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e0a22: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e0a27: movabs r14, 0x40d0000040600000
0x1002e0a31: mov qword ptr [rax + 0xa4], r14
0x1002e0a38: lea r13, [rip + 0x1d5eca1] ; 0x10203f6e0
0x1002e0a3f: vmovaps xmm0, xmmword ptr [r13]
0x1002e0a45: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e0a4d: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e0a55: vxorps xmm0, xmm0, xmm0
0x1002e0a59: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e0a61: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e0a6b: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e0a73: movabs rcx, 0x3f80000000000000
0x1002e0a7d: mov qword ptr [rax + 0xf4], rcx
0x1002e0a84: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e0a8c: mov qword ptr [rax + 0x10c], rcx
0x1002e0a93: mov byte ptr [rax + 0x114], 1
0x1002e0a9a: mov qword ptr [rax + 0x118], 0
0x1002e0aa5: mov qword ptr [rip + 0x1b0ebc4], rax ; 0x101def670
0x1002e0aac: mov rdi, r12
0x1002e0aaf: mov rsi, rax
0x1002e0ab2: mov rdx, r15
0x1002e0ab5: vzeroupper 
0x1002e0ab8: call 0x100314920 ; 0x100314920
0x1002e0abd: lea rsi, [rip + 0x89ed8d] ; 0x100b7f851 avatarCol
0x1002e0ac4: mov edx, 0x40
0x1002e0ac9: mov rdi, r15
0x1002e0acc: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e0ad1: movsx edi, byte ptr [rbp - 0x70]
0x1002e0ad5: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e0ada: mov byte ptr [rbp - 0x70], al
0x1002e0add: mov rdx, qword ptr [rip + 0x1b0eb84] ; 0x101def668
0x1002e0ae4: mov esi, 0x120
0x1002e0ae9: mov ecx, 0x10
0x1002e0aee: mov rdi, rbx
0x1002e0af1: call 0x100795530 ; 0x100795530
0x1002e0af6: vmovaps xmm0, xmmword ptr [rip + 0x7cc362] ; 0x100aace60
0x1002e0afe: vmovups xmmword ptr [rax], xmm0
0x1002e0b02: mov word ptr [rax + 0x10], 0x100
0x1002e0b08: mov byte ptr [rax + 0x12], 0
0x1002e0b0c: mov qword ptr [rax + 0x14], 0
0x1002e0b14: vxorps xmm0, xmm0, xmm0
0x1002e0b18: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e0b1d: mov dword ptr [rax + 0x28], 0
0x1002e0b24: vmovaps xmm0, xmmword ptr [rip + 0x7d8b84] ; 0x100ab96b0
0x1002e0b2c: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e0b31: mov byte ptr [rax + 0x40], 0
0x1002e0b35: vxorps ymm0, ymm0, ymm0
0x1002e0b39: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e0b41: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e0b46: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e0b4b: mov qword ptr [rax + 0xa4], r14
0x1002e0b52: vmovaps xmm0, xmmword ptr [r13]
0x1002e0b58: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e0b60: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e0b68: vxorps xmm0, xmm0, xmm0
0x1002e0b6c: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e0b74: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e0b7e: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e0b86: movabs rcx, 0x3f80000000000000
0x1002e0b90: mov qword ptr [rax + 0xf4], rcx
0x1002e0b97: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e0b9f: mov qword ptr [rax + 0x10c], rcx
0x1002e0ba6: mov byte ptr [rax + 0x114], 1
0x1002e0bad: mov qword ptr [rax + 0x118], 0
0x1002e0bb8: mov qword ptr [rip + 0x1b0eab9], rax ; 0x101def678
0x1002e0bbf: mov rdi, r12
0x1002e0bc2: mov rsi, rax
0x1002e0bc5: mov rdx, r15
0x1002e0bc8: vzeroupper 
0x1002e0bcb: call 0x100314920 ; 0x100314920
0x1002e0bd0: lea rsi, [rip + 0x89ec84] ; 0x100b7f85b avatarWake
0x1002e0bd7: mov edx, 0x40
0x1002e0bdc: mov rdi, r15
0x1002e0bdf: mov r13, r15
0x1002e0be2: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e0be7: movsx edi, byte ptr [rbp - 0x70]
0x1002e0beb: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e0bf0: mov byte ptr [rbp - 0x70], al
0x1002e0bf3: mov rdx, qword ptr [rip + 0x1b0ea6e] ; 0x101def668
0x1002e0bfa: mov esi, 0x120
0x1002e0bff: mov ecx, 0x10
0x1002e0c04: mov rdi, rbx
0x1002e0c07: call 0x100795530 ; 0x100795530
0x1002e0c0c: vmovaps xmm0, xmmword ptr [rip + 0x7cc24c] ; 0x100aace60
0x1002e0c14: vmovups xmmword ptr [rax], xmm0
0x1002e0c18: mov word ptr [rax + 0x10], 0x100
0x1002e0c1e: mov byte ptr [rax + 0x12], 0
0x1002e0c22: mov qword ptr [rax + 0x14], 0
0x1002e0c2a: vxorps xmm0, xmm0, xmm0
0x1002e0c2e: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e0c33: mov dword ptr [rax + 0x28], 0
0x1002e0c3a: vmovaps xmm0, xmmword ptr [rip + 0x7d8a6e] ; 0x100ab96b0
0x1002e0c42: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e0c47: mov byte ptr [rax + 0x40], 0
0x1002e0c4b: vxorps ymm0, ymm0, ymm0
0x1002e0c4f: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e0c57: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e0c5c: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e0c61: mov qword ptr [rax + 0xa4], r14
0x1002e0c68: lea r15, [rip + 0x1d5ea71] ; 0x10203f6e0
0x1002e0c6f: vmovaps xmm0, xmmword ptr [r15]
0x1002e0c74: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e0c7c: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e0c84: vxorps xmm0, xmm0, xmm0
0x1002e0c88: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e0c90: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e0c9a: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e0ca2: movabs rcx, 0x3f80000000000000
0x1002e0cac: mov qword ptr [rax + 0xf4], rcx
0x1002e0cb3: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e0cbb: mov qword ptr [rax + 0x10c], rcx
0x1002e0cc2: mov byte ptr [rax + 0x114], 1
0x1002e0cc9: mov qword ptr [rax + 0x118], 0
0x1002e0cd4: mov qword ptr [rip + 0x1b0e9a5], rax ; 0x101def680
0x1002e0cdb: mov rdi, r12
0x1002e0cde: mov rsi, rax
0x1002e0ce1: mov rdx, r13
0x1002e0ce4: vzeroupper 
0x1002e0ce7: call 0x100314920 ; 0x100314920
0x1002e0cec: lea rsi, [rip + 0x89eb73] ; 0x100b7f866 avatarEnv
0x1002e0cf3: mov edx, 0x40
0x1002e0cf8: mov rdi, r13
0x1002e0cfb: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e0d00: movsx edi, byte ptr [rbp - 0x70]
0x1002e0d04: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e0d09: mov byte ptr [rbp - 0x70], al
0x1002e0d0c: mov rdx, qword ptr [rip + 0x1b0e955] ; 0x101def668
0x1002e0d13: mov esi, 0x120
0x1002e0d18: mov ecx, 0x10
0x1002e0d1d: mov rdi, rbx
0x1002e0d20: call 0x100795530 ; 0x100795530
0x1002e0d25: vmovaps xmm0, xmmword ptr [rip + 0x7cc133] ; 0x100aace60
0x1002e0d2d: vmovups xmmword ptr [rax], xmm0
0x1002e0d31: mov word ptr [rax + 0x10], 0x100
0x1002e0d37: mov byte ptr [rax + 0x12], 0
0x1002e0d3b: mov qword ptr [rax + 0x14], 0
0x1002e0d43: vxorps xmm0, xmm0, xmm0
0x1002e0d47: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e0d4c: mov dword ptr [rax + 0x28], 0
0x1002e0d53: vmovaps xmm0, xmmword ptr [rip + 0x7d8955] ; 0x100ab96b0
0x1002e0d5b: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e0d60: mov byte ptr [rax + 0x40], 0
0x1002e0d64: vxorps ymm0, ymm0, ymm0
0x1002e0d68: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e0d70: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e0d75: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e0d7a: mov qword ptr [rax + 0xa4], r14
0x1002e0d81: vmovaps xmm0, xmmword ptr [r15]
0x1002e0d86: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e0d8e: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e0d96: vxorps xmm0, xmm0, xmm0
0x1002e0d9a: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e0da2: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e0dac: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e0db4: movabs rcx, 0x3f80000000000000
0x1002e0dbe: mov qword ptr [rax + 0xf4], rcx
0x1002e0dc5: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e0dcd: mov qword ptr [rax + 0x10c], rcx
0x1002e0dd4: mov byte ptr [rax + 0x114], 1
0x1002e0ddb: mov qword ptr [rax + 0x118], 0
0x1002e0de6: mov qword ptr [rip + 0x1b0e89b], rax ; 0x101def688
0x1002e0ded: mov rdi, r12
0x1002e0df0: mov rsi, rax
0x1002e0df3: mov rdx, r13
0x1002e0df6: vzeroupper 
0x1002e0df9: call 0x100314920 ; 0x100314920
0x1002e0dfe: lea rsi, [rip + 0x89ea6b] ; 0x100b7f870 avatarDarkstoneEnv
0x1002e0e05: mov edx, 0x40
0x1002e0e0a: mov rdi, r13
0x1002e0e0d: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e0e12: movsx edi, byte ptr [rbp - 0x70]
0x1002e0e16: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e0e1b: mov byte ptr [rbp - 0x70], al
0x1002e0e1e: mov rdx, qword ptr [rip + 0x1b0e843] ; 0x101def668
0x1002e0e25: mov esi, 0x120
0x1002e0e2a: mov ecx, 0x10
0x1002e0e2f: mov rdi, rbx
0x1002e0e32: call 0x100795530 ; 0x100795530
0x1002e0e37: vmovaps xmm0, xmmword ptr [rip + 0x7cc021] ; 0x100aace60
0x1002e0e3f: vmovups xmmword ptr [rax], xmm0
0x1002e0e43: mov word ptr [rax + 0x10], 0x100
0x1002e0e49: mov byte ptr [rax + 0x12], 0
0x1002e0e4d: mov qword ptr [rax + 0x14], 0
0x1002e0e55: vxorps xmm0, xmm0, xmm0
0x1002e0e59: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e0e5e: mov dword ptr [rax + 0x28], 0
0x1002e0e65: vmovaps xmm0, xmmword ptr [rip + 0x7d8843] ; 0x100ab96b0
0x1002e0e6d: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e0e72: mov byte ptr [rax + 0x40], 0
0x1002e0e76: vxorps ymm0, ymm0, ymm0
0x1002e0e7a: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e0e82: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e0e87: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e0e8c: mov qword ptr [rax + 0xa4], r14
0x1002e0e93: vmovaps xmm0, xmmword ptr [r15]
0x1002e0e98: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e0ea0: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e0ea8: vxorps xmm0, xmm0, xmm0
0x1002e0eac: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e0eb4: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e0ebe: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e0ec6: movabs rcx, 0x3f80000000000000
0x1002e0ed0: mov qword ptr [rax + 0xf4], rcx
0x1002e0ed7: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e0edf: mov qword ptr [rax + 0x10c], rcx
0x1002e0ee6: mov byte ptr [rax + 0x114], 1
0x1002e0eed: mov qword ptr [rax + 0x118], 0
0x1002e0ef8: mov qword ptr [rip + 0x1b0e791], rax ; 0x101def690
0x1002e0eff: mov rdi, r12
0x1002e0f02: mov rsi, rax
0x1002e0f05: mov rdx, r13
0x1002e0f08: vzeroupper 
0x1002e0f0b: call 0x100314920 ; 0x100314920
0x1002e0f10: lea rsi, [rip + 0x89e96c] ; 0x100b7f883 avatarTrail
0x1002e0f17: mov edx, 0x40
0x1002e0f1c: mov rdi, r13
0x1002e0f1f: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e0f24: movsx edi, byte ptr [rbp - 0x70]
0x1002e0f28: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e0f2d: mov byte ptr [rbp - 0x70], al
0x1002e0f30: mov rdx, qword ptr [rip + 0x1b0e731] ; 0x101def668
0x1002e0f37: mov esi, 0x120
0x1002e0f3c: mov ecx, 0x10
0x1002e0f41: mov rdi, rbx
0x1002e0f44: call 0x100795530 ; 0x100795530
0x1002e0f49: vmovaps xmm0, xmmword ptr [rip + 0x7cbf0f] ; 0x100aace60
0x1002e0f51: vmovups xmmword ptr [rax], xmm0
0x1002e0f55: mov word ptr [rax + 0x10], 0x100
0x1002e0f5b: mov byte ptr [rax + 0x12], 0
0x1002e0f5f: mov qword ptr [rax + 0x14], 0
0x1002e0f67: vxorps xmm0, xmm0, xmm0
0x1002e0f6b: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e0f70: mov dword ptr [rax + 0x28], 0
0x1002e0f77: vmovaps xmm0, xmmword ptr [rip + 0x7d8731] ; 0x100ab96b0
0x1002e0f7f: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e0f84: mov byte ptr [rax + 0x40], 0
0x1002e0f88: vxorps ymm0, ymm0, ymm0
0x1002e0f8c: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e0f94: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e0f99: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e0f9e: mov qword ptr [rax + 0xa4], r14
0x1002e0fa5: vmovaps xmm0, xmmword ptr [r15]
0x1002e0faa: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e0fb2: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e0fba: vxorps xmm0, xmm0, xmm0
0x1002e0fbe: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e0fc6: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e0fd0: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e0fd8: movabs rcx, 0x3f80000000000000
0x1002e0fe2: mov qword ptr [rax + 0xf4], rcx
0x1002e0fe9: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e0ff1: mov qword ptr [rax + 0x10c], rcx
0x1002e0ff8: mov byte ptr [rax + 0x114], 1
0x1002e0fff: mov qword ptr [rax + 0x118], 0
0x1002e100a: mov qword ptr [rip + 0x1b0e687], rax ; 0x101def698
0x1002e1011: mov rdi, r12
0x1002e1014: mov rsi, rax
0x1002e1017: mov rdx, r13
0x1002e101a: vzeroupper 
0x1002e101d: call 0x100314920 ; 0x100314920
0x1002e1022: lea rsi, [rip + 0x89e866] ; 0x100b7f88f avatarFootDot
0x1002e1029: mov edx, 0x40
0x1002e102e: mov rdi, r13
0x1002e1031: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e1036: movsx edi, byte ptr [rbp - 0x70]
0x1002e103a: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e103f: mov byte ptr [rbp - 0x70], al
0x1002e1042: mov rdx, qword ptr [rip + 0x1b0e61f] ; 0x101def668
0x1002e1049: mov esi, 0x120
0x1002e104e: mov ecx, 0x10
0x1002e1053: mov rdi, rbx
0x1002e1056: mov r15, rbx
0x1002e1059: call 0x100795530 ; 0x100795530
0x1002e105e: vmovaps xmm0, xmmword ptr [rip + 0x7cbdfa] ; 0x100aace60
0x1002e1066: vmovups xmmword ptr [rax], xmm0
0x1002e106a: mov word ptr [rax + 0x10], 0x100
0x1002e1070: mov byte ptr [rax + 0x12], 0
0x1002e1074: mov qword ptr [rax + 0x14], 0
0x1002e107c: vxorps xmm0, xmm0, xmm0
0x1002e1080: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e1085: mov dword ptr [rax + 0x28], 0
0x1002e108c: vmovaps xmm0, xmmword ptr [rip + 0x7d861c] ; 0x100ab96b0
0x1002e1094: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e1099: mov byte ptr [rax + 0x40], 0
0x1002e109d: vxorps ymm0, ymm0, ymm0
0x1002e10a1: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e10a9: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e10ae: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e10b3: mov qword ptr [rax + 0xa4], r14
0x1002e10ba: lea rbx, [rip + 0x1d5e61f] ; 0x10203f6e0
0x1002e10c1: vmovaps xmm0, xmmword ptr [rbx]
0x1002e10c5: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e10cd: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e10d5: vxorps xmm0, xmm0, xmm0
0x1002e10d9: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e10e1: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e10eb: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e10f3: movabs rcx, 0x3f80000000000000
0x1002e10fd: mov qword ptr [rax + 0xf4], rcx
0x1002e1104: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e110c: mov qword ptr [rax + 0x10c], rcx
0x1002e1113: mov byte ptr [rax + 0x114], 1
0x1002e111a: mov qword ptr [rax + 0x118], 0
0x1002e1125: mov qword ptr [rip + 0x1b0e574], rax ; 0x101def6a0
0x1002e112c: mov rdi, r12
0x1002e112f: mov rsi, rax
0x1002e1132: mov rdx, r13
0x1002e1135: vzeroupper 
0x1002e1138: call 0x100314920 ; 0x100314920
0x1002e113d: lea rsi, [rip + 0x89e759] ; 0x100b7f89d avatarFootSmoke
0x1002e1144: mov edx, 0x40
0x1002e1149: mov rdi, r13
0x1002e114c: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e1151: movsx edi, byte ptr [rbp - 0x70]
0x1002e1155: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e115a: mov byte ptr [rbp - 0x70], al
0x1002e115d: mov rdx, qword ptr [rip + 0x1b0e504] ; 0x101def668
0x1002e1164: mov esi, 0x120
0x1002e1169: mov ecx, 0x10
0x1002e116e: mov rdi, r15
0x1002e1171: call 0x100795530 ; 0x100795530
0x1002e1176: vmovaps xmm0, xmmword ptr [rip + 0x7cbce2] ; 0x100aace60
0x1002e117e: vmovups xmmword ptr [rax], xmm0
0x1002e1182: mov word ptr [rax + 0x10], 0x100
0x1002e1188: mov byte ptr [rax + 0x12], 0
0x1002e118c: mov qword ptr [rax + 0x14], 0
0x1002e1194: vxorps xmm0, xmm0, xmm0
0x1002e1198: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e119d: mov dword ptr [rax + 0x28], 0
0x1002e11a4: vmovaps xmm0, xmmword ptr [rip + 0x7d8504] ; 0x100ab96b0
0x1002e11ac: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e11b1: mov byte ptr [rax + 0x40], 0
0x1002e11b5: vxorps ymm0, ymm0, ymm0
0x1002e11b9: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e11c1: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e11c6: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e11cb: mov qword ptr [rax + 0xa4], r14
0x1002e11d2: vmovaps xmm0, xmmword ptr [rbx]
0x1002e11d6: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e11de: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e11e6: vxorps xmm0, xmm0, xmm0
0x1002e11ea: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e11f2: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e11fc: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e1204: movabs rcx, 0x3f80000000000000
0x1002e120e: mov qword ptr [rax + 0xf4], rcx
0x1002e1215: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e121d: mov qword ptr [rax + 0x10c], rcx
0x1002e1224: mov byte ptr [rax + 0x114], 1
0x1002e122b: mov qword ptr [rax + 0x118], 0
0x1002e1236: mov qword ptr [rip + 0x1b0e46b], rax ; 0x101def6a8
0x1002e123d: mov rdi, r12
0x1002e1240: mov rsi, rax
0x1002e1243: mov rdx, r13
0x1002e1246: vzeroupper 
0x1002e1249: call 0x100314920 ; 0x100314920
0x1002e124e: lea rsi, [rip + 0x89e658] ; 0x100b7f8ad avatarFootGrass
0x1002e1255: mov edx, 0x40
0x1002e125a: mov rdi, r13
0x1002e125d: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e1262: movsx edi, byte ptr [rbp - 0x70]
0x1002e1266: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e126b: mov byte ptr [rbp - 0x70], al
0x1002e126e: mov rdx, qword ptr [rip + 0x1b0e3f3] ; 0x101def668
0x1002e1275: mov esi, 0x120
0x1002e127a: mov ecx, 0x10
0x1002e127f: mov rdi, r15
0x1002e1282: call 0x100795530 ; 0x100795530
0x1002e1287: vmovaps xmm0, xmmword ptr [rip + 0x7cbbd1] ; 0x100aace60
0x1002e128f: vmovups xmmword ptr [rax], xmm0
0x1002e1293: mov word ptr [rax + 0x10], 0x100
0x1002e1299: mov byte ptr [rax + 0x12], 0
0x1002e129d: mov qword ptr [rax + 0x14], 0
0x1002e12a5: vxorps xmm0, xmm0, xmm0
0x1002e12a9: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e12ae: mov dword ptr [rax + 0x28], 0
0x1002e12b5: vmovaps xmm0, xmmword ptr [rip + 0x7d83f3] ; 0x100ab96b0
0x1002e12bd: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e12c2: mov byte ptr [rax + 0x40], 0
0x1002e12c6: vxorps ymm0, ymm0, ymm0
0x1002e12ca: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e12d2: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e12d7: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e12dc: mov qword ptr [rax + 0xa4], r14
0x1002e12e3: vmovaps xmm0, xmmword ptr [rbx]
0x1002e12e7: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e12ef: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e12f7: vxorps xmm0, xmm0, xmm0
0x1002e12fb: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e1303: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e130d: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e1315: movabs rcx, 0x3f80000000000000
0x1002e131f: mov qword ptr [rax + 0xf4], rcx
0x1002e1326: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e132e: mov qword ptr [rax + 0x10c], rcx
0x1002e1335: mov byte ptr [rax + 0x114], 1
0x1002e133c: mov qword ptr [rax + 0x118], 0
0x1002e1347: mov qword ptr [rip + 0x1b0e362], rax ; 0x101def6b0
0x1002e134e: mov rdi, r12
0x1002e1351: mov rsi, rax
0x1002e1354: mov rdx, r13
0x1002e1357: vzeroupper 
0x1002e135a: call 0x100314920 ; 0x100314920
0x1002e135f: lea rsi, [rip + 0x89e557] ; 0x100b7f8bd avatarFootCloud
0x1002e1366: mov edx, 0x40
0x1002e136b: mov rdi, r13
0x1002e136e: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e1373: movsx edi, byte ptr [rbp - 0x70]
0x1002e1377: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e137c: mov byte ptr [rbp - 0x70], al
0x1002e137f: mov rdx, qword ptr [rip + 0x1b0e2e2] ; 0x101def668
0x1002e1386: mov esi, 0x120
0x1002e138b: mov ecx, 0x10
0x1002e1390: mov rdi, r15
0x1002e1393: call 0x100795530 ; 0x100795530
0x1002e1398: vmovaps xmm0, xmmword ptr [rip + 0x7cbac0] ; 0x100aace60
0x1002e13a0: vmovups xmmword ptr [rax], xmm0
0x1002e13a4: mov word ptr [rax + 0x10], 0x100
0x1002e13aa: mov byte ptr [rax + 0x12], 0
0x1002e13ae: mov qword ptr [rax + 0x14], 0
0x1002e13b6: vxorps xmm0, xmm0, xmm0
0x1002e13ba: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e13bf: mov dword ptr [rax + 0x28], 0
0x1002e13c6: vmovaps xmm0, xmmword ptr [rip + 0x7d82e2] ; 0x100ab96b0
0x1002e13ce: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e13d3: mov byte ptr [rax + 0x40], 0
0x1002e13d7: vxorps ymm0, ymm0, ymm0
0x1002e13db: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e13e3: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e13e8: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e13ed: mov qword ptr [rax + 0xa4], r14
0x1002e13f4: vmovaps xmm0, xmmword ptr [rbx]
0x1002e13f8: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e1400: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e1408: vxorps xmm0, xmm0, xmm0
0x1002e140c: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e1414: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e141e: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e1426: movabs rcx, 0x3f80000000000000
0x1002e1430: mov qword ptr [rax + 0xf4], rcx
0x1002e1437: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e143f: mov qword ptr [rax + 0x10c], rcx
0x1002e1446: mov byte ptr [rax + 0x114], 1
0x1002e144d: mov qword ptr [rax + 0x118], 0
0x1002e1458: mov qword ptr [rip + 0x1b0e259], rax ; 0x101def6b8
0x1002e145f: mov rdi, r12
0x1002e1462: mov rsi, rax
0x1002e1465: mov rdx, r13
0x1002e1468: vzeroupper 
0x1002e146b: call 0x100314920 ; 0x100314920
0x1002e1470: lea rsi, [rip + 0x89e456] ; 0x100b7f8cd avatarBodyCloud
0x1002e1477: mov edx, 0x40
0x1002e147c: mov rdi, r13
0x1002e147f: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e1484: movsx edi, byte ptr [rbp - 0x70]
0x1002e1488: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e148d: mov byte ptr [rbp - 0x70], al
0x1002e1490: mov rdx, qword ptr [rip + 0x1b0e1d1] ; 0x101def668
0x1002e1497: mov esi, 0x120
0x1002e149c: mov ecx, 0x10
0x1002e14a1: mov rdi, r15
0x1002e14a4: call 0x100795530 ; 0x100795530
0x1002e14a9: vmovaps xmm0, xmmword ptr [rip + 0x7cb9af] ; 0x100aace60
0x1002e14b1: vmovups xmmword ptr [rax], xmm0
0x1002e14b5: mov word ptr [rax + 0x10], 0x100
0x1002e14bb: mov byte ptr [rax + 0x12], 0
0x1002e14bf: mov qword ptr [rax + 0x14], 0
0x1002e14c7: vxorps xmm0, xmm0, xmm0
0x1002e14cb: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e14d0: mov dword ptr [rax + 0x28], 0
0x1002e14d7: vmovaps xmm0, xmmword ptr [rip + 0x7d81d1] ; 0x100ab96b0
0x1002e14df: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e14e4: mov byte ptr [rax + 0x40], 0
0x1002e14e8: vxorps ymm0, ymm0, ymm0
0x1002e14ec: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e14f4: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e14f9: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e14fe: mov qword ptr [rax + 0xa4], r14
0x1002e1505: vmovaps xmm0, xmmword ptr [rbx]
0x1002e1509: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e1511: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e1519: vxorps xmm0, xmm0, xmm0
0x1002e151d: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e1525: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e152f: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e1537: movabs rcx, 0x3f80000000000000
0x1002e1541: mov qword ptr [rax + 0xf4], rcx
0x1002e1548: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e1550: mov qword ptr [rax + 0x10c], rcx
0x1002e1557: mov byte ptr [rax + 0x114], 1
0x1002e155e: mov qword ptr [rax + 0x118], 0
0x1002e1569: mov qword ptr [rip + 0x1b0e150], rax ; 0x101def6c0
0x1002e1570: mov rdi, r12
0x1002e1573: mov rsi, rax
0x1002e1576: mov rdx, r13
0x1002e1579: vzeroupper 
0x1002e157c: call 0x100314920 ; 0x100314920
0x1002e1581: lea rsi, [rip + 0x89e355] ; 0x100b7f8dd avatarCloud
0x1002e1588: mov edx, 0x40
0x1002e158d: mov rdi, r13
0x1002e1590: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e1595: movsx edi, byte ptr [rbp - 0x70]
0x1002e1599: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e159e: mov byte ptr [rbp - 0x70], al
0x1002e15a1: mov rdx, qword ptr [rip + 0x1b0e0c0] ; 0x101def668
0x1002e15a8: mov esi, 0x120
0x1002e15ad: mov ecx, 0x10
0x1002e15b2: mov rdi, r15
0x1002e15b5: call 0x100795530 ; 0x100795530
0x1002e15ba: vmovaps xmm0, xmmword ptr [rip + 0x7cb89e] ; 0x100aace60
0x1002e15c2: vmovups xmmword ptr [rax], xmm0
0x1002e15c6: mov word ptr [rax + 0x10], 0x100
0x1002e15cc: mov byte ptr [rax + 0x12], 0
0x1002e15d0: mov qword ptr [rax + 0x14], 0
0x1002e15d8: vxorps xmm0, xmm0, xmm0
0x1002e15dc: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e15e1: mov dword ptr [rax + 0x28], 0
0x1002e15e8: vmovaps xmm0, xmmword ptr [rip + 0x7d80c0] ; 0x100ab96b0
0x1002e15f0: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e15f5: mov byte ptr [rax + 0x40], 0
0x1002e15f9: vxorps ymm0, ymm0, ymm0
0x1002e15fd: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e1605: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e160a: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e160f: mov qword ptr [rax + 0xa4], r14
0x1002e1616: vmovaps xmm0, xmmword ptr [rbx]
0x1002e161a: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e1622: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e162a: vxorps xmm0, xmm0, xmm0
0x1002e162e: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e1636: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e1640: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e1648: movabs rcx, 0x3f80000000000000
0x1002e1652: mov qword ptr [rax + 0xf4], rcx
0x1002e1659: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e1661: mov qword ptr [rax + 0x10c], rcx
0x1002e1668: mov byte ptr [rax + 0x114], 1
0x1002e166f: mov qword ptr [rax + 0x118], 0
0x1002e167a: mov qword ptr [rip + 0x1b0e047], rax ; 0x101def6c8
0x1002e1681: mov rdi, r12
0x1002e1684: mov rsi, rax
0x1002e1687: mov rdx, r13
0x1002e168a: vzeroupper 
0x1002e168d: call 0x100314920 ; 0x100314920
0x1002e1692: lea rsi, [rip + 0x89e250] ; 0x100b7f8e9 avatarMagnetize
0x1002e1699: mov edx, 0x40
0x1002e169e: mov rdi, r13
0x1002e16a1: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e16a6: movsx edi, byte ptr [rbp - 0x70]
0x1002e16aa: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e16af: mov byte ptr [rbp - 0x70], al
0x1002e16b2: mov rdx, qword ptr [rip + 0x1b0dfaf] ; 0x101def668
0x1002e16b9: mov esi, 0x120
0x1002e16be: mov ecx, 0x10
0x1002e16c3: mov rdi, r15
0x1002e16c6: call 0x100795530 ; 0x100795530
0x1002e16cb: vmovaps xmm0, xmmword ptr [rip + 0x7cb78d] ; 0x100aace60
0x1002e16d3: vmovups xmmword ptr [rax], xmm0
0x1002e16d7: mov word ptr [rax + 0x10], 0x100
0x1002e16dd: mov byte ptr [rax + 0x12], 0
0x1002e16e1: mov qword ptr [rax + 0x14], 0
0x1002e16e9: vxorps xmm0, xmm0, xmm0
0x1002e16ed: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e16f2: mov dword ptr [rax + 0x28], 0
0x1002e16f9: vmovaps xmm0, xmmword ptr [rip + 0x7d7faf] ; 0x100ab96b0
0x1002e1701: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e1706: mov byte ptr [rax + 0x40], 0
0x1002e170a: vxorps ymm0, ymm0, ymm0
0x1002e170e: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e1716: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e171b: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e1720: mov qword ptr [rax + 0xa4], r14
0x1002e1727: vmovaps xmm0, xmmword ptr [rbx]
0x1002e172b: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e1733: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e173b: vxorps xmm0, xmm0, xmm0
0x1002e173f: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e1747: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e1751: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e1759: movabs rcx, 0x3f80000000000000
0x1002e1763: mov qword ptr [rax + 0xf4], rcx
0x1002e176a: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e1772: mov qword ptr [rax + 0x10c], rcx
0x1002e1779: mov byte ptr [rax + 0x114], 1
0x1002e1780: mov qword ptr [rax + 0x118], 0
0x1002e178b: mov qword ptr [rip + 0x1b0df3e], rax ; 0x101def6d0
0x1002e1792: mov rdi, r12
0x1002e1795: mov rsi, rax
0x1002e1798: mov rdx, r13
0x1002e179b: vzeroupper 
0x1002e179e: call 0x100314920 ; 0x100314920
0x1002e17a3: lea rsi, [rip + 0x89e14f] ; 0x100b7f8f9 emoteTears
0x1002e17aa: mov edx, 0x40
0x1002e17af: mov rdi, r13
0x1002e17b2: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e17b7: movsx edi, byte ptr [rbp - 0x70]
0x1002e17bb: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e17c0: mov byte ptr [rbp - 0x70], al
0x1002e17c3: mov rdx, qword ptr [rip + 0x1b0de9e] ; 0x101def668
0x1002e17ca: mov esi, 0x120
0x1002e17cf: mov ecx, 0x10
0x1002e17d4: mov rdi, r15
0x1002e17d7: call 0x100795530 ; 0x100795530
0x1002e17dc: vmovaps xmm0, xmmword ptr [rip + 0x7cb67c] ; 0x100aace60
0x1002e17e4: vmovups xmmword ptr [rax], xmm0
0x1002e17e8: mov word ptr [rax + 0x10], 0x100
0x1002e17ee: mov byte ptr [rax + 0x12], 0
0x1002e17f2: mov qword ptr [rax + 0x14], 0
0x1002e17fa: vxorps xmm0, xmm0, xmm0
0x1002e17fe: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e1803: mov dword ptr [rax + 0x28], 0
0x1002e180a: vmovaps xmm0, xmmword ptr [rip + 0x7d7e9e] ; 0x100ab96b0
0x1002e1812: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e1817: mov byte ptr [rax + 0x40], 0
0x1002e181b: vxorps ymm0, ymm0, ymm0
0x1002e181f: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e1827: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e182c: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e1831: mov qword ptr [rax + 0xa4], r14
0x1002e1838: vmovaps xmm0, xmmword ptr [rbx]
0x1002e183c: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e1844: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e184c: vxorps xmm0, xmm0, xmm0
0x1002e1850: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e1858: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e1862: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e186a: movabs rcx, 0x3f80000000000000
0x1002e1874: mov qword ptr [rax + 0xf4], rcx
0x1002e187b: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e1883: mov qword ptr [rax + 0x10c], rcx
0x1002e188a: mov byte ptr [rax + 0x114], 1
0x1002e1891: mov qword ptr [rax + 0x118], 0
0x1002e189c: mov qword ptr [rip + 0x1b0de35], rax ; 0x101def6d8
0x1002e18a3: mov rdi, r12
0x1002e18a6: mov rsi, rax
0x1002e18a9: mov rdx, r13
0x1002e18ac: vzeroupper 
0x1002e18af: call 0x100314920 ; 0x100314920
0x1002e18b4: lea rsi, [rip + 0x89e049] ; 0x100b7f904 cinematicEnergy
0x1002e18bb: mov edx, 0x40
0x1002e18c0: mov rdi, r13
0x1002e18c3: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e18c8: movsx edi, byte ptr [rbp - 0x70]
0x1002e18cc: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e18d1: mov byte ptr [rbp - 0x70], al
0x1002e18d4: mov rdx, qword ptr [rip + 0x1b0dd8d] ; 0x101def668
0x1002e18db: mov esi, 0x120
0x1002e18e0: mov ecx, 0x10
0x1002e18e5: mov rdi, r15
0x1002e18e8: call 0x100795530 ; 0x100795530
0x1002e18ed: vmovaps xmm0, xmmword ptr [rip + 0x7cb56b] ; 0x100aace60
0x1002e18f5: vmovups xmmword ptr [rax], xmm0
0x1002e18f9: mov word ptr [rax + 0x10], 0x100
0x1002e18ff: mov byte ptr [rax + 0x12], 0
0x1002e1903: mov qword ptr [rax + 0x14], 0
0x1002e190b: vxorps xmm0, xmm0, xmm0
0x1002e190f: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e1914: mov dword ptr [rax + 0x28], 0
0x1002e191b: vmovaps xmm0, xmmword ptr [rip + 0x7d7d8d] ; 0x100ab96b0
0x1002e1923: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e1928: mov byte ptr [rax + 0x40], 0
0x1002e192c: vxorps ymm0, ymm0, ymm0
0x1002e1930: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e1938: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e193d: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e1942: mov qword ptr [rax + 0xa4], r14
0x1002e1949: vmovaps xmm0, xmmword ptr [rbx]
0x1002e194d: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e1955: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e195d: vxorps xmm0, xmm0, xmm0
0x1002e1961: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e1969: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e1973: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e197b: movabs rcx, 0x3f80000000000000
0x1002e1985: mov qword ptr [rax + 0xf4], rcx
0x1002e198c: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e1994: mov qword ptr [rax + 0x10c], rcx
0x1002e199b: mov byte ptr [rax + 0x114], 1
0x1002e19a2: mov qword ptr [rax + 0x118], 0
0x1002e19ad: mov qword ptr [rip + 0x1b0dd2c], rax ; 0x101def6e0
0x1002e19b4: mov rdi, r12
0x1002e19b7: mov rsi, rax
0x1002e19ba: mov rdx, r13
0x1002e19bd: vzeroupper 
0x1002e19c0: call 0x100314920 ; 0x100314920
0x1002e19c5: lea rsi, [rip + 0x89df48] ; 0x100b7f914 cinematicTrail
0x1002e19cc: mov edx, 0x40
0x1002e19d1: mov rdi, r13
0x1002e19d4: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e19d9: movsx edi, byte ptr [rbp - 0x70]
0x1002e19dd: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e19e2: mov byte ptr [rbp - 0x70], al
0x1002e19e5: mov rdx, qword ptr [rip + 0x1b0dc7c] ; 0x101def668
0x1002e19ec: mov esi, 0x120
0x1002e19f1: mov ecx, 0x10
0x1002e19f6: mov rdi, r15
0x1002e19f9: call 0x100795530 ; 0x100795530
0x1002e19fe: vmovaps xmm0, xmmword ptr [rip + 0x7cb45a] ; 0x100aace60
0x1002e1a06: vmovups xmmword ptr [rax], xmm0
0x1002e1a0a: mov word ptr [rax + 0x10], 0x100
0x1002e1a10: mov byte ptr [rax + 0x12], 0
0x1002e1a14: mov qword ptr [rax + 0x14], 0
0x1002e1a1c: vxorps xmm0, xmm0, xmm0
0x1002e1a20: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e1a25: mov dword ptr [rax + 0x28], 0
0x1002e1a2c: vmovaps xmm0, xmmword ptr [rip + 0x7d7c7c] ; 0x100ab96b0
0x1002e1a34: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e1a39: mov byte ptr [rax + 0x40], 0
0x1002e1a3d: vxorps ymm0, ymm0, ymm0
0x1002e1a41: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e1a49: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e1a4e: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e1a53: mov qword ptr [rax + 0xa4], r14
0x1002e1a5a: vmovaps xmm0, xmmword ptr [rbx]
0x1002e1a5e: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e1a66: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e1a6e: vxorps xmm0, xmm0, xmm0
0x1002e1a72: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e1a7a: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e1a84: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e1a8c: movabs rcx, 0x3f80000000000000
0x1002e1a96: mov qword ptr [rax + 0xf4], rcx
0x1002e1a9d: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e1aa5: mov qword ptr [rax + 0x10c], rcx
0x1002e1aac: mov byte ptr [rax + 0x114], 1
0x1002e1ab3: mov qword ptr [rax + 0x118], 0
0x1002e1abe: mov qword ptr [rip + 0x1b0dc23], rax ; 0x101def6e8
0x1002e1ac5: mov rdi, r12
0x1002e1ac8: mov rsi, rax
0x1002e1acb: mov rdx, r13
0x1002e1ace: vzeroupper 
0x1002e1ad1: call 0x100314920 ; 0x100314920
0x1002e1ad6: lea rsi, [rip + 0x89de46] ; 0x100b7f923 cinematicWaking
0x1002e1add: mov edx, 0x40
0x1002e1ae2: mov rdi, r13
0x1002e1ae5: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e1aea: movsx edi, byte ptr [rbp - 0x70]
0x1002e1aee: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e1af3: mov byte ptr [rbp - 0x70], al
0x1002e1af6: mov rdx, qword ptr [rip + 0x1b0db6b] ; 0x101def668
0x1002e1afd: mov esi, 0x120
0x1002e1b02: mov ecx, 0x10
0x1002e1b07: mov rdi, r15
0x1002e1b0a: call 0x100795530 ; 0x100795530
0x1002e1b0f: vmovaps xmm0, xmmword ptr [rip + 0x7cb349] ; 0x100aace60
0x1002e1b17: vmovups xmmword ptr [rax], xmm0
0x1002e1b1b: mov word ptr [rax + 0x10], 0x100
0x1002e1b21: mov byte ptr [rax + 0x12], 0
0x1002e1b25: mov qword ptr [rax + 0x14], 0
0x1002e1b2d: vxorps xmm0, xmm0, xmm0
0x1002e1b31: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e1b36: mov dword ptr [rax + 0x28], 0
0x1002e1b3d: vmovaps xmm0, xmmword ptr [rip + 0x7d7b6b] ; 0x100ab96b0
0x1002e1b45: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e1b4a: mov byte ptr [rax + 0x40], 0
0x1002e1b4e: vxorps ymm0, ymm0, ymm0
0x1002e1b52: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e1b5a: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e1b5f: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e1b64: mov qword ptr [rax + 0xa4], r14
0x1002e1b6b: vmovaps xmm0, xmmword ptr [rbx]
0x1002e1b6f: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e1b77: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e1b7f: vxorps xmm0, xmm0, xmm0
0x1002e1b83: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e1b8b: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e1b95: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e1b9d: movabs rcx, 0x3f80000000000000
0x1002e1ba7: mov qword ptr [rax + 0xf4], rcx
0x1002e1bae: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e1bb6: mov qword ptr [rax + 0x10c], rcx
0x1002e1bbd: mov byte ptr [rax + 0x114], 1
0x1002e1bc4: mov qword ptr [rax + 0x118], 0
0x1002e1bcf: mov qword ptr [rip + 0x1b0db1a], rax ; 0x101def6f0
0x1002e1bd6: mov rdi, r12
0x1002e1bd9: mov rsi, rax
0x1002e1bdc: mov rdx, r13
0x1002e1bdf: vzeroupper 
0x1002e1be2: call 0x100314920 ; 0x100314920
0x1002e1be7: lea rsi, [rip + 0x89dd45] ; 0x100b7f933 cinematicSplash
0x1002e1bee: mov edx, 0x40
0x1002e1bf3: mov rdi, r13
0x1002e1bf6: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e1bfb: movsx edi, byte ptr [rbp - 0x70]
0x1002e1bff: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e1c04: mov byte ptr [rbp - 0x70], al
0x1002e1c07: mov rdx, qword ptr [rip + 0x1b0da5a] ; 0x101def668
0x1002e1c0e: mov esi, 0x120
0x1002e1c13: mov ecx, 0x10
0x1002e1c18: mov rdi, r15
0x1002e1c1b: call 0x100795530 ; 0x100795530
0x1002e1c20: vmovaps xmm0, xmmword ptr [rip + 0x7cb238] ; 0x100aace60
0x1002e1c28: vmovups xmmword ptr [rax], xmm0
0x1002e1c2c: mov word ptr [rax + 0x10], 0x100
0x1002e1c32: mov byte ptr [rax + 0x12], 0
0x1002e1c36: mov qword ptr [rax + 0x14], 0
0x1002e1c3e: vxorps xmm0, xmm0, xmm0
0x1002e1c42: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e1c47: mov dword ptr [rax + 0x28], 0
0x1002e1c4e: vmovaps xmm0, xmmword ptr [rip + 0x7d7a5a] ; 0x100ab96b0
0x1002e1c56: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e1c5b: mov byte ptr [rax + 0x40], 0
0x1002e1c5f: vxorps ymm0, ymm0, ymm0
0x1002e1c63: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e1c6b: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e1c70: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e1c75: mov qword ptr [rax + 0xa4], r14
0x1002e1c7c: vmovaps xmm0, xmmword ptr [rbx]
0x1002e1c80: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e1c88: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e1c90: vxorps xmm0, xmm0, xmm0
0x1002e1c94: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e1c9c: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e1ca6: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e1cae: movabs rcx, 0x3f80000000000000
0x1002e1cb8: mov qword ptr [rax + 0xf4], rcx
0x1002e1cbf: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e1cc7: mov qword ptr [rax + 0x10c], rcx
0x1002e1cce: mov byte ptr [rax + 0x114], 1
0x1002e1cd5: mov qword ptr [rax + 0x118], 0
0x1002e1ce0: mov qword ptr [rip + 0x1b0da11], rax ; 0x101def6f8
0x1002e1ce7: mov rdi, r12
0x1002e1cea: mov rsi, rax
0x1002e1ced: mov rdx, r13
0x1002e1cf0: vzeroupper 
0x1002e1cf3: call 0x100314920 ; 0x100314920
0x1002e1cf8: lea rsi, [rip + 0x89dc44] ; 0x100b7f943 moteSpawn
0x1002e1cff: mov edx, 0x40
0x1002e1d04: mov rdi, r13
0x1002e1d07: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e1d0c: movsx edi, byte ptr [rbp - 0x70]
0x1002e1d10: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e1d15: mov byte ptr [rbp - 0x70], al
0x1002e1d18: mov rdx, qword ptr [rip + 0x1b0d949] ; 0x101def668
0x1002e1d1f: mov esi, 0x120
0x1002e1d24: mov ecx, 0x10
0x1002e1d29: mov rdi, r15
0x1002e1d2c: call 0x100795530 ; 0x100795530
0x1002e1d31: vmovaps xmm0, xmmword ptr [rip + 0x7cb127] ; 0x100aace60
0x1002e1d39: vmovups xmmword ptr [rax], xmm0
0x1002e1d3d: mov word ptr [rax + 0x10], 0x100
0x1002e1d43: mov byte ptr [rax + 0x12], 0
0x1002e1d47: mov qword ptr [rax + 0x14], 0
0x1002e1d4f: vxorps xmm0, xmm0, xmm0
0x1002e1d53: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e1d58: mov dword ptr [rax + 0x28], 0
0x1002e1d5f: vmovaps xmm0, xmmword ptr [rip + 0x7d7949] ; 0x100ab96b0
0x1002e1d67: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e1d6c: mov byte ptr [rax + 0x40], 0
0x1002e1d70: vxorps ymm0, ymm0, ymm0
0x1002e1d74: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e1d7c: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e1d81: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e1d86: mov qword ptr [rax + 0xa4], r14
0x1002e1d8d: vmovaps xmm0, xmmword ptr [rbx]
0x1002e1d91: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e1d99: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e1da1: vxorps xmm0, xmm0, xmm0
0x1002e1da5: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e1dad: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e1db7: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e1dbf: movabs rcx, 0x3f80000000000000
0x1002e1dc9: mov qword ptr [rax + 0xf4], rcx
0x1002e1dd0: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e1dd8: mov qword ptr [rax + 0x10c], rcx
0x1002e1ddf: mov byte ptr [rax + 0x114], 1
0x1002e1de6: mov qword ptr [rax + 0x118], 0
0x1002e1df1: mov qword ptr [rip + 0x1b0d908], rax ; 0x101def700
0x1002e1df8: mov rdi, r12
0x1002e1dfb: mov rsi, rax
0x1002e1dfe: mov rdx, r13
0x1002e1e01: vzeroupper 
0x1002e1e04: call 0x100314920 ; 0x100314920
0x1002e1e09: lea rsi, [rip + 0x89db3d] ; 0x100b7f94d moteSpawnCenter
0x1002e1e10: mov edx, 0x40
0x1002e1e15: mov rdi, r13
0x1002e1e18: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e1e1d: movsx edi, byte ptr [rbp - 0x70]
0x1002e1e21: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e1e26: mov byte ptr [rbp - 0x70], al
0x1002e1e29: mov rdx, qword ptr [rip + 0x1b0d838] ; 0x101def668
0x1002e1e30: mov esi, 0x120
0x1002e1e35: mov ecx, 0x10
0x1002e1e3a: mov rdi, r15
0x1002e1e3d: call 0x100795530 ; 0x100795530
0x1002e1e42: vmovaps xmm0, xmmword ptr [rip + 0x7cb016] ; 0x100aace60
0x1002e1e4a: vmovups xmmword ptr [rax], xmm0
0x1002e1e4e: mov word ptr [rax + 0x10], 0x100
0x1002e1e54: mov byte ptr [rax + 0x12], 0
0x1002e1e58: mov qword ptr [rax + 0x14], 0
0x1002e1e60: vxorps xmm0, xmm0, xmm0
0x1002e1e64: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e1e69: mov dword ptr [rax + 0x28], 0
0x1002e1e70: vmovaps xmm0, xmmword ptr [rip + 0x7d7838] ; 0x100ab96b0
0x1002e1e78: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e1e7d: mov byte ptr [rax + 0x40], 0
0x1002e1e81: vxorps ymm0, ymm0, ymm0
0x1002e1e85: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e1e8d: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e1e92: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e1e97: mov qword ptr [rax + 0xa4], r14
0x1002e1e9e: vmovaps xmm0, xmmword ptr [rbx]
0x1002e1ea2: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e1eaa: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e1eb2: vxorps xmm0, xmm0, xmm0
0x1002e1eb6: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e1ebe: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e1ec8: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e1ed0: movabs rcx, 0x3f80000000000000
0x1002e1eda: mov qword ptr [rax + 0xf4], rcx
0x1002e1ee1: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e1ee9: mov qword ptr [rax + 0x10c], rcx
0x1002e1ef0: mov byte ptr [rax + 0x114], 1
0x1002e1ef7: mov qword ptr [rax + 0x118], 0
0x1002e1f02: mov qword ptr [rip + 0x1b0d7ff], rax ; 0x101def708
0x1002e1f09: mov rdi, r12
0x1002e1f0c: mov rsi, rax
0x1002e1f0f: mov rdx, r13
0x1002e1f12: vzeroupper 
0x1002e1f15: call 0x100314920 ; 0x100314920
0x1002e1f1a: lea rsi, [rip + 0x89da3c] ; 0x100b7f95d moteCollect
0x1002e1f21: mov edx, 0x40
0x1002e1f26: mov rdi, r13
0x1002e1f29: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e1f2e: movsx edi, byte ptr [rbp - 0x70]
0x1002e1f32: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e1f37: mov byte ptr [rbp - 0x70], al
0x1002e1f3a: mov rdx, qword ptr [rip + 0x1b0d727] ; 0x101def668
0x1002e1f41: mov esi, 0x120
0x1002e1f46: mov ecx, 0x10
0x1002e1f4b: mov rdi, r15
0x1002e1f4e: call 0x100795530 ; 0x100795530
0x1002e1f53: vmovaps xmm0, xmmword ptr [rip + 0x7caf05] ; 0x100aace60
0x1002e1f5b: vmovups xmmword ptr [rax], xmm0
0x1002e1f5f: mov word ptr [rax + 0x10], 0x100
0x1002e1f65: mov byte ptr [rax + 0x12], 0
0x1002e1f69: mov qword ptr [rax + 0x14], 0
0x1002e1f71: vxorps xmm0, xmm0, xmm0
0x1002e1f75: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e1f7a: mov dword ptr [rax + 0x28], 0
0x1002e1f81: vmovaps xmm0, xmmword ptr [rip + 0x7d7727] ; 0x100ab96b0
0x1002e1f89: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e1f8e: mov byte ptr [rax + 0x40], 0
0x1002e1f92: vxorps ymm0, ymm0, ymm0
0x1002e1f96: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e1f9e: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e1fa3: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e1fa8: mov qword ptr [rax + 0xa4], r14
0x1002e1faf: vmovaps xmm0, xmmword ptr [rbx]
0x1002e1fb3: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e1fbb: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e1fc3: vxorps xmm0, xmm0, xmm0
0x1002e1fc7: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e1fcf: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e1fd9: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e1fe1: movabs rcx, 0x3f80000000000000
0x1002e1feb: mov qword ptr [rax + 0xf4], rcx
0x1002e1ff2: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e1ffa: mov qword ptr [rax + 0x10c], rcx
0x1002e2001: mov byte ptr [rax + 0x114], 1
0x1002e2008: mov qword ptr [rax + 0x118], 0
0x1002e2013: mov qword ptr [rip + 0x1b0d6f6], rax ; 0x101def710
0x1002e201a: mov rdi, r12
0x1002e201d: mov rsi, rax
0x1002e2020: mov rdx, r13
0x1002e2023: vzeroupper 
0x1002e2026: call 0x100314920 ; 0x100314920
0x1002e202b: lea rsi, [rip + 0x89d937] ; 0x100b7f969 moteDeposit
0x1002e2032: mov edx, 0x40
0x1002e2037: mov rdi, r13
0x1002e203a: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e203f: movsx edi, byte ptr [rbp - 0x70]
0x1002e2043: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e2048: mov byte ptr [rbp - 0x70], al
0x1002e204b: mov rdx, qword ptr [rip + 0x1b0d616] ; 0x101def668
0x1002e2052: mov esi, 0x120
0x1002e2057: mov ecx, 0x10
0x1002e205c: mov rdi, r15
0x1002e205f: call 0x100795530 ; 0x100795530
0x1002e2064: vmovaps xmm0, xmmword ptr [rip + 0x7cadf4] ; 0x100aace60
0x1002e206c: vmovups xmmword ptr [rax], xmm0
0x1002e2070: mov word ptr [rax + 0x10], 0x100
0x1002e2076: mov byte ptr [rax + 0x12], 0
0x1002e207a: mov qword ptr [rax + 0x14], 0
0x1002e2082: vxorps xmm0, xmm0, xmm0
0x1002e2086: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e208b: mov dword ptr [rax + 0x28], 0
0x1002e2092: vmovaps xmm0, xmmword ptr [rip + 0x7d7616] ; 0x100ab96b0
0x1002e209a: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e209f: mov byte ptr [rax + 0x40], 0
0x1002e20a3: vxorps ymm0, ymm0, ymm0
0x1002e20a7: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e20af: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e20b4: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e20b9: mov qword ptr [rax + 0xa4], r14
0x1002e20c0: vmovaps xmm0, xmmword ptr [rbx]
0x1002e20c4: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e20cc: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e20d4: vxorps xmm0, xmm0, xmm0
0x1002e20d8: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e20e0: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e20ea: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e20f2: movabs rcx, 0x3f80000000000000
0x1002e20fc: mov qword ptr [rax + 0xf4], rcx
0x1002e2103: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e210b: mov qword ptr [rax + 0x10c], rcx
0x1002e2112: mov byte ptr [rax + 0x114], 1
0x1002e2119: mov qword ptr [rax + 0x118], 0
0x1002e2124: mov qword ptr [rip + 0x1b0d5ed], rax ; 0x101def718
0x1002e212b: mov rdi, r12
0x1002e212e: mov rsi, rax
0x1002e2131: mov rdx, r13
0x1002e2134: vzeroupper 
0x1002e2137: call 0x100314920 ; 0x100314920
0x1002e213c: lea rsi, [rip + 0x89d832] ; 0x100b7f975 megaMote
0x1002e2143: mov edx, 0x40
0x1002e2148: mov rdi, r13
0x1002e214b: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e2150: movsx edi, byte ptr [rbp - 0x70]
0x1002e2154: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e2159: mov byte ptr [rbp - 0x70], al
0x1002e215c: mov rdx, qword ptr [rip + 0x1b0d505] ; 0x101def668
0x1002e2163: mov esi, 0x120
0x1002e2168: mov ecx, 0x10
0x1002e216d: mov rdi, r15
0x1002e2170: call 0x100795530 ; 0x100795530
0x1002e2175: vmovaps xmm0, xmmword ptr [rip + 0x7cace3] ; 0x100aace60
0x1002e217d: vmovups xmmword ptr [rax], xmm0
0x1002e2181: mov word ptr [rax + 0x10], 0x100
0x1002e2187: mov byte ptr [rax + 0x12], 0
0x1002e218b: mov qword ptr [rax + 0x14], 0
0x1002e2193: vxorps xmm0, xmm0, xmm0
0x1002e2197: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e219c: mov dword ptr [rax + 0x28], 0
0x1002e21a3: vmovaps xmm0, xmmword ptr [rip + 0x7d7505] ; 0x100ab96b0
0x1002e21ab: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e21b0: mov byte ptr [rax + 0x40], 0
0x1002e21b4: vxorps ymm0, ymm0, ymm0
0x1002e21b8: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e21c0: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e21c5: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e21ca: mov qword ptr [rax + 0xa4], r14
0x1002e21d1: vmovaps xmm0, xmmword ptr [rbx]
0x1002e21d5: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e21dd: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e21e5: vxorps xmm0, xmm0, xmm0
0x1002e21e9: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e21f1: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e21fb: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e2203: movabs rcx, 0x3f80000000000000
0x1002e220d: mov qword ptr [rax + 0xf4], rcx
0x1002e2214: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e221c: mov qword ptr [rax + 0x10c], rcx
0x1002e2223: mov byte ptr [rax + 0x114], 1
0x1002e222a: mov qword ptr [rax + 0x118], 0
0x1002e2235: mov qword ptr [rip + 0x1b0d4e4], rax ; 0x101def720
0x1002e223c: mov rdi, r12
0x1002e223f: mov rsi, rax
0x1002e2242: mov rdx, r13
0x1002e2245: vzeroupper 
0x1002e2248: call 0x100314920 ; 0x100314920
0x1002e224d: lea rsi, [rip + 0x89d72a] ; 0x100b7f97e bridgeCloud
0x1002e2254: mov edx, 0x40
0x1002e2259: mov rdi, r13
0x1002e225c: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e2261: movsx edi, byte ptr [rbp - 0x70]
0x1002e2265: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e226a: mov byte ptr [rbp - 0x70], al
0x1002e226d: mov rdx, qword ptr [rip + 0x1b0d3f4] ; 0x101def668
0x1002e2274: mov esi, 0x120
0x1002e2279: mov ecx, 0x10
0x1002e227e: mov rdi, r15
0x1002e2281: call 0x100795530 ; 0x100795530
0x1002e2286: vmovaps xmm0, xmmword ptr [rip + 0x7cabd2] ; 0x100aace60
0x1002e228e: vmovups xmmword ptr [rax], xmm0
0x1002e2292: mov word ptr [rax + 0x10], 0x100
0x1002e2298: mov byte ptr [rax + 0x12], 0
0x1002e229c: mov qword ptr [rax + 0x14], 0
0x1002e22a4: vxorps xmm0, xmm0, xmm0
0x1002e22a8: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e22ad: mov dword ptr [rax + 0x28], 0
0x1002e22b4: vmovaps xmm0, xmmword ptr [rip + 0x7d73f4] ; 0x100ab96b0
0x1002e22bc: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e22c1: mov byte ptr [rax + 0x40], 0
0x1002e22c5: vxorps ymm0, ymm0, ymm0
0x1002e22c9: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e22d1: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e22d6: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e22db: mov qword ptr [rax + 0xa4], r14
0x1002e22e2: vmovaps xmm0, xmmword ptr [rbx]
0x1002e22e6: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e22ee: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e22f6: vxorps xmm0, xmm0, xmm0
0x1002e22fa: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e2302: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e230c: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e2314: movabs rcx, 0x3f80000000000000
0x1002e231e: mov qword ptr [rax + 0xf4], rcx
0x1002e2325: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e232d: mov qword ptr [rax + 0x10c], rcx
0x1002e2334: mov byte ptr [rax + 0x114], 1
0x1002e233b: mov qword ptr [rax + 0x118], 0
0x1002e2346: mov qword ptr [rip + 0x1b0d3db], rax ; 0x101def728
0x1002e234d: mov rdi, r12
0x1002e2350: mov rsi, rax
0x1002e2353: mov rdx, r13
0x1002e2356: vzeroupper 
0x1002e2359: call 0x100314920 ; 0x100314920
0x1002e235e: lea rsi, [rip + 0x89d625] ; 0x100b7f98a dreamEnv
0x1002e2365: mov edx, 0x40
0x1002e236a: mov rdi, r13
0x1002e236d: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e2372: movsx edi, byte ptr [rbp - 0x70]
0x1002e2376: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e237b: mov byte ptr [rbp - 0x70], al
0x1002e237e: mov rdx, qword ptr [rip + 0x1b0d2e3] ; 0x101def668
0x1002e2385: mov esi, 0x120
0x1002e238a: mov ecx, 0x10
0x1002e238f: mov rdi, r15
0x1002e2392: call 0x100795530 ; 0x100795530
0x1002e2397: vmovaps xmm0, xmmword ptr [rip + 0x7caac1] ; 0x100aace60
0x1002e239f: vmovups xmmword ptr [rax], xmm0
0x1002e23a3: mov word ptr [rax + 0x10], 0x100
0x1002e23a9: mov byte ptr [rax + 0x12], 0
0x1002e23ad: mov qword ptr [rax + 0x14], 0
0x1002e23b5: vxorps xmm0, xmm0, xmm0
0x1002e23b9: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e23be: mov dword ptr [rax + 0x28], 0
0x1002e23c5: vmovaps xmm0, xmmword ptr [rip + 0x7d72e3] ; 0x100ab96b0
0x1002e23cd: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e23d2: mov byte ptr [rax + 0x40], 0
0x1002e23d6: vxorps ymm0, ymm0, ymm0
0x1002e23da: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e23e2: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e23e7: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e23ec: mov qword ptr [rax + 0xa4], r14
0x1002e23f3: vmovaps xmm0, xmmword ptr [rbx]
0x1002e23f7: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e23ff: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e2407: vxorps xmm0, xmm0, xmm0
0x1002e240b: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e2413: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e241d: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e2425: movabs rcx, 0x3f80000000000000
0x1002e242f: mov qword ptr [rax + 0xf4], rcx
0x1002e2436: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e243e: mov qword ptr [rax + 0x10c], rcx
0x1002e2445: mov byte ptr [rax + 0x114], 1
0x1002e244c: mov qword ptr [rax + 0x118], 0
0x1002e2457: mov qword ptr [rip + 0x1b0d2d2], rax ; 0x101def730
0x1002e245e: mov rdi, r12
0x1002e2461: mov rsi, rax
0x1002e2464: mov rdx, r13
0x1002e2467: vzeroupper 
0x1002e246a: call 0x100314920 ; 0x100314920
0x1002e246f: lea rsi, [rip + 0x89d51d] ; 0x100b7f993 dreamEnvFlame
0x1002e2476: mov edx, 0x40
0x1002e247b: mov rdi, r13
0x1002e247e: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e2483: movsx edi, byte ptr [rbp - 0x70]
0x1002e2487: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e248c: mov byte ptr [rbp - 0x70], al
0x1002e248f: mov rdx, qword ptr [rip + 0x1b0d1d2] ; 0x101def668
0x1002e2496: mov esi, 0x120
0x1002e249b: mov ecx, 0x10
0x1002e24a0: mov rdi, r15
0x1002e24a3: call 0x100795530 ; 0x100795530
0x1002e24a8: vmovaps xmm0, xmmword ptr [rip + 0x7ca9b0] ; 0x100aace60
0x1002e24b0: vmovups xmmword ptr [rax], xmm0
0x1002e24b4: mov word ptr [rax + 0x10], 0x100
0x1002e24ba: mov byte ptr [rax + 0x12], 0
0x1002e24be: mov qword ptr [rax + 0x14], 0
0x1002e24c6: vxorps xmm0, xmm0, xmm0
0x1002e24ca: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e24cf: mov dword ptr [rax + 0x28], 0
0x1002e24d6: vmovaps xmm0, xmmword ptr [rip + 0x7d71d2] ; 0x100ab96b0
0x1002e24de: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e24e3: mov byte ptr [rax + 0x40], 0
0x1002e24e7: vxorps ymm0, ymm0, ymm0
0x1002e24eb: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e24f3: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e24f8: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e24fd: mov qword ptr [rax + 0xa4], r14
0x1002e2504: vmovaps xmm0, xmmword ptr [rbx]
0x1002e2508: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e2510: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e2518: vxorps xmm0, xmm0, xmm0
0x1002e251c: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e2524: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e252e: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e2536: movabs rcx, 0x3f80000000000000
0x1002e2540: mov qword ptr [rax + 0xf4], rcx
0x1002e2547: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e254f: mov qword ptr [rax + 0x10c], rcx
0x1002e2556: mov byte ptr [rax + 0x114], 1
0x1002e255d: mov qword ptr [rax + 0x118], 0
0x1002e2568: mov qword ptr [rip + 0x1b0d1c9], rax ; 0x101def738
0x1002e256f: mov rdi, r12
0x1002e2572: mov rsi, rax
0x1002e2575: mov rdx, r13
0x1002e2578: vzeroupper 
0x1002e257b: call 0x100314920 ; 0x100314920
0x1002e2580: lea rsi, [rip + 0x89d41a] ; 0x100b7f9a1 calciteDissolveLarge
0x1002e2587: mov edx, 0x40
0x1002e258c: mov rdi, r13
0x1002e258f: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e2594: movsx edi, byte ptr [rbp - 0x70]
0x1002e2598: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e259d: mov byte ptr [rbp - 0x70], al
0x1002e25a0: mov rdx, qword ptr [rip + 0x1b0d0c1] ; 0x101def668
0x1002e25a7: mov esi, 0x120
0x1002e25ac: mov ecx, 0x10
0x1002e25b1: mov rdi, r15
0x1002e25b4: call 0x100795530 ; 0x100795530
0x1002e25b9: vmovaps xmm0, xmmword ptr [rip + 0x7ca89f] ; 0x100aace60
0x1002e25c1: vmovups xmmword ptr [rax], xmm0
0x1002e25c5: mov word ptr [rax + 0x10], 0x100
0x1002e25cb: mov byte ptr [rax + 0x12], 0
0x1002e25cf: mov qword ptr [rax + 0x14], 0
0x1002e25d7: vxorps xmm0, xmm0, xmm0
0x1002e25db: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e25e0: mov dword ptr [rax + 0x28], 0
0x1002e25e7: vmovaps xmm0, xmmword ptr [rip + 0x7d70c1] ; 0x100ab96b0
0x1002e25ef: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e25f4: mov byte ptr [rax + 0x40], 0
0x1002e25f8: vxorps ymm0, ymm0, ymm0
0x1002e25fc: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e2604: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e2609: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e260e: mov qword ptr [rax + 0xa4], r14
0x1002e2615: vmovaps xmm0, xmmword ptr [rbx]
0x1002e2619: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e2621: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e2629: vxorps xmm0, xmm0, xmm0
0x1002e262d: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e2635: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e263f: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e2647: movabs rcx, 0x3f80000000000000
0x1002e2651: mov qword ptr [rax + 0xf4], rcx
0x1002e2658: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e2660: mov qword ptr [rax + 0x10c], rcx
0x1002e2667: mov byte ptr [rax + 0x114], 1
0x1002e266e: mov qword ptr [rax + 0x118], 0
0x1002e2679: mov qword ptr [rip + 0x1b0d0c0], rax ; 0x101def740
0x1002e2680: mov rdi, r12
0x1002e2683: mov rsi, rax
0x1002e2686: mov rdx, r13
0x1002e2689: vzeroupper 
0x1002e268c: call 0x100314920 ; 0x100314920
0x1002e2691: lea rsi, [rip + 0x89d31e] ; 0x100b7f9b6 calciteDissolveLargePuff
0x1002e2698: mov edx, 0x40
0x1002e269d: mov rdi, r13
0x1002e26a0: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e26a5: movsx edi, byte ptr [rbp - 0x70]
0x1002e26a9: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e26ae: mov byte ptr [rbp - 0x70], al
0x1002e26b1: mov rdx, qword ptr [rip + 0x1b0cfb0] ; 0x101def668
0x1002e26b8: mov esi, 0x120
0x1002e26bd: mov ecx, 0x10
0x1002e26c2: mov rdi, r15
0x1002e26c5: call 0x100795530 ; 0x100795530
0x1002e26ca: vmovaps xmm0, xmmword ptr [rip + 0x7ca78e] ; 0x100aace60
0x1002e26d2: vmovups xmmword ptr [rax], xmm0
0x1002e26d6: mov word ptr [rax + 0x10], 0x100
0x1002e26dc: mov byte ptr [rax + 0x12], 0
0x1002e26e0: mov qword ptr [rax + 0x14], 0
0x1002e26e8: vxorps xmm0, xmm0, xmm0
0x1002e26ec: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e26f1: mov dword ptr [rax + 0x28], 0
0x1002e26f8: vmovaps xmm0, xmmword ptr [rip + 0x7d6fb0] ; 0x100ab96b0
0x1002e2700: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e2705: mov byte ptr [rax + 0x40], 0
0x1002e2709: vxorps ymm0, ymm0, ymm0
0x1002e270d: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e2715: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e271a: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e271f: mov qword ptr [rax + 0xa4], r14
0x1002e2726: vmovaps xmm0, xmmword ptr [rbx]
0x1002e272a: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e2732: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e273a: vxorps xmm0, xmm0, xmm0
0x1002e273e: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e2746: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e2750: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e2758: movabs rcx, 0x3f80000000000000
0x1002e2762: mov qword ptr [rax + 0xf4], rcx
0x1002e2769: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e2771: mov qword ptr [rax + 0x10c], rcx
0x1002e2778: mov byte ptr [rax + 0x114], 1
0x1002e277f: mov qword ptr [rax + 0x118], 0
0x1002e278a: mov qword ptr [rip + 0x1b0cfb7], rax ; 0x101def748
0x1002e2791: mov rdi, r12
0x1002e2794: mov rsi, rax
0x1002e2797: mov rdx, r13
0x1002e279a: vzeroupper 
0x1002e279d: call 0x100314920 ; 0x100314920
0x1002e27a2: lea rsi, [rip + 0x89d226] ; 0x100b7f9cf collectibleReward
0x1002e27a9: mov edx, 0x40
0x1002e27ae: mov rdi, r13
0x1002e27b1: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e27b6: movsx edi, byte ptr [rbp - 0x70]
0x1002e27ba: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e27bf: mov byte ptr [rbp - 0x70], al
0x1002e27c2: mov rdx, qword ptr [rip + 0x1b0ce9f] ; 0x101def668
0x1002e27c9: mov esi, 0x120
0x1002e27ce: mov ecx, 0x10
0x1002e27d3: mov rdi, r15
0x1002e27d6: call 0x100795530 ; 0x100795530
0x1002e27db: vmovaps xmm0, xmmword ptr [rip + 0x7ca67d] ; 0x100aace60
0x1002e27e3: vmovups xmmword ptr [rax], xmm0
0x1002e27e7: mov word ptr [rax + 0x10], 0x100
0x1002e27ed: mov byte ptr [rax + 0x12], 0
0x1002e27f1: mov qword ptr [rax + 0x14], 0
0x1002e27f9: vxorps xmm0, xmm0, xmm0
0x1002e27fd: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e2802: mov dword ptr [rax + 0x28], 0
0x1002e2809: vmovaps xmm0, xmmword ptr [rip + 0x7d6e9f] ; 0x100ab96b0
0x1002e2811: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e2816: mov byte ptr [rax + 0x40], 0
0x1002e281a: vxorps ymm0, ymm0, ymm0
0x1002e281e: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e2826: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e282b: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e2830: mov qword ptr [rax + 0xa4], r14
0x1002e2837: vmovaps xmm0, xmmword ptr [rbx]
0x1002e283b: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e2843: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e284b: vxorps xmm0, xmm0, xmm0
0x1002e284f: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e2857: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e2861: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e2869: movabs rcx, 0x3f80000000000000
0x1002e2873: mov qword ptr [rax + 0xf4], rcx
0x1002e287a: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e2882: mov qword ptr [rax + 0x10c], rcx
0x1002e2889: mov byte ptr [rax + 0x114], 1
0x1002e2890: mov qword ptr [rax + 0x118], 0
0x1002e289b: mov qword ptr [rip + 0x1b0ceae], rax ; 0x101def750
0x1002e28a2: mov rdi, r12
0x1002e28a5: mov rsi, rax
0x1002e28a8: mov rdx, r13
0x1002e28ab: vzeroupper 
0x1002e28ae: call 0x100314920 ; 0x100314920
0x1002e28b3: lea rsi, [rip + 0x89d127] ; 0x100b7f9e1 faithUIBar
0x1002e28ba: mov edx, 0x40
0x1002e28bf: mov rdi, r13
0x1002e28c2: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e28c7: movsx edi, byte ptr [rbp - 0x70]
0x1002e28cb: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e28d0: mov byte ptr [rbp - 0x70], al
0x1002e28d3: mov rdx, qword ptr [rip + 0x1b0cd8e] ; 0x101def668
0x1002e28da: mov esi, 0x120
0x1002e28df: mov ecx, 0x10
0x1002e28e4: mov rdi, r15
0x1002e28e7: call 0x100795530 ; 0x100795530
0x1002e28ec: vmovaps xmm0, xmmword ptr [rip + 0x7ca56c] ; 0x100aace60
0x1002e28f4: vmovups xmmword ptr [rax], xmm0
0x1002e28f8: mov word ptr [rax + 0x10], 0x100
0x1002e28fe: mov byte ptr [rax + 0x12], 0
0x1002e2902: mov qword ptr [rax + 0x14], 0
0x1002e290a: vxorps xmm0, xmm0, xmm0
0x1002e290e: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e2913: mov dword ptr [rax + 0x28], 0
0x1002e291a: vmovaps xmm0, xmmword ptr [rip + 0x7d6d8e] ; 0x100ab96b0
0x1002e2922: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e2927: mov byte ptr [rax + 0x40], 0
0x1002e292b: vxorps ymm0, ymm0, ymm0
0x1002e292f: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e2937: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e293c: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e2941: mov qword ptr [rax + 0xa4], r14
0x1002e2948: vmovaps xmm0, xmmword ptr [rbx]
0x1002e294c: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e2954: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e295c: vxorps xmm0, xmm0, xmm0
0x1002e2960: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e2968: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e2972: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e297a: movabs rcx, 0x3f80000000000000
0x1002e2984: mov qword ptr [rax + 0xf4], rcx
0x1002e298b: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e2993: mov qword ptr [rax + 0x10c], rcx
0x1002e299a: mov byte ptr [rax + 0x114], 1
0x1002e29a1: mov qword ptr [rax + 0x118], 0
0x1002e29ac: mov qword ptr [rip + 0x1b0cda5], rax ; 0x101def758
0x1002e29b3: mov rdi, r12
0x1002e29b6: mov rsi, rax
0x1002e29b9: mov rdx, r13
0x1002e29bc: vzeroupper 
0x1002e29bf: call 0x100314920 ; 0x100314920
0x1002e29c4: lea rsi, [rip + 0x881331] ; 0x100b63cfc checkpoint
0x1002e29cb: mov edx, 0x40
0x1002e29d0: mov rdi, r13
0x1002e29d3: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e29d8: movsx edi, byte ptr [rbp - 0x70]
0x1002e29dc: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e29e1: mov byte ptr [rbp - 0x70], al
0x1002e29e4: mov rdx, qword ptr [rip + 0x1b0cc7d] ; 0x101def668
0x1002e29eb: mov esi, 0x120
0x1002e29f0: mov ecx, 0x10
0x1002e29f5: mov rdi, r15
0x1002e29f8: call 0x100795530 ; 0x100795530
0x1002e29fd: vmovaps xmm0, xmmword ptr [rip + 0x7ca45b] ; 0x100aace60
0x1002e2a05: vmovups xmmword ptr [rax], xmm0
0x1002e2a09: mov word ptr [rax + 0x10], 0x100
0x1002e2a0f: mov byte ptr [rax + 0x12], 0
0x1002e2a13: mov qword ptr [rax + 0x14], 0
0x1002e2a1b: vxorps xmm0, xmm0, xmm0
0x1002e2a1f: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e2a24: mov dword ptr [rax + 0x28], 0
0x1002e2a2b: vmovaps xmm0, xmmword ptr [rip + 0x7d6c7d] ; 0x100ab96b0
0x1002e2a33: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e2a38: mov byte ptr [rax + 0x40], 0
0x1002e2a3c: vxorps ymm0, ymm0, ymm0
0x1002e2a40: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e2a48: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e2a4d: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e2a52: mov qword ptr [rax + 0xa4], r14
0x1002e2a59: vmovaps xmm0, xmmword ptr [rbx]
0x1002e2a5d: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e2a65: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e2a6d: vxorps xmm0, xmm0, xmm0
0x1002e2a71: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e2a79: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e2a83: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e2a8b: movabs rcx, 0x3f80000000000000
0x1002e2a95: mov qword ptr [rax + 0xf4], rcx
0x1002e2a9c: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e2aa4: mov qword ptr [rax + 0x10c], rcx
0x1002e2aab: mov byte ptr [rax + 0x114], 1
0x1002e2ab2: mov qword ptr [rax + 0x118], 0
0x1002e2abd: mov qword ptr [rip + 0x1b0cc9c], rax ; 0x101def760
0x1002e2ac4: mov rdi, r12
0x1002e2ac7: mov rsi, rax
0x1002e2aca: mov rdx, r13
0x1002e2acd: vzeroupper 
0x1002e2ad0: call 0x100314920 ; 0x100314920
0x1002e2ad5: lea rsi, [rip + 0x89cf10] ; 0x100b7f9ec redLight
0x1002e2adc: mov edx, 0x40
0x1002e2ae1: mov rdi, r13
0x1002e2ae4: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e2ae9: movsx edi, byte ptr [rbp - 0x70]
0x1002e2aed: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e2af2: mov byte ptr [rbp - 0x70], al
0x1002e2af5: mov rdx, qword ptr [rip + 0x1b0cb6c] ; 0x101def668
0x1002e2afc: mov esi, 0x120
0x1002e2b01: mov ecx, 0x10
0x1002e2b06: mov rdi, r15
0x1002e2b09: call 0x100795530 ; 0x100795530
0x1002e2b0e: vmovaps xmm0, xmmword ptr [rip + 0x7ca34a] ; 0x100aace60
0x1002e2b16: vmovups xmmword ptr [rax], xmm0
0x1002e2b1a: mov word ptr [rax + 0x10], 0x100
0x1002e2b20: mov byte ptr [rax + 0x12], 0
0x1002e2b24: mov qword ptr [rax + 0x14], 0
0x1002e2b2c: vxorps xmm0, xmm0, xmm0
0x1002e2b30: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e2b35: mov dword ptr [rax + 0x28], 0
0x1002e2b3c: vmovaps xmm0, xmmword ptr [rip + 0x7d6b6c] ; 0x100ab96b0
0x1002e2b44: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e2b49: mov byte ptr [rax + 0x40], 0
0x1002e2b4d: vxorps ymm0, ymm0, ymm0
0x1002e2b51: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e2b59: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e2b5e: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e2b63: mov qword ptr [rax + 0xa4], r14
0x1002e2b6a: vmovaps xmm0, xmmword ptr [rbx]
0x1002e2b6e: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e2b76: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e2b7e: vxorps xmm0, xmm0, xmm0
0x1002e2b82: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e2b8a: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e2b94: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e2b9c: movabs rcx, 0x3f80000000000000
0x1002e2ba6: mov qword ptr [rax + 0xf4], rcx
0x1002e2bad: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e2bb5: mov qword ptr [rax + 0x10c], rcx
0x1002e2bbc: mov byte ptr [rax + 0x114], 1
0x1002e2bc3: mov qword ptr [rax + 0x118], 0
0x1002e2bce: mov qword ptr [rip + 0x1b0cb93], rax ; 0x101def768
0x1002e2bd5: mov rdi, r12
0x1002e2bd8: mov rsi, rax
0x1002e2bdb: mov rdx, r13
0x1002e2bde: vzeroupper 
0x1002e2be1: call 0x100314920 ; 0x100314920
0x1002e2be6: lea rsi, [rip + 0x89ce08] ; 0x100b7f9f5 whiteLight
0x1002e2bed: mov edx, 0x40
0x1002e2bf2: mov rdi, r13
0x1002e2bf5: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e2bfa: movsx edi, byte ptr [rbp - 0x70]
0x1002e2bfe: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e2c03: mov byte ptr [rbp - 0x70], al
0x1002e2c06: mov rdx, qword ptr [rip + 0x1b0ca5b] ; 0x101def668
0x1002e2c0d: mov esi, 0x120
0x1002e2c12: mov ecx, 0x10
0x1002e2c17: mov rdi, r15
0x1002e2c1a: call 0x100795530 ; 0x100795530
0x1002e2c1f: vmovaps xmm0, xmmword ptr [rip + 0x7ca239] ; 0x100aace60
0x1002e2c27: vmovups xmmword ptr [rax], xmm0
0x1002e2c2b: mov word ptr [rax + 0x10], 0x100
0x1002e2c31: mov byte ptr [rax + 0x12], 0
0x1002e2c35: mov qword ptr [rax + 0x14], 0
0x1002e2c3d: vxorps xmm0, xmm0, xmm0
0x1002e2c41: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e2c46: mov dword ptr [rax + 0x28], 0
0x1002e2c4d: vmovaps xmm0, xmmword ptr [rip + 0x7d6a5b] ; 0x100ab96b0
0x1002e2c55: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e2c5a: mov byte ptr [rax + 0x40], 0
0x1002e2c5e: vxorps ymm0, ymm0, ymm0
0x1002e2c62: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e2c6a: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e2c6f: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e2c74: mov qword ptr [rax + 0xa4], r14
0x1002e2c7b: vmovaps xmm0, xmmword ptr [rbx]
0x1002e2c7f: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e2c87: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e2c8f: vxorps xmm0, xmm0, xmm0
0x1002e2c93: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e2c9b: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e2ca5: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e2cad: movabs rcx, 0x3f80000000000000
0x1002e2cb7: mov qword ptr [rax + 0xf4], rcx
0x1002e2cbe: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e2cc6: mov qword ptr [rax + 0x10c], rcx
0x1002e2ccd: mov byte ptr [rax + 0x114], 1
0x1002e2cd4: mov qword ptr [rax + 0x118], 0
0x1002e2cdf: mov qword ptr [rip + 0x1b0ca8a], rax ; 0x101def770
0x1002e2ce6: mov rdi, r12
0x1002e2ce9: mov rsi, rax
0x1002e2cec: mov rdx, r13
0x1002e2cef: vzeroupper 
0x1002e2cf2: call 0x100314920 ; 0x100314920
0x1002e2cf7: lea rsi, [rip + 0x89cd02] ; 0x100b7fa00 lamp
0x1002e2cfe: mov edx, 0x40
0x1002e2d03: mov rdi, r13
0x1002e2d06: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e2d0b: movsx edi, byte ptr [rbp - 0x70]
0x1002e2d0f: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e2d14: mov byte ptr [rbp - 0x70], al
0x1002e2d17: mov rdx, qword ptr [rip + 0x1b0c94a] ; 0x101def668
0x1002e2d1e: mov esi, 0x120
0x1002e2d23: mov ecx, 0x10
0x1002e2d28: mov rdi, r15
0x1002e2d2b: call 0x100795530 ; 0x100795530
0x1002e2d30: vmovaps xmm0, xmmword ptr [rip + 0x7ca128] ; 0x100aace60
0x1002e2d38: vmovups xmmword ptr [rax], xmm0
0x1002e2d3c: mov word ptr [rax + 0x10], 0x100
0x1002e2d42: mov byte ptr [rax + 0x12], 0
0x1002e2d46: mov qword ptr [rax + 0x14], 0
0x1002e2d4e: vxorps xmm0, xmm0, xmm0
0x1002e2d52: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e2d57: mov dword ptr [rax + 0x28], 0
0x1002e2d5e: vmovaps xmm0, xmmword ptr [rip + 0x7d694a] ; 0x100ab96b0
0x1002e2d66: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e2d6b: mov byte ptr [rax + 0x40], 0
0x1002e2d6f: vxorps ymm0, ymm0, ymm0
0x1002e2d73: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e2d7b: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e2d80: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e2d85: mov qword ptr [rax + 0xa4], r14
0x1002e2d8c: vmovaps xmm0, xmmword ptr [rbx]
0x1002e2d90: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e2d98: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e2da0: vxorps xmm0, xmm0, xmm0
0x1002e2da4: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e2dac: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e2db6: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e2dbe: movabs rcx, 0x3f80000000000000
0x1002e2dc8: mov qword ptr [rax + 0xf4], rcx
0x1002e2dcf: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e2dd7: mov qword ptr [rax + 0x10c], rcx
0x1002e2dde: mov byte ptr [rax + 0x114], 1
0x1002e2de5: mov qword ptr [rax + 0x118], 0
0x1002e2df0: mov qword ptr [rip + 0x1b0c981], rax ; 0x101def778
0x1002e2df7: mov rdi, r12
0x1002e2dfa: mov rsi, rax
0x1002e2dfd: mov rdx, r13
0x1002e2e00: vzeroupper 
0x1002e2e03: call 0x100314920 ; 0x100314920
0x1002e2e08: lea rsi, [rip + 0x89cbf6] ; 0x100b7fa05 fire
0x1002e2e0f: mov edx, 0x40
0x1002e2e14: mov rdi, r13
0x1002e2e17: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e2e1c: movsx edi, byte ptr [rbp - 0x70]
0x1002e2e20: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e2e25: mov byte ptr [rbp - 0x70], al
0x1002e2e28: mov rdx, qword ptr [rip + 0x1b0c839] ; 0x101def668
0x1002e2e2f: mov esi, 0x120
0x1002e2e34: mov ecx, 0x10
0x1002e2e39: mov rdi, r15
0x1002e2e3c: call 0x100795530 ; 0x100795530
0x1002e2e41: vmovaps xmm0, xmmword ptr [rip + 0x7ca017] ; 0x100aace60
0x1002e2e49: vmovups xmmword ptr [rax], xmm0
0x1002e2e4d: mov word ptr [rax + 0x10], 0x100
0x1002e2e53: mov byte ptr [rax + 0x12], 0
0x1002e2e57: mov qword ptr [rax + 0x14], 0
0x1002e2e5f: vxorps xmm0, xmm0, xmm0
0x1002e2e63: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e2e68: mov dword ptr [rax + 0x28], 0
0x1002e2e6f: vmovaps xmm0, xmmword ptr [rip + 0x7d6839] ; 0x100ab96b0
0x1002e2e77: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e2e7c: mov byte ptr [rax + 0x40], 0
0x1002e2e80: vxorps ymm0, ymm0, ymm0
0x1002e2e84: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e2e8c: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e2e91: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e2e96: mov qword ptr [rax + 0xa4], r14
0x1002e2e9d: vmovaps xmm0, xmmword ptr [rbx]
0x1002e2ea1: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e2ea9: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e2eb1: vxorps xmm0, xmm0, xmm0
0x1002e2eb5: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e2ebd: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e2ec7: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e2ecf: movabs rcx, 0x3f80000000000000
0x1002e2ed9: mov qword ptr [rax + 0xf4], rcx
0x1002e2ee0: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e2ee8: mov qword ptr [rax + 0x10c], rcx
0x1002e2eef: mov byte ptr [rax + 0x114], 1
0x1002e2ef6: mov qword ptr [rax + 0x118], 0
0x1002e2f01: mov qword ptr [rip + 0x1b0c878], rax ; 0x101def780
0x1002e2f08: mov rdi, r12
0x1002e2f0b: mov rsi, rax
0x1002e2f0e: mov rdx, r13
0x1002e2f11: vzeroupper 
0x1002e2f14: call 0x100314920 ; 0x100314920
0x1002e2f19: lea rsi, [rip + 0x89caea] ; 0x100b7fa0a fireLocal
0x1002e2f20: mov edx, 0x40
0x1002e2f25: mov rdi, r13
0x1002e2f28: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e2f2d: movsx edi, byte ptr [rbp - 0x70]
0x1002e2f31: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e2f36: mov byte ptr [rbp - 0x70], al
0x1002e2f39: mov rdx, qword ptr [rip + 0x1b0c728] ; 0x101def668
0x1002e2f40: mov esi, 0x120
0x1002e2f45: mov ecx, 0x10
0x1002e2f4a: mov rdi, r15
0x1002e2f4d: call 0x100795530 ; 0x100795530
0x1002e2f52: vmovaps xmm0, xmmword ptr [rip + 0x7c9f06] ; 0x100aace60
0x1002e2f5a: vmovups xmmword ptr [rax], xmm0
0x1002e2f5e: mov word ptr [rax + 0x10], 0x100
0x1002e2f64: mov byte ptr [rax + 0x12], 0
0x1002e2f68: mov qword ptr [rax + 0x14], 0
0x1002e2f70: vxorps xmm0, xmm0, xmm0
0x1002e2f74: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e2f79: mov dword ptr [rax + 0x28], 0
0x1002e2f80: vmovaps xmm0, xmmword ptr [rip + 0x7d6728] ; 0x100ab96b0
0x1002e2f88: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e2f8d: mov byte ptr [rax + 0x40], 0
0x1002e2f91: vxorps ymm0, ymm0, ymm0
0x1002e2f95: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e2f9d: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e2fa2: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e2fa7: mov qword ptr [rax + 0xa4], r14
0x1002e2fae: vmovaps xmm0, xmmword ptr [rbx]
0x1002e2fb2: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e2fba: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e2fc2: vxorps xmm0, xmm0, xmm0
0x1002e2fc6: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e2fce: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e2fd8: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e2fe0: movabs rcx, 0x3f80000000000000
0x1002e2fea: mov qword ptr [rax + 0xf4], rcx
0x1002e2ff1: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e2ff9: mov qword ptr [rax + 0x10c], rcx
0x1002e3000: mov byte ptr [rax + 0x114], 1
0x1002e3007: mov qword ptr [rax + 0x118], 0
0x1002e3012: mov qword ptr [rip + 0x1b0c76f], rax ; 0x101def788
0x1002e3019: mov rdi, r12
0x1002e301c: mov rsi, rax
0x1002e301f: mov rdx, r13
0x1002e3022: vzeroupper 
0x1002e3025: call 0x100314920 ; 0x100314920
0x1002e302a: lea rsi, [rip + 0x89c9e3] ; 0x100b7fa14 candleFlame
0x1002e3031: mov edx, 0x40
0x1002e3036: mov rdi, r13
0x1002e3039: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e303e: movsx edi, byte ptr [rbp - 0x70]
0x1002e3042: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e3047: mov byte ptr [rbp - 0x70], al
0x1002e304a: mov rdx, qword ptr [rip + 0x1b0c617] ; 0x101def668
0x1002e3051: mov esi, 0x120
0x1002e3056: mov ecx, 0x10
0x1002e305b: mov rdi, r15
0x1002e305e: call 0x100795530 ; 0x100795530
0x1002e3063: vmovaps xmm0, xmmword ptr [rip + 0x7c9df5] ; 0x100aace60
0x1002e306b: vmovups xmmword ptr [rax], xmm0
0x1002e306f: mov word ptr [rax + 0x10], 0x100
0x1002e3075: mov byte ptr [rax + 0x12], 0
0x1002e3079: mov qword ptr [rax + 0x14], 0
0x1002e3081: vxorps xmm0, xmm0, xmm0
0x1002e3085: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e308a: mov dword ptr [rax + 0x28], 0
0x1002e3091: vmovaps xmm0, xmmword ptr [rip + 0x7d6617] ; 0x100ab96b0
0x1002e3099: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e309e: mov byte ptr [rax + 0x40], 0
0x1002e30a2: vxorps ymm0, ymm0, ymm0
0x1002e30a6: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e30ae: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e30b3: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e30b8: mov qword ptr [rax + 0xa4], r14
0x1002e30bf: vmovaps xmm0, xmmword ptr [rbx]
0x1002e30c3: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e30cb: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e30d3: vxorps xmm0, xmm0, xmm0
0x1002e30d7: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e30df: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e30e9: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e30f1: movabs rcx, 0x3f80000000000000
0x1002e30fb: mov qword ptr [rax + 0xf4], rcx
0x1002e3102: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e310a: mov qword ptr [rax + 0x10c], rcx
0x1002e3111: mov byte ptr [rax + 0x114], 1
0x1002e3118: mov qword ptr [rax + 0x118], 0
0x1002e3123: mov qword ptr [rip + 0x1b0c666], rax ; 0x101def790
0x1002e312a: mov rdi, r12
0x1002e312d: mov rsi, rax
0x1002e3130: mov rdx, r13
0x1002e3133: vzeroupper 
0x1002e3136: call 0x100314920 ; 0x100314920
0x1002e313b: lea rsi, [rip + 0x89c8de] ; 0x100b7fa20 candleRing
0x1002e3142: mov edx, 0x40
0x1002e3147: mov rdi, r13
0x1002e314a: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e314f: movsx edi, byte ptr [rbp - 0x70]
0x1002e3153: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e3158: mov byte ptr [rbp - 0x70], al
0x1002e315b: mov rdx, qword ptr [rip + 0x1b0c506] ; 0x101def668
0x1002e3162: mov esi, 0x120
0x1002e3167: mov ecx, 0x10
0x1002e316c: mov rdi, r15
0x1002e316f: call 0x100795530 ; 0x100795530
0x1002e3174: vmovaps xmm0, xmmword ptr [rip + 0x7c9ce4] ; 0x100aace60
0x1002e317c: vmovups xmmword ptr [rax], xmm0
0x1002e3180: mov word ptr [rax + 0x10], 0x100
0x1002e3186: mov byte ptr [rax + 0x12], 0
0x1002e318a: mov qword ptr [rax + 0x14], 0
0x1002e3192: vxorps xmm0, xmm0, xmm0
0x1002e3196: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e319b: mov dword ptr [rax + 0x28], 0
0x1002e31a2: vmovaps xmm0, xmmword ptr [rip + 0x7d6506] ; 0x100ab96b0
0x1002e31aa: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e31af: mov byte ptr [rax + 0x40], 0
0x1002e31b3: vxorps ymm0, ymm0, ymm0
0x1002e31b7: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e31bf: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e31c4: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e31c9: mov qword ptr [rax + 0xa4], r14
0x1002e31d0: vmovaps xmm0, xmmword ptr [rbx]
0x1002e31d4: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e31dc: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e31e4: vxorps xmm0, xmm0, xmm0
0x1002e31e8: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e31f0: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e31fa: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e3202: movabs rcx, 0x3f80000000000000
0x1002e320c: mov qword ptr [rax + 0xf4], rcx
0x1002e3213: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e321b: mov qword ptr [rax + 0x10c], rcx
0x1002e3222: mov byte ptr [rax + 0x114], 1
0x1002e3229: mov qword ptr [rax + 0x118], 0
0x1002e3234: mov qword ptr [rip + 0x1b0c55d], rax ; 0x101def798
0x1002e323b: mov rdi, r12
0x1002e323e: mov rsi, rax
0x1002e3241: mov rdx, r13
0x1002e3244: vzeroupper 
0x1002e3247: call 0x100314920 ; 0x100314920
0x1002e324c: lea rsi, [rip + 0x89c7d8] ; 0x100b7fa2b fireLantern
0x1002e3253: mov edx, 0x40
0x1002e3258: mov rdi, r13
0x1002e325b: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e3260: movsx edi, byte ptr [rbp - 0x70]
0x1002e3264: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e3269: mov byte ptr [rbp - 0x70], al
0x1002e326c: mov rdx, qword ptr [rip + 0x1b0c3f5] ; 0x101def668
0x1002e3273: mov esi, 0x120
0x1002e3278: mov ecx, 0x10
0x1002e327d: mov rdi, r15
0x1002e3280: call 0x100795530 ; 0x100795530
0x1002e3285: vmovaps xmm0, xmmword ptr [rip + 0x7c9bd3] ; 0x100aace60
0x1002e328d: vmovups xmmword ptr [rax], xmm0
0x1002e3291: mov word ptr [rax + 0x10], 0x100
0x1002e3297: mov byte ptr [rax + 0x12], 0
0x1002e329b: mov qword ptr [rax + 0x14], 0
0x1002e32a3: vxorps xmm0, xmm0, xmm0
0x1002e32a7: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e32ac: mov dword ptr [rax + 0x28], 0
0x1002e32b3: vmovaps xmm0, xmmword ptr [rip + 0x7d63f5] ; 0x100ab96b0
0x1002e32bb: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e32c0: mov byte ptr [rax + 0x40], 0
0x1002e32c4: vxorps ymm0, ymm0, ymm0
0x1002e32c8: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e32d0: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e32d5: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e32da: mov qword ptr [rax + 0xa4], r14
0x1002e32e1: vmovaps xmm0, xmmword ptr [rbx]
0x1002e32e5: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e32ed: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e32f5: vxorps xmm0, xmm0, xmm0
0x1002e32f9: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e3301: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e330b: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e3313: movabs rcx, 0x3f80000000000000
0x1002e331d: mov qword ptr [rax + 0xf4], rcx
0x1002e3324: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e332c: mov qword ptr [rax + 0x10c], rcx
0x1002e3333: mov byte ptr [rax + 0x114], 1
0x1002e333a: mov qword ptr [rax + 0x118], 0
0x1002e3345: mov qword ptr [rip + 0x1b0c454], rax ; 0x101def7a0
0x1002e334c: mov rdi, r12
0x1002e334f: mov rsi, rax
0x1002e3352: mov rdx, r13
0x1002e3355: vzeroupper 
0x1002e3358: call 0x100314920 ; 0x100314920
0x1002e335d: lea rsi, [rip + 0x89c6d3] ; 0x100b7fa37 sparkFire
0x1002e3364: mov edx, 0x40
0x1002e3369: mov rdi, r13
0x1002e336c: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e3371: movsx edi, byte ptr [rbp - 0x70]
0x1002e3375: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e337a: mov byte ptr [rbp - 0x70], al
0x1002e337d: mov rdx, qword ptr [rip + 0x1b0c2e4] ; 0x101def668
0x1002e3384: mov esi, 0x120
0x1002e3389: mov ecx, 0x10
0x1002e338e: mov rdi, r15
0x1002e3391: call 0x100795530 ; 0x100795530
0x1002e3396: vmovaps xmm0, xmmword ptr [rip + 0x7c9ac2] ; 0x100aace60
0x1002e339e: vmovups xmmword ptr [rax], xmm0
0x1002e33a2: mov word ptr [rax + 0x10], 0x100
0x1002e33a8: mov byte ptr [rax + 0x12], 0
0x1002e33ac: mov qword ptr [rax + 0x14], 0
0x1002e33b4: vxorps xmm0, xmm0, xmm0
0x1002e33b8: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e33bd: mov dword ptr [rax + 0x28], 0
0x1002e33c4: vmovaps xmm0, xmmword ptr [rip + 0x7d62e4] ; 0x100ab96b0
0x1002e33cc: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e33d1: mov byte ptr [rax + 0x40], 0
0x1002e33d5: vxorps ymm0, ymm0, ymm0
0x1002e33d9: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e33e1: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e33e6: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e33eb: mov qword ptr [rax + 0xa4], r14
0x1002e33f2: vmovaps xmm0, xmmword ptr [rbx]
0x1002e33f6: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e33fe: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e3406: vxorps xmm0, xmm0, xmm0
0x1002e340a: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e3412: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e341c: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e3424: movabs rcx, 0x3f80000000000000
0x1002e342e: mov qword ptr [rax + 0xf4], rcx
0x1002e3435: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e343d: mov qword ptr [rax + 0x10c], rcx
0x1002e3444: mov byte ptr [rax + 0x114], 1
0x1002e344b: mov qword ptr [rax + 0x118], 0
0x1002e3456: mov qword ptr [rip + 0x1b0c34b], rax ; 0x101def7a8
0x1002e345d: mov rdi, r12
0x1002e3460: mov rsi, rax
0x1002e3463: mov rdx, r13
0x1002e3466: vzeroupper 
0x1002e3469: call 0x100314920 ; 0x100314920
0x1002e346e: lea rsi, [rip + 0x89c5cc] ; 0x100b7fa41 portal
0x1002e3475: mov edx, 0x40
0x1002e347a: mov rdi, r13
0x1002e347d: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e3482: movsx edi, byte ptr [rbp - 0x70]
0x1002e3486: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e348b: mov byte ptr [rbp - 0x70], al
0x1002e348e: mov rdx, qword ptr [rip + 0x1b0c1d3] ; 0x101def668
0x1002e3495: mov esi, 0x120
0x1002e349a: mov ecx, 0x10
0x1002e349f: mov rdi, r15
0x1002e34a2: call 0x100795530 ; 0x100795530
0x1002e34a7: vmovaps xmm0, xmmword ptr [rip + 0x7c99b1] ; 0x100aace60
0x1002e34af: vmovups xmmword ptr [rax], xmm0
0x1002e34b3: mov word ptr [rax + 0x10], 0x100
0x1002e34b9: mov byte ptr [rax + 0x12], 0
0x1002e34bd: mov qword ptr [rax + 0x14], 0
0x1002e34c5: vxorps xmm0, xmm0, xmm0
0x1002e34c9: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e34ce: mov dword ptr [rax + 0x28], 0
0x1002e34d5: vmovaps xmm0, xmmword ptr [rip + 0x7d61d3] ; 0x100ab96b0
0x1002e34dd: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e34e2: mov byte ptr [rax + 0x40], 0
0x1002e34e6: vxorps ymm0, ymm0, ymm0
0x1002e34ea: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e34f2: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e34f7: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e34fc: mov qword ptr [rax + 0xa4], r14
0x1002e3503: vmovaps xmm0, xmmword ptr [rbx]
0x1002e3507: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e350f: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e3517: vxorps xmm0, xmm0, xmm0
0x1002e351b: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e3523: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e352d: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e3535: movabs rcx, 0x3f80000000000000
0x1002e353f: mov qword ptr [rax + 0xf4], rcx
0x1002e3546: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e354e: mov qword ptr [rax + 0x10c], rcx
0x1002e3555: mov byte ptr [rax + 0x114], 1
0x1002e355c: mov qword ptr [rax + 0x118], 0
0x1002e3567: mov qword ptr [rip + 0x1b0c242], rax ; 0x101def7b0
0x1002e356e: mov rdi, r12
0x1002e3571: mov rsi, rax
0x1002e3574: mov rdx, r13
0x1002e3577: vzeroupper 
0x1002e357a: call 0x100314920 ; 0x100314920
0x1002e357f: lea rsi, [rip + 0x89c4c2] ; 0x100b7fa48 candleSpace
0x1002e3586: mov edx, 0x40
0x1002e358b: mov rdi, r13
0x1002e358e: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e3593: movsx edi, byte ptr [rbp - 0x70]
0x1002e3597: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e359c: mov byte ptr [rbp - 0x70], al
0x1002e359f: mov rdx, qword ptr [rip + 0x1b0c0c2] ; 0x101def668
0x1002e35a6: mov esi, 0x120
0x1002e35ab: mov ecx, 0x10
0x1002e35b0: mov rdi, r15
0x1002e35b3: call 0x100795530 ; 0x100795530
0x1002e35b8: vmovaps xmm0, xmmword ptr [rip + 0x7c98a0] ; 0x100aace60
0x1002e35c0: vmovups xmmword ptr [rax], xmm0
0x1002e35c4: mov word ptr [rax + 0x10], 0x100
0x1002e35ca: mov byte ptr [rax + 0x12], 0
0x1002e35ce: mov qword ptr [rax + 0x14], 0
0x1002e35d6: vxorps xmm0, xmm0, xmm0
0x1002e35da: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e35df: mov dword ptr [rax + 0x28], 0
0x1002e35e6: vmovaps xmm0, xmmword ptr [rip + 0x7d60c2] ; 0x100ab96b0
0x1002e35ee: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e35f3: mov byte ptr [rax + 0x40], 0
0x1002e35f7: vxorps ymm0, ymm0, ymm0
0x1002e35fb: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e3603: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e3608: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e360d: mov qword ptr [rax + 0xa4], r14
0x1002e3614: vmovaps xmm0, xmmword ptr [rbx]
0x1002e3618: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e3620: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e3628: vxorps xmm0, xmm0, xmm0
0x1002e362c: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e3634: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e363e: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e3646: movabs rcx, 0x3f80000000000000
0x1002e3650: mov qword ptr [rax + 0xf4], rcx
0x1002e3657: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e365f: mov qword ptr [rax + 0x10c], rcx
0x1002e3666: mov byte ptr [rax + 0x114], 1
0x1002e366d: mov qword ptr [rax + 0x118], 0
0x1002e3678: mov qword ptr [rip + 0x1b0c139], rax ; 0x101def7b8
0x1002e367f: mov rdi, r12
0x1002e3682: mov rsi, rax
0x1002e3685: mov rdx, r13
0x1002e3688: vzeroupper 
0x1002e368b: call 0x100314920 ; 0x100314920
0x1002e3690: lea rsi, [rip + 0x89c3bd] ; 0x100b7fa54 emberTail
0x1002e3697: mov edx, 0x40
0x1002e369c: mov rdi, r13
0x1002e369f: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e36a4: movsx edi, byte ptr [rbp - 0x70]
0x1002e36a8: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e36ad: mov byte ptr [rbp - 0x70], al
0x1002e36b0: mov rdx, qword ptr [rip + 0x1b0bfb1] ; 0x101def668
0x1002e36b7: mov esi, 0x120
0x1002e36bc: mov ecx, 0x10
0x1002e36c1: mov rdi, r15
0x1002e36c4: call 0x100795530 ; 0x100795530
0x1002e36c9: vmovaps xmm0, xmmword ptr [rip + 0x7c978f] ; 0x100aace60
0x1002e36d1: vmovups xmmword ptr [rax], xmm0
0x1002e36d5: mov word ptr [rax + 0x10], 0x100
0x1002e36db: mov byte ptr [rax + 0x12], 0
0x1002e36df: mov qword ptr [rax + 0x14], 0
0x1002e36e7: vxorps xmm0, xmm0, xmm0
0x1002e36eb: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e36f0: mov dword ptr [rax + 0x28], 0
0x1002e36f7: vmovaps xmm0, xmmword ptr [rip + 0x7d5fb1] ; 0x100ab96b0
0x1002e36ff: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e3704: mov byte ptr [rax + 0x40], 0
0x1002e3708: vxorps ymm0, ymm0, ymm0
0x1002e370c: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e3714: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e3719: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e371e: mov qword ptr [rax + 0xa4], r14
0x1002e3725: vmovaps xmm0, xmmword ptr [rbx]
0x1002e3729: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e3731: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e3739: vxorps xmm0, xmm0, xmm0
0x1002e373d: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e3745: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e374f: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e3757: movabs rcx, 0x3f80000000000000
0x1002e3761: mov qword ptr [rax + 0xf4], rcx
0x1002e3768: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e3770: mov qword ptr [rax + 0x10c], rcx
0x1002e3777: mov byte ptr [rax + 0x114], 1
0x1002e377e: mov qword ptr [rax + 0x118], 0
0x1002e3789: mov qword ptr [rip + 0x1b0c030], rax ; 0x101def7c0
0x1002e3790: mov rdi, r12
0x1002e3793: mov rsi, rax
0x1002e3796: mov rdx, r13
0x1002e3799: vzeroupper 
0x1002e379c: call 0x100314920 ; 0x100314920
0x1002e37a1: lea rsi, [rip + 0x89c2b6] ; 0x100b7fa5e magnetizeArea
0x1002e37a8: mov edx, 0x40
0x1002e37ad: mov rdi, r13
0x1002e37b0: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e37b5: movsx edi, byte ptr [rbp - 0x70]
0x1002e37b9: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e37be: mov byte ptr [rbp - 0x70], al
0x1002e37c1: mov rdx, qword ptr [rip + 0x1b0bea0] ; 0x101def668
0x1002e37c8: mov esi, 0x120
0x1002e37cd: mov ecx, 0x10
0x1002e37d2: mov rdi, r15
0x1002e37d5: call 0x100795530 ; 0x100795530
0x1002e37da: vmovaps xmm0, xmmword ptr [rip + 0x7c967e] ; 0x100aace60
0x1002e37e2: vmovups xmmword ptr [rax], xmm0
0x1002e37e6: mov word ptr [rax + 0x10], 0x100
0x1002e37ec: mov byte ptr [rax + 0x12], 0
0x1002e37f0: mov qword ptr [rax + 0x14], 0
0x1002e37f8: vxorps xmm0, xmm0, xmm0
0x1002e37fc: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e3801: mov dword ptr [rax + 0x28], 0
0x1002e3808: vmovaps xmm0, xmmword ptr [rip + 0x7d5ea0] ; 0x100ab96b0
0x1002e3810: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e3815: mov byte ptr [rax + 0x40], 0
0x1002e3819: vxorps ymm0, ymm0, ymm0
0x1002e381d: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e3825: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e382a: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e382f: mov qword ptr [rax + 0xa4], r14
0x1002e3836: vmovaps xmm0, xmmword ptr [rbx]
0x1002e383a: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e3842: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e384a: vxorps xmm0, xmm0, xmm0
0x1002e384e: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e3856: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e3860: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e3868: movabs rcx, 0x3f80000000000000
0x1002e3872: mov qword ptr [rax + 0xf4], rcx
0x1002e3879: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e3881: mov qword ptr [rax + 0x10c], rcx
0x1002e3888: mov byte ptr [rax + 0x114], 1
0x1002e388f: mov qword ptr [rax + 0x118], 0
0x1002e389a: mov qword ptr [rip + 0x1b0bf27], rax ; 0x101def7c8
0x1002e38a1: mov rdi, r12
0x1002e38a4: mov rsi, rax
0x1002e38a7: mov rdx, r13
0x1002e38aa: vzeroupper 
0x1002e38ad: call 0x100314920 ; 0x100314920
0x1002e38b2: lea rsi, [rip + 0x89c1b3] ; 0x100b7fa6c cannonSpark
0x1002e38b9: mov edx, 0x40
0x1002e38be: mov rdi, r13
0x1002e38c1: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e38c6: movsx edi, byte ptr [rbp - 0x70]
0x1002e38ca: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e38cf: mov byte ptr [rbp - 0x70], al
0x1002e38d2: mov rdx, qword ptr [rip + 0x1b0bd8f] ; 0x101def668
0x1002e38d9: mov esi, 0x120
0x1002e38de: mov ecx, 0x10
0x1002e38e3: mov rdi, r15
0x1002e38e6: call 0x100795530 ; 0x100795530
0x1002e38eb: vmovaps xmm0, xmmword ptr [rip + 0x7c956d] ; 0x100aace60
0x1002e38f3: vmovups xmmword ptr [rax], xmm0
0x1002e38f7: mov word ptr [rax + 0x10], 0x100
0x1002e38fd: mov byte ptr [rax + 0x12], 0
0x1002e3901: mov qword ptr [rax + 0x14], 0
0x1002e3909: vxorps xmm0, xmm0, xmm0
0x1002e390d: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e3912: mov dword ptr [rax + 0x28], 0
0x1002e3919: vmovaps xmm0, xmmword ptr [rip + 0x7d5d8f] ; 0x100ab96b0
0x1002e3921: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e3926: mov byte ptr [rax + 0x40], 0
0x1002e392a: vxorps ymm0, ymm0, ymm0
0x1002e392e: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e3936: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e393b: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e3940: mov qword ptr [rax + 0xa4], r14
0x1002e3947: vmovaps xmm0, xmmword ptr [rbx]
0x1002e394b: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e3953: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e395b: vxorps xmm0, xmm0, xmm0
0x1002e395f: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e3967: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e3971: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e3979: movabs rcx, 0x3f80000000000000
0x1002e3983: mov qword ptr [rax + 0xf4], rcx
0x1002e398a: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e3992: mov qword ptr [rax + 0x10c], rcx
0x1002e3999: mov byte ptr [rax + 0x114], 1
0x1002e39a0: mov qword ptr [rax + 0x118], 0
0x1002e39ab: mov qword ptr [rip + 0x1b0be1e], rax ; 0x101def7d0
0x1002e39b2: mov rdi, r12
0x1002e39b5: mov rsi, rax
0x1002e39b8: mov rdx, r13
0x1002e39bb: vzeroupper 
0x1002e39be: call 0x100314920 ; 0x100314920
0x1002e39c3: lea rsi, [rip + 0x89c0ae] ; 0x100b7fa78 cannonSmoke
0x1002e39ca: mov edx, 0x40
0x1002e39cf: mov rdi, r13
0x1002e39d2: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e39d7: movsx edi, byte ptr [rbp - 0x70]
0x1002e39db: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e39e0: mov byte ptr [rbp - 0x70], al
0x1002e39e3: mov rdx, qword ptr [rip + 0x1b0bc7e] ; 0x101def668
0x1002e39ea: mov esi, 0x120
0x1002e39ef: mov ecx, 0x10
0x1002e39f4: mov rdi, r15
0x1002e39f7: call 0x100795530 ; 0x100795530
0x1002e39fc: vmovaps xmm0, xmmword ptr [rip + 0x7c945c] ; 0x100aace60
0x1002e3a04: vmovups xmmword ptr [rax], xmm0
0x1002e3a08: mov word ptr [rax + 0x10], 0x100
0x1002e3a0e: mov byte ptr [rax + 0x12], 0
0x1002e3a12: mov qword ptr [rax + 0x14], 0
0x1002e3a1a: vxorps xmm0, xmm0, xmm0
0x1002e3a1e: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e3a23: mov dword ptr [rax + 0x28], 0
0x1002e3a2a: vmovaps xmm0, xmmword ptr [rip + 0x7d5c7e] ; 0x100ab96b0
0x1002e3a32: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e3a37: mov byte ptr [rax + 0x40], 0
0x1002e3a3b: vxorps ymm0, ymm0, ymm0
0x1002e3a3f: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e3a47: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e3a4c: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e3a51: mov qword ptr [rax + 0xa4], r14
0x1002e3a58: vmovaps xmm0, xmmword ptr [rbx]
0x1002e3a5c: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e3a64: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e3a6c: vxorps xmm0, xmm0, xmm0
0x1002e3a70: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e3a78: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e3a82: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e3a8a: movabs rcx, 0x3f80000000000000
0x1002e3a94: mov qword ptr [rax + 0xf4], rcx
0x1002e3a9b: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e3aa3: mov qword ptr [rax + 0x10c], rcx
0x1002e3aaa: mov byte ptr [rax + 0x114], 1
0x1002e3ab1: mov qword ptr [rax + 0x118], 0
0x1002e3abc: mov qword ptr [rip + 0x1b0bd15], rax ; 0x101def7d8
0x1002e3ac3: mov rdi, r12
0x1002e3ac6: mov rsi, rax
0x1002e3ac9: mov rdx, r13
0x1002e3acc: vzeroupper 
0x1002e3acf: call 0x100314920 ; 0x100314920
0x1002e3ad4: lea rsi, [rip + 0x89bfa9] ; 0x100b7fa84 smoke
0x1002e3adb: mov edx, 0x40
0x1002e3ae0: mov rdi, r13
0x1002e3ae3: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e3ae8: movsx edi, byte ptr [rbp - 0x70]
0x1002e3aec: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e3af1: mov byte ptr [rbp - 0x70], al
0x1002e3af4: mov rdx, qword ptr [rip + 0x1b0bb6d] ; 0x101def668
0x1002e3afb: mov esi, 0x120
0x1002e3b00: mov ecx, 0x10
0x1002e3b05: mov rdi, r15
0x1002e3b08: call 0x100795530 ; 0x100795530
0x1002e3b0d: vmovaps xmm0, xmmword ptr [rip + 0x7c934b] ; 0x100aace60
0x1002e3b15: vmovups xmmword ptr [rax], xmm0
0x1002e3b19: mov word ptr [rax + 0x10], 0x100
0x1002e3b1f: mov byte ptr [rax + 0x12], 0
0x1002e3b23: mov qword ptr [rax + 0x14], 0
0x1002e3b2b: vxorps xmm0, xmm0, xmm0
0x1002e3b2f: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e3b34: mov dword ptr [rax + 0x28], 0
0x1002e3b3b: vmovaps xmm0, xmmword ptr [rip + 0x7d5b6d] ; 0x100ab96b0
0x1002e3b43: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e3b48: mov byte ptr [rax + 0x40], 0
0x1002e3b4c: vxorps ymm0, ymm0, ymm0
0x1002e3b50: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e3b58: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e3b5d: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e3b62: mov qword ptr [rax + 0xa4], r14
0x1002e3b69: vmovaps xmm0, xmmword ptr [rbx]
0x1002e3b6d: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e3b75: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e3b7d: vxorps xmm0, xmm0, xmm0
0x1002e3b81: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e3b89: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e3b93: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e3b9b: movabs rcx, 0x3f80000000000000
0x1002e3ba5: mov qword ptr [rax + 0xf4], rcx
0x1002e3bac: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e3bb4: mov qword ptr [rax + 0x10c], rcx
0x1002e3bbb: mov byte ptr [rax + 0x114], 1
0x1002e3bc2: mov qword ptr [rax + 0x118], 0
0x1002e3bcd: mov qword ptr [rip + 0x1b0bc0c], rax ; 0x101def7e0
0x1002e3bd4: mov rdi, r12
0x1002e3bd7: mov rsi, rax
0x1002e3bda: mov rdx, r13
0x1002e3bdd: vzeroupper 
0x1002e3be0: call 0x100314920 ; 0x100314920
0x1002e3be5: lea rsi, [rip + 0x89be9e] ; 0x100b7fa8a smokeWall
0x1002e3bec: mov edx, 0x40
0x1002e3bf1: mov rdi, r13
0x1002e3bf4: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e3bf9: movsx edi, byte ptr [rbp - 0x70]
0x1002e3bfd: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e3c02: mov byte ptr [rbp - 0x70], al
0x1002e3c05: mov rdx, qword ptr [rip + 0x1b0ba5c] ; 0x101def668
0x1002e3c0c: mov esi, 0x120
0x1002e3c11: mov ecx, 0x10
0x1002e3c16: mov rdi, r15
0x1002e3c19: call 0x100795530 ; 0x100795530
0x1002e3c1e: vmovaps xmm0, xmmword ptr [rip + 0x7c923a] ; 0x100aace60
0x1002e3c26: vmovups xmmword ptr [rax], xmm0
0x1002e3c2a: mov word ptr [rax + 0x10], 0x100
0x1002e3c30: mov byte ptr [rax + 0x12], 0
0x1002e3c34: mov qword ptr [rax + 0x14], 0
0x1002e3c3c: vxorps xmm0, xmm0, xmm0
0x1002e3c40: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e3c45: mov dword ptr [rax + 0x28], 0
0x1002e3c4c: vmovaps xmm0, xmmword ptr [rip + 0x7d5a5c] ; 0x100ab96b0
0x1002e3c54: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e3c59: mov byte ptr [rax + 0x40], 0
0x1002e3c5d: vxorps ymm0, ymm0, ymm0
0x1002e3c61: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e3c69: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e3c6e: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e3c73: mov qword ptr [rax + 0xa4], r14
0x1002e3c7a: vmovaps xmm0, xmmword ptr [rbx]
0x1002e3c7e: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e3c86: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e3c8e: vxorps xmm0, xmm0, xmm0
0x1002e3c92: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e3c9a: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e3ca4: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e3cac: movabs rcx, 0x3f80000000000000
0x1002e3cb6: mov qword ptr [rax + 0xf4], rcx
0x1002e3cbd: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e3cc5: mov qword ptr [rax + 0x10c], rcx
0x1002e3ccc: mov byte ptr [rax + 0x114], 1
0x1002e3cd3: mov qword ptr [rax + 0x118], 0
0x1002e3cde: mov qword ptr [rip + 0x1b0bb03], rax ; 0x101def7e8
0x1002e3ce5: mov rdi, r12
0x1002e3ce8: mov rsi, rax
0x1002e3ceb: mov rdx, r13
0x1002e3cee: vzeroupper 
0x1002e3cf1: call 0x100314920 ; 0x100314920
0x1002e3cf6: lea rsi, [rip + 0x89bd97] ; 0x100b7fa94 dirt
0x1002e3cfd: mov edx, 0x40
0x1002e3d02: mov rdi, r13
0x1002e3d05: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e3d0a: movsx edi, byte ptr [rbp - 0x70]
0x1002e3d0e: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e3d13: mov byte ptr [rbp - 0x70], al
0x1002e3d16: mov rdx, qword ptr [rip + 0x1b0b94b] ; 0x101def668
0x1002e3d1d: mov esi, 0x120
0x1002e3d22: mov ecx, 0x10
0x1002e3d27: mov rdi, r15
0x1002e3d2a: call 0x100795530 ; 0x100795530
0x1002e3d2f: vmovaps xmm0, xmmword ptr [rip + 0x7c9129] ; 0x100aace60
0x1002e3d37: vmovups xmmword ptr [rax], xmm0
0x1002e3d3b: mov word ptr [rax + 0x10], 0x100
0x1002e3d41: mov byte ptr [rax + 0x12], 0
0x1002e3d45: mov qword ptr [rax + 0x14], 0
0x1002e3d4d: vxorps xmm0, xmm0, xmm0
0x1002e3d51: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e3d56: mov dword ptr [rax + 0x28], 0
0x1002e3d5d: vmovaps xmm0, xmmword ptr [rip + 0x7d594b] ; 0x100ab96b0
0x1002e3d65: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e3d6a: mov byte ptr [rax + 0x40], 0
0x1002e3d6e: vxorps ymm0, ymm0, ymm0
0x1002e3d72: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e3d7a: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e3d7f: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e3d84: mov qword ptr [rax + 0xa4], r14
0x1002e3d8b: vmovaps xmm0, xmmword ptr [rbx]
0x1002e3d8f: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e3d97: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e3d9f: vxorps xmm0, xmm0, xmm0
0x1002e3da3: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e3dab: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e3db5: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e3dbd: movabs rcx, 0x3f80000000000000
0x1002e3dc7: mov qword ptr [rax + 0xf4], rcx
0x1002e3dce: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e3dd6: mov qword ptr [rax + 0x10c], rcx
0x1002e3ddd: mov byte ptr [rax + 0x114], 1
0x1002e3de4: mov qword ptr [rax + 0x118], 0
0x1002e3def: mov qword ptr [rip + 0x1b0b9fa], rax ; 0x101def7f0
0x1002e3df6: mov rdi, r12
0x1002e3df9: mov rsi, rax
0x1002e3dfc: mov rdx, r13
0x1002e3dff: vzeroupper 
0x1002e3e02: call 0x100314920 ; 0x100314920
0x1002e3e07: lea rsi, [rip + 0x89bc8b] ; 0x100b7fa99 cloudParticle
0x1002e3e0e: mov edx, 0x40
0x1002e3e13: mov rdi, r13
0x1002e3e16: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e3e1b: movsx edi, byte ptr [rbp - 0x70]
0x1002e3e1f: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e3e24: mov byte ptr [rbp - 0x70], al
0x1002e3e27: mov rdx, qword ptr [rip + 0x1b0b83a] ; 0x101def668
0x1002e3e2e: mov esi, 0x120
0x1002e3e33: mov ecx, 0x10
0x1002e3e38: mov rdi, r15
0x1002e3e3b: call 0x100795530 ; 0x100795530
0x1002e3e40: vmovaps xmm0, xmmword ptr [rip + 0x7c9018] ; 0x100aace60
0x1002e3e48: vmovups xmmword ptr [rax], xmm0
0x1002e3e4c: mov word ptr [rax + 0x10], 0x100
0x1002e3e52: mov byte ptr [rax + 0x12], 0
0x1002e3e56: mov qword ptr [rax + 0x14], 0
0x1002e3e5e: vxorps xmm0, xmm0, xmm0
0x1002e3e62: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e3e67: mov dword ptr [rax + 0x28], 0
0x1002e3e6e: vmovaps xmm0, xmmword ptr [rip + 0x7d583a] ; 0x100ab96b0
0x1002e3e76: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e3e7b: mov byte ptr [rax + 0x40], 0
0x1002e3e7f: vxorps ymm0, ymm0, ymm0
0x1002e3e83: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e3e8b: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e3e90: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e3e95: mov qword ptr [rax + 0xa4], r14
0x1002e3e9c: vmovaps xmm0, xmmword ptr [rbx]
0x1002e3ea0: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e3ea8: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e3eb0: vxorps xmm0, xmm0, xmm0
0x1002e3eb4: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e3ebc: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e3ec6: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e3ece: movabs rcx, 0x3f80000000000000
0x1002e3ed8: mov qword ptr [rax + 0xf4], rcx
0x1002e3edf: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e3ee7: mov qword ptr [rax + 0x10c], rcx
0x1002e3eee: mov byte ptr [rax + 0x114], 1
0x1002e3ef5: mov qword ptr [rax + 0x118], 0
0x1002e3f00: mov qword ptr [rip + 0x1b0b8f1], rax ; 0x101def7f8
0x1002e3f07: mov rdi, r12
0x1002e3f0a: mov rsi, rax
0x1002e3f0d: mov rdx, r13
0x1002e3f10: vzeroupper 
0x1002e3f13: call 0x100314920 ; 0x100314920
0x1002e3f18: lea rsi, [rip + 0x89bb88] ; 0x100b7faa7 darkCreatureEye
0x1002e3f1f: mov edx, 0x40
0x1002e3f24: mov rdi, r13
0x1002e3f27: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e3f2c: movsx edi, byte ptr [rbp - 0x70]
0x1002e3f30: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e3f35: mov byte ptr [rbp - 0x70], al
0x1002e3f38: mov rdx, qword ptr [rip + 0x1b0b729] ; 0x101def668
0x1002e3f3f: mov esi, 0x120
0x1002e3f44: mov ecx, 0x10
0x1002e3f49: mov rdi, r15
0x1002e3f4c: call 0x100795530 ; 0x100795530
0x1002e3f51: vmovaps xmm0, xmmword ptr [rip + 0x7c8f07] ; 0x100aace60
0x1002e3f59: vmovups xmmword ptr [rax], xmm0
0x1002e3f5d: mov word ptr [rax + 0x10], 0x100
0x1002e3f63: mov byte ptr [rax + 0x12], 0
0x1002e3f67: mov qword ptr [rax + 0x14], 0
0x1002e3f6f: vxorps xmm0, xmm0, xmm0
0x1002e3f73: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e3f78: mov dword ptr [rax + 0x28], 0
0x1002e3f7f: vmovaps xmm0, xmmword ptr [rip + 0x7d5729] ; 0x100ab96b0
0x1002e3f87: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e3f8c: mov byte ptr [rax + 0x40], 0
0x1002e3f90: vxorps ymm0, ymm0, ymm0
0x1002e3f94: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e3f9c: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e3fa1: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e3fa6: mov qword ptr [rax + 0xa4], r14
0x1002e3fad: vmovaps xmm0, xmmword ptr [rbx]
0x1002e3fb1: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e3fb9: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e3fc1: vxorps xmm0, xmm0, xmm0
0x1002e3fc5: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e3fcd: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e3fd7: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e3fdf: movabs rcx, 0x3f80000000000000
0x1002e3fe9: mov qword ptr [rax + 0xf4], rcx
0x1002e3ff0: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e3ff8: mov qword ptr [rax + 0x10c], rcx
0x1002e3fff: mov byte ptr [rax + 0x114], 1
0x1002e4006: mov qword ptr [rax + 0x118], 0
0x1002e4011: mov qword ptr [rip + 0x1b0b7e8], rax ; 0x101def800
0x1002e4018: mov rdi, r12
0x1002e401b: mov rsi, rax
0x1002e401e: mov rdx, r13
0x1002e4021: vzeroupper 
0x1002e4024: call 0x100314920 ; 0x100314920
0x1002e4029: lea rsi, [rip + 0x89ba87] ; 0x100b7fab7 darkCreatureTrail
0x1002e4030: mov edx, 0x40
0x1002e4035: mov rdi, r13
0x1002e4038: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e403d: movsx edi, byte ptr [rbp - 0x70]
0x1002e4041: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e4046: mov byte ptr [rbp - 0x70], al
0x1002e4049: mov rdx, qword ptr [rip + 0x1b0b618] ; 0x101def668
0x1002e4050: mov esi, 0x120
0x1002e4055: mov ecx, 0x10
0x1002e405a: mov rdi, r15
0x1002e405d: call 0x100795530 ; 0x100795530
0x1002e4062: vmovaps xmm0, xmmword ptr [rip + 0x7c8df6] ; 0x100aace60
0x1002e406a: vmovups xmmword ptr [rax], xmm0
0x1002e406e: mov word ptr [rax + 0x10], 0x100
0x1002e4074: mov byte ptr [rax + 0x12], 0
0x1002e4078: mov qword ptr [rax + 0x14], 0
0x1002e4080: vxorps xmm0, xmm0, xmm0
0x1002e4084: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e4089: mov dword ptr [rax + 0x28], 0
0x1002e4090: vmovaps xmm0, xmmword ptr [rip + 0x7d5618] ; 0x100ab96b0
0x1002e4098: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e409d: mov byte ptr [rax + 0x40], 0
0x1002e40a1: vxorps ymm0, ymm0, ymm0
0x1002e40a5: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e40ad: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e40b2: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e40b7: mov qword ptr [rax + 0xa4], r14
0x1002e40be: vmovaps xmm0, xmmword ptr [rbx]
0x1002e40c2: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e40ca: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e40d2: vxorps xmm0, xmm0, xmm0
0x1002e40d6: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e40de: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e40e8: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e40f0: movabs rcx, 0x3f80000000000000
0x1002e40fa: mov qword ptr [rax + 0xf4], rcx
0x1002e4101: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e4109: mov qword ptr [rax + 0x10c], rcx
0x1002e4110: mov byte ptr [rax + 0x114], 1
0x1002e4117: mov qword ptr [rax + 0x118], 0
0x1002e4122: mov qword ptr [rip + 0x1b0b6df], rax ; 0x101def808
0x1002e4129: mov rdi, r12
0x1002e412c: mov rsi, rax
0x1002e412f: mov rdx, r13
0x1002e4132: vzeroupper 
0x1002e4135: call 0x100314920 ; 0x100314920
0x1002e413a: lea rsi, [rip + 0x89b988] ; 0x100b7fac9 mantaTrail
0x1002e4141: mov edx, 0x40
0x1002e4146: mov rdi, r13
0x1002e4149: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e414e: movsx edi, byte ptr [rbp - 0x70]
0x1002e4152: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e4157: mov byte ptr [rbp - 0x70], al
0x1002e415a: mov rdx, qword ptr [rip + 0x1b0b507] ; 0x101def668
0x1002e4161: mov esi, 0x120
0x1002e4166: mov ecx, 0x10
0x1002e416b: mov rdi, r15
0x1002e416e: call 0x100795530 ; 0x100795530
0x1002e4173: vmovaps xmm0, xmmword ptr [rip + 0x7c8ce5] ; 0x100aace60
0x1002e417b: vmovups xmmword ptr [rax], xmm0
0x1002e417f: mov word ptr [rax + 0x10], 0x100
0x1002e4185: mov byte ptr [rax + 0x12], 0
0x1002e4189: mov qword ptr [rax + 0x14], 0
0x1002e4191: vxorps xmm0, xmm0, xmm0
0x1002e4195: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e419a: mov dword ptr [rax + 0x28], 0
0x1002e41a1: vmovaps xmm0, xmmword ptr [rip + 0x7d5507] ; 0x100ab96b0
0x1002e41a9: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e41ae: mov byte ptr [rax + 0x40], 0
0x1002e41b2: vxorps ymm0, ymm0, ymm0
0x1002e41b6: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e41be: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e41c3: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e41c8: mov qword ptr [rax + 0xa4], r14
0x1002e41cf: vmovaps xmm0, xmmword ptr [rbx]
0x1002e41d3: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e41db: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e41e3: vxorps xmm0, xmm0, xmm0
0x1002e41e7: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e41ef: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e41f9: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e4201: movabs rcx, 0x3f80000000000000
0x1002e420b: mov qword ptr [rax + 0xf4], rcx
0x1002e4212: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e421a: mov qword ptr [rax + 0x10c], rcx
0x1002e4221: mov byte ptr [rax + 0x114], 1
0x1002e4228: mov qword ptr [rax + 0x118], 0
0x1002e4233: mov qword ptr [rip + 0x1b0b5d6], rax ; 0x101def810
0x1002e423a: mov rdi, r12
0x1002e423d: mov rsi, rax
0x1002e4240: mov rdx, r13
0x1002e4243: vzeroupper 
0x1002e4246: call 0x100314920 ; 0x100314920
0x1002e424b: lea rsi, [rip + 0x89b882] ; 0x100b7fad4 mantaWingTrail
0x1002e4252: mov edx, 0x40
0x1002e4257: mov rdi, r13
0x1002e425a: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e425f: movsx edi, byte ptr [rbp - 0x70]
0x1002e4263: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e4268: mov byte ptr [rbp - 0x70], al
0x1002e426b: mov rdx, qword ptr [rip + 0x1b0b3f6] ; 0x101def668
0x1002e4272: mov esi, 0x120
0x1002e4277: mov ecx, 0x10
0x1002e427c: mov rdi, r15
0x1002e427f: call 0x100795530 ; 0x100795530
0x1002e4284: vmovaps xmm0, xmmword ptr [rip + 0x7c8bd4] ; 0x100aace60
0x1002e428c: vmovups xmmword ptr [rax], xmm0
0x1002e4290: mov word ptr [rax + 0x10], 0x100
0x1002e4296: mov byte ptr [rax + 0x12], 0
0x1002e429a: mov qword ptr [rax + 0x14], 0
0x1002e42a2: vxorps xmm0, xmm0, xmm0
0x1002e42a6: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e42ab: mov dword ptr [rax + 0x28], 0
0x1002e42b2: vmovaps xmm0, xmmword ptr [rip + 0x7d53f6] ; 0x100ab96b0
0x1002e42ba: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e42bf: mov byte ptr [rax + 0x40], 0
0x1002e42c3: vxorps ymm0, ymm0, ymm0
0x1002e42c7: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e42cf: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e42d4: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e42d9: mov qword ptr [rax + 0xa4], r14
0x1002e42e0: vmovaps xmm0, xmmword ptr [rbx]
0x1002e42e4: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e42ec: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e42f4: vxorps xmm0, xmm0, xmm0
0x1002e42f8: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e4300: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e430a: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e4312: movabs rcx, 0x3f80000000000000
0x1002e431c: mov qword ptr [rax + 0xf4], rcx
0x1002e4323: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e432b: mov qword ptr [rax + 0x10c], rcx
0x1002e4332: mov byte ptr [rax + 0x114], 1
0x1002e4339: mov qword ptr [rax + 0x118], 0
0x1002e4344: mov qword ptr [rip + 0x1b0b4cd], rax ; 0x101def818
0x1002e434b: mov rdi, r12
0x1002e434e: mov rsi, rax
0x1002e4351: mov rdx, r13
0x1002e4354: vzeroupper 
0x1002e4357: call 0x100314920 ; 0x100314920
0x1002e435c: lea rsi, [rip + 0x89b780] ; 0x100b7fae3 firework
0x1002e4363: mov edx, 0x40
0x1002e4368: mov rdi, r13
0x1002e436b: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e4370: movsx edi, byte ptr [rbp - 0x70]
0x1002e4374: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e4379: mov byte ptr [rbp - 0x70], al
0x1002e437c: mov rdx, qword ptr [rip + 0x1b0b2e5] ; 0x101def668
0x1002e4383: mov esi, 0x120
0x1002e4388: mov ecx, 0x10
0x1002e438d: mov rdi, r15
0x1002e4390: call 0x100795530 ; 0x100795530
0x1002e4395: vmovaps xmm0, xmmword ptr [rip + 0x7c8ac3] ; 0x100aace60
0x1002e439d: vmovups xmmword ptr [rax], xmm0
0x1002e43a1: mov word ptr [rax + 0x10], 0x100
0x1002e43a7: mov byte ptr [rax + 0x12], 0
0x1002e43ab: mov qword ptr [rax + 0x14], 0
0x1002e43b3: vxorps xmm0, xmm0, xmm0
0x1002e43b7: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e43bc: mov dword ptr [rax + 0x28], 0
0x1002e43c3: vmovaps xmm0, xmmword ptr [rip + 0x7d52e5] ; 0x100ab96b0
0x1002e43cb: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e43d0: mov byte ptr [rax + 0x40], 0
0x1002e43d4: vxorps ymm0, ymm0, ymm0
0x1002e43d8: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e43e0: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e43e5: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e43ea: mov qword ptr [rax + 0xa4], r14
0x1002e43f1: vmovaps xmm0, xmmword ptr [rbx]
0x1002e43f5: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e43fd: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e4405: vxorps xmm0, xmm0, xmm0
0x1002e4409: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e4411: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e441b: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e4423: movabs rcx, 0x3f80000000000000
0x1002e442d: mov qword ptr [rax + 0xf4], rcx
0x1002e4434: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e443c: mov qword ptr [rax + 0x10c], rcx
0x1002e4443: mov byte ptr [rax + 0x114], 1
0x1002e444a: mov qword ptr [rax + 0x118], 0
0x1002e4455: mov qword ptr [rip + 0x1b0b3c4], rax ; 0x101def820
0x1002e445c: mov rdi, r12
0x1002e445f: mov rsi, rax
0x1002e4462: mov rdx, r13
0x1002e4465: vzeroupper 
0x1002e4468: call 0x100314920 ; 0x100314920
0x1002e446d: lea rsi, [rip + 0x89b678] ; 0x100b7faec fireworkRing
0x1002e4474: mov edx, 0x40
0x1002e4479: mov rdi, r13
0x1002e447c: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e4481: movsx edi, byte ptr [rbp - 0x70]
0x1002e4485: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e448a: mov byte ptr [rbp - 0x70], al
0x1002e448d: mov rdx, qword ptr [rip + 0x1b0b1d4] ; 0x101def668
0x1002e4494: mov esi, 0x120
0x1002e4499: mov ecx, 0x10
0x1002e449e: mov rdi, r15
0x1002e44a1: call 0x100795530 ; 0x100795530
0x1002e44a6: vmovaps xmm0, xmmword ptr [rip + 0x7c89b2] ; 0x100aace60
0x1002e44ae: vmovups xmmword ptr [rax], xmm0
0x1002e44b2: mov word ptr [rax + 0x10], 0x100
0x1002e44b8: mov byte ptr [rax + 0x12], 0
0x1002e44bc: mov qword ptr [rax + 0x14], 0
0x1002e44c4: vxorps xmm0, xmm0, xmm0
0x1002e44c8: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e44cd: mov dword ptr [rax + 0x28], 0
0x1002e44d4: vmovaps xmm0, xmmword ptr [rip + 0x7d51d4] ; 0x100ab96b0
0x1002e44dc: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e44e1: mov byte ptr [rax + 0x40], 0
0x1002e44e5: vxorps ymm0, ymm0, ymm0
0x1002e44e9: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e44f1: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e44f6: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e44fb: mov qword ptr [rax + 0xa4], r14
0x1002e4502: vmovaps xmm0, xmmword ptr [rbx]
0x1002e4506: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e450e: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e4516: vxorps xmm0, xmm0, xmm0
0x1002e451a: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e4522: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e452c: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e4534: movabs rcx, 0x3f80000000000000
0x1002e453e: mov qword ptr [rax + 0xf4], rcx
0x1002e4545: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e454d: mov qword ptr [rax + 0x10c], rcx
0x1002e4554: mov byte ptr [rax + 0x114], 1
0x1002e455b: mov qword ptr [rax + 0x118], 0
0x1002e4566: mov qword ptr [rip + 0x1b0b2bb], rax ; 0x101def828
0x1002e456d: mov rdi, r12
0x1002e4570: mov rsi, rax
0x1002e4573: mov rdx, r13
0x1002e4576: vzeroupper 
0x1002e4579: call 0x100314920 ; 0x100314920
0x1002e457e: lea rsi, [rip + 0x89b574] ; 0x100b7faf9 fireworkTrail
0x1002e4585: mov edx, 0x40
0x1002e458a: mov rdi, r13
0x1002e458d: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e4592: movsx edi, byte ptr [rbp - 0x70]
0x1002e4596: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e459b: mov byte ptr [rbp - 0x70], al
0x1002e459e: mov rdx, qword ptr [rip + 0x1b0b0c3] ; 0x101def668
0x1002e45a5: mov esi, 0x120
0x1002e45aa: mov ecx, 0x10
0x1002e45af: mov rdi, r15
0x1002e45b2: call 0x100795530 ; 0x100795530
0x1002e45b7: vmovaps xmm0, xmmword ptr [rip + 0x7c88a1] ; 0x100aace60
0x1002e45bf: vmovups xmmword ptr [rax], xmm0
0x1002e45c3: mov word ptr [rax + 0x10], 0x100
0x1002e45c9: mov byte ptr [rax + 0x12], 0
0x1002e45cd: mov qword ptr [rax + 0x14], 0
0x1002e45d5: vxorps xmm0, xmm0, xmm0
0x1002e45d9: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e45de: mov dword ptr [rax + 0x28], 0
0x1002e45e5: vmovaps xmm0, xmmword ptr [rip + 0x7d50c3] ; 0x100ab96b0
0x1002e45ed: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e45f2: mov byte ptr [rax + 0x40], 0
0x1002e45f6: vxorps ymm0, ymm0, ymm0
0x1002e45fa: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e4602: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e4607: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e460c: mov qword ptr [rax + 0xa4], r14
0x1002e4613: vmovaps xmm0, xmmword ptr [rbx]
0x1002e4617: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e461f: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e4627: vxorps xmm0, xmm0, xmm0
0x1002e462b: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e4633: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e463d: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e4645: movabs rcx, 0x3f80000000000000
0x1002e464f: mov qword ptr [rax + 0xf4], rcx
0x1002e4656: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e465e: mov qword ptr [rax + 0x10c], rcx
0x1002e4665: mov byte ptr [rax + 0x114], 1
0x1002e466c: mov qword ptr [rax + 0x118], 0
0x1002e4677: mov qword ptr [rip + 0x1b0b1b2], rax ; 0x101def830
0x1002e467e: mov rdi, r12
0x1002e4681: mov rsi, rax
0x1002e4684: mov rdx, r13
0x1002e4687: vzeroupper 
0x1002e468a: call 0x100314920 ; 0x100314920
0x1002e468f: lea rsi, [rip + 0x89b471] ; 0x100b7fb07 fireworkSpark
0x1002e4696: mov edx, 0x40
0x1002e469b: mov rdi, r13
0x1002e469e: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e46a3: movsx edi, byte ptr [rbp - 0x70]
0x1002e46a7: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e46ac: mov byte ptr [rbp - 0x70], al
0x1002e46af: mov rdx, qword ptr [rip + 0x1b0afb2] ; 0x101def668
0x1002e46b6: mov esi, 0x120
0x1002e46bb: mov ecx, 0x10
0x1002e46c0: mov rdi, r15
0x1002e46c3: call 0x100795530 ; 0x100795530
0x1002e46c8: vmovaps xmm0, xmmword ptr [rip + 0x7c8790] ; 0x100aace60
0x1002e46d0: vmovups xmmword ptr [rax], xmm0
0x1002e46d4: mov word ptr [rax + 0x10], 0x100
0x1002e46da: mov byte ptr [rax + 0x12], 0
0x1002e46de: mov qword ptr [rax + 0x14], 0
0x1002e46e6: vxorps xmm0, xmm0, xmm0
0x1002e46ea: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e46ef: mov dword ptr [rax + 0x28], 0
0x1002e46f6: vmovaps xmm0, xmmword ptr [rip + 0x7d4fb2] ; 0x100ab96b0
0x1002e46fe: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e4703: mov byte ptr [rax + 0x40], 0
0x1002e4707: vxorps ymm0, ymm0, ymm0
0x1002e470b: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e4713: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e4718: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e471d: mov qword ptr [rax + 0xa4], r14
0x1002e4724: vmovaps xmm0, xmmword ptr [rbx]
0x1002e4728: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e4730: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e4738: vxorps xmm0, xmm0, xmm0
0x1002e473c: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e4744: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e474e: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e4756: movabs rcx, 0x3f80000000000000
0x1002e4760: mov qword ptr [rax + 0xf4], rcx
0x1002e4767: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e476f: mov qword ptr [rax + 0x10c], rcx
0x1002e4776: mov byte ptr [rax + 0x114], 1
0x1002e477d: mov qword ptr [rax + 0x118], 0
0x1002e4788: mov qword ptr [rip + 0x1b0b0a9], rax ; 0x101def838
0x1002e478f: mov rdi, r12
0x1002e4792: mov rsi, rax
0x1002e4795: mov rdx, r13
0x1002e4798: vzeroupper 
0x1002e479b: call 0x100314920 ; 0x100314920
0x1002e47a0: lea rsi, [rip + 0x89b36e] ; 0x100b7fb15 fireworkSmall
0x1002e47a7: mov edx, 0x40
0x1002e47ac: mov rdi, r13
0x1002e47af: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e47b4: movsx edi, byte ptr [rbp - 0x70]
0x1002e47b8: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e47bd: mov byte ptr [rbp - 0x70], al
0x1002e47c0: mov rdx, qword ptr [rip + 0x1b0aea1] ; 0x101def668
0x1002e47c7: mov esi, 0x120
0x1002e47cc: mov ecx, 0x10
0x1002e47d1: mov rdi, r15
0x1002e47d4: call 0x100795530 ; 0x100795530
0x1002e47d9: vmovaps xmm0, xmmword ptr [rip + 0x7c867f] ; 0x100aace60
0x1002e47e1: vmovups xmmword ptr [rax], xmm0
0x1002e47e5: mov word ptr [rax + 0x10], 0x100
0x1002e47eb: mov byte ptr [rax + 0x12], 0
0x1002e47ef: mov qword ptr [rax + 0x14], 0
0x1002e47f7: vxorps xmm0, xmm0, xmm0
0x1002e47fb: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e4800: mov dword ptr [rax + 0x28], 0
0x1002e4807: vmovaps xmm0, xmmword ptr [rip + 0x7d4ea1] ; 0x100ab96b0
0x1002e480f: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e4814: mov byte ptr [rax + 0x40], 0
0x1002e4818: vxorps ymm0, ymm0, ymm0
0x1002e481c: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e4824: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e4829: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e482e: mov qword ptr [rax + 0xa4], r14
0x1002e4835: vmovaps xmm0, xmmword ptr [rbx]
0x1002e4839: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e4841: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e4849: vxorps xmm0, xmm0, xmm0
0x1002e484d: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e4855: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e485f: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e4867: movabs rcx, 0x3f80000000000000
0x1002e4871: mov qword ptr [rax + 0xf4], rcx
0x1002e4878: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e4880: mov qword ptr [rax + 0x10c], rcx
0x1002e4887: mov byte ptr [rax + 0x114], 1
0x1002e488e: mov qword ptr [rax + 0x118], 0
0x1002e4899: mov qword ptr [rip + 0x1b0afa0], rax ; 0x101def840
0x1002e48a0: mov rdi, r12
0x1002e48a3: mov rsi, rax
0x1002e48a6: mov rdx, r13
0x1002e48a9: vzeroupper 
0x1002e48ac: call 0x100314920 ; 0x100314920
0x1002e48b1: lea rsi, [rip + 0x89b26b] ; 0x100b7fb23 fireworkTrail2
0x1002e48b8: mov edx, 0x40
0x1002e48bd: mov rdi, r13
0x1002e48c0: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e48c5: movsx edi, byte ptr [rbp - 0x70]
0x1002e48c9: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e48ce: mov byte ptr [rbp - 0x70], al
0x1002e48d1: mov rdx, qword ptr [rip + 0x1b0ad90] ; 0x101def668
0x1002e48d8: mov esi, 0x120
0x1002e48dd: mov ecx, 0x10
0x1002e48e2: mov rdi, r15
0x1002e48e5: call 0x100795530 ; 0x100795530
0x1002e48ea: vmovaps xmm0, xmmword ptr [rip + 0x7c856e] ; 0x100aace60
0x1002e48f2: vmovups xmmword ptr [rax], xmm0
0x1002e48f6: mov word ptr [rax + 0x10], 0x100
0x1002e48fc: mov byte ptr [rax + 0x12], 0
0x1002e4900: mov qword ptr [rax + 0x14], 0
0x1002e4908: vxorps xmm0, xmm0, xmm0
0x1002e490c: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e4911: mov dword ptr [rax + 0x28], 0
0x1002e4918: vmovaps xmm0, xmmword ptr [rip + 0x7d4d90] ; 0x100ab96b0
0x1002e4920: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e4925: mov byte ptr [rax + 0x40], 0
0x1002e4929: vxorps ymm0, ymm0, ymm0
0x1002e492d: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e4935: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e493a: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e493f: mov qword ptr [rax + 0xa4], r14
0x1002e4946: vmovaps xmm0, xmmword ptr [rbx]
0x1002e494a: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e4952: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e495a: vxorps xmm0, xmm0, xmm0
0x1002e495e: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e4966: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e4970: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e4978: movabs rcx, 0x3f80000000000000
0x1002e4982: mov qword ptr [rax + 0xf4], rcx
0x1002e4989: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e4991: mov qword ptr [rax + 0x10c], rcx
0x1002e4998: mov byte ptr [rax + 0x114], 1
0x1002e499f: mov qword ptr [rax + 0x118], 0
0x1002e49aa: mov qword ptr [rip + 0x1b0ae97], rax ; 0x101def848
0x1002e49b1: mov rdi, r12
0x1002e49b4: mov rsi, rax
0x1002e49b7: mov rdx, r13
0x1002e49ba: vzeroupper 
0x1002e49bd: call 0x100314920 ; 0x100314920
0x1002e49c2: lea rsi, [rip + 0x89b169] ; 0x100b7fb32 fireworkExplode
0x1002e49c9: mov edx, 0x40
0x1002e49ce: mov rdi, r13
0x1002e49d1: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e49d6: movsx edi, byte ptr [rbp - 0x70]
0x1002e49da: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e49df: mov byte ptr [rbp - 0x70], al
0x1002e49e2: mov rdx, qword ptr [rip + 0x1b0ac7f] ; 0x101def668
0x1002e49e9: mov esi, 0x120
0x1002e49ee: mov ecx, 0x10
0x1002e49f3: mov rdi, r15
0x1002e49f6: call 0x100795530 ; 0x100795530
0x1002e49fb: vmovaps xmm0, xmmword ptr [rip + 0x7c845d] ; 0x100aace60
0x1002e4a03: vmovups xmmword ptr [rax], xmm0
0x1002e4a07: mov word ptr [rax + 0x10], 0x100
0x1002e4a0d: mov byte ptr [rax + 0x12], 0
0x1002e4a11: mov qword ptr [rax + 0x14], 0
0x1002e4a19: vxorps xmm0, xmm0, xmm0
0x1002e4a1d: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e4a22: mov dword ptr [rax + 0x28], 0
0x1002e4a29: vmovaps xmm0, xmmword ptr [rip + 0x7d4c7f] ; 0x100ab96b0
0x1002e4a31: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e4a36: mov byte ptr [rax + 0x40], 0
0x1002e4a3a: vxorps ymm0, ymm0, ymm0
0x1002e4a3e: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e4a46: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e4a4b: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e4a50: mov qword ptr [rax + 0xa4], r14
0x1002e4a57: vmovaps xmm0, xmmword ptr [rbx]
0x1002e4a5b: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e4a63: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e4a6b: vxorps xmm0, xmm0, xmm0
0x1002e4a6f: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e4a77: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e4a81: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e4a89: movabs rcx, 0x3f80000000000000
0x1002e4a93: mov qword ptr [rax + 0xf4], rcx
0x1002e4a9a: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e4aa2: mov qword ptr [rax + 0x10c], rcx
0x1002e4aa9: mov byte ptr [rax + 0x114], 1
0x1002e4ab0: mov qword ptr [rax + 0x118], 0
0x1002e4abb: mov qword ptr [rip + 0x1b0ad8e], rax ; 0x101def850
0x1002e4ac2: mov rdi, r12
0x1002e4ac5: mov rsi, rax
0x1002e4ac8: mov rdx, r13
0x1002e4acb: vzeroupper 
0x1002e4ace: call 0x100314920 ; 0x100314920
0x1002e4ad3: lea rsi, [rip + 0x89b068] ; 0x100b7fb42 levelUp
0x1002e4ada: mov edx, 0x40
0x1002e4adf: mov rdi, r13
0x1002e4ae2: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e4ae7: movsx edi, byte ptr [rbp - 0x70]
0x1002e4aeb: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e4af0: mov byte ptr [rbp - 0x70], al
0x1002e4af3: mov rdx, qword ptr [rip + 0x1b0ab6e] ; 0x101def668
0x1002e4afa: mov esi, 0x120
0x1002e4aff: mov ecx, 0x10
0x1002e4b04: mov rdi, r15
0x1002e4b07: call 0x100795530 ; 0x100795530
0x1002e4b0c: vmovaps xmm0, xmmword ptr [rip + 0x7c834c] ; 0x100aace60
0x1002e4b14: vmovups xmmword ptr [rax], xmm0
0x1002e4b18: mov word ptr [rax + 0x10], 0x100
0x1002e4b1e: mov byte ptr [rax + 0x12], 0
0x1002e4b22: mov qword ptr [rax + 0x14], 0
0x1002e4b2a: vxorps xmm0, xmm0, xmm0
0x1002e4b2e: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e4b33: mov dword ptr [rax + 0x28], 0
0x1002e4b3a: vmovaps xmm0, xmmword ptr [rip + 0x7d4b6e] ; 0x100ab96b0
0x1002e4b42: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e4b47: mov byte ptr [rax + 0x40], 0
0x1002e4b4b: vxorps ymm0, ymm0, ymm0
0x1002e4b4f: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e4b57: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e4b5c: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e4b61: mov qword ptr [rax + 0xa4], r14
0x1002e4b68: vmovaps xmm0, xmmword ptr [rbx]
0x1002e4b6c: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e4b74: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e4b7c: vxorps xmm0, xmm0, xmm0
0x1002e4b80: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e4b88: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e4b92: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e4b9a: movabs rcx, 0x3f80000000000000
0x1002e4ba4: mov qword ptr [rax + 0xf4], rcx
0x1002e4bab: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e4bb3: mov qword ptr [rax + 0x10c], rcx
0x1002e4bba: mov byte ptr [rax + 0x114], 1
0x1002e4bc1: mov qword ptr [rax + 0x118], 0
0x1002e4bcc: mov qword ptr [rip + 0x1b0ac85], rax ; 0x101def858
0x1002e4bd3: mov rdi, r12
0x1002e4bd6: mov rsi, rax
0x1002e4bd9: mov rdx, r13
0x1002e4bdc: vzeroupper 
0x1002e4bdf: call 0x100314920 ; 0x100314920
0x1002e4be4: lea rsi, [rip + 0x89af5f] ; 0x100b7fb4a friendFavoriteAmbient
0x1002e4beb: mov edx, 0x40
0x1002e4bf0: mov rdi, r13
0x1002e4bf3: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e4bf8: movsx edi, byte ptr [rbp - 0x70]
0x1002e4bfc: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e4c01: mov byte ptr [rbp - 0x70], al
0x1002e4c04: mov rdx, qword ptr [rip + 0x1b0aa5d] ; 0x101def668
0x1002e4c0b: mov esi, 0x120
0x1002e4c10: mov ecx, 0x10
0x1002e4c15: mov rdi, r15
0x1002e4c18: call 0x100795530 ; 0x100795530
0x1002e4c1d: vmovaps xmm0, xmmword ptr [rip + 0x7c823b] ; 0x100aace60
0x1002e4c25: vmovups xmmword ptr [rax], xmm0
0x1002e4c29: mov word ptr [rax + 0x10], 0x100
0x1002e4c2f: mov byte ptr [rax + 0x12], 0
0x1002e4c33: mov qword ptr [rax + 0x14], 0
0x1002e4c3b: vxorps xmm0, xmm0, xmm0
0x1002e4c3f: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e4c44: mov dword ptr [rax + 0x28], 0
0x1002e4c4b: vmovaps xmm0, xmmword ptr [rip + 0x7d4a5d] ; 0x100ab96b0
0x1002e4c53: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e4c58: mov byte ptr [rax + 0x40], 0
0x1002e4c5c: vxorps ymm0, ymm0, ymm0
0x1002e4c60: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e4c68: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e4c6d: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e4c72: mov qword ptr [rax + 0xa4], r14
0x1002e4c79: vmovaps xmm0, xmmword ptr [rbx]
0x1002e4c7d: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e4c85: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e4c8d: vxorps xmm0, xmm0, xmm0
0x1002e4c91: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e4c99: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e4ca3: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e4cab: movabs rcx, 0x3f80000000000000
0x1002e4cb5: mov qword ptr [rax + 0xf4], rcx
0x1002e4cbc: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e4cc4: mov qword ptr [rax + 0x10c], rcx
0x1002e4ccb: mov byte ptr [rax + 0x114], 1
0x1002e4cd2: mov qword ptr [rax + 0x118], 0
0x1002e4cdd: mov qword ptr [rip + 0x1b0ab7c], rax ; 0x101def860
0x1002e4ce4: mov rdi, r12
0x1002e4ce7: mov rsi, rax
0x1002e4cea: mov rdx, r13
0x1002e4ced: vzeroupper 
0x1002e4cf0: call 0x100314920 ; 0x100314920
0x1002e4cf5: lea rsi, [rip + 0x89ae64] ; 0x100b7fb60 purchase
0x1002e4cfc: mov edx, 0x40
0x1002e4d01: mov rdi, r13
0x1002e4d04: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e4d09: movsx edi, byte ptr [rbp - 0x70]
0x1002e4d0d: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e4d12: mov byte ptr [rbp - 0x70], al
0x1002e4d15: mov rdx, qword ptr [rip + 0x1b0a94c] ; 0x101def668
0x1002e4d1c: mov esi, 0x120
0x1002e4d21: mov ecx, 0x10
0x1002e4d26: mov rdi, r15
0x1002e4d29: call 0x100795530 ; 0x100795530
0x1002e4d2e: vmovaps xmm0, xmmword ptr [rip + 0x7c812a] ; 0x100aace60
0x1002e4d36: vmovups xmmword ptr [rax], xmm0
0x1002e4d3a: mov word ptr [rax + 0x10], 0x100
0x1002e4d40: mov byte ptr [rax + 0x12], 0
0x1002e4d44: mov qword ptr [rax + 0x14], 0
0x1002e4d4c: vxorps xmm0, xmm0, xmm0
0x1002e4d50: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e4d55: mov dword ptr [rax + 0x28], 0
0x1002e4d5c: vmovaps xmm0, xmmword ptr [rip + 0x7d494c] ; 0x100ab96b0
0x1002e4d64: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e4d69: mov byte ptr [rax + 0x40], 0
0x1002e4d6d: vxorps ymm0, ymm0, ymm0
0x1002e4d71: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e4d79: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e4d7e: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e4d83: mov qword ptr [rax + 0xa4], r14
0x1002e4d8a: vmovaps xmm0, xmmword ptr [rbx]
0x1002e4d8e: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e4d96: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e4d9e: vxorps xmm0, xmm0, xmm0
0x1002e4da2: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e4daa: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e4db4: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e4dbc: movabs rcx, 0x3f80000000000000
0x1002e4dc6: mov qword ptr [rax + 0xf4], rcx
0x1002e4dcd: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e4dd5: mov qword ptr [rax + 0x10c], rcx
0x1002e4ddc: mov byte ptr [rax + 0x114], 1
0x1002e4de3: mov qword ptr [rax + 0x118], 0
0x1002e4dee: mov qword ptr [rip + 0x1b0aa73], rax ; 0x101def868
0x1002e4df5: mov rdi, r12
0x1002e4df8: mov rsi, rax
0x1002e4dfb: mov rdx, r13
0x1002e4dfe: vzeroupper 
0x1002e4e01: call 0x100314920 ; 0x100314920
0x1002e4e06: lea rsi, [rip + 0x89ad5c] ; 0x100b7fb69 xp
0x1002e4e0d: mov edx, 0x40
0x1002e4e12: mov rdi, r13
0x1002e4e15: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e4e1a: movsx edi, byte ptr [rbp - 0x70]
0x1002e4e1e: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e4e23: mov byte ptr [rbp - 0x70], al
0x1002e4e26: mov rdx, qword ptr [rip + 0x1b0a83b] ; 0x101def668
0x1002e4e2d: mov esi, 0x120
0x1002e4e32: mov ecx, 0x10
0x1002e4e37: mov rdi, r15
0x1002e4e3a: call 0x100795530 ; 0x100795530
0x1002e4e3f: vmovaps xmm0, xmmword ptr [rip + 0x7c8019] ; 0x100aace60
0x1002e4e47: vmovups xmmword ptr [rax], xmm0
0x1002e4e4b: mov word ptr [rax + 0x10], 0x100
0x1002e4e51: mov byte ptr [rax + 0x12], 0
0x1002e4e55: mov qword ptr [rax + 0x14], 0
0x1002e4e5d: vxorps xmm0, xmm0, xmm0
0x1002e4e61: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e4e66: mov dword ptr [rax + 0x28], 0
0x1002e4e6d: vmovaps xmm0, xmmword ptr [rip + 0x7d483b] ; 0x100ab96b0
0x1002e4e75: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e4e7a: mov byte ptr [rax + 0x40], 0
0x1002e4e7e: vxorps ymm0, ymm0, ymm0
0x1002e4e82: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e4e8a: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e4e8f: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e4e94: mov qword ptr [rax + 0xa4], r14
0x1002e4e9b: vmovaps xmm0, xmmword ptr [rbx]
0x1002e4e9f: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e4ea7: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e4eaf: vxorps xmm0, xmm0, xmm0
0x1002e4eb3: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e4ebb: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e4ec5: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e4ecd: movabs rcx, 0x3f80000000000000
0x1002e4ed7: mov qword ptr [rax + 0xf4], rcx
0x1002e4ede: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e4ee6: mov qword ptr [rax + 0x10c], rcx
0x1002e4eed: mov byte ptr [rax + 0x114], 1
0x1002e4ef4: mov qword ptr [rax + 0x118], 0
0x1002e4eff: mov qword ptr [rip + 0x1b0a96a], rax ; 0x101def870
0x1002e4f06: mov rdi, r12
0x1002e4f09: mov rsi, rax
0x1002e4f0c: mov rdx, r13
0x1002e4f0f: vzeroupper 
0x1002e4f12: call 0x100314920 ; 0x100314920
0x1002e4f17: lea rsi, [rip + 0x89ac4e] ; 0x100b7fb6c chestCreate
0x1002e4f1e: mov edx, 0x40
0x1002e4f23: mov rdi, r13
0x1002e4f26: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e4f2b: movsx edi, byte ptr [rbp - 0x70]
0x1002e4f2f: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e4f34: mov byte ptr [rbp - 0x70], al
0x1002e4f37: mov rdx, qword ptr [rip + 0x1b0a72a] ; 0x101def668
0x1002e4f3e: mov esi, 0x120
0x1002e4f43: mov ecx, 0x10
0x1002e4f48: mov rdi, r15
0x1002e4f4b: call 0x100795530 ; 0x100795530
0x1002e4f50: vmovaps xmm0, xmmword ptr [rip + 0x7c7f08] ; 0x100aace60
0x1002e4f58: vmovups xmmword ptr [rax], xmm0
0x1002e4f5c: mov word ptr [rax + 0x10], 0x100
0x1002e4f62: mov byte ptr [rax + 0x12], 0
0x1002e4f66: mov qword ptr [rax + 0x14], 0
0x1002e4f6e: vxorps xmm0, xmm0, xmm0
0x1002e4f72: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e4f77: mov dword ptr [rax + 0x28], 0
0x1002e4f7e: vmovaps xmm0, xmmword ptr [rip + 0x7d472a] ; 0x100ab96b0
0x1002e4f86: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e4f8b: mov byte ptr [rax + 0x40], 0
0x1002e4f8f: vxorps ymm0, ymm0, ymm0
0x1002e4f93: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e4f9b: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e4fa0: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e4fa5: mov qword ptr [rax + 0xa4], r14
0x1002e4fac: vmovaps xmm0, xmmword ptr [rbx]
0x1002e4fb0: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e4fb8: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e4fc0: vxorps xmm0, xmm0, xmm0
0x1002e4fc4: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e4fcc: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e4fd6: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e4fde: movabs rcx, 0x3f80000000000000
0x1002e4fe8: mov qword ptr [rax + 0xf4], rcx
0x1002e4fef: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e4ff7: mov qword ptr [rax + 0x10c], rcx
0x1002e4ffe: mov byte ptr [rax + 0x114], 1
0x1002e5005: mov qword ptr [rax + 0x118], 0
0x1002e5010: mov qword ptr [rip + 0x1b0a861], rax ; 0x101def878
0x1002e5017: mov rdi, r12
0x1002e501a: mov rsi, rax
0x1002e501d: mov rdx, r13
0x1002e5020: vzeroupper 
0x1002e5023: call 0x100314920 ; 0x100314920
0x1002e5028: lea rsi, [rip + 0x89ab49] ; 0x100b7fb78 chestIdle
0x1002e502f: mov edx, 0x40
0x1002e5034: mov rdi, r13
0x1002e5037: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e503c: movsx edi, byte ptr [rbp - 0x70]
0x1002e5040: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e5045: mov byte ptr [rbp - 0x70], al
0x1002e5048: mov rdx, qword ptr [rip + 0x1b0a619] ; 0x101def668
0x1002e504f: mov esi, 0x120
0x1002e5054: mov ecx, 0x10
0x1002e5059: mov rdi, r15
0x1002e505c: call 0x100795530 ; 0x100795530
0x1002e5061: vmovaps xmm0, xmmword ptr [rip + 0x7c7df7] ; 0x100aace60
0x1002e5069: vmovups xmmword ptr [rax], xmm0
0x1002e506d: mov word ptr [rax + 0x10], 0x100
0x1002e5073: mov byte ptr [rax + 0x12], 0
0x1002e5077: mov qword ptr [rax + 0x14], 0
0x1002e507f: vxorps xmm0, xmm0, xmm0
0x1002e5083: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e5088: mov dword ptr [rax + 0x28], 0
0x1002e508f: vmovaps xmm0, xmmword ptr [rip + 0x7d4619] ; 0x100ab96b0
0x1002e5097: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e509c: mov byte ptr [rax + 0x40], 0
0x1002e50a0: vxorps ymm0, ymm0, ymm0
0x1002e50a4: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e50ac: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e50b1: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e50b6: mov qword ptr [rax + 0xa4], r14
0x1002e50bd: vmovaps xmm0, xmmword ptr [rbx]
0x1002e50c1: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e50c9: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e50d1: vxorps xmm0, xmm0, xmm0
0x1002e50d5: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e50dd: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e50e7: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e50ef: movabs rcx, 0x3f80000000000000
0x1002e50f9: mov qword ptr [rax + 0xf4], rcx
0x1002e5100: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e5108: mov qword ptr [rax + 0x10c], rcx
0x1002e510f: mov byte ptr [rax + 0x114], 1
0x1002e5116: mov qword ptr [rax + 0x118], 0
0x1002e5121: mov qword ptr [rip + 0x1b0a758], rax ; 0x101def880
0x1002e5128: mov rdi, r12
0x1002e512b: mov rsi, rax
0x1002e512e: mov rdx, r13
0x1002e5131: vzeroupper 
0x1002e5134: call 0x100314920 ; 0x100314920
0x1002e5139: lea rsi, [rip + 0x89aa42] ; 0x100b7fb82 chestItemTrail
0x1002e5140: mov edx, 0x40
0x1002e5145: mov rdi, r13
0x1002e5148: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e514d: movsx edi, byte ptr [rbp - 0x70]
0x1002e5151: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e5156: mov byte ptr [rbp - 0x70], al
0x1002e5159: mov rdx, qword ptr [rip + 0x1b0a508] ; 0x101def668
0x1002e5160: mov esi, 0x120
0x1002e5165: mov ecx, 0x10
0x1002e516a: mov rdi, r15
0x1002e516d: call 0x100795530 ; 0x100795530
0x1002e5172: vmovaps xmm0, xmmword ptr [rip + 0x7c7ce6] ; 0x100aace60
0x1002e517a: vmovups xmmword ptr [rax], xmm0
0x1002e517e: mov word ptr [rax + 0x10], 0x100
0x1002e5184: mov byte ptr [rax + 0x12], 0
0x1002e5188: mov qword ptr [rax + 0x14], 0
0x1002e5190: vxorps xmm0, xmm0, xmm0
0x1002e5194: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e5199: mov dword ptr [rax + 0x28], 0
0x1002e51a0: vmovaps xmm0, xmmword ptr [rip + 0x7d4508] ; 0x100ab96b0
0x1002e51a8: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e51ad: mov byte ptr [rax + 0x40], 0
0x1002e51b1: vxorps ymm0, ymm0, ymm0
0x1002e51b5: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e51bd: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e51c2: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e51c7: mov qword ptr [rax + 0xa4], r14
0x1002e51ce: vmovaps xmm0, xmmword ptr [rbx]
0x1002e51d2: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e51da: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e51e2: vxorps xmm0, xmm0, xmm0
0x1002e51e6: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e51ee: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e51f8: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e5200: movabs rcx, 0x3f80000000000000
0x1002e520a: mov qword ptr [rax + 0xf4], rcx
0x1002e5211: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e5219: mov qword ptr [rax + 0x10c], rcx
0x1002e5220: mov byte ptr [rax + 0x114], 1
0x1002e5227: mov qword ptr [rax + 0x118], 0
0x1002e5232: mov qword ptr [rip + 0x1b0a64f], rax ; 0x101def888
0x1002e5239: mov rdi, r12
0x1002e523c: mov rsi, rax
0x1002e523f: mov rdx, r13
0x1002e5242: vzeroupper 
0x1002e5245: call 0x100314920 ; 0x100314920
0x1002e524a: lea rsi, [rip + 0x89a940] ; 0x100b7fb91 blazeReveal
0x1002e5251: mov edx, 0x40
0x1002e5256: mov rdi, r13
0x1002e5259: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e525e: movsx edi, byte ptr [rbp - 0x70]
0x1002e5262: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e5267: mov byte ptr [rbp - 0x70], al
0x1002e526a: mov rdx, qword ptr [rip + 0x1b0a3f7] ; 0x101def668
0x1002e5271: mov esi, 0x120
0x1002e5276: mov ecx, 0x10
0x1002e527b: mov rdi, r15
0x1002e527e: call 0x100795530 ; 0x100795530
0x1002e5283: vmovaps xmm0, xmmword ptr [rip + 0x7c7bd5] ; 0x100aace60
0x1002e528b: vmovups xmmword ptr [rax], xmm0
0x1002e528f: mov word ptr [rax + 0x10], 0x100
0x1002e5295: mov byte ptr [rax + 0x12], 0
0x1002e5299: mov qword ptr [rax + 0x14], 0
0x1002e52a1: vxorps xmm0, xmm0, xmm0
0x1002e52a5: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e52aa: mov dword ptr [rax + 0x28], 0
0x1002e52b1: vmovaps xmm0, xmmword ptr [rip + 0x7d43f7] ; 0x100ab96b0
0x1002e52b9: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e52be: mov byte ptr [rax + 0x40], 0
0x1002e52c2: vxorps ymm0, ymm0, ymm0
0x1002e52c6: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e52ce: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e52d3: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e52d8: mov qword ptr [rax + 0xa4], r14
0x1002e52df: vmovaps xmm0, xmmword ptr [rbx]
0x1002e52e3: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e52eb: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e52f3: vxorps xmm0, xmm0, xmm0
0x1002e52f7: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e52ff: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e5309: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e5311: movabs rcx, 0x3f80000000000000
0x1002e531b: mov qword ptr [rax + 0xf4], rcx
0x1002e5322: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e532a: mov qword ptr [rax + 0x10c], rcx
0x1002e5331: mov byte ptr [rax + 0x114], 1
0x1002e5338: mov qword ptr [rax + 0x118], 0
0x1002e5343: mov qword ptr [rip + 0x1b0a546], rax ; 0x101def890
0x1002e534a: mov rdi, r12
0x1002e534d: mov rsi, rax
0x1002e5350: mov rdx, r13
0x1002e5353: vzeroupper 
0x1002e5356: call 0x100314920 ; 0x100314920
0x1002e535b: lea rsi, [rip + 0x89a83b] ; 0x100b7fb9d blazeCandleReveal
0x1002e5362: mov edx, 0x40
0x1002e5367: mov rdi, r13
0x1002e536a: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e536f: movsx edi, byte ptr [rbp - 0x70]
0x1002e5373: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e5378: mov byte ptr [rbp - 0x70], al
0x1002e537b: mov rdx, qword ptr [rip + 0x1b0a2e6] ; 0x101def668
0x1002e5382: mov esi, 0x120
0x1002e5387: mov ecx, 0x10
0x1002e538c: mov rdi, r15
0x1002e538f: call 0x100795530 ; 0x100795530
0x1002e5394: vmovaps xmm0, xmmword ptr [rip + 0x7c7ac4] ; 0x100aace60
0x1002e539c: vmovups xmmword ptr [rax], xmm0
0x1002e53a0: mov word ptr [rax + 0x10], 0x100
0x1002e53a6: mov byte ptr [rax + 0x12], 0
0x1002e53aa: mov qword ptr [rax + 0x14], 0
0x1002e53b2: vxorps xmm0, xmm0, xmm0
0x1002e53b6: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e53bb: mov dword ptr [rax + 0x28], 0
0x1002e53c2: vmovaps xmm0, xmmword ptr [rip + 0x7d42e6] ; 0x100ab96b0
0x1002e53ca: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e53cf: mov byte ptr [rax + 0x40], 0
0x1002e53d3: vxorps ymm0, ymm0, ymm0
0x1002e53d7: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e53df: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e53e4: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e53e9: mov qword ptr [rax + 0xa4], r14
0x1002e53f0: vmovaps xmm0, xmmword ptr [rbx]
0x1002e53f4: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e53fc: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e5404: vxorps xmm0, xmm0, xmm0
0x1002e5408: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e5410: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e541a: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e5422: movabs rcx, 0x3f80000000000000
0x1002e542c: mov qword ptr [rax + 0xf4], rcx
0x1002e5433: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e543b: mov qword ptr [rax + 0x10c], rcx
0x1002e5442: mov byte ptr [rax + 0x114], 1
0x1002e5449: mov qword ptr [rax + 0x118], 0
0x1002e5454: mov qword ptr [rip + 0x1b0a43d], rax ; 0x101def898
0x1002e545b: mov rdi, r12
0x1002e545e: mov rsi, rax
0x1002e5461: mov rdx, r13
0x1002e5464: vzeroupper 
0x1002e5467: call 0x100314920 ; 0x100314920
0x1002e546c: lea rsi, [rip + 0x89a73c] ; 0x100b7fbaf rain
0x1002e5473: mov edx, 0x40
0x1002e5478: mov rdi, r13
0x1002e547b: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e5480: movsx edi, byte ptr [rbp - 0x70]
0x1002e5484: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e5489: mov byte ptr [rbp - 0x70], al
0x1002e548c: mov rdx, qword ptr [rip + 0x1b0a1d5] ; 0x101def668
0x1002e5493: mov esi, 0x120
0x1002e5498: mov ecx, 0x10
0x1002e549d: mov rdi, r15
0x1002e54a0: call 0x100795530 ; 0x100795530
0x1002e54a5: vmovaps xmm0, xmmword ptr [rip + 0x7c79b3] ; 0x100aace60
0x1002e54ad: vmovups xmmword ptr [rax], xmm0
0x1002e54b1: mov word ptr [rax + 0x10], 0x100
0x1002e54b7: mov byte ptr [rax + 0x12], 0
0x1002e54bb: mov qword ptr [rax + 0x14], 0
0x1002e54c3: vxorps xmm0, xmm0, xmm0
0x1002e54c7: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e54cc: mov dword ptr [rax + 0x28], 0
0x1002e54d3: vmovaps xmm0, xmmword ptr [rip + 0x7d41d5] ; 0x100ab96b0
0x1002e54db: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e54e0: mov byte ptr [rax + 0x40], 0
0x1002e54e4: vxorps ymm0, ymm0, ymm0
0x1002e54e8: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e54f0: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e54f5: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e54fa: mov qword ptr [rax + 0xa4], r14
0x1002e5501: vmovaps xmm0, xmmword ptr [rbx]
0x1002e5505: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e550d: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e5515: vxorps xmm0, xmm0, xmm0
0x1002e5519: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e5521: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e552b: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e5533: movabs rcx, 0x3f80000000000000
0x1002e553d: mov qword ptr [rax + 0xf4], rcx
0x1002e5544: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e554c: mov qword ptr [rax + 0x10c], rcx
0x1002e5553: mov byte ptr [rax + 0x114], 1
0x1002e555a: mov qword ptr [rax + 0x118], 0
0x1002e5565: mov qword ptr [rip + 0x1b0a334], rax ; 0x101def8a0
0x1002e556c: mov rdi, r12
0x1002e556f: mov rsi, rax
0x1002e5572: mov rdx, r13
0x1002e5575: vzeroupper 
0x1002e5578: call 0x100314920 ; 0x100314920
0x1002e557d: lea rsi, [rip + 0x89a630] ; 0x100b7fbb4 rainBold
0x1002e5584: mov edx, 0x40
0x1002e5589: mov rdi, r13
0x1002e558c: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e5591: movsx edi, byte ptr [rbp - 0x70]
0x1002e5595: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e559a: mov byte ptr [rbp - 0x70], al
0x1002e559d: mov rdx, qword ptr [rip + 0x1b0a0c4] ; 0x101def668
0x1002e55a4: mov esi, 0x120
0x1002e55a9: mov ecx, 0x10
0x1002e55ae: mov rdi, r15
0x1002e55b1: call 0x100795530 ; 0x100795530
0x1002e55b6: vmovaps xmm0, xmmword ptr [rip + 0x7c78a2] ; 0x100aace60
0x1002e55be: vmovups xmmword ptr [rax], xmm0
0x1002e55c2: mov word ptr [rax + 0x10], 0x100
0x1002e55c8: mov byte ptr [rax + 0x12], 0
0x1002e55cc: mov qword ptr [rax + 0x14], 0
0x1002e55d4: vxorps xmm0, xmm0, xmm0
0x1002e55d8: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e55dd: mov dword ptr [rax + 0x28], 0
0x1002e55e4: vmovaps xmm0, xmmword ptr [rip + 0x7d40c4] ; 0x100ab96b0
0x1002e55ec: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e55f1: mov byte ptr [rax + 0x40], 0
0x1002e55f5: vxorps ymm0, ymm0, ymm0
0x1002e55f9: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e5601: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e5606: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e560b: mov qword ptr [rax + 0xa4], r14
0x1002e5612: vmovaps xmm0, xmmword ptr [rbx]
0x1002e5616: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e561e: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e5626: vxorps xmm0, xmm0, xmm0
0x1002e562a: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e5632: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e563c: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e5644: movabs rcx, 0x3f80000000000000
0x1002e564e: mov qword ptr [rax + 0xf4], rcx
0x1002e5655: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e565d: mov qword ptr [rax + 0x10c], rcx
0x1002e5664: mov byte ptr [rax + 0x114], 1
0x1002e566b: mov qword ptr [rax + 0x118], 0
0x1002e5676: mov qword ptr [rip + 0x1b0a22b], rax ; 0x101def8a8
0x1002e567d: mov rdi, r12
0x1002e5680: mov rsi, rax
0x1002e5683: mov rdx, r13
0x1002e5686: vzeroupper 
0x1002e5689: call 0x100314920 ; 0x100314920
0x1002e568e: lea rsi, [rip + 0x89a528] ; 0x100b7fbbd rainEnv2
0x1002e5695: mov edx, 0x40
0x1002e569a: mov rdi, r13
0x1002e569d: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e56a2: movsx edi, byte ptr [rbp - 0x70]
0x1002e56a6: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e56ab: mov byte ptr [rbp - 0x70], al
0x1002e56ae: mov rdx, qword ptr [rip + 0x1b09fb3] ; 0x101def668
0x1002e56b5: mov esi, 0x120
0x1002e56ba: mov ecx, 0x10
0x1002e56bf: mov rdi, r15
0x1002e56c2: call 0x100795530 ; 0x100795530
0x1002e56c7: vmovaps xmm0, xmmword ptr [rip + 0x7c7791] ; 0x100aace60
0x1002e56cf: vmovups xmmword ptr [rax], xmm0
0x1002e56d3: mov word ptr [rax + 0x10], 0x100
0x1002e56d9: mov byte ptr [rax + 0x12], 0
0x1002e56dd: mov qword ptr [rax + 0x14], 0
0x1002e56e5: vxorps xmm0, xmm0, xmm0
0x1002e56e9: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e56ee: mov dword ptr [rax + 0x28], 0
0x1002e56f5: vmovaps xmm0, xmmword ptr [rip + 0x7d3fb3] ; 0x100ab96b0
0x1002e56fd: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e5702: mov byte ptr [rax + 0x40], 0
0x1002e5706: vxorps ymm0, ymm0, ymm0
0x1002e570a: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e5712: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e5717: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e571c: mov qword ptr [rax + 0xa4], r14
0x1002e5723: vmovaps xmm0, xmmword ptr [rbx]
0x1002e5727: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e572f: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e5737: vxorps xmm0, xmm0, xmm0
0x1002e573b: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e5743: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e574d: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e5755: movabs rcx, 0x3f80000000000000
0x1002e575f: mov qword ptr [rax + 0xf4], rcx
0x1002e5766: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e576e: mov qword ptr [rax + 0x10c], rcx
0x1002e5775: mov byte ptr [rax + 0x114], 1
0x1002e577c: mov qword ptr [rax + 0x118], 0
0x1002e5787: mov qword ptr [rip + 0x1b0a122], rax ; 0x101def8b0
0x1002e578e: mov rdi, r12
0x1002e5791: mov rsi, rax
0x1002e5794: mov rdx, r13
0x1002e5797: vzeroupper 
0x1002e579a: call 0x100314920 ; 0x100314920
0x1002e579f: lea rsi, [rip + 0x89a420] ; 0x100b7fbc6 snowy
0x1002e57a6: mov edx, 0x40
0x1002e57ab: mov rdi, r13
0x1002e57ae: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e57b3: movsx edi, byte ptr [rbp - 0x70]
0x1002e57b7: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e57bc: mov byte ptr [rbp - 0x70], al
0x1002e57bf: mov rdx, qword ptr [rip + 0x1b09ea2] ; 0x101def668
0x1002e57c6: mov esi, 0x120
0x1002e57cb: mov ecx, 0x10
0x1002e57d0: mov rdi, r15
0x1002e57d3: call 0x100795530 ; 0x100795530
0x1002e57d8: vmovaps xmm0, xmmword ptr [rip + 0x7c7680] ; 0x100aace60
0x1002e57e0: vmovups xmmword ptr [rax], xmm0
0x1002e57e4: mov word ptr [rax + 0x10], 0x100
0x1002e57ea: mov byte ptr [rax + 0x12], 0
0x1002e57ee: mov qword ptr [rax + 0x14], 0
0x1002e57f6: vxorps xmm0, xmm0, xmm0
0x1002e57fa: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e57ff: mov dword ptr [rax + 0x28], 0
0x1002e5806: vmovaps xmm0, xmmword ptr [rip + 0x7d3ea2] ; 0x100ab96b0
0x1002e580e: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e5813: mov byte ptr [rax + 0x40], 0
0x1002e5817: vxorps ymm0, ymm0, ymm0
0x1002e581b: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e5823: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e5828: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e582d: mov qword ptr [rax + 0xa4], r14
0x1002e5834: vmovaps xmm0, xmmword ptr [rbx]
0x1002e5838: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e5840: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e5848: vxorps xmm0, xmm0, xmm0
0x1002e584c: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e5854: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e585e: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e5866: movabs rcx, 0x3f80000000000000
0x1002e5870: mov qword ptr [rax + 0xf4], rcx
0x1002e5877: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e587f: mov qword ptr [rax + 0x10c], rcx
0x1002e5886: mov byte ptr [rax + 0x114], 1
0x1002e588d: mov qword ptr [rax + 0x118], 0
0x1002e5898: mov qword ptr [rip + 0x1b0a019], rax ; 0x101def8b8
0x1002e589f: mov rdi, r12
0x1002e58a2: mov rsi, rax
0x1002e58a5: mov rdx, r13
0x1002e58a8: vzeroupper 
0x1002e58ab: call 0x100314920 ; 0x100314920
0x1002e58b0: lea rsi, [rip + 0x89a315] ; 0x100b7fbcc rainHit
0x1002e58b7: mov edx, 0x40
0x1002e58bc: mov rdi, r13
0x1002e58bf: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e58c4: movsx edi, byte ptr [rbp - 0x70]
0x1002e58c8: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e58cd: mov byte ptr [rbp - 0x70], al
0x1002e58d0: mov rdx, qword ptr [rip + 0x1b09d91] ; 0x101def668
0x1002e58d7: mov esi, 0x120
0x1002e58dc: mov ecx, 0x10
0x1002e58e1: mov rdi, r15
0x1002e58e4: call 0x100795530 ; 0x100795530
0x1002e58e9: vmovaps xmm0, xmmword ptr [rip + 0x7c756f] ; 0x100aace60
0x1002e58f1: vmovups xmmword ptr [rax], xmm0
0x1002e58f5: mov word ptr [rax + 0x10], 0x100
0x1002e58fb: mov byte ptr [rax + 0x12], 0
0x1002e58ff: mov qword ptr [rax + 0x14], 0
0x1002e5907: vxorps xmm0, xmm0, xmm0
0x1002e590b: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e5910: mov dword ptr [rax + 0x28], 0
0x1002e5917: vmovaps xmm0, xmmword ptr [rip + 0x7d3d91] ; 0x100ab96b0
0x1002e591f: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e5924: mov byte ptr [rax + 0x40], 0
0x1002e5928: vxorps ymm0, ymm0, ymm0
0x1002e592c: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e5934: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e5939: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e593e: mov qword ptr [rax + 0xa4], r14
0x1002e5945: vmovaps xmm0, xmmword ptr [rbx]
0x1002e5949: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e5951: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e5959: vxorps xmm0, xmm0, xmm0
0x1002e595d: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e5965: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e596f: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e5977: movabs rcx, 0x3f80000000000000
0x1002e5981: mov qword ptr [rax + 0xf4], rcx
0x1002e5988: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e5990: mov qword ptr [rax + 0x10c], rcx
0x1002e5997: mov byte ptr [rax + 0x114], 1
0x1002e599e: mov qword ptr [rax + 0x118], 0
0x1002e59a9: mov qword ptr [rip + 0x1b09f10], rax ; 0x101def8c0
0x1002e59b0: mov rdi, r12
0x1002e59b3: mov rsi, rax
0x1002e59b6: mov rdx, r13
0x1002e59b9: vzeroupper 
0x1002e59bc: call 0x100314920 ; 0x100314920
0x1002e59c1: lea rsi, [rip + 0x89a20c] ; 0x100b7fbd4 rainHit2
0x1002e59c8: mov edx, 0x40
0x1002e59cd: mov rdi, r13
0x1002e59d0: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e59d5: movsx edi, byte ptr [rbp - 0x70]
0x1002e59d9: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e59de: mov byte ptr [rbp - 0x70], al
0x1002e59e1: mov rdx, qword ptr [rip + 0x1b09c80] ; 0x101def668
0x1002e59e8: mov esi, 0x120
0x1002e59ed: mov ecx, 0x10
0x1002e59f2: mov rdi, r15
0x1002e59f5: call 0x100795530 ; 0x100795530
0x1002e59fa: vmovaps xmm0, xmmword ptr [rip + 0x7c745e] ; 0x100aace60
0x1002e5a02: vmovups xmmword ptr [rax], xmm0
0x1002e5a06: mov word ptr [rax + 0x10], 0x100
0x1002e5a0c: mov byte ptr [rax + 0x12], 0
0x1002e5a10: mov qword ptr [rax + 0x14], 0
0x1002e5a18: vxorps xmm0, xmm0, xmm0
0x1002e5a1c: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e5a21: mov dword ptr [rax + 0x28], 0
0x1002e5a28: vmovaps xmm0, xmmword ptr [rip + 0x7d3c80] ; 0x100ab96b0
0x1002e5a30: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e5a35: mov byte ptr [rax + 0x40], 0
0x1002e5a39: vxorps ymm0, ymm0, ymm0
0x1002e5a3d: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e5a45: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e5a4a: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e5a4f: mov qword ptr [rax + 0xa4], r14
0x1002e5a56: vmovaps xmm0, xmmword ptr [rbx]
0x1002e5a5a: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e5a62: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e5a6a: vxorps xmm0, xmm0, xmm0
0x1002e5a6e: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e5a76: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e5a80: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e5a88: movabs rcx, 0x3f80000000000000
0x1002e5a92: mov qword ptr [rax + 0xf4], rcx
0x1002e5a99: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e5aa1: mov qword ptr [rax + 0x10c], rcx
0x1002e5aa8: mov byte ptr [rax + 0x114], 1
0x1002e5aaf: mov qword ptr [rax + 0x118], 0
0x1002e5aba: mov qword ptr [rip + 0x1b09e07], rax ; 0x101def8c8
0x1002e5ac1: mov rdi, r12
0x1002e5ac4: mov rsi, rax
0x1002e5ac7: mov rdx, r13
0x1002e5aca: vzeroupper 
0x1002e5acd: call 0x100314920 ; 0x100314920
0x1002e5ad2: lea rsi, [rip + 0x89a104] ; 0x100b7fbdd rainBounce
0x1002e5ad9: mov edx, 0x40
0x1002e5ade: mov rdi, r13
0x1002e5ae1: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e5ae6: movsx edi, byte ptr [rbp - 0x70]
0x1002e5aea: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e5aef: mov byte ptr [rbp - 0x70], al
0x1002e5af2: mov rdx, qword ptr [rip + 0x1b09b6f] ; 0x101def668
0x1002e5af9: mov esi, 0x120
0x1002e5afe: mov ecx, 0x10
0x1002e5b03: mov rdi, r15
0x1002e5b06: call 0x100795530 ; 0x100795530
0x1002e5b0b: vmovaps xmm0, xmmword ptr [rip + 0x7c734d] ; 0x100aace60
0x1002e5b13: vmovups xmmword ptr [rax], xmm0
0x1002e5b17: mov word ptr [rax + 0x10], 0x100
0x1002e5b1d: mov byte ptr [rax + 0x12], 0
0x1002e5b21: mov qword ptr [rax + 0x14], 0
0x1002e5b29: vxorps xmm0, xmm0, xmm0
0x1002e5b2d: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e5b32: mov dword ptr [rax + 0x28], 0
0x1002e5b39: vmovaps xmm0, xmmword ptr [rip + 0x7d3b6f] ; 0x100ab96b0
0x1002e5b41: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e5b46: mov byte ptr [rax + 0x40], 0
0x1002e5b4a: vxorps ymm0, ymm0, ymm0
0x1002e5b4e: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e5b56: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e5b5b: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e5b60: mov qword ptr [rax + 0xa4], r14
0x1002e5b67: vmovaps xmm0, xmmword ptr [rbx]
0x1002e5b6b: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e5b73: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e5b7b: vxorps xmm0, xmm0, xmm0
0x1002e5b7f: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e5b87: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e5b91: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e5b99: movabs rcx, 0x3f80000000000000
0x1002e5ba3: mov qword ptr [rax + 0xf4], rcx
0x1002e5baa: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e5bb2: mov qword ptr [rax + 0x10c], rcx
0x1002e5bb9: mov byte ptr [rax + 0x114], 1
0x1002e5bc0: mov qword ptr [rax + 0x118], 0
0x1002e5bcb: mov qword ptr [rip + 0x1b09cfe], rax ; 0x101def8d0
0x1002e5bd2: mov rdi, r12
0x1002e5bd5: mov rsi, rax
0x1002e5bd8: mov rdx, r13
0x1002e5bdb: vzeroupper 
0x1002e5bde: call 0x100314920 ; 0x100314920
0x1002e5be3: lea rsi, [rip + 0x899ffe] ; 0x100b7fbe8 rainBounceObject
0x1002e5bea: mov edx, 0x40
0x1002e5bef: mov rdi, r13
0x1002e5bf2: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e5bf7: movsx edi, byte ptr [rbp - 0x70]
0x1002e5bfb: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e5c00: mov byte ptr [rbp - 0x70], al
0x1002e5c03: mov rdx, qword ptr [rip + 0x1b09a5e] ; 0x101def668
0x1002e5c0a: mov esi, 0x120
0x1002e5c0f: mov ecx, 0x10
0x1002e5c14: mov rdi, r15
0x1002e5c17: call 0x100795530 ; 0x100795530
0x1002e5c1c: vmovaps xmm0, xmmword ptr [rip + 0x7c723c] ; 0x100aace60
0x1002e5c24: vmovups xmmword ptr [rax], xmm0
0x1002e5c28: mov word ptr [rax + 0x10], 0x100
0x1002e5c2e: mov byte ptr [rax + 0x12], 0
0x1002e5c32: mov qword ptr [rax + 0x14], 0
0x1002e5c3a: vxorps xmm0, xmm0, xmm0
0x1002e5c3e: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e5c43: mov dword ptr [rax + 0x28], 0
0x1002e5c4a: vmovaps xmm0, xmmword ptr [rip + 0x7d3a5e] ; 0x100ab96b0
0x1002e5c52: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e5c57: mov byte ptr [rax + 0x40], 0
0x1002e5c5b: vxorps ymm0, ymm0, ymm0
0x1002e5c5f: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e5c67: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e5c6c: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e5c71: mov qword ptr [rax + 0xa4], r14
0x1002e5c78: vmovaps xmm0, xmmword ptr [rbx]
0x1002e5c7c: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e5c84: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e5c8c: vxorps xmm0, xmm0, xmm0
0x1002e5c90: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e5c98: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e5ca2: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e5caa: movabs rcx, 0x3f80000000000000
0x1002e5cb4: mov qword ptr [rax + 0xf4], rcx
0x1002e5cbb: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e5cc3: mov qword ptr [rax + 0x10c], rcx
0x1002e5cca: mov byte ptr [rax + 0x114], 1
0x1002e5cd1: mov qword ptr [rax + 0x118], 0
0x1002e5cdc: mov qword ptr [rip + 0x1b09bf5], rax ; 0x101def8d8
0x1002e5ce3: mov rdi, r12
0x1002e5ce6: mov rsi, rax
0x1002e5ce9: mov rdx, r13
0x1002e5cec: vzeroupper 
0x1002e5cef: call 0x100314920 ; 0x100314920
0x1002e5cf4: lea rsi, [rip + 0x899efe] ; 0x100b7fbf9 emberBits
0x1002e5cfb: mov edx, 0x40
0x1002e5d00: mov rdi, r13
0x1002e5d03: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e5d08: movsx edi, byte ptr [rbp - 0x70]
0x1002e5d0c: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e5d11: mov byte ptr [rbp - 0x70], al
0x1002e5d14: mov rdx, qword ptr [rip + 0x1b0994d] ; 0x101def668
0x1002e5d1b: mov esi, 0x120
0x1002e5d20: mov ecx, 0x10
0x1002e5d25: mov rdi, r15
0x1002e5d28: call 0x100795530 ; 0x100795530
0x1002e5d2d: vmovaps xmm0, xmmword ptr [rip + 0x7c712b] ; 0x100aace60
0x1002e5d35: vmovups xmmword ptr [rax], xmm0
0x1002e5d39: mov word ptr [rax + 0x10], 0x100
0x1002e5d3f: mov byte ptr [rax + 0x12], 0
0x1002e5d43: mov qword ptr [rax + 0x14], 0
0x1002e5d4b: vxorps xmm0, xmm0, xmm0
0x1002e5d4f: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e5d54: mov dword ptr [rax + 0x28], 0
0x1002e5d5b: vmovaps xmm0, xmmword ptr [rip + 0x7d394d] ; 0x100ab96b0
0x1002e5d63: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e5d68: mov byte ptr [rax + 0x40], 0
0x1002e5d6c: vxorps ymm0, ymm0, ymm0
0x1002e5d70: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e5d78: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e5d7d: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e5d82: mov qword ptr [rax + 0xa4], r14
0x1002e5d89: vmovaps xmm0, xmmword ptr [rbx]
0x1002e5d8d: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e5d95: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e5d9d: vxorps xmm0, xmm0, xmm0
0x1002e5da1: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e5da9: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e5db3: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e5dbb: movabs rcx, 0x3f80000000000000
0x1002e5dc5: mov qword ptr [rax + 0xf4], rcx
0x1002e5dcc: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e5dd4: mov qword ptr [rax + 0x10c], rcx
0x1002e5ddb: mov byte ptr [rax + 0x114], 1
0x1002e5de2: mov qword ptr [rax + 0x118], 0
0x1002e5ded: mov qword ptr [rip + 0x1b09aec], rax ; 0x101def8e0
0x1002e5df4: mov rdi, r12
0x1002e5df7: mov rsi, rax
0x1002e5dfa: mov rdx, r13
0x1002e5dfd: vzeroupper 
0x1002e5e00: call 0x100314920 ; 0x100314920
0x1002e5e05: lea rsi, [rip + 0x899df7] ; 0x100b7fc03 emberBits2
0x1002e5e0c: mov edx, 0x40
0x1002e5e11: mov rdi, r13
0x1002e5e14: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e5e19: movsx edi, byte ptr [rbp - 0x70]
0x1002e5e1d: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e5e22: mov byte ptr [rbp - 0x70], al
0x1002e5e25: mov rdx, qword ptr [rip + 0x1b0983c] ; 0x101def668
0x1002e5e2c: mov esi, 0x120
0x1002e5e31: mov ecx, 0x10
0x1002e5e36: mov rdi, r15
0x1002e5e39: call 0x100795530 ; 0x100795530
0x1002e5e3e: vmovaps xmm0, xmmword ptr [rip + 0x7c701a] ; 0x100aace60
0x1002e5e46: vmovups xmmword ptr [rax], xmm0
0x1002e5e4a: mov word ptr [rax + 0x10], 0x100
0x1002e5e50: mov byte ptr [rax + 0x12], 0
0x1002e5e54: mov qword ptr [rax + 0x14], 0
0x1002e5e5c: vxorps xmm0, xmm0, xmm0
0x1002e5e60: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e5e65: mov dword ptr [rax + 0x28], 0
0x1002e5e6c: vmovaps xmm0, xmmword ptr [rip + 0x7d383c] ; 0x100ab96b0
0x1002e5e74: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e5e79: mov byte ptr [rax + 0x40], 0
0x1002e5e7d: vxorps ymm0, ymm0, ymm0
0x1002e5e81: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e5e89: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e5e8e: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e5e93: mov qword ptr [rax + 0xa4], r14
0x1002e5e9a: vmovaps xmm0, xmmword ptr [rbx]
0x1002e5e9e: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e5ea6: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e5eae: vxorps xmm0, xmm0, xmm0
0x1002e5eb2: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e5eba: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e5ec4: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e5ecc: movabs rcx, 0x3f80000000000000
0x1002e5ed6: mov qword ptr [rax + 0xf4], rcx
0x1002e5edd: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e5ee5: mov qword ptr [rax + 0x10c], rcx
0x1002e5eec: mov byte ptr [rax + 0x114], 1
0x1002e5ef3: mov qword ptr [rax + 0x118], 0
0x1002e5efe: mov qword ptr [rip + 0x1b099e3], rax ; 0x101def8e8
0x1002e5f05: mov rdi, r12
0x1002e5f08: mov rsi, rax
0x1002e5f0b: mov rdx, r13
0x1002e5f0e: vzeroupper 
0x1002e5f11: call 0x100314920 ; 0x100314920
0x1002e5f16: lea rsi, [rip + 0x899cf1] ; 0x100b7fc0e emberBits3
0x1002e5f1d: mov edx, 0x40
0x1002e5f22: mov rdi, r13
0x1002e5f25: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e5f2a: movsx edi, byte ptr [rbp - 0x70]
0x1002e5f2e: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e5f33: mov byte ptr [rbp - 0x70], al
0x1002e5f36: mov rdx, qword ptr [rip + 0x1b0972b] ; 0x101def668
0x1002e5f3d: mov esi, 0x120
0x1002e5f42: mov ecx, 0x10
0x1002e5f47: mov rdi, r15
0x1002e5f4a: call 0x100795530 ; 0x100795530
0x1002e5f4f: vmovaps xmm0, xmmword ptr [rip + 0x7c6f09] ; 0x100aace60
0x1002e5f57: vmovups xmmword ptr [rax], xmm0
0x1002e5f5b: mov word ptr [rax + 0x10], 0x100
0x1002e5f61: mov byte ptr [rax + 0x12], 0
0x1002e5f65: mov qword ptr [rax + 0x14], 0
0x1002e5f6d: vxorps xmm0, xmm0, xmm0
0x1002e5f71: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e5f76: mov dword ptr [rax + 0x28], 0
0x1002e5f7d: vmovaps xmm0, xmmword ptr [rip + 0x7d372b] ; 0x100ab96b0
0x1002e5f85: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e5f8a: mov byte ptr [rax + 0x40], 0
0x1002e5f8e: vxorps ymm0, ymm0, ymm0
0x1002e5f92: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e5f9a: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e5f9f: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e5fa4: mov qword ptr [rax + 0xa4], r14
0x1002e5fab: vmovaps xmm0, xmmword ptr [rbx]
0x1002e5faf: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e5fb7: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e5fbf: vxorps xmm0, xmm0, xmm0
0x1002e5fc3: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e5fcb: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e5fd5: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e5fdd: movabs rcx, 0x3f80000000000000
0x1002e5fe7: mov qword ptr [rax + 0xf4], rcx
0x1002e5fee: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e5ff6: mov qword ptr [rax + 0x10c], rcx
0x1002e5ffd: mov byte ptr [rax + 0x114], 1
0x1002e6004: mov qword ptr [rax + 0x118], 0
0x1002e600f: mov qword ptr [rip + 0x1b098da], rax ; 0x101def8f0
0x1002e6016: mov rdi, r12
0x1002e6019: mov rsi, rax
0x1002e601c: mov rdx, r13
0x1002e601f: vzeroupper 
0x1002e6022: call 0x100314920 ; 0x100314920
0x1002e6027: lea rsi, [rip + 0x899beb] ; 0x100b7fc19 emberBitsNightEnergy
0x1002e602e: mov edx, 0x40
0x1002e6033: mov rdi, r13
0x1002e6036: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e603b: movsx edi, byte ptr [rbp - 0x70]
0x1002e603f: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e6044: mov byte ptr [rbp - 0x70], al
0x1002e6047: mov rdx, qword ptr [rip + 0x1b0961a] ; 0x101def668
0x1002e604e: mov esi, 0x120
0x1002e6053: mov ecx, 0x10
0x1002e6058: mov rdi, r15
0x1002e605b: call 0x100795530 ; 0x100795530
0x1002e6060: vmovaps xmm0, xmmword ptr [rip + 0x7c6df8] ; 0x100aace60
0x1002e6068: vmovups xmmword ptr [rax], xmm0
0x1002e606c: mov word ptr [rax + 0x10], 0x100
0x1002e6072: mov byte ptr [rax + 0x12], 0
0x1002e6076: mov qword ptr [rax + 0x14], 0
0x1002e607e: vxorps xmm0, xmm0, xmm0
0x1002e6082: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e6087: mov dword ptr [rax + 0x28], 0
0x1002e608e: vmovaps xmm0, xmmword ptr [rip + 0x7d361a] ; 0x100ab96b0
0x1002e6096: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e609b: mov byte ptr [rax + 0x40], 0
0x1002e609f: vxorps ymm0, ymm0, ymm0
0x1002e60a3: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e60ab: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e60b0: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e60b5: mov qword ptr [rax + 0xa4], r14
0x1002e60bc: vmovaps xmm0, xmmword ptr [rbx]
0x1002e60c0: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e60c8: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e60d0: vxorps xmm0, xmm0, xmm0
0x1002e60d4: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e60dc: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e60e6: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e60ee: movabs rcx, 0x3f80000000000000
0x1002e60f8: mov qword ptr [rax + 0xf4], rcx
0x1002e60ff: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e6107: mov qword ptr [rax + 0x10c], rcx
0x1002e610e: mov byte ptr [rax + 0x114], 1
0x1002e6115: mov qword ptr [rax + 0x118], 0
0x1002e6120: mov qword ptr [rip + 0x1b097d1], rax ; 0x101def8f8
0x1002e6127: mov rdi, r12
0x1002e612a: mov rsi, rax
0x1002e612d: mov rdx, r13
0x1002e6130: vzeroupper 
0x1002e6133: call 0x100314920 ; 0x100314920
0x1002e6138: lea rsi, [rip + 0x899aef] ; 0x100b7fc2e emberBitsBlue
0x1002e613f: mov edx, 0x40
0x1002e6144: mov rdi, r13
0x1002e6147: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e614c: movsx edi, byte ptr [rbp - 0x70]
0x1002e6150: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e6155: mov byte ptr [rbp - 0x70], al
0x1002e6158: mov rdx, qword ptr [rip + 0x1b09509] ; 0x101def668
0x1002e615f: mov esi, 0x120
0x1002e6164: mov ecx, 0x10
0x1002e6169: mov rdi, r15
0x1002e616c: call 0x100795530 ; 0x100795530
0x1002e6171: vmovaps xmm0, xmmword ptr [rip + 0x7c6ce7] ; 0x100aace60
0x1002e6179: vmovups xmmword ptr [rax], xmm0
0x1002e617d: mov word ptr [rax + 0x10], 0x100
0x1002e6183: mov byte ptr [rax + 0x12], 0
0x1002e6187: mov qword ptr [rax + 0x14], 0
0x1002e618f: vxorps xmm0, xmm0, xmm0
0x1002e6193: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e6198: mov dword ptr [rax + 0x28], 0
0x1002e619f: vmovaps xmm0, xmmword ptr [rip + 0x7d3509] ; 0x100ab96b0
0x1002e61a7: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e61ac: mov byte ptr [rax + 0x40], 0
0x1002e61b0: vxorps ymm0, ymm0, ymm0
0x1002e61b4: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e61bc: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e61c1: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e61c6: mov qword ptr [rax + 0xa4], r14
0x1002e61cd: vmovaps xmm0, xmmword ptr [rbx]
0x1002e61d1: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e61d9: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e61e1: vxorps xmm0, xmm0, xmm0
0x1002e61e5: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e61ed: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e61f7: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e61ff: movabs rcx, 0x3f80000000000000
0x1002e6209: mov qword ptr [rax + 0xf4], rcx
0x1002e6210: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e6218: mov qword ptr [rax + 0x10c], rcx
0x1002e621f: mov byte ptr [rax + 0x114], 1
0x1002e6226: mov qword ptr [rax + 0x118], 0
0x1002e6231: mov qword ptr [rip + 0x1b096c8], rax ; 0x101def900
0x1002e6238: mov rdi, r12
0x1002e623b: mov rsi, rax
0x1002e623e: mov rdx, r13
0x1002e6241: vzeroupper 
0x1002e6244: call 0x100314920 ; 0x100314920
0x1002e6249: lea rsi, [rip + 0x8999ec] ; 0x100b7fc3c emberBitsGold
0x1002e6250: mov edx, 0x40
0x1002e6255: mov rdi, r13
0x1002e6258: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e625d: movsx edi, byte ptr [rbp - 0x70]
0x1002e6261: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e6266: mov byte ptr [rbp - 0x70], al
0x1002e6269: mov rdx, qword ptr [rip + 0x1b093f8] ; 0x101def668
0x1002e6270: mov esi, 0x120
0x1002e6275: mov ecx, 0x10
0x1002e627a: mov rdi, r15
0x1002e627d: call 0x100795530 ; 0x100795530
0x1002e6282: vmovaps xmm0, xmmword ptr [rip + 0x7c6bd6] ; 0x100aace60
0x1002e628a: vmovups xmmword ptr [rax], xmm0
0x1002e628e: mov word ptr [rax + 0x10], 0x100
0x1002e6294: mov byte ptr [rax + 0x12], 0
0x1002e6298: mov qword ptr [rax + 0x14], 0
0x1002e62a0: vxorps xmm0, xmm0, xmm0
0x1002e62a4: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e62a9: mov dword ptr [rax + 0x28], 0
0x1002e62b0: vmovaps xmm0, xmmword ptr [rip + 0x7d33f8] ; 0x100ab96b0
0x1002e62b8: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e62bd: mov byte ptr [rax + 0x40], 0
0x1002e62c1: vxorps ymm0, ymm0, ymm0
0x1002e62c5: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e62cd: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e62d2: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e62d7: mov qword ptr [rax + 0xa4], r14
0x1002e62de: vmovaps xmm0, xmmword ptr [rbx]
0x1002e62e2: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e62ea: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e62f2: vxorps xmm0, xmm0, xmm0
0x1002e62f6: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e62fe: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e6308: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e6310: movabs rcx, 0x3f80000000000000
0x1002e631a: mov qword ptr [rax + 0xf4], rcx
0x1002e6321: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e6329: mov qword ptr [rax + 0x10c], rcx
0x1002e6330: mov byte ptr [rax + 0x114], 1
0x1002e6337: mov qword ptr [rax + 0x118], 0
0x1002e6342: mov qword ptr [rip + 0x1b095bf], rax ; 0x101def908
0x1002e6349: mov rdi, r12
0x1002e634c: mov rsi, rax
0x1002e634f: mov rdx, r13
0x1002e6352: vzeroupper 
0x1002e6355: call 0x100314920 ; 0x100314920
0x1002e635a: lea rsi, [rip + 0x8998e9] ; 0x100b7fc4a lightDrop
0x1002e6361: mov edx, 0x40
0x1002e6366: mov rdi, r13
0x1002e6369: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e636e: movsx edi, byte ptr [rbp - 0x70]
0x1002e6372: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e6377: mov byte ptr [rbp - 0x70], al
0x1002e637a: mov rdx, qword ptr [rip + 0x1b092e7] ; 0x101def668
0x1002e6381: mov esi, 0x120
0x1002e6386: mov ecx, 0x10
0x1002e638b: mov rdi, r15
0x1002e638e: call 0x100795530 ; 0x100795530
0x1002e6393: vmovaps xmm0, xmmword ptr [rip + 0x7c6ac5] ; 0x100aace60
0x1002e639b: vmovups xmmword ptr [rax], xmm0
0x1002e639f: mov word ptr [rax + 0x10], 0x100
0x1002e63a5: mov byte ptr [rax + 0x12], 0
0x1002e63a9: mov qword ptr [rax + 0x14], 0
0x1002e63b1: vxorps xmm0, xmm0, xmm0
0x1002e63b5: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e63ba: mov dword ptr [rax + 0x28], 0
0x1002e63c1: vmovaps xmm0, xmmword ptr [rip + 0x7d32e7] ; 0x100ab96b0
0x1002e63c9: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e63ce: mov byte ptr [rax + 0x40], 0
0x1002e63d2: vxorps ymm0, ymm0, ymm0
0x1002e63d6: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e63de: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e63e3: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e63e8: mov qword ptr [rax + 0xa4], r14
0x1002e63ef: vmovaps xmm0, xmmword ptr [rbx]
0x1002e63f3: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e63fb: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e6403: vxorps xmm0, xmm0, xmm0
0x1002e6407: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e640f: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e6419: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e6421: movabs rcx, 0x3f80000000000000
0x1002e642b: mov qword ptr [rax + 0xf4], rcx
0x1002e6432: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e643a: mov qword ptr [rax + 0x10c], rcx
0x1002e6441: mov byte ptr [rax + 0x114], 1
0x1002e6448: mov qword ptr [rax + 0x118], 0
0x1002e6453: mov qword ptr [rip + 0x1b094b6], rax ; 0x101def910
0x1002e645a: mov rdi, r12
0x1002e645d: mov rsi, rax
0x1002e6460: mov rdx, r13
0x1002e6463: vzeroupper 
0x1002e6466: call 0x100314920 ; 0x100314920
0x1002e646b: lea rsi, [rip + 0x8997e2] ; 0x100b7fc54 nightMuralReveal
0x1002e6472: mov edx, 0x40
0x1002e6477: mov rdi, r13
0x1002e647a: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e647f: movsx edi, byte ptr [rbp - 0x70]
0x1002e6483: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e6488: mov byte ptr [rbp - 0x70], al
0x1002e648b: mov rdx, qword ptr [rip + 0x1b091d6] ; 0x101def668
0x1002e6492: mov esi, 0x120
0x1002e6497: mov ecx, 0x10
0x1002e649c: mov rdi, r15
0x1002e649f: call 0x100795530 ; 0x100795530
0x1002e64a4: vmovaps xmm0, xmmword ptr [rip + 0x7c69b4] ; 0x100aace60
0x1002e64ac: vmovups xmmword ptr [rax], xmm0
0x1002e64b0: mov word ptr [rax + 0x10], 0x100
0x1002e64b6: mov byte ptr [rax + 0x12], 0
0x1002e64ba: mov qword ptr [rax + 0x14], 0
0x1002e64c2: vxorps xmm0, xmm0, xmm0
0x1002e64c6: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e64cb: mov dword ptr [rax + 0x28], 0
0x1002e64d2: vmovaps xmm0, xmmword ptr [rip + 0x7d31d6] ; 0x100ab96b0
0x1002e64da: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e64df: mov byte ptr [rax + 0x40], 0
0x1002e64e3: vxorps ymm0, ymm0, ymm0
0x1002e64e7: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e64ef: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e64f4: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e64f9: mov qword ptr [rax + 0xa4], r14
0x1002e6500: vmovaps xmm0, xmmword ptr [rbx]
0x1002e6504: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e650c: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e6514: vxorps xmm0, xmm0, xmm0
0x1002e6518: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e6520: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e652a: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e6532: movabs rcx, 0x3f80000000000000
0x1002e653c: mov qword ptr [rax + 0xf4], rcx
0x1002e6543: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e654b: mov qword ptr [rax + 0x10c], rcx
0x1002e6552: mov byte ptr [rax + 0x114], 1
0x1002e6559: mov qword ptr [rax + 0x118], 0
0x1002e6564: mov qword ptr [rip + 0x1b093ad], rax ; 0x101def918
0x1002e656b: mov rdi, r12
0x1002e656e: mov rsi, rax
0x1002e6571: mov rdx, r13
0x1002e6574: vzeroupper 
0x1002e6577: call 0x100314920 ; 0x100314920
0x1002e657c: lea rsi, [rip + 0x8996e2] ; 0x100b7fc65 emoteBlueBallSmallFollow
0x1002e6583: mov edx, 0x40
0x1002e6588: mov rdi, r13
0x1002e658b: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e6590: movsx edi, byte ptr [rbp - 0x70]
0x1002e6594: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e6599: mov byte ptr [rbp - 0x70], al
0x1002e659c: mov rdx, qword ptr [rip + 0x1b090c5] ; 0x101def668
0x1002e65a3: mov esi, 0x120
0x1002e65a8: mov ecx, 0x10
0x1002e65ad: mov rdi, r15
0x1002e65b0: call 0x100795530 ; 0x100795530
0x1002e65b5: vmovaps xmm0, xmmword ptr [rip + 0x7c68a3] ; 0x100aace60
0x1002e65bd: vmovups xmmword ptr [rax], xmm0
0x1002e65c1: mov word ptr [rax + 0x10], 0x100
0x1002e65c7: mov byte ptr [rax + 0x12], 0
0x1002e65cb: mov qword ptr [rax + 0x14], 0
0x1002e65d3: vxorps xmm0, xmm0, xmm0
0x1002e65d7: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e65dc: mov dword ptr [rax + 0x28], 0
0x1002e65e3: vmovaps xmm0, xmmword ptr [rip + 0x7d30c5] ; 0x100ab96b0
0x1002e65eb: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e65f0: mov byte ptr [rax + 0x40], 0
0x1002e65f4: vxorps ymm0, ymm0, ymm0
0x1002e65f8: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e6600: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e6605: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e660a: mov qword ptr [rax + 0xa4], r14
0x1002e6611: vmovaps xmm0, xmmword ptr [rbx]
0x1002e6615: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e661d: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e6625: vxorps xmm0, xmm0, xmm0
0x1002e6629: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e6631: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e663b: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e6643: movabs rcx, 0x3f80000000000000
0x1002e664d: mov qword ptr [rax + 0xf4], rcx
0x1002e6654: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e665c: mov qword ptr [rax + 0x10c], rcx
0x1002e6663: mov r14, rcx
0x1002e6666: mov byte ptr [rax + 0x114], 1
0x1002e666d: mov qword ptr [rax + 0x118], 0
0x1002e6678: mov qword ptr [rip + 0x1b092a1], rax ; 0x101def920
0x1002e667f: mov rdi, r12
0x1002e6682: mov rsi, rax
0x1002e6685: mov rdx, r13
0x1002e6688: vzeroupper 
0x1002e668b: call 0x100314920 ; 0x100314920
0x1002e6690: lea rsi, [rip + 0x8995e7] ; 0x100b7fc7e flameRecieveEmitter
0x1002e6697: mov edx, 0x40
0x1002e669c: mov rdi, r13
0x1002e669f: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e66a4: movsx edi, byte ptr [rbp - 0x70]
0x1002e66a8: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e66ad: mov byte ptr [rbp - 0x70], al
0x1002e66b0: mov rdx, qword ptr [rip + 0x1b08fb1] ; 0x101def668
0x1002e66b7: mov esi, 0x120
0x1002e66bc: mov ecx, 0x10
0x1002e66c1: mov rdi, r15
0x1002e66c4: call 0x100795530 ; 0x100795530
0x1002e66c9: vmovaps xmm0, xmmword ptr [rip + 0x7c678f] ; 0x100aace60
0x1002e66d1: vmovups xmmword ptr [rax], xmm0
0x1002e66d5: mov word ptr [rax + 0x10], 0x100
0x1002e66db: mov byte ptr [rax + 0x12], 0
0x1002e66df: mov qword ptr [rax + 0x14], 0
0x1002e66e7: vxorps xmm0, xmm0, xmm0
0x1002e66eb: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e66f0: mov dword ptr [rax + 0x28], 0
0x1002e66f7: vmovaps xmm0, xmmword ptr [rip + 0x7d2fb1] ; 0x100ab96b0
0x1002e66ff: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e6704: mov byte ptr [rax + 0x40], 0
0x1002e6708: vxorps ymm0, ymm0, ymm0
0x1002e670c: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e6714: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e6719: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e671e: movabs rcx, 0x40d0000040600000
0x1002e6728: mov qword ptr [rax + 0xa4], rcx
0x1002e672f: vmovaps xmm0, xmmword ptr [rbx]
0x1002e6733: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e673b: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e6743: vxorps xmm0, xmm0, xmm0
0x1002e6747: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e674f: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e6759: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e6761: mov qword ptr [rax + 0xf4], r14
0x1002e6768: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e6770: mov qword ptr [rax + 0x10c], r14
0x1002e6777: mov byte ptr [rax + 0x114], 1
0x1002e677e: mov qword ptr [rax + 0x118], 0
0x1002e6789: mov qword ptr [rip + 0x1b09198], rax ; 0x101def928
0x1002e6790: mov rdi, r12
0x1002e6793: mov rsi, rax
0x1002e6796: mov rdx, r13
0x1002e6799: vzeroupper 
0x1002e679c: call 0x100314920 ; 0x100314920
0x1002e67a1: lea rsi, [rip + 0x8994ea] ; 0x100b7fc92 emoteDepositCollectibles1
0x1002e67a8: mov edx, 0x40
0x1002e67ad: mov rdi, r13
0x1002e67b0: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e67b5: movsx edi, byte ptr [rbp - 0x70]
0x1002e67b9: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e67be: mov byte ptr [rbp - 0x70], al
0x1002e67c1: mov rdx, qword ptr [rip + 0x1b08ea0] ; 0x101def668
0x1002e67c8: mov esi, 0x120
0x1002e67cd: mov ecx, 0x10
0x1002e67d2: mov rdi, r15
0x1002e67d5: call 0x100795530 ; 0x100795530
0x1002e67da: vmovaps xmm0, xmmword ptr [rip + 0x7c667e] ; 0x100aace60
0x1002e67e2: vmovups xmmword ptr [rax], xmm0
0x1002e67e6: mov byte ptr [rax + 0x10], 0
0x1002e67ea: mov byte ptr [rax + 0x11], 1
0x1002e67ee: mov byte ptr [rax + 0x12], 0
0x1002e67f2: mov dword ptr [rax + 0x14], 0
0x1002e67f9: mov dword ptr [rax + 0x18], 0
0x1002e6800: vxorps xmm0, xmm0, xmm0
0x1002e6804: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e6809: mov dword ptr [rax + 0x28], 0
0x1002e6810: vmovaps xmm0, xmmword ptr [rip + 0x7d2e98] ; 0x100ab96b0
0x1002e6818: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e681d: mov byte ptr [rax + 0x40], 0
0x1002e6821: vxorps ymm0, ymm0, ymm0
0x1002e6825: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e682d: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e6832: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e6837: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e6841: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e684b: vmovaps xmm0, xmmword ptr [rbx]
0x1002e684f: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e6857: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e685f: vxorps xmm0, xmm0, xmm0
0x1002e6863: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e686b: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e6875: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e687d: mov dword ptr [rax + 0xf4], 0
0x1002e6887: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e6891: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e6899: mov dword ptr [rax + 0x10c], 0
0x1002e68a3: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e68ad: mov byte ptr [rax + 0x114], 1
0x1002e68b4: mov dword ptr [rax + 0x118], 0
0x1002e68be: mov dword ptr [rax + 0x11c], 0
0x1002e68c8: mov qword ptr [rip + 0x1b09061], rax ; 0x101def930
0x1002e68cf: mov rdi, r12
0x1002e68d2: mov rsi, rax
0x1002e68d5: mov rdx, r13
0x1002e68d8: vzeroupper 
0x1002e68db: call 0x100314920 ; 0x100314920
0x1002e68e0: lea rsi, [rip + 0x8993c5] ; 0x100b7fcac emoteDepositCollectibles2
0x1002e68e7: mov edx, 0x40
0x1002e68ec: mov rdi, r13
0x1002e68ef: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e68f4: movsx edi, byte ptr [rbp - 0x70]
0x1002e68f8: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e68fd: mov byte ptr [rbp - 0x70], al
0x1002e6900: mov rdx, qword ptr [rip + 0x1b08d61] ; 0x101def668
0x1002e6907: mov esi, 0x120
0x1002e690c: mov ecx, 0x10
0x1002e6911: mov rdi, r15
0x1002e6914: call 0x100795530 ; 0x100795530
0x1002e6919: vmovaps xmm0, xmmword ptr [rip + 0x7c653f] ; 0x100aace60
0x1002e6921: vmovups xmmword ptr [rax], xmm0
0x1002e6925: mov byte ptr [rax + 0x10], 0
0x1002e6929: mov byte ptr [rax + 0x11], 1
0x1002e692d: mov byte ptr [rax + 0x12], 0
0x1002e6931: mov dword ptr [rax + 0x14], 0
0x1002e6938: mov dword ptr [rax + 0x18], 0
0x1002e693f: vxorps xmm0, xmm0, xmm0
0x1002e6943: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e6948: mov dword ptr [rax + 0x28], 0
0x1002e694f: vmovaps xmm0, xmmword ptr [rip + 0x7d2d59] ; 0x100ab96b0
0x1002e6957: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e695c: mov byte ptr [rax + 0x40], 0
0x1002e6960: vxorps ymm0, ymm0, ymm0
0x1002e6964: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e696c: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e6971: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e6976: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e6980: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e698a: vmovaps xmm0, xmmword ptr [rbx]
0x1002e698e: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e6996: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e699e: vxorps xmm0, xmm0, xmm0
0x1002e69a2: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e69aa: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e69b4: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e69bc: mov dword ptr [rax + 0xf4], 0
0x1002e69c6: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e69d0: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e69d8: mov dword ptr [rax + 0x10c], 0
0x1002e69e2: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e69ec: mov byte ptr [rax + 0x114], 1
0x1002e69f3: mov dword ptr [rax + 0x118], 0
0x1002e69fd: mov dword ptr [rax + 0x11c], 0
0x1002e6a07: mov qword ptr [rip + 0x1b08f2a], rax ; 0x101def938
0x1002e6a0e: mov rdi, r12
0x1002e6a11: mov rsi, rax
0x1002e6a14: mov rdx, r13
0x1002e6a17: vzeroupper 
0x1002e6a1a: call 0x100314920 ; 0x100314920
0x1002e6a1f: lea rsi, [rip + 0x8992a0] ; 0x100b7fcc6 emoteBlueBallBigFollow
0x1002e6a26: mov edx, 0x40
0x1002e6a2b: mov rdi, r13
0x1002e6a2e: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e6a33: movsx edi, byte ptr [rbp - 0x70]
0x1002e6a37: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e6a3c: mov byte ptr [rbp - 0x70], al
0x1002e6a3f: mov rdx, qword ptr [rip + 0x1b08c22] ; 0x101def668
0x1002e6a46: mov esi, 0x120
0x1002e6a4b: mov ecx, 0x10
0x1002e6a50: mov rdi, r15
0x1002e6a53: call 0x100795530 ; 0x100795530
0x1002e6a58: vmovaps xmm0, xmmword ptr [rip + 0x7c6400] ; 0x100aace60
0x1002e6a60: vmovups xmmword ptr [rax], xmm0
0x1002e6a64: mov byte ptr [rax + 0x10], 0
0x1002e6a68: mov byte ptr [rax + 0x11], 1
0x1002e6a6c: mov byte ptr [rax + 0x12], 0
0x1002e6a70: mov dword ptr [rax + 0x14], 0
0x1002e6a77: mov dword ptr [rax + 0x18], 0
0x1002e6a7e: vxorps xmm0, xmm0, xmm0
0x1002e6a82: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e6a87: mov dword ptr [rax + 0x28], 0
0x1002e6a8e: vmovaps xmm0, xmmword ptr [rip + 0x7d2c1a] ; 0x100ab96b0
0x1002e6a96: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e6a9b: mov byte ptr [rax + 0x40], 0
0x1002e6a9f: vxorps ymm0, ymm0, ymm0
0x1002e6aa3: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e6aab: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e6ab0: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e6ab5: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e6abf: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e6ac9: vmovaps xmm0, xmmword ptr [rbx]
0x1002e6acd: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e6ad5: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e6add: vxorps xmm0, xmm0, xmm0
0x1002e6ae1: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e6ae9: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e6af3: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e6afb: mov dword ptr [rax + 0xf4], 0
0x1002e6b05: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e6b0f: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e6b17: mov dword ptr [rax + 0x10c], 0
0x1002e6b21: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e6b2b: mov byte ptr [rax + 0x114], 1
0x1002e6b32: mov dword ptr [rax + 0x118], 0
0x1002e6b3c: mov dword ptr [rax + 0x11c], 0
0x1002e6b46: mov qword ptr [rip + 0x1b08df3], rax ; 0x101def940
0x1002e6b4d: mov rdi, r12
0x1002e6b50: mov rsi, rax
0x1002e6b53: mov rdx, r13
0x1002e6b56: vzeroupper 
0x1002e6b59: call 0x100314920 ; 0x100314920
0x1002e6b5e: lea rsi, [rip + 0x899178] ; 0x100b7fcdd emoteHaloBallBigFloat
0x1002e6b65: mov edx, 0x40
0x1002e6b6a: mov rdi, r13
0x1002e6b6d: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e6b72: movsx edi, byte ptr [rbp - 0x70]
0x1002e6b76: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e6b7b: mov byte ptr [rbp - 0x70], al
0x1002e6b7e: mov rdx, qword ptr [rip + 0x1b08ae3] ; 0x101def668
0x1002e6b85: mov esi, 0x120
0x1002e6b8a: mov ecx, 0x10
0x1002e6b8f: mov rdi, r15
0x1002e6b92: call 0x100795530 ; 0x100795530
0x1002e6b97: vmovaps xmm0, xmmword ptr [rip + 0x7c62c1] ; 0x100aace60
0x1002e6b9f: vmovups xmmword ptr [rax], xmm0
0x1002e6ba3: mov byte ptr [rax + 0x10], 0
0x1002e6ba7: mov byte ptr [rax + 0x11], 1
0x1002e6bab: mov byte ptr [rax + 0x12], 0
0x1002e6baf: mov dword ptr [rax + 0x14], 0
0x1002e6bb6: mov dword ptr [rax + 0x18], 0
0x1002e6bbd: vxorps xmm0, xmm0, xmm0
0x1002e6bc1: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e6bc6: mov dword ptr [rax + 0x28], 0
0x1002e6bcd: vmovaps xmm0, xmmword ptr [rip + 0x7d2adb] ; 0x100ab96b0
0x1002e6bd5: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e6bda: mov byte ptr [rax + 0x40], 0
0x1002e6bde: vxorps ymm0, ymm0, ymm0
0x1002e6be2: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e6bea: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e6bef: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e6bf4: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e6bfe: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e6c08: vmovaps xmm0, xmmword ptr [rbx]
0x1002e6c0c: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e6c14: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e6c1c: vxorps xmm0, xmm0, xmm0
0x1002e6c20: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e6c28: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e6c32: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e6c3a: mov dword ptr [rax + 0xf4], 0
0x1002e6c44: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e6c4e: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e6c56: mov dword ptr [rax + 0x10c], 0
0x1002e6c60: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e6c6a: mov byte ptr [rax + 0x114], 1
0x1002e6c71: mov dword ptr [rax + 0x118], 0
0x1002e6c7b: mov dword ptr [rax + 0x11c], 0
0x1002e6c85: mov qword ptr [rip + 0x1b08cbc], rax ; 0x101def948
0x1002e6c8c: mov rdi, r12
0x1002e6c8f: mov rsi, rax
0x1002e6c92: mov rdx, r13
0x1002e6c95: vzeroupper 
0x1002e6c98: call 0x100314920 ; 0x100314920
0x1002e6c9d: lea rsi, [rip + 0x89904f] ; 0x100b7fcf3 emoteOrangeTrailSmallFollow
0x1002e6ca4: mov edx, 0x40
0x1002e6ca9: mov rdi, r13
0x1002e6cac: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e6cb1: movsx edi, byte ptr [rbp - 0x70]
0x1002e6cb5: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e6cba: mov byte ptr [rbp - 0x70], al
0x1002e6cbd: mov rdx, qword ptr [rip + 0x1b089a4] ; 0x101def668
0x1002e6cc4: mov esi, 0x120
0x1002e6cc9: mov ecx, 0x10
0x1002e6cce: mov rdi, r15
0x1002e6cd1: call 0x100795530 ; 0x100795530
0x1002e6cd6: vmovaps xmm0, xmmword ptr [rip + 0x7c6182] ; 0x100aace60
0x1002e6cde: vmovups xmmword ptr [rax], xmm0
0x1002e6ce2: mov byte ptr [rax + 0x10], 0
0x1002e6ce6: mov byte ptr [rax + 0x11], 1
0x1002e6cea: mov byte ptr [rax + 0x12], 0
0x1002e6cee: mov dword ptr [rax + 0x14], 0
0x1002e6cf5: mov dword ptr [rax + 0x18], 0
0x1002e6cfc: vxorps xmm0, xmm0, xmm0
0x1002e6d00: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e6d05: mov dword ptr [rax + 0x28], 0
0x1002e6d0c: vmovaps xmm0, xmmword ptr [rip + 0x7d299c] ; 0x100ab96b0
0x1002e6d14: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e6d19: mov byte ptr [rax + 0x40], 0
0x1002e6d1d: vxorps ymm0, ymm0, ymm0
0x1002e6d21: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e6d29: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e6d2e: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e6d33: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e6d3d: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e6d47: vmovaps xmm0, xmmword ptr [rbx]
0x1002e6d4b: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e6d53: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e6d5b: vxorps xmm0, xmm0, xmm0
0x1002e6d5f: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e6d67: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e6d71: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e6d79: mov dword ptr [rax + 0xf4], 0
0x1002e6d83: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e6d8d: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e6d95: mov dword ptr [rax + 0x10c], 0
0x1002e6d9f: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e6da9: mov byte ptr [rax + 0x114], 1
0x1002e6db0: mov dword ptr [rax + 0x118], 0
0x1002e6dba: mov dword ptr [rax + 0x11c], 0
0x1002e6dc4: mov qword ptr [rip + 0x1b08b85], rax ; 0x101def950
0x1002e6dcb: mov rdi, r12
0x1002e6dce: mov rsi, rax
0x1002e6dd1: mov rdx, r13
0x1002e6dd4: vzeroupper 
0x1002e6dd7: call 0x100314920 ; 0x100314920
0x1002e6ddc: lea rsi, [rip + 0x898f2c] ; 0x100b7fd0f emoteRedHeadGlowShocked
0x1002e6de3: mov edx, 0x40
0x1002e6de8: mov rdi, r13
0x1002e6deb: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e6df0: movsx edi, byte ptr [rbp - 0x70]
0x1002e6df4: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e6df9: mov byte ptr [rbp - 0x70], al
0x1002e6dfc: mov rdx, qword ptr [rip + 0x1b08865] ; 0x101def668
0x1002e6e03: mov esi, 0x120
0x1002e6e08: mov ecx, 0x10
0x1002e6e0d: mov rdi, r15
0x1002e6e10: call 0x100795530 ; 0x100795530
0x1002e6e15: vmovaps xmm0, xmmword ptr [rip + 0x7c6043] ; 0x100aace60
0x1002e6e1d: vmovups xmmword ptr [rax], xmm0
0x1002e6e21: mov byte ptr [rax + 0x10], 0
0x1002e6e25: mov byte ptr [rax + 0x11], 1
0x1002e6e29: mov byte ptr [rax + 0x12], 0
0x1002e6e2d: mov dword ptr [rax + 0x14], 0
0x1002e6e34: mov dword ptr [rax + 0x18], 0
0x1002e6e3b: vxorps xmm0, xmm0, xmm0
0x1002e6e3f: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e6e44: mov dword ptr [rax + 0x28], 0
0x1002e6e4b: vmovaps xmm0, xmmword ptr [rip + 0x7d285d] ; 0x100ab96b0
0x1002e6e53: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e6e58: mov byte ptr [rax + 0x40], 0
0x1002e6e5c: vxorps ymm0, ymm0, ymm0
0x1002e6e60: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e6e68: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e6e6d: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e6e72: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e6e7c: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e6e86: vmovaps xmm0, xmmword ptr [rbx]
0x1002e6e8a: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e6e92: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e6e9a: vxorps xmm0, xmm0, xmm0
0x1002e6e9e: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e6ea6: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e6eb0: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e6eb8: mov dword ptr [rax + 0xf4], 0
0x1002e6ec2: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e6ecc: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e6ed4: mov dword ptr [rax + 0x10c], 0
0x1002e6ede: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e6ee8: mov byte ptr [rax + 0x114], 1
0x1002e6eef: mov dword ptr [rax + 0x118], 0
0x1002e6ef9: mov dword ptr [rax + 0x11c], 0
0x1002e6f03: mov qword ptr [rip + 0x1b08a4e], rax ; 0x101def958
0x1002e6f0a: mov rdi, r12
0x1002e6f0d: mov rsi, rax
0x1002e6f10: mov rdx, r13
0x1002e6f13: vzeroupper 
0x1002e6f16: call 0x100314920 ; 0x100314920
0x1002e6f1b: lea rsi, [rip + 0x898e05] ; 0x100b7fd27 emoteRedBallSmallFollow
0x1002e6f22: mov edx, 0x40
0x1002e6f27: mov rdi, r13
0x1002e6f2a: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e6f2f: movsx edi, byte ptr [rbp - 0x70]
0x1002e6f33: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e6f38: mov byte ptr [rbp - 0x70], al
0x1002e6f3b: mov rdx, qword ptr [rip + 0x1b08726] ; 0x101def668
0x1002e6f42: mov esi, 0x120
0x1002e6f47: mov ecx, 0x10
0x1002e6f4c: mov rdi, r15
0x1002e6f4f: call 0x100795530 ; 0x100795530
0x1002e6f54: vmovaps xmm0, xmmword ptr [rip + 0x7c5f04] ; 0x100aace60
0x1002e6f5c: vmovups xmmword ptr [rax], xmm0
0x1002e6f60: mov byte ptr [rax + 0x10], 0
0x1002e6f64: mov byte ptr [rax + 0x11], 1
0x1002e6f68: mov byte ptr [rax + 0x12], 0
0x1002e6f6c: mov dword ptr [rax + 0x14], 0
0x1002e6f73: mov dword ptr [rax + 0x18], 0
0x1002e6f7a: vxorps xmm0, xmm0, xmm0
0x1002e6f7e: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e6f83: mov dword ptr [rax + 0x28], 0
0x1002e6f8a: vmovaps xmm0, xmmword ptr [rip + 0x7d271e] ; 0x100ab96b0
0x1002e6f92: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e6f97: mov byte ptr [rax + 0x40], 0
0x1002e6f9b: vxorps ymm0, ymm0, ymm0
0x1002e6f9f: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e6fa7: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e6fac: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e6fb1: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e6fbb: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e6fc5: vmovaps xmm0, xmmword ptr [rbx]
0x1002e6fc9: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e6fd1: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e6fd9: vxorps xmm0, xmm0, xmm0
0x1002e6fdd: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e6fe5: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e6fef: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e6ff7: mov dword ptr [rax + 0xf4], 0
0x1002e7001: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e700b: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e7013: mov dword ptr [rax + 0x10c], 0
0x1002e701d: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e7027: mov byte ptr [rax + 0x114], 1
0x1002e702e: mov dword ptr [rax + 0x118], 0
0x1002e7038: mov dword ptr [rax + 0x11c], 0
0x1002e7042: mov qword ptr [rip + 0x1b08917], rax ; 0x101def960
0x1002e7049: mov rdi, r12
0x1002e704c: mov rsi, rax
0x1002e704f: mov rdx, r13
0x1002e7052: vzeroupper 
0x1002e7055: call 0x100314920 ; 0x100314920
0x1002e705a: lea rsi, [rip + 0x898cde] ; 0x100b7fd3f emoteTrailSmallFollowPoint
0x1002e7061: mov edx, 0x40
0x1002e7066: mov rdi, r13
0x1002e7069: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e706e: movsx edi, byte ptr [rbp - 0x70]
0x1002e7072: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e7077: mov byte ptr [rbp - 0x70], al
0x1002e707a: mov rdx, qword ptr [rip + 0x1b085e7] ; 0x101def668
0x1002e7081: mov esi, 0x120
0x1002e7086: mov ecx, 0x10
0x1002e708b: mov rdi, r15
0x1002e708e: call 0x100795530 ; 0x100795530
0x1002e7093: vmovaps xmm0, xmmword ptr [rip + 0x7c5dc5] ; 0x100aace60
0x1002e709b: vmovups xmmword ptr [rax], xmm0
0x1002e709f: mov byte ptr [rax + 0x10], 0
0x1002e70a3: mov byte ptr [rax + 0x11], 1
0x1002e70a7: mov byte ptr [rax + 0x12], 0
0x1002e70ab: mov dword ptr [rax + 0x14], 0
0x1002e70b2: mov dword ptr [rax + 0x18], 0
0x1002e70b9: vxorps xmm0, xmm0, xmm0
0x1002e70bd: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e70c2: mov dword ptr [rax + 0x28], 0
0x1002e70c9: vmovaps xmm0, xmmword ptr [rip + 0x7d25df] ; 0x100ab96b0
0x1002e70d1: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e70d6: mov byte ptr [rax + 0x40], 0
0x1002e70da: vxorps ymm0, ymm0, ymm0
0x1002e70de: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e70e6: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e70eb: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e70f0: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e70fa: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e7104: vmovaps xmm0, xmmword ptr [rbx]
0x1002e7108: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e7110: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e7118: vxorps xmm0, xmm0, xmm0
0x1002e711c: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e7124: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e712e: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e7136: mov dword ptr [rax + 0xf4], 0
0x1002e7140: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e714a: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e7152: mov dword ptr [rax + 0x10c], 0
0x1002e715c: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e7166: mov byte ptr [rax + 0x114], 1
0x1002e716d: mov dword ptr [rax + 0x118], 0
0x1002e7177: mov dword ptr [rax + 0x11c], 0
0x1002e7181: mov qword ptr [rip + 0x1b087e0], rax ; 0x101def968
0x1002e7188: mov rdi, r12
0x1002e718b: mov rsi, rax
0x1002e718e: mov rdx, r13
0x1002e7191: vzeroupper 
0x1002e7194: call 0x100314920 ; 0x100314920
0x1002e7199: lea rsi, [rip + 0x898bba] ; 0x100b7fd5a emoteTrailMediumFollowWelcome
0x1002e71a0: mov edx, 0x40
0x1002e71a5: mov rdi, r13
0x1002e71a8: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e71ad: movsx edi, byte ptr [rbp - 0x70]
0x1002e71b1: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e71b6: mov byte ptr [rbp - 0x70], al
0x1002e71b9: mov rdx, qword ptr [rip + 0x1b084a8] ; 0x101def668
0x1002e71c0: mov esi, 0x120
0x1002e71c5: mov ecx, 0x10
0x1002e71ca: mov rdi, r15
0x1002e71cd: call 0x100795530 ; 0x100795530
0x1002e71d2: vmovaps xmm0, xmmword ptr [rip + 0x7c5c86] ; 0x100aace60
0x1002e71da: vmovups xmmword ptr [rax], xmm0
0x1002e71de: mov byte ptr [rax + 0x10], 0
0x1002e71e2: mov byte ptr [rax + 0x11], 1
0x1002e71e6: mov byte ptr [rax + 0x12], 0
0x1002e71ea: mov dword ptr [rax + 0x14], 0
0x1002e71f1: mov dword ptr [rax + 0x18], 0
0x1002e71f8: vxorps xmm0, xmm0, xmm0
0x1002e71fc: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e7201: mov dword ptr [rax + 0x28], 0
0x1002e7208: vmovaps xmm0, xmmword ptr [rip + 0x7d24a0] ; 0x100ab96b0
0x1002e7210: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e7215: mov byte ptr [rax + 0x40], 0
0x1002e7219: vxorps ymm0, ymm0, ymm0
0x1002e721d: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e7225: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e722a: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e722f: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e7239: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e7243: vmovaps xmm0, xmmword ptr [rbx]
0x1002e7247: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e724f: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e7257: vxorps xmm0, xmm0, xmm0
0x1002e725b: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e7263: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e726d: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e7275: mov dword ptr [rax + 0xf4], 0
0x1002e727f: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e7289: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e7291: mov dword ptr [rax + 0x10c], 0
0x1002e729b: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e72a5: mov byte ptr [rax + 0x114], 1
0x1002e72ac: mov dword ptr [rax + 0x118], 0
0x1002e72b6: mov dword ptr [rax + 0x11c], 0
0x1002e72c0: mov qword ptr [rip + 0x1b086a9], rax ; 0x101def970
0x1002e72c7: mov rdi, r12
0x1002e72ca: mov rsi, rax
0x1002e72cd: mov rdx, r13
0x1002e72d0: vzeroupper 
0x1002e72d3: call 0x100314920 ; 0x100314920
0x1002e72d8: lea rsi, [rip + 0x898a99] ; 0x100b7fd78 emoteBreathCloudCold
0x1002e72df: mov edx, 0x40
0x1002e72e4: mov rdi, r13
0x1002e72e7: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e72ec: movsx edi, byte ptr [rbp - 0x70]
0x1002e72f0: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e72f5: mov byte ptr [rbp - 0x70], al
0x1002e72f8: mov rdx, qword ptr [rip + 0x1b08369] ; 0x101def668
0x1002e72ff: mov esi, 0x120
0x1002e7304: mov ecx, 0x10
0x1002e7309: mov rdi, r15
0x1002e730c: call 0x100795530 ; 0x100795530
0x1002e7311: vmovaps xmm0, xmmword ptr [rip + 0x7c5b47] ; 0x100aace60
0x1002e7319: vmovups xmmword ptr [rax], xmm0
0x1002e731d: mov byte ptr [rax + 0x10], 0
0x1002e7321: mov byte ptr [rax + 0x11], 1
0x1002e7325: mov byte ptr [rax + 0x12], 0
0x1002e7329: mov dword ptr [rax + 0x14], 0
0x1002e7330: mov dword ptr [rax + 0x18], 0
0x1002e7337: vxorps xmm0, xmm0, xmm0
0x1002e733b: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e7340: mov dword ptr [rax + 0x28], 0
0x1002e7347: vmovaps xmm0, xmmword ptr [rip + 0x7d2361] ; 0x100ab96b0
0x1002e734f: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e7354: mov byte ptr [rax + 0x40], 0
0x1002e7358: vxorps ymm0, ymm0, ymm0
0x1002e735c: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e7364: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e7369: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e736e: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e7378: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e7382: vmovaps xmm0, xmmword ptr [rbx]
0x1002e7386: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e738e: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e7396: vxorps xmm0, xmm0, xmm0
0x1002e739a: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e73a2: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e73ac: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e73b4: mov dword ptr [rax + 0xf4], 0
0x1002e73be: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e73c8: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e73d0: mov dword ptr [rax + 0x10c], 0
0x1002e73da: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e73e4: mov byte ptr [rax + 0x114], 1
0x1002e73eb: mov dword ptr [rax + 0x118], 0
0x1002e73f5: mov dword ptr [rax + 0x11c], 0
0x1002e73ff: mov qword ptr [rip + 0x1b08572], rax ; 0x101def978
0x1002e7406: mov rdi, r12
0x1002e7409: mov rsi, rax
0x1002e740c: mov rdx, r13
0x1002e740f: vzeroupper 
0x1002e7412: call 0x100314920 ; 0x100314920
0x1002e7417: lea rsi, [rip + 0x89896f] ; 0x100b7fd8d emotelampBlue
0x1002e741e: mov edx, 0x40
0x1002e7423: mov rdi, r13
0x1002e7426: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e742b: movsx edi, byte ptr [rbp - 0x70]
0x1002e742f: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e7434: mov byte ptr [rbp - 0x70], al
0x1002e7437: mov rdx, qword ptr [rip + 0x1b0822a] ; 0x101def668
0x1002e743e: mov esi, 0x120
0x1002e7443: mov ecx, 0x10
0x1002e7448: mov rdi, r15
0x1002e744b: call 0x100795530 ; 0x100795530
0x1002e7450: vmovaps xmm0, xmmword ptr [rip + 0x7c5a08] ; 0x100aace60
0x1002e7458: vmovups xmmword ptr [rax], xmm0
0x1002e745c: mov byte ptr [rax + 0x10], 0
0x1002e7460: mov byte ptr [rax + 0x11], 1
0x1002e7464: mov byte ptr [rax + 0x12], 0
0x1002e7468: mov dword ptr [rax + 0x14], 0
0x1002e746f: mov dword ptr [rax + 0x18], 0
0x1002e7476: vxorps xmm0, xmm0, xmm0
0x1002e747a: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e747f: mov dword ptr [rax + 0x28], 0
0x1002e7486: vmovaps xmm0, xmmword ptr [rip + 0x7d2222] ; 0x100ab96b0
0x1002e748e: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e7493: mov byte ptr [rax + 0x40], 0
0x1002e7497: vxorps ymm0, ymm0, ymm0
0x1002e749b: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e74a3: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e74a8: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e74ad: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e74b7: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e74c1: vmovaps xmm0, xmmword ptr [rbx]
0x1002e74c5: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e74cd: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e74d5: vxorps xmm0, xmm0, xmm0
0x1002e74d9: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e74e1: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e74eb: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e74f3: mov dword ptr [rax + 0xf4], 0
0x1002e74fd: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e7507: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e750f: mov dword ptr [rax + 0x10c], 0
0x1002e7519: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e7523: mov byte ptr [rax + 0x114], 1
0x1002e752a: mov dword ptr [rax + 0x118], 0
0x1002e7534: mov dword ptr [rax + 0x11c], 0
0x1002e753e: mov qword ptr [rip + 0x1b0843b], rax ; 0x101def980
0x1002e7545: mov rdi, r12
0x1002e7548: mov rsi, rax
0x1002e754b: mov rdx, r13
0x1002e754e: vzeroupper 
0x1002e7551: call 0x100314920 ; 0x100314920
0x1002e7556: lea rsi, [rip + 0x89883e] ; 0x100b7fd9b emoteUseTheForceGlow
0x1002e755d: mov edx, 0x40
0x1002e7562: mov rdi, r13
0x1002e7565: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e756a: movsx edi, byte ptr [rbp - 0x70]
0x1002e756e: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e7573: mov byte ptr [rbp - 0x70], al
0x1002e7576: mov rdx, qword ptr [rip + 0x1b080eb] ; 0x101def668
0x1002e757d: mov esi, 0x120
0x1002e7582: mov ecx, 0x10
0x1002e7587: mov rdi, r15
0x1002e758a: call 0x100795530 ; 0x100795530
0x1002e758f: vmovaps xmm0, xmmword ptr [rip + 0x7c58c9] ; 0x100aace60
0x1002e7597: vmovups xmmword ptr [rax], xmm0
0x1002e759b: mov byte ptr [rax + 0x10], 0
0x1002e759f: mov byte ptr [rax + 0x11], 1
0x1002e75a3: mov byte ptr [rax + 0x12], 0
0x1002e75a7: mov dword ptr [rax + 0x14], 0
0x1002e75ae: mov dword ptr [rax + 0x18], 0
0x1002e75b5: vxorps xmm0, xmm0, xmm0
0x1002e75b9: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e75be: mov dword ptr [rax + 0x28], 0
0x1002e75c5: vmovaps xmm0, xmmword ptr [rip + 0x7d20e3] ; 0x100ab96b0
0x1002e75cd: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e75d2: mov byte ptr [rax + 0x40], 0
0x1002e75d6: vxorps ymm0, ymm0, ymm0
0x1002e75da: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e75e2: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e75e7: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e75ec: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e75f6: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e7600: vmovaps xmm0, xmmword ptr [rbx]
0x1002e7604: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e760c: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e7614: vxorps xmm0, xmm0, xmm0
0x1002e7618: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e7620: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e762a: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e7632: mov dword ptr [rax + 0xf4], 0
0x1002e763c: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e7646: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e764e: mov dword ptr [rax + 0x10c], 0
0x1002e7658: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e7662: mov byte ptr [rax + 0x114], 1
0x1002e7669: mov dword ptr [rax + 0x118], 0
0x1002e7673: mov dword ptr [rax + 0x11c], 0
0x1002e767d: mov qword ptr [rip + 0x1b08304], rax ; 0x101def988
0x1002e7684: mov rdi, r12
0x1002e7687: mov rsi, rax
0x1002e768a: mov rdx, r13
0x1002e768d: vzeroupper 
0x1002e7690: call 0x100314920 ; 0x100314920
0x1002e7695: lea rsi, [rip + 0x898714] ; 0x100b7fdb0 emoteBigCloudFloat
0x1002e769c: mov edx, 0x40
0x1002e76a1: mov rdi, r13
0x1002e76a4: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e76a9: movsx edi, byte ptr [rbp - 0x70]
0x1002e76ad: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e76b2: mov byte ptr [rbp - 0x70], al
0x1002e76b5: mov rdx, qword ptr [rip + 0x1b07fac] ; 0x101def668
0x1002e76bc: mov esi, 0x120
0x1002e76c1: mov ecx, 0x10
0x1002e76c6: mov rdi, r15
0x1002e76c9: call 0x100795530 ; 0x100795530
0x1002e76ce: vmovaps xmm0, xmmword ptr [rip + 0x7c578a] ; 0x100aace60
0x1002e76d6: vmovups xmmword ptr [rax], xmm0
0x1002e76da: mov byte ptr [rax + 0x10], 0
0x1002e76de: mov byte ptr [rax + 0x11], 1
0x1002e76e2: mov byte ptr [rax + 0x12], 0
0x1002e76e6: mov dword ptr [rax + 0x14], 0
0x1002e76ed: mov dword ptr [rax + 0x18], 0
0x1002e76f4: vxorps xmm0, xmm0, xmm0
0x1002e76f8: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e76fd: mov dword ptr [rax + 0x28], 0
0x1002e7704: vmovaps xmm0, xmmword ptr [rip + 0x7d1fa4] ; 0x100ab96b0
0x1002e770c: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e7711: mov byte ptr [rax + 0x40], 0
0x1002e7715: vxorps ymm0, ymm0, ymm0
0x1002e7719: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e7721: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e7726: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e772b: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e7735: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e773f: vmovaps xmm0, xmmword ptr [rbx]
0x1002e7743: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e774b: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e7753: vxorps xmm0, xmm0, xmm0
0x1002e7757: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e775f: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e7769: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e7771: mov dword ptr [rax + 0xf4], 0
0x1002e777b: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e7785: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e778d: mov dword ptr [rax + 0x10c], 0
0x1002e7797: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e77a1: mov byte ptr [rax + 0x114], 1
0x1002e77a8: mov dword ptr [rax + 0x118], 0
0x1002e77b2: mov dword ptr [rax + 0x11c], 0
0x1002e77bc: mov qword ptr [rip + 0x1b081cd], rax ; 0x101def990
0x1002e77c3: mov rdi, r12
0x1002e77c6: mov rsi, rax
0x1002e77c9: mov rdx, r13
0x1002e77cc: vzeroupper 
0x1002e77cf: call 0x100314920 ; 0x100314920
0x1002e77d4: lea rsi, [rip + 0x8985e8] ; 0x100b7fdc3 emoteCloudPuffsFaint
0x1002e77db: mov edx, 0x40
0x1002e77e0: mov rdi, r13
0x1002e77e3: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e77e8: movsx edi, byte ptr [rbp - 0x70]
0x1002e77ec: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e77f1: mov byte ptr [rbp - 0x70], al
0x1002e77f4: mov rdx, qword ptr [rip + 0x1b07e6d] ; 0x101def668
0x1002e77fb: mov esi, 0x120
0x1002e7800: mov ecx, 0x10
0x1002e7805: mov rdi, r15
0x1002e7808: call 0x100795530 ; 0x100795530
0x1002e780d: vmovaps xmm0, xmmword ptr [rip + 0x7c564b] ; 0x100aace60
0x1002e7815: vmovups xmmword ptr [rax], xmm0
0x1002e7819: mov byte ptr [rax + 0x10], 0
0x1002e781d: mov byte ptr [rax + 0x11], 1
0x1002e7821: mov byte ptr [rax + 0x12], 0
0x1002e7825: mov dword ptr [rax + 0x14], 0
0x1002e782c: mov dword ptr [rax + 0x18], 0
0x1002e7833: vxorps xmm0, xmm0, xmm0
0x1002e7837: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e783c: mov dword ptr [rax + 0x28], 0
0x1002e7843: vmovaps xmm0, xmmword ptr [rip + 0x7d1e65] ; 0x100ab96b0
0x1002e784b: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e7850: mov byte ptr [rax + 0x40], 0
0x1002e7854: vxorps ymm0, ymm0, ymm0
0x1002e7858: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e7860: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e7865: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e786a: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e7874: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e787e: vmovaps xmm0, xmmword ptr [rbx]
0x1002e7882: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e788a: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e7892: vxorps xmm0, xmm0, xmm0
0x1002e7896: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e789e: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e78a8: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e78b0: mov dword ptr [rax + 0xf4], 0
0x1002e78ba: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e78c4: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e78cc: mov dword ptr [rax + 0x10c], 0
0x1002e78d6: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e78e0: mov byte ptr [rax + 0x114], 1
0x1002e78e7: mov dword ptr [rax + 0x118], 0
0x1002e78f1: mov dword ptr [rax + 0x11c], 0
0x1002e78fb: mov qword ptr [rip + 0x1b08096], rax ; 0x101def998
0x1002e7902: mov rdi, r12
0x1002e7905: mov rsi, rax
0x1002e7908: mov rdx, r13
0x1002e790b: vzeroupper 
0x1002e790e: call 0x100314920 ; 0x100314920
0x1002e7913: lea rsi, [rip + 0x8984be] ; 0x100b7fdd8 emoteCloudPuffsThumbsUp
0x1002e791a: mov edx, 0x40
0x1002e791f: mov rdi, r13
0x1002e7922: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e7927: movsx edi, byte ptr [rbp - 0x70]
0x1002e792b: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e7930: mov byte ptr [rbp - 0x70], al
0x1002e7933: mov rdx, qword ptr [rip + 0x1b07d2e] ; 0x101def668
0x1002e793a: mov esi, 0x120
0x1002e793f: mov ecx, 0x10
0x1002e7944: mov rdi, r15
0x1002e7947: call 0x100795530 ; 0x100795530
0x1002e794c: vmovaps xmm0, xmmword ptr [rip + 0x7c550c] ; 0x100aace60
0x1002e7954: vmovups xmmword ptr [rax], xmm0
0x1002e7958: mov byte ptr [rax + 0x10], 0
0x1002e795c: mov byte ptr [rax + 0x11], 1
0x1002e7960: mov byte ptr [rax + 0x12], 0
0x1002e7964: mov dword ptr [rax + 0x14], 0
0x1002e796b: mov dword ptr [rax + 0x18], 0
0x1002e7972: vxorps xmm0, xmm0, xmm0
0x1002e7976: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e797b: mov dword ptr [rax + 0x28], 0
0x1002e7982: vmovaps xmm0, xmmword ptr [rip + 0x7d1d26] ; 0x100ab96b0
0x1002e798a: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e798f: mov byte ptr [rax + 0x40], 0
0x1002e7993: vxorps ymm0, ymm0, ymm0
0x1002e7997: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e799f: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e79a4: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e79a9: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e79b3: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e79bd: vmovaps xmm0, xmmword ptr [rbx]
0x1002e79c1: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e79c9: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e79d1: vxorps xmm0, xmm0, xmm0
0x1002e79d5: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e79dd: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e79e7: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e79ef: mov dword ptr [rax + 0xf4], 0
0x1002e79f9: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e7a03: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e7a0b: mov dword ptr [rax + 0x10c], 0
0x1002e7a15: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e7a1f: mov byte ptr [rax + 0x114], 1
0x1002e7a26: mov dword ptr [rax + 0x118], 0
0x1002e7a30: mov dword ptr [rax + 0x11c], 0
0x1002e7a3a: mov qword ptr [rip + 0x1b07f5f], rax ; 0x101def9a0
0x1002e7a41: mov rdi, r12
0x1002e7a44: mov rsi, rax
0x1002e7a47: mov rdx, r13
0x1002e7a4a: vzeroupper 
0x1002e7a4d: call 0x100314920 ; 0x100314920
0x1002e7a52: lea rsi, [rip + 0x898397] ; 0x100b7fdf0 upgradecape
0x1002e7a59: mov edx, 0x40
0x1002e7a5e: mov rdi, r13
0x1002e7a61: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e7a66: movsx edi, byte ptr [rbp - 0x70]
0x1002e7a6a: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e7a6f: mov byte ptr [rbp - 0x70], al
0x1002e7a72: mov rdx, qword ptr [rip + 0x1b07bef] ; 0x101def668
0x1002e7a79: mov esi, 0x120
0x1002e7a7e: mov ecx, 0x10
0x1002e7a83: mov rdi, r15
0x1002e7a86: call 0x100795530 ; 0x100795530
0x1002e7a8b: vmovaps xmm0, xmmword ptr [rip + 0x7c53cd] ; 0x100aace60
0x1002e7a93: vmovups xmmword ptr [rax], xmm0
0x1002e7a97: mov byte ptr [rax + 0x10], 0
0x1002e7a9b: mov byte ptr [rax + 0x11], 1
0x1002e7a9f: mov byte ptr [rax + 0x12], 0
0x1002e7aa3: mov dword ptr [rax + 0x14], 0
0x1002e7aaa: mov dword ptr [rax + 0x18], 0
0x1002e7ab1: vxorps xmm0, xmm0, xmm0
0x1002e7ab5: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e7aba: mov dword ptr [rax + 0x28], 0
0x1002e7ac1: vmovaps xmm0, xmmword ptr [rip + 0x7d1be7] ; 0x100ab96b0
0x1002e7ac9: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e7ace: mov byte ptr [rax + 0x40], 0
0x1002e7ad2: vxorps ymm0, ymm0, ymm0
0x1002e7ad6: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e7ade: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e7ae3: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e7ae8: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e7af2: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e7afc: vmovaps xmm0, xmmword ptr [rbx]
0x1002e7b00: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e7b08: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e7b10: vxorps xmm0, xmm0, xmm0
0x1002e7b14: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e7b1c: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e7b26: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e7b2e: mov dword ptr [rax + 0xf4], 0
0x1002e7b38: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e7b42: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e7b4a: mov dword ptr [rax + 0x10c], 0
0x1002e7b54: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e7b5e: mov byte ptr [rax + 0x114], 1
0x1002e7b65: mov dword ptr [rax + 0x118], 0
0x1002e7b6f: mov dword ptr [rax + 0x11c], 0
0x1002e7b79: mov qword ptr [rip + 0x1b07e28], rax ; 0x101def9a8
0x1002e7b80: mov rdi, r12
0x1002e7b83: mov rsi, rax
0x1002e7b86: mov rdx, r13
0x1002e7b89: vzeroupper 
0x1002e7b8c: call 0x100314920 ; 0x100314920
0x1002e7b91: lea rsi, [rip + 0x898264] ; 0x100b7fdfc emoteZZZFaint
0x1002e7b98: mov edx, 0x40
0x1002e7b9d: mov rdi, r13
0x1002e7ba0: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e7ba5: movsx edi, byte ptr [rbp - 0x70]
0x1002e7ba9: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e7bae: mov byte ptr [rbp - 0x70], al
0x1002e7bb1: mov rdx, qword ptr [rip + 0x1b07ab0] ; 0x101def668
0x1002e7bb8: mov esi, 0x120
0x1002e7bbd: mov ecx, 0x10
0x1002e7bc2: mov rdi, r15
0x1002e7bc5: call 0x100795530 ; 0x100795530
0x1002e7bca: vmovaps xmm0, xmmword ptr [rip + 0x7c528e] ; 0x100aace60
0x1002e7bd2: vmovups xmmword ptr [rax], xmm0
0x1002e7bd6: mov byte ptr [rax + 0x10], 0
0x1002e7bda: mov byte ptr [rax + 0x11], 1
0x1002e7bde: mov byte ptr [rax + 0x12], 0
0x1002e7be2: mov dword ptr [rax + 0x14], 0
0x1002e7be9: mov dword ptr [rax + 0x18], 0
0x1002e7bf0: vxorps xmm0, xmm0, xmm0
0x1002e7bf4: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e7bf9: mov dword ptr [rax + 0x28], 0
0x1002e7c00: vmovaps xmm0, xmmword ptr [rip + 0x7d1aa8] ; 0x100ab96b0
0x1002e7c08: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e7c0d: mov byte ptr [rax + 0x40], 0
0x1002e7c11: vxorps ymm0, ymm0, ymm0
0x1002e7c15: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e7c1d: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e7c22: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e7c27: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e7c31: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e7c3b: vmovaps xmm0, xmmword ptr [rbx]
0x1002e7c3f: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e7c47: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e7c4f: vxorps xmm0, xmm0, xmm0
0x1002e7c53: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e7c5b: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e7c65: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e7c6d: mov dword ptr [rax + 0xf4], 0
0x1002e7c77: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e7c81: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e7c89: mov dword ptr [rax + 0x10c], 0
0x1002e7c93: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e7c9d: mov byte ptr [rax + 0x114], 1
0x1002e7ca4: mov dword ptr [rax + 0x118], 0
0x1002e7cae: mov dword ptr [rax + 0x11c], 0
0x1002e7cb8: mov qword ptr [rip + 0x1b07cf1], rax ; 0x101def9b0
0x1002e7cbf: mov rdi, r12
0x1002e7cc2: mov rsi, rax
0x1002e7cc5: mov rdx, r13
0x1002e7cc8: vzeroupper 
0x1002e7ccb: call 0x100314920 ; 0x100314920
0x1002e7cd0: lea rsi, [rip + 0x898133] ; 0x100b7fe0a emoteAlertDuck
0x1002e7cd7: mov edx, 0x40
0x1002e7cdc: mov rdi, r13
0x1002e7cdf: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e7ce4: movsx edi, byte ptr [rbp - 0x70]
0x1002e7ce8: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e7ced: mov byte ptr [rbp - 0x70], al
0x1002e7cf0: mov rdx, qword ptr [rip + 0x1b07971] ; 0x101def668
0x1002e7cf7: mov esi, 0x120
0x1002e7cfc: mov ecx, 0x10
0x1002e7d01: mov rdi, r15
0x1002e7d04: call 0x100795530 ; 0x100795530
0x1002e7d09: vmovaps xmm0, xmmword ptr [rip + 0x7c514f] ; 0x100aace60
0x1002e7d11: vmovups xmmword ptr [rax], xmm0
0x1002e7d15: mov byte ptr [rax + 0x10], 0
0x1002e7d19: mov byte ptr [rax + 0x11], 1
0x1002e7d1d: mov byte ptr [rax + 0x12], 0
0x1002e7d21: mov dword ptr [rax + 0x14], 0
0x1002e7d28: mov dword ptr [rax + 0x18], 0
0x1002e7d2f: vxorps xmm0, xmm0, xmm0
0x1002e7d33: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e7d38: mov dword ptr [rax + 0x28], 0
0x1002e7d3f: vmovaps xmm0, xmmword ptr [rip + 0x7d1969] ; 0x100ab96b0
0x1002e7d47: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e7d4c: mov byte ptr [rax + 0x40], 0
0x1002e7d50: vxorps ymm0, ymm0, ymm0
0x1002e7d54: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e7d5c: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e7d61: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e7d66: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e7d70: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e7d7a: vmovaps xmm0, xmmword ptr [rbx]
0x1002e7d7e: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e7d86: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e7d8e: vxorps xmm0, xmm0, xmm0
0x1002e7d92: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e7d9a: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e7da4: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e7dac: mov dword ptr [rax + 0xf4], 0
0x1002e7db6: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e7dc0: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e7dc8: mov dword ptr [rax + 0x10c], 0
0x1002e7dd2: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e7ddc: mov byte ptr [rax + 0x114], 1
0x1002e7de3: mov dword ptr [rax + 0x118], 0
0x1002e7ded: mov dword ptr [rax + 0x11c], 0
0x1002e7df7: mov qword ptr [rip + 0x1b07bba], rax ; 0x101def9b8
0x1002e7dfe: mov rdi, r12
0x1002e7e01: mov rsi, rax
0x1002e7e04: mov rdx, r13
0x1002e7e07: vzeroupper 
0x1002e7e0a: call 0x100314920 ; 0x100314920
0x1002e7e0f: lea rsi, [rip + 0x898003] ; 0x100b7fe19 emoteQuestionOne
0x1002e7e16: mov edx, 0x40
0x1002e7e1b: mov rdi, r13
0x1002e7e1e: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e7e23: movsx edi, byte ptr [rbp - 0x70]
0x1002e7e27: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e7e2c: mov byte ptr [rbp - 0x70], al
0x1002e7e2f: mov rdx, qword ptr [rip + 0x1b07832] ; 0x101def668
0x1002e7e36: mov esi, 0x120
0x1002e7e3b: mov ecx, 0x10
0x1002e7e40: mov rdi, r15
0x1002e7e43: call 0x100795530 ; 0x100795530
0x1002e7e48: vmovaps xmm0, xmmword ptr [rip + 0x7c5010] ; 0x100aace60
0x1002e7e50: vmovups xmmword ptr [rax], xmm0
0x1002e7e54: mov byte ptr [rax + 0x10], 0
0x1002e7e58: mov byte ptr [rax + 0x11], 1
0x1002e7e5c: mov byte ptr [rax + 0x12], 0
0x1002e7e60: mov dword ptr [rax + 0x14], 0
0x1002e7e67: mov dword ptr [rax + 0x18], 0
0x1002e7e6e: vxorps xmm0, xmm0, xmm0
0x1002e7e72: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e7e77: mov dword ptr [rax + 0x28], 0
0x1002e7e7e: vmovaps xmm0, xmmword ptr [rip + 0x7d182a] ; 0x100ab96b0
0x1002e7e86: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e7e8b: mov byte ptr [rax + 0x40], 0
0x1002e7e8f: vxorps ymm0, ymm0, ymm0
0x1002e7e93: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e7e9b: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e7ea0: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e7ea5: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e7eaf: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e7eb9: vmovaps xmm0, xmmword ptr [rbx]
0x1002e7ebd: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e7ec5: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e7ecd: vxorps xmm0, xmm0, xmm0
0x1002e7ed1: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e7ed9: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e7ee3: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e7eeb: mov dword ptr [rax + 0xf4], 0
0x1002e7ef5: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e7eff: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e7f07: mov dword ptr [rax + 0x10c], 0
0x1002e7f11: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e7f1b: mov byte ptr [rax + 0x114], 1
0x1002e7f22: mov dword ptr [rax + 0x118], 0
0x1002e7f2c: mov dword ptr [rax + 0x11c], 0
0x1002e7f36: mov qword ptr [rip + 0x1b07a83], rax ; 0x101def9c0
0x1002e7f3d: mov rdi, r12
0x1002e7f40: mov rsi, rax
0x1002e7f43: mov rdx, r13
0x1002e7f46: vzeroupper 
0x1002e7f49: call 0x100314920 ; 0x100314920
0x1002e7f4e: lea rsi, [rip + 0x897ed5] ; 0x100b7fe2a emoteLightbulbThinkOne
0x1002e7f55: mov edx, 0x40
0x1002e7f5a: mov rdi, r13
0x1002e7f5d: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e7f62: movsx edi, byte ptr [rbp - 0x70]
0x1002e7f66: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e7f6b: mov byte ptr [rbp - 0x70], al
0x1002e7f6e: mov rdx, qword ptr [rip + 0x1b076f3] ; 0x101def668
0x1002e7f75: mov esi, 0x120
0x1002e7f7a: mov ecx, 0x10
0x1002e7f7f: mov rdi, r15
0x1002e7f82: call 0x100795530 ; 0x100795530
0x1002e7f87: vmovaps xmm0, xmmword ptr [rip + 0x7c4ed1] ; 0x100aace60
0x1002e7f8f: vmovups xmmword ptr [rax], xmm0
0x1002e7f93: mov byte ptr [rax + 0x10], 0
0x1002e7f97: mov byte ptr [rax + 0x11], 1
0x1002e7f9b: mov byte ptr [rax + 0x12], 0
0x1002e7f9f: mov dword ptr [rax + 0x14], 0
0x1002e7fa6: mov dword ptr [rax + 0x18], 0
0x1002e7fad: vxorps xmm0, xmm0, xmm0
0x1002e7fb1: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e7fb6: mov dword ptr [rax + 0x28], 0
0x1002e7fbd: vmovaps xmm0, xmmword ptr [rip + 0x7d16eb] ; 0x100ab96b0
0x1002e7fc5: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e7fca: mov byte ptr [rax + 0x40], 0
0x1002e7fce: vxorps ymm0, ymm0, ymm0
0x1002e7fd2: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e7fda: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e7fdf: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e7fe4: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e7fee: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e7ff8: vmovaps xmm0, xmmword ptr [rbx]
0x1002e7ffc: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e8004: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e800c: vxorps xmm0, xmm0, xmm0
0x1002e8010: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e8018: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e8022: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e802a: mov dword ptr [rax + 0xf4], 0
0x1002e8034: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e803e: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e8046: mov dword ptr [rax + 0x10c], 0
0x1002e8050: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e805a: mov byte ptr [rax + 0x114], 1
0x1002e8061: mov dword ptr [rax + 0x118], 0
0x1002e806b: mov dword ptr [rax + 0x11c], 0
0x1002e8075: mov qword ptr [rip + 0x1b0794c], rax ; 0x101def9c8
0x1002e807c: mov rdi, r12
0x1002e807f: mov rsi, rax
0x1002e8082: mov rdx, r13
0x1002e8085: vzeroupper 
0x1002e8088: call 0x100314920 ; 0x100314920
0x1002e808d: lea rsi, [rip + 0x897dad] ; 0x100b7fe41 emoteClap
0x1002e8094: mov edx, 0x40
0x1002e8099: mov rdi, r13
0x1002e809c: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e80a1: movsx edi, byte ptr [rbp - 0x70]
0x1002e80a5: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e80aa: mov byte ptr [rbp - 0x70], al
0x1002e80ad: mov rdx, qword ptr [rip + 0x1b075b4] ; 0x101def668
0x1002e80b4: mov esi, 0x120
0x1002e80b9: mov ecx, 0x10
0x1002e80be: mov rdi, r15
0x1002e80c1: call 0x100795530 ; 0x100795530
0x1002e80c6: vmovaps xmm0, xmmword ptr [rip + 0x7c4d92] ; 0x100aace60
0x1002e80ce: vmovups xmmword ptr [rax], xmm0
0x1002e80d2: mov byte ptr [rax + 0x10], 0
0x1002e80d6: mov byte ptr [rax + 0x11], 1
0x1002e80da: mov byte ptr [rax + 0x12], 0
0x1002e80de: mov dword ptr [rax + 0x14], 0
0x1002e80e5: mov dword ptr [rax + 0x18], 0
0x1002e80ec: vxorps xmm0, xmm0, xmm0
0x1002e80f0: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e80f5: mov dword ptr [rax + 0x28], 0
0x1002e80fc: vmovaps xmm0, xmmword ptr [rip + 0x7d15ac] ; 0x100ab96b0
0x1002e8104: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e8109: mov byte ptr [rax + 0x40], 0
0x1002e810d: vxorps ymm0, ymm0, ymm0
0x1002e8111: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e8119: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e811e: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e8123: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e812d: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e8137: vmovaps xmm0, xmmword ptr [rbx]
0x1002e813b: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e8143: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e814b: vxorps xmm0, xmm0, xmm0
0x1002e814f: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e8157: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e8161: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e8169: mov dword ptr [rax + 0xf4], 0
0x1002e8173: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e817d: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e8185: mov dword ptr [rax + 0x10c], 0
0x1002e818f: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e8199: mov byte ptr [rax + 0x114], 1
0x1002e81a0: mov dword ptr [rax + 0x118], 0
0x1002e81aa: mov dword ptr [rax + 0x11c], 0
0x1002e81b4: mov qword ptr [rip + 0x1b07815], rax ; 0x101def9d0
0x1002e81bb: mov rdi, r12
0x1002e81be: mov rsi, rax
0x1002e81c1: mov rdx, r13
0x1002e81c4: vzeroupper 
0x1002e81c7: call 0x100314920 ; 0x100314920
0x1002e81cc: lea rsi, [rip + 0x897c78] ; 0x100b7fe4b emoteZZZYawn
0x1002e81d3: mov edx, 0x40
0x1002e81d8: mov rdi, r13
0x1002e81db: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e81e0: movsx edi, byte ptr [rbp - 0x70]
0x1002e81e4: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e81e9: mov byte ptr [rbp - 0x70], al
0x1002e81ec: mov rdx, qword ptr [rip + 0x1b07475] ; 0x101def668
0x1002e81f3: mov esi, 0x120
0x1002e81f8: mov ecx, 0x10
0x1002e81fd: mov rdi, r15
0x1002e8200: call 0x100795530 ; 0x100795530
0x1002e8205: vmovaps xmm0, xmmword ptr [rip + 0x7c4c53] ; 0x100aace60
0x1002e820d: vmovups xmmword ptr [rax], xmm0
0x1002e8211: mov byte ptr [rax + 0x10], 0
0x1002e8215: mov byte ptr [rax + 0x11], 1
0x1002e8219: mov byte ptr [rax + 0x12], 0
0x1002e821d: mov dword ptr [rax + 0x14], 0
0x1002e8224: mov dword ptr [rax + 0x18], 0
0x1002e822b: vxorps xmm0, xmm0, xmm0
0x1002e822f: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e8234: mov dword ptr [rax + 0x28], 0
0x1002e823b: vmovaps xmm0, xmmword ptr [rip + 0x7d146d] ; 0x100ab96b0
0x1002e8243: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e8248: mov byte ptr [rax + 0x40], 0
0x1002e824c: vxorps ymm0, ymm0, ymm0
0x1002e8250: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e8258: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e825d: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e8262: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e826c: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e8276: vmovaps xmm0, xmmword ptr [rbx]
0x1002e827a: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e8282: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e828a: vxorps xmm0, xmm0, xmm0
0x1002e828e: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e8296: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e82a0: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e82a8: mov dword ptr [rax + 0xf4], 0
0x1002e82b2: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e82bc: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e82c4: mov dword ptr [rax + 0x10c], 0
0x1002e82ce: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e82d8: mov byte ptr [rax + 0x114], 1
0x1002e82df: mov dword ptr [rax + 0x118], 0
0x1002e82e9: mov dword ptr [rax + 0x11c], 0
0x1002e82f3: mov qword ptr [rip + 0x1b076de], rax ; 0x101def9d8
0x1002e82fa: mov rdi, r12
0x1002e82fd: mov rsi, rax
0x1002e8300: mov rdx, r13
0x1002e8303: vzeroupper 
0x1002e8306: call 0x100314920 ; 0x100314920
0x1002e830b: lea rsi, [rip + 0x897b46] ; 0x100b7fe58 emoteBlueHeadGlowShy
0x1002e8312: mov edx, 0x40
0x1002e8317: mov rdi, r13
0x1002e831a: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e831f: movsx edi, byte ptr [rbp - 0x70]
0x1002e8323: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e8328: mov byte ptr [rbp - 0x70], al
0x1002e832b: mov rdx, qword ptr [rip + 0x1b07336] ; 0x101def668
0x1002e8332: mov esi, 0x120
0x1002e8337: mov ecx, 0x10
0x1002e833c: mov rdi, r15
0x1002e833f: call 0x100795530 ; 0x100795530
0x1002e8344: vmovaps xmm0, xmmword ptr [rip + 0x7c4b14] ; 0x100aace60
0x1002e834c: vmovups xmmword ptr [rax], xmm0
0x1002e8350: mov byte ptr [rax + 0x10], 0
0x1002e8354: mov byte ptr [rax + 0x11], 1
0x1002e8358: mov byte ptr [rax + 0x12], 0
0x1002e835c: mov dword ptr [rax + 0x14], 0
0x1002e8363: mov dword ptr [rax + 0x18], 0
0x1002e836a: vxorps xmm0, xmm0, xmm0
0x1002e836e: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e8373: mov dword ptr [rax + 0x28], 0
0x1002e837a: vmovaps xmm0, xmmword ptr [rip + 0x7d132e] ; 0x100ab96b0
0x1002e8382: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e8387: mov byte ptr [rax + 0x40], 0
0x1002e838b: vxorps ymm0, ymm0, ymm0
0x1002e838f: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e8397: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e839c: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e83a1: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e83ab: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e83b5: vmovaps xmm0, xmmword ptr [rbx]
0x1002e83b9: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e83c1: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e83c9: vxorps xmm0, xmm0, xmm0
0x1002e83cd: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e83d5: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e83df: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e83e7: mov dword ptr [rax + 0xf4], 0
0x1002e83f1: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e83fb: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e8403: mov dword ptr [rax + 0x10c], 0
0x1002e840d: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e8417: mov byte ptr [rax + 0x114], 1
0x1002e841e: mov dword ptr [rax + 0x118], 0
0x1002e8428: mov dword ptr [rax + 0x11c], 0
0x1002e8432: mov qword ptr [rip + 0x1b075a7], rax ; 0x101def9e0
0x1002e8439: mov rdi, r12
0x1002e843c: mov rsi, rax
0x1002e843f: mov rdx, r13
0x1002e8442: vzeroupper 
0x1002e8445: call 0x100314920 ; 0x100314920
0x1002e844a: lea rsi, [rip + 0x897a1c] ; 0x100b7fe6d emotePout
0x1002e8451: mov edx, 0x40
0x1002e8456: mov rdi, r13
0x1002e8459: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e845e: movsx edi, byte ptr [rbp - 0x70]
0x1002e8462: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e8467: mov byte ptr [rbp - 0x70], al
0x1002e846a: mov rdx, qword ptr [rip + 0x1b071f7] ; 0x101def668
0x1002e8471: mov esi, 0x120
0x1002e8476: mov ecx, 0x10
0x1002e847b: mov rdi, r15
0x1002e847e: call 0x100795530 ; 0x100795530
0x1002e8483: vmovaps xmm0, xmmword ptr [rip + 0x7c49d5] ; 0x100aace60
0x1002e848b: vmovups xmmword ptr [rax], xmm0
0x1002e848f: mov byte ptr [rax + 0x10], 0
0x1002e8493: mov byte ptr [rax + 0x11], 1
0x1002e8497: mov byte ptr [rax + 0x12], 0
0x1002e849b: mov dword ptr [rax + 0x14], 0
0x1002e84a2: mov dword ptr [rax + 0x18], 0
0x1002e84a9: vxorps xmm0, xmm0, xmm0
0x1002e84ad: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e84b2: mov dword ptr [rax + 0x28], 0
0x1002e84b9: vmovaps xmm0, xmmword ptr [rip + 0x7d11ef] ; 0x100ab96b0
0x1002e84c1: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e84c6: mov byte ptr [rax + 0x40], 0
0x1002e84ca: vxorps ymm0, ymm0, ymm0
0x1002e84ce: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e84d6: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e84db: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e84e0: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e84ea: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e84f4: vmovaps xmm0, xmmword ptr [rbx]
0x1002e84f8: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e8500: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e8508: vxorps xmm0, xmm0, xmm0
0x1002e850c: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e8514: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e851e: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e8526: mov dword ptr [rax + 0xf4], 0
0x1002e8530: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e853a: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e8542: mov dword ptr [rax + 0x10c], 0
0x1002e854c: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e8556: mov byte ptr [rax + 0x114], 1
0x1002e855d: mov dword ptr [rax + 0x118], 0
0x1002e8567: mov dword ptr [rax + 0x11c], 0
0x1002e8571: mov qword ptr [rip + 0x1b07470], rax ; 0x101def9e8
0x1002e8578: mov rdi, r12
0x1002e857b: mov rsi, rax
0x1002e857e: mov rdx, r13
0x1002e8581: vzeroupper 
0x1002e8584: call 0x100314920 ; 0x100314920
0x1002e8589: lea rsi, [rip + 0x8978e7] ; 0x100b7fe77 emoteHaHaLaughOne
0x1002e8590: mov edx, 0x40
0x1002e8595: mov rdi, r13
0x1002e8598: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e859d: movsx edi, byte ptr [rbp - 0x70]
0x1002e85a1: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e85a6: mov byte ptr [rbp - 0x70], al
0x1002e85a9: mov rdx, qword ptr [rip + 0x1b070b8] ; 0x101def668
0x1002e85b0: mov esi, 0x120
0x1002e85b5: mov ecx, 0x10
0x1002e85ba: mov rdi, r15
0x1002e85bd: call 0x100795530 ; 0x100795530
0x1002e85c2: vmovaps xmm0, xmmword ptr [rip + 0x7c4896] ; 0x100aace60
0x1002e85ca: vmovups xmmword ptr [rax], xmm0
0x1002e85ce: mov byte ptr [rax + 0x10], 0
0x1002e85d2: mov byte ptr [rax + 0x11], 1
0x1002e85d6: mov byte ptr [rax + 0x12], 0
0x1002e85da: mov dword ptr [rax + 0x14], 0
0x1002e85e1: mov dword ptr [rax + 0x18], 0
0x1002e85e8: vxorps xmm0, xmm0, xmm0
0x1002e85ec: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e85f1: mov dword ptr [rax + 0x28], 0
0x1002e85f8: vmovaps xmm0, xmmword ptr [rip + 0x7d10b0] ; 0x100ab96b0
0x1002e8600: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e8605: mov byte ptr [rax + 0x40], 0
0x1002e8609: vxorps ymm0, ymm0, ymm0
0x1002e860d: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e8615: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e861a: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e861f: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e8629: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e8633: vmovaps xmm0, xmmword ptr [rbx]
0x1002e8637: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e863f: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e8647: vxorps xmm0, xmm0, xmm0
0x1002e864b: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e8653: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e865d: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e8665: mov dword ptr [rax + 0xf4], 0
0x1002e866f: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e8679: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e8681: mov dword ptr [rax + 0x10c], 0
0x1002e868b: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e8695: mov byte ptr [rax + 0x114], 1
0x1002e869c: mov dword ptr [rax + 0x118], 0
0x1002e86a6: mov dword ptr [rax + 0x11c], 0
0x1002e86b0: mov qword ptr [rip + 0x1b07339], rax ; 0x101def9f0
0x1002e86b7: mov rdi, r12
0x1002e86ba: mov rsi, rax
0x1002e86bd: mov rdx, r13
0x1002e86c0: vzeroupper 
0x1002e86c3: call 0x100314920 ; 0x100314920
0x1002e86c8: lea rsi, [rip + 0x8977ba] ; 0x100b7fe89 emoteAngryVeinOne
0x1002e86cf: mov edx, 0x40
0x1002e86d4: mov rdi, r13
0x1002e86d7: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e86dc: movsx edi, byte ptr [rbp - 0x70]
0x1002e86e0: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e86e5: mov byte ptr [rbp - 0x70], al
0x1002e86e8: mov rdx, qword ptr [rip + 0x1b06f79] ; 0x101def668
0x1002e86ef: mov esi, 0x120
0x1002e86f4: mov ecx, 0x10
0x1002e86f9: mov rdi, r15
0x1002e86fc: call 0x100795530 ; 0x100795530
0x1002e8701: vmovaps xmm0, xmmword ptr [rip + 0x7c4757] ; 0x100aace60
0x1002e8709: vmovups xmmword ptr [rax], xmm0
0x1002e870d: mov byte ptr [rax + 0x10], 0
0x1002e8711: mov byte ptr [rax + 0x11], 1
0x1002e8715: mov byte ptr [rax + 0x12], 0
0x1002e8719: mov dword ptr [rax + 0x14], 0
0x1002e8720: mov dword ptr [rax + 0x18], 0
0x1002e8727: vxorps xmm0, xmm0, xmm0
0x1002e872b: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e8730: mov dword ptr [rax + 0x28], 0
0x1002e8737: vmovaps xmm0, xmmword ptr [rip + 0x7d0f71] ; 0x100ab96b0
0x1002e873f: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e8744: mov byte ptr [rax + 0x40], 0
0x1002e8748: vxorps ymm0, ymm0, ymm0
0x1002e874c: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e8754: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e8759: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e875e: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e8768: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e8772: vmovaps xmm0, xmmword ptr [rbx]
0x1002e8776: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e877e: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e8786: vxorps xmm0, xmm0, xmm0
0x1002e878a: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e8792: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e879c: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e87a4: mov dword ptr [rax + 0xf4], 0
0x1002e87ae: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e87b8: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e87c0: mov dword ptr [rax + 0x10c], 0
0x1002e87ca: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e87d4: mov byte ptr [rax + 0x114], 1
0x1002e87db: mov dword ptr [rax + 0x118], 0
0x1002e87e5: mov dword ptr [rax + 0x11c], 0
0x1002e87ef: mov qword ptr [rip + 0x1b07202], rax ; 0x101def9f8
0x1002e87f6: mov rdi, r12
0x1002e87f9: mov rsi, rax
0x1002e87fc: mov rdx, r13
0x1002e87ff: vzeroupper 
0x1002e8802: call 0x100314920 ; 0x100314920
0x1002e8807: lea rsi, [rip + 0x89768d] ; 0x100b7fe9b emoteGlowApologize
0x1002e880e: mov edx, 0x40
0x1002e8813: mov rdi, r13
0x1002e8816: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e881b: movsx edi, byte ptr [rbp - 0x70]
0x1002e881f: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e8824: mov byte ptr [rbp - 0x70], al
0x1002e8827: mov rdx, qword ptr [rip + 0x1b06e3a] ; 0x101def668
0x1002e882e: mov esi, 0x120
0x1002e8833: mov ecx, 0x10
0x1002e8838: mov rdi, r15
0x1002e883b: call 0x100795530 ; 0x100795530
0x1002e8840: vmovaps xmm0, xmmword ptr [rip + 0x7c4618] ; 0x100aace60
0x1002e8848: vmovups xmmword ptr [rax], xmm0
0x1002e884c: mov byte ptr [rax + 0x10], 0
0x1002e8850: mov byte ptr [rax + 0x11], 1
0x1002e8854: mov byte ptr [rax + 0x12], 0
0x1002e8858: mov dword ptr [rax + 0x14], 0
0x1002e885f: mov dword ptr [rax + 0x18], 0
0x1002e8866: vxorps xmm0, xmm0, xmm0
0x1002e886a: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e886f: mov dword ptr [rax + 0x28], 0
0x1002e8876: vmovaps xmm0, xmmword ptr [rip + 0x7d0e32] ; 0x100ab96b0
0x1002e887e: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e8883: mov byte ptr [rax + 0x40], 0
0x1002e8887: vxorps ymm0, ymm0, ymm0
0x1002e888b: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e8893: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e8898: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e889d: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e88a7: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e88b1: vmovaps xmm0, xmmword ptr [rbx]
0x1002e88b5: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e88bd: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e88c5: vxorps xmm0, xmm0, xmm0
0x1002e88c9: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e88d1: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e88db: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e88e3: mov dword ptr [rax + 0xf4], 0
0x1002e88ed: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e88f7: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e88ff: mov dword ptr [rax + 0x10c], 0
0x1002e8909: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e8913: mov byte ptr [rax + 0x114], 1
0x1002e891a: mov dword ptr [rax + 0x118], 0
0x1002e8924: mov dword ptr [rax + 0x11c], 0
0x1002e892e: mov qword ptr [rip + 0x1b070cb], rax ; 0x101defa00
0x1002e8935: mov rdi, r12
0x1002e8938: mov rsi, rax
0x1002e893b: mov rdx, r13
0x1002e893e: vzeroupper 
0x1002e8941: call 0x100314920 ; 0x100314920
0x1002e8946: lea rsi, [rip + 0x897561] ; 0x100b7feae emoteWaveMedium
0x1002e894d: mov edx, 0x40
0x1002e8952: mov rdi, r13
0x1002e8955: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e895a: movsx edi, byte ptr [rbp - 0x70]
0x1002e895e: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e8963: mov byte ptr [rbp - 0x70], al
0x1002e8966: mov rdx, qword ptr [rip + 0x1b06cfb] ; 0x101def668
0x1002e896d: mov esi, 0x120
0x1002e8972: mov ecx, 0x10
0x1002e8977: mov rdi, r15
0x1002e897a: call 0x100795530 ; 0x100795530
0x1002e897f: vmovaps xmm0, xmmword ptr [rip + 0x7c44d9] ; 0x100aace60
0x1002e8987: vmovups xmmword ptr [rax], xmm0
0x1002e898b: mov byte ptr [rax + 0x10], 0
0x1002e898f: mov byte ptr [rax + 0x11], 1
0x1002e8993: mov byte ptr [rax + 0x12], 0
0x1002e8997: mov dword ptr [rax + 0x14], 0
0x1002e899e: mov dword ptr [rax + 0x18], 0
0x1002e89a5: vxorps xmm0, xmm0, xmm0
0x1002e89a9: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e89ae: mov dword ptr [rax + 0x28], 0
0x1002e89b5: vmovaps xmm0, xmmword ptr [rip + 0x7d0cf3] ; 0x100ab96b0
0x1002e89bd: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e89c2: mov byte ptr [rax + 0x40], 0
0x1002e89c6: vxorps ymm0, ymm0, ymm0
0x1002e89ca: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e89d2: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e89d7: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e89dc: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e89e6: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e89f0: vmovaps xmm0, xmmword ptr [rbx]
0x1002e89f4: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e89fc: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e8a04: vxorps xmm0, xmm0, xmm0
0x1002e8a08: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e8a10: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e8a1a: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e8a22: mov dword ptr [rax + 0xf4], 0
0x1002e8a2c: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e8a36: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e8a3e: mov dword ptr [rax + 0x10c], 0
0x1002e8a48: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e8a52: mov byte ptr [rax + 0x114], 1
0x1002e8a59: mov dword ptr [rax + 0x118], 0
0x1002e8a63: mov dword ptr [rax + 0x11c], 0
0x1002e8a6d: mov qword ptr [rip + 0x1b06f94], rax ; 0x101defa08
0x1002e8a74: mov rdi, r12
0x1002e8a77: mov rsi, rax
0x1002e8a7a: mov rdx, r13
0x1002e8a7d: vzeroupper 
0x1002e8a80: call 0x100314920 ; 0x100314920
0x1002e8a85: lea rsi, [rip + 0x897432] ; 0x100b7febe emoteRedBallDance
0x1002e8a8c: mov edx, 0x40
0x1002e8a91: mov rdi, r13
0x1002e8a94: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e8a99: movsx edi, byte ptr [rbp - 0x70]
0x1002e8a9d: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e8aa2: mov byte ptr [rbp - 0x70], al
0x1002e8aa5: mov rdx, qword ptr [rip + 0x1b06bbc] ; 0x101def668
0x1002e8aac: mov esi, 0x120
0x1002e8ab1: mov ecx, 0x10
0x1002e8ab6: mov rdi, r15
0x1002e8ab9: call 0x100795530 ; 0x100795530
0x1002e8abe: vmovaps xmm0, xmmword ptr [rip + 0x7c439a] ; 0x100aace60
0x1002e8ac6: vmovups xmmword ptr [rax], xmm0
0x1002e8aca: mov byte ptr [rax + 0x10], 0
0x1002e8ace: mov byte ptr [rax + 0x11], 1
0x1002e8ad2: mov byte ptr [rax + 0x12], 0
0x1002e8ad6: mov dword ptr [rax + 0x14], 0
0x1002e8add: mov dword ptr [rax + 0x18], 0
0x1002e8ae4: vxorps xmm0, xmm0, xmm0
0x1002e8ae8: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e8aed: mov dword ptr [rax + 0x28], 0
0x1002e8af4: vmovaps xmm0, xmmword ptr [rip + 0x7d0bb4] ; 0x100ab96b0
0x1002e8afc: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e8b01: mov byte ptr [rax + 0x40], 0
0x1002e8b05: vxorps ymm0, ymm0, ymm0
0x1002e8b09: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e8b11: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e8b16: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e8b1b: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e8b25: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e8b2f: vmovaps xmm0, xmmword ptr [rbx]
0x1002e8b33: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e8b3b: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e8b43: vxorps xmm0, xmm0, xmm0
0x1002e8b47: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e8b4f: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e8b59: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e8b61: mov dword ptr [rax + 0xf4], 0
0x1002e8b6b: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e8b75: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e8b7d: mov dword ptr [rax + 0x10c], 0
0x1002e8b87: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e8b91: mov byte ptr [rax + 0x114], 1
0x1002e8b98: mov dword ptr [rax + 0x118], 0
0x1002e8ba2: mov dword ptr [rax + 0x11c], 0
0x1002e8bac: mov qword ptr [rip + 0x1b06e5d], rax ; 0x101defa10
0x1002e8bb3: mov rdi, r12
0x1002e8bb6: mov rsi, rax
0x1002e8bb9: mov rdx, r13
0x1002e8bbc: vzeroupper 
0x1002e8bbf: call 0x100314920 ; 0x100314920
0x1002e8bc4: lea rsi, [rip + 0x897305] ; 0x100b7fed0 emoteNoThanks
0x1002e8bcb: mov edx, 0x40
0x1002e8bd0: mov rdi, r13
0x1002e8bd3: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e8bd8: movsx edi, byte ptr [rbp - 0x70]
0x1002e8bdc: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e8be1: mov byte ptr [rbp - 0x70], al
0x1002e8be4: mov rdx, qword ptr [rip + 0x1b06a7d] ; 0x101def668
0x1002e8beb: mov esi, 0x120
0x1002e8bf0: mov ecx, 0x10
0x1002e8bf5: mov rdi, r15
0x1002e8bf8: call 0x100795530 ; 0x100795530
0x1002e8bfd: vmovaps xmm0, xmmword ptr [rip + 0x7c425b] ; 0x100aace60
0x1002e8c05: vmovups xmmword ptr [rax], xmm0
0x1002e8c09: mov byte ptr [rax + 0x10], 0
0x1002e8c0d: mov byte ptr [rax + 0x11], 1
0x1002e8c11: mov byte ptr [rax + 0x12], 0
0x1002e8c15: mov dword ptr [rax + 0x14], 0
0x1002e8c1c: mov dword ptr [rax + 0x18], 0
0x1002e8c23: vxorps xmm0, xmm0, xmm0
0x1002e8c27: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e8c2c: mov dword ptr [rax + 0x28], 0
0x1002e8c33: vmovaps xmm0, xmmword ptr [rip + 0x7d0a75] ; 0x100ab96b0
0x1002e8c3b: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e8c40: mov byte ptr [rax + 0x40], 0
0x1002e8c44: vxorps ymm0, ymm0, ymm0
0x1002e8c48: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e8c50: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e8c55: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e8c5a: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e8c64: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e8c6e: vmovaps xmm0, xmmword ptr [rbx]
0x1002e8c72: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e8c7a: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e8c82: vxorps xmm0, xmm0, xmm0
0x1002e8c86: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e8c8e: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e8c98: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e8ca0: mov dword ptr [rax + 0xf4], 0
0x1002e8caa: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e8cb4: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e8cbc: mov dword ptr [rax + 0x10c], 0
0x1002e8cc6: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e8cd0: mov byte ptr [rax + 0x114], 1
0x1002e8cd7: mov dword ptr [rax + 0x118], 0
0x1002e8ce1: mov dword ptr [rax + 0x11c], 0
0x1002e8ceb: mov qword ptr [rip + 0x1b06d26], rax ; 0x101defa18
0x1002e8cf2: mov rdi, r12
0x1002e8cf5: mov rsi, rax
0x1002e8cf8: mov rdx, r13
0x1002e8cfb: vzeroupper 
0x1002e8cfe: call 0x100314920 ; 0x100314920
0x1002e8d03: lea rsi, [rip + 0x8971d4] ; 0x100b7fede emoteWaveSmall
0x1002e8d0a: mov edx, 0x40
0x1002e8d0f: mov rdi, r13
0x1002e8d12: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e8d17: movsx edi, byte ptr [rbp - 0x70]
0x1002e8d1b: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e8d20: mov byte ptr [rbp - 0x70], al
0x1002e8d23: mov rdx, qword ptr [rip + 0x1b0693e] ; 0x101def668
0x1002e8d2a: mov esi, 0x120
0x1002e8d2f: mov ecx, 0x10
0x1002e8d34: mov rdi, r15
0x1002e8d37: call 0x100795530 ; 0x100795530
0x1002e8d3c: vmovaps xmm0, xmmword ptr [rip + 0x7c411c] ; 0x100aace60
0x1002e8d44: vmovups xmmword ptr [rax], xmm0
0x1002e8d48: mov byte ptr [rax + 0x10], 0
0x1002e8d4c: mov byte ptr [rax + 0x11], 1
0x1002e8d50: mov byte ptr [rax + 0x12], 0
0x1002e8d54: mov dword ptr [rax + 0x14], 0
0x1002e8d5b: mov dword ptr [rax + 0x18], 0
0x1002e8d62: vxorps xmm0, xmm0, xmm0
0x1002e8d66: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e8d6b: mov dword ptr [rax + 0x28], 0
0x1002e8d72: vmovaps xmm0, xmmword ptr [rip + 0x7d0936] ; 0x100ab96b0
0x1002e8d7a: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e8d7f: mov byte ptr [rax + 0x40], 0
0x1002e8d83: vxorps ymm0, ymm0, ymm0
0x1002e8d87: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e8d8f: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e8d94: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e8d99: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e8da3: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e8dad: vmovaps xmm0, xmmword ptr [rbx]
0x1002e8db1: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e8db9: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e8dc1: vxorps xmm0, xmm0, xmm0
0x1002e8dc5: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e8dcd: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e8dd7: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e8ddf: mov dword ptr [rax + 0xf4], 0
0x1002e8de9: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e8df3: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e8dfb: mov dword ptr [rax + 0x10c], 0
0x1002e8e05: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e8e0f: mov byte ptr [rax + 0x114], 1
0x1002e8e16: mov dword ptr [rax + 0x118], 0
0x1002e8e20: mov dword ptr [rax + 0x11c], 0
0x1002e8e2a: mov qword ptr [rip + 0x1b06bef], rax ; 0x101defa20
0x1002e8e31: mov rdi, r12
0x1002e8e34: mov rsi, rax
0x1002e8e37: mov rdx, r13
0x1002e8e3a: vzeroupper 
0x1002e8e3d: call 0x100314920 ; 0x100314920
0x1002e8e42: lea rsi, [rip + 0x8970a4] ; 0x100b7feed emotePointGlow
0x1002e8e49: mov edx, 0x40
0x1002e8e4e: mov rdi, r13
0x1002e8e51: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e8e56: movsx edi, byte ptr [rbp - 0x70]
0x1002e8e5a: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e8e5f: mov byte ptr [rbp - 0x70], al
0x1002e8e62: mov rdx, qword ptr [rip + 0x1b067ff] ; 0x101def668
0x1002e8e69: mov esi, 0x120
0x1002e8e6e: mov ecx, 0x10
0x1002e8e73: mov rdi, r15
0x1002e8e76: call 0x100795530 ; 0x100795530
0x1002e8e7b: vmovaps xmm0, xmmword ptr [rip + 0x7c3fdd] ; 0x100aace60
0x1002e8e83: vmovups xmmword ptr [rax], xmm0
0x1002e8e87: mov byte ptr [rax + 0x10], 0
0x1002e8e8b: mov byte ptr [rax + 0x11], 1
0x1002e8e8f: mov byte ptr [rax + 0x12], 0
0x1002e8e93: mov dword ptr [rax + 0x14], 0
0x1002e8e9a: mov dword ptr [rax + 0x18], 0
0x1002e8ea1: vxorps xmm0, xmm0, xmm0
0x1002e8ea5: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e8eaa: mov dword ptr [rax + 0x28], 0
0x1002e8eb1: vmovaps xmm0, xmmword ptr [rip + 0x7d07f7] ; 0x100ab96b0
0x1002e8eb9: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e8ebe: mov byte ptr [rax + 0x40], 0
0x1002e8ec2: vxorps ymm0, ymm0, ymm0
0x1002e8ec6: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e8ece: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e8ed3: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e8ed8: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e8ee2: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e8eec: vmovaps xmm0, xmmword ptr [rbx]
0x1002e8ef0: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e8ef8: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e8f00: vxorps xmm0, xmm0, xmm0
0x1002e8f04: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e8f0c: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e8f16: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e8f1e: mov dword ptr [rax + 0xf4], 0
0x1002e8f28: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e8f32: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e8f3a: mov dword ptr [rax + 0x10c], 0
0x1002e8f44: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e8f4e: mov byte ptr [rax + 0x114], 1
0x1002e8f55: mov dword ptr [rax + 0x118], 0
0x1002e8f5f: mov dword ptr [rax + 0x11c], 0
0x1002e8f69: mov qword ptr [rip + 0x1b06ab8], rax ; 0x101defa28
0x1002e8f70: mov rdi, r12
0x1002e8f73: mov rsi, rax
0x1002e8f76: mov rdx, r13
0x1002e8f79: vzeroupper 
0x1002e8f7c: call 0x100314920 ; 0x100314920
0x1002e8f81: lea rsi, [rip + 0x896f74] ; 0x100b7fefc emoteBowOne
0x1002e8f88: mov edx, 0x40
0x1002e8f8d: mov rdi, r13
0x1002e8f90: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e8f95: movsx edi, byte ptr [rbp - 0x70]
0x1002e8f99: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e8f9e: mov byte ptr [rbp - 0x70], al
0x1002e8fa1: mov rdx, qword ptr [rip + 0x1b066c0] ; 0x101def668
0x1002e8fa8: mov esi, 0x120
0x1002e8fad: mov ecx, 0x10
0x1002e8fb2: mov rdi, r15
0x1002e8fb5: call 0x100795530 ; 0x100795530
0x1002e8fba: vmovaps xmm0, xmmword ptr [rip + 0x7c3e9e] ; 0x100aace60
0x1002e8fc2: vmovups xmmword ptr [rax], xmm0
0x1002e8fc6: mov byte ptr [rax + 0x10], 0
0x1002e8fca: mov byte ptr [rax + 0x11], 1
0x1002e8fce: mov byte ptr [rax + 0x12], 0
0x1002e8fd2: mov dword ptr [rax + 0x14], 0
0x1002e8fd9: mov dword ptr [rax + 0x18], 0
0x1002e8fe0: vxorps xmm0, xmm0, xmm0
0x1002e8fe4: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e8fe9: mov dword ptr [rax + 0x28], 0
0x1002e8ff0: vmovaps xmm0, xmmword ptr [rip + 0x7d06b8] ; 0x100ab96b0
0x1002e8ff8: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e8ffd: mov byte ptr [rax + 0x40], 0
0x1002e9001: vxorps ymm0, ymm0, ymm0
0x1002e9005: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e900d: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e9012: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e9017: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e9021: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e902b: vmovaps xmm0, xmmword ptr [rbx]
0x1002e902f: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e9037: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e903f: vxorps xmm0, xmm0, xmm0
0x1002e9043: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e904b: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e9055: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e905d: mov dword ptr [rax + 0xf4], 0
0x1002e9067: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e9071: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e9079: mov dword ptr [rax + 0x10c], 0
0x1002e9083: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e908d: mov byte ptr [rax + 0x114], 1
0x1002e9094: mov dword ptr [rax + 0x118], 0
0x1002e909e: mov dword ptr [rax + 0x11c], 0
0x1002e90a8: mov qword ptr [rip + 0x1b06981], rax ; 0x101defa30
0x1002e90af: mov rdi, r12
0x1002e90b2: mov rsi, rax
0x1002e90b5: mov rdx, r13
0x1002e90b8: vzeroupper 
0x1002e90bb: call 0x100314920 ; 0x100314920
0x1002e90c0: lea rsi, [rip + 0x896e41] ; 0x100b7ff08 emoteBowTwo
0x1002e90c7: mov edx, 0x40
0x1002e90cc: mov rdi, r13
0x1002e90cf: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e90d4: movsx edi, byte ptr [rbp - 0x70]
0x1002e90d8: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e90dd: mov byte ptr [rbp - 0x70], al
0x1002e90e0: mov rdx, qword ptr [rip + 0x1b06581] ; 0x101def668
0x1002e90e7: mov esi, 0x120
0x1002e90ec: mov ecx, 0x10
0x1002e90f1: mov rdi, r15
0x1002e90f4: call 0x100795530 ; 0x100795530
0x1002e90f9: vmovaps xmm0, xmmword ptr [rip + 0x7c3d5f] ; 0x100aace60
0x1002e9101: vmovups xmmword ptr [rax], xmm0
0x1002e9105: mov byte ptr [rax + 0x10], 0
0x1002e9109: mov byte ptr [rax + 0x11], 1
0x1002e910d: mov byte ptr [rax + 0x12], 0
0x1002e9111: mov dword ptr [rax + 0x14], 0
0x1002e9118: mov dword ptr [rax + 0x18], 0
0x1002e911f: vxorps xmm0, xmm0, xmm0
0x1002e9123: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e9128: mov dword ptr [rax + 0x28], 0
0x1002e912f: vmovaps xmm0, xmmword ptr [rip + 0x7d0579] ; 0x100ab96b0
0x1002e9137: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e913c: mov byte ptr [rax + 0x40], 0
0x1002e9140: vxorps ymm0, ymm0, ymm0
0x1002e9144: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e914c: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e9151: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e9156: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e9160: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e916a: vmovaps xmm0, xmmword ptr [rbx]
0x1002e916e: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e9176: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e917e: vxorps xmm0, xmm0, xmm0
0x1002e9182: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e918a: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e9194: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e919c: mov dword ptr [rax + 0xf4], 0
0x1002e91a6: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e91b0: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e91b8: mov dword ptr [rax + 0x10c], 0
0x1002e91c2: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e91cc: mov byte ptr [rax + 0x114], 1
0x1002e91d3: mov dword ptr [rax + 0x118], 0
0x1002e91dd: mov dword ptr [rax + 0x11c], 0
0x1002e91e7: mov qword ptr [rip + 0x1b0684a], rax ; 0x101defa38
0x1002e91ee: mov rdi, r12
0x1002e91f1: mov rsi, rax
0x1002e91f4: mov rdx, r13
0x1002e91f7: vzeroupper 
0x1002e91fa: call 0x100314920 ; 0x100314920
0x1002e91ff: lea rsi, [rip + 0x896d0e] ; 0x100b7ff14 emoteTrailLargeFollowPoint
0x1002e9206: mov edx, 0x40
0x1002e920b: mov rdi, r13
0x1002e920e: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e9213: movsx edi, byte ptr [rbp - 0x70]
0x1002e9217: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e921c: mov byte ptr [rbp - 0x70], al
0x1002e921f: mov rdx, qword ptr [rip + 0x1b06442] ; 0x101def668
0x1002e9226: mov esi, 0x120
0x1002e922b: mov ecx, 0x10
0x1002e9230: mov rdi, r15
0x1002e9233: call 0x100795530 ; 0x100795530
0x1002e9238: vmovaps xmm0, xmmword ptr [rip + 0x7c3c20] ; 0x100aace60
0x1002e9240: vmovups xmmword ptr [rax], xmm0
0x1002e9244: mov byte ptr [rax + 0x10], 0
0x1002e9248: mov byte ptr [rax + 0x11], 1
0x1002e924c: mov byte ptr [rax + 0x12], 0
0x1002e9250: mov dword ptr [rax + 0x14], 0
0x1002e9257: mov dword ptr [rax + 0x18], 0
0x1002e925e: vxorps xmm0, xmm0, xmm0
0x1002e9262: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e9267: mov dword ptr [rax + 0x28], 0
0x1002e926e: vmovaps xmm0, xmmword ptr [rip + 0x7d043a] ; 0x100ab96b0
0x1002e9276: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e927b: mov byte ptr [rax + 0x40], 0
0x1002e927f: vxorps ymm0, ymm0, ymm0
0x1002e9283: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e928b: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e9290: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e9295: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e929f: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e92a9: vmovaps xmm0, xmmword ptr [rbx]
0x1002e92ad: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e92b5: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e92bd: vxorps xmm0, xmm0, xmm0
0x1002e92c1: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e92c9: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e92d3: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e92db: mov dword ptr [rax + 0xf4], 0
0x1002e92e5: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e92ef: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e92f7: mov dword ptr [rax + 0x10c], 0
0x1002e9301: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e930b: mov byte ptr [rax + 0x114], 1
0x1002e9312: mov dword ptr [rax + 0x118], 0
0x1002e931c: mov dword ptr [rax + 0x11c], 0
0x1002e9326: mov qword ptr [rip + 0x1b06713], rax ; 0x101defa40
0x1002e932d: mov rdi, r12
0x1002e9330: mov rsi, rax
0x1002e9333: mov rdx, r13
0x1002e9336: vzeroupper 
0x1002e9339: call 0x100314920 ; 0x100314920
0x1002e933e: lea rsi, [rip + 0x896bea] ; 0x100b7ff2f emoteNoThanksOne
0x1002e9345: mov edx, 0x40
0x1002e934a: mov rdi, r13
0x1002e934d: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e9352: movsx edi, byte ptr [rbp - 0x70]
0x1002e9356: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e935b: mov byte ptr [rbp - 0x70], al
0x1002e935e: mov rdx, qword ptr [rip + 0x1b06303] ; 0x101def668
0x1002e9365: mov esi, 0x120
0x1002e936a: mov ecx, 0x10
0x1002e936f: mov rdi, r15
0x1002e9372: call 0x100795530 ; 0x100795530
0x1002e9377: vmovaps xmm0, xmmword ptr [rip + 0x7c3ae1] ; 0x100aace60
0x1002e937f: vmovups xmmword ptr [rax], xmm0
0x1002e9383: mov byte ptr [rax + 0x10], 0
0x1002e9387: mov byte ptr [rax + 0x11], 1
0x1002e938b: mov byte ptr [rax + 0x12], 0
0x1002e938f: mov dword ptr [rax + 0x14], 0
0x1002e9396: mov dword ptr [rax + 0x18], 0
0x1002e939d: vxorps xmm0, xmm0, xmm0
0x1002e93a1: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e93a6: mov dword ptr [rax + 0x28], 0
0x1002e93ad: vmovaps xmm0, xmmword ptr [rip + 0x7d02fb] ; 0x100ab96b0
0x1002e93b5: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e93ba: mov byte ptr [rax + 0x40], 0
0x1002e93be: vxorps ymm0, ymm0, ymm0
0x1002e93c2: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e93ca: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e93cf: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e93d4: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e93de: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e93e8: vmovaps xmm0, xmmword ptr [rbx]
0x1002e93ec: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e93f4: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e93fc: vxorps xmm0, xmm0, xmm0
0x1002e9400: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e9408: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e9412: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e941a: mov dword ptr [rax + 0xf4], 0
0x1002e9424: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e942e: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e9436: mov dword ptr [rax + 0x10c], 0
0x1002e9440: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e944a: mov byte ptr [rax + 0x114], 1
0x1002e9451: mov dword ptr [rax + 0x118], 0
0x1002e945b: mov dword ptr [rax + 0x11c], 0
0x1002e9465: mov qword ptr [rip + 0x1b065dc], rax ; 0x101defa48
0x1002e946c: mov rdi, r12
0x1002e946f: mov rsi, rax
0x1002e9472: mov rdx, r13
0x1002e9475: vzeroupper 
0x1002e9478: call 0x100314920 ; 0x100314920
0x1002e947d: lea rsi, [rip + 0x896abc] ; 0x100b7ff40 emoteNoThanksTwo
0x1002e9484: mov edx, 0x40
0x1002e9489: mov rdi, r13
0x1002e948c: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e9491: movsx edi, byte ptr [rbp - 0x70]
0x1002e9495: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e949a: mov byte ptr [rbp - 0x70], al
0x1002e949d: mov rdx, qword ptr [rip + 0x1b061c4] ; 0x101def668
0x1002e94a4: mov esi, 0x120
0x1002e94a9: mov ecx, 0x10
0x1002e94ae: mov rdi, r15
0x1002e94b1: call 0x100795530 ; 0x100795530
0x1002e94b6: vmovaps xmm0, xmmword ptr [rip + 0x7c39a2] ; 0x100aace60
0x1002e94be: vmovups xmmword ptr [rax], xmm0
0x1002e94c2: mov byte ptr [rax + 0x10], 0
0x1002e94c6: mov byte ptr [rax + 0x11], 1
0x1002e94ca: mov byte ptr [rax + 0x12], 0
0x1002e94ce: mov dword ptr [rax + 0x14], 0
0x1002e94d5: mov dword ptr [rax + 0x18], 0
0x1002e94dc: vxorps xmm0, xmm0, xmm0
0x1002e94e0: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e94e5: mov dword ptr [rax + 0x28], 0
0x1002e94ec: vmovaps xmm0, xmmword ptr [rip + 0x7d01bc] ; 0x100ab96b0
0x1002e94f4: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e94f9: mov byte ptr [rax + 0x40], 0
0x1002e94fd: vxorps ymm0, ymm0, ymm0
0x1002e9501: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e9509: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e950e: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e9513: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e951d: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e9527: vmovaps xmm0, xmmword ptr [rbx]
0x1002e952b: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e9533: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e953b: vxorps xmm0, xmm0, xmm0
0x1002e953f: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e9547: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e9551: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e9559: mov dword ptr [rax + 0xf4], 0
0x1002e9563: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e956d: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e9575: mov dword ptr [rax + 0x10c], 0
0x1002e957f: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e9589: mov byte ptr [rax + 0x114], 1
0x1002e9590: mov dword ptr [rax + 0x118], 0
0x1002e959a: mov dword ptr [rax + 0x11c], 0
0x1002e95a4: mov qword ptr [rip + 0x1b064a5], rax ; 0x101defa50
0x1002e95ab: mov rdi, r12
0x1002e95ae: mov rsi, rax
0x1002e95b1: mov rdx, r13
0x1002e95b4: vzeroupper 
0x1002e95b7: call 0x100314920 ; 0x100314920
0x1002e95bc: lea rsi, [rip + 0x89698e] ; 0x100b7ff51 emoteBrow
0x1002e95c3: mov edx, 0x40
0x1002e95c8: mov rdi, r13
0x1002e95cb: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e95d0: movsx edi, byte ptr [rbp - 0x70]
0x1002e95d4: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e95d9: mov byte ptr [rbp - 0x70], al
0x1002e95dc: mov rdx, qword ptr [rip + 0x1b06085] ; 0x101def668
0x1002e95e3: mov esi, 0x120
0x1002e95e8: mov ecx, 0x10
0x1002e95ed: mov rdi, r15
0x1002e95f0: call 0x100795530 ; 0x100795530
0x1002e95f5: vmovaps xmm0, xmmword ptr [rip + 0x7c3863] ; 0x100aace60
0x1002e95fd: vmovups xmmword ptr [rax], xmm0
0x1002e9601: mov byte ptr [rax + 0x10], 0
0x1002e9605: mov byte ptr [rax + 0x11], 1
0x1002e9609: mov byte ptr [rax + 0x12], 0
0x1002e960d: mov dword ptr [rax + 0x14], 0
0x1002e9614: mov dword ptr [rax + 0x18], 0
0x1002e961b: vxorps xmm0, xmm0, xmm0
0x1002e961f: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e9624: mov dword ptr [rax + 0x28], 0
0x1002e962b: vmovaps xmm0, xmmword ptr [rip + 0x7d007d] ; 0x100ab96b0
0x1002e9633: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e9638: mov byte ptr [rax + 0x40], 0
0x1002e963c: vxorps ymm0, ymm0, ymm0
0x1002e9640: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e9648: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e964d: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e9652: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e965c: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e9666: vmovaps xmm0, xmmword ptr [rbx]
0x1002e966a: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e9672: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e967a: vxorps xmm0, xmm0, xmm0
0x1002e967e: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e9686: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e9690: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e9698: mov dword ptr [rax + 0xf4], 0
0x1002e96a2: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e96ac: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e96b4: mov dword ptr [rax + 0x10c], 0
0x1002e96be: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e96c8: mov byte ptr [rax + 0x114], 1
0x1002e96cf: mov dword ptr [rax + 0x118], 0
0x1002e96d9: mov dword ptr [rax + 0x11c], 0
0x1002e96e3: mov qword ptr [rip + 0x1b0636e], rax ; 0x101defa58
0x1002e96ea: mov rdi, r12
0x1002e96ed: mov rsi, rax
0x1002e96f0: mov rdx, r13
0x1002e96f3: vzeroupper 
0x1002e96f6: call 0x100314920 ; 0x100314920
0x1002e96fb: lea rsi, [rip + 0x896859] ; 0x100b7ff5b emotelampButterflyOne
0x1002e9702: mov edx, 0x40
0x1002e9707: mov rdi, r13
0x1002e970a: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e970f: movsx edi, byte ptr [rbp - 0x70]
0x1002e9713: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e9718: mov byte ptr [rbp - 0x70], al
0x1002e971b: mov rdx, qword ptr [rip + 0x1b05f46] ; 0x101def668
0x1002e9722: mov esi, 0x120
0x1002e9727: mov ecx, 0x10
0x1002e972c: mov rdi, r15
0x1002e972f: call 0x100795530 ; 0x100795530
0x1002e9734: vmovaps xmm0, xmmword ptr [rip + 0x7c3724] ; 0x100aace60
0x1002e973c: vmovups xmmword ptr [rax], xmm0
0x1002e9740: mov byte ptr [rax + 0x10], 0
0x1002e9744: mov byte ptr [rax + 0x11], 1
0x1002e9748: mov byte ptr [rax + 0x12], 0
0x1002e974c: mov dword ptr [rax + 0x14], 0
0x1002e9753: mov dword ptr [rax + 0x18], 0
0x1002e975a: vxorps xmm0, xmm0, xmm0
0x1002e975e: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e9763: mov dword ptr [rax + 0x28], 0
0x1002e976a: vmovaps xmm0, xmmword ptr [rip + 0x7cff3e] ; 0x100ab96b0
0x1002e9772: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e9777: mov byte ptr [rax + 0x40], 0
0x1002e977b: vxorps ymm0, ymm0, ymm0
0x1002e977f: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e9787: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e978c: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e9791: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e979b: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e97a5: vmovaps xmm0, xmmword ptr [rbx]
0x1002e97a9: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e97b1: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e97b9: vxorps xmm0, xmm0, xmm0
0x1002e97bd: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e97c5: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e97cf: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e97d7: mov dword ptr [rax + 0xf4], 0
0x1002e97e1: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e97eb: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e97f3: mov dword ptr [rax + 0x10c], 0
0x1002e97fd: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e9807: mov byte ptr [rax + 0x114], 1
0x1002e980e: mov dword ptr [rax + 0x118], 0
0x1002e9818: mov dword ptr [rax + 0x11c], 0
0x1002e9822: mov qword ptr [rip + 0x1b06237], rax ; 0x101defa60
0x1002e9829: mov rdi, r12
0x1002e982c: mov rsi, rax
0x1002e982f: mov rdx, r13
0x1002e9832: vzeroupper 
0x1002e9835: call 0x100314920 ; 0x100314920
0x1002e983a: lea rsi, [rip + 0x896730] ; 0x100b7ff71 emotelampButterflyTwo
0x1002e9841: mov edx, 0x40
0x1002e9846: mov rdi, r13
0x1002e9849: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e984e: movsx edi, byte ptr [rbp - 0x70]
0x1002e9852: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e9857: mov byte ptr [rbp - 0x70], al
0x1002e985a: mov rdx, qword ptr [rip + 0x1b05e07] ; 0x101def668
0x1002e9861: mov esi, 0x120
0x1002e9866: mov ecx, 0x10
0x1002e986b: mov rdi, r15
0x1002e986e: call 0x100795530 ; 0x100795530
0x1002e9873: vmovaps xmm0, xmmword ptr [rip + 0x7c35e5] ; 0x100aace60
0x1002e987b: vmovups xmmword ptr [rax], xmm0
0x1002e987f: mov byte ptr [rax + 0x10], 0
0x1002e9883: mov byte ptr [rax + 0x11], 1
0x1002e9887: mov byte ptr [rax + 0x12], 0
0x1002e988b: mov dword ptr [rax + 0x14], 0
0x1002e9892: mov dword ptr [rax + 0x18], 0
0x1002e9899: vxorps xmm0, xmm0, xmm0
0x1002e989d: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e98a2: mov dword ptr [rax + 0x28], 0
0x1002e98a9: vmovaps xmm0, xmmword ptr [rip + 0x7cfdff] ; 0x100ab96b0
0x1002e98b1: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e98b6: mov byte ptr [rax + 0x40], 0
0x1002e98ba: vxorps ymm0, ymm0, ymm0
0x1002e98be: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e98c6: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e98cb: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e98d0: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e98da: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e98e4: vmovaps xmm0, xmmword ptr [rbx]
0x1002e98e8: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e98f0: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e98f8: vxorps xmm0, xmm0, xmm0
0x1002e98fc: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e9904: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e990e: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e9916: mov dword ptr [rax + 0xf4], 0
0x1002e9920: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e992a: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e9932: mov dword ptr [rax + 0x10c], 0
0x1002e993c: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e9946: mov byte ptr [rax + 0x114], 1
0x1002e994d: mov dword ptr [rax + 0x118], 0
0x1002e9957: mov dword ptr [rax + 0x11c], 0
0x1002e9961: mov qword ptr [rip + 0x1b06100], rax ; 0x101defa68
0x1002e9968: mov rdi, r12
0x1002e996b: mov rsi, rax
0x1002e996e: mov rdx, r13
0x1002e9971: vzeroupper 
0x1002e9974: call 0x100314920 ; 0x100314920
0x1002e9979: lea rsi, [rip + 0x896607] ; 0x100b7ff87 emoteChestIdle
0x1002e9980: mov edx, 0x40
0x1002e9985: mov rdi, r13
0x1002e9988: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e998d: movsx edi, byte ptr [rbp - 0x70]
0x1002e9991: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e9996: mov byte ptr [rbp - 0x70], al
0x1002e9999: mov rdx, qword ptr [rip + 0x1b05cc8] ; 0x101def668
0x1002e99a0: mov esi, 0x120
0x1002e99a5: mov ecx, 0x10
0x1002e99aa: mov rdi, r15
0x1002e99ad: call 0x100795530 ; 0x100795530
0x1002e99b2: vmovaps xmm0, xmmword ptr [rip + 0x7c34a6] ; 0x100aace60
0x1002e99ba: vmovups xmmword ptr [rax], xmm0
0x1002e99be: mov byte ptr [rax + 0x10], 0
0x1002e99c2: mov byte ptr [rax + 0x11], 1
0x1002e99c6: mov byte ptr [rax + 0x12], 0
0x1002e99ca: mov dword ptr [rax + 0x14], 0
0x1002e99d1: mov dword ptr [rax + 0x18], 0
0x1002e99d8: vxorps xmm0, xmm0, xmm0
0x1002e99dc: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e99e1: mov dword ptr [rax + 0x28], 0
0x1002e99e8: vmovaps xmm0, xmmword ptr [rip + 0x7cfcc0] ; 0x100ab96b0
0x1002e99f0: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e99f5: mov byte ptr [rax + 0x40], 0
0x1002e99f9: vxorps ymm0, ymm0, ymm0
0x1002e99fd: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e9a05: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e9a0a: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e9a0f: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e9a19: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e9a23: vmovaps xmm0, xmmword ptr [rbx]
0x1002e9a27: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e9a2f: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e9a37: vxorps xmm0, xmm0, xmm0
0x1002e9a3b: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e9a43: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e9a4d: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e9a55: mov dword ptr [rax + 0xf4], 0
0x1002e9a5f: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e9a69: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e9a71: mov dword ptr [rax + 0x10c], 0
0x1002e9a7b: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e9a85: mov byte ptr [rax + 0x114], 1
0x1002e9a8c: mov dword ptr [rax + 0x118], 0
0x1002e9a96: mov dword ptr [rax + 0x11c], 0
0x1002e9aa0: mov qword ptr [rip + 0x1b05fc9], rax ; 0x101defa70
0x1002e9aa7: mov rdi, r12
0x1002e9aaa: mov rsi, rax
0x1002e9aad: mov rdx, r13
0x1002e9ab0: vzeroupper 
0x1002e9ab3: call 0x100314920 ; 0x100314920
0x1002e9ab8: lea rsi, [rip + 0x8964d7] ; 0x100b7ff96 emoteChestItemTrail
0x1002e9abf: mov edx, 0x40
0x1002e9ac4: mov rdi, r13
0x1002e9ac7: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e9acc: movsx edi, byte ptr [rbp - 0x70]
0x1002e9ad0: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e9ad5: mov byte ptr [rbp - 0x70], al
0x1002e9ad8: mov rdx, qword ptr [rip + 0x1b05b89] ; 0x101def668
0x1002e9adf: mov esi, 0x120
0x1002e9ae4: mov ecx, 0x10
0x1002e9ae9: mov rdi, r15
0x1002e9aec: call 0x100795530 ; 0x100795530
0x1002e9af1: vmovaps xmm0, xmmword ptr [rip + 0x7c3367] ; 0x100aace60
0x1002e9af9: vmovups xmmword ptr [rax], xmm0
0x1002e9afd: mov byte ptr [rax + 0x10], 0
0x1002e9b01: mov byte ptr [rax + 0x11], 1
0x1002e9b05: mov byte ptr [rax + 0x12], 0
0x1002e9b09: mov dword ptr [rax + 0x14], 0
0x1002e9b10: mov dword ptr [rax + 0x18], 0
0x1002e9b17: vxorps xmm0, xmm0, xmm0
0x1002e9b1b: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e9b20: mov dword ptr [rax + 0x28], 0
0x1002e9b27: vmovaps xmm0, xmmword ptr [rip + 0x7cfb81] ; 0x100ab96b0
0x1002e9b2f: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e9b34: mov byte ptr [rax + 0x40], 0
0x1002e9b38: vxorps ymm0, ymm0, ymm0
0x1002e9b3c: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e9b44: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e9b49: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e9b4e: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e9b58: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e9b62: vmovaps xmm0, xmmword ptr [rbx]
0x1002e9b66: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e9b6e: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e9b76: vxorps xmm0, xmm0, xmm0
0x1002e9b7a: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e9b82: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e9b8c: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e9b94: mov dword ptr [rax + 0xf4], 0
0x1002e9b9e: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e9ba8: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e9bb0: mov dword ptr [rax + 0x10c], 0
0x1002e9bba: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e9bc4: mov byte ptr [rax + 0x114], 1
0x1002e9bcb: mov dword ptr [rax + 0x118], 0
0x1002e9bd5: mov dword ptr [rax + 0x11c], 0
0x1002e9bdf: mov qword ptr [rip + 0x1b05e92], rax ; 0x101defa78
0x1002e9be6: mov rdi, r12
0x1002e9be9: mov rsi, rax
0x1002e9bec: mov rdx, r13
0x1002e9bef: vzeroupper 
0x1002e9bf2: call 0x100314920 ; 0x100314920
0x1002e9bf7: lea rsi, [rip + 0x8963ac] ; 0x100b7ffaa emoteClapOne
0x1002e9bfe: mov edx, 0x40
0x1002e9c03: mov rdi, r13
0x1002e9c06: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e9c0b: movsx edi, byte ptr [rbp - 0x70]
0x1002e9c0f: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e9c14: mov byte ptr [rbp - 0x70], al
0x1002e9c17: mov rdx, qword ptr [rip + 0x1b05a4a] ; 0x101def668
0x1002e9c1e: mov esi, 0x120
0x1002e9c23: mov ecx, 0x10
0x1002e9c28: mov rdi, r15
0x1002e9c2b: call 0x100795530 ; 0x100795530
0x1002e9c30: vmovaps xmm0, xmmword ptr [rip + 0x7c3228] ; 0x100aace60
0x1002e9c38: vmovups xmmword ptr [rax], xmm0
0x1002e9c3c: mov byte ptr [rax + 0x10], 0
0x1002e9c40: mov byte ptr [rax + 0x11], 1
0x1002e9c44: mov byte ptr [rax + 0x12], 0
0x1002e9c48: mov dword ptr [rax + 0x14], 0
0x1002e9c4f: mov dword ptr [rax + 0x18], 0
0x1002e9c56: vxorps xmm0, xmm0, xmm0
0x1002e9c5a: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e9c5f: mov dword ptr [rax + 0x28], 0
0x1002e9c66: vmovaps xmm0, xmmword ptr [rip + 0x7cfa42] ; 0x100ab96b0
0x1002e9c6e: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e9c73: mov byte ptr [rax + 0x40], 0
0x1002e9c77: vxorps ymm0, ymm0, ymm0
0x1002e9c7b: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e9c83: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e9c88: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e9c8d: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e9c97: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e9ca1: vmovaps xmm0, xmmword ptr [rbx]
0x1002e9ca5: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e9cad: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e9cb5: vxorps xmm0, xmm0, xmm0
0x1002e9cb9: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e9cc1: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e9ccb: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e9cd3: mov dword ptr [rax + 0xf4], 0
0x1002e9cdd: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e9ce7: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e9cef: mov dword ptr [rax + 0x10c], 0
0x1002e9cf9: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e9d03: mov byte ptr [rax + 0x114], 1
0x1002e9d0a: mov dword ptr [rax + 0x118], 0
0x1002e9d14: mov dword ptr [rax + 0x11c], 0
0x1002e9d1e: mov qword ptr [rip + 0x1b05d5b], rax ; 0x101defa80
0x1002e9d25: mov rdi, r12
0x1002e9d28: mov rsi, rax
0x1002e9d2b: mov rdx, r13
0x1002e9d2e: vzeroupper 
0x1002e9d31: call 0x100314920 ; 0x100314920
0x1002e9d36: lea rsi, [rip + 0x89627a] ; 0x100b7ffb7 emoteClapTwo
0x1002e9d3d: mov edx, 0x40
0x1002e9d42: mov rdi, r13
0x1002e9d45: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e9d4a: movsx edi, byte ptr [rbp - 0x70]
0x1002e9d4e: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e9d53: mov byte ptr [rbp - 0x70], al
0x1002e9d56: mov rdx, qword ptr [rip + 0x1b0590b] ; 0x101def668
0x1002e9d5d: mov esi, 0x120
0x1002e9d62: mov ecx, 0x10
0x1002e9d67: mov rdi, r15
0x1002e9d6a: call 0x100795530 ; 0x100795530
0x1002e9d6f: vmovaps xmm0, xmmword ptr [rip + 0x7c30e9] ; 0x100aace60
0x1002e9d77: vmovups xmmword ptr [rax], xmm0
0x1002e9d7b: mov byte ptr [rax + 0x10], 0
0x1002e9d7f: mov byte ptr [rax + 0x11], 1
0x1002e9d83: mov byte ptr [rax + 0x12], 0
0x1002e9d87: mov dword ptr [rax + 0x14], 0
0x1002e9d8e: mov dword ptr [rax + 0x18], 0
0x1002e9d95: vxorps xmm0, xmm0, xmm0
0x1002e9d99: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e9d9e: mov dword ptr [rax + 0x28], 0
0x1002e9da5: vmovaps xmm0, xmmword ptr [rip + 0x7cf903] ; 0x100ab96b0
0x1002e9dad: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e9db2: mov byte ptr [rax + 0x40], 0
0x1002e9db6: vxorps ymm0, ymm0, ymm0
0x1002e9dba: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e9dc2: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e9dc7: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e9dcc: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e9dd6: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e9de0: vmovaps xmm0, xmmword ptr [rbx]
0x1002e9de4: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e9dec: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e9df4: vxorps xmm0, xmm0, xmm0
0x1002e9df8: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e9e00: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e9e0a: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e9e12: mov dword ptr [rax + 0xf4], 0
0x1002e9e1c: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e9e26: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e9e2e: mov dword ptr [rax + 0x10c], 0
0x1002e9e38: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e9e42: mov byte ptr [rax + 0x114], 1
0x1002e9e49: mov dword ptr [rax + 0x118], 0
0x1002e9e53: mov dword ptr [rax + 0x11c], 0
0x1002e9e5d: mov qword ptr [rip + 0x1b05c24], rax ; 0x101defa88
0x1002e9e64: mov rdi, r12
0x1002e9e67: mov rsi, rax
0x1002e9e6a: mov rdx, r13
0x1002e9e6d: vzeroupper 
0x1002e9e70: call 0x100314920 ; 0x100314920
0x1002e9e75: lea rsi, [rip + 0x896148] ; 0x100b7ffc4 emoteBlueHeadGlowShyTwo
0x1002e9e7c: mov edx, 0x40
0x1002e9e81: mov rdi, r13
0x1002e9e84: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e9e89: movsx edi, byte ptr [rbp - 0x70]
0x1002e9e8d: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e9e92: mov byte ptr [rbp - 0x70], al
0x1002e9e95: mov rdx, qword ptr [rip + 0x1b057cc] ; 0x101def668
0x1002e9e9c: mov esi, 0x120
0x1002e9ea1: mov ecx, 0x10
0x1002e9ea6: mov rdi, r15
0x1002e9ea9: call 0x100795530 ; 0x100795530
0x1002e9eae: vmovaps xmm0, xmmword ptr [rip + 0x7c2faa] ; 0x100aace60
0x1002e9eb6: vmovups xmmword ptr [rax], xmm0
0x1002e9eba: mov byte ptr [rax + 0x10], 0
0x1002e9ebe: mov byte ptr [rax + 0x11], 1
0x1002e9ec2: mov byte ptr [rax + 0x12], 0
0x1002e9ec6: mov dword ptr [rax + 0x14], 0
0x1002e9ecd: mov dword ptr [rax + 0x18], 0
0x1002e9ed4: vxorps xmm0, xmm0, xmm0
0x1002e9ed8: vmovlps qword ptr [rax + 0x20], xmm0
0x1002e9edd: mov dword ptr [rax + 0x28], 0
0x1002e9ee4: vmovaps xmm0, xmmword ptr [rip + 0x7cf7c4] ; 0x100ab96b0
0x1002e9eec: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002e9ef1: mov byte ptr [rax + 0x40], 0
0x1002e9ef5: vxorps ymm0, ymm0, ymm0
0x1002e9ef9: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002e9f01: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002e9f06: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002e9f0b: mov dword ptr [rax + 0xa4], 0x40600000
0x1002e9f15: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002e9f1f: vmovaps xmm0, xmmword ptr [rbx]
0x1002e9f23: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002e9f2b: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002e9f33: vxorps xmm0, xmm0, xmm0
0x1002e9f37: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002e9f3f: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002e9f49: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002e9f51: mov dword ptr [rax + 0xf4], 0
0x1002e9f5b: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002e9f65: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002e9f6d: mov dword ptr [rax + 0x10c], 0
0x1002e9f77: mov dword ptr [rax + 0x110], 0x3f800000
0x1002e9f81: mov byte ptr [rax + 0x114], 1
0x1002e9f88: mov dword ptr [rax + 0x118], 0
0x1002e9f92: mov dword ptr [rax + 0x11c], 0
0x1002e9f9c: mov qword ptr [rip + 0x1b05aed], rax ; 0x101defa90
0x1002e9fa3: mov rdi, r12
0x1002e9fa6: mov rsi, rax
0x1002e9fa9: mov rdx, r13
0x1002e9fac: vzeroupper 
0x1002e9faf: call 0x100314920 ; 0x100314920
0x1002e9fb4: lea rsi, [rip + 0x896021] ; 0x100b7ffdc emoteattackCharged
0x1002e9fbb: mov edx, 0x40
0x1002e9fc0: mov rdi, r13
0x1002e9fc3: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002e9fc8: movsx edi, byte ptr [rbp - 0x70]
0x1002e9fcc: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002e9fd1: mov byte ptr [rbp - 0x70], al
0x1002e9fd4: mov rdx, qword ptr [rip + 0x1b0568d] ; 0x101def668
0x1002e9fdb: mov esi, 0x120
0x1002e9fe0: mov ecx, 0x10
0x1002e9fe5: mov rdi, r15
0x1002e9fe8: call 0x100795530 ; 0x100795530
0x1002e9fed: vmovaps xmm0, xmmword ptr [rip + 0x7c2e6b] ; 0x100aace60
0x1002e9ff5: vmovups xmmword ptr [rax], xmm0
0x1002e9ff9: mov byte ptr [rax + 0x10], 0
0x1002e9ffd: mov byte ptr [rax + 0x11], 1
0x1002ea001: mov byte ptr [rax + 0x12], 0
0x1002ea005: mov dword ptr [rax + 0x14], 0
0x1002ea00c: mov dword ptr [rax + 0x18], 0
0x1002ea013: vxorps xmm0, xmm0, xmm0
0x1002ea017: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ea01c: mov dword ptr [rax + 0x28], 0
0x1002ea023: vmovaps xmm0, xmmword ptr [rip + 0x7cf685] ; 0x100ab96b0
0x1002ea02b: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ea030: mov byte ptr [rax + 0x40], 0
0x1002ea034: vxorps ymm0, ymm0, ymm0
0x1002ea038: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ea040: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ea045: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ea04a: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ea054: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ea05e: vmovaps xmm0, xmmword ptr [rbx]
0x1002ea062: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ea06a: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ea072: vxorps xmm0, xmm0, xmm0
0x1002ea076: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ea07e: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ea088: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ea090: mov dword ptr [rax + 0xf4], 0
0x1002ea09a: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ea0a4: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ea0ac: mov dword ptr [rax + 0x10c], 0
0x1002ea0b6: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ea0c0: mov byte ptr [rax + 0x114], 1
0x1002ea0c7: mov dword ptr [rax + 0x118], 0
0x1002ea0d1: mov dword ptr [rax + 0x11c], 0
0x1002ea0db: mov qword ptr [rip + 0x1b059b6], rax ; 0x101defa98
0x1002ea0e2: mov rdi, r12
0x1002ea0e5: mov rsi, rax
0x1002ea0e8: mov rdx, r13
0x1002ea0eb: vzeroupper 
0x1002ea0ee: call 0x100314920 ; 0x100314920
0x1002ea0f3: lea rsi, [rip + 0x895ef5] ; 0x100b7ffef emoteFlipLandingExplode
0x1002ea0fa: mov edx, 0x40
0x1002ea0ff: mov rdi, r13
0x1002ea102: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ea107: movsx edi, byte ptr [rbp - 0x70]
0x1002ea10b: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ea110: mov byte ptr [rbp - 0x70], al
0x1002ea113: mov rdx, qword ptr [rip + 0x1b0554e] ; 0x101def668
0x1002ea11a: mov esi, 0x120
0x1002ea11f: mov ecx, 0x10
0x1002ea124: mov rdi, r15
0x1002ea127: call 0x100795530 ; 0x100795530
0x1002ea12c: vmovaps xmm0, xmmword ptr [rip + 0x7c2d2c] ; 0x100aace60
0x1002ea134: vmovups xmmword ptr [rax], xmm0
0x1002ea138: mov byte ptr [rax + 0x10], 0
0x1002ea13c: mov byte ptr [rax + 0x11], 1
0x1002ea140: mov byte ptr [rax + 0x12], 0
0x1002ea144: mov dword ptr [rax + 0x14], 0
0x1002ea14b: mov dword ptr [rax + 0x18], 0
0x1002ea152: vxorps xmm0, xmm0, xmm0
0x1002ea156: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ea15b: mov dword ptr [rax + 0x28], 0
0x1002ea162: vmovaps xmm0, xmmword ptr [rip + 0x7cf546] ; 0x100ab96b0
0x1002ea16a: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ea16f: mov byte ptr [rax + 0x40], 0
0x1002ea173: vxorps ymm0, ymm0, ymm0
0x1002ea177: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ea17f: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ea184: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ea189: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ea193: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ea19d: vmovaps xmm0, xmmword ptr [rbx]
0x1002ea1a1: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ea1a9: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ea1b1: vxorps xmm0, xmm0, xmm0
0x1002ea1b5: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ea1bd: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ea1c7: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ea1cf: mov dword ptr [rax + 0xf4], 0
0x1002ea1d9: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ea1e3: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ea1eb: mov dword ptr [rax + 0x10c], 0
0x1002ea1f5: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ea1ff: mov byte ptr [rax + 0x114], 1
0x1002ea206: mov dword ptr [rax + 0x118], 0
0x1002ea210: mov dword ptr [rax + 0x11c], 0
0x1002ea21a: mov qword ptr [rip + 0x1b0587f], rax ; 0x101defaa0
0x1002ea221: mov rdi, r12
0x1002ea224: mov rsi, rax
0x1002ea227: mov rdx, r13
0x1002ea22a: vzeroupper 
0x1002ea22d: call 0x100314920 ; 0x100314920
0x1002ea232: lea rsi, [rip + 0x895dce] ; 0x100b80007 emoteFlipLandingExplodeTwo
0x1002ea239: mov edx, 0x40
0x1002ea23e: mov rdi, r13
0x1002ea241: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ea246: movsx edi, byte ptr [rbp - 0x70]
0x1002ea24a: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ea24f: mov byte ptr [rbp - 0x70], al
0x1002ea252: mov rdx, qword ptr [rip + 0x1b0540f] ; 0x101def668
0x1002ea259: mov esi, 0x120
0x1002ea25e: mov ecx, 0x10
0x1002ea263: mov rdi, r15
0x1002ea266: call 0x100795530 ; 0x100795530
0x1002ea26b: vmovaps xmm0, xmmword ptr [rip + 0x7c2bed] ; 0x100aace60
0x1002ea273: vmovups xmmword ptr [rax], xmm0
0x1002ea277: mov byte ptr [rax + 0x10], 0
0x1002ea27b: mov byte ptr [rax + 0x11], 1
0x1002ea27f: mov byte ptr [rax + 0x12], 0
0x1002ea283: mov dword ptr [rax + 0x14], 0
0x1002ea28a: mov dword ptr [rax + 0x18], 0
0x1002ea291: vxorps xmm0, xmm0, xmm0
0x1002ea295: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ea29a: mov dword ptr [rax + 0x28], 0
0x1002ea2a1: vmovaps xmm0, xmmword ptr [rip + 0x7cf407] ; 0x100ab96b0
0x1002ea2a9: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ea2ae: mov byte ptr [rax + 0x40], 0
0x1002ea2b2: vxorps ymm0, ymm0, ymm0
0x1002ea2b6: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ea2be: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ea2c3: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ea2c8: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ea2d2: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ea2dc: vmovaps xmm0, xmmword ptr [rbx]
0x1002ea2e0: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ea2e8: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ea2f0: vxorps xmm0, xmm0, xmm0
0x1002ea2f4: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ea2fc: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ea306: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ea30e: mov dword ptr [rax + 0xf4], 0
0x1002ea318: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ea322: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ea32a: mov dword ptr [rax + 0x10c], 0
0x1002ea334: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ea33e: mov byte ptr [rax + 0x114], 1
0x1002ea345: mov dword ptr [rax + 0x118], 0
0x1002ea34f: mov dword ptr [rax + 0x11c], 0
0x1002ea359: mov qword ptr [rip + 0x1b05748], rax ; 0x101defaa8
0x1002ea360: mov rdi, r12
0x1002ea363: mov rsi, rax
0x1002ea366: mov rdx, r13
0x1002ea369: vzeroupper 
0x1002ea36c: call 0x100314920 ; 0x100314920
0x1002ea371: lea rsi, [rip + 0x895caa] ; 0x100b80022 emoteGlowApologizeTwo
0x1002ea378: mov edx, 0x40
0x1002ea37d: mov rdi, r13
0x1002ea380: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ea385: movsx edi, byte ptr [rbp - 0x70]
0x1002ea389: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ea38e: mov byte ptr [rbp - 0x70], al
0x1002ea391: mov rdx, qword ptr [rip + 0x1b052d0] ; 0x101def668
0x1002ea398: mov esi, 0x120
0x1002ea39d: mov ecx, 0x10
0x1002ea3a2: mov rdi, r15
0x1002ea3a5: call 0x100795530 ; 0x100795530
0x1002ea3aa: vmovaps xmm0, xmmword ptr [rip + 0x7c2aae] ; 0x100aace60
0x1002ea3b2: vmovups xmmword ptr [rax], xmm0
0x1002ea3b6: mov byte ptr [rax + 0x10], 0
0x1002ea3ba: mov byte ptr [rax + 0x11], 1
0x1002ea3be: mov byte ptr [rax + 0x12], 0
0x1002ea3c2: mov dword ptr [rax + 0x14], 0
0x1002ea3c9: mov dword ptr [rax + 0x18], 0
0x1002ea3d0: vxorps xmm0, xmm0, xmm0
0x1002ea3d4: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ea3d9: mov dword ptr [rax + 0x28], 0
0x1002ea3e0: vmovaps xmm0, xmmword ptr [rip + 0x7cf2c8] ; 0x100ab96b0
0x1002ea3e8: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ea3ed: mov byte ptr [rax + 0x40], 0
0x1002ea3f1: vxorps ymm0, ymm0, ymm0
0x1002ea3f5: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ea3fd: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ea402: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ea407: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ea411: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ea41b: vmovaps xmm0, xmmword ptr [rbx]
0x1002ea41f: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ea427: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ea42f: vxorps xmm0, xmm0, xmm0
0x1002ea433: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ea43b: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ea445: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ea44d: mov dword ptr [rax + 0xf4], 0
0x1002ea457: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ea461: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ea469: mov dword ptr [rax + 0x10c], 0
0x1002ea473: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ea47d: mov byte ptr [rax + 0x114], 1
0x1002ea484: mov dword ptr [rax + 0x118], 0
0x1002ea48e: mov dword ptr [rax + 0x11c], 0
0x1002ea498: mov qword ptr [rip + 0x1b05611], rax ; 0x101defab0
0x1002ea49f: mov rdi, r12
0x1002ea4a2: mov rsi, rax
0x1002ea4a5: mov rdx, r13
0x1002ea4a8: vzeroupper 
0x1002ea4ab: call 0x100314920 ; 0x100314920
0x1002ea4b0: lea rsi, [rip + 0x895b81] ; 0x100b80038 emoteBlowKissTwo
0x1002ea4b7: mov edx, 0x40
0x1002ea4bc: mov rdi, r13
0x1002ea4bf: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ea4c4: movsx edi, byte ptr [rbp - 0x70]
0x1002ea4c8: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ea4cd: mov byte ptr [rbp - 0x70], al
0x1002ea4d0: mov rdx, qword ptr [rip + 0x1b05191] ; 0x101def668
0x1002ea4d7: mov esi, 0x120
0x1002ea4dc: mov ecx, 0x10
0x1002ea4e1: mov rdi, r15
0x1002ea4e4: call 0x100795530 ; 0x100795530
0x1002ea4e9: vmovaps xmm0, xmmword ptr [rip + 0x7c296f] ; 0x100aace60
0x1002ea4f1: vmovups xmmword ptr [rax], xmm0
0x1002ea4f5: mov byte ptr [rax + 0x10], 0
0x1002ea4f9: mov byte ptr [rax + 0x11], 1
0x1002ea4fd: mov byte ptr [rax + 0x12], 0
0x1002ea501: mov dword ptr [rax + 0x14], 0
0x1002ea508: mov dword ptr [rax + 0x18], 0
0x1002ea50f: vxorps xmm0, xmm0, xmm0
0x1002ea513: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ea518: mov dword ptr [rax + 0x28], 0
0x1002ea51f: vmovaps xmm0, xmmword ptr [rip + 0x7cf189] ; 0x100ab96b0
0x1002ea527: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ea52c: mov byte ptr [rax + 0x40], 0
0x1002ea530: vxorps ymm0, ymm0, ymm0
0x1002ea534: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ea53c: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ea541: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ea546: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ea550: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ea55a: vmovaps xmm0, xmmword ptr [rbx]
0x1002ea55e: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ea566: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ea56e: vxorps xmm0, xmm0, xmm0
0x1002ea572: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ea57a: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ea584: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ea58c: mov dword ptr [rax + 0xf4], 0
0x1002ea596: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ea5a0: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ea5a8: mov dword ptr [rax + 0x10c], 0
0x1002ea5b2: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ea5bc: mov byte ptr [rax + 0x114], 1
0x1002ea5c3: mov dword ptr [rax + 0x118], 0
0x1002ea5cd: mov dword ptr [rax + 0x11c], 0
0x1002ea5d7: mov qword ptr [rip + 0x1b054da], rax ; 0x101defab8
0x1002ea5de: mov rdi, r12
0x1002ea5e1: mov rsi, rax
0x1002ea5e4: mov rdx, r13
0x1002ea5e7: vzeroupper 
0x1002ea5ea: call 0x100314920 ; 0x100314920
0x1002ea5ef: lea rsi, [rip + 0x895a53] ; 0x100b80049 emoteLookAround
0x1002ea5f6: mov edx, 0x40
0x1002ea5fb: mov rdi, r13
0x1002ea5fe: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ea603: movsx edi, byte ptr [rbp - 0x70]
0x1002ea607: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ea60c: mov byte ptr [rbp - 0x70], al
0x1002ea60f: mov rdx, qword ptr [rip + 0x1b05052] ; 0x101def668
0x1002ea616: mov esi, 0x120
0x1002ea61b: mov ecx, 0x10
0x1002ea620: mov rdi, r15
0x1002ea623: call 0x100795530 ; 0x100795530
0x1002ea628: vmovaps xmm0, xmmword ptr [rip + 0x7c2830] ; 0x100aace60
0x1002ea630: vmovups xmmword ptr [rax], xmm0
0x1002ea634: mov byte ptr [rax + 0x10], 0
0x1002ea638: mov byte ptr [rax + 0x11], 1
0x1002ea63c: mov byte ptr [rax + 0x12], 0
0x1002ea640: mov dword ptr [rax + 0x14], 0
0x1002ea647: mov dword ptr [rax + 0x18], 0
0x1002ea64e: vxorps xmm0, xmm0, xmm0
0x1002ea652: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ea657: mov dword ptr [rax + 0x28], 0
0x1002ea65e: vmovaps xmm0, xmmword ptr [rip + 0x7cf04a] ; 0x100ab96b0
0x1002ea666: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ea66b: mov byte ptr [rax + 0x40], 0
0x1002ea66f: vxorps ymm0, ymm0, ymm0
0x1002ea673: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ea67b: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ea680: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ea685: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ea68f: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ea699: vmovaps xmm0, xmmword ptr [rbx]
0x1002ea69d: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ea6a5: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ea6ad: vxorps xmm0, xmm0, xmm0
0x1002ea6b1: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ea6b9: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ea6c3: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ea6cb: mov dword ptr [rax + 0xf4], 0
0x1002ea6d5: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ea6df: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ea6e7: mov dword ptr [rax + 0x10c], 0
0x1002ea6f1: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ea6fb: mov byte ptr [rax + 0x114], 1
0x1002ea702: mov dword ptr [rax + 0x118], 0
0x1002ea70c: mov dword ptr [rax + 0x11c], 0
0x1002ea716: mov qword ptr [rip + 0x1b053a3], rax ; 0x101defac0
0x1002ea71d: mov rdi, r12
0x1002ea720: mov rsi, rax
0x1002ea723: mov rdx, r13
0x1002ea726: vzeroupper 
0x1002ea729: call 0x100314920 ; 0x100314920
0x1002ea72e: lea rsi, [rip + 0x895924] ; 0x100b80059 emoteRingFaintTwo
0x1002ea735: mov edx, 0x40
0x1002ea73a: mov rdi, r13
0x1002ea73d: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ea742: movsx edi, byte ptr [rbp - 0x70]
0x1002ea746: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ea74b: mov byte ptr [rbp - 0x70], al
0x1002ea74e: mov rdx, qword ptr [rip + 0x1b04f13] ; 0x101def668
0x1002ea755: mov esi, 0x120
0x1002ea75a: mov ecx, 0x10
0x1002ea75f: mov rdi, r15
0x1002ea762: call 0x100795530 ; 0x100795530
0x1002ea767: vmovaps xmm0, xmmword ptr [rip + 0x7c26f1] ; 0x100aace60
0x1002ea76f: vmovups xmmword ptr [rax], xmm0
0x1002ea773: mov byte ptr [rax + 0x10], 0
0x1002ea777: mov byte ptr [rax + 0x11], 1
0x1002ea77b: mov byte ptr [rax + 0x12], 0
0x1002ea77f: mov dword ptr [rax + 0x14], 0
0x1002ea786: mov dword ptr [rax + 0x18], 0
0x1002ea78d: vxorps xmm0, xmm0, xmm0
0x1002ea791: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ea796: mov dword ptr [rax + 0x28], 0
0x1002ea79d: vmovaps xmm0, xmmword ptr [rip + 0x7cef0b] ; 0x100ab96b0
0x1002ea7a5: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ea7aa: mov byte ptr [rax + 0x40], 0
0x1002ea7ae: vxorps ymm0, ymm0, ymm0
0x1002ea7b2: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ea7ba: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ea7bf: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ea7c4: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ea7ce: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ea7d8: vmovaps xmm0, xmmword ptr [rbx]
0x1002ea7dc: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ea7e4: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ea7ec: vxorps xmm0, xmm0, xmm0
0x1002ea7f0: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ea7f8: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ea802: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ea80a: mov dword ptr [rax + 0xf4], 0
0x1002ea814: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ea81e: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ea826: mov dword ptr [rax + 0x10c], 0
0x1002ea830: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ea83a: mov byte ptr [rax + 0x114], 1
0x1002ea841: mov dword ptr [rax + 0x118], 0
0x1002ea84b: mov dword ptr [rax + 0x11c], 0
0x1002ea855: mov qword ptr [rip + 0x1b0526c], rax ; 0x101defac8
0x1002ea85c: mov rdi, r12
0x1002ea85f: mov rsi, rax
0x1002ea862: mov rdx, r13
0x1002ea865: vzeroupper 
0x1002ea868: call 0x100314920 ; 0x100314920
0x1002ea86d: lea rsi, [rip + 0x8957f7] ; 0x100b8006b emotePrayOne
0x1002ea874: mov edx, 0x40
0x1002ea879: mov rdi, r13
0x1002ea87c: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ea881: movsx edi, byte ptr [rbp - 0x70]
0x1002ea885: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ea88a: mov byte ptr [rbp - 0x70], al
0x1002ea88d: mov rdx, qword ptr [rip + 0x1b04dd4] ; 0x101def668
0x1002ea894: mov esi, 0x120
0x1002ea899: mov ecx, 0x10
0x1002ea89e: mov rdi, r15
0x1002ea8a1: call 0x100795530 ; 0x100795530
0x1002ea8a6: vmovaps xmm0, xmmword ptr [rip + 0x7c25b2] ; 0x100aace60
0x1002ea8ae: vmovups xmmword ptr [rax], xmm0
0x1002ea8b2: mov byte ptr [rax + 0x10], 0
0x1002ea8b6: mov byte ptr [rax + 0x11], 1
0x1002ea8ba: mov byte ptr [rax + 0x12], 0
0x1002ea8be: mov dword ptr [rax + 0x14], 0
0x1002ea8c5: mov dword ptr [rax + 0x18], 0
0x1002ea8cc: vxorps xmm0, xmm0, xmm0
0x1002ea8d0: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ea8d5: mov dword ptr [rax + 0x28], 0
0x1002ea8dc: vmovaps xmm0, xmmword ptr [rip + 0x7cedcc] ; 0x100ab96b0
0x1002ea8e4: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ea8e9: mov byte ptr [rax + 0x40], 0
0x1002ea8ed: vxorps ymm0, ymm0, ymm0
0x1002ea8f1: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ea8f9: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ea8fe: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ea903: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ea90d: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ea917: vmovaps xmm0, xmmword ptr [rbx]
0x1002ea91b: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ea923: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ea92b: vxorps xmm0, xmm0, xmm0
0x1002ea92f: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ea937: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ea941: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ea949: mov dword ptr [rax + 0xf4], 0
0x1002ea953: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ea95d: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ea965: mov dword ptr [rax + 0x10c], 0
0x1002ea96f: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ea979: mov byte ptr [rax + 0x114], 1
0x1002ea980: mov dword ptr [rax + 0x118], 0
0x1002ea98a: mov dword ptr [rax + 0x11c], 0
0x1002ea994: mov qword ptr [rip + 0x1b05135], rax ; 0x101defad0
0x1002ea99b: mov rdi, r12
0x1002ea99e: mov rsi, rax
0x1002ea9a1: mov rdx, r13
0x1002ea9a4: vzeroupper 
0x1002ea9a7: call 0x100314920 ; 0x100314920
0x1002ea9ac: lea rsi, [rip + 0x8956c5] ; 0x100b80078 emoteHaHaLaughTwo
0x1002ea9b3: mov edx, 0x40
0x1002ea9b8: mov rdi, r13
0x1002ea9bb: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ea9c0: movsx edi, byte ptr [rbp - 0x70]
0x1002ea9c4: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ea9c9: mov byte ptr [rbp - 0x70], al
0x1002ea9cc: mov rdx, qword ptr [rip + 0x1b04c95] ; 0x101def668
0x1002ea9d3: mov esi, 0x120
0x1002ea9d8: mov ecx, 0x10
0x1002ea9dd: mov rdi, r15
0x1002ea9e0: call 0x100795530 ; 0x100795530
0x1002ea9e5: vmovaps xmm0, xmmword ptr [rip + 0x7c2473] ; 0x100aace60
0x1002ea9ed: vmovups xmmword ptr [rax], xmm0
0x1002ea9f1: mov byte ptr [rax + 0x10], 0
0x1002ea9f5: mov byte ptr [rax + 0x11], 1
0x1002ea9f9: mov byte ptr [rax + 0x12], 0
0x1002ea9fd: mov dword ptr [rax + 0x14], 0
0x1002eaa04: mov dword ptr [rax + 0x18], 0
0x1002eaa0b: vxorps xmm0, xmm0, xmm0
0x1002eaa0f: vmovlps qword ptr [rax + 0x20], xmm0
0x1002eaa14: mov dword ptr [rax + 0x28], 0
0x1002eaa1b: vmovaps xmm0, xmmword ptr [rip + 0x7cec8d] ; 0x100ab96b0
0x1002eaa23: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002eaa28: mov byte ptr [rax + 0x40], 0
0x1002eaa2c: vxorps ymm0, ymm0, ymm0
0x1002eaa30: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002eaa38: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002eaa3d: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002eaa42: mov dword ptr [rax + 0xa4], 0x40600000
0x1002eaa4c: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002eaa56: vmovaps xmm0, xmmword ptr [rbx]
0x1002eaa5a: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002eaa62: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002eaa6a: vxorps xmm0, xmm0, xmm0
0x1002eaa6e: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002eaa76: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002eaa80: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002eaa88: mov dword ptr [rax + 0xf4], 0
0x1002eaa92: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002eaa9c: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002eaaa4: mov dword ptr [rax + 0x10c], 0
0x1002eaaae: mov dword ptr [rax + 0x110], 0x3f800000
0x1002eaab8: mov byte ptr [rax + 0x114], 1
0x1002eaabf: mov dword ptr [rax + 0x118], 0
0x1002eaac9: mov dword ptr [rax + 0x11c], 0
0x1002eaad3: mov qword ptr [rip + 0x1b04ffe], rax ; 0x101defad8
0x1002eaada: mov rdi, r12
0x1002eaadd: mov rsi, rax
0x1002eaae0: mov rdx, r13
0x1002eaae3: vzeroupper 
0x1002eaae6: call 0x100314920 ; 0x100314920
0x1002eaaeb: lea rsi, [rip + 0x895598] ; 0x100b8008a emoteTearsThree
0x1002eaaf2: mov edx, 0x40
0x1002eaaf7: mov rdi, r13
0x1002eaafa: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002eaaff: movsx edi, byte ptr [rbp - 0x70]
0x1002eab03: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002eab08: mov byte ptr [rbp - 0x70], al
0x1002eab0b: mov rdx, qword ptr [rip + 0x1b04b56] ; 0x101def668
0x1002eab12: mov esi, 0x120
0x1002eab17: mov ecx, 0x10
0x1002eab1c: mov rdi, r15
0x1002eab1f: call 0x100795530 ; 0x100795530
0x1002eab24: vmovaps xmm0, xmmword ptr [rip + 0x7c2334] ; 0x100aace60
0x1002eab2c: vmovups xmmword ptr [rax], xmm0
0x1002eab30: mov byte ptr [rax + 0x10], 0
0x1002eab34: mov byte ptr [rax + 0x11], 1
0x1002eab38: mov byte ptr [rax + 0x12], 0
0x1002eab3c: mov dword ptr [rax + 0x14], 0
0x1002eab43: mov dword ptr [rax + 0x18], 0
0x1002eab4a: vxorps xmm0, xmm0, xmm0
0x1002eab4e: vmovlps qword ptr [rax + 0x20], xmm0
0x1002eab53: mov dword ptr [rax + 0x28], 0
0x1002eab5a: vmovaps xmm0, xmmword ptr [rip + 0x7ceb4e] ; 0x100ab96b0
0x1002eab62: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002eab67: mov byte ptr [rax + 0x40], 0
0x1002eab6b: vxorps ymm0, ymm0, ymm0
0x1002eab6f: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002eab77: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002eab7c: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002eab81: mov dword ptr [rax + 0xa4], 0x40600000
0x1002eab8b: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002eab95: vmovaps xmm0, xmmword ptr [rbx]
0x1002eab99: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002eaba1: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002eaba9: vxorps xmm0, xmm0, xmm0
0x1002eabad: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002eabb5: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002eabbf: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002eabc7: mov dword ptr [rax + 0xf4], 0
0x1002eabd1: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002eabdb: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002eabe3: mov dword ptr [rax + 0x10c], 0
0x1002eabed: mov dword ptr [rax + 0x110], 0x3f800000
0x1002eabf7: mov byte ptr [rax + 0x114], 1
0x1002eabfe: mov dword ptr [rax + 0x118], 0
0x1002eac08: mov dword ptr [rax + 0x11c], 0
0x1002eac12: mov qword ptr [rip + 0x1b04ec7], rax ; 0x101defae0
0x1002eac19: mov rdi, r12
0x1002eac1c: mov rsi, rax
0x1002eac1f: mov rdx, r13
0x1002eac22: vzeroupper 
0x1002eac25: call 0x100314920 ; 0x100314920
0x1002eac2a: lea rsi, [rip + 0x895469] ; 0x100b8009a emoteLookAroundTwo
0x1002eac31: mov edx, 0x40
0x1002eac36: mov rdi, r13
0x1002eac39: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002eac3e: movsx edi, byte ptr [rbp - 0x70]
0x1002eac42: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002eac47: mov byte ptr [rbp - 0x70], al
0x1002eac4a: mov rdx, qword ptr [rip + 0x1b04a17] ; 0x101def668
0x1002eac51: mov esi, 0x120
0x1002eac56: mov ecx, 0x10
0x1002eac5b: mov rdi, r15
0x1002eac5e: call 0x100795530 ; 0x100795530
0x1002eac63: vmovaps xmm0, xmmword ptr [rip + 0x7c21f5] ; 0x100aace60
0x1002eac6b: vmovups xmmword ptr [rax], xmm0
0x1002eac6f: mov byte ptr [rax + 0x10], 0
0x1002eac73: mov byte ptr [rax + 0x11], 1
0x1002eac77: mov byte ptr [rax + 0x12], 0
0x1002eac7b: mov dword ptr [rax + 0x14], 0
0x1002eac82: mov dword ptr [rax + 0x18], 0
0x1002eac89: vxorps xmm0, xmm0, xmm0
0x1002eac8d: vmovlps qword ptr [rax + 0x20], xmm0
0x1002eac92: mov dword ptr [rax + 0x28], 0
0x1002eac99: vmovaps xmm0, xmmword ptr [rip + 0x7cea0f] ; 0x100ab96b0
0x1002eaca1: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002eaca6: mov byte ptr [rax + 0x40], 0
0x1002eacaa: vxorps ymm0, ymm0, ymm0
0x1002eacae: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002eacb6: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002eacbb: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002eacc0: mov dword ptr [rax + 0xa4], 0x40600000
0x1002eacca: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002eacd4: vmovaps xmm0, xmmword ptr [rbx]
0x1002eacd8: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002eace0: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002eace8: vxorps xmm0, xmm0, xmm0
0x1002eacec: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002eacf4: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002eacfe: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ead06: mov dword ptr [rax + 0xf4], 0
0x1002ead10: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ead1a: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ead22: mov dword ptr [rax + 0x10c], 0
0x1002ead2c: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ead36: mov byte ptr [rax + 0x114], 1
0x1002ead3d: mov dword ptr [rax + 0x118], 0
0x1002ead47: mov dword ptr [rax + 0x11c], 0
0x1002ead51: mov qword ptr [rip + 0x1b04d90], rax ; 0x101defae8
0x1002ead58: mov rdi, r12
0x1002ead5b: mov rsi, rax
0x1002ead5e: mov rdx, r13
0x1002ead61: vzeroupper 
0x1002ead64: call 0x100314920 ; 0x100314920
0x1002ead69: lea rsi, [rip + 0x89533d] ; 0x100b800ad dawnChestOne
0x1002ead70: mov edx, 0x40
0x1002ead75: mov rdi, r13
0x1002ead78: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ead7d: movsx edi, byte ptr [rbp - 0x70]
0x1002ead81: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ead86: mov byte ptr [rbp - 0x70], al
0x1002ead89: mov rdx, qword ptr [rip + 0x1b048d8] ; 0x101def668
0x1002ead90: mov esi, 0x120
0x1002ead95: mov ecx, 0x10
0x1002ead9a: mov rdi, r15
0x1002ead9d: call 0x100795530 ; 0x100795530
0x1002eada2: vmovaps xmm0, xmmword ptr [rip + 0x7c20b6] ; 0x100aace60
0x1002eadaa: vmovups xmmword ptr [rax], xmm0
0x1002eadae: mov byte ptr [rax + 0x10], 0
0x1002eadb2: mov byte ptr [rax + 0x11], 1
0x1002eadb6: mov byte ptr [rax + 0x12], 0
0x1002eadba: mov dword ptr [rax + 0x14], 0
0x1002eadc1: mov dword ptr [rax + 0x18], 0
0x1002eadc8: vxorps xmm0, xmm0, xmm0
0x1002eadcc: vmovlps qword ptr [rax + 0x20], xmm0
0x1002eadd1: mov dword ptr [rax + 0x28], 0
0x1002eadd8: vmovaps xmm0, xmmword ptr [rip + 0x7ce8d0] ; 0x100ab96b0
0x1002eade0: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002eade5: mov byte ptr [rax + 0x40], 0
0x1002eade9: vxorps ymm0, ymm0, ymm0
0x1002eaded: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002eadf5: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002eadfa: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002eadff: mov dword ptr [rax + 0xa4], 0x40600000
0x1002eae09: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002eae13: vmovaps xmm0, xmmword ptr [rbx]
0x1002eae17: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002eae1f: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002eae27: vxorps xmm0, xmm0, xmm0
0x1002eae2b: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002eae33: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002eae3d: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002eae45: mov dword ptr [rax + 0xf4], 0
0x1002eae4f: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002eae59: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002eae61: mov dword ptr [rax + 0x10c], 0
0x1002eae6b: mov dword ptr [rax + 0x110], 0x3f800000
0x1002eae75: mov byte ptr [rax + 0x114], 1
0x1002eae7c: mov dword ptr [rax + 0x118], 0
0x1002eae86: mov dword ptr [rax + 0x11c], 0
0x1002eae90: mov qword ptr [rip + 0x1b04c59], rax ; 0x101defaf0
0x1002eae97: mov rdi, r12
0x1002eae9a: mov rsi, rax
0x1002eae9d: mov rdx, r13
0x1002eaea0: vzeroupper 
0x1002eaea3: call 0x100314920 ; 0x100314920
0x1002eaea8: lea rsi, [rip + 0x89520b] ; 0x100b800ba dawnChestTwo
0x1002eaeaf: mov edx, 0x40
0x1002eaeb4: mov rdi, r13
0x1002eaeb7: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002eaebc: movsx edi, byte ptr [rbp - 0x70]
0x1002eaec0: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002eaec5: mov byte ptr [rbp - 0x70], al
0x1002eaec8: mov rdx, qword ptr [rip + 0x1b04799] ; 0x101def668
0x1002eaecf: mov esi, 0x120
0x1002eaed4: mov ecx, 0x10
0x1002eaed9: mov rdi, r15
0x1002eaedc: call 0x100795530 ; 0x100795530
0x1002eaee1: vmovaps xmm0, xmmword ptr [rip + 0x7c1f77] ; 0x100aace60
0x1002eaee9: vmovups xmmword ptr [rax], xmm0
0x1002eaeed: mov byte ptr [rax + 0x10], 0
0x1002eaef1: mov byte ptr [rax + 0x11], 1
0x1002eaef5: mov byte ptr [rax + 0x12], 0
0x1002eaef9: mov dword ptr [rax + 0x14], 0
0x1002eaf00: mov dword ptr [rax + 0x18], 0
0x1002eaf07: vxorps xmm0, xmm0, xmm0
0x1002eaf0b: vmovlps qword ptr [rax + 0x20], xmm0
0x1002eaf10: mov dword ptr [rax + 0x28], 0
0x1002eaf17: vmovaps xmm0, xmmword ptr [rip + 0x7ce791] ; 0x100ab96b0
0x1002eaf1f: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002eaf24: mov byte ptr [rax + 0x40], 0
0x1002eaf28: vxorps ymm0, ymm0, ymm0
0x1002eaf2c: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002eaf34: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002eaf39: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002eaf3e: mov dword ptr [rax + 0xa4], 0x40600000
0x1002eaf48: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002eaf52: vmovaps xmm0, xmmword ptr [rbx]
0x1002eaf56: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002eaf5e: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002eaf66: vxorps xmm0, xmm0, xmm0
0x1002eaf6a: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002eaf72: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002eaf7c: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002eaf84: mov dword ptr [rax + 0xf4], 0
0x1002eaf8e: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002eaf98: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002eafa0: mov dword ptr [rax + 0x10c], 0
0x1002eafaa: mov dword ptr [rax + 0x110], 0x3f800000
0x1002eafb4: mov byte ptr [rax + 0x114], 1
0x1002eafbb: mov dword ptr [rax + 0x118], 0
0x1002eafc5: mov dword ptr [rax + 0x11c], 0
0x1002eafcf: mov qword ptr [rip + 0x1b04b22], rax ; 0x101defaf8
0x1002eafd6: mov rdi, r12
0x1002eafd9: mov rsi, rax
0x1002eafdc: mov rdx, r13
0x1002eafdf: vzeroupper 
0x1002eafe2: call 0x100314920 ; 0x100314920
0x1002eafe7: lea rsi, [rip + 0x8950d9] ; 0x100b800c7 dawnChestThree
0x1002eafee: mov edx, 0x40
0x1002eaff3: mov rdi, r13
0x1002eaff6: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002eaffb: movsx edi, byte ptr [rbp - 0x70]
0x1002eafff: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002eb004: mov byte ptr [rbp - 0x70], al
0x1002eb007: mov rdx, qword ptr [rip + 0x1b0465a] ; 0x101def668
0x1002eb00e: mov esi, 0x120
0x1002eb013: mov ecx, 0x10
0x1002eb018: mov rdi, r15
0x1002eb01b: call 0x100795530 ; 0x100795530
0x1002eb020: vmovaps xmm0, xmmword ptr [rip + 0x7c1e38] ; 0x100aace60
0x1002eb028: vmovups xmmword ptr [rax], xmm0
0x1002eb02c: mov byte ptr [rax + 0x10], 0
0x1002eb030: mov byte ptr [rax + 0x11], 1
0x1002eb034: mov byte ptr [rax + 0x12], 0
0x1002eb038: mov dword ptr [rax + 0x14], 0
0x1002eb03f: mov dword ptr [rax + 0x18], 0
0x1002eb046: vxorps xmm0, xmm0, xmm0
0x1002eb04a: vmovlps qword ptr [rax + 0x20], xmm0
0x1002eb04f: mov dword ptr [rax + 0x28], 0
0x1002eb056: vmovaps xmm0, xmmword ptr [rip + 0x7ce652] ; 0x100ab96b0
0x1002eb05e: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002eb063: mov byte ptr [rax + 0x40], 0
0x1002eb067: vxorps ymm0, ymm0, ymm0
0x1002eb06b: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002eb073: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002eb078: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002eb07d: mov dword ptr [rax + 0xa4], 0x40600000
0x1002eb087: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002eb091: vmovaps xmm0, xmmword ptr [rbx]
0x1002eb095: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002eb09d: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002eb0a5: vxorps xmm0, xmm0, xmm0
0x1002eb0a9: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002eb0b1: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002eb0bb: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002eb0c3: mov dword ptr [rax + 0xf4], 0
0x1002eb0cd: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002eb0d7: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002eb0df: mov dword ptr [rax + 0x10c], 0
0x1002eb0e9: mov dword ptr [rax + 0x110], 0x3f800000
0x1002eb0f3: mov byte ptr [rax + 0x114], 1
0x1002eb0fa: mov dword ptr [rax + 0x118], 0
0x1002eb104: mov dword ptr [rax + 0x11c], 0
0x1002eb10e: mov qword ptr [rip + 0x1b049eb], rax ; 0x101defb00
0x1002eb115: mov rdi, r12
0x1002eb118: mov rsi, rax
0x1002eb11b: mov rdx, r13
0x1002eb11e: vzeroupper 
0x1002eb121: call 0x100314920 ; 0x100314920
0x1002eb126: lea rsi, [rip + 0x894fa9] ; 0x100b800d6 dawnChestPulse
0x1002eb12d: mov edx, 0x40
0x1002eb132: mov rdi, r13
0x1002eb135: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002eb13a: movsx edi, byte ptr [rbp - 0x70]
0x1002eb13e: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002eb143: mov byte ptr [rbp - 0x70], al
0x1002eb146: mov rdx, qword ptr [rip + 0x1b0451b] ; 0x101def668
0x1002eb14d: mov esi, 0x120
0x1002eb152: mov ecx, 0x10
0x1002eb157: mov rdi, r15
0x1002eb15a: call 0x100795530 ; 0x100795530
0x1002eb15f: vmovaps xmm0, xmmword ptr [rip + 0x7c1cf9] ; 0x100aace60
0x1002eb167: vmovups xmmword ptr [rax], xmm0
0x1002eb16b: mov byte ptr [rax + 0x10], 0
0x1002eb16f: mov byte ptr [rax + 0x11], 1
0x1002eb173: mov byte ptr [rax + 0x12], 0
0x1002eb177: mov dword ptr [rax + 0x14], 0
0x1002eb17e: mov dword ptr [rax + 0x18], 0
0x1002eb185: vxorps xmm0, xmm0, xmm0
0x1002eb189: vmovlps qword ptr [rax + 0x20], xmm0
0x1002eb18e: mov dword ptr [rax + 0x28], 0
0x1002eb195: vmovaps xmm0, xmmword ptr [rip + 0x7ce513] ; 0x100ab96b0
0x1002eb19d: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002eb1a2: mov byte ptr [rax + 0x40], 0
0x1002eb1a6: vxorps ymm0, ymm0, ymm0
0x1002eb1aa: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002eb1b2: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002eb1b7: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002eb1bc: mov dword ptr [rax + 0xa4], 0x40600000
0x1002eb1c6: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002eb1d0: vmovaps xmm0, xmmword ptr [rbx]
0x1002eb1d4: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002eb1dc: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002eb1e4: vxorps xmm0, xmm0, xmm0
0x1002eb1e8: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002eb1f0: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002eb1fa: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002eb202: mov dword ptr [rax + 0xf4], 0
0x1002eb20c: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002eb216: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002eb21e: mov dword ptr [rax + 0x10c], 0
0x1002eb228: mov dword ptr [rax + 0x110], 0x3f800000
0x1002eb232: mov byte ptr [rax + 0x114], 1
0x1002eb239: mov dword ptr [rax + 0x118], 0
0x1002eb243: mov dword ptr [rax + 0x11c], 0
0x1002eb24d: mov qword ptr [rip + 0x1b048b4], rax ; 0x101defb08
0x1002eb254: mov rdi, r12
0x1002eb257: mov rsi, rax
0x1002eb25a: mov rdx, r13
0x1002eb25d: vzeroupper 
0x1002eb260: call 0x100314920 ; 0x100314920
0x1002eb265: lea rsi, [rip + 0x894e79] ; 0x100b800e5 dawnChestPulseTwo
0x1002eb26c: mov edx, 0x40
0x1002eb271: mov rdi, r13
0x1002eb274: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002eb279: movsx edi, byte ptr [rbp - 0x70]
0x1002eb27d: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002eb282: mov byte ptr [rbp - 0x70], al
0x1002eb285: mov rdx, qword ptr [rip + 0x1b043dc] ; 0x101def668
0x1002eb28c: mov esi, 0x120
0x1002eb291: mov ecx, 0x10
0x1002eb296: mov rdi, r15
0x1002eb299: call 0x100795530 ; 0x100795530
0x1002eb29e: vmovaps xmm0, xmmword ptr [rip + 0x7c1bba] ; 0x100aace60
0x1002eb2a6: vmovups xmmword ptr [rax], xmm0
0x1002eb2aa: mov byte ptr [rax + 0x10], 0
0x1002eb2ae: mov byte ptr [rax + 0x11], 1
0x1002eb2b2: mov byte ptr [rax + 0x12], 0
0x1002eb2b6: mov dword ptr [rax + 0x14], 0
0x1002eb2bd: mov dword ptr [rax + 0x18], 0
0x1002eb2c4: vxorps xmm0, xmm0, xmm0
0x1002eb2c8: vmovlps qword ptr [rax + 0x20], xmm0
0x1002eb2cd: mov dword ptr [rax + 0x28], 0
0x1002eb2d4: vmovaps xmm0, xmmword ptr [rip + 0x7ce3d4] ; 0x100ab96b0
0x1002eb2dc: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002eb2e1: mov byte ptr [rax + 0x40], 0
0x1002eb2e5: vxorps ymm0, ymm0, ymm0
0x1002eb2e9: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002eb2f1: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002eb2f6: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002eb2fb: mov dword ptr [rax + 0xa4], 0x40600000
0x1002eb305: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002eb30f: vmovaps xmm0, xmmword ptr [rbx]
0x1002eb313: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002eb31b: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002eb323: vxorps xmm0, xmm0, xmm0
0x1002eb327: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002eb32f: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002eb339: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002eb341: mov dword ptr [rax + 0xf4], 0
0x1002eb34b: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002eb355: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002eb35d: mov dword ptr [rax + 0x10c], 0
0x1002eb367: mov dword ptr [rax + 0x110], 0x3f800000
0x1002eb371: mov byte ptr [rax + 0x114], 1
0x1002eb378: mov dword ptr [rax + 0x118], 0
0x1002eb382: mov dword ptr [rax + 0x11c], 0
0x1002eb38c: mov qword ptr [rip + 0x1b0477d], rax ; 0x101defb10
0x1002eb393: mov rdi, r12
0x1002eb396: mov rsi, rax
0x1002eb399: mov rdx, r13
0x1002eb39c: vzeroupper 
0x1002eb39f: call 0x100314920 ; 0x100314920
0x1002eb3a4: lea rsi, [rip + 0x894d4c] ; 0x100b800f7 dawnChestPulseThree
0x1002eb3ab: mov edx, 0x40
0x1002eb3b0: mov rdi, r13
0x1002eb3b3: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002eb3b8: movsx edi, byte ptr [rbp - 0x70]
0x1002eb3bc: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002eb3c1: mov byte ptr [rbp - 0x70], al
0x1002eb3c4: mov rdx, qword ptr [rip + 0x1b0429d] ; 0x101def668
0x1002eb3cb: mov esi, 0x120
0x1002eb3d0: mov ecx, 0x10
0x1002eb3d5: mov rdi, r15
0x1002eb3d8: call 0x100795530 ; 0x100795530
0x1002eb3dd: vmovaps xmm0, xmmword ptr [rip + 0x7c1a7b] ; 0x100aace60
0x1002eb3e5: vmovups xmmword ptr [rax], xmm0
0x1002eb3e9: mov byte ptr [rax + 0x10], 0
0x1002eb3ed: mov byte ptr [rax + 0x11], 1
0x1002eb3f1: mov byte ptr [rax + 0x12], 0
0x1002eb3f5: mov dword ptr [rax + 0x14], 0
0x1002eb3fc: mov dword ptr [rax + 0x18], 0
0x1002eb403: vxorps xmm0, xmm0, xmm0
0x1002eb407: vmovlps qword ptr [rax + 0x20], xmm0
0x1002eb40c: mov dword ptr [rax + 0x28], 0
0x1002eb413: vmovaps xmm0, xmmword ptr [rip + 0x7ce295] ; 0x100ab96b0
0x1002eb41b: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002eb420: mov byte ptr [rax + 0x40], 0
0x1002eb424: vxorps ymm0, ymm0, ymm0
0x1002eb428: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002eb430: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002eb435: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002eb43a: mov dword ptr [rax + 0xa4], 0x40600000
0x1002eb444: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002eb44e: vmovaps xmm0, xmmword ptr [rbx]
0x1002eb452: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002eb45a: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002eb462: vxorps xmm0, xmm0, xmm0
0x1002eb466: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002eb46e: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002eb478: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002eb480: mov dword ptr [rax + 0xf4], 0
0x1002eb48a: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002eb494: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002eb49c: mov dword ptr [rax + 0x10c], 0
0x1002eb4a6: mov dword ptr [rax + 0x110], 0x3f800000
0x1002eb4b0: mov byte ptr [rax + 0x114], 1
0x1002eb4b7: mov dword ptr [rax + 0x118], 0
0x1002eb4c1: mov dword ptr [rax + 0x11c], 0
0x1002eb4cb: mov qword ptr [rip + 0x1b04646], rax ; 0x101defb18
0x1002eb4d2: mov rdi, r12
0x1002eb4d5: mov rsi, rax
0x1002eb4d8: mov rdx, r13
0x1002eb4db: vzeroupper 
0x1002eb4de: call 0x100314920 ; 0x100314920
0x1002eb4e3: lea rsi, [rip + 0x894c21] ; 0x100b8010b dawnChestGlowSphere
0x1002eb4ea: mov edx, 0x40
0x1002eb4ef: mov rdi, r13
0x1002eb4f2: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002eb4f7: movsx edi, byte ptr [rbp - 0x70]
0x1002eb4fb: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002eb500: mov byte ptr [rbp - 0x70], al
0x1002eb503: mov rdx, qword ptr [rip + 0x1b0415e] ; 0x101def668
0x1002eb50a: mov esi, 0x120
0x1002eb50f: mov ecx, 0x10
0x1002eb514: mov rdi, r15
0x1002eb517: call 0x100795530 ; 0x100795530
0x1002eb51c: vmovaps xmm0, xmmword ptr [rip + 0x7c193c] ; 0x100aace60
0x1002eb524: vmovups xmmword ptr [rax], xmm0
0x1002eb528: mov byte ptr [rax + 0x10], 0
0x1002eb52c: mov byte ptr [rax + 0x11], 1
0x1002eb530: mov byte ptr [rax + 0x12], 0
0x1002eb534: mov dword ptr [rax + 0x14], 0
0x1002eb53b: mov dword ptr [rax + 0x18], 0
0x1002eb542: vxorps xmm0, xmm0, xmm0
0x1002eb546: vmovlps qword ptr [rax + 0x20], xmm0
0x1002eb54b: mov dword ptr [rax + 0x28], 0
0x1002eb552: vmovaps xmm0, xmmword ptr [rip + 0x7ce156] ; 0x100ab96b0
0x1002eb55a: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002eb55f: mov byte ptr [rax + 0x40], 0
0x1002eb563: vxorps ymm0, ymm0, ymm0
0x1002eb567: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002eb56f: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002eb574: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002eb579: mov dword ptr [rax + 0xa4], 0x40600000
0x1002eb583: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002eb58d: vmovaps xmm0, xmmword ptr [rbx]
0x1002eb591: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002eb599: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002eb5a1: vxorps xmm0, xmm0, xmm0
0x1002eb5a5: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002eb5ad: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002eb5b7: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002eb5bf: mov dword ptr [rax + 0xf4], 0
0x1002eb5c9: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002eb5d3: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002eb5db: mov dword ptr [rax + 0x10c], 0
0x1002eb5e5: mov dword ptr [rax + 0x110], 0x3f800000
0x1002eb5ef: mov byte ptr [rax + 0x114], 1
0x1002eb5f6: mov dword ptr [rax + 0x118], 0
0x1002eb600: mov dword ptr [rax + 0x11c], 0
0x1002eb60a: mov qword ptr [rip + 0x1b0450f], rax ; 0x101defb20
0x1002eb611: mov rdi, r12
0x1002eb614: mov rsi, rax
0x1002eb617: mov rdx, r13
0x1002eb61a: vzeroupper 
0x1002eb61d: call 0x100314920 ; 0x100314920
0x1002eb622: lea rsi, [rip + 0x894af6] ; 0x100b8011f laughAtParticle
0x1002eb629: mov edx, 0x40
0x1002eb62e: mov rdi, r13
0x1002eb631: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002eb636: movsx edi, byte ptr [rbp - 0x70]
0x1002eb63a: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002eb63f: mov byte ptr [rbp - 0x70], al
0x1002eb642: mov rdx, qword ptr [rip + 0x1b0401f] ; 0x101def668
0x1002eb649: mov esi, 0x120
0x1002eb64e: mov ecx, 0x10
0x1002eb653: mov rdi, r15
0x1002eb656: call 0x100795530 ; 0x100795530
0x1002eb65b: vmovaps xmm0, xmmword ptr [rip + 0x7c17fd] ; 0x100aace60
0x1002eb663: vmovups xmmword ptr [rax], xmm0
0x1002eb667: mov byte ptr [rax + 0x10], 0
0x1002eb66b: mov byte ptr [rax + 0x11], 1
0x1002eb66f: mov byte ptr [rax + 0x12], 0
0x1002eb673: mov dword ptr [rax + 0x14], 0
0x1002eb67a: mov dword ptr [rax + 0x18], 0
0x1002eb681: vxorps xmm0, xmm0, xmm0
0x1002eb685: vmovlps qword ptr [rax + 0x20], xmm0
0x1002eb68a: mov dword ptr [rax + 0x28], 0
0x1002eb691: vmovaps xmm0, xmmword ptr [rip + 0x7ce017] ; 0x100ab96b0
0x1002eb699: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002eb69e: mov byte ptr [rax + 0x40], 0
0x1002eb6a2: vxorps ymm0, ymm0, ymm0
0x1002eb6a6: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002eb6ae: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002eb6b3: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002eb6b8: mov dword ptr [rax + 0xa4], 0x40600000
0x1002eb6c2: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002eb6cc: vmovaps xmm0, xmmword ptr [rbx]
0x1002eb6d0: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002eb6d8: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002eb6e0: vxorps xmm0, xmm0, xmm0
0x1002eb6e4: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002eb6ec: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002eb6f6: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002eb6fe: mov dword ptr [rax + 0xf4], 0
0x1002eb708: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002eb712: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002eb71a: mov dword ptr [rax + 0x10c], 0
0x1002eb724: mov dword ptr [rax + 0x110], 0x3f800000
0x1002eb72e: mov byte ptr [rax + 0x114], 1
0x1002eb735: mov dword ptr [rax + 0x118], 0
0x1002eb73f: mov dword ptr [rax + 0x11c], 0
0x1002eb749: mov qword ptr [rip + 0x1b043d8], rax ; 0x101defb28
0x1002eb750: mov rdi, r12
0x1002eb753: mov rsi, rax
0x1002eb756: mov rdx, r13
0x1002eb759: vzeroupper 
0x1002eb75c: call 0x100314920 ; 0x100314920
0x1002eb761: lea rsi, [rip + 0x8949c7] ; 0x100b8012f laughAtParticleTwo
0x1002eb768: mov edx, 0x40
0x1002eb76d: mov rdi, r13
0x1002eb770: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002eb775: movsx edi, byte ptr [rbp - 0x70]
0x1002eb779: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002eb77e: mov byte ptr [rbp - 0x70], al
0x1002eb781: mov rdx, qword ptr [rip + 0x1b03ee0] ; 0x101def668
0x1002eb788: mov esi, 0x120
0x1002eb78d: mov ecx, 0x10
0x1002eb792: mov rdi, r15
0x1002eb795: call 0x100795530 ; 0x100795530
0x1002eb79a: vmovaps xmm0, xmmword ptr [rip + 0x7c16be] ; 0x100aace60
0x1002eb7a2: vmovups xmmword ptr [rax], xmm0
0x1002eb7a6: mov byte ptr [rax + 0x10], 0
0x1002eb7aa: mov byte ptr [rax + 0x11], 1
0x1002eb7ae: mov byte ptr [rax + 0x12], 0
0x1002eb7b2: mov dword ptr [rax + 0x14], 0
0x1002eb7b9: mov dword ptr [rax + 0x18], 0
0x1002eb7c0: vxorps xmm0, xmm0, xmm0
0x1002eb7c4: vmovlps qword ptr [rax + 0x20], xmm0
0x1002eb7c9: mov dword ptr [rax + 0x28], 0
0x1002eb7d0: vmovaps xmm0, xmmword ptr [rip + 0x7cded8] ; 0x100ab96b0
0x1002eb7d8: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002eb7dd: mov byte ptr [rax + 0x40], 0
0x1002eb7e1: vxorps ymm0, ymm0, ymm0
0x1002eb7e5: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002eb7ed: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002eb7f2: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002eb7f7: mov dword ptr [rax + 0xa4], 0x40600000
0x1002eb801: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002eb80b: vmovaps xmm0, xmmword ptr [rbx]
0x1002eb80f: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002eb817: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002eb81f: vxorps xmm0, xmm0, xmm0
0x1002eb823: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002eb82b: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002eb835: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002eb83d: mov dword ptr [rax + 0xf4], 0
0x1002eb847: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002eb851: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002eb859: mov dword ptr [rax + 0x10c], 0
0x1002eb863: mov dword ptr [rax + 0x110], 0x3f800000
0x1002eb86d: mov byte ptr [rax + 0x114], 1
0x1002eb874: mov dword ptr [rax + 0x118], 0
0x1002eb87e: mov dword ptr [rax + 0x11c], 0
0x1002eb888: mov qword ptr [rip + 0x1b042a1], rax ; 0x101defb30
0x1002eb88f: mov rdi, r12
0x1002eb892: mov rsi, rax
0x1002eb895: mov rdx, r13
0x1002eb898: vzeroupper 
0x1002eb89b: call 0x100314920 ; 0x100314920
0x1002eb8a0: lea rsi, [rip + 0x89489b] ; 0x100b80142 birdShoutParticle
0x1002eb8a7: mov edx, 0x40
0x1002eb8ac: mov rdi, r13
0x1002eb8af: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002eb8b4: movsx edi, byte ptr [rbp - 0x70]
0x1002eb8b8: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002eb8bd: mov byte ptr [rbp - 0x70], al
0x1002eb8c0: mov rdx, qword ptr [rip + 0x1b03da1] ; 0x101def668
0x1002eb8c7: mov esi, 0x120
0x1002eb8cc: mov ecx, 0x10
0x1002eb8d1: mov rdi, r15
0x1002eb8d4: call 0x100795530 ; 0x100795530
0x1002eb8d9: vmovaps xmm0, xmmword ptr [rip + 0x7c157f] ; 0x100aace60
0x1002eb8e1: vmovups xmmword ptr [rax], xmm0
0x1002eb8e5: mov byte ptr [rax + 0x10], 0
0x1002eb8e9: mov byte ptr [rax + 0x11], 1
0x1002eb8ed: mov byte ptr [rax + 0x12], 0
0x1002eb8f1: mov dword ptr [rax + 0x14], 0
0x1002eb8f8: mov dword ptr [rax + 0x18], 0
0x1002eb8ff: vxorps xmm0, xmm0, xmm0
0x1002eb903: vmovlps qword ptr [rax + 0x20], xmm0
0x1002eb908: mov dword ptr [rax + 0x28], 0
0x1002eb90f: vmovaps xmm0, xmmword ptr [rip + 0x7cdd99] ; 0x100ab96b0
0x1002eb917: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002eb91c: mov byte ptr [rax + 0x40], 0
0x1002eb920: vxorps ymm0, ymm0, ymm0
0x1002eb924: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002eb92c: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002eb931: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002eb936: mov dword ptr [rax + 0xa4], 0x40600000
0x1002eb940: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002eb94a: vmovaps xmm0, xmmword ptr [rbx]
0x1002eb94e: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002eb956: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002eb95e: vxorps xmm0, xmm0, xmm0
0x1002eb962: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002eb96a: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002eb974: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002eb97c: mov dword ptr [rax + 0xf4], 0
0x1002eb986: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002eb990: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002eb998: mov dword ptr [rax + 0x10c], 0
0x1002eb9a2: mov dword ptr [rax + 0x110], 0x3f800000
0x1002eb9ac: mov byte ptr [rax + 0x114], 1
0x1002eb9b3: mov dword ptr [rax + 0x118], 0
0x1002eb9bd: mov dword ptr [rax + 0x11c], 0
0x1002eb9c7: mov qword ptr [rip + 0x1b0416a], rax ; 0x101defb38
0x1002eb9ce: mov rdi, r12
0x1002eb9d1: mov rsi, rax
0x1002eb9d4: mov rdx, r13
0x1002eb9d7: vzeroupper 
0x1002eb9da: call 0x100314920 ; 0x100314920
0x1002eb9df: lea rsi, [rip + 0x89476e] ; 0x100b80154 waterfallCloudOne
0x1002eb9e6: mov edx, 0x40
0x1002eb9eb: mov rdi, r13
0x1002eb9ee: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002eb9f3: movsx edi, byte ptr [rbp - 0x70]
0x1002eb9f7: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002eb9fc: mov byte ptr [rbp - 0x70], al
0x1002eb9ff: mov rdx, qword ptr [rip + 0x1b03c62] ; 0x101def668
0x1002eba06: mov esi, 0x120
0x1002eba0b: mov ecx, 0x10
0x1002eba10: mov rdi, r15
0x1002eba13: call 0x100795530 ; 0x100795530
0x1002eba18: vmovaps xmm0, xmmword ptr [rip + 0x7c1440] ; 0x100aace60
0x1002eba20: vmovups xmmword ptr [rax], xmm0
0x1002eba24: mov byte ptr [rax + 0x10], 0
0x1002eba28: mov byte ptr [rax + 0x11], 1
0x1002eba2c: mov byte ptr [rax + 0x12], 0
0x1002eba30: mov dword ptr [rax + 0x14], 0
0x1002eba37: mov dword ptr [rax + 0x18], 0
0x1002eba3e: vxorps xmm0, xmm0, xmm0
0x1002eba42: vmovlps qword ptr [rax + 0x20], xmm0
0x1002eba47: mov dword ptr [rax + 0x28], 0
0x1002eba4e: vmovaps xmm0, xmmword ptr [rip + 0x7cdc5a] ; 0x100ab96b0
0x1002eba56: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002eba5b: mov byte ptr [rax + 0x40], 0
0x1002eba5f: vxorps ymm0, ymm0, ymm0
0x1002eba63: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002eba6b: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002eba70: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002eba75: mov dword ptr [rax + 0xa4], 0x40600000
0x1002eba7f: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002eba89: vmovaps xmm0, xmmword ptr [rbx]
0x1002eba8d: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002eba95: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002eba9d: vxorps xmm0, xmm0, xmm0
0x1002ebaa1: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ebaa9: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ebab3: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ebabb: mov dword ptr [rax + 0xf4], 0
0x1002ebac5: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ebacf: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ebad7: mov dword ptr [rax + 0x10c], 0
0x1002ebae1: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ebaeb: mov byte ptr [rax + 0x114], 1
0x1002ebaf2: mov dword ptr [rax + 0x118], 0
0x1002ebafc: mov dword ptr [rax + 0x11c], 0
0x1002ebb06: mov qword ptr [rip + 0x1b04033], rax ; 0x101defb40
0x1002ebb0d: mov rdi, r12
0x1002ebb10: mov rsi, rax
0x1002ebb13: mov rdx, r13
0x1002ebb16: vzeroupper 
0x1002ebb19: call 0x100314920 ; 0x100314920
0x1002ebb1e: lea rsi, [rip + 0x894641] ; 0x100b80166 waterfallCloudTwo
0x1002ebb25: mov edx, 0x40
0x1002ebb2a: mov rdi, r13
0x1002ebb2d: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ebb32: movsx edi, byte ptr [rbp - 0x70]
0x1002ebb36: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ebb3b: mov byte ptr [rbp - 0x70], al
0x1002ebb3e: mov rdx, qword ptr [rip + 0x1b03b23] ; 0x101def668
0x1002ebb45: mov esi, 0x120
0x1002ebb4a: mov ecx, 0x10
0x1002ebb4f: mov rdi, r15
0x1002ebb52: call 0x100795530 ; 0x100795530
0x1002ebb57: vmovaps xmm0, xmmword ptr [rip + 0x7c1301] ; 0x100aace60
0x1002ebb5f: vmovups xmmword ptr [rax], xmm0
0x1002ebb63: mov byte ptr [rax + 0x10], 0
0x1002ebb67: mov byte ptr [rax + 0x11], 1
0x1002ebb6b: mov byte ptr [rax + 0x12], 0
0x1002ebb6f: mov dword ptr [rax + 0x14], 0
0x1002ebb76: mov dword ptr [rax + 0x18], 0
0x1002ebb7d: vxorps xmm0, xmm0, xmm0
0x1002ebb81: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ebb86: mov dword ptr [rax + 0x28], 0
0x1002ebb8d: vmovaps xmm0, xmmword ptr [rip + 0x7cdb1b] ; 0x100ab96b0
0x1002ebb95: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ebb9a: mov byte ptr [rax + 0x40], 0
0x1002ebb9e: vxorps ymm0, ymm0, ymm0
0x1002ebba2: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ebbaa: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ebbaf: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ebbb4: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ebbbe: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ebbc8: vmovaps xmm0, xmmword ptr [rbx]
0x1002ebbcc: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ebbd4: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ebbdc: vxorps xmm0, xmm0, xmm0
0x1002ebbe0: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ebbe8: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ebbf2: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ebbfa: mov dword ptr [rax + 0xf4], 0
0x1002ebc04: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ebc0e: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ebc16: mov dword ptr [rax + 0x10c], 0
0x1002ebc20: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ebc2a: mov byte ptr [rax + 0x114], 1
0x1002ebc31: mov dword ptr [rax + 0x118], 0
0x1002ebc3b: mov dword ptr [rax + 0x11c], 0
0x1002ebc45: mov qword ptr [rip + 0x1b03efc], rax ; 0x101defb48
0x1002ebc4c: mov rdi, r12
0x1002ebc4f: mov rsi, rax
0x1002ebc52: mov rdx, r13
0x1002ebc55: vzeroupper 
0x1002ebc58: call 0x100314920 ; 0x100314920
0x1002ebc5d: lea rsi, [rip + 0x894514] ; 0x100b80178 constellationStarOne
0x1002ebc64: mov edx, 0x40
0x1002ebc69: mov rdi, r13
0x1002ebc6c: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ebc71: movsx edi, byte ptr [rbp - 0x70]
0x1002ebc75: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ebc7a: mov byte ptr [rbp - 0x70], al
0x1002ebc7d: mov rdx, qword ptr [rip + 0x1b039e4] ; 0x101def668
0x1002ebc84: mov esi, 0x120
0x1002ebc89: mov ecx, 0x10
0x1002ebc8e: mov rdi, r15
0x1002ebc91: call 0x100795530 ; 0x100795530
0x1002ebc96: vmovaps xmm0, xmmword ptr [rip + 0x7c11c2] ; 0x100aace60
0x1002ebc9e: vmovups xmmword ptr [rax], xmm0
0x1002ebca2: mov byte ptr [rax + 0x10], 0
0x1002ebca6: mov byte ptr [rax + 0x11], 1
0x1002ebcaa: mov byte ptr [rax + 0x12], 0
0x1002ebcae: mov dword ptr [rax + 0x14], 0
0x1002ebcb5: mov dword ptr [rax + 0x18], 0
0x1002ebcbc: vxorps xmm0, xmm0, xmm0
0x1002ebcc0: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ebcc5: mov dword ptr [rax + 0x28], 0
0x1002ebccc: vmovaps xmm0, xmmword ptr [rip + 0x7cd9dc] ; 0x100ab96b0
0x1002ebcd4: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ebcd9: mov byte ptr [rax + 0x40], 0
0x1002ebcdd: vxorps ymm0, ymm0, ymm0
0x1002ebce1: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ebce9: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ebcee: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ebcf3: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ebcfd: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ebd07: vmovaps xmm0, xmmword ptr [rbx]
0x1002ebd0b: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ebd13: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ebd1b: vxorps xmm0, xmm0, xmm0
0x1002ebd1f: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ebd27: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ebd31: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ebd39: mov dword ptr [rax + 0xf4], 0
0x1002ebd43: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ebd4d: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ebd55: mov dword ptr [rax + 0x10c], 0
0x1002ebd5f: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ebd69: mov byte ptr [rax + 0x114], 1
0x1002ebd70: mov dword ptr [rax + 0x118], 0
0x1002ebd7a: mov dword ptr [rax + 0x11c], 0
0x1002ebd84: mov qword ptr [rip + 0x1b03dc5], rax ; 0x101defb50
0x1002ebd8b: mov rdi, r12
0x1002ebd8e: mov rsi, rax
0x1002ebd91: mov rdx, r13
0x1002ebd94: vzeroupper 
0x1002ebd97: call 0x100314920 ; 0x100314920
0x1002ebd9c: lea rsi, [rip + 0x8943ea] ; 0x100b8018d windSparticles
0x1002ebda3: mov edx, 0x40
0x1002ebda8: mov rdi, r13
0x1002ebdab: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ebdb0: movsx edi, byte ptr [rbp - 0x70]
0x1002ebdb4: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ebdb9: mov byte ptr [rbp - 0x70], al
0x1002ebdbc: mov rdx, qword ptr [rip + 0x1b038a5] ; 0x101def668
0x1002ebdc3: mov esi, 0x120
0x1002ebdc8: mov ecx, 0x10
0x1002ebdcd: mov rdi, r15
0x1002ebdd0: call 0x100795530 ; 0x100795530
0x1002ebdd5: vmovaps xmm0, xmmword ptr [rip + 0x7c1083] ; 0x100aace60
0x1002ebddd: vmovups xmmword ptr [rax], xmm0
0x1002ebde1: mov byte ptr [rax + 0x10], 0
0x1002ebde5: mov byte ptr [rax + 0x11], 1
0x1002ebde9: mov byte ptr [rax + 0x12], 0
0x1002ebded: mov dword ptr [rax + 0x14], 0
0x1002ebdf4: mov dword ptr [rax + 0x18], 0
0x1002ebdfb: vxorps xmm0, xmm0, xmm0
0x1002ebdff: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ebe04: mov dword ptr [rax + 0x28], 0
0x1002ebe0b: vmovaps xmm0, xmmword ptr [rip + 0x7cd89d] ; 0x100ab96b0
0x1002ebe13: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ebe18: mov byte ptr [rax + 0x40], 0
0x1002ebe1c: vxorps ymm0, ymm0, ymm0
0x1002ebe20: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ebe28: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ebe2d: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ebe32: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ebe3c: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ebe46: vmovaps xmm0, xmmword ptr [rbx]
0x1002ebe4a: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ebe52: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ebe5a: vxorps xmm0, xmm0, xmm0
0x1002ebe5e: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ebe66: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ebe70: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ebe78: mov dword ptr [rax + 0xf4], 0
0x1002ebe82: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ebe8c: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ebe94: mov dword ptr [rax + 0x10c], 0
0x1002ebe9e: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ebea8: mov byte ptr [rax + 0x114], 1
0x1002ebeaf: mov dword ptr [rax + 0x118], 0
0x1002ebeb9: mov dword ptr [rax + 0x11c], 0
0x1002ebec3: mov qword ptr [rip + 0x1b03c8e], rax ; 0x101defb58
0x1002ebeca: mov rdi, r12
0x1002ebecd: mov rsi, rax
0x1002ebed0: mov rdx, r13
0x1002ebed3: vzeroupper 
0x1002ebed6: call 0x100314920 ; 0x100314920
0x1002ebedb: lea rsi, [rip + 0x8942ba] ; 0x100b8019c windSparkles
0x1002ebee2: mov edx, 0x40
0x1002ebee7: mov rdi, r13
0x1002ebeea: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ebeef: movsx edi, byte ptr [rbp - 0x70]
0x1002ebef3: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ebef8: mov byte ptr [rbp - 0x70], al
0x1002ebefb: mov rdx, qword ptr [rip + 0x1b03766] ; 0x101def668
0x1002ebf02: mov esi, 0x120
0x1002ebf07: mov ecx, 0x10
0x1002ebf0c: mov rdi, r15
0x1002ebf0f: call 0x100795530 ; 0x100795530
0x1002ebf14: vmovaps xmm0, xmmword ptr [rip + 0x7c0f44] ; 0x100aace60
0x1002ebf1c: vmovups xmmword ptr [rax], xmm0
0x1002ebf20: mov byte ptr [rax + 0x10], 0
0x1002ebf24: mov byte ptr [rax + 0x11], 1
0x1002ebf28: mov byte ptr [rax + 0x12], 0
0x1002ebf2c: mov dword ptr [rax + 0x14], 0
0x1002ebf33: mov dword ptr [rax + 0x18], 0
0x1002ebf3a: vxorps xmm0, xmm0, xmm0
0x1002ebf3e: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ebf43: mov dword ptr [rax + 0x28], 0
0x1002ebf4a: vmovaps xmm0, xmmword ptr [rip + 0x7cd75e] ; 0x100ab96b0
0x1002ebf52: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ebf57: mov byte ptr [rax + 0x40], 0
0x1002ebf5b: vxorps ymm0, ymm0, ymm0
0x1002ebf5f: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ebf67: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ebf6c: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ebf71: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ebf7b: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ebf85: vmovaps xmm0, xmmword ptr [rbx]
0x1002ebf89: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ebf91: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ebf99: vxorps xmm0, xmm0, xmm0
0x1002ebf9d: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ebfa5: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ebfaf: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ebfb7: mov dword ptr [rax + 0xf4], 0
0x1002ebfc1: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ebfcb: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ebfd3: mov dword ptr [rax + 0x10c], 0
0x1002ebfdd: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ebfe7: mov byte ptr [rax + 0x114], 1
0x1002ebfee: mov dword ptr [rax + 0x118], 0
0x1002ebff8: mov dword ptr [rax + 0x11c], 0
0x1002ec002: mov qword ptr [rip + 0x1b03b57], rax ; 0x101defb60
0x1002ec009: mov rdi, r12
0x1002ec00c: mov rsi, rax
0x1002ec00f: mov rdx, r13
0x1002ec012: vzeroupper 
0x1002ec015: call 0x100314920 ; 0x100314920
0x1002ec01a: lea rsi, [rip + 0x894188] ; 0x100b801a9 windSparklesSm
0x1002ec021: mov edx, 0x40
0x1002ec026: mov rdi, r13
0x1002ec029: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ec02e: movsx edi, byte ptr [rbp - 0x70]
0x1002ec032: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ec037: mov byte ptr [rbp - 0x70], al
0x1002ec03a: mov rdx, qword ptr [rip + 0x1b03627] ; 0x101def668
0x1002ec041: mov esi, 0x120
0x1002ec046: mov ecx, 0x10
0x1002ec04b: mov rdi, r15
0x1002ec04e: call 0x100795530 ; 0x100795530
0x1002ec053: vmovaps xmm0, xmmword ptr [rip + 0x7c0e05] ; 0x100aace60
0x1002ec05b: vmovups xmmword ptr [rax], xmm0
0x1002ec05f: mov byte ptr [rax + 0x10], 0
0x1002ec063: mov byte ptr [rax + 0x11], 1
0x1002ec067: mov byte ptr [rax + 0x12], 0
0x1002ec06b: mov dword ptr [rax + 0x14], 0
0x1002ec072: mov dword ptr [rax + 0x18], 0
0x1002ec079: vxorps xmm0, xmm0, xmm0
0x1002ec07d: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ec082: mov dword ptr [rax + 0x28], 0
0x1002ec089: vmovaps xmm0, xmmword ptr [rip + 0x7cd61f] ; 0x100ab96b0
0x1002ec091: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ec096: mov byte ptr [rax + 0x40], 0
0x1002ec09a: vxorps ymm0, ymm0, ymm0
0x1002ec09e: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ec0a6: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ec0ab: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ec0b0: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ec0ba: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ec0c4: vmovaps xmm0, xmmword ptr [rbx]
0x1002ec0c8: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ec0d0: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ec0d8: vxorps xmm0, xmm0, xmm0
0x1002ec0dc: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ec0e4: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ec0ee: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ec0f6: mov dword ptr [rax + 0xf4], 0
0x1002ec100: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ec10a: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ec112: mov dword ptr [rax + 0x10c], 0
0x1002ec11c: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ec126: mov byte ptr [rax + 0x114], 1
0x1002ec12d: mov dword ptr [rax + 0x118], 0
0x1002ec137: mov dword ptr [rax + 0x11c], 0
0x1002ec141: mov qword ptr [rip + 0x1b03a20], rax ; 0x101defb68
0x1002ec148: mov rdi, r12
0x1002ec14b: mov rsi, rax
0x1002ec14e: mov rdx, r13
0x1002ec151: vzeroupper 
0x1002ec154: call 0x100314920 ; 0x100314920
0x1002ec159: lea rsi, [rip + 0x894058] ; 0x100b801b8 windWind
0x1002ec160: mov edx, 0x40
0x1002ec165: mov rdi, r13
0x1002ec168: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ec16d: movsx edi, byte ptr [rbp - 0x70]
0x1002ec171: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ec176: mov byte ptr [rbp - 0x70], al
0x1002ec179: mov rdx, qword ptr [rip + 0x1b034e8] ; 0x101def668
0x1002ec180: mov esi, 0x120
0x1002ec185: mov ecx, 0x10
0x1002ec18a: mov rdi, r15
0x1002ec18d: call 0x100795530 ; 0x100795530
0x1002ec192: vmovaps xmm0, xmmword ptr [rip + 0x7c0cc6] ; 0x100aace60
0x1002ec19a: vmovups xmmword ptr [rax], xmm0
0x1002ec19e: mov byte ptr [rax + 0x10], 0
0x1002ec1a2: mov byte ptr [rax + 0x11], 1
0x1002ec1a6: mov byte ptr [rax + 0x12], 0
0x1002ec1aa: mov dword ptr [rax + 0x14], 0
0x1002ec1b1: mov dword ptr [rax + 0x18], 0
0x1002ec1b8: vxorps xmm0, xmm0, xmm0
0x1002ec1bc: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ec1c1: mov dword ptr [rax + 0x28], 0
0x1002ec1c8: vmovaps xmm0, xmmword ptr [rip + 0x7cd4e0] ; 0x100ab96b0
0x1002ec1d0: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ec1d5: mov byte ptr [rax + 0x40], 0
0x1002ec1d9: vxorps ymm0, ymm0, ymm0
0x1002ec1dd: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ec1e5: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ec1ea: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ec1ef: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ec1f9: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ec203: vmovaps xmm0, xmmword ptr [rbx]
0x1002ec207: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ec20f: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ec217: vxorps xmm0, xmm0, xmm0
0x1002ec21b: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ec223: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ec22d: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ec235: mov dword ptr [rax + 0xf4], 0
0x1002ec23f: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ec249: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ec251: mov dword ptr [rax + 0x10c], 0
0x1002ec25b: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ec265: mov byte ptr [rax + 0x114], 1
0x1002ec26c: mov dword ptr [rax + 0x118], 0
0x1002ec276: mov dword ptr [rax + 0x11c], 0
0x1002ec280: mov qword ptr [rip + 0x1b038e9], rax ; 0x101defb70
0x1002ec287: mov rdi, r12
0x1002ec28a: mov rsi, rax
0x1002ec28d: mov rdx, r13
0x1002ec290: vzeroupper 
0x1002ec293: call 0x100314920 ; 0x100314920
0x1002ec298: lea rsi, [rip + 0x893f22] ; 0x100b801c1 windWindSm
0x1002ec29f: mov edx, 0x40
0x1002ec2a4: mov rdi, r13
0x1002ec2a7: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ec2ac: movsx edi, byte ptr [rbp - 0x70]
0x1002ec2b0: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ec2b5: mov byte ptr [rbp - 0x70], al
0x1002ec2b8: mov rdx, qword ptr [rip + 0x1b033a9] ; 0x101def668
0x1002ec2bf: mov esi, 0x120
0x1002ec2c4: mov ecx, 0x10
0x1002ec2c9: mov rdi, r15
0x1002ec2cc: call 0x100795530 ; 0x100795530
0x1002ec2d1: vmovaps xmm0, xmmword ptr [rip + 0x7c0b87] ; 0x100aace60
0x1002ec2d9: vmovups xmmword ptr [rax], xmm0
0x1002ec2dd: mov byte ptr [rax + 0x10], 0
0x1002ec2e1: mov byte ptr [rax + 0x11], 1
0x1002ec2e5: mov byte ptr [rax + 0x12], 0
0x1002ec2e9: mov dword ptr [rax + 0x14], 0
0x1002ec2f0: mov dword ptr [rax + 0x18], 0
0x1002ec2f7: vxorps xmm0, xmm0, xmm0
0x1002ec2fb: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ec300: mov dword ptr [rax + 0x28], 0
0x1002ec307: vmovaps xmm0, xmmword ptr [rip + 0x7cd3a1] ; 0x100ab96b0
0x1002ec30f: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ec314: mov byte ptr [rax + 0x40], 0
0x1002ec318: vxorps ymm0, ymm0, ymm0
0x1002ec31c: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ec324: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ec329: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ec32e: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ec338: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ec342: vmovaps xmm0, xmmword ptr [rbx]
0x1002ec346: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ec34e: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ec356: vxorps xmm0, xmm0, xmm0
0x1002ec35a: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ec362: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ec36c: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ec374: mov dword ptr [rax + 0xf4], 0
0x1002ec37e: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ec388: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ec390: mov dword ptr [rax + 0x10c], 0
0x1002ec39a: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ec3a4: mov byte ptr [rax + 0x114], 1
0x1002ec3ab: mov dword ptr [rax + 0x118], 0
0x1002ec3b5: mov dword ptr [rax + 0x11c], 0
0x1002ec3bf: mov qword ptr [rip + 0x1b037b2], rax ; 0x101defb78
0x1002ec3c6: mov rdi, r12
0x1002ec3c9: mov rsi, rax
0x1002ec3cc: mov rdx, r13
0x1002ec3cf: vzeroupper 
0x1002ec3d2: call 0x100314920 ; 0x100314920
0x1002ec3d7: lea rsi, [rip + 0x893dee] ; 0x100b801cc glowDustTrace
0x1002ec3de: mov edx, 0x40
0x1002ec3e3: mov rdi, r13
0x1002ec3e6: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ec3eb: movsx edi, byte ptr [rbp - 0x70]
0x1002ec3ef: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ec3f4: mov byte ptr [rbp - 0x70], al
0x1002ec3f7: mov rdx, qword ptr [rip + 0x1b0326a] ; 0x101def668
0x1002ec3fe: mov esi, 0x120
0x1002ec403: mov ecx, 0x10
0x1002ec408: mov rdi, r15
0x1002ec40b: call 0x100795530 ; 0x100795530
0x1002ec410: vmovaps xmm0, xmmword ptr [rip + 0x7c0a48] ; 0x100aace60
0x1002ec418: vmovups xmmword ptr [rax], xmm0
0x1002ec41c: mov byte ptr [rax + 0x10], 0
0x1002ec420: mov byte ptr [rax + 0x11], 1
0x1002ec424: mov byte ptr [rax + 0x12], 0
0x1002ec428: mov dword ptr [rax + 0x14], 0
0x1002ec42f: mov dword ptr [rax + 0x18], 0
0x1002ec436: vxorps xmm0, xmm0, xmm0
0x1002ec43a: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ec43f: mov dword ptr [rax + 0x28], 0
0x1002ec446: vmovaps xmm0, xmmword ptr [rip + 0x7cd262] ; 0x100ab96b0
0x1002ec44e: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ec453: mov byte ptr [rax + 0x40], 0
0x1002ec457: vxorps ymm0, ymm0, ymm0
0x1002ec45b: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ec463: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ec468: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ec46d: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ec477: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ec481: vmovaps xmm0, xmmword ptr [rbx]
0x1002ec485: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ec48d: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ec495: vxorps xmm0, xmm0, xmm0
0x1002ec499: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ec4a1: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ec4ab: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ec4b3: mov dword ptr [rax + 0xf4], 0
0x1002ec4bd: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ec4c7: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ec4cf: mov dword ptr [rax + 0x10c], 0
0x1002ec4d9: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ec4e3: mov byte ptr [rax + 0x114], 1
0x1002ec4ea: mov dword ptr [rax + 0x118], 0
0x1002ec4f4: mov dword ptr [rax + 0x11c], 0
0x1002ec4fe: mov qword ptr [rip + 0x1b0367b], rax ; 0x101defb80
0x1002ec505: mov rdi, r12
0x1002ec508: mov rsi, rax
0x1002ec50b: mov rdx, r13
0x1002ec50e: vzeroupper 
0x1002ec511: call 0x100314920 ; 0x100314920
0x1002ec516: lea rsi, [rip + 0x893cbd] ; 0x100b801da sparks
0x1002ec51d: mov edx, 0x40
0x1002ec522: mov rdi, r13
0x1002ec525: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ec52a: movsx edi, byte ptr [rbp - 0x70]
0x1002ec52e: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ec533: mov byte ptr [rbp - 0x70], al
0x1002ec536: mov rdx, qword ptr [rip + 0x1b0312b] ; 0x101def668
0x1002ec53d: mov esi, 0x120
0x1002ec542: mov ecx, 0x10
0x1002ec547: mov rdi, r15
0x1002ec54a: call 0x100795530 ; 0x100795530
0x1002ec54f: vmovaps xmm0, xmmword ptr [rip + 0x7c0909] ; 0x100aace60
0x1002ec557: vmovups xmmword ptr [rax], xmm0
0x1002ec55b: mov byte ptr [rax + 0x10], 0
0x1002ec55f: mov byte ptr [rax + 0x11], 1
0x1002ec563: mov byte ptr [rax + 0x12], 0
0x1002ec567: mov dword ptr [rax + 0x14], 0
0x1002ec56e: mov dword ptr [rax + 0x18], 0
0x1002ec575: vxorps xmm0, xmm0, xmm0
0x1002ec579: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ec57e: mov dword ptr [rax + 0x28], 0
0x1002ec585: vmovaps xmm0, xmmword ptr [rip + 0x7cd123] ; 0x100ab96b0
0x1002ec58d: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ec592: mov byte ptr [rax + 0x40], 0
0x1002ec596: vxorps ymm0, ymm0, ymm0
0x1002ec59a: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ec5a2: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ec5a7: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ec5ac: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ec5b6: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ec5c0: vmovaps xmm0, xmmword ptr [rbx]
0x1002ec5c4: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ec5cc: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ec5d4: vxorps xmm0, xmm0, xmm0
0x1002ec5d8: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ec5e0: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ec5ea: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ec5f2: mov dword ptr [rax + 0xf4], 0
0x1002ec5fc: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ec606: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ec60e: mov dword ptr [rax + 0x10c], 0
0x1002ec618: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ec622: mov byte ptr [rax + 0x114], 1
0x1002ec629: mov dword ptr [rax + 0x118], 0
0x1002ec633: mov dword ptr [rax + 0x11c], 0
0x1002ec63d: mov qword ptr [rip + 0x1b03544], rax ; 0x101defb88
0x1002ec644: mov rdi, r12
0x1002ec647: mov rsi, rax
0x1002ec64a: mov rdx, r13
0x1002ec64d: vzeroupper 
0x1002ec650: call 0x100314920 ; 0x100314920
0x1002ec655: lea rsi, [rip + 0x893b85] ; 0x100b801e1 sparkBoost
0x1002ec65c: mov edx, 0x40
0x1002ec661: mov rdi, r13
0x1002ec664: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ec669: movsx edi, byte ptr [rbp - 0x70]
0x1002ec66d: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ec672: mov byte ptr [rbp - 0x70], al
0x1002ec675: mov rdx, qword ptr [rip + 0x1b02fec] ; 0x101def668
0x1002ec67c: mov esi, 0x120
0x1002ec681: mov ecx, 0x10
0x1002ec686: mov rdi, r15
0x1002ec689: call 0x100795530 ; 0x100795530
0x1002ec68e: vmovaps xmm0, xmmword ptr [rip + 0x7c07ca] ; 0x100aace60
0x1002ec696: vmovups xmmword ptr [rax], xmm0
0x1002ec69a: mov byte ptr [rax + 0x10], 0
0x1002ec69e: mov byte ptr [rax + 0x11], 1
0x1002ec6a2: mov byte ptr [rax + 0x12], 0
0x1002ec6a6: mov dword ptr [rax + 0x14], 0
0x1002ec6ad: mov dword ptr [rax + 0x18], 0
0x1002ec6b4: vxorps xmm0, xmm0, xmm0
0x1002ec6b8: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ec6bd: mov dword ptr [rax + 0x28], 0
0x1002ec6c4: vmovaps xmm0, xmmword ptr [rip + 0x7ccfe4] ; 0x100ab96b0
0x1002ec6cc: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ec6d1: mov byte ptr [rax + 0x40], 0
0x1002ec6d5: vxorps ymm0, ymm0, ymm0
0x1002ec6d9: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ec6e1: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ec6e6: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ec6eb: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ec6f5: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ec6ff: vmovaps xmm0, xmmword ptr [rbx]
0x1002ec703: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ec70b: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ec713: vxorps xmm0, xmm0, xmm0
0x1002ec717: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ec71f: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ec729: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ec731: mov dword ptr [rax + 0xf4], 0
0x1002ec73b: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ec745: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ec74d: mov dword ptr [rax + 0x10c], 0
0x1002ec757: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ec761: mov byte ptr [rax + 0x114], 1
0x1002ec768: mov dword ptr [rax + 0x118], 0
0x1002ec772: mov dword ptr [rax + 0x11c], 0
0x1002ec77c: mov qword ptr [rip + 0x1b0340d], rax ; 0x101defb90
0x1002ec783: mov rdi, r12
0x1002ec786: mov rsi, rax
0x1002ec789: mov rdx, r13
0x1002ec78c: vzeroupper 
0x1002ec78f: call 0x100314920 ; 0x100314920
0x1002ec794: lea rsi, [rip + 0x893a51] ; 0x100b801ec stars
0x1002ec79b: mov edx, 0x40
0x1002ec7a0: mov rdi, r13
0x1002ec7a3: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ec7a8: movsx edi, byte ptr [rbp - 0x70]
0x1002ec7ac: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ec7b1: mov byte ptr [rbp - 0x70], al
0x1002ec7b4: mov rdx, qword ptr [rip + 0x1b02ead] ; 0x101def668
0x1002ec7bb: mov esi, 0x120
0x1002ec7c0: mov ecx, 0x10
0x1002ec7c5: mov rdi, r15
0x1002ec7c8: call 0x100795530 ; 0x100795530
0x1002ec7cd: vmovaps xmm0, xmmword ptr [rip + 0x7c068b] ; 0x100aace60
0x1002ec7d5: vmovups xmmword ptr [rax], xmm0
0x1002ec7d9: mov byte ptr [rax + 0x10], 0
0x1002ec7dd: mov byte ptr [rax + 0x11], 1
0x1002ec7e1: mov byte ptr [rax + 0x12], 0
0x1002ec7e5: mov dword ptr [rax + 0x14], 0
0x1002ec7ec: mov dword ptr [rax + 0x18], 0
0x1002ec7f3: vxorps xmm0, xmm0, xmm0
0x1002ec7f7: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ec7fc: mov dword ptr [rax + 0x28], 0
0x1002ec803: vmovaps xmm0, xmmword ptr [rip + 0x7ccea5] ; 0x100ab96b0
0x1002ec80b: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ec810: mov byte ptr [rax + 0x40], 0
0x1002ec814: vxorps ymm0, ymm0, ymm0
0x1002ec818: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ec820: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ec825: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ec82a: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ec834: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ec83e: vmovaps xmm0, xmmword ptr [rbx]
0x1002ec842: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ec84a: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ec852: vxorps xmm0, xmm0, xmm0
0x1002ec856: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ec85e: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ec868: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ec870: mov dword ptr [rax + 0xf4], 0
0x1002ec87a: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ec884: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ec88c: mov dword ptr [rax + 0x10c], 0
0x1002ec896: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ec8a0: mov byte ptr [rax + 0x114], 1
0x1002ec8a7: mov dword ptr [rax + 0x118], 0
0x1002ec8b1: mov dword ptr [rax + 0x11c], 0
0x1002ec8bb: mov qword ptr [rip + 0x1b032d6], rax ; 0x101defb98
0x1002ec8c2: mov rdi, r12
0x1002ec8c5: mov rsi, rax
0x1002ec8c8: mov rdx, r13
0x1002ec8cb: vzeroupper 
0x1002ec8ce: call 0x100314920 ; 0x100314920
0x1002ec8d3: lea rsi, [rip + 0x874457] ; 0x100b60d31 wax
0x1002ec8da: mov edx, 0x40
0x1002ec8df: mov rdi, r13
0x1002ec8e2: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ec8e7: movsx edi, byte ptr [rbp - 0x70]
0x1002ec8eb: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ec8f0: mov byte ptr [rbp - 0x70], al
0x1002ec8f3: mov rdx, qword ptr [rip + 0x1b02d6e] ; 0x101def668
0x1002ec8fa: mov esi, 0x120
0x1002ec8ff: mov ecx, 0x10
0x1002ec904: mov rdi, r15
0x1002ec907: call 0x100795530 ; 0x100795530
0x1002ec90c: vmovaps xmm0, xmmword ptr [rip + 0x7c054c] ; 0x100aace60
0x1002ec914: vmovups xmmword ptr [rax], xmm0
0x1002ec918: mov byte ptr [rax + 0x10], 0
0x1002ec91c: mov byte ptr [rax + 0x11], 1
0x1002ec920: mov byte ptr [rax + 0x12], 0
0x1002ec924: mov dword ptr [rax + 0x14], 0
0x1002ec92b: mov dword ptr [rax + 0x18], 0
0x1002ec932: vxorps xmm0, xmm0, xmm0
0x1002ec936: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ec93b: mov dword ptr [rax + 0x28], 0
0x1002ec942: vmovaps xmm0, xmmword ptr [rip + 0x7ccd66] ; 0x100ab96b0
0x1002ec94a: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ec94f: mov byte ptr [rax + 0x40], 0
0x1002ec953: vxorps ymm0, ymm0, ymm0
0x1002ec957: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ec95f: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ec964: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ec969: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ec973: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ec97d: vmovaps xmm0, xmmword ptr [rbx]
0x1002ec981: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ec989: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ec991: vxorps xmm0, xmm0, xmm0
0x1002ec995: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ec99d: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ec9a7: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ec9af: mov dword ptr [rax + 0xf4], 0
0x1002ec9b9: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ec9c3: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ec9cb: mov dword ptr [rax + 0x10c], 0
0x1002ec9d5: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ec9df: mov byte ptr [rax + 0x114], 1
0x1002ec9e6: mov dword ptr [rax + 0x118], 0
0x1002ec9f0: mov dword ptr [rax + 0x11c], 0
0x1002ec9fa: mov qword ptr [rip + 0x1b0319f], rax ; 0x101defba0
0x1002eca01: mov rdi, r12
0x1002eca04: mov rsi, rax
0x1002eca07: mov rdx, r13
0x1002eca0a: vzeroupper 
0x1002eca0d: call 0x100314920 ; 0x100314920
0x1002eca12: lea rsi, [rip + 0x8937d9] ; 0x100b801f2 starFragment
0x1002eca19: mov edx, 0x40
0x1002eca1e: mov rdi, r13
0x1002eca21: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002eca26: movsx edi, byte ptr [rbp - 0x70]
0x1002eca2a: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002eca2f: mov byte ptr [rbp - 0x70], al
0x1002eca32: mov rdx, qword ptr [rip + 0x1b02c2f] ; 0x101def668
0x1002eca39: mov esi, 0x120
0x1002eca3e: mov ecx, 0x10
0x1002eca43: mov rdi, r15
0x1002eca46: call 0x100795530 ; 0x100795530
0x1002eca4b: vmovaps xmm0, xmmword ptr [rip + 0x7c040d] ; 0x100aace60
0x1002eca53: vmovups xmmword ptr [rax], xmm0
0x1002eca57: mov byte ptr [rax + 0x10], 0
0x1002eca5b: mov byte ptr [rax + 0x11], 1
0x1002eca5f: mov byte ptr [rax + 0x12], 0
0x1002eca63: mov dword ptr [rax + 0x14], 0
0x1002eca6a: mov dword ptr [rax + 0x18], 0
0x1002eca71: vxorps xmm0, xmm0, xmm0
0x1002eca75: vmovlps qword ptr [rax + 0x20], xmm0
0x1002eca7a: mov dword ptr [rax + 0x28], 0
0x1002eca81: vmovaps xmm0, xmmword ptr [rip + 0x7ccc27] ; 0x100ab96b0
0x1002eca89: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002eca8e: mov byte ptr [rax + 0x40], 0
0x1002eca92: vxorps ymm0, ymm0, ymm0
0x1002eca96: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002eca9e: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ecaa3: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ecaa8: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ecab2: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ecabc: vmovaps xmm0, xmmword ptr [rbx]
0x1002ecac0: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ecac8: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ecad0: vxorps xmm0, xmm0, xmm0
0x1002ecad4: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ecadc: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ecae6: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ecaee: mov dword ptr [rax + 0xf4], 0
0x1002ecaf8: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ecb02: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ecb0a: mov dword ptr [rax + 0x10c], 0
0x1002ecb14: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ecb1e: mov byte ptr [rax + 0x114], 1
0x1002ecb25: mov dword ptr [rax + 0x118], 0
0x1002ecb2f: mov dword ptr [rax + 0x11c], 0
0x1002ecb39: mov qword ptr [rip + 0x1b03068], rax ; 0x101defba8
0x1002ecb40: mov rdi, r12
0x1002ecb43: mov rsi, rax
0x1002ecb46: mov rdx, r13
0x1002ecb49: vzeroupper 
0x1002ecb4c: call 0x100314920 ; 0x100314920
0x1002ecb51: lea rsi, [rip + 0x8936a7] ; 0x100b801ff starFragmentCore
0x1002ecb58: mov edx, 0x40
0x1002ecb5d: mov rdi, r13
0x1002ecb60: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ecb65: movsx edi, byte ptr [rbp - 0x70]
0x1002ecb69: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ecb6e: mov byte ptr [rbp - 0x70], al
0x1002ecb71: mov rdx, qword ptr [rip + 0x1b02af0] ; 0x101def668
0x1002ecb78: mov esi, 0x120
0x1002ecb7d: mov ecx, 0x10
0x1002ecb82: mov rdi, r15
0x1002ecb85: call 0x100795530 ; 0x100795530
0x1002ecb8a: vmovaps xmm0, xmmword ptr [rip + 0x7c02ce] ; 0x100aace60
0x1002ecb92: vmovups xmmword ptr [rax], xmm0
0x1002ecb96: mov byte ptr [rax + 0x10], 0
0x1002ecb9a: mov byte ptr [rax + 0x11], 1
0x1002ecb9e: mov byte ptr [rax + 0x12], 0
0x1002ecba2: mov dword ptr [rax + 0x14], 0
0x1002ecba9: mov dword ptr [rax + 0x18], 0
0x1002ecbb0: vxorps xmm0, xmm0, xmm0
0x1002ecbb4: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ecbb9: mov dword ptr [rax + 0x28], 0
0x1002ecbc0: vmovaps xmm0, xmmword ptr [rip + 0x7ccae8] ; 0x100ab96b0
0x1002ecbc8: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ecbcd: mov byte ptr [rax + 0x40], 0
0x1002ecbd1: vxorps ymm0, ymm0, ymm0
0x1002ecbd5: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ecbdd: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ecbe2: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ecbe7: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ecbf1: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ecbfb: vmovaps xmm0, xmmword ptr [rbx]
0x1002ecbff: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ecc07: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ecc0f: vxorps xmm0, xmm0, xmm0
0x1002ecc13: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ecc1b: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ecc25: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ecc2d: mov dword ptr [rax + 0xf4], 0
0x1002ecc37: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ecc41: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ecc49: mov dword ptr [rax + 0x10c], 0
0x1002ecc53: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ecc5d: mov byte ptr [rax + 0x114], 1
0x1002ecc64: mov dword ptr [rax + 0x118], 0
0x1002ecc6e: mov dword ptr [rax + 0x11c], 0
0x1002ecc78: mov qword ptr [rip + 0x1b02f31], rax ; 0x101defbb0
0x1002ecc7f: mov rdi, r12
0x1002ecc82: mov rsi, rax
0x1002ecc85: mov rdx, r13
0x1002ecc88: vzeroupper 
0x1002ecc8b: call 0x100314920 ; 0x100314920
0x1002ecc90: lea rsi, [rip + 0x893579] ; 0x100b80210 starFragmentCollect
0x1002ecc97: mov edx, 0x40
0x1002ecc9c: mov rdi, r13
0x1002ecc9f: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ecca4: movsx edi, byte ptr [rbp - 0x70]
0x1002ecca8: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002eccad: mov byte ptr [rbp - 0x70], al
0x1002eccb0: mov rdx, qword ptr [rip + 0x1b029b1] ; 0x101def668
0x1002eccb7: mov esi, 0x120
0x1002eccbc: mov ecx, 0x10
0x1002eccc1: mov rdi, r15
0x1002eccc4: call 0x100795530 ; 0x100795530
0x1002eccc9: vmovaps xmm0, xmmword ptr [rip + 0x7c018f] ; 0x100aace60
0x1002eccd1: vmovups xmmword ptr [rax], xmm0
0x1002eccd5: mov byte ptr [rax + 0x10], 0
0x1002eccd9: mov byte ptr [rax + 0x11], 1
0x1002eccdd: mov byte ptr [rax + 0x12], 0
0x1002ecce1: mov dword ptr [rax + 0x14], 0
0x1002ecce8: mov dword ptr [rax + 0x18], 0
0x1002eccef: vxorps xmm0, xmm0, xmm0
0x1002eccf3: vmovlps qword ptr [rax + 0x20], xmm0
0x1002eccf8: mov dword ptr [rax + 0x28], 0
0x1002eccff: vmovaps xmm0, xmmword ptr [rip + 0x7cc9a9] ; 0x100ab96b0
0x1002ecd07: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ecd0c: mov byte ptr [rax + 0x40], 0
0x1002ecd10: vxorps ymm0, ymm0, ymm0
0x1002ecd14: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ecd1c: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ecd21: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ecd26: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ecd30: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ecd3a: vmovaps xmm0, xmmword ptr [rbx]
0x1002ecd3e: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ecd46: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ecd4e: vxorps xmm0, xmm0, xmm0
0x1002ecd52: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ecd5a: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ecd64: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ecd6c: mov dword ptr [rax + 0xf4], 0
0x1002ecd76: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ecd80: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ecd88: mov dword ptr [rax + 0x10c], 0
0x1002ecd92: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ecd9c: mov byte ptr [rax + 0x114], 1
0x1002ecda3: mov dword ptr [rax + 0x118], 0
0x1002ecdad: mov dword ptr [rax + 0x11c], 0
0x1002ecdb7: mov qword ptr [rip + 0x1b02dfa], rax ; 0x101defbb8
0x1002ecdbe: mov rdi, r12
0x1002ecdc1: mov rsi, rax
0x1002ecdc4: mov rdx, r13
0x1002ecdc7: vzeroupper 
0x1002ecdca: call 0x100314920 ; 0x100314920
0x1002ecdcf: lea rsi, [rip + 0x89344e] ; 0x100b80224 starFragmentWaypoint
0x1002ecdd6: mov edx, 0x40
0x1002ecddb: mov rdi, r13
0x1002ecdde: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ecde3: movsx edi, byte ptr [rbp - 0x70]
0x1002ecde7: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ecdec: mov byte ptr [rbp - 0x70], al
0x1002ecdef: mov rdx, qword ptr [rip + 0x1b02872] ; 0x101def668
0x1002ecdf6: mov esi, 0x120
0x1002ecdfb: mov ecx, 0x10
0x1002ece00: mov rdi, r15
0x1002ece03: call 0x100795530 ; 0x100795530
0x1002ece08: vmovaps xmm0, xmmword ptr [rip + 0x7c0050] ; 0x100aace60
0x1002ece10: vmovups xmmword ptr [rax], xmm0
0x1002ece14: mov byte ptr [rax + 0x10], 0
0x1002ece18: mov byte ptr [rax + 0x11], 1
0x1002ece1c: mov byte ptr [rax + 0x12], 0
0x1002ece20: mov dword ptr [rax + 0x14], 0
0x1002ece27: mov dword ptr [rax + 0x18], 0
0x1002ece2e: vxorps xmm0, xmm0, xmm0
0x1002ece32: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ece37: mov dword ptr [rax + 0x28], 0
0x1002ece3e: vmovaps xmm0, xmmword ptr [rip + 0x7cc86a] ; 0x100ab96b0
0x1002ece46: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ece4b: mov byte ptr [rax + 0x40], 0
0x1002ece4f: vxorps ymm0, ymm0, ymm0
0x1002ece53: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ece5b: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ece60: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ece65: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ece6f: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ece79: vmovaps xmm0, xmmword ptr [rbx]
0x1002ece7d: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ece85: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ece8d: vxorps xmm0, xmm0, xmm0
0x1002ece91: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ece99: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ecea3: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002eceab: mov dword ptr [rax + 0xf4], 0
0x1002eceb5: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ecebf: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ecec7: mov dword ptr [rax + 0x10c], 0
0x1002eced1: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ecedb: mov byte ptr [rax + 0x114], 1
0x1002ecee2: mov dword ptr [rax + 0x118], 0
0x1002eceec: mov dword ptr [rax + 0x11c], 0
0x1002ecef6: mov qword ptr [rip + 0x1b02cc3], rax ; 0x101defbc0
0x1002ecefd: mov rdi, r12
0x1002ecf00: mov rsi, rax
0x1002ecf03: mov rdx, r13
0x1002ecf06: vzeroupper 
0x1002ecf09: call 0x100314920 ; 0x100314920
0x1002ecf0e: lea rsi, [rip + 0x893324] ; 0x100b80239 starFall
0x1002ecf15: mov edx, 0x40
0x1002ecf1a: mov rdi, r13
0x1002ecf1d: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ecf22: movsx edi, byte ptr [rbp - 0x70]
0x1002ecf26: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ecf2b: mov byte ptr [rbp - 0x70], al
0x1002ecf2e: mov rdx, qword ptr [rip + 0x1b02733] ; 0x101def668
0x1002ecf35: mov esi, 0x120
0x1002ecf3a: mov ecx, 0x10
0x1002ecf3f: mov rdi, r15
0x1002ecf42: call 0x100795530 ; 0x100795530
0x1002ecf47: vmovaps xmm0, xmmword ptr [rip + 0x7bff11] ; 0x100aace60
0x1002ecf4f: vmovups xmmword ptr [rax], xmm0
0x1002ecf53: mov byte ptr [rax + 0x10], 0
0x1002ecf57: mov byte ptr [rax + 0x11], 1
0x1002ecf5b: mov byte ptr [rax + 0x12], 0
0x1002ecf5f: mov dword ptr [rax + 0x14], 0
0x1002ecf66: mov dword ptr [rax + 0x18], 0
0x1002ecf6d: vxorps xmm0, xmm0, xmm0
0x1002ecf71: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ecf76: mov dword ptr [rax + 0x28], 0
0x1002ecf7d: vmovaps xmm0, xmmword ptr [rip + 0x7cc72b] ; 0x100ab96b0
0x1002ecf85: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ecf8a: mov byte ptr [rax + 0x40], 0
0x1002ecf8e: vxorps ymm0, ymm0, ymm0
0x1002ecf92: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ecf9a: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ecf9f: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ecfa4: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ecfae: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ecfb8: vmovaps xmm0, xmmword ptr [rbx]
0x1002ecfbc: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ecfc4: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ecfcc: vxorps xmm0, xmm0, xmm0
0x1002ecfd0: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ecfd8: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ecfe2: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ecfea: mov dword ptr [rax + 0xf4], 0
0x1002ecff4: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ecffe: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ed006: mov dword ptr [rax + 0x10c], 0
0x1002ed010: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ed01a: mov byte ptr [rax + 0x114], 1
0x1002ed021: mov dword ptr [rax + 0x118], 0
0x1002ed02b: mov dword ptr [rax + 0x11c], 0
0x1002ed035: mov qword ptr [rip + 0x1b02b8c], rax ; 0x101defbc8
0x1002ed03c: mov rdi, r12
0x1002ed03f: mov rsi, rax
0x1002ed042: mov rdx, r13
0x1002ed045: vzeroupper 
0x1002ed048: call 0x100314920 ; 0x100314920
0x1002ed04d: lea rsi, [rip + 0x8931ee] ; 0x100b80242 cloudCarpet
0x1002ed054: mov edx, 0x40
0x1002ed059: mov rdi, r13
0x1002ed05c: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ed061: movsx edi, byte ptr [rbp - 0x70]
0x1002ed065: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ed06a: mov byte ptr [rbp - 0x70], al
0x1002ed06d: mov rdx, qword ptr [rip + 0x1b025f4] ; 0x101def668
0x1002ed074: mov esi, 0x120
0x1002ed079: mov ecx, 0x10
0x1002ed07e: mov rdi, r15
0x1002ed081: call 0x100795530 ; 0x100795530
0x1002ed086: vmovaps xmm0, xmmword ptr [rip + 0x7bfdd2] ; 0x100aace60
0x1002ed08e: vmovups xmmword ptr [rax], xmm0
0x1002ed092: mov byte ptr [rax + 0x10], 0
0x1002ed096: mov byte ptr [rax + 0x11], 1
0x1002ed09a: mov byte ptr [rax + 0x12], 0
0x1002ed09e: mov dword ptr [rax + 0x14], 0
0x1002ed0a5: mov dword ptr [rax + 0x18], 0
0x1002ed0ac: vxorps xmm0, xmm0, xmm0
0x1002ed0b0: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ed0b5: mov dword ptr [rax + 0x28], 0
0x1002ed0bc: vmovaps xmm0, xmmword ptr [rip + 0x7cc5ec] ; 0x100ab96b0
0x1002ed0c4: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ed0c9: mov byte ptr [rax + 0x40], 0
0x1002ed0cd: vxorps ymm0, ymm0, ymm0
0x1002ed0d1: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ed0d9: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ed0de: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ed0e3: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ed0ed: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ed0f7: vmovaps xmm0, xmmword ptr [rbx]
0x1002ed0fb: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ed103: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ed10b: vxorps xmm0, xmm0, xmm0
0x1002ed10f: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ed117: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ed121: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ed129: mov dword ptr [rax + 0xf4], 0
0x1002ed133: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ed13d: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ed145: mov dword ptr [rax + 0x10c], 0
0x1002ed14f: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ed159: mov byte ptr [rax + 0x114], 1
0x1002ed160: mov dword ptr [rax + 0x118], 0
0x1002ed16a: mov dword ptr [rax + 0x11c], 0
0x1002ed174: mov qword ptr [rip + 0x1b02a55], rax ; 0x101defbd0
0x1002ed17b: mov rdi, r12
0x1002ed17e: mov rsi, rax
0x1002ed181: mov rdx, r13
0x1002ed184: vzeroupper 
0x1002ed187: call 0x100314920 ; 0x100314920
0x1002ed18c: lea rsi, [rip + 0x8930bb] ; 0x100b8024e cloudFountain
0x1002ed193: mov edx, 0x40
0x1002ed198: mov rdi, r13
0x1002ed19b: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ed1a0: movsx edi, byte ptr [rbp - 0x70]
0x1002ed1a4: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ed1a9: mov byte ptr [rbp - 0x70], al
0x1002ed1ac: mov rdx, qword ptr [rip + 0x1b024b5] ; 0x101def668
0x1002ed1b3: mov esi, 0x120
0x1002ed1b8: mov ecx, 0x10
0x1002ed1bd: mov rdi, r15
0x1002ed1c0: call 0x100795530 ; 0x100795530
0x1002ed1c5: vmovaps xmm0, xmmword ptr [rip + 0x7bfc93] ; 0x100aace60
0x1002ed1cd: vmovups xmmword ptr [rax], xmm0
0x1002ed1d1: mov byte ptr [rax + 0x10], 0
0x1002ed1d5: mov byte ptr [rax + 0x11], 1
0x1002ed1d9: mov byte ptr [rax + 0x12], 0
0x1002ed1dd: mov dword ptr [rax + 0x14], 0
0x1002ed1e4: mov dword ptr [rax + 0x18], 0
0x1002ed1eb: vxorps xmm0, xmm0, xmm0
0x1002ed1ef: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ed1f4: mov dword ptr [rax + 0x28], 0
0x1002ed1fb: vmovaps xmm0, xmmword ptr [rip + 0x7cc4ad] ; 0x100ab96b0
0x1002ed203: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ed208: mov byte ptr [rax + 0x40], 0
0x1002ed20c: vxorps ymm0, ymm0, ymm0
0x1002ed210: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ed218: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ed21d: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ed222: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ed22c: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ed236: vmovaps xmm0, xmmword ptr [rbx]
0x1002ed23a: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ed242: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ed24a: vxorps xmm0, xmm0, xmm0
0x1002ed24e: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ed256: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ed260: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ed268: mov dword ptr [rax + 0xf4], 0
0x1002ed272: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ed27c: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ed284: mov dword ptr [rax + 0x10c], 0
0x1002ed28e: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ed298: mov byte ptr [rax + 0x114], 1
0x1002ed29f: mov dword ptr [rax + 0x118], 0
0x1002ed2a9: mov dword ptr [rax + 0x11c], 0
0x1002ed2b3: mov qword ptr [rip + 0x1b0291e], rax ; 0x101defbd8
0x1002ed2ba: mov rdi, r12
0x1002ed2bd: mov rsi, rax
0x1002ed2c0: mov rdx, r13
0x1002ed2c3: vzeroupper 
0x1002ed2c6: call 0x100314920 ; 0x100314920
0x1002ed2cb: lea rsi, [rip + 0x892f8a] ; 0x100b8025c stream
0x1002ed2d2: mov edx, 0x40
0x1002ed2d7: mov rdi, r13
0x1002ed2da: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ed2df: movsx edi, byte ptr [rbp - 0x70]
0x1002ed2e3: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ed2e8: mov byte ptr [rbp - 0x70], al
0x1002ed2eb: mov rdx, qword ptr [rip + 0x1b02376] ; 0x101def668
0x1002ed2f2: mov esi, 0x120
0x1002ed2f7: mov ecx, 0x10
0x1002ed2fc: mov rdi, r15
0x1002ed2ff: call 0x100795530 ; 0x100795530
0x1002ed304: vmovaps xmm0, xmmword ptr [rip + 0x7bfb54] ; 0x100aace60
0x1002ed30c: vmovups xmmword ptr [rax], xmm0
0x1002ed310: mov byte ptr [rax + 0x10], 0
0x1002ed314: mov byte ptr [rax + 0x11], 1
0x1002ed318: mov byte ptr [rax + 0x12], 0
0x1002ed31c: mov dword ptr [rax + 0x14], 0
0x1002ed323: mov dword ptr [rax + 0x18], 0
0x1002ed32a: vxorps xmm0, xmm0, xmm0
0x1002ed32e: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ed333: mov dword ptr [rax + 0x28], 0
0x1002ed33a: vmovaps xmm0, xmmword ptr [rip + 0x7cc36e] ; 0x100ab96b0
0x1002ed342: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ed347: mov byte ptr [rax + 0x40], 0
0x1002ed34b: vxorps ymm0, ymm0, ymm0
0x1002ed34f: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ed357: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ed35c: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ed361: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ed36b: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ed375: vmovaps xmm0, xmmword ptr [rbx]
0x1002ed379: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ed381: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ed389: vxorps xmm0, xmm0, xmm0
0x1002ed38d: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ed395: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ed39f: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ed3a7: mov dword ptr [rax + 0xf4], 0
0x1002ed3b1: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ed3bb: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ed3c3: mov dword ptr [rax + 0x10c], 0
0x1002ed3cd: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ed3d7: mov byte ptr [rax + 0x114], 1
0x1002ed3de: mov dword ptr [rax + 0x118], 0
0x1002ed3e8: mov dword ptr [rax + 0x11c], 0
0x1002ed3f2: mov qword ptr [rip + 0x1b027e7], rax ; 0x101defbe0
0x1002ed3f9: mov rdi, r12
0x1002ed3fc: mov rsi, rax
0x1002ed3ff: mov rdx, r13
0x1002ed402: vzeroupper 
0x1002ed405: call 0x100314920 ; 0x100314920
0x1002ed40a: lea rsi, [rip + 0x892e52] ; 0x100b80263 deer
0x1002ed411: mov edx, 0x40
0x1002ed416: mov rdi, r13
0x1002ed419: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ed41e: movsx edi, byte ptr [rbp - 0x70]
0x1002ed422: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ed427: mov byte ptr [rbp - 0x70], al
0x1002ed42a: mov rdx, qword ptr [rip + 0x1b02237] ; 0x101def668
0x1002ed431: mov esi, 0x120
0x1002ed436: mov ecx, 0x10
0x1002ed43b: mov rdi, r15
0x1002ed43e: call 0x100795530 ; 0x100795530
0x1002ed443: vmovaps xmm0, xmmword ptr [rip + 0x7bfa15] ; 0x100aace60
0x1002ed44b: vmovups xmmword ptr [rax], xmm0
0x1002ed44f: mov byte ptr [rax + 0x10], 0
0x1002ed453: mov byte ptr [rax + 0x11], 1
0x1002ed457: mov byte ptr [rax + 0x12], 0
0x1002ed45b: mov dword ptr [rax + 0x14], 0
0x1002ed462: mov dword ptr [rax + 0x18], 0
0x1002ed469: vxorps xmm0, xmm0, xmm0
0x1002ed46d: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ed472: mov dword ptr [rax + 0x28], 0
0x1002ed479: vmovaps xmm0, xmmword ptr [rip + 0x7cc22f] ; 0x100ab96b0
0x1002ed481: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ed486: mov byte ptr [rax + 0x40], 0
0x1002ed48a: vxorps ymm0, ymm0, ymm0
0x1002ed48e: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ed496: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ed49b: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ed4a0: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ed4aa: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ed4b4: vmovaps xmm0, xmmword ptr [rbx]
0x1002ed4b8: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ed4c0: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ed4c8: vxorps xmm0, xmm0, xmm0
0x1002ed4cc: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ed4d4: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ed4de: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ed4e6: mov dword ptr [rax + 0xf4], 0
0x1002ed4f0: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ed4fa: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ed502: mov dword ptr [rax + 0x10c], 0
0x1002ed50c: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ed516: mov byte ptr [rax + 0x114], 1
0x1002ed51d: mov dword ptr [rax + 0x118], 0
0x1002ed527: mov dword ptr [rax + 0x11c], 0
0x1002ed531: mov qword ptr [rip + 0x1b026b0], rax ; 0x101defbe8
0x1002ed538: mov rdi, r12
0x1002ed53b: mov rsi, rax
0x1002ed53e: mov rdx, r13
0x1002ed541: vzeroupper 
0x1002ed544: call 0x100314920 ; 0x100314920
0x1002ed549: lea rsi, [rip + 0x892d18] ; 0x100b80268 deerAmbient
0x1002ed550: mov edx, 0x40
0x1002ed555: mov rdi, r13
0x1002ed558: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ed55d: movsx edi, byte ptr [rbp - 0x70]
0x1002ed561: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ed566: mov byte ptr [rbp - 0x70], al
0x1002ed569: mov rdx, qword ptr [rip + 0x1b020f8] ; 0x101def668
0x1002ed570: mov esi, 0x120
0x1002ed575: mov ecx, 0x10
0x1002ed57a: mov rdi, r15
0x1002ed57d: call 0x100795530 ; 0x100795530
0x1002ed582: vmovaps xmm0, xmmword ptr [rip + 0x7bf8d6] ; 0x100aace60
0x1002ed58a: vmovups xmmword ptr [rax], xmm0
0x1002ed58e: mov byte ptr [rax + 0x10], 0
0x1002ed592: mov byte ptr [rax + 0x11], 1
0x1002ed596: mov byte ptr [rax + 0x12], 0
0x1002ed59a: mov dword ptr [rax + 0x14], 0
0x1002ed5a1: mov dword ptr [rax + 0x18], 0
0x1002ed5a8: vxorps xmm0, xmm0, xmm0
0x1002ed5ac: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ed5b1: mov dword ptr [rax + 0x28], 0
0x1002ed5b8: vmovaps xmm0, xmmword ptr [rip + 0x7cc0f0] ; 0x100ab96b0
0x1002ed5c0: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ed5c5: mov byte ptr [rax + 0x40], 0
0x1002ed5c9: vxorps ymm0, ymm0, ymm0
0x1002ed5cd: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ed5d5: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ed5da: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ed5df: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ed5e9: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ed5f3: vmovaps xmm0, xmmword ptr [rbx]
0x1002ed5f7: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ed5ff: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ed607: vxorps xmm0, xmm0, xmm0
0x1002ed60b: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ed613: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ed61d: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ed625: mov dword ptr [rax + 0xf4], 0
0x1002ed62f: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ed639: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ed641: mov dword ptr [rax + 0x10c], 0
0x1002ed64b: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ed655: mov byte ptr [rax + 0x114], 1
0x1002ed65c: mov dword ptr [rax + 0x118], 0
0x1002ed666: mov dword ptr [rax + 0x11c], 0
0x1002ed670: mov qword ptr [rip + 0x1b02579], rax ; 0x101defbf0
0x1002ed677: mov rdi, r12
0x1002ed67a: mov rsi, rax
0x1002ed67d: mov rdx, r13
0x1002ed680: vzeroupper 
0x1002ed683: call 0x100314920 ; 0x100314920
0x1002ed688: lea rsi, [rip + 0x892be5] ; 0x100b80274 energyThermal
0x1002ed68f: mov edx, 0x40
0x1002ed694: mov rdi, r13
0x1002ed697: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ed69c: movsx edi, byte ptr [rbp - 0x70]
0x1002ed6a0: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ed6a5: mov byte ptr [rbp - 0x70], al
0x1002ed6a8: mov rdx, qword ptr [rip + 0x1b01fb9] ; 0x101def668
0x1002ed6af: mov esi, 0x120
0x1002ed6b4: mov ecx, 0x10
0x1002ed6b9: mov rdi, r15
0x1002ed6bc: call 0x100795530 ; 0x100795530
0x1002ed6c1: vmovaps xmm0, xmmword ptr [rip + 0x7bf797] ; 0x100aace60
0x1002ed6c9: vmovups xmmword ptr [rax], xmm0
0x1002ed6cd: mov byte ptr [rax + 0x10], 0
0x1002ed6d1: mov byte ptr [rax + 0x11], 1
0x1002ed6d5: mov byte ptr [rax + 0x12], 0
0x1002ed6d9: mov dword ptr [rax + 0x14], 0
0x1002ed6e0: mov dword ptr [rax + 0x18], 0
0x1002ed6e7: vxorps xmm0, xmm0, xmm0
0x1002ed6eb: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ed6f0: mov dword ptr [rax + 0x28], 0
0x1002ed6f7: vmovaps xmm0, xmmword ptr [rip + 0x7cbfb1] ; 0x100ab96b0
0x1002ed6ff: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ed704: mov byte ptr [rax + 0x40], 0
0x1002ed708: vxorps ymm0, ymm0, ymm0
0x1002ed70c: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ed714: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ed719: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ed71e: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ed728: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ed732: vmovaps xmm0, xmmword ptr [rbx]
0x1002ed736: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ed73e: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ed746: vxorps xmm0, xmm0, xmm0
0x1002ed74a: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ed752: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ed75c: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ed764: mov dword ptr [rax + 0xf4], 0
0x1002ed76e: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ed778: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ed780: mov dword ptr [rax + 0x10c], 0
0x1002ed78a: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ed794: mov byte ptr [rax + 0x114], 1
0x1002ed79b: mov dword ptr [rax + 0x118], 0
0x1002ed7a5: mov dword ptr [rax + 0x11c], 0
0x1002ed7af: mov qword ptr [rip + 0x1b02442], rax ; 0x101defbf8
0x1002ed7b6: mov rdi, r12
0x1002ed7b9: mov rsi, rax
0x1002ed7bc: mov rdx, r13
0x1002ed7bf: vzeroupper 
0x1002ed7c2: call 0x100314920 ; 0x100314920
0x1002ed7c7: lea rsi, [rip + 0x892ab4] ; 0x100b80282 energyThermal2
0x1002ed7ce: mov edx, 0x40
0x1002ed7d3: mov rdi, r13
0x1002ed7d6: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ed7db: movsx edi, byte ptr [rbp - 0x70]
0x1002ed7df: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ed7e4: mov byte ptr [rbp - 0x70], al
0x1002ed7e7: mov rdx, qword ptr [rip + 0x1b01e7a] ; 0x101def668
0x1002ed7ee: mov esi, 0x120
0x1002ed7f3: mov ecx, 0x10
0x1002ed7f8: mov rdi, r15
0x1002ed7fb: call 0x100795530 ; 0x100795530
0x1002ed800: vmovaps xmm0, xmmword ptr [rip + 0x7bf658] ; 0x100aace60
0x1002ed808: vmovups xmmword ptr [rax], xmm0
0x1002ed80c: mov byte ptr [rax + 0x10], 0
0x1002ed810: mov byte ptr [rax + 0x11], 1
0x1002ed814: mov byte ptr [rax + 0x12], 0
0x1002ed818: mov dword ptr [rax + 0x14], 0
0x1002ed81f: mov dword ptr [rax + 0x18], 0
0x1002ed826: vxorps xmm0, xmm0, xmm0
0x1002ed82a: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ed82f: mov dword ptr [rax + 0x28], 0
0x1002ed836: vmovaps xmm0, xmmword ptr [rip + 0x7cbe72] ; 0x100ab96b0
0x1002ed83e: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ed843: mov byte ptr [rax + 0x40], 0
0x1002ed847: vxorps ymm0, ymm0, ymm0
0x1002ed84b: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ed853: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ed858: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ed85d: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ed867: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ed871: vmovaps xmm0, xmmword ptr [rbx]
0x1002ed875: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ed87d: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ed885: vxorps xmm0, xmm0, xmm0
0x1002ed889: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ed891: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ed89b: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ed8a3: mov dword ptr [rax + 0xf4], 0
0x1002ed8ad: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ed8b7: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ed8bf: mov dword ptr [rax + 0x10c], 0
0x1002ed8c9: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ed8d3: mov byte ptr [rax + 0x114], 1
0x1002ed8da: mov dword ptr [rax + 0x118], 0
0x1002ed8e4: mov dword ptr [rax + 0x11c], 0
0x1002ed8ee: mov qword ptr [rip + 0x1b0230b], rax ; 0x101defc00
0x1002ed8f5: mov rdi, r12
0x1002ed8f8: mov rsi, rax
0x1002ed8fb: mov rdx, r13
0x1002ed8fe: vzeroupper 
0x1002ed901: call 0x100314920 ; 0x100314920
0x1002ed906: lea rsi, [rip + 0x892984] ; 0x100b80291 windParticles
0x1002ed90d: mov edx, 0x40
0x1002ed912: mov rdi, r13
0x1002ed915: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ed91a: movsx edi, byte ptr [rbp - 0x70]
0x1002ed91e: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ed923: mov byte ptr [rbp - 0x70], al
0x1002ed926: mov rdx, qword ptr [rip + 0x1b01d3b] ; 0x101def668
0x1002ed92d: mov esi, 0x120
0x1002ed932: mov ecx, 0x10
0x1002ed937: mov rdi, r15
0x1002ed93a: call 0x100795530 ; 0x100795530
0x1002ed93f: vmovaps xmm0, xmmword ptr [rip + 0x7bf519] ; 0x100aace60
0x1002ed947: vmovups xmmword ptr [rax], xmm0
0x1002ed94b: mov byte ptr [rax + 0x10], 0
0x1002ed94f: mov byte ptr [rax + 0x11], 1
0x1002ed953: mov byte ptr [rax + 0x12], 0
0x1002ed957: mov dword ptr [rax + 0x14], 0
0x1002ed95e: mov dword ptr [rax + 0x18], 0
0x1002ed965: vxorps xmm0, xmm0, xmm0
0x1002ed969: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ed96e: mov dword ptr [rax + 0x28], 0
0x1002ed975: vmovaps xmm0, xmmword ptr [rip + 0x7cbd33] ; 0x100ab96b0
0x1002ed97d: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ed982: mov byte ptr [rax + 0x40], 0
0x1002ed986: vxorps ymm0, ymm0, ymm0
0x1002ed98a: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ed992: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ed997: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ed99c: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ed9a6: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ed9b0: vmovaps xmm0, xmmword ptr [rbx]
0x1002ed9b4: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ed9bc: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ed9c4: vxorps xmm0, xmm0, xmm0
0x1002ed9c8: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ed9d0: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ed9da: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ed9e2: mov dword ptr [rax + 0xf4], 0
0x1002ed9ec: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ed9f6: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ed9fe: mov dword ptr [rax + 0x10c], 0
0x1002eda08: mov dword ptr [rax + 0x110], 0x3f800000
0x1002eda12: mov byte ptr [rax + 0x114], 1
0x1002eda19: mov dword ptr [rax + 0x118], 0
0x1002eda23: mov dword ptr [rax + 0x11c], 0
0x1002eda2d: mov qword ptr [rip + 0x1b021d4], rax ; 0x101defc08
0x1002eda34: mov rdi, r12
0x1002eda37: mov rsi, rax
0x1002eda3a: mov rdx, r13
0x1002eda3d: vzeroupper 
0x1002eda40: call 0x100314920 ; 0x100314920
0x1002eda45: lea rsi, [rip + 0x892853] ; 0x100b8029f floatingDust
0x1002eda4c: mov edx, 0x40
0x1002eda51: mov rdi, r13
0x1002eda54: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002eda59: movsx edi, byte ptr [rbp - 0x70]
0x1002eda5d: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002eda62: mov byte ptr [rbp - 0x70], al
0x1002eda65: mov rdx, qword ptr [rip + 0x1b01bfc] ; 0x101def668
0x1002eda6c: mov esi, 0x120
0x1002eda71: mov ecx, 0x10
0x1002eda76: mov rdi, r15
0x1002eda79: call 0x100795530 ; 0x100795530
0x1002eda7e: vmovaps xmm0, xmmword ptr [rip + 0x7bf3da] ; 0x100aace60
0x1002eda86: vmovups xmmword ptr [rax], xmm0
0x1002eda8a: mov byte ptr [rax + 0x10], 0
0x1002eda8e: mov byte ptr [rax + 0x11], 1
0x1002eda92: mov byte ptr [rax + 0x12], 0
0x1002eda96: mov dword ptr [rax + 0x14], 0
0x1002eda9d: mov dword ptr [rax + 0x18], 0
0x1002edaa4: vxorps xmm0, xmm0, xmm0
0x1002edaa8: vmovlps qword ptr [rax + 0x20], xmm0
0x1002edaad: mov dword ptr [rax + 0x28], 0
0x1002edab4: vmovaps xmm0, xmmword ptr [rip + 0x7cbbf4] ; 0x100ab96b0
0x1002edabc: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002edac1: mov byte ptr [rax + 0x40], 0
0x1002edac5: vxorps ymm0, ymm0, ymm0
0x1002edac9: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002edad1: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002edad6: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002edadb: mov dword ptr [rax + 0xa4], 0x40600000
0x1002edae5: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002edaef: vmovaps xmm0, xmmword ptr [rbx]
0x1002edaf3: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002edafb: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002edb03: vxorps xmm0, xmm0, xmm0
0x1002edb07: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002edb0f: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002edb19: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002edb21: mov dword ptr [rax + 0xf4], 0
0x1002edb2b: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002edb35: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002edb3d: mov dword ptr [rax + 0x10c], 0
0x1002edb47: mov dword ptr [rax + 0x110], 0x3f800000
0x1002edb51: mov byte ptr [rax + 0x114], 1
0x1002edb58: mov dword ptr [rax + 0x118], 0
0x1002edb62: mov dword ptr [rax + 0x11c], 0
0x1002edb6c: mov qword ptr [rip + 0x1b0209d], rax ; 0x101defc10
0x1002edb73: mov rdi, r12
0x1002edb76: mov rsi, rax
0x1002edb79: mov rdx, r13
0x1002edb7c: vzeroupper 
0x1002edb7f: call 0x100314920 ; 0x100314920
0x1002edb84: lea rsi, [rip + 0x892721] ; 0x100b802ac floatingDust2
0x1002edb8b: mov edx, 0x40
0x1002edb90: mov rdi, r13
0x1002edb93: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002edb98: movsx edi, byte ptr [rbp - 0x70]
0x1002edb9c: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002edba1: mov byte ptr [rbp - 0x70], al
0x1002edba4: mov rdx, qword ptr [rip + 0x1b01abd] ; 0x101def668
0x1002edbab: mov esi, 0x120
0x1002edbb0: mov ecx, 0x10
0x1002edbb5: mov rdi, r15
0x1002edbb8: call 0x100795530 ; 0x100795530
0x1002edbbd: vmovaps xmm0, xmmword ptr [rip + 0x7bf29b] ; 0x100aace60
0x1002edbc5: vmovups xmmword ptr [rax], xmm0
0x1002edbc9: mov byte ptr [rax + 0x10], 0
0x1002edbcd: mov byte ptr [rax + 0x11], 1
0x1002edbd1: mov byte ptr [rax + 0x12], 0
0x1002edbd5: mov dword ptr [rax + 0x14], 0
0x1002edbdc: mov dword ptr [rax + 0x18], 0
0x1002edbe3: vxorps xmm0, xmm0, xmm0
0x1002edbe7: vmovlps qword ptr [rax + 0x20], xmm0
0x1002edbec: mov dword ptr [rax + 0x28], 0
0x1002edbf3: vmovaps xmm0, xmmword ptr [rip + 0x7cbab5] ; 0x100ab96b0
0x1002edbfb: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002edc00: mov byte ptr [rax + 0x40], 0
0x1002edc04: vxorps ymm0, ymm0, ymm0
0x1002edc08: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002edc10: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002edc15: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002edc1a: mov dword ptr [rax + 0xa4], 0x40600000
0x1002edc24: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002edc2e: vmovaps xmm0, xmmword ptr [rbx]
0x1002edc32: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002edc3a: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002edc42: vxorps xmm0, xmm0, xmm0
0x1002edc46: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002edc4e: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002edc58: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002edc60: mov dword ptr [rax + 0xf4], 0
0x1002edc6a: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002edc74: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002edc7c: mov dword ptr [rax + 0x10c], 0
0x1002edc86: mov dword ptr [rax + 0x110], 0x3f800000
0x1002edc90: mov byte ptr [rax + 0x114], 1
0x1002edc97: mov dword ptr [rax + 0x118], 0
0x1002edca1: mov dword ptr [rax + 0x11c], 0
0x1002edcab: mov qword ptr [rip + 0x1b01f66], rax ; 0x101defc18
0x1002edcb2: mov rdi, r12
0x1002edcb5: mov rsi, rax
0x1002edcb8: mov rdx, r13
0x1002edcbb: vzeroupper 
0x1002edcbe: call 0x100314920 ; 0x100314920
0x1002edcc3: lea rsi, [rip + 0x8925f0] ; 0x100b802ba outfit
0x1002edcca: mov edx, 0x40
0x1002edccf: mov rdi, r13
0x1002edcd2: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002edcd7: movsx edi, byte ptr [rbp - 0x70]
0x1002edcdb: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002edce0: mov byte ptr [rbp - 0x70], al
0x1002edce3: mov rdx, qword ptr [rip + 0x1b0197e] ; 0x101def668
0x1002edcea: mov esi, 0x120
0x1002edcef: mov ecx, 0x10
0x1002edcf4: mov rdi, r15
0x1002edcf7: call 0x100795530 ; 0x100795530
0x1002edcfc: vmovaps xmm0, xmmword ptr [rip + 0x7bf15c] ; 0x100aace60
0x1002edd04: vmovups xmmword ptr [rax], xmm0
0x1002edd08: mov byte ptr [rax + 0x10], 0
0x1002edd0c: mov byte ptr [rax + 0x11], 1
0x1002edd10: mov byte ptr [rax + 0x12], 0
0x1002edd14: mov dword ptr [rax + 0x14], 0
0x1002edd1b: mov dword ptr [rax + 0x18], 0
0x1002edd22: vxorps xmm0, xmm0, xmm0
0x1002edd26: vmovlps qword ptr [rax + 0x20], xmm0
0x1002edd2b: mov dword ptr [rax + 0x28], 0
0x1002edd32: vmovaps xmm0, xmmword ptr [rip + 0x7cb976] ; 0x100ab96b0
0x1002edd3a: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002edd3f: mov byte ptr [rax + 0x40], 0
0x1002edd43: vxorps ymm0, ymm0, ymm0
0x1002edd47: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002edd4f: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002edd54: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002edd59: mov dword ptr [rax + 0xa4], 0x40600000
0x1002edd63: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002edd6d: vmovaps xmm0, xmmword ptr [rbx]
0x1002edd71: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002edd79: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002edd81: vxorps xmm0, xmm0, xmm0
0x1002edd85: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002edd8d: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002edd97: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002edd9f: mov dword ptr [rax + 0xf4], 0
0x1002edda9: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002eddb3: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002eddbb: mov dword ptr [rax + 0x10c], 0
0x1002eddc5: mov dword ptr [rax + 0x110], 0x3f800000
0x1002eddcf: mov byte ptr [rax + 0x114], 1
0x1002eddd6: mov dword ptr [rax + 0x118], 0
0x1002edde0: mov dword ptr [rax + 0x11c], 0
0x1002eddea: mov qword ptr [rip + 0x1b01e2f], rax ; 0x101defc20
0x1002eddf1: mov rdi, r12
0x1002eddf4: mov rsi, rax
0x1002eddf7: mov rdx, r13
0x1002eddfa: vzeroupper 
0x1002eddfd: call 0x100314920 ; 0x100314920
0x1002ede02: lea rsi, [rip + 0x8924b8] ; 0x100b802c1 outfitSource
0x1002ede09: mov edx, 0x40
0x1002ede0e: mov rdi, r13
0x1002ede11: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ede16: movsx edi, byte ptr [rbp - 0x70]
0x1002ede1a: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ede1f: mov byte ptr [rbp - 0x70], al
0x1002ede22: mov rdx, qword ptr [rip + 0x1b0183f] ; 0x101def668
0x1002ede29: mov esi, 0x120
0x1002ede2e: mov ecx, 0x10
0x1002ede33: mov rdi, r15
0x1002ede36: call 0x100795530 ; 0x100795530
0x1002ede3b: vmovaps xmm0, xmmword ptr [rip + 0x7bf01d] ; 0x100aace60
0x1002ede43: vmovups xmmword ptr [rax], xmm0
0x1002ede47: mov byte ptr [rax + 0x10], 0
0x1002ede4b: mov byte ptr [rax + 0x11], 1
0x1002ede4f: mov byte ptr [rax + 0x12], 0
0x1002ede53: mov dword ptr [rax + 0x14], 0
0x1002ede5a: mov dword ptr [rax + 0x18], 0
0x1002ede61: vxorps xmm0, xmm0, xmm0
0x1002ede65: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ede6a: mov dword ptr [rax + 0x28], 0
0x1002ede71: vmovaps xmm0, xmmword ptr [rip + 0x7cb837] ; 0x100ab96b0
0x1002ede79: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ede7e: mov byte ptr [rax + 0x40], 0
0x1002ede82: vxorps ymm0, ymm0, ymm0
0x1002ede86: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ede8e: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ede93: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ede98: mov dword ptr [rax + 0xa4], 0x40600000
0x1002edea2: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002edeac: vmovaps xmm0, xmmword ptr [rbx]
0x1002edeb0: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002edeb8: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002edec0: vxorps xmm0, xmm0, xmm0
0x1002edec4: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002edecc: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002eded6: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002edede: mov dword ptr [rax + 0xf4], 0
0x1002edee8: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002edef2: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002edefa: mov dword ptr [rax + 0x10c], 0
0x1002edf04: mov dword ptr [rax + 0x110], 0x3f800000
0x1002edf0e: mov byte ptr [rax + 0x114], 1
0x1002edf15: mov dword ptr [rax + 0x118], 0
0x1002edf1f: mov dword ptr [rax + 0x11c], 0
0x1002edf29: mov qword ptr [rip + 0x1b01cf8], rax ; 0x101defc28
0x1002edf30: mov rdi, r12
0x1002edf33: mov rsi, rax
0x1002edf36: mov rdx, r13
0x1002edf39: vzeroupper 
0x1002edf3c: call 0x100314920 ; 0x100314920
0x1002edf41: lea rsi, [rip + 0x892386] ; 0x100b802ce chargeSource
0x1002edf48: mov edx, 0x40
0x1002edf4d: mov rdi, r13
0x1002edf50: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002edf55: movsx edi, byte ptr [rbp - 0x70]
0x1002edf59: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002edf5e: mov byte ptr [rbp - 0x70], al
0x1002edf61: mov rdx, qword ptr [rip + 0x1b01700] ; 0x101def668
0x1002edf68: mov esi, 0x120
0x1002edf6d: mov ecx, 0x10
0x1002edf72: mov rdi, r15
0x1002edf75: call 0x100795530 ; 0x100795530
0x1002edf7a: vmovaps xmm0, xmmword ptr [rip + 0x7beede] ; 0x100aace60
0x1002edf82: vmovups xmmword ptr [rax], xmm0
0x1002edf86: mov byte ptr [rax + 0x10], 0
0x1002edf8a: mov byte ptr [rax + 0x11], 1
0x1002edf8e: mov byte ptr [rax + 0x12], 0
0x1002edf92: mov dword ptr [rax + 0x14], 0
0x1002edf99: mov dword ptr [rax + 0x18], 0
0x1002edfa0: vxorps xmm0, xmm0, xmm0
0x1002edfa4: vmovlps qword ptr [rax + 0x20], xmm0
0x1002edfa9: mov dword ptr [rax + 0x28], 0
0x1002edfb0: vmovaps xmm0, xmmword ptr [rip + 0x7cb6f8] ; 0x100ab96b0
0x1002edfb8: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002edfbd: mov byte ptr [rax + 0x40], 0
0x1002edfc1: vxorps ymm0, ymm0, ymm0
0x1002edfc5: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002edfcd: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002edfd2: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002edfd7: mov dword ptr [rax + 0xa4], 0x40600000
0x1002edfe1: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002edfeb: vmovaps xmm0, xmmword ptr [rbx]
0x1002edfef: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002edff7: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002edfff: vxorps xmm0, xmm0, xmm0
0x1002ee003: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ee00b: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ee015: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ee01d: mov dword ptr [rax + 0xf4], 0
0x1002ee027: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ee031: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ee039: mov dword ptr [rax + 0x10c], 0
0x1002ee043: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ee04d: mov byte ptr [rax + 0x114], 1
0x1002ee054: mov dword ptr [rax + 0x118], 0
0x1002ee05e: mov dword ptr [rax + 0x11c], 0
0x1002ee068: mov qword ptr [rip + 0x1b01bc1], rax ; 0x101defc30
0x1002ee06f: mov rdi, r12
0x1002ee072: mov rsi, rax
0x1002ee075: mov rdx, r13
0x1002ee078: vzeroupper 
0x1002ee07b: call 0x100314920 ; 0x100314920
0x1002ee080: lea rsi, [rip + 0x892254] ; 0x100b802db chargeTerminal
0x1002ee087: mov edx, 0x40
0x1002ee08c: mov rdi, r13
0x1002ee08f: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ee094: movsx edi, byte ptr [rbp - 0x70]
0x1002ee098: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ee09d: mov byte ptr [rbp - 0x70], al
0x1002ee0a0: mov rdx, qword ptr [rip + 0x1b015c1] ; 0x101def668
0x1002ee0a7: mov esi, 0x120
0x1002ee0ac: mov ecx, 0x10
0x1002ee0b1: mov rdi, r15
0x1002ee0b4: call 0x100795530 ; 0x100795530
0x1002ee0b9: vmovaps xmm0, xmmword ptr [rip + 0x7bed9f] ; 0x100aace60
0x1002ee0c1: vmovups xmmword ptr [rax], xmm0
0x1002ee0c5: mov byte ptr [rax + 0x10], 0
0x1002ee0c9: mov byte ptr [rax + 0x11], 1
0x1002ee0cd: mov byte ptr [rax + 0x12], 0
0x1002ee0d1: mov dword ptr [rax + 0x14], 0
0x1002ee0d8: mov dword ptr [rax + 0x18], 0
0x1002ee0df: vxorps xmm0, xmm0, xmm0
0x1002ee0e3: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ee0e8: mov dword ptr [rax + 0x28], 0
0x1002ee0ef: vmovaps xmm0, xmmword ptr [rip + 0x7cb5b9] ; 0x100ab96b0
0x1002ee0f7: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ee0fc: mov byte ptr [rax + 0x40], 0
0x1002ee100: vxorps ymm0, ymm0, ymm0
0x1002ee104: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ee10c: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ee111: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ee116: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ee120: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ee12a: vmovaps xmm0, xmmword ptr [rbx]
0x1002ee12e: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ee136: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ee13e: vxorps xmm0, xmm0, xmm0
0x1002ee142: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ee14a: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ee154: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ee15c: mov dword ptr [rax + 0xf4], 0
0x1002ee166: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ee170: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ee178: mov dword ptr [rax + 0x10c], 0
0x1002ee182: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ee18c: mov byte ptr [rax + 0x114], 1
0x1002ee193: mov dword ptr [rax + 0x118], 0
0x1002ee19d: mov dword ptr [rax + 0x11c], 0
0x1002ee1a7: mov qword ptr [rip + 0x1b01a8a], rax ; 0x101defc38
0x1002ee1ae: mov rdi, r12
0x1002ee1b1: mov rsi, rax
0x1002ee1b4: mov rdx, r13
0x1002ee1b7: vzeroupper 
0x1002ee1ba: call 0x100314920 ; 0x100314920
0x1002ee1bf: lea rsi, [rip + 0x88f4b6] ; 0x100b7d67c dazzle
0x1002ee1c6: mov edx, 0x40
0x1002ee1cb: mov rdi, r13
0x1002ee1ce: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ee1d3: movsx edi, byte ptr [rbp - 0x70]
0x1002ee1d7: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ee1dc: mov byte ptr [rbp - 0x70], al
0x1002ee1df: mov rdx, qword ptr [rip + 0x1b01482] ; 0x101def668
0x1002ee1e6: mov esi, 0x120
0x1002ee1eb: mov ecx, 0x10
0x1002ee1f0: mov rdi, r15
0x1002ee1f3: call 0x100795530 ; 0x100795530
0x1002ee1f8: vmovaps xmm0, xmmword ptr [rip + 0x7bec60] ; 0x100aace60
0x1002ee200: vmovups xmmword ptr [rax], xmm0
0x1002ee204: mov byte ptr [rax + 0x10], 0
0x1002ee208: mov byte ptr [rax + 0x11], 1
0x1002ee20c: mov byte ptr [rax + 0x12], 0
0x1002ee210: mov dword ptr [rax + 0x14], 0
0x1002ee217: mov dword ptr [rax + 0x18], 0
0x1002ee21e: vxorps xmm0, xmm0, xmm0
0x1002ee222: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ee227: mov dword ptr [rax + 0x28], 0
0x1002ee22e: vmovaps xmm0, xmmword ptr [rip + 0x7cb47a] ; 0x100ab96b0
0x1002ee236: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ee23b: mov byte ptr [rax + 0x40], 0
0x1002ee23f: vxorps ymm0, ymm0, ymm0
0x1002ee243: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ee24b: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ee250: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ee255: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ee25f: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ee269: vmovaps xmm0, xmmword ptr [rbx]
0x1002ee26d: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ee275: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ee27d: vxorps xmm0, xmm0, xmm0
0x1002ee281: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ee289: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ee293: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ee29b: mov dword ptr [rax + 0xf4], 0
0x1002ee2a5: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ee2af: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ee2b7: mov dword ptr [rax + 0x10c], 0
0x1002ee2c1: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ee2cb: mov byte ptr [rax + 0x114], 1
0x1002ee2d2: mov dword ptr [rax + 0x118], 0
0x1002ee2dc: mov dword ptr [rax + 0x11c], 0
0x1002ee2e6: mov qword ptr [rip + 0x1b01953], rax ; 0x101defc40
0x1002ee2ed: mov rdi, r12
0x1002ee2f0: mov rsi, rax
0x1002ee2f3: mov rdx, r13
0x1002ee2f6: vzeroupper 
0x1002ee2f9: call 0x100314920 ; 0x100314920
0x1002ee2fe: lea rsi, [rip + 0x891fe5] ; 0x100b802ea dazzle2
0x1002ee305: mov edx, 0x40
0x1002ee30a: mov rdi, r13
0x1002ee30d: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ee312: movsx edi, byte ptr [rbp - 0x70]
0x1002ee316: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ee31b: mov byte ptr [rbp - 0x70], al
0x1002ee31e: mov rdx, qword ptr [rip + 0x1b01343] ; 0x101def668
0x1002ee325: mov esi, 0x120
0x1002ee32a: mov ecx, 0x10
0x1002ee32f: mov rdi, r15
0x1002ee332: call 0x100795530 ; 0x100795530
0x1002ee337: vmovaps xmm0, xmmword ptr [rip + 0x7beb21] ; 0x100aace60
0x1002ee33f: vmovups xmmword ptr [rax], xmm0
0x1002ee343: mov byte ptr [rax + 0x10], 0
0x1002ee347: mov byte ptr [rax + 0x11], 1
0x1002ee34b: mov byte ptr [rax + 0x12], 0
0x1002ee34f: mov dword ptr [rax + 0x14], 0
0x1002ee356: mov dword ptr [rax + 0x18], 0
0x1002ee35d: vxorps xmm0, xmm0, xmm0
0x1002ee361: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ee366: mov dword ptr [rax + 0x28], 0
0x1002ee36d: vmovaps xmm0, xmmword ptr [rip + 0x7cb33b] ; 0x100ab96b0
0x1002ee375: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ee37a: mov byte ptr [rax + 0x40], 0
0x1002ee37e: vxorps ymm0, ymm0, ymm0
0x1002ee382: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ee38a: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ee38f: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ee394: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ee39e: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ee3a8: vmovaps xmm0, xmmword ptr [rbx]
0x1002ee3ac: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ee3b4: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ee3bc: vxorps xmm0, xmm0, xmm0
0x1002ee3c0: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ee3c8: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ee3d2: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ee3da: mov dword ptr [rax + 0xf4], 0
0x1002ee3e4: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ee3ee: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ee3f6: mov dword ptr [rax + 0x10c], 0
0x1002ee400: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ee40a: mov byte ptr [rax + 0x114], 1
0x1002ee411: mov dword ptr [rax + 0x118], 0
0x1002ee41b: mov dword ptr [rax + 0x11c], 0
0x1002ee425: mov qword ptr [rip + 0x1b0181c], rax ; 0x101defc48
0x1002ee42c: mov rdi, r12
0x1002ee42f: mov rsi, rax
0x1002ee432: mov rdx, r13
0x1002ee435: vzeroupper 
0x1002ee438: call 0x100314920 ; 0x100314920
0x1002ee43d: lea rsi, [rip + 0x891eae] ; 0x100b802f2 kingExplosion
0x1002ee444: mov edx, 0x40
0x1002ee449: mov rdi, r13
0x1002ee44c: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ee451: movsx edi, byte ptr [rbp - 0x70]
0x1002ee455: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ee45a: mov byte ptr [rbp - 0x70], al
0x1002ee45d: mov rdx, qword ptr [rip + 0x1b01204] ; 0x101def668
0x1002ee464: mov esi, 0x120
0x1002ee469: mov ecx, 0x10
0x1002ee46e: mov rdi, r15
0x1002ee471: call 0x100795530 ; 0x100795530
0x1002ee476: vmovaps xmm0, xmmword ptr [rip + 0x7be9e2] ; 0x100aace60
0x1002ee47e: vmovups xmmword ptr [rax], xmm0
0x1002ee482: mov byte ptr [rax + 0x10], 0
0x1002ee486: mov byte ptr [rax + 0x11], 1
0x1002ee48a: mov byte ptr [rax + 0x12], 0
0x1002ee48e: mov dword ptr [rax + 0x14], 0
0x1002ee495: mov dword ptr [rax + 0x18], 0
0x1002ee49c: vxorps xmm0, xmm0, xmm0
0x1002ee4a0: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ee4a5: mov dword ptr [rax + 0x28], 0
0x1002ee4ac: vmovaps xmm0, xmmword ptr [rip + 0x7cb1fc] ; 0x100ab96b0
0x1002ee4b4: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ee4b9: mov byte ptr [rax + 0x40], 0
0x1002ee4bd: vxorps ymm0, ymm0, ymm0
0x1002ee4c1: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ee4c9: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ee4ce: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ee4d3: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ee4dd: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ee4e7: vmovaps xmm0, xmmword ptr [rbx]
0x1002ee4eb: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ee4f3: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ee4fb: vxorps xmm0, xmm0, xmm0
0x1002ee4ff: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ee507: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ee511: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ee519: mov dword ptr [rax + 0xf4], 0
0x1002ee523: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ee52d: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ee535: mov dword ptr [rax + 0x10c], 0
0x1002ee53f: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ee549: mov byte ptr [rax + 0x114], 1
0x1002ee550: mov dword ptr [rax + 0x118], 0
0x1002ee55a: mov dword ptr [rax + 0x11c], 0
0x1002ee564: mov qword ptr [rip + 0x1b016e5], rax ; 0x101defc50
0x1002ee56b: mov rdi, r12
0x1002ee56e: mov rsi, rax
0x1002ee571: mov rdx, r13
0x1002ee574: vzeroupper 
0x1002ee577: call 0x100314920 ; 0x100314920
0x1002ee57c: lea rsi, [rip + 0x891d7d] ; 0x100b80300 dazzleFire
0x1002ee583: mov edx, 0x40
0x1002ee588: mov rdi, r13
0x1002ee58b: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ee590: movsx edi, byte ptr [rbp - 0x70]
0x1002ee594: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ee599: mov byte ptr [rbp - 0x70], al
0x1002ee59c: mov rdx, qword ptr [rip + 0x1b010c5] ; 0x101def668
0x1002ee5a3: mov esi, 0x120
0x1002ee5a8: mov ecx, 0x10
0x1002ee5ad: mov rdi, r15
0x1002ee5b0: call 0x100795530 ; 0x100795530
0x1002ee5b5: vmovaps xmm0, xmmword ptr [rip + 0x7be8a3] ; 0x100aace60
0x1002ee5bd: vmovups xmmword ptr [rax], xmm0
0x1002ee5c1: mov byte ptr [rax + 0x10], 0
0x1002ee5c5: mov byte ptr [rax + 0x11], 1
0x1002ee5c9: mov byte ptr [rax + 0x12], 0
0x1002ee5cd: mov dword ptr [rax + 0x14], 0
0x1002ee5d4: mov dword ptr [rax + 0x18], 0
0x1002ee5db: vxorps xmm0, xmm0, xmm0
0x1002ee5df: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ee5e4: mov dword ptr [rax + 0x28], 0
0x1002ee5eb: vmovaps xmm0, xmmword ptr [rip + 0x7cb0bd] ; 0x100ab96b0
0x1002ee5f3: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ee5f8: mov byte ptr [rax + 0x40], 0
0x1002ee5fc: vxorps ymm0, ymm0, ymm0
0x1002ee600: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ee608: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ee60d: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ee612: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ee61c: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ee626: vmovaps xmm0, xmmword ptr [rbx]
0x1002ee62a: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ee632: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ee63a: vxorps xmm0, xmm0, xmm0
0x1002ee63e: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ee646: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ee650: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ee658: mov dword ptr [rax + 0xf4], 0
0x1002ee662: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ee66c: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ee674: mov dword ptr [rax + 0x10c], 0
0x1002ee67e: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ee688: mov byte ptr [rax + 0x114], 1
0x1002ee68f: mov dword ptr [rax + 0x118], 0
0x1002ee699: mov dword ptr [rax + 0x11c], 0
0x1002ee6a3: mov qword ptr [rip + 0x1b015ae], rax ; 0x101defc58
0x1002ee6aa: mov rdi, r12
0x1002ee6ad: mov rsi, rax
0x1002ee6b0: mov rdx, r13
0x1002ee6b3: vzeroupper 
0x1002ee6b6: call 0x100314920 ; 0x100314920
0x1002ee6bb: lea rsi, [rip + 0x891c49] ; 0x100b8030b leaf
0x1002ee6c2: mov edx, 0x40
0x1002ee6c7: mov rdi, r13
0x1002ee6ca: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ee6cf: movsx edi, byte ptr [rbp - 0x70]
0x1002ee6d3: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ee6d8: mov byte ptr [rbp - 0x70], al
0x1002ee6db: mov rdx, qword ptr [rip + 0x1b00f86] ; 0x101def668
0x1002ee6e2: mov esi, 0x120
0x1002ee6e7: mov ecx, 0x10
0x1002ee6ec: mov rdi, r15
0x1002ee6ef: call 0x100795530 ; 0x100795530
0x1002ee6f4: vmovaps xmm0, xmmword ptr [rip + 0x7be764] ; 0x100aace60
0x1002ee6fc: vmovups xmmword ptr [rax], xmm0
0x1002ee700: mov byte ptr [rax + 0x10], 0
0x1002ee704: mov byte ptr [rax + 0x11], 1
0x1002ee708: mov byte ptr [rax + 0x12], 0
0x1002ee70c: mov dword ptr [rax + 0x14], 0
0x1002ee713: mov dword ptr [rax + 0x18], 0
0x1002ee71a: vxorps xmm0, xmm0, xmm0
0x1002ee71e: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ee723: mov dword ptr [rax + 0x28], 0
0x1002ee72a: vmovaps xmm0, xmmword ptr [rip + 0x7caf7e] ; 0x100ab96b0
0x1002ee732: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ee737: mov byte ptr [rax + 0x40], 0
0x1002ee73b: vxorps ymm0, ymm0, ymm0
0x1002ee73f: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ee747: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ee74c: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ee751: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ee75b: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ee765: vmovaps xmm0, xmmword ptr [rbx]
0x1002ee769: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ee771: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ee779: vxorps xmm0, xmm0, xmm0
0x1002ee77d: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ee785: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ee78f: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ee797: mov dword ptr [rax + 0xf4], 0
0x1002ee7a1: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ee7ab: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ee7b3: mov dword ptr [rax + 0x10c], 0
0x1002ee7bd: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ee7c7: mov byte ptr [rax + 0x114], 1
0x1002ee7ce: mov dword ptr [rax + 0x118], 0
0x1002ee7d8: mov dword ptr [rax + 0x11c], 0
0x1002ee7e2: mov qword ptr [rip + 0x1b01477], rax ; 0x101defc60
0x1002ee7e9: mov rdi, r12
0x1002ee7ec: mov rsi, rax
0x1002ee7ef: mov rdx, r13
0x1002ee7f2: vzeroupper 
0x1002ee7f5: call 0x100314920 ; 0x100314920
0x1002ee7fa: lea rsi, [rip + 0x891b0f] ; 0x100b80310 cloudPuffEmission
0x1002ee801: mov edx, 0x40
0x1002ee806: mov rdi, r13
0x1002ee809: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ee80e: movsx edi, byte ptr [rbp - 0x70]
0x1002ee812: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ee817: mov byte ptr [rbp - 0x70], al
0x1002ee81a: mov rdx, qword ptr [rip + 0x1b00e47] ; 0x101def668
0x1002ee821: mov esi, 0x120
0x1002ee826: mov ecx, 0x10
0x1002ee82b: mov rdi, r15
0x1002ee82e: call 0x100795530 ; 0x100795530
0x1002ee833: vmovaps xmm0, xmmword ptr [rip + 0x7be625] ; 0x100aace60
0x1002ee83b: vmovups xmmword ptr [rax], xmm0
0x1002ee83f: mov byte ptr [rax + 0x10], 0
0x1002ee843: mov byte ptr [rax + 0x11], 1
0x1002ee847: mov byte ptr [rax + 0x12], 0
0x1002ee84b: mov dword ptr [rax + 0x14], 0
0x1002ee852: mov dword ptr [rax + 0x18], 0
0x1002ee859: vxorps xmm0, xmm0, xmm0
0x1002ee85d: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ee862: mov dword ptr [rax + 0x28], 0
0x1002ee869: vmovaps xmm0, xmmword ptr [rip + 0x7cae3f] ; 0x100ab96b0
0x1002ee871: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ee876: mov byte ptr [rax + 0x40], 0
0x1002ee87a: vxorps ymm0, ymm0, ymm0
0x1002ee87e: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ee886: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ee88b: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ee890: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ee89a: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ee8a4: vmovaps xmm0, xmmword ptr [rbx]
0x1002ee8a8: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ee8b0: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ee8b8: vxorps xmm0, xmm0, xmm0
0x1002ee8bc: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ee8c4: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ee8ce: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ee8d6: mov dword ptr [rax + 0xf4], 0
0x1002ee8e0: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ee8ea: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ee8f2: mov dword ptr [rax + 0x10c], 0
0x1002ee8fc: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ee906: mov byte ptr [rax + 0x114], 1
0x1002ee90d: mov dword ptr [rax + 0x118], 0
0x1002ee917: mov dword ptr [rax + 0x11c], 0
0x1002ee921: mov qword ptr [rip + 0x1b01340], rax ; 0x101defc68
0x1002ee928: mov rdi, r12
0x1002ee92b: mov rsi, rax
0x1002ee92e: mov rdx, r13
0x1002ee931: vzeroupper 
0x1002ee934: call 0x100314920 ; 0x100314920
0x1002ee939: lea rsi, [rip + 0x8919e2] ; 0x100b80322 flowerPop
0x1002ee940: mov edx, 0x40
0x1002ee945: mov rdi, r13
0x1002ee948: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ee94d: movsx edi, byte ptr [rbp - 0x70]
0x1002ee951: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ee956: mov byte ptr [rbp - 0x70], al
0x1002ee959: mov rdx, qword ptr [rip + 0x1b00d08] ; 0x101def668
0x1002ee960: mov esi, 0x120
0x1002ee965: mov ecx, 0x10
0x1002ee96a: mov rdi, r15
0x1002ee96d: call 0x100795530 ; 0x100795530
0x1002ee972: vmovaps xmm0, xmmword ptr [rip + 0x7be4e6] ; 0x100aace60
0x1002ee97a: vmovups xmmword ptr [rax], xmm0
0x1002ee97e: mov byte ptr [rax + 0x10], 0
0x1002ee982: mov byte ptr [rax + 0x11], 1
0x1002ee986: mov byte ptr [rax + 0x12], 0
0x1002ee98a: mov dword ptr [rax + 0x14], 0
0x1002ee991: mov dword ptr [rax + 0x18], 0
0x1002ee998: vxorps xmm0, xmm0, xmm0
0x1002ee99c: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ee9a1: mov dword ptr [rax + 0x28], 0
0x1002ee9a8: vmovaps xmm0, xmmword ptr [rip + 0x7cad00] ; 0x100ab96b0
0x1002ee9b0: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ee9b5: mov byte ptr [rax + 0x40], 0
0x1002ee9b9: vxorps ymm0, ymm0, ymm0
0x1002ee9bd: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ee9c5: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ee9ca: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ee9cf: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ee9d9: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ee9e3: vmovaps xmm0, xmmword ptr [rbx]
0x1002ee9e7: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ee9ef: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ee9f7: vxorps xmm0, xmm0, xmm0
0x1002ee9fb: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002eea03: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002eea0d: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002eea15: mov dword ptr [rax + 0xf4], 0
0x1002eea1f: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002eea29: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002eea31: mov dword ptr [rax + 0x10c], 0
0x1002eea3b: mov dword ptr [rax + 0x110], 0x3f800000
0x1002eea45: mov byte ptr [rax + 0x114], 1
0x1002eea4c: mov dword ptr [rax + 0x118], 0
0x1002eea56: mov dword ptr [rax + 0x11c], 0
0x1002eea60: mov qword ptr [rip + 0x1b01209], rax ; 0x101defc70
0x1002eea67: mov rdi, r12
0x1002eea6a: mov rsi, rax
0x1002eea6d: mov rdx, r13
0x1002eea70: vzeroupper 
0x1002eea73: call 0x100314920 ; 0x100314920
0x1002eea78: lea rsi, [rip + 0x8918ad] ; 0x100b8032c soulCharge
0x1002eea7f: mov edx, 0x40
0x1002eea84: mov rdi, r13
0x1002eea87: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002eea8c: movsx edi, byte ptr [rbp - 0x70]
0x1002eea90: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002eea95: mov byte ptr [rbp - 0x70], al
0x1002eea98: mov rdx, qword ptr [rip + 0x1b00bc9] ; 0x101def668
0x1002eea9f: mov esi, 0x120
0x1002eeaa4: mov ecx, 0x10
0x1002eeaa9: mov rdi, r15
0x1002eeaac: call 0x100795530 ; 0x100795530
0x1002eeab1: vmovaps xmm0, xmmword ptr [rip + 0x7be3a7] ; 0x100aace60
0x1002eeab9: vmovups xmmword ptr [rax], xmm0
0x1002eeabd: mov byte ptr [rax + 0x10], 0
0x1002eeac1: mov byte ptr [rax + 0x11], 1
0x1002eeac5: mov byte ptr [rax + 0x12], 0
0x1002eeac9: mov dword ptr [rax + 0x14], 0
0x1002eead0: mov dword ptr [rax + 0x18], 0
0x1002eead7: vxorps xmm0, xmm0, xmm0
0x1002eeadb: vmovlps qword ptr [rax + 0x20], xmm0
0x1002eeae0: mov dword ptr [rax + 0x28], 0
0x1002eeae7: vmovaps xmm0, xmmword ptr [rip + 0x7cabc1] ; 0x100ab96b0
0x1002eeaef: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002eeaf4: mov byte ptr [rax + 0x40], 0
0x1002eeaf8: vxorps ymm0, ymm0, ymm0
0x1002eeafc: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002eeb04: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002eeb09: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002eeb0e: mov dword ptr [rax + 0xa4], 0x40600000
0x1002eeb18: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002eeb22: vmovaps xmm0, xmmword ptr [rbx]
0x1002eeb26: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002eeb2e: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002eeb36: vxorps xmm0, xmm0, xmm0
0x1002eeb3a: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002eeb42: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002eeb4c: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002eeb54: mov dword ptr [rax + 0xf4], 0
0x1002eeb5e: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002eeb68: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002eeb70: mov dword ptr [rax + 0x10c], 0
0x1002eeb7a: mov dword ptr [rax + 0x110], 0x3f800000
0x1002eeb84: mov byte ptr [rax + 0x114], 1
0x1002eeb8b: mov dword ptr [rax + 0x118], 0
0x1002eeb95: mov dword ptr [rax + 0x11c], 0
0x1002eeb9f: mov qword ptr [rip + 0x1b010d2], rax ; 0x101defc78
0x1002eeba6: mov rdi, r12
0x1002eeba9: mov rsi, rax
0x1002eebac: mov rdx, r13
0x1002eebaf: vzeroupper 
0x1002eebb2: call 0x100314920 ; 0x100314920
0x1002eebb7: lea rsi, [rip + 0x891779] ; 0x100b80337 soulPortal
0x1002eebbe: mov edx, 0x40
0x1002eebc3: mov rdi, r13
0x1002eebc6: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002eebcb: movsx edi, byte ptr [rbp - 0x70]
0x1002eebcf: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002eebd4: mov byte ptr [rbp - 0x70], al
0x1002eebd7: mov rdx, qword ptr [rip + 0x1b00a8a] ; 0x101def668
0x1002eebde: mov esi, 0x120
0x1002eebe3: mov ecx, 0x10
0x1002eebe8: mov rdi, r15
0x1002eebeb: call 0x100795530 ; 0x100795530
0x1002eebf0: vmovaps xmm0, xmmword ptr [rip + 0x7be268] ; 0x100aace60
0x1002eebf8: vmovups xmmword ptr [rax], xmm0
0x1002eebfc: mov byte ptr [rax + 0x10], 0
0x1002eec00: mov byte ptr [rax + 0x11], 1
0x1002eec04: mov byte ptr [rax + 0x12], 0
0x1002eec08: mov dword ptr [rax + 0x14], 0
0x1002eec0f: mov dword ptr [rax + 0x18], 0
0x1002eec16: vxorps xmm0, xmm0, xmm0
0x1002eec1a: vmovlps qword ptr [rax + 0x20], xmm0
0x1002eec1f: mov dword ptr [rax + 0x28], 0
0x1002eec26: vmovaps xmm0, xmmword ptr [rip + 0x7caa82] ; 0x100ab96b0
0x1002eec2e: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002eec33: mov byte ptr [rax + 0x40], 0
0x1002eec37: vxorps ymm0, ymm0, ymm0
0x1002eec3b: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002eec43: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002eec48: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002eec4d: mov dword ptr [rax + 0xa4], 0x40600000
0x1002eec57: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002eec61: vmovaps xmm0, xmmword ptr [rbx]
0x1002eec65: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002eec6d: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002eec75: vxorps xmm0, xmm0, xmm0
0x1002eec79: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002eec81: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002eec8b: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002eec93: mov dword ptr [rax + 0xf4], 0
0x1002eec9d: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002eeca7: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002eecaf: mov dword ptr [rax + 0x10c], 0
0x1002eecb9: mov dword ptr [rax + 0x110], 0x3f800000
0x1002eecc3: mov byte ptr [rax + 0x114], 1
0x1002eecca: mov dword ptr [rax + 0x118], 0
0x1002eecd4: mov dword ptr [rax + 0x11c], 0
0x1002eecde: mov qword ptr [rip + 0x1b00f9b], rax ; 0x101defc80
0x1002eece5: mov rdi, r12
0x1002eece8: mov rsi, rax
0x1002eeceb: mov rdx, r13
0x1002eecee: vzeroupper 
0x1002eecf1: call 0x100314920 ; 0x100314920
0x1002eecf6: lea rsi, [rip + 0x891645] ; 0x100b80342 soulSpin
0x1002eecfd: mov edx, 0x40
0x1002eed02: mov rdi, r13
0x1002eed05: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002eed0a: movsx edi, byte ptr [rbp - 0x70]
0x1002eed0e: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002eed13: mov byte ptr [rbp - 0x70], al
0x1002eed16: mov rdx, qword ptr [rip + 0x1b0094b] ; 0x101def668
0x1002eed1d: mov esi, 0x120
0x1002eed22: mov ecx, 0x10
0x1002eed27: mov rdi, r15
0x1002eed2a: call 0x100795530 ; 0x100795530
0x1002eed2f: vmovaps xmm0, xmmword ptr [rip + 0x7be129] ; 0x100aace60
0x1002eed37: vmovups xmmword ptr [rax], xmm0
0x1002eed3b: mov byte ptr [rax + 0x10], 0
0x1002eed3f: mov byte ptr [rax + 0x11], 1
0x1002eed43: mov byte ptr [rax + 0x12], 0
0x1002eed47: mov dword ptr [rax + 0x14], 0
0x1002eed4e: mov dword ptr [rax + 0x18], 0
0x1002eed55: vxorps xmm0, xmm0, xmm0
0x1002eed59: vmovlps qword ptr [rax + 0x20], xmm0
0x1002eed5e: mov dword ptr [rax + 0x28], 0
0x1002eed65: vmovaps xmm0, xmmword ptr [rip + 0x7ca943] ; 0x100ab96b0
0x1002eed6d: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002eed72: mov byte ptr [rax + 0x40], 0
0x1002eed76: vxorps ymm0, ymm0, ymm0
0x1002eed7a: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002eed82: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002eed87: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002eed8c: mov dword ptr [rax + 0xa4], 0x40600000
0x1002eed96: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002eeda0: vmovaps xmm0, xmmword ptr [rbx]
0x1002eeda4: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002eedac: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002eedb4: vxorps xmm0, xmm0, xmm0
0x1002eedb8: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002eedc0: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002eedca: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002eedd2: mov dword ptr [rax + 0xf4], 0
0x1002eeddc: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002eede6: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002eedee: mov dword ptr [rax + 0x10c], 0
0x1002eedf8: mov dword ptr [rax + 0x110], 0x3f800000
0x1002eee02: mov byte ptr [rax + 0x114], 1
0x1002eee09: mov dword ptr [rax + 0x118], 0
0x1002eee13: mov dword ptr [rax + 0x11c], 0
0x1002eee1d: mov qword ptr [rip + 0x1b00e64], rax ; 0x101defc88
0x1002eee24: mov rdi, r12
0x1002eee27: mov rsi, rax
0x1002eee2a: mov rdx, r13
0x1002eee2d: vzeroupper 
0x1002eee30: call 0x100314920 ; 0x100314920
0x1002eee35: lea rsi, [rip + 0x89150f] ; 0x100b8034b mistyBackground
0x1002eee3c: mov edx, 0x40
0x1002eee41: mov rdi, r13
0x1002eee44: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002eee49: movsx edi, byte ptr [rbp - 0x70]
0x1002eee4d: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002eee52: mov byte ptr [rbp - 0x70], al
0x1002eee55: mov rdx, qword ptr [rip + 0x1b0080c] ; 0x101def668
0x1002eee5c: mov esi, 0x120
0x1002eee61: mov ecx, 0x10
0x1002eee66: mov rdi, r15
0x1002eee69: call 0x100795530 ; 0x100795530
0x1002eee6e: vmovaps xmm0, xmmword ptr [rip + 0x7bdfea] ; 0x100aace60
0x1002eee76: vmovups xmmword ptr [rax], xmm0
0x1002eee7a: mov byte ptr [rax + 0x10], 0
0x1002eee7e: mov byte ptr [rax + 0x11], 1
0x1002eee82: mov byte ptr [rax + 0x12], 0
0x1002eee86: mov dword ptr [rax + 0x14], 0
0x1002eee8d: mov dword ptr [rax + 0x18], 0
0x1002eee94: vxorps xmm0, xmm0, xmm0
0x1002eee98: vmovlps qword ptr [rax + 0x20], xmm0
0x1002eee9d: mov dword ptr [rax + 0x28], 0
0x1002eeea4: vmovaps xmm0, xmmword ptr [rip + 0x7ca804] ; 0x100ab96b0
0x1002eeeac: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002eeeb1: mov byte ptr [rax + 0x40], 0
0x1002eeeb5: vxorps ymm0, ymm0, ymm0
0x1002eeeb9: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002eeec1: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002eeec6: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002eeecb: mov dword ptr [rax + 0xa4], 0x40600000
0x1002eeed5: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002eeedf: vmovaps xmm0, xmmword ptr [rbx]
0x1002eeee3: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002eeeeb: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002eeef3: vxorps xmm0, xmm0, xmm0
0x1002eeef7: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002eeeff: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002eef09: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002eef11: mov dword ptr [rax + 0xf4], 0
0x1002eef1b: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002eef25: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002eef2d: mov dword ptr [rax + 0x10c], 0
0x1002eef37: mov dword ptr [rax + 0x110], 0x3f800000
0x1002eef41: mov byte ptr [rax + 0x114], 1
0x1002eef48: mov dword ptr [rax + 0x118], 0
0x1002eef52: mov dword ptr [rax + 0x11c], 0
0x1002eef5c: mov qword ptr [rip + 0x1b00d2d], rax ; 0x101defc90
0x1002eef63: mov rdi, r12
0x1002eef66: mov rsi, rax
0x1002eef69: mov rdx, r13
0x1002eef6c: vzeroupper 
0x1002eef6f: call 0x100314920 ; 0x100314920
0x1002eef74: lea rsi, [rip + 0x8913e0] ; 0x100b8035b streamSparks
0x1002eef7b: mov edx, 0x40
0x1002eef80: mov rdi, r13
0x1002eef83: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002eef88: movsx edi, byte ptr [rbp - 0x70]
0x1002eef8c: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002eef91: mov byte ptr [rbp - 0x70], al
0x1002eef94: mov rdx, qword ptr [rip + 0x1b006cd] ; 0x101def668
0x1002eef9b: mov esi, 0x120
0x1002eefa0: mov ecx, 0x10
0x1002eefa5: mov rdi, r15
0x1002eefa8: call 0x100795530 ; 0x100795530
0x1002eefad: vmovaps xmm0, xmmword ptr [rip + 0x7bdeab] ; 0x100aace60
0x1002eefb5: vmovups xmmword ptr [rax], xmm0
0x1002eefb9: mov byte ptr [rax + 0x10], 0
0x1002eefbd: mov byte ptr [rax + 0x11], 1
0x1002eefc1: mov byte ptr [rax + 0x12], 0
0x1002eefc5: mov dword ptr [rax + 0x14], 0
0x1002eefcc: mov dword ptr [rax + 0x18], 0
0x1002eefd3: vxorps xmm0, xmm0, xmm0
0x1002eefd7: vmovlps qword ptr [rax + 0x20], xmm0
0x1002eefdc: mov dword ptr [rax + 0x28], 0
0x1002eefe3: vmovaps xmm0, xmmword ptr [rip + 0x7ca6c5] ; 0x100ab96b0
0x1002eefeb: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002eeff0: mov byte ptr [rax + 0x40], 0
0x1002eeff4: vxorps ymm0, ymm0, ymm0
0x1002eeff8: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ef000: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ef005: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ef00a: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ef014: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ef01e: vmovaps xmm0, xmmword ptr [rbx]
0x1002ef022: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ef02a: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ef032: vxorps xmm0, xmm0, xmm0
0x1002ef036: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ef03e: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ef048: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ef050: mov dword ptr [rax + 0xf4], 0
0x1002ef05a: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ef064: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ef06c: mov dword ptr [rax + 0x10c], 0
0x1002ef076: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ef080: mov byte ptr [rax + 0x114], 1
0x1002ef087: mov dword ptr [rax + 0x118], 0
0x1002ef091: mov dword ptr [rax + 0x11c], 0
0x1002ef09b: mov qword ptr [rip + 0x1b00bf6], rax ; 0x101defc98
0x1002ef0a2: mov rdi, r12
0x1002ef0a5: mov rsi, rax
0x1002ef0a8: mov rdx, r13
0x1002ef0ab: vzeroupper 
0x1002ef0ae: call 0x100314920 ; 0x100314920
0x1002ef0b3: lea rsi, [rip + 0x8912ae] ; 0x100b80368 streamBurst
0x1002ef0ba: mov edx, 0x40
0x1002ef0bf: mov rdi, r13
0x1002ef0c2: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ef0c7: movsx edi, byte ptr [rbp - 0x70]
0x1002ef0cb: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ef0d0: mov byte ptr [rbp - 0x70], al
0x1002ef0d3: mov rdx, qword ptr [rip + 0x1b0058e] ; 0x101def668
0x1002ef0da: mov esi, 0x120
0x1002ef0df: mov ecx, 0x10
0x1002ef0e4: mov rdi, r15
0x1002ef0e7: call 0x100795530 ; 0x100795530
0x1002ef0ec: vmovaps xmm0, xmmword ptr [rip + 0x7bdd6c] ; 0x100aace60
0x1002ef0f4: vmovups xmmword ptr [rax], xmm0
0x1002ef0f8: mov byte ptr [rax + 0x10], 0
0x1002ef0fc: mov byte ptr [rax + 0x11], 1
0x1002ef100: mov byte ptr [rax + 0x12], 0
0x1002ef104: mov dword ptr [rax + 0x14], 0
0x1002ef10b: mov dword ptr [rax + 0x18], 0
0x1002ef112: vxorps xmm0, xmm0, xmm0
0x1002ef116: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ef11b: mov dword ptr [rax + 0x28], 0
0x1002ef122: vmovaps xmm0, xmmword ptr [rip + 0x7ca586] ; 0x100ab96b0
0x1002ef12a: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ef12f: mov byte ptr [rax + 0x40], 0
0x1002ef133: vxorps ymm0, ymm0, ymm0
0x1002ef137: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ef13f: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ef144: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ef149: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ef153: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ef15d: vmovaps xmm0, xmmword ptr [rbx]
0x1002ef161: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ef169: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ef171: vxorps xmm0, xmm0, xmm0
0x1002ef175: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ef17d: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ef187: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ef18f: mov dword ptr [rax + 0xf4], 0
0x1002ef199: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ef1a3: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ef1ab: mov dword ptr [rax + 0x10c], 0
0x1002ef1b5: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ef1bf: mov byte ptr [rax + 0x114], 1
0x1002ef1c6: mov dword ptr [rax + 0x118], 0
0x1002ef1d0: mov dword ptr [rax + 0x11c], 0
0x1002ef1da: mov qword ptr [rip + 0x1b00abf], rax ; 0x101defca0
0x1002ef1e1: mov rdi, r12
0x1002ef1e4: mov rsi, rax
0x1002ef1e7: mov rdx, r13
0x1002ef1ea: vzeroupper 
0x1002ef1ed: call 0x100314920 ; 0x100314920
0x1002ef1f2: lea rsi, [rip + 0x89117b] ; 0x100b80374 caveDustFall
0x1002ef1f9: mov edx, 0x40
0x1002ef1fe: mov rdi, r13
0x1002ef201: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ef206: movsx edi, byte ptr [rbp - 0x70]
0x1002ef20a: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ef20f: mov byte ptr [rbp - 0x70], al
0x1002ef212: mov rdx, qword ptr [rip + 0x1b0044f] ; 0x101def668
0x1002ef219: mov esi, 0x120
0x1002ef21e: mov ecx, 0x10
0x1002ef223: mov rdi, r15
0x1002ef226: call 0x100795530 ; 0x100795530
0x1002ef22b: vmovaps xmm0, xmmword ptr [rip + 0x7bdc2d] ; 0x100aace60
0x1002ef233: vmovups xmmword ptr [rax], xmm0
0x1002ef237: mov byte ptr [rax + 0x10], 0
0x1002ef23b: mov byte ptr [rax + 0x11], 1
0x1002ef23f: mov byte ptr [rax + 0x12], 0
0x1002ef243: mov dword ptr [rax + 0x14], 0
0x1002ef24a: mov dword ptr [rax + 0x18], 0
0x1002ef251: vxorps xmm0, xmm0, xmm0
0x1002ef255: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ef25a: mov dword ptr [rax + 0x28], 0
0x1002ef261: vmovaps xmm0, xmmword ptr [rip + 0x7ca447] ; 0x100ab96b0
0x1002ef269: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ef26e: mov byte ptr [rax + 0x40], 0
0x1002ef272: vxorps ymm0, ymm0, ymm0
0x1002ef276: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ef27e: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ef283: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ef288: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ef292: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ef29c: vmovaps xmm0, xmmword ptr [rbx]
0x1002ef2a0: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ef2a8: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ef2b0: vxorps xmm0, xmm0, xmm0
0x1002ef2b4: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ef2bc: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ef2c6: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ef2ce: mov dword ptr [rax + 0xf4], 0
0x1002ef2d8: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ef2e2: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ef2ea: mov dword ptr [rax + 0x10c], 0
0x1002ef2f4: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ef2fe: mov byte ptr [rax + 0x114], 1
0x1002ef305: mov dword ptr [rax + 0x118], 0
0x1002ef30f: mov dword ptr [rax + 0x11c], 0
0x1002ef319: mov qword ptr [rip + 0x1b00988], rax ; 0x101defca8
0x1002ef320: mov rdi, r12
0x1002ef323: mov rsi, rax
0x1002ef326: mov rdx, r13
0x1002ef329: vzeroupper 
0x1002ef32c: call 0x100314920 ; 0x100314920
0x1002ef331: lea rsi, [rip + 0x891049] ; 0x100b80381 tornadoDebris
0x1002ef338: mov edx, 0x40
0x1002ef33d: mov rdi, r13
0x1002ef340: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ef345: movsx edi, byte ptr [rbp - 0x70]
0x1002ef349: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ef34e: mov byte ptr [rbp - 0x70], al
0x1002ef351: mov rdx, qword ptr [rip + 0x1b00310] ; 0x101def668
0x1002ef358: mov esi, 0x120
0x1002ef35d: mov ecx, 0x10
0x1002ef362: mov rdi, r15
0x1002ef365: call 0x100795530 ; 0x100795530
0x1002ef36a: vmovaps xmm0, xmmword ptr [rip + 0x7bdaee] ; 0x100aace60
0x1002ef372: vmovups xmmword ptr [rax], xmm0
0x1002ef376: mov byte ptr [rax + 0x10], 0
0x1002ef37a: mov byte ptr [rax + 0x11], 1
0x1002ef37e: mov byte ptr [rax + 0x12], 0
0x1002ef382: mov dword ptr [rax + 0x14], 0
0x1002ef389: mov dword ptr [rax + 0x18], 0
0x1002ef390: vxorps xmm0, xmm0, xmm0
0x1002ef394: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ef399: mov dword ptr [rax + 0x28], 0
0x1002ef3a0: vmovaps xmm0, xmmword ptr [rip + 0x7ca308] ; 0x100ab96b0
0x1002ef3a8: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ef3ad: mov byte ptr [rax + 0x40], 0
0x1002ef3b1: vxorps ymm0, ymm0, ymm0
0x1002ef3b5: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ef3bd: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ef3c2: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ef3c7: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ef3d1: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ef3db: vmovaps xmm0, xmmword ptr [rbx]
0x1002ef3df: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ef3e7: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ef3ef: vxorps xmm0, xmm0, xmm0
0x1002ef3f3: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ef3fb: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ef405: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ef40d: mov dword ptr [rax + 0xf4], 0
0x1002ef417: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ef421: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ef429: mov dword ptr [rax + 0x10c], 0
0x1002ef433: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ef43d: mov byte ptr [rax + 0x114], 1
0x1002ef444: mov dword ptr [rax + 0x118], 0
0x1002ef44e: mov dword ptr [rax + 0x11c], 0
0x1002ef458: mov qword ptr [rip + 0x1b00851], rax ; 0x101defcb0
0x1002ef45f: mov rdi, r12
0x1002ef462: mov rsi, rax
0x1002ef465: mov rdx, r13
0x1002ef468: vzeroupper 
0x1002ef46b: call 0x100314920 ; 0x100314920
0x1002ef470: lea rsi, [rip + 0x890f18] ; 0x100b8038f tornadoDust
0x1002ef477: mov edx, 0x40
0x1002ef47c: mov rdi, r13
0x1002ef47f: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ef484: movsx edi, byte ptr [rbp - 0x70]
0x1002ef488: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ef48d: mov byte ptr [rbp - 0x70], al
0x1002ef490: mov rdx, qword ptr [rip + 0x1b001d1] ; 0x101def668
0x1002ef497: mov esi, 0x120
0x1002ef49c: mov ecx, 0x10
0x1002ef4a1: mov rdi, r15
0x1002ef4a4: call 0x100795530 ; 0x100795530
0x1002ef4a9: vmovaps xmm0, xmmword ptr [rip + 0x7bd9af] ; 0x100aace60
0x1002ef4b1: vmovups xmmword ptr [rax], xmm0
0x1002ef4b5: mov byte ptr [rax + 0x10], 0
0x1002ef4b9: mov byte ptr [rax + 0x11], 1
0x1002ef4bd: mov byte ptr [rax + 0x12], 0
0x1002ef4c1: mov dword ptr [rax + 0x14], 0
0x1002ef4c8: mov dword ptr [rax + 0x18], 0
0x1002ef4cf: vxorps xmm0, xmm0, xmm0
0x1002ef4d3: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ef4d8: mov dword ptr [rax + 0x28], 0
0x1002ef4df: vmovaps xmm0, xmmword ptr [rip + 0x7ca1c9] ; 0x100ab96b0
0x1002ef4e7: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ef4ec: mov byte ptr [rax + 0x40], 0
0x1002ef4f0: vxorps ymm0, ymm0, ymm0
0x1002ef4f4: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ef4fc: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ef501: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ef506: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ef510: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ef51a: vmovaps xmm0, xmmword ptr [rbx]
0x1002ef51e: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ef526: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ef52e: vxorps xmm0, xmm0, xmm0
0x1002ef532: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ef53a: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ef544: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ef54c: mov dword ptr [rax + 0xf4], 0
0x1002ef556: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ef560: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ef568: mov dword ptr [rax + 0x10c], 0
0x1002ef572: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ef57c: mov byte ptr [rax + 0x114], 1
0x1002ef583: mov dword ptr [rax + 0x118], 0
0x1002ef58d: mov dword ptr [rax + 0x11c], 0
0x1002ef597: mov qword ptr [rip + 0x1b0071a], rax ; 0x101defcb8
0x1002ef59e: mov rdi, r12
0x1002ef5a1: mov rsi, rax
0x1002ef5a4: mov rdx, r13
0x1002ef5a7: vzeroupper 
0x1002ef5aa: call 0x100314920 ; 0x100314920
0x1002ef5af: lea rsi, [rip + 0x890de5] ; 0x100b8039b stormDebris
0x1002ef5b6: mov edx, 0x40
0x1002ef5bb: mov rdi, r13
0x1002ef5be: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ef5c3: movsx edi, byte ptr [rbp - 0x70]
0x1002ef5c7: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ef5cc: mov byte ptr [rbp - 0x70], al
0x1002ef5cf: mov rdx, qword ptr [rip + 0x1b00092] ; 0x101def668
0x1002ef5d6: mov esi, 0x120
0x1002ef5db: mov ecx, 0x10
0x1002ef5e0: mov rdi, r15
0x1002ef5e3: call 0x100795530 ; 0x100795530
0x1002ef5e8: vmovaps xmm0, xmmword ptr [rip + 0x7bd870] ; 0x100aace60
0x1002ef5f0: vmovups xmmword ptr [rax], xmm0
0x1002ef5f4: mov byte ptr [rax + 0x10], 0
0x1002ef5f8: mov byte ptr [rax + 0x11], 1
0x1002ef5fc: mov byte ptr [rax + 0x12], 0
0x1002ef600: mov dword ptr [rax + 0x14], 0
0x1002ef607: mov dword ptr [rax + 0x18], 0
0x1002ef60e: vxorps xmm0, xmm0, xmm0
0x1002ef612: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ef617: mov dword ptr [rax + 0x28], 0
0x1002ef61e: vmovaps xmm0, xmmword ptr [rip + 0x7ca08a] ; 0x100ab96b0
0x1002ef626: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ef62b: mov byte ptr [rax + 0x40], 0
0x1002ef62f: vxorps ymm0, ymm0, ymm0
0x1002ef633: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ef63b: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ef640: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ef645: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ef64f: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ef659: vmovaps xmm0, xmmword ptr [rbx]
0x1002ef65d: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ef665: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ef66d: vxorps xmm0, xmm0, xmm0
0x1002ef671: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ef679: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ef683: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ef68b: mov dword ptr [rax + 0xf4], 0
0x1002ef695: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ef69f: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ef6a7: mov dword ptr [rax + 0x10c], 0
0x1002ef6b1: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ef6bb: mov byte ptr [rax + 0x114], 1
0x1002ef6c2: mov dword ptr [rax + 0x118], 0
0x1002ef6cc: mov dword ptr [rax + 0x11c], 0
0x1002ef6d6: mov qword ptr [rip + 0x1b005e3], rax ; 0x101defcc0
0x1002ef6dd: mov rdi, r12
0x1002ef6e0: mov rsi, rax
0x1002ef6e3: mov rdx, r13
0x1002ef6e6: vzeroupper 
0x1002ef6e9: call 0x100314920 ; 0x100314920
0x1002ef6ee: lea rsi, [rip + 0x890cb2] ; 0x100b803a7 flightRune
0x1002ef6f5: mov edx, 0x40
0x1002ef6fa: mov rdi, r13
0x1002ef6fd: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ef702: movsx edi, byte ptr [rbp - 0x70]
0x1002ef706: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ef70b: mov byte ptr [rbp - 0x70], al
0x1002ef70e: mov rdx, qword ptr [rip + 0x1afff53] ; 0x101def668
0x1002ef715: mov esi, 0x120
0x1002ef71a: mov ecx, 0x10
0x1002ef71f: mov rdi, r15
0x1002ef722: call 0x100795530 ; 0x100795530
0x1002ef727: vmovaps xmm0, xmmword ptr [rip + 0x7bd731] ; 0x100aace60
0x1002ef72f: vmovups xmmword ptr [rax], xmm0
0x1002ef733: mov byte ptr [rax + 0x10], 0
0x1002ef737: mov byte ptr [rax + 0x11], 1
0x1002ef73b: mov byte ptr [rax + 0x12], 0
0x1002ef73f: mov dword ptr [rax + 0x14], 0
0x1002ef746: mov dword ptr [rax + 0x18], 0
0x1002ef74d: vxorps xmm0, xmm0, xmm0
0x1002ef751: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ef756: mov dword ptr [rax + 0x28], 0
0x1002ef75d: vmovaps xmm0, xmmword ptr [rip + 0x7c9f4b] ; 0x100ab96b0
0x1002ef765: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ef76a: mov byte ptr [rax + 0x40], 0
0x1002ef76e: vxorps ymm0, ymm0, ymm0
0x1002ef772: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ef77a: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ef77f: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ef784: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ef78e: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ef798: vmovaps xmm0, xmmword ptr [rbx]
0x1002ef79c: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ef7a4: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ef7ac: vxorps xmm0, xmm0, xmm0
0x1002ef7b0: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ef7b8: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ef7c2: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ef7ca: mov dword ptr [rax + 0xf4], 0
0x1002ef7d4: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ef7de: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ef7e6: mov dword ptr [rax + 0x10c], 0
0x1002ef7f0: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ef7fa: mov byte ptr [rax + 0x114], 1
0x1002ef801: mov dword ptr [rax + 0x118], 0
0x1002ef80b: mov dword ptr [rax + 0x11c], 0
0x1002ef815: mov qword ptr [rip + 0x1b004ac], rax ; 0x101defcc8
0x1002ef81c: mov rdi, r12
0x1002ef81f: mov rsi, rax
0x1002ef822: mov rdx, r13
0x1002ef825: vzeroupper 
0x1002ef828: call 0x100314920 ; 0x100314920
0x1002ef82d: lea rsi, [rip + 0x890b7e] ; 0x100b803b2 cloudTrail
0x1002ef834: mov edx, 0x40
0x1002ef839: mov rdi, r13
0x1002ef83c: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ef841: movsx edi, byte ptr [rbp - 0x70]
0x1002ef845: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ef84a: mov byte ptr [rbp - 0x70], al
0x1002ef84d: mov rdx, qword ptr [rip + 0x1affe14] ; 0x101def668
0x1002ef854: mov esi, 0x120
0x1002ef859: mov ecx, 0x10
0x1002ef85e: mov rdi, r15
0x1002ef861: call 0x100795530 ; 0x100795530
0x1002ef866: vmovaps xmm0, xmmword ptr [rip + 0x7bd5f2] ; 0x100aace60
0x1002ef86e: vmovups xmmword ptr [rax], xmm0
0x1002ef872: mov byte ptr [rax + 0x10], 0
0x1002ef876: mov byte ptr [rax + 0x11], 1
0x1002ef87a: mov byte ptr [rax + 0x12], 0
0x1002ef87e: mov dword ptr [rax + 0x14], 0
0x1002ef885: mov dword ptr [rax + 0x18], 0
0x1002ef88c: vxorps xmm0, xmm0, xmm0
0x1002ef890: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ef895: mov dword ptr [rax + 0x28], 0
0x1002ef89c: vmovaps xmm0, xmmword ptr [rip + 0x7c9e0c] ; 0x100ab96b0
0x1002ef8a4: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ef8a9: mov byte ptr [rax + 0x40], 0
0x1002ef8ad: vxorps ymm0, ymm0, ymm0
0x1002ef8b1: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ef8b9: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ef8be: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002ef8c3: mov dword ptr [rax + 0xa4], 0x40600000
0x1002ef8cd: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002ef8d7: vmovaps xmm0, xmmword ptr [rbx]
0x1002ef8db: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002ef8e3: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002ef8eb: vxorps xmm0, xmm0, xmm0
0x1002ef8ef: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002ef8f7: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002ef901: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002ef909: mov dword ptr [rax + 0xf4], 0
0x1002ef913: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002ef91d: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002ef925: mov dword ptr [rax + 0x10c], 0
0x1002ef92f: mov dword ptr [rax + 0x110], 0x3f800000
0x1002ef939: mov byte ptr [rax + 0x114], 1
0x1002ef940: mov dword ptr [rax + 0x118], 0
0x1002ef94a: mov dword ptr [rax + 0x11c], 0
0x1002ef954: mov qword ptr [rip + 0x1b00375], rax ; 0x101defcd0
0x1002ef95b: mov rdi, r12
0x1002ef95e: mov rsi, rax
0x1002ef961: mov rdx, r13
0x1002ef964: vzeroupper 
0x1002ef967: call 0x100314920 ; 0x100314920
0x1002ef96c: lea rsi, [rip + 0x890a4a] ; 0x100b803bd cloudSpray
0x1002ef973: mov edx, 0x40
0x1002ef978: mov rdi, r13
0x1002ef97b: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002ef980: movsx edi, byte ptr [rbp - 0x70]
0x1002ef984: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002ef989: mov byte ptr [rbp - 0x70], al
0x1002ef98c: mov rdx, qword ptr [rip + 0x1affcd5] ; 0x101def668
0x1002ef993: mov esi, 0x120
0x1002ef998: mov ecx, 0x10
0x1002ef99d: mov rdi, r15
0x1002ef9a0: call 0x100795530 ; 0x100795530
0x1002ef9a5: vmovaps xmm0, xmmword ptr [rip + 0x7bd4b3] ; 0x100aace60
0x1002ef9ad: vmovups xmmword ptr [rax], xmm0
0x1002ef9b1: mov byte ptr [rax + 0x10], 0
0x1002ef9b5: mov byte ptr [rax + 0x11], 1
0x1002ef9b9: mov byte ptr [rax + 0x12], 0
0x1002ef9bd: mov dword ptr [rax + 0x14], 0
0x1002ef9c4: mov dword ptr [rax + 0x18], 0
0x1002ef9cb: vxorps xmm0, xmm0, xmm0
0x1002ef9cf: vmovlps qword ptr [rax + 0x20], xmm0
0x1002ef9d4: mov dword ptr [rax + 0x28], 0
0x1002ef9db: vmovaps xmm0, xmmword ptr [rip + 0x7c9ccd] ; 0x100ab96b0
0x1002ef9e3: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002ef9e8: mov byte ptr [rax + 0x40], 0
0x1002ef9ec: vxorps ymm0, ymm0, ymm0
0x1002ef9f0: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002ef9f8: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002ef9fd: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002efa02: mov dword ptr [rax + 0xa4], 0x40600000
0x1002efa0c: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002efa16: vmovaps xmm0, xmmword ptr [rbx]
0x1002efa1a: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002efa22: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002efa2a: vxorps xmm0, xmm0, xmm0
0x1002efa2e: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002efa36: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002efa40: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002efa48: mov dword ptr [rax + 0xf4], 0
0x1002efa52: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002efa5c: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002efa64: mov dword ptr [rax + 0x10c], 0
0x1002efa6e: mov dword ptr [rax + 0x110], 0x3f800000
0x1002efa78: mov byte ptr [rax + 0x114], 1
0x1002efa7f: mov dword ptr [rax + 0x118], 0
0x1002efa89: mov dword ptr [rax + 0x11c], 0
0x1002efa93: mov qword ptr [rip + 0x1b0023e], rax ; 0x101defcd8
0x1002efa9a: mov rdi, r12
0x1002efa9d: mov rsi, rax
0x1002efaa0: mov rdx, r13
0x1002efaa3: vzeroupper 
0x1002efaa6: call 0x100314920 ; 0x100314920
0x1002efaab: lea rsi, [rip + 0x890916] ; 0x100b803c8 cloudRoll
0x1002efab2: mov edx, 0x40
0x1002efab7: mov rdi, r13
0x1002efaba: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002efabf: movsx edi, byte ptr [rbp - 0x70]
0x1002efac3: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002efac8: mov byte ptr [rbp - 0x70], al
0x1002efacb: mov rdx, qword ptr [rip + 0x1affb96] ; 0x101def668
0x1002efad2: mov esi, 0x120
0x1002efad7: mov ecx, 0x10
0x1002efadc: mov rdi, r15
0x1002efadf: call 0x100795530 ; 0x100795530
0x1002efae4: vmovaps xmm0, xmmword ptr [rip + 0x7bd374] ; 0x100aace60
0x1002efaec: vmovups xmmword ptr [rax], xmm0
0x1002efaf0: mov byte ptr [rax + 0x10], 0
0x1002efaf4: mov byte ptr [rax + 0x11], 1
0x1002efaf8: mov byte ptr [rax + 0x12], 0
0x1002efafc: mov dword ptr [rax + 0x14], 0
0x1002efb03: mov dword ptr [rax + 0x18], 0
0x1002efb0a: vxorps xmm0, xmm0, xmm0
0x1002efb0e: vmovlps qword ptr [rax + 0x20], xmm0
0x1002efb13: mov dword ptr [rax + 0x28], 0
0x1002efb1a: vmovaps xmm0, xmmword ptr [rip + 0x7c9b8e] ; 0x100ab96b0
0x1002efb22: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002efb27: mov byte ptr [rax + 0x40], 0
0x1002efb2b: vxorps ymm0, ymm0, ymm0
0x1002efb2f: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002efb37: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002efb3c: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002efb41: mov dword ptr [rax + 0xa4], 0x40600000
0x1002efb4b: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002efb55: vmovaps xmm0, xmmword ptr [rbx]
0x1002efb59: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002efb61: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002efb69: vxorps xmm0, xmm0, xmm0
0x1002efb6d: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002efb75: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002efb7f: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002efb87: mov dword ptr [rax + 0xf4], 0
0x1002efb91: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002efb9b: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002efba3: mov dword ptr [rax + 0x10c], 0
0x1002efbad: mov dword ptr [rax + 0x110], 0x3f800000
0x1002efbb7: mov byte ptr [rax + 0x114], 1
0x1002efbbe: mov dword ptr [rax + 0x118], 0
0x1002efbc8: mov dword ptr [rax + 0x11c], 0
0x1002efbd2: mov qword ptr [rip + 0x1b00107], rax ; 0x101defce0
0x1002efbd9: mov rdi, r12
0x1002efbdc: mov rsi, rax
0x1002efbdf: mov rdx, r13
0x1002efbe2: vzeroupper 
0x1002efbe5: call 0x100314920 ; 0x100314920
0x1002efbea: lea rsi, [rip + 0x8907e1] ; 0x100b803d2 cloudSplash
0x1002efbf1: mov edx, 0x40
0x1002efbf6: mov rdi, r13
0x1002efbf9: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002efbfe: movsx edi, byte ptr [rbp - 0x70]
0x1002efc02: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002efc07: mov byte ptr [rbp - 0x70], al
0x1002efc0a: mov rdx, qword ptr [rip + 0x1affa57] ; 0x101def668
0x1002efc11: mov esi, 0x120
0x1002efc16: mov ecx, 0x10
0x1002efc1b: mov rdi, r15
0x1002efc1e: call 0x100795530 ; 0x100795530
0x1002efc23: vmovaps xmm0, xmmword ptr [rip + 0x7bd235] ; 0x100aace60
0x1002efc2b: vmovups xmmword ptr [rax], xmm0
0x1002efc2f: mov byte ptr [rax + 0x10], 0
0x1002efc33: mov byte ptr [rax + 0x11], 1
0x1002efc37: mov byte ptr [rax + 0x12], 0
0x1002efc3b: mov dword ptr [rax + 0x14], 0
0x1002efc42: mov dword ptr [rax + 0x18], 0
0x1002efc49: vxorps xmm0, xmm0, xmm0
0x1002efc4d: vmovlps qword ptr [rax + 0x20], xmm0
0x1002efc52: mov dword ptr [rax + 0x28], 0
0x1002efc59: vmovaps xmm0, xmmword ptr [rip + 0x7c9a4f] ; 0x100ab96b0
0x1002efc61: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002efc66: mov byte ptr [rax + 0x40], 0
0x1002efc6a: vxorps ymm0, ymm0, ymm0
0x1002efc6e: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002efc76: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002efc7b: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002efc80: mov dword ptr [rax + 0xa4], 0x40600000
0x1002efc8a: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002efc94: vmovaps xmm0, xmmword ptr [rbx]
0x1002efc98: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002efca0: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002efca8: vxorps xmm0, xmm0, xmm0
0x1002efcac: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002efcb4: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002efcbe: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002efcc6: mov dword ptr [rax + 0xf4], 0
0x1002efcd0: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002efcda: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002efce2: mov dword ptr [rax + 0x10c], 0
0x1002efcec: mov dword ptr [rax + 0x110], 0x3f800000
0x1002efcf6: mov byte ptr [rax + 0x114], 1
0x1002efcfd: mov dword ptr [rax + 0x118], 0
0x1002efd07: mov dword ptr [rax + 0x11c], 0
0x1002efd11: mov qword ptr [rip + 0x1afffd0], rax ; 0x101defce8
0x1002efd18: mov rdi, r12
0x1002efd1b: mov rsi, rax
0x1002efd1e: mov rdx, r13
0x1002efd21: vzeroupper 
0x1002efd24: call 0x100314920 ; 0x100314920
0x1002efd29: lea rsi, [rip + 0x8906ae] ; 0x100b803de fallingRock
0x1002efd30: mov edx, 0x40
0x1002efd35: mov rdi, r13
0x1002efd38: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002efd3d: movsx edi, byte ptr [rbp - 0x70]
0x1002efd41: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002efd46: mov byte ptr [rbp - 0x70], al
0x1002efd49: mov rdx, qword ptr [rip + 0x1aff918] ; 0x101def668
0x1002efd50: mov esi, 0x120
0x1002efd55: mov ecx, 0x10
0x1002efd5a: mov rdi, r15
0x1002efd5d: call 0x100795530 ; 0x100795530
0x1002efd62: vmovaps xmm0, xmmword ptr [rip + 0x7bd0f6] ; 0x100aace60
0x1002efd6a: vmovups xmmword ptr [rax], xmm0
0x1002efd6e: mov byte ptr [rax + 0x10], 0
0x1002efd72: mov byte ptr [rax + 0x11], 1
0x1002efd76: mov byte ptr [rax + 0x12], 0
0x1002efd7a: mov dword ptr [rax + 0x14], 0
0x1002efd81: mov dword ptr [rax + 0x18], 0
0x1002efd88: vxorps xmm0, xmm0, xmm0
0x1002efd8c: vmovlps qword ptr [rax + 0x20], xmm0
0x1002efd91: mov dword ptr [rax + 0x28], 0
0x1002efd98: vmovaps xmm0, xmmword ptr [rip + 0x7c9910] ; 0x100ab96b0
0x1002efda0: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002efda5: mov byte ptr [rax + 0x40], 0
0x1002efda9: vxorps ymm0, ymm0, ymm0
0x1002efdad: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002efdb5: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002efdba: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002efdbf: mov dword ptr [rax + 0xa4], 0x40600000
0x1002efdc9: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002efdd3: vmovaps xmm0, xmmword ptr [rbx]
0x1002efdd7: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002efddf: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002efde7: vxorps xmm0, xmm0, xmm0
0x1002efdeb: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002efdf3: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002efdfd: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002efe05: mov dword ptr [rax + 0xf4], 0
0x1002efe0f: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002efe19: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002efe21: mov dword ptr [rax + 0x10c], 0
0x1002efe2b: mov dword ptr [rax + 0x110], 0x3f800000
0x1002efe35: mov byte ptr [rax + 0x114], 1
0x1002efe3c: mov dword ptr [rax + 0x118], 0
0x1002efe46: mov dword ptr [rax + 0x11c], 0
0x1002efe50: mov qword ptr [rip + 0x1affe99], rax ; 0x101defcf0
0x1002efe57: mov rdi, r12
0x1002efe5a: mov rsi, rax
0x1002efe5d: mov rdx, r13
0x1002efe60: vzeroupper 
0x1002efe63: call 0x100314920 ; 0x100314920
0x1002efe68: lea rsi, [rip + 0x89057b] ; 0x100b803ea hurtSteam
0x1002efe6f: mov edx, 0x40
0x1002efe74: mov rdi, r13
0x1002efe77: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002efe7c: movsx edi, byte ptr [rbp - 0x70]
0x1002efe80: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002efe85: mov byte ptr [rbp - 0x70], al
0x1002efe88: mov rdx, qword ptr [rip + 0x1aff7d9] ; 0x101def668
0x1002efe8f: mov esi, 0x120
0x1002efe94: mov ecx, 0x10
0x1002efe99: mov rdi, r15
0x1002efe9c: call 0x100795530 ; 0x100795530
0x1002efea1: vmovaps xmm0, xmmword ptr [rip + 0x7bcfb7] ; 0x100aace60
0x1002efea9: vmovups xmmword ptr [rax], xmm0
0x1002efead: mov byte ptr [rax + 0x10], 0
0x1002efeb1: mov byte ptr [rax + 0x11], 1
0x1002efeb5: mov byte ptr [rax + 0x12], 0
0x1002efeb9: mov dword ptr [rax + 0x14], 0
0x1002efec0: mov dword ptr [rax + 0x18], 0
0x1002efec7: vxorps xmm0, xmm0, xmm0
0x1002efecb: vmovlps qword ptr [rax + 0x20], xmm0
0x1002efed0: mov dword ptr [rax + 0x28], 0
0x1002efed7: vmovaps xmm0, xmmword ptr [rip + 0x7c97d1] ; 0x100ab96b0
0x1002efedf: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002efee4: mov byte ptr [rax + 0x40], 0
0x1002efee8: vxorps ymm0, ymm0, ymm0
0x1002efeec: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002efef4: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002efef9: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002efefe: mov dword ptr [rax + 0xa4], 0x40600000
0x1002eff08: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002eff12: vmovaps xmm0, xmmword ptr [rbx]
0x1002eff16: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002eff1e: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002eff26: vxorps xmm0, xmm0, xmm0
0x1002eff2a: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002eff32: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002eff3c: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002eff44: mov dword ptr [rax + 0xf4], 0
0x1002eff4e: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002eff58: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002eff60: mov dword ptr [rax + 0x10c], 0
0x1002eff6a: mov dword ptr [rax + 0x110], 0x3f800000
0x1002eff74: mov byte ptr [rax + 0x114], 1
0x1002eff7b: mov dword ptr [rax + 0x118], 0
0x1002eff85: mov dword ptr [rax + 0x11c], 0
0x1002eff8f: mov qword ptr [rip + 0x1affd62], rax ; 0x101defcf8
0x1002eff96: mov rdi, r12
0x1002eff99: mov rsi, rax
0x1002eff9c: mov rdx, r13
0x1002eff9f: vzeroupper 
0x1002effa2: call 0x100314920 ; 0x100314920
0x1002effa7: lea rsi, [rip + 0x890446] ; 0x100b803f4 popSteam
0x1002effae: mov edx, 0x40
0x1002effb3: mov rdi, r13
0x1002effb6: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002effbb: movsx edi, byte ptr [rbp - 0x70]
0x1002effbf: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002effc4: mov byte ptr [rbp - 0x70], al
0x1002effc7: mov rdx, qword ptr [rip + 0x1aff69a] ; 0x101def668
0x1002effce: mov esi, 0x120
0x1002effd3: mov ecx, 0x10
0x1002effd8: mov rdi, r15
0x1002effdb: call 0x100795530 ; 0x100795530
0x1002effe0: vmovaps xmm0, xmmword ptr [rip + 0x7bce78] ; 0x100aace60
0x1002effe8: vmovups xmmword ptr [rax], xmm0
0x1002effec: mov byte ptr [rax + 0x10], 0
0x1002efff0: mov byte ptr [rax + 0x11], 1
0x1002efff4: mov byte ptr [rax + 0x12], 0
0x1002efff8: mov dword ptr [rax + 0x14], 0
0x1002effff: mov dword ptr [rax + 0x18], 0
0x1002f0006: vxorps xmm0, xmm0, xmm0
0x1002f000a: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f000f: mov dword ptr [rax + 0x28], 0
0x1002f0016: vmovaps xmm0, xmmword ptr [rip + 0x7c9692] ; 0x100ab96b0
0x1002f001e: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f0023: mov byte ptr [rax + 0x40], 0
0x1002f0027: vxorps ymm0, ymm0, ymm0
0x1002f002b: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f0033: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f0038: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f003d: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f0047: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f0051: vmovaps xmm0, xmmword ptr [rbx]
0x1002f0055: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f005d: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f0065: vxorps xmm0, xmm0, xmm0
0x1002f0069: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f0071: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f007b: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f0083: mov dword ptr [rax + 0xf4], 0
0x1002f008d: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f0097: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f009f: mov dword ptr [rax + 0x10c], 0
0x1002f00a9: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f00b3: mov byte ptr [rax + 0x114], 1
0x1002f00ba: mov dword ptr [rax + 0x118], 0
0x1002f00c4: mov dword ptr [rax + 0x11c], 0
0x1002f00ce: mov qword ptr [rip + 0x1affc2b], rax ; 0x101defd00
0x1002f00d5: mov rdi, r12
0x1002f00d8: mov rsi, rax
0x1002f00db: mov rdx, r13
0x1002f00de: vzeroupper 
0x1002f00e1: call 0x100314920 ; 0x100314920
0x1002f00e6: lea rsi, [rip + 0x890310] ; 0x100b803fd rekindle
0x1002f00ed: mov edx, 0x40
0x1002f00f2: mov rdi, r13
0x1002f00f5: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f00fa: movsx edi, byte ptr [rbp - 0x70]
0x1002f00fe: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f0103: mov byte ptr [rbp - 0x70], al
0x1002f0106: mov rdx, qword ptr [rip + 0x1aff55b] ; 0x101def668
0x1002f010d: mov esi, 0x120
0x1002f0112: mov ecx, 0x10
0x1002f0117: mov rdi, r15
0x1002f011a: call 0x100795530 ; 0x100795530
0x1002f011f: vmovaps xmm0, xmmword ptr [rip + 0x7bcd39] ; 0x100aace60
0x1002f0127: vmovups xmmword ptr [rax], xmm0
0x1002f012b: mov byte ptr [rax + 0x10], 0
0x1002f012f: mov byte ptr [rax + 0x11], 1
0x1002f0133: mov byte ptr [rax + 0x12], 0
0x1002f0137: mov dword ptr [rax + 0x14], 0
0x1002f013e: mov dword ptr [rax + 0x18], 0
0x1002f0145: vxorps xmm0, xmm0, xmm0
0x1002f0149: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f014e: mov dword ptr [rax + 0x28], 0
0x1002f0155: vmovaps xmm0, xmmword ptr [rip + 0x7c9553] ; 0x100ab96b0
0x1002f015d: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f0162: mov byte ptr [rax + 0x40], 0
0x1002f0166: vxorps ymm0, ymm0, ymm0
0x1002f016a: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f0172: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f0177: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f017c: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f0186: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f0190: vmovaps xmm0, xmmword ptr [rbx]
0x1002f0194: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f019c: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f01a4: vxorps xmm0, xmm0, xmm0
0x1002f01a8: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f01b0: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f01ba: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f01c2: mov dword ptr [rax + 0xf4], 0
0x1002f01cc: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f01d6: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f01de: mov dword ptr [rax + 0x10c], 0
0x1002f01e8: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f01f2: mov byte ptr [rax + 0x114], 1
0x1002f01f9: mov dword ptr [rax + 0x118], 0
0x1002f0203: mov dword ptr [rax + 0x11c], 0
0x1002f020d: mov qword ptr [rip + 0x1affaf4], rax ; 0x101defd08
0x1002f0214: mov rdi, r12
0x1002f0217: mov rsi, rax
0x1002f021a: mov rdx, r13
0x1002f021d: vzeroupper 
0x1002f0220: call 0x100314920 ; 0x100314920
0x1002f0225: lea rsi, [rip + 0x8901da] ; 0x100b80406 darkstoneSparks
0x1002f022c: mov edx, 0x40
0x1002f0231: mov rdi, r13
0x1002f0234: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f0239: movsx edi, byte ptr [rbp - 0x70]
0x1002f023d: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f0242: mov byte ptr [rbp - 0x70], al
0x1002f0245: mov rdx, qword ptr [rip + 0x1aff41c] ; 0x101def668
0x1002f024c: mov esi, 0x120
0x1002f0251: mov ecx, 0x10
0x1002f0256: mov rdi, r15
0x1002f0259: call 0x100795530 ; 0x100795530
0x1002f025e: vmovaps xmm0, xmmword ptr [rip + 0x7bcbfa] ; 0x100aace60
0x1002f0266: vmovups xmmword ptr [rax], xmm0
0x1002f026a: mov byte ptr [rax + 0x10], 0
0x1002f026e: mov byte ptr [rax + 0x11], 1
0x1002f0272: mov byte ptr [rax + 0x12], 0
0x1002f0276: mov dword ptr [rax + 0x14], 0
0x1002f027d: mov dword ptr [rax + 0x18], 0
0x1002f0284: vxorps xmm0, xmm0, xmm0
0x1002f0288: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f028d: mov dword ptr [rax + 0x28], 0
0x1002f0294: vmovaps xmm0, xmmword ptr [rip + 0x7c9414] ; 0x100ab96b0
0x1002f029c: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f02a1: mov byte ptr [rax + 0x40], 0
0x1002f02a5: vxorps ymm0, ymm0, ymm0
0x1002f02a9: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f02b1: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f02b6: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f02bb: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f02c5: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f02cf: vmovaps xmm0, xmmword ptr [rbx]
0x1002f02d3: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f02db: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f02e3: vxorps xmm0, xmm0, xmm0
0x1002f02e7: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f02ef: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f02f9: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f0301: mov dword ptr [rax + 0xf4], 0
0x1002f030b: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f0315: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f031d: mov dword ptr [rax + 0x10c], 0
0x1002f0327: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f0331: mov byte ptr [rax + 0x114], 1
0x1002f0338: mov dword ptr [rax + 0x118], 0
0x1002f0342: mov dword ptr [rax + 0x11c], 0
0x1002f034c: mov qword ptr [rip + 0x1aff9bd], rax ; 0x101defd10
0x1002f0353: mov rdi, r12
0x1002f0356: mov rsi, rax
0x1002f0359: mov rdx, r13
0x1002f035c: vzeroupper 
0x1002f035f: call 0x100314920 ; 0x100314920
0x1002f0364: lea rsi, [rip + 0x8900ab] ; 0x100b80416 darkstoneSuck
0x1002f036b: mov edx, 0x40
0x1002f0370: mov rdi, r13
0x1002f0373: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f0378: movsx edi, byte ptr [rbp - 0x70]
0x1002f037c: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f0381: mov byte ptr [rbp - 0x70], al
0x1002f0384: mov rdx, qword ptr [rip + 0x1aff2dd] ; 0x101def668
0x1002f038b: mov esi, 0x120
0x1002f0390: mov ecx, 0x10
0x1002f0395: mov rdi, r15
0x1002f0398: call 0x100795530 ; 0x100795530
0x1002f039d: vmovaps xmm0, xmmword ptr [rip + 0x7bcabb] ; 0x100aace60
0x1002f03a5: vmovups xmmword ptr [rax], xmm0
0x1002f03a9: mov byte ptr [rax + 0x10], 0
0x1002f03ad: mov byte ptr [rax + 0x11], 1
0x1002f03b1: mov byte ptr [rax + 0x12], 0
0x1002f03b5: mov dword ptr [rax + 0x14], 0
0x1002f03bc: mov dword ptr [rax + 0x18], 0
0x1002f03c3: vxorps xmm0, xmm0, xmm0
0x1002f03c7: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f03cc: mov dword ptr [rax + 0x28], 0
0x1002f03d3: vmovaps xmm0, xmmword ptr [rip + 0x7c92d5] ; 0x100ab96b0
0x1002f03db: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f03e0: mov byte ptr [rax + 0x40], 0
0x1002f03e4: vxorps ymm0, ymm0, ymm0
0x1002f03e8: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f03f0: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f03f5: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f03fa: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f0404: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f040e: vmovaps xmm0, xmmword ptr [rbx]
0x1002f0412: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f041a: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f0422: vxorps xmm0, xmm0, xmm0
0x1002f0426: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f042e: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f0438: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f0440: mov dword ptr [rax + 0xf4], 0
0x1002f044a: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f0454: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f045c: mov dword ptr [rax + 0x10c], 0
0x1002f0466: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f0470: mov byte ptr [rax + 0x114], 1
0x1002f0477: mov dword ptr [rax + 0x118], 0
0x1002f0481: mov dword ptr [rax + 0x11c], 0
0x1002f048b: mov qword ptr [rip + 0x1aff886], rax ; 0x101defd18
0x1002f0492: mov rdi, r12
0x1002f0495: mov rsi, rax
0x1002f0498: mov rdx, r13
0x1002f049b: vzeroupper 
0x1002f049e: call 0x100314920 ; 0x100314920
0x1002f04a3: lea rsi, [rip + 0x88ff7a] ; 0x100b80424 attentionGive
0x1002f04aa: mov edx, 0x40
0x1002f04af: mov rdi, r13
0x1002f04b2: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f04b7: movsx edi, byte ptr [rbp - 0x70]
0x1002f04bb: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f04c0: mov byte ptr [rbp - 0x70], al
0x1002f04c3: mov rdx, qword ptr [rip + 0x1aff19e] ; 0x101def668
0x1002f04ca: mov esi, 0x120
0x1002f04cf: mov ecx, 0x10
0x1002f04d4: mov rdi, r15
0x1002f04d7: call 0x100795530 ; 0x100795530
0x1002f04dc: vmovaps xmm0, xmmword ptr [rip + 0x7bc97c] ; 0x100aace60
0x1002f04e4: vmovups xmmword ptr [rax], xmm0
0x1002f04e8: mov byte ptr [rax + 0x10], 0
0x1002f04ec: mov byte ptr [rax + 0x11], 1
0x1002f04f0: mov byte ptr [rax + 0x12], 0
0x1002f04f4: mov dword ptr [rax + 0x14], 0
0x1002f04fb: mov dword ptr [rax + 0x18], 0
0x1002f0502: vxorps xmm0, xmm0, xmm0
0x1002f0506: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f050b: mov dword ptr [rax + 0x28], 0
0x1002f0512: vmovaps xmm0, xmmword ptr [rip + 0x7c9196] ; 0x100ab96b0
0x1002f051a: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f051f: mov byte ptr [rax + 0x40], 0
0x1002f0523: vxorps ymm0, ymm0, ymm0
0x1002f0527: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f052f: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f0534: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f0539: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f0543: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f054d: vmovaps xmm0, xmmword ptr [rbx]
0x1002f0551: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f0559: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f0561: vxorps xmm0, xmm0, xmm0
0x1002f0565: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f056d: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f0577: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f057f: mov dword ptr [rax + 0xf4], 0
0x1002f0589: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f0593: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f059b: mov dword ptr [rax + 0x10c], 0
0x1002f05a5: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f05af: mov byte ptr [rax + 0x114], 1
0x1002f05b6: mov dword ptr [rax + 0x118], 0
0x1002f05c0: mov dword ptr [rax + 0x11c], 0
0x1002f05ca: mov qword ptr [rip + 0x1aff74f], rax ; 0x101defd20
0x1002f05d1: mov rdi, r12
0x1002f05d4: mov rsi, rax
0x1002f05d7: mov rdx, r13
0x1002f05da: vzeroupper 
0x1002f05dd: call 0x100314920 ; 0x100314920
0x1002f05e2: lea rsi, [rip + 0x88fe49] ; 0x100b80432 attentionReceive
0x1002f05e9: mov edx, 0x40
0x1002f05ee: mov rdi, r13
0x1002f05f1: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f05f6: movsx edi, byte ptr [rbp - 0x70]
0x1002f05fa: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f05ff: mov byte ptr [rbp - 0x70], al
0x1002f0602: mov rdx, qword ptr [rip + 0x1aff05f] ; 0x101def668
0x1002f0609: mov esi, 0x120
0x1002f060e: mov ecx, 0x10
0x1002f0613: mov rdi, r15
0x1002f0616: call 0x100795530 ; 0x100795530
0x1002f061b: vmovaps xmm0, xmmword ptr [rip + 0x7bc83d] ; 0x100aace60
0x1002f0623: vmovups xmmword ptr [rax], xmm0
0x1002f0627: mov byte ptr [rax + 0x10], 0
0x1002f062b: mov byte ptr [rax + 0x11], 1
0x1002f062f: mov byte ptr [rax + 0x12], 0
0x1002f0633: mov dword ptr [rax + 0x14], 0
0x1002f063a: mov dword ptr [rax + 0x18], 0
0x1002f0641: vxorps xmm0, xmm0, xmm0
0x1002f0645: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f064a: mov dword ptr [rax + 0x28], 0
0x1002f0651: vmovaps xmm0, xmmword ptr [rip + 0x7c9057] ; 0x100ab96b0
0x1002f0659: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f065e: mov byte ptr [rax + 0x40], 0
0x1002f0662: vxorps ymm0, ymm0, ymm0
0x1002f0666: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f066e: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f0673: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f0678: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f0682: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f068c: vmovaps xmm0, xmmword ptr [rbx]
0x1002f0690: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f0698: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f06a0: vxorps xmm0, xmm0, xmm0
0x1002f06a4: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f06ac: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f06b6: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f06be: mov dword ptr [rax + 0xf4], 0
0x1002f06c8: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f06d2: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f06da: mov dword ptr [rax + 0x10c], 0
0x1002f06e4: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f06ee: mov byte ptr [rax + 0x114], 1
0x1002f06f5: mov dword ptr [rax + 0x118], 0
0x1002f06ff: mov dword ptr [rax + 0x11c], 0
0x1002f0709: mov qword ptr [rip + 0x1aff618], rax ; 0x101defd28
0x1002f0710: mov rdi, r12
0x1002f0713: mov rsi, rax
0x1002f0716: mov rdx, r13
0x1002f0719: vzeroupper 
0x1002f071c: call 0x100314920 ; 0x100314920
0x1002f0721: lea rsi, [rip + 0x88fd1b] ; 0x100b80443 attackCharging
0x1002f0728: mov edx, 0x40
0x1002f072d: mov rdi, r13
0x1002f0730: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f0735: movsx edi, byte ptr [rbp - 0x70]
0x1002f0739: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f073e: mov byte ptr [rbp - 0x70], al
0x1002f0741: mov rdx, qword ptr [rip + 0x1afef20] ; 0x101def668
0x1002f0748: mov esi, 0x120
0x1002f074d: mov ecx, 0x10
0x1002f0752: mov rdi, r15
0x1002f0755: call 0x100795530 ; 0x100795530
0x1002f075a: vmovaps xmm0, xmmword ptr [rip + 0x7bc6fe] ; 0x100aace60
0x1002f0762: vmovups xmmword ptr [rax], xmm0
0x1002f0766: mov byte ptr [rax + 0x10], 0
0x1002f076a: mov byte ptr [rax + 0x11], 1
0x1002f076e: mov byte ptr [rax + 0x12], 0
0x1002f0772: mov dword ptr [rax + 0x14], 0
0x1002f0779: mov dword ptr [rax + 0x18], 0
0x1002f0780: vxorps xmm0, xmm0, xmm0
0x1002f0784: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f0789: mov dword ptr [rax + 0x28], 0
0x1002f0790: vmovaps xmm0, xmmword ptr [rip + 0x7c8f18] ; 0x100ab96b0
0x1002f0798: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f079d: mov byte ptr [rax + 0x40], 0
0x1002f07a1: vxorps ymm0, ymm0, ymm0
0x1002f07a5: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f07ad: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f07b2: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f07b7: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f07c1: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f07cb: vmovaps xmm0, xmmword ptr [rbx]
0x1002f07cf: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f07d7: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f07df: vxorps xmm0, xmm0, xmm0
0x1002f07e3: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f07eb: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f07f5: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f07fd: mov dword ptr [rax + 0xf4], 0
0x1002f0807: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f0811: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f0819: mov dword ptr [rax + 0x10c], 0
0x1002f0823: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f082d: mov byte ptr [rax + 0x114], 1
0x1002f0834: mov dword ptr [rax + 0x118], 0
0x1002f083e: mov dword ptr [rax + 0x11c], 0
0x1002f0848: mov qword ptr [rip + 0x1aff4e1], rax ; 0x101defd30
0x1002f084f: mov rdi, r12
0x1002f0852: mov rsi, rax
0x1002f0855: mov rdx, r13
0x1002f0858: vzeroupper 
0x1002f085b: call 0x100314920 ; 0x100314920
0x1002f0860: lea rsi, [rip + 0x88fbeb] ; 0x100b80452 attackCharged
0x1002f0867: mov edx, 0x40
0x1002f086c: mov rdi, r13
0x1002f086f: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f0874: movsx edi, byte ptr [rbp - 0x70]
0x1002f0878: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f087d: mov byte ptr [rbp - 0x70], al
0x1002f0880: mov rdx, qword ptr [rip + 0x1afede1] ; 0x101def668
0x1002f0887: mov esi, 0x120
0x1002f088c: mov ecx, 0x10
0x1002f0891: mov rdi, r15
0x1002f0894: call 0x100795530 ; 0x100795530
0x1002f0899: vmovaps xmm0, xmmword ptr [rip + 0x7bc5bf] ; 0x100aace60
0x1002f08a1: vmovups xmmword ptr [rax], xmm0
0x1002f08a5: mov byte ptr [rax + 0x10], 0
0x1002f08a9: mov byte ptr [rax + 0x11], 1
0x1002f08ad: mov byte ptr [rax + 0x12], 0
0x1002f08b1: mov dword ptr [rax + 0x14], 0
0x1002f08b8: mov dword ptr [rax + 0x18], 0
0x1002f08bf: vxorps xmm0, xmm0, xmm0
0x1002f08c3: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f08c8: mov dword ptr [rax + 0x28], 0
0x1002f08cf: vmovaps xmm0, xmmword ptr [rip + 0x7c8dd9] ; 0x100ab96b0
0x1002f08d7: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f08dc: mov byte ptr [rax + 0x40], 0
0x1002f08e0: vxorps ymm0, ymm0, ymm0
0x1002f08e4: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f08ec: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f08f1: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f08f6: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f0900: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f090a: vmovaps xmm0, xmmword ptr [rbx]
0x1002f090e: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f0916: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f091e: vxorps xmm0, xmm0, xmm0
0x1002f0922: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f092a: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f0934: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f093c: mov dword ptr [rax + 0xf4], 0
0x1002f0946: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f0950: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f0958: mov dword ptr [rax + 0x10c], 0
0x1002f0962: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f096c: mov byte ptr [rax + 0x114], 1
0x1002f0973: mov dword ptr [rax + 0x118], 0
0x1002f097d: mov dword ptr [rax + 0x11c], 0
0x1002f0987: mov qword ptr [rip + 0x1aff3aa], rax ; 0x101defd38
0x1002f098e: mov rdi, r12
0x1002f0991: mov rsi, rax
0x1002f0994: mov rdx, r13
0x1002f0997: vzeroupper 
0x1002f099a: call 0x100314920 ; 0x100314920
0x1002f099f: lea rsi, [rip + 0x88faba] ; 0x100b80460 attackFire
0x1002f09a6: mov edx, 0x40
0x1002f09ab: mov rdi, r13
0x1002f09ae: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f09b3: movsx edi, byte ptr [rbp - 0x70]
0x1002f09b7: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f09bc: mov byte ptr [rbp - 0x70], al
0x1002f09bf: mov rdx, qword ptr [rip + 0x1afeca2] ; 0x101def668
0x1002f09c6: mov esi, 0x120
0x1002f09cb: mov ecx, 0x10
0x1002f09d0: mov rdi, r15
0x1002f09d3: call 0x100795530 ; 0x100795530
0x1002f09d8: vmovaps xmm0, xmmword ptr [rip + 0x7bc480] ; 0x100aace60
0x1002f09e0: vmovups xmmword ptr [rax], xmm0
0x1002f09e4: mov byte ptr [rax + 0x10], 0
0x1002f09e8: mov byte ptr [rax + 0x11], 1
0x1002f09ec: mov byte ptr [rax + 0x12], 0
0x1002f09f0: mov dword ptr [rax + 0x14], 0
0x1002f09f7: mov dword ptr [rax + 0x18], 0
0x1002f09fe: vxorps xmm0, xmm0, xmm0
0x1002f0a02: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f0a07: mov dword ptr [rax + 0x28], 0
0x1002f0a0e: vmovaps xmm0, xmmword ptr [rip + 0x7c8c9a] ; 0x100ab96b0
0x1002f0a16: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f0a1b: mov byte ptr [rax + 0x40], 0
0x1002f0a1f: vxorps ymm0, ymm0, ymm0
0x1002f0a23: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f0a2b: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f0a30: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f0a35: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f0a3f: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f0a49: vmovaps xmm0, xmmword ptr [rbx]
0x1002f0a4d: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f0a55: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f0a5d: vxorps xmm0, xmm0, xmm0
0x1002f0a61: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f0a69: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f0a73: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f0a7b: mov dword ptr [rax + 0xf4], 0
0x1002f0a85: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f0a8f: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f0a97: mov dword ptr [rax + 0x10c], 0
0x1002f0aa1: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f0aab: mov byte ptr [rax + 0x114], 1
0x1002f0ab2: mov dword ptr [rax + 0x118], 0
0x1002f0abc: mov dword ptr [rax + 0x11c], 0
0x1002f0ac6: mov qword ptr [rip + 0x1aff273], rax ; 0x101defd40
0x1002f0acd: mov rdi, r12
0x1002f0ad0: mov rsi, rax
0x1002f0ad3: mov rdx, r13
0x1002f0ad6: vzeroupper 
0x1002f0ad9: call 0x100314920 ; 0x100314920
0x1002f0ade: lea rsi, [rip + 0x88f986] ; 0x100b8046b attackBullet
0x1002f0ae5: mov edx, 0x40
0x1002f0aea: mov rdi, r13
0x1002f0aed: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f0af2: movsx edi, byte ptr [rbp - 0x70]
0x1002f0af6: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f0afb: mov byte ptr [rbp - 0x70], al
0x1002f0afe: mov rdx, qword ptr [rip + 0x1afeb63] ; 0x101def668
0x1002f0b05: mov esi, 0x120
0x1002f0b0a: mov ecx, 0x10
0x1002f0b0f: mov rdi, r15
0x1002f0b12: call 0x100795530 ; 0x100795530
0x1002f0b17: vmovaps xmm0, xmmword ptr [rip + 0x7bc341] ; 0x100aace60
0x1002f0b1f: vmovups xmmword ptr [rax], xmm0
0x1002f0b23: mov byte ptr [rax + 0x10], 0
0x1002f0b27: mov byte ptr [rax + 0x11], 1
0x1002f0b2b: mov byte ptr [rax + 0x12], 0
0x1002f0b2f: mov dword ptr [rax + 0x14], 0
0x1002f0b36: mov dword ptr [rax + 0x18], 0
0x1002f0b3d: vxorps xmm0, xmm0, xmm0
0x1002f0b41: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f0b46: mov dword ptr [rax + 0x28], 0
0x1002f0b4d: vmovaps xmm0, xmmword ptr [rip + 0x7c8b5b] ; 0x100ab96b0
0x1002f0b55: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f0b5a: mov byte ptr [rax + 0x40], 0
0x1002f0b5e: vxorps ymm0, ymm0, ymm0
0x1002f0b62: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f0b6a: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f0b6f: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f0b74: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f0b7e: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f0b88: vmovaps xmm0, xmmword ptr [rbx]
0x1002f0b8c: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f0b94: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f0b9c: vxorps xmm0, xmm0, xmm0
0x1002f0ba0: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f0ba8: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f0bb2: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f0bba: mov dword ptr [rax + 0xf4], 0
0x1002f0bc4: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f0bce: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f0bd6: mov dword ptr [rax + 0x10c], 0
0x1002f0be0: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f0bea: mov byte ptr [rax + 0x114], 1
0x1002f0bf1: mov dword ptr [rax + 0x118], 0
0x1002f0bfb: mov dword ptr [rax + 0x11c], 0
0x1002f0c05: mov qword ptr [rip + 0x1aff13c], rax ; 0x101defd48
0x1002f0c0c: mov rdi, r12
0x1002f0c0f: mov rsi, rax
0x1002f0c12: mov rdx, r13
0x1002f0c15: vzeroupper 
0x1002f0c18: call 0x100314920 ; 0x100314920
0x1002f0c1d: lea rsi, [rip + 0x88f854] ; 0x100b80478 attackStream
0x1002f0c24: mov edx, 0x40
0x1002f0c29: mov rdi, r13
0x1002f0c2c: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f0c31: movsx edi, byte ptr [rbp - 0x70]
0x1002f0c35: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f0c3a: mov byte ptr [rbp - 0x70], al
0x1002f0c3d: mov rdx, qword ptr [rip + 0x1afea24] ; 0x101def668
0x1002f0c44: mov esi, 0x120
0x1002f0c49: mov ecx, 0x10
0x1002f0c4e: mov rdi, r15
0x1002f0c51: call 0x100795530 ; 0x100795530
0x1002f0c56: vmovaps xmm0, xmmword ptr [rip + 0x7bc202] ; 0x100aace60
0x1002f0c5e: vmovups xmmword ptr [rax], xmm0
0x1002f0c62: mov byte ptr [rax + 0x10], 0
0x1002f0c66: mov byte ptr [rax + 0x11], 1
0x1002f0c6a: mov byte ptr [rax + 0x12], 0
0x1002f0c6e: mov dword ptr [rax + 0x14], 0
0x1002f0c75: mov dword ptr [rax + 0x18], 0
0x1002f0c7c: vxorps xmm0, xmm0, xmm0
0x1002f0c80: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f0c85: mov dword ptr [rax + 0x28], 0
0x1002f0c8c: vmovaps xmm0, xmmword ptr [rip + 0x7c8a1c] ; 0x100ab96b0
0x1002f0c94: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f0c99: mov byte ptr [rax + 0x40], 0
0x1002f0c9d: vxorps ymm0, ymm0, ymm0
0x1002f0ca1: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f0ca9: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f0cae: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f0cb3: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f0cbd: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f0cc7: vmovaps xmm0, xmmword ptr [rbx]
0x1002f0ccb: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f0cd3: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f0cdb: vxorps xmm0, xmm0, xmm0
0x1002f0cdf: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f0ce7: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f0cf1: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f0cf9: mov dword ptr [rax + 0xf4], 0
0x1002f0d03: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f0d0d: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f0d15: mov dword ptr [rax + 0x10c], 0
0x1002f0d1f: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f0d29: mov byte ptr [rax + 0x114], 1
0x1002f0d30: mov dword ptr [rax + 0x118], 0
0x1002f0d3a: mov dword ptr [rax + 0x11c], 0
0x1002f0d44: mov qword ptr [rip + 0x1aff005], rax ; 0x101defd50
0x1002f0d4b: mov rdi, r12
0x1002f0d4e: mov rsi, rax
0x1002f0d51: mov rdx, r13
0x1002f0d54: vzeroupper 
0x1002f0d57: call 0x100314920 ; 0x100314920
0x1002f0d5c: lea rsi, [rip + 0x88f722] ; 0x100b80485 attackHit
0x1002f0d63: mov edx, 0x40
0x1002f0d68: mov rdi, r13
0x1002f0d6b: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f0d70: movsx edi, byte ptr [rbp - 0x70]
0x1002f0d74: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f0d79: mov byte ptr [rbp - 0x70], al
0x1002f0d7c: mov rdx, qword ptr [rip + 0x1afe8e5] ; 0x101def668
0x1002f0d83: mov esi, 0x120
0x1002f0d88: mov ecx, 0x10
0x1002f0d8d: mov rdi, r15
0x1002f0d90: call 0x100795530 ; 0x100795530
0x1002f0d95: vmovaps xmm0, xmmword ptr [rip + 0x7bc0c3] ; 0x100aace60
0x1002f0d9d: vmovups xmmword ptr [rax], xmm0
0x1002f0da1: mov byte ptr [rax + 0x10], 0
0x1002f0da5: mov byte ptr [rax + 0x11], 1
0x1002f0da9: mov byte ptr [rax + 0x12], 0
0x1002f0dad: mov dword ptr [rax + 0x14], 0
0x1002f0db4: mov dword ptr [rax + 0x18], 0
0x1002f0dbb: vxorps xmm0, xmm0, xmm0
0x1002f0dbf: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f0dc4: mov dword ptr [rax + 0x28], 0
0x1002f0dcb: vmovaps xmm0, xmmword ptr [rip + 0x7c88dd] ; 0x100ab96b0
0x1002f0dd3: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f0dd8: mov byte ptr [rax + 0x40], 0
0x1002f0ddc: vxorps ymm0, ymm0, ymm0
0x1002f0de0: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f0de8: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f0ded: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f0df2: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f0dfc: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f0e06: vmovaps xmm0, xmmword ptr [rbx]
0x1002f0e0a: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f0e12: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f0e1a: vxorps xmm0, xmm0, xmm0
0x1002f0e1e: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f0e26: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f0e30: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f0e38: mov dword ptr [rax + 0xf4], 0
0x1002f0e42: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f0e4c: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f0e54: mov dword ptr [rax + 0x10c], 0
0x1002f0e5e: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f0e68: mov byte ptr [rax + 0x114], 1
0x1002f0e6f: mov dword ptr [rax + 0x118], 0
0x1002f0e79: mov dword ptr [rax + 0x11c], 0
0x1002f0e83: mov qword ptr [rip + 0x1afeece], rax ; 0x101defd58
0x1002f0e8a: mov rdi, r12
0x1002f0e8d: mov rsi, rax
0x1002f0e90: mov rdx, r13
0x1002f0e93: vzeroupper 
0x1002f0e96: call 0x100314920 ; 0x100314920
0x1002f0e9b: lea rsi, [rip + 0x88f5ed] ; 0x100b8048f combatDefeat
0x1002f0ea2: mov edx, 0x40
0x1002f0ea7: mov rdi, r13
0x1002f0eaa: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f0eaf: movsx edi, byte ptr [rbp - 0x70]
0x1002f0eb3: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f0eb8: mov byte ptr [rbp - 0x70], al
0x1002f0ebb: mov rdx, qword ptr [rip + 0x1afe7a6] ; 0x101def668
0x1002f0ec2: mov esi, 0x120
0x1002f0ec7: mov ecx, 0x10
0x1002f0ecc: mov rdi, r15
0x1002f0ecf: call 0x100795530 ; 0x100795530
0x1002f0ed4: vmovaps xmm0, xmmword ptr [rip + 0x7bbf84] ; 0x100aace60
0x1002f0edc: vmovups xmmword ptr [rax], xmm0
0x1002f0ee0: mov byte ptr [rax + 0x10], 0
0x1002f0ee4: mov byte ptr [rax + 0x11], 1
0x1002f0ee8: mov byte ptr [rax + 0x12], 0
0x1002f0eec: mov dword ptr [rax + 0x14], 0
0x1002f0ef3: mov dword ptr [rax + 0x18], 0
0x1002f0efa: vxorps xmm0, xmm0, xmm0
0x1002f0efe: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f0f03: mov dword ptr [rax + 0x28], 0
0x1002f0f0a: vmovaps xmm0, xmmword ptr [rip + 0x7c879e] ; 0x100ab96b0
0x1002f0f12: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f0f17: mov byte ptr [rax + 0x40], 0
0x1002f0f1b: vxorps ymm0, ymm0, ymm0
0x1002f0f1f: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f0f27: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f0f2c: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f0f31: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f0f3b: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f0f45: vmovaps xmm0, xmmword ptr [rbx]
0x1002f0f49: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f0f51: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f0f59: vxorps xmm0, xmm0, xmm0
0x1002f0f5d: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f0f65: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f0f6f: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f0f77: mov dword ptr [rax + 0xf4], 0
0x1002f0f81: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f0f8b: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f0f93: mov dword ptr [rax + 0x10c], 0
0x1002f0f9d: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f0fa7: mov byte ptr [rax + 0x114], 1
0x1002f0fae: mov dword ptr [rax + 0x118], 0
0x1002f0fb8: mov dword ptr [rax + 0x11c], 0
0x1002f0fc2: mov qword ptr [rip + 0x1afed97], rax ; 0x101defd60
0x1002f0fc9: mov rdi, r12
0x1002f0fcc: mov rsi, rax
0x1002f0fcf: mov rdx, r13
0x1002f0fd2: vzeroupper 
0x1002f0fd5: call 0x100314920 ; 0x100314920
0x1002f0fda: lea rsi, [rip + 0x88f4bb] ; 0x100b8049c combatHealCharge
0x1002f0fe1: mov edx, 0x40
0x1002f0fe6: mov rdi, r13
0x1002f0fe9: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f0fee: movsx edi, byte ptr [rbp - 0x70]
0x1002f0ff2: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f0ff7: mov byte ptr [rbp - 0x70], al
0x1002f0ffa: mov rdx, qword ptr [rip + 0x1afe667] ; 0x101def668
0x1002f1001: mov esi, 0x120
0x1002f1006: mov ecx, 0x10
0x1002f100b: mov rdi, r15
0x1002f100e: call 0x100795530 ; 0x100795530
0x1002f1013: vmovaps xmm0, xmmword ptr [rip + 0x7bbe45] ; 0x100aace60
0x1002f101b: vmovups xmmword ptr [rax], xmm0
0x1002f101f: mov byte ptr [rax + 0x10], 0
0x1002f1023: mov byte ptr [rax + 0x11], 1
0x1002f1027: mov byte ptr [rax + 0x12], 0
0x1002f102b: mov dword ptr [rax + 0x14], 0
0x1002f1032: mov dword ptr [rax + 0x18], 0
0x1002f1039: vxorps xmm0, xmm0, xmm0
0x1002f103d: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f1042: mov dword ptr [rax + 0x28], 0
0x1002f1049: vmovaps xmm0, xmmword ptr [rip + 0x7c865f] ; 0x100ab96b0
0x1002f1051: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f1056: mov byte ptr [rax + 0x40], 0
0x1002f105a: vxorps ymm0, ymm0, ymm0
0x1002f105e: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f1066: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f106b: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f1070: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f107a: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f1084: vmovaps xmm0, xmmword ptr [rbx]
0x1002f1088: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f1090: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f1098: vxorps xmm0, xmm0, xmm0
0x1002f109c: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f10a4: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f10ae: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f10b6: mov dword ptr [rax + 0xf4], 0
0x1002f10c0: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f10ca: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f10d2: mov dword ptr [rax + 0x10c], 0
0x1002f10dc: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f10e6: mov byte ptr [rax + 0x114], 1
0x1002f10ed: mov dword ptr [rax + 0x118], 0
0x1002f10f7: mov dword ptr [rax + 0x11c], 0
0x1002f1101: mov qword ptr [rip + 0x1afec60], rax ; 0x101defd68
0x1002f1108: mov rdi, r12
0x1002f110b: mov rsi, rax
0x1002f110e: mov rdx, r13
0x1002f1111: vzeroupper 
0x1002f1114: call 0x100314920 ; 0x100314920
0x1002f1119: lea rsi, [rip + 0x88f38d] ; 0x100b804ad combatHeal
0x1002f1120: mov edx, 0x40
0x1002f1125: mov rdi, r13
0x1002f1128: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f112d: movsx edi, byte ptr [rbp - 0x70]
0x1002f1131: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f1136: mov byte ptr [rbp - 0x70], al
0x1002f1139: mov rdx, qword ptr [rip + 0x1afe528] ; 0x101def668
0x1002f1140: mov esi, 0x120
0x1002f1145: mov ecx, 0x10
0x1002f114a: mov rdi, r15
0x1002f114d: call 0x100795530 ; 0x100795530
0x1002f1152: vmovaps xmm0, xmmword ptr [rip + 0x7bbd06] ; 0x100aace60
0x1002f115a: vmovups xmmword ptr [rax], xmm0
0x1002f115e: mov byte ptr [rax + 0x10], 0
0x1002f1162: mov byte ptr [rax + 0x11], 1
0x1002f1166: mov byte ptr [rax + 0x12], 0
0x1002f116a: mov dword ptr [rax + 0x14], 0
0x1002f1171: mov dword ptr [rax + 0x18], 0
0x1002f1178: vxorps xmm0, xmm0, xmm0
0x1002f117c: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f1181: mov dword ptr [rax + 0x28], 0
0x1002f1188: vmovaps xmm0, xmmword ptr [rip + 0x7c8520] ; 0x100ab96b0
0x1002f1190: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f1195: mov byte ptr [rax + 0x40], 0
0x1002f1199: vxorps ymm0, ymm0, ymm0
0x1002f119d: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f11a5: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f11aa: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f11af: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f11b9: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f11c3: vmovaps xmm0, xmmword ptr [rbx]
0x1002f11c7: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f11cf: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f11d7: vxorps xmm0, xmm0, xmm0
0x1002f11db: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f11e3: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f11ed: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f11f5: mov dword ptr [rax + 0xf4], 0
0x1002f11ff: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f1209: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f1211: mov dword ptr [rax + 0x10c], 0
0x1002f121b: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f1225: mov byte ptr [rax + 0x114], 1
0x1002f122c: mov dword ptr [rax + 0x118], 0
0x1002f1236: mov dword ptr [rax + 0x11c], 0
0x1002f1240: mov qword ptr [rip + 0x1afeb29], rax ; 0x101defd70
0x1002f1247: mov rdi, r12
0x1002f124a: mov rsi, rax
0x1002f124d: mov rdx, r13
0x1002f1250: vzeroupper 
0x1002f1253: call 0x100314920 ; 0x100314920
0x1002f1258: lea rsi, [rip + 0x88f259] ; 0x100b804b8 sparkleFlame
0x1002f125f: mov edx, 0x40
0x1002f1264: mov rdi, r13
0x1002f1267: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f126c: movsx edi, byte ptr [rbp - 0x70]
0x1002f1270: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f1275: mov byte ptr [rbp - 0x70], al
0x1002f1278: mov rdx, qword ptr [rip + 0x1afe3e9] ; 0x101def668
0x1002f127f: mov esi, 0x120
0x1002f1284: mov ecx, 0x10
0x1002f1289: mov rdi, r15
0x1002f128c: call 0x100795530 ; 0x100795530
0x1002f1291: vmovaps xmm0, xmmword ptr [rip + 0x7bbbc7] ; 0x100aace60
0x1002f1299: vmovups xmmword ptr [rax], xmm0
0x1002f129d: mov byte ptr [rax + 0x10], 0
0x1002f12a1: mov byte ptr [rax + 0x11], 1
0x1002f12a5: mov byte ptr [rax + 0x12], 0
0x1002f12a9: mov dword ptr [rax + 0x14], 0
0x1002f12b0: mov dword ptr [rax + 0x18], 0
0x1002f12b7: vxorps xmm0, xmm0, xmm0
0x1002f12bb: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f12c0: mov dword ptr [rax + 0x28], 0
0x1002f12c7: vmovaps xmm0, xmmword ptr [rip + 0x7c83e1] ; 0x100ab96b0
0x1002f12cf: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f12d4: mov byte ptr [rax + 0x40], 0
0x1002f12d8: vxorps ymm0, ymm0, ymm0
0x1002f12dc: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f12e4: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f12e9: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f12ee: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f12f8: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f1302: vmovaps xmm0, xmmword ptr [rbx]
0x1002f1306: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f130e: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f1316: vxorps xmm0, xmm0, xmm0
0x1002f131a: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f1322: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f132c: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f1334: mov dword ptr [rax + 0xf4], 0
0x1002f133e: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f1348: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f1350: mov dword ptr [rax + 0x10c], 0
0x1002f135a: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f1364: mov byte ptr [rax + 0x114], 1
0x1002f136b: mov dword ptr [rax + 0x118], 0
0x1002f1375: mov dword ptr [rax + 0x11c], 0
0x1002f137f: mov qword ptr [rip + 0x1afe9f2], rax ; 0x101defd78
0x1002f1386: mov rdi, r12
0x1002f1389: mov rsi, rax
0x1002f138c: mov rdx, r13
0x1002f138f: vzeroupper 
0x1002f1392: call 0x100314920 ; 0x100314920
0x1002f1397: lea rsi, [rip + 0x88f127] ; 0x100b804c5 streamLinkReward
0x1002f139e: mov edx, 0x40
0x1002f13a3: mov rdi, r13
0x1002f13a6: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f13ab: movsx edi, byte ptr [rbp - 0x70]
0x1002f13af: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f13b4: mov byte ptr [rbp - 0x70], al
0x1002f13b7: mov rdx, qword ptr [rip + 0x1afe2aa] ; 0x101def668
0x1002f13be: mov esi, 0x120
0x1002f13c3: mov ecx, 0x10
0x1002f13c8: mov rdi, r15
0x1002f13cb: call 0x100795530 ; 0x100795530
0x1002f13d0: vmovaps xmm0, xmmword ptr [rip + 0x7bba88] ; 0x100aace60
0x1002f13d8: vmovups xmmword ptr [rax], xmm0
0x1002f13dc: mov byte ptr [rax + 0x10], 0
0x1002f13e0: mov byte ptr [rax + 0x11], 1
0x1002f13e4: mov byte ptr [rax + 0x12], 0
0x1002f13e8: mov dword ptr [rax + 0x14], 0
0x1002f13ef: mov dword ptr [rax + 0x18], 0
0x1002f13f6: vxorps xmm0, xmm0, xmm0
0x1002f13fa: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f13ff: mov dword ptr [rax + 0x28], 0
0x1002f1406: vmovaps xmm0, xmmword ptr [rip + 0x7c82a2] ; 0x100ab96b0
0x1002f140e: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f1413: mov byte ptr [rax + 0x40], 0
0x1002f1417: vxorps ymm0, ymm0, ymm0
0x1002f141b: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f1423: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f1428: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f142d: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f1437: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f1441: vmovaps xmm0, xmmword ptr [rbx]
0x1002f1445: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f144d: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f1455: vxorps xmm0, xmm0, xmm0
0x1002f1459: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f1461: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f146b: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f1473: mov dword ptr [rax + 0xf4], 0
0x1002f147d: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f1487: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f148f: mov dword ptr [rax + 0x10c], 0
0x1002f1499: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f14a3: mov byte ptr [rax + 0x114], 1
0x1002f14aa: mov dword ptr [rax + 0x118], 0
0x1002f14b4: mov dword ptr [rax + 0x11c], 0
0x1002f14be: mov qword ptr [rip + 0x1afe8bb], rax ; 0x101defd80
0x1002f14c5: mov rdi, r12
0x1002f14c8: mov rsi, rax
0x1002f14cb: mov rdx, r13
0x1002f14ce: vzeroupper 
0x1002f14d1: call 0x100314920 ; 0x100314920
0x1002f14d6: lea rsi, [rip + 0x88eff9] ; 0x100b804d6 fragImplosion
0x1002f14dd: mov edx, 0x40
0x1002f14e2: mov rdi, r13
0x1002f14e5: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f14ea: movsx edi, byte ptr [rbp - 0x70]
0x1002f14ee: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f14f3: mov byte ptr [rbp - 0x70], al
0x1002f14f6: mov rdx, qword ptr [rip + 0x1afe16b] ; 0x101def668
0x1002f14fd: mov esi, 0x120
0x1002f1502: mov ecx, 0x10
0x1002f1507: mov rdi, r15
0x1002f150a: call 0x100795530 ; 0x100795530
0x1002f150f: vmovaps xmm0, xmmword ptr [rip + 0x7bb949] ; 0x100aace60
0x1002f1517: vmovups xmmword ptr [rax], xmm0
0x1002f151b: mov byte ptr [rax + 0x10], 0
0x1002f151f: mov byte ptr [rax + 0x11], 1
0x1002f1523: mov byte ptr [rax + 0x12], 0
0x1002f1527: mov dword ptr [rax + 0x14], 0
0x1002f152e: mov dword ptr [rax + 0x18], 0
0x1002f1535: vxorps xmm0, xmm0, xmm0
0x1002f1539: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f153e: mov dword ptr [rax + 0x28], 0
0x1002f1545: vmovaps xmm0, xmmword ptr [rip + 0x7c8163] ; 0x100ab96b0
0x1002f154d: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f1552: mov byte ptr [rax + 0x40], 0
0x1002f1556: vxorps ymm0, ymm0, ymm0
0x1002f155a: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f1562: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f1567: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f156c: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f1576: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f1580: vmovaps xmm0, xmmword ptr [rbx]
0x1002f1584: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f158c: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f1594: vxorps xmm0, xmm0, xmm0
0x1002f1598: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f15a0: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f15aa: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f15b2: mov dword ptr [rax + 0xf4], 0
0x1002f15bc: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f15c6: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f15ce: mov dword ptr [rax + 0x10c], 0
0x1002f15d8: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f15e2: mov byte ptr [rax + 0x114], 1
0x1002f15e9: mov dword ptr [rax + 0x118], 0
0x1002f15f3: mov dword ptr [rax + 0x11c], 0
0x1002f15fd: mov qword ptr [rip + 0x1afe784], rax ; 0x101defd88
0x1002f1604: mov rdi, r12
0x1002f1607: mov rsi, rax
0x1002f160a: mov rdx, r13
0x1002f160d: vzeroupper 
0x1002f1610: call 0x100314920 ; 0x100314920
0x1002f1615: lea rsi, [rip + 0x88eec8] ; 0x100b804e4 sparkleAvatar
0x1002f161c: mov edx, 0x40
0x1002f1621: mov rdi, r13
0x1002f1624: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f1629: movsx edi, byte ptr [rbp - 0x70]
0x1002f162d: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f1632: mov byte ptr [rbp - 0x70], al
0x1002f1635: mov rdx, qword ptr [rip + 0x1afe02c] ; 0x101def668
0x1002f163c: mov esi, 0x120
0x1002f1641: mov ecx, 0x10
0x1002f1646: mov rdi, r15
0x1002f1649: call 0x100795530 ; 0x100795530
0x1002f164e: vmovaps xmm0, xmmword ptr [rip + 0x7bb80a] ; 0x100aace60
0x1002f1656: vmovups xmmword ptr [rax], xmm0
0x1002f165a: mov byte ptr [rax + 0x10], 0
0x1002f165e: mov byte ptr [rax + 0x11], 1
0x1002f1662: mov byte ptr [rax + 0x12], 0
0x1002f1666: mov dword ptr [rax + 0x14], 0
0x1002f166d: mov dword ptr [rax + 0x18], 0
0x1002f1674: vxorps xmm0, xmm0, xmm0
0x1002f1678: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f167d: mov dword ptr [rax + 0x28], 0
0x1002f1684: vmovaps xmm0, xmmword ptr [rip + 0x7c8024] ; 0x100ab96b0
0x1002f168c: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f1691: mov byte ptr [rax + 0x40], 0
0x1002f1695: vxorps ymm0, ymm0, ymm0
0x1002f1699: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f16a1: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f16a6: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f16ab: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f16b5: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f16bf: vmovaps xmm0, xmmword ptr [rbx]
0x1002f16c3: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f16cb: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f16d3: vxorps xmm0, xmm0, xmm0
0x1002f16d7: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f16df: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f16e9: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f16f1: mov dword ptr [rax + 0xf4], 0
0x1002f16fb: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f1705: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f170d: mov dword ptr [rax + 0x10c], 0
0x1002f1717: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f1721: mov byte ptr [rax + 0x114], 1
0x1002f1728: mov dword ptr [rax + 0x118], 0
0x1002f1732: mov dword ptr [rax + 0x11c], 0
0x1002f173c: mov qword ptr [rip + 0x1afe64d], rax ; 0x101defd90
0x1002f1743: mov rdi, r12
0x1002f1746: mov rsi, rax
0x1002f1749: mov rdx, r13
0x1002f174c: vzeroupper 
0x1002f174f: call 0x100314920 ; 0x100314920
0x1002f1754: lea rsi, [rip + 0x88ed97] ; 0x100b804f2 avatarUpgrade
0x1002f175b: mov edx, 0x40
0x1002f1760: mov rdi, r13
0x1002f1763: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f1768: movsx edi, byte ptr [rbp - 0x70]
0x1002f176c: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f1771: mov byte ptr [rbp - 0x70], al
0x1002f1774: mov rdx, qword ptr [rip + 0x1afdeed] ; 0x101def668
0x1002f177b: mov esi, 0x120
0x1002f1780: mov ecx, 0x10
0x1002f1785: mov rdi, r15
0x1002f1788: call 0x100795530 ; 0x100795530
0x1002f178d: vmovaps xmm0, xmmword ptr [rip + 0x7bb6cb] ; 0x100aace60
0x1002f1795: vmovups xmmword ptr [rax], xmm0
0x1002f1799: mov byte ptr [rax + 0x10], 0
0x1002f179d: mov byte ptr [rax + 0x11], 1
0x1002f17a1: mov byte ptr [rax + 0x12], 0
0x1002f17a5: mov dword ptr [rax + 0x14], 0
0x1002f17ac: mov dword ptr [rax + 0x18], 0
0x1002f17b3: vxorps xmm0, xmm0, xmm0
0x1002f17b7: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f17bc: mov dword ptr [rax + 0x28], 0
0x1002f17c3: vmovaps xmm0, xmmword ptr [rip + 0x7c7ee5] ; 0x100ab96b0
0x1002f17cb: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f17d0: mov byte ptr [rax + 0x40], 0
0x1002f17d4: vxorps ymm0, ymm0, ymm0
0x1002f17d8: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f17e0: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f17e5: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f17ea: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f17f4: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f17fe: vmovaps xmm0, xmmword ptr [rbx]
0x1002f1802: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f180a: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f1812: vxorps xmm0, xmm0, xmm0
0x1002f1816: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f181e: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f1828: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f1830: mov dword ptr [rax + 0xf4], 0
0x1002f183a: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f1844: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f184c: mov dword ptr [rax + 0x10c], 0
0x1002f1856: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f1860: mov byte ptr [rax + 0x114], 1
0x1002f1867: mov dword ptr [rax + 0x118], 0
0x1002f1871: mov dword ptr [rax + 0x11c], 0
0x1002f187b: mov qword ptr [rip + 0x1afe516], rax ; 0x101defd98
0x1002f1882: mov rdi, r12
0x1002f1885: mov rsi, rax
0x1002f1888: mov rdx, r13
0x1002f188b: vzeroupper 
0x1002f188e: call 0x100314920 ; 0x100314920
0x1002f1893: lea rsi, [rip + 0x88ec66] ; 0x100b80500 metamorphasisVortex
0x1002f189a: mov edx, 0x40
0x1002f189f: mov rdi, r13
0x1002f18a2: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f18a7: movsx edi, byte ptr [rbp - 0x70]
0x1002f18ab: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f18b0: mov byte ptr [rbp - 0x70], al
0x1002f18b3: mov rdx, qword ptr [rip + 0x1afddae] ; 0x101def668
0x1002f18ba: mov esi, 0x120
0x1002f18bf: mov ecx, 0x10
0x1002f18c4: mov rdi, r15
0x1002f18c7: call 0x100795530 ; 0x100795530
0x1002f18cc: vmovaps xmm0, xmmword ptr [rip + 0x7bb58c] ; 0x100aace60
0x1002f18d4: vmovups xmmword ptr [rax], xmm0
0x1002f18d8: mov byte ptr [rax + 0x10], 0
0x1002f18dc: mov byte ptr [rax + 0x11], 1
0x1002f18e0: mov byte ptr [rax + 0x12], 0
0x1002f18e4: mov dword ptr [rax + 0x14], 0
0x1002f18eb: mov dword ptr [rax + 0x18], 0
0x1002f18f2: vxorps xmm0, xmm0, xmm0
0x1002f18f6: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f18fb: mov dword ptr [rax + 0x28], 0
0x1002f1902: vmovaps xmm0, xmmword ptr [rip + 0x7c7da6] ; 0x100ab96b0
0x1002f190a: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f190f: mov byte ptr [rax + 0x40], 0
0x1002f1913: vxorps ymm0, ymm0, ymm0
0x1002f1917: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f191f: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f1924: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f1929: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f1933: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f193d: vmovaps xmm0, xmmword ptr [rbx]
0x1002f1941: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f1949: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f1951: vxorps xmm0, xmm0, xmm0
0x1002f1955: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f195d: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f1967: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f196f: mov dword ptr [rax + 0xf4], 0
0x1002f1979: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f1983: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f198b: mov dword ptr [rax + 0x10c], 0
0x1002f1995: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f199f: mov byte ptr [rax + 0x114], 1
0x1002f19a6: mov dword ptr [rax + 0x118], 0
0x1002f19b0: mov dword ptr [rax + 0x11c], 0
0x1002f19ba: mov qword ptr [rip + 0x1afe3df], rax ; 0x101defda0
0x1002f19c1: mov rdi, r12
0x1002f19c4: mov rsi, rax
0x1002f19c7: mov rdx, r13
0x1002f19ca: vzeroupper 
0x1002f19cd: call 0x100314920 ; 0x100314920
0x1002f19d2: lea rsi, [rip + 0x88eb3b] ; 0x100b80514 metamorphasisSplash
0x1002f19d9: mov edx, 0x40
0x1002f19de: mov rdi, r13
0x1002f19e1: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f19e6: movsx edi, byte ptr [rbp - 0x70]
0x1002f19ea: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f19ef: mov byte ptr [rbp - 0x70], al
0x1002f19f2: mov rdx, qword ptr [rip + 0x1afdc6f] ; 0x101def668
0x1002f19f9: mov esi, 0x120
0x1002f19fe: mov ecx, 0x10
0x1002f1a03: mov rdi, r15
0x1002f1a06: call 0x100795530 ; 0x100795530
0x1002f1a0b: vmovaps xmm0, xmmword ptr [rip + 0x7bb44d] ; 0x100aace60
0x1002f1a13: vmovups xmmword ptr [rax], xmm0
0x1002f1a17: mov byte ptr [rax + 0x10], 0
0x1002f1a1b: mov byte ptr [rax + 0x11], 1
0x1002f1a1f: mov byte ptr [rax + 0x12], 0
0x1002f1a23: mov dword ptr [rax + 0x14], 0
0x1002f1a2a: mov dword ptr [rax + 0x18], 0
0x1002f1a31: vxorps xmm0, xmm0, xmm0
0x1002f1a35: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f1a3a: mov dword ptr [rax + 0x28], 0
0x1002f1a41: vmovaps xmm0, xmmword ptr [rip + 0x7c7c67] ; 0x100ab96b0
0x1002f1a49: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f1a4e: mov byte ptr [rax + 0x40], 0
0x1002f1a52: vxorps ymm0, ymm0, ymm0
0x1002f1a56: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f1a5e: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f1a63: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f1a68: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f1a72: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f1a7c: vmovaps xmm0, xmmword ptr [rbx]
0x1002f1a80: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f1a88: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f1a90: vxorps xmm0, xmm0, xmm0
0x1002f1a94: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f1a9c: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f1aa6: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f1aae: mov dword ptr [rax + 0xf4], 0
0x1002f1ab8: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f1ac2: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f1aca: mov dword ptr [rax + 0x10c], 0
0x1002f1ad4: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f1ade: mov byte ptr [rax + 0x114], 1
0x1002f1ae5: mov dword ptr [rax + 0x118], 0
0x1002f1aef: mov dword ptr [rax + 0x11c], 0
0x1002f1af9: mov qword ptr [rip + 0x1afe2a8], rax ; 0x101defda8
0x1002f1b00: mov rdi, r12
0x1002f1b03: mov rsi, rax
0x1002f1b06: mov rdx, r13
0x1002f1b09: vzeroupper 
0x1002f1b0c: call 0x100314920 ; 0x100314920
0x1002f1b11: lea rsi, [rip + 0x88ea10] ; 0x100b80528 whaleFairy
0x1002f1b18: mov edx, 0x40
0x1002f1b1d: mov rdi, r13
0x1002f1b20: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f1b25: movsx edi, byte ptr [rbp - 0x70]
0x1002f1b29: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f1b2e: mov byte ptr [rbp - 0x70], al
0x1002f1b31: mov rdx, qword ptr [rip + 0x1afdb30] ; 0x101def668
0x1002f1b38: mov esi, 0x120
0x1002f1b3d: mov ecx, 0x10
0x1002f1b42: mov rdi, r15
0x1002f1b45: call 0x100795530 ; 0x100795530
0x1002f1b4a: vmovaps xmm0, xmmword ptr [rip + 0x7bb30e] ; 0x100aace60
0x1002f1b52: vmovups xmmword ptr [rax], xmm0
0x1002f1b56: mov byte ptr [rax + 0x10], 0
0x1002f1b5a: mov byte ptr [rax + 0x11], 1
0x1002f1b5e: mov byte ptr [rax + 0x12], 0
0x1002f1b62: mov dword ptr [rax + 0x14], 0
0x1002f1b69: mov dword ptr [rax + 0x18], 0
0x1002f1b70: vxorps xmm0, xmm0, xmm0
0x1002f1b74: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f1b79: mov dword ptr [rax + 0x28], 0
0x1002f1b80: vmovaps xmm0, xmmword ptr [rip + 0x7c7b28] ; 0x100ab96b0
0x1002f1b88: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f1b8d: mov byte ptr [rax + 0x40], 0
0x1002f1b91: vxorps ymm0, ymm0, ymm0
0x1002f1b95: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f1b9d: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f1ba2: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f1ba7: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f1bb1: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f1bbb: vmovaps xmm0, xmmword ptr [rbx]
0x1002f1bbf: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f1bc7: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f1bcf: vxorps xmm0, xmm0, xmm0
0x1002f1bd3: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f1bdb: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f1be5: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f1bed: mov dword ptr [rax + 0xf4], 0
0x1002f1bf7: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f1c01: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f1c09: mov dword ptr [rax + 0x10c], 0
0x1002f1c13: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f1c1d: mov byte ptr [rax + 0x114], 1
0x1002f1c24: mov dword ptr [rax + 0x118], 0
0x1002f1c2e: mov dword ptr [rax + 0x11c], 0
0x1002f1c38: mov qword ptr [rip + 0x1afe171], rax ; 0x101defdb0
0x1002f1c3f: mov rdi, r12
0x1002f1c42: mov rsi, rax
0x1002f1c45: mov rdx, r13
0x1002f1c48: vzeroupper 
0x1002f1c4b: call 0x100314920 ; 0x100314920
0x1002f1c50: lea rsi, [rip + 0x88e8dc] ; 0x100b80533 meditationFire
0x1002f1c57: mov edx, 0x40
0x1002f1c5c: mov rdi, r13
0x1002f1c5f: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f1c64: movsx edi, byte ptr [rbp - 0x70]
0x1002f1c68: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f1c6d: mov byte ptr [rbp - 0x70], al
0x1002f1c70: mov rdx, qword ptr [rip + 0x1afd9f1] ; 0x101def668
0x1002f1c77: mov esi, 0x120
0x1002f1c7c: mov ecx, 0x10
0x1002f1c81: mov rdi, r15
0x1002f1c84: call 0x100795530 ; 0x100795530
0x1002f1c89: vmovaps xmm0, xmmword ptr [rip + 0x7bb1cf] ; 0x100aace60
0x1002f1c91: vmovups xmmword ptr [rax], xmm0
0x1002f1c95: mov byte ptr [rax + 0x10], 0
0x1002f1c99: mov byte ptr [rax + 0x11], 1
0x1002f1c9d: mov byte ptr [rax + 0x12], 0
0x1002f1ca1: mov dword ptr [rax + 0x14], 0
0x1002f1ca8: mov dword ptr [rax + 0x18], 0
0x1002f1caf: vxorps xmm0, xmm0, xmm0
0x1002f1cb3: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f1cb8: mov dword ptr [rax + 0x28], 0
0x1002f1cbf: vmovaps xmm0, xmmword ptr [rip + 0x7c79e9] ; 0x100ab96b0
0x1002f1cc7: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f1ccc: mov byte ptr [rax + 0x40], 0
0x1002f1cd0: vxorps ymm0, ymm0, ymm0
0x1002f1cd4: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f1cdc: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f1ce1: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f1ce6: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f1cf0: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f1cfa: vmovaps xmm0, xmmword ptr [rbx]
0x1002f1cfe: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f1d06: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f1d0e: vxorps xmm0, xmm0, xmm0
0x1002f1d12: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f1d1a: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f1d24: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f1d2c: mov dword ptr [rax + 0xf4], 0
0x1002f1d36: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f1d40: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f1d48: mov dword ptr [rax + 0x10c], 0
0x1002f1d52: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f1d5c: mov byte ptr [rax + 0x114], 1
0x1002f1d63: mov dword ptr [rax + 0x118], 0
0x1002f1d6d: mov dword ptr [rax + 0x11c], 0
0x1002f1d77: mov qword ptr [rip + 0x1afe03a], rax ; 0x101defdb8
0x1002f1d7e: mov rdi, r12
0x1002f1d81: mov rsi, rax
0x1002f1d84: mov rdx, r13
0x1002f1d87: vzeroupper 
0x1002f1d8a: call 0x100314920 ; 0x100314920
0x1002f1d8f: lea rsi, [rip + 0x88e7ac] ; 0x100b80542 meditationAvatar
0x1002f1d96: mov edx, 0x40
0x1002f1d9b: mov rdi, r13
0x1002f1d9e: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f1da3: movsx edi, byte ptr [rbp - 0x70]
0x1002f1da7: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f1dac: mov byte ptr [rbp - 0x70], al
0x1002f1daf: mov rdx, qword ptr [rip + 0x1afd8b2] ; 0x101def668
0x1002f1db6: mov esi, 0x120
0x1002f1dbb: mov ecx, 0x10
0x1002f1dc0: mov rdi, r15
0x1002f1dc3: call 0x100795530 ; 0x100795530
0x1002f1dc8: vmovaps xmm0, xmmword ptr [rip + 0x7bb090] ; 0x100aace60
0x1002f1dd0: vmovups xmmword ptr [rax], xmm0
0x1002f1dd4: mov byte ptr [rax + 0x10], 0
0x1002f1dd8: mov byte ptr [rax + 0x11], 1
0x1002f1ddc: mov byte ptr [rax + 0x12], 0
0x1002f1de0: mov dword ptr [rax + 0x14], 0
0x1002f1de7: mov dword ptr [rax + 0x18], 0
0x1002f1dee: vxorps xmm0, xmm0, xmm0
0x1002f1df2: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f1df7: mov dword ptr [rax + 0x28], 0
0x1002f1dfe: vmovaps xmm0, xmmword ptr [rip + 0x7c78aa] ; 0x100ab96b0
0x1002f1e06: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f1e0b: mov byte ptr [rax + 0x40], 0
0x1002f1e0f: vxorps ymm0, ymm0, ymm0
0x1002f1e13: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f1e1b: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f1e20: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f1e25: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f1e2f: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f1e39: vmovaps xmm0, xmmword ptr [rbx]
0x1002f1e3d: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f1e45: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f1e4d: vxorps xmm0, xmm0, xmm0
0x1002f1e51: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f1e59: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f1e63: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f1e6b: mov dword ptr [rax + 0xf4], 0
0x1002f1e75: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f1e7f: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f1e87: mov dword ptr [rax + 0x10c], 0
0x1002f1e91: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f1e9b: mov byte ptr [rax + 0x114], 1
0x1002f1ea2: mov dword ptr [rax + 0x118], 0
0x1002f1eac: mov dword ptr [rax + 0x11c], 0
0x1002f1eb6: mov qword ptr [rip + 0x1afdf03], rax ; 0x101defdc0
0x1002f1ebd: mov rdi, r12
0x1002f1ec0: mov rsi, rax
0x1002f1ec3: mov rdx, r13
0x1002f1ec6: vzeroupper 
0x1002f1ec9: call 0x100314920 ; 0x100314920
0x1002f1ece: lea rsi, [rip + 0x88e67e] ; 0x100b80553 smokeMonster
0x1002f1ed5: mov edx, 0x40
0x1002f1eda: mov rdi, r13
0x1002f1edd: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f1ee2: movsx edi, byte ptr [rbp - 0x70]
0x1002f1ee6: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f1eeb: mov byte ptr [rbp - 0x70], al
0x1002f1eee: mov rdx, qword ptr [rip + 0x1afd773] ; 0x101def668
0x1002f1ef5: mov esi, 0x120
0x1002f1efa: mov ecx, 0x10
0x1002f1eff: mov rdi, r15
0x1002f1f02: call 0x100795530 ; 0x100795530
0x1002f1f07: vmovaps xmm0, xmmword ptr [rip + 0x7baf51] ; 0x100aace60
0x1002f1f0f: vmovups xmmword ptr [rax], xmm0
0x1002f1f13: mov byte ptr [rax + 0x10], 0
0x1002f1f17: mov byte ptr [rax + 0x11], 1
0x1002f1f1b: mov byte ptr [rax + 0x12], 0
0x1002f1f1f: mov dword ptr [rax + 0x14], 0
0x1002f1f26: mov dword ptr [rax + 0x18], 0
0x1002f1f2d: vxorps xmm0, xmm0, xmm0
0x1002f1f31: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f1f36: mov dword ptr [rax + 0x28], 0
0x1002f1f3d: vmovaps xmm0, xmmword ptr [rip + 0x7c776b] ; 0x100ab96b0
0x1002f1f45: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f1f4a: mov byte ptr [rax + 0x40], 0
0x1002f1f4e: vxorps ymm0, ymm0, ymm0
0x1002f1f52: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f1f5a: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f1f5f: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f1f64: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f1f6e: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f1f78: vmovaps xmm0, xmmword ptr [rbx]
0x1002f1f7c: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f1f84: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f1f8c: vxorps xmm0, xmm0, xmm0
0x1002f1f90: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f1f98: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f1fa2: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f1faa: mov dword ptr [rax + 0xf4], 0
0x1002f1fb4: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f1fbe: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f1fc6: mov dword ptr [rax + 0x10c], 0
0x1002f1fd0: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f1fda: mov byte ptr [rax + 0x114], 1
0x1002f1fe1: mov dword ptr [rax + 0x118], 0
0x1002f1feb: mov dword ptr [rax + 0x11c], 0
0x1002f1ff5: mov qword ptr [rip + 0x1afddcc], rax ; 0x101defdc8
0x1002f1ffc: mov rdi, r12
0x1002f1fff: mov rsi, rax
0x1002f2002: mov rdx, r13
0x1002f2005: vzeroupper 
0x1002f2008: call 0x100314920 ; 0x100314920
0x1002f200d: lea rsi, [rip + 0x88e54c] ; 0x100b80560 testBed
0x1002f2014: mov edx, 0x40
0x1002f2019: mov rdi, r13
0x1002f201c: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f2021: movsx edi, byte ptr [rbp - 0x70]
0x1002f2025: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f202a: mov byte ptr [rbp - 0x70], al
0x1002f202d: mov rdx, qword ptr [rip + 0x1afd634] ; 0x101def668
0x1002f2034: mov esi, 0x120
0x1002f2039: mov ecx, 0x10
0x1002f203e: mov rdi, r15
0x1002f2041: call 0x100795530 ; 0x100795530
0x1002f2046: vmovaps xmm0, xmmword ptr [rip + 0x7bae12] ; 0x100aace60
0x1002f204e: vmovups xmmword ptr [rax], xmm0
0x1002f2052: mov byte ptr [rax + 0x10], 0
0x1002f2056: mov byte ptr [rax + 0x11], 1
0x1002f205a: mov byte ptr [rax + 0x12], 0
0x1002f205e: mov dword ptr [rax + 0x14], 0
0x1002f2065: mov dword ptr [rax + 0x18], 0
0x1002f206c: vxorps xmm0, xmm0, xmm0
0x1002f2070: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f2075: mov dword ptr [rax + 0x28], 0
0x1002f207c: vmovaps xmm0, xmmword ptr [rip + 0x7c762c] ; 0x100ab96b0
0x1002f2084: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f2089: mov byte ptr [rax + 0x40], 0
0x1002f208d: vxorps ymm0, ymm0, ymm0
0x1002f2091: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f2099: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f209e: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f20a3: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f20ad: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f20b7: vmovaps xmm0, xmmword ptr [rbx]
0x1002f20bb: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f20c3: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f20cb: vxorps xmm0, xmm0, xmm0
0x1002f20cf: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f20d7: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f20e1: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f20e9: mov dword ptr [rax + 0xf4], 0
0x1002f20f3: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f20fd: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f2105: mov dword ptr [rax + 0x10c], 0
0x1002f210f: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f2119: mov byte ptr [rax + 0x114], 1
0x1002f2120: mov dword ptr [rax + 0x118], 0
0x1002f212a: mov dword ptr [rax + 0x11c], 0
0x1002f2134: mov qword ptr [rip + 0x1afdc95], rax ; 0x101defdd0
0x1002f213b: mov rdi, r12
0x1002f213e: mov rsi, rax
0x1002f2141: mov rdx, r13
0x1002f2144: vzeroupper 
0x1002f2147: call 0x100314920 ; 0x100314920
0x1002f214c: lea rsi, [rip + 0x88e415] ; 0x100b80568 decalSparks
0x1002f2153: mov edx, 0x40
0x1002f2158: mov rdi, r13
0x1002f215b: call 0x100aa2c90 ; 0x100aa2c90 _strncpy
0x1002f2160: movsx edi, byte ptr [rbp - 0x70]
0x1002f2164: call 0x100aa2528 ; 0x100aa2528 ___toupper
0x1002f2169: mov byte ptr [rbp - 0x70], al
0x1002f216c: mov rdx, qword ptr [rip + 0x1afd4f5] ; 0x101def668
0x1002f2173: mov esi, 0x120
0x1002f2178: mov ecx, 0x10
0x1002f217d: mov rdi, r15
0x1002f2180: call 0x100795530 ; 0x100795530
0x1002f2185: vmovaps xmm0, xmmword ptr [rip + 0x7bacd3] ; 0x100aace60
0x1002f218d: vmovups xmmword ptr [rax], xmm0
0x1002f2191: mov byte ptr [rax + 0x10], 0
0x1002f2195: mov byte ptr [rax + 0x11], 1
0x1002f2199: mov byte ptr [rax + 0x12], 0
0x1002f219d: mov dword ptr [rax + 0x14], 0
0x1002f21a4: mov dword ptr [rax + 0x18], 0
0x1002f21ab: vxorps xmm0, xmm0, xmm0
0x1002f21af: vmovlps qword ptr [rax + 0x20], xmm0
0x1002f21b4: mov dword ptr [rax + 0x28], 0
0x1002f21bb: vmovaps xmm0, xmmword ptr [rip + 0x7c74ed] ; 0x100ab96b0
0x1002f21c3: vmovups xmmword ptr [rax + 0x30], xmm0
0x1002f21c8: mov byte ptr [rax + 0x40], 0
0x1002f21cc: vxorps ymm0, ymm0, ymm0
0x1002f21d0: vmovups ymmword ptr [rax + 0x84], ymm0
0x1002f21d8: vmovups ymmword ptr [rax + 0x64], ymm0
0x1002f21dd: vmovups ymmword ptr [rax + 0x44], ymm0
0x1002f21e2: mov dword ptr [rax + 0xa4], 0x40600000
0x1002f21ec: mov dword ptr [rax + 0xa8], 0x40d00000
0x1002f21f6: vmovaps xmm0, xmmword ptr [rbx]
0x1002f21fa: vmovaps xmmword ptr [rax + 0xb0], xmm0
0x1002f2202: vmovaps xmmword ptr [rax + 0xc0], xmm0
0x1002f220a: vxorps xmm0, xmm0, xmm0
0x1002f220e: vmovaps xmmword ptr [rax + 0xd0], xmm0
0x1002f2216: mov dword ptr [rax + 0xe0], 0x3f800000
0x1002f2220: vmovups xmmword ptr [rax + 0xe4], xmm0
0x1002f2228: vxorps xmm0, xmm0, xmm0
0x1002f222c: mov dword ptr [rax + 0xf4], 0
0x1002f2236: mov dword ptr [rax + 0xf8], 0x3f800000
0x1002f2240: vmovups xmmword ptr [rax + 0xfc], xmm0
0x1002f2248: mov dword ptr [rax + 0x10c], 0
0x1002f2252: mov dword ptr [rax + 0x110], 0x3f800000
0x1002f225c: mov byte ptr [rax + 0x114], 1
0x1002f2263: mov dword ptr [rax + 0x118], 0
0x1002f226d: mov dword ptr [rax + 0x11c], 0
0x1002f2277: mov qword ptr [rip + 0x1afdb5a], rax ; 0x101defdd8
0x1002f227e: mov rdi, r12
0x1002f2281: mov rsi, rax
0x1002f2284: mov rdx, r13
0x1002f2287: vzeroupper 
0x1002f228a: call 0x100314920 ; 0x100314920
0x1002f228f: mov rax, qword ptr [rip + 0x91b642] ; 0x100c0d8d8
0x1002f2296: mov rax, qword ptr [rax]
0x1002f2299: cmp rax, qword ptr [rbp - 0x30]
0x1002f229d: jne 0x1002f22ae
0x1002f229f: add rsp, 0x48
0x1002f22a3: pop rbx
0x1002f22a4: pop r12
0x1002f22a6: pop r13
0x1002f22a8: pop r14
0x1002f22aa: pop r15
0x1002f22ac: pop rbp
0x1002f22ad: ret 
0x1002f22ae: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1002f22b3: nop word ptr cs:[rax + rax]
