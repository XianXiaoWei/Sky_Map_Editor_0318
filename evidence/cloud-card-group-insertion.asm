0x100223d00: push rbp
0x100223d01: mov rbp, rsp
0x100223d04: push r15
0x100223d06: push r14
0x100223d08: push r12
0x100223d0a: push rbx
0x100223d0b: sub rsp, 0x40
0x100223d0f: mov r14, rsi
0x100223d12: mov rbx, rdi
0x100223d15: mov rax, qword ptr [rip + 0x9e9bbc] ; 0x100c0d8d8
0x100223d1c: mov rax, qword ptr [rax]
0x100223d1f: mov qword ptr [rbp - 0x28], rax
0x100223d23: mov rax, r14
0x100223d26: sub rax, rbx
0x100223d29: sar rax, 7
0x100223d2d: cmp rax, 5
0x100223d31: ja 0x100223dfb
0x100223d37: lea rcx, [rip + 0x536] ; 0x100224274
0x100223d3e: movsxd rdx, dword ptr [rcx + rax*4]
0x100223d42: add rdx, rcx
0x100223d45: mov al, 1
0x100223d47: jmp rdx
0x100223d49: mov eax, dword ptr [r14 - 0x60]
0x100223d4d: cmp eax, dword ptr [rbx + 0x20]
0x100223d50: jae 0x100224248
0x100223d56: mov eax, dword ptr [rbx + 0x20]
0x100223d59: mov dword ptr [rbp - 0x40], eax
0x100223d5c: vmovups ymm0, ymmword ptr [rbx]
0x100223d60: vmovups ymmword ptr [rbp - 0x60], ymm0
0x100223d65: vmovaps xmm0, xmmword ptr [rbx + 0x30]
0x100223d6a: vmovaps xmm1, xmmword ptr [rbx + 0x40]
0x100223d6f: vmovaps xmm2, xmmword ptr [rbx + 0x50]
0x100223d74: vmovaps xmm3, xmmword ptr [rbx + 0x60]
0x100223d79: vmovaps xmm4, xmmword ptr [rbx + 0x70]
0x100223d7e: mov eax, dword ptr [r14 - 0x60]
0x100223d82: mov dword ptr [rbx + 0x20], eax
0x100223d85: vmovups ymm5, ymmword ptr [r14 - 0x80]
0x100223d8b: vmovups ymmword ptr [rbx], ymm5
0x100223d8f: vmovaps xmm5, xmmword ptr [r14 - 0x50]
0x100223d95: vmovaps xmmword ptr [rbx + 0x30], xmm5
0x100223d9a: vmovaps xmm5, xmmword ptr [r14 - 0x40]
0x100223da0: vmovaps xmmword ptr [rbx + 0x40], xmm5
0x100223da5: vmovaps xmm5, xmmword ptr [r14 - 0x30]
0x100223dab: vmovaps xmmword ptr [rbx + 0x50], xmm5
0x100223db0: vmovaps xmm5, xmmword ptr [r14 - 0x20]
0x100223db6: vmovaps xmmword ptr [rbx + 0x60], xmm5
0x100223dbb: vmovaps xmm5, xmmword ptr [r14 - 0x10]
0x100223dc1: vmovaps xmmword ptr [rbx + 0x70], xmm5
0x100223dc6: mov eax, dword ptr [rbp - 0x40]
0x100223dc9: mov dword ptr [r14 - 0x60], eax
0x100223dcd: vmovups ymm5, ymmword ptr [rbp - 0x60]
0x100223dd2: vmovups ymmword ptr [r14 - 0x80], ymm5
0x100223dd8: vmovaps xmmword ptr [r14 - 0x50], xmm0
0x100223dde: vmovaps xmmword ptr [r14 - 0x40], xmm1
0x100223de4: vmovaps xmmword ptr [r14 - 0x30], xmm2
0x100223dea: vmovaps xmmword ptr [r14 - 0x20], xmm3
0x100223df0: vmovaps xmmword ptr [r14 - 0x10], xmm4
0x100223df6: jmp 0x100224248 ; 0x100224248
0x100223dfb: lea r15, [rbx + 0x100]
0x100223e02: mov rsi, rbx
0x100223e05: sub rsi, -0x80
0x100223e09: mov rdi, rbx
0x100223e0c: mov rdx, r15
0x100223e0f: call 0x100223420 ; 0x100223420
0x100223e14: lea rax, [rbx + 0x180]
0x100223e1b: cmp rax, r14
0x100223e1e: je 0x100224248
0x100223e24: xor ecx, ecx
0x100223e26: xor edx, edx
0x100223e28: nop dword ptr [rax + rax]
0x100223e30: mov rsi, r15
0x100223e33: mov r15, rax
0x100223e36: mov eax, dword ptr [r15 + 0x20]
0x100223e3a: cmp eax, dword ptr [rsi + 0x20]
0x100223e3d: jae 0x100223f79
0x100223e43: vmovups ymm0, ymmword ptr [r15]
0x100223e48: vmovups ymmword ptr [rbp - 0x60], ymm0
0x100223e4d: vmovaps xmm0, xmmword ptr [r15 + 0x30]
0x100223e53: vmovaps xmm1, xmmword ptr [r15 + 0x40]
0x100223e59: vmovaps xmm2, xmmword ptr [r15 + 0x50]
0x100223e5f: vmovaps xmm3, xmmword ptr [r15 + 0x60]
0x100223e65: vmovaps xmm4, xmmword ptr [r15 + 0x70]
0x100223e6b: mov rdi, rcx
0x100223e6e: nop 
0x100223e70: mov rsi, rdi
0x100223e73: mov edi, dword ptr [rbx + rsi + 0x120]
0x100223e7a: mov dword ptr [rbx + rsi + 0x1a0], edi
0x100223e81: vmovups ymm5, ymmword ptr [rbx + rsi + 0x100]
0x100223e8a: vmovups ymmword ptr [rbx + rsi + 0x180], ymm5
0x100223e93: vmovaps xmm5, xmmword ptr [rbx + rsi + 0x130]
0x100223e9c: vmovaps xmmword ptr [rbx + rsi + 0x1b0], xmm5
0x100223ea5: vmovaps xmm5, xmmword ptr [rbx + rsi + 0x140]
0x100223eae: vmovaps xmmword ptr [rbx + rsi + 0x1c0], xmm5
0x100223eb7: vmovaps xmm5, xmmword ptr [rbx + rsi + 0x150]
0x100223ec0: vmovaps xmmword ptr [rbx + rsi + 0x1d0], xmm5
0x100223ec9: vmovaps xmm5, xmmword ptr [rbx + rsi + 0x160]
0x100223ed2: vmovaps xmmword ptr [rbx + rsi + 0x1e0], xmm5
0x100223edb: vmovaps xmm5, xmmword ptr [rbx + rsi + 0x170]
0x100223ee4: vmovaps xmmword ptr [rbx + rsi + 0x1f0], xmm5
0x100223eed: cmp rsi, -0x100
0x100223ef4: je 0x100223f20
0x100223ef6: lea rdi, [rsi - 0x80]
0x100223efa: cmp eax, dword ptr [rbx + rsi + 0xa0]
0x100223f01: jb 0x100223e70
0x100223f07: lea rdi, [rbx + rdi + 0x180]
0x100223f0f: jmp 0x100223f23 ; 0x100223f23
0x100223f11: nop word ptr cs:[rax + rax]
0x100223f20: mov rdi, rbx
0x100223f23: vmovups ymm5, ymmword ptr [rbp - 0x60]
0x100223f28: vmovups ymmword ptr [rbx + rsi + 0x100], ymm5
0x100223f31: mov dword ptr [rdi + 0x20], eax
0x100223f34: vmovaps xmmword ptr [rbx + rsi + 0x130], xmm0
0x100223f3d: vmovaps xmmword ptr [rbx + rsi + 0x140], xmm1
0x100223f46: vmovaps xmmword ptr [rbx + rsi + 0x150], xmm2
0x100223f4f: vmovaps xmmword ptr [rbx + rsi + 0x160], xmm3
0x100223f58: vmovaps xmmword ptr [rbx + rsi + 0x170], xmm4
0x100223f61: inc edx
0x100223f63: mov rax, r15
0x100223f66: sub rax, -0x80
0x100223f6a: cmp rax, r14
0x100223f6d: sete al
0x100223f70: cmp edx, 8
0x100223f73: je 0x10022424a
0x100223f79: mov rax, r15
0x100223f7c: sub rax, -0x80
0x100223f80: sub rcx, -0x80
0x100223f84: cmp rax, r14
0x100223f87: jne 0x100223e30
0x100223f8d: jmp 0x100224248 ; 0x100224248
0x100223f92: mov rsi, rbx
0x100223f95: sub rsi, -0x80
0x100223f99: add r14, -0x80
0x100223f9d: mov rdi, rbx
0x100223fa0: mov rdx, r14
0x100223fa3: call 0x100223420 ; 0x100223420
0x100223fa8: jmp 0x100224248 ; 0x100224248
0x100223fad: mov r15, rbx
0x100223fb0: sub r15, -0x80
0x100223fb4: lea r12, [rbx + 0x100]
0x100223fbb: mov rdi, rbx
0x100223fbe: mov rsi, r15
0x100223fc1: mov rdx, r12
0x100223fc4: call 0x100223420 ; 0x100223420
0x100223fc9: mov eax, dword ptr [r14 - 0x60]
0x100223fcd: cmp eax, dword ptr [rbx + 0x120]
0x100223fd3: jae 0x100224248
0x100223fd9: mov eax, dword ptr [r12 + 0x20]
0x100223fde: mov dword ptr [rbp - 0x40], eax
0x100223fe1: vmovups ymm0, ymmword ptr [r12]
0x100223fe7: vmovups ymmword ptr [rbp - 0x60], ymm0
0x100223fec: vmovaps xmm0, xmmword ptr [rbx + 0x130]
0x100223ff4: vmovaps xmm1, xmmword ptr [rbx + 0x140]
0x100223ffc: vmovaps xmm2, xmmword ptr [rbx + 0x150]
0x100224004: vmovaps xmm3, xmmword ptr [rbx + 0x160]
0x10022400c: vmovaps xmm4, xmmword ptr [rbx + 0x170]
0x100224014: mov eax, dword ptr [r14 - 0x60]
0x100224018: mov dword ptr [r12 + 0x20], eax
0x10022401d: vmovups ymm5, ymmword ptr [r14 - 0x80]
0x100224023: vmovups ymmword ptr [r12], ymm5
0x100224029: vmovaps xmm5, xmmword ptr [r14 - 0x50]
0x10022402f: vmovaps xmmword ptr [rbx + 0x130], xmm5
0x100224037: vmovaps xmm5, xmmword ptr [r14 - 0x40]
0x10022403d: vmovaps xmmword ptr [rbx + 0x140], xmm5
0x100224045: vmovaps xmm5, xmmword ptr [r14 - 0x30]
0x10022404b: vmovaps xmmword ptr [rbx + 0x150], xmm5
0x100224053: vmovaps xmm5, xmmword ptr [r14 - 0x20]
0x100224059: vmovaps xmmword ptr [rbx + 0x160], xmm5
0x100224061: vmovaps xmm5, xmmword ptr [r14 - 0x10]
0x100224067: vmovaps xmmword ptr [rbx + 0x170], xmm5
0x10022406f: mov eax, dword ptr [rbp - 0x40]
0x100224072: mov dword ptr [r14 - 0x60], eax
0x100224076: vmovups ymm5, ymmword ptr [rbp - 0x60]
0x10022407b: vmovups ymmword ptr [r14 - 0x80], ymm5
0x100224081: vmovaps xmmword ptr [r14 - 0x50], xmm0
0x100224087: vmovaps xmmword ptr [r14 - 0x40], xmm1
0x10022408d: vmovaps xmmword ptr [r14 - 0x30], xmm2
0x100224093: vmovaps xmmword ptr [r14 - 0x20], xmm3
0x100224099: vmovaps xmmword ptr [r14 - 0x10], xmm4
0x10022409f: mov eax, dword ptr [rbx + 0x120]
0x1002240a5: cmp eax, dword ptr [rbx + 0xa0]
0x1002240ab: jae 0x100224248
0x1002240b1: mov eax, dword ptr [r15 + 0x20]
0x1002240b5: mov dword ptr [rbp - 0x40], eax
0x1002240b8: vmovups ymm0, ymmword ptr [r15]
0x1002240bd: vmovups ymmword ptr [rbp - 0x60], ymm0
0x1002240c2: vmovaps xmm5, xmmword ptr [rbx + 0xb0]
0x1002240ca: vmovaps xmm6, xmmword ptr [rbx + 0xc0]
0x1002240d2: vmovaps xmm7, xmmword ptr [rbx + 0xd0]
0x1002240da: vmovaps xmm0, xmmword ptr [rbx + 0xe0]
0x1002240e2: vmovaps xmm1, xmmword ptr [rbx + 0xf0]
0x1002240ea: mov eax, dword ptr [r12 + 0x20]
0x1002240ef: mov dword ptr [r15 + 0x20], eax
0x1002240f3: vmovups ymm2, ymmword ptr [r12]
0x1002240f9: vmovups ymmword ptr [r15], ymm2
0x1002240fe: vmovaps xmm8, xmmword ptr [rbx + 0x130]
0x100224106: vmovaps xmm9, xmmword ptr [rbx + 0x140]
0x10022410e: vmovaps xmm2, xmmword ptr [rbx + 0x150]
0x100224116: vmovaps xmm3, xmmword ptr [rbx + 0x160]
0x10022411e: vmovaps xmmword ptr [rbx + 0xb0], xmm8
0x100224126: vmovaps xmmword ptr [rbx + 0xc0], xmm9
0x10022412e: vmovaps xmmword ptr [rbx + 0xd0], xmm2
0x100224136: vmovaps xmmword ptr [rbx + 0xe0], xmm3
0x10022413e: vmovaps xmm4, xmmword ptr [rbx + 0x170]
0x100224146: vmovaps xmmword ptr [rbx + 0xf0], xmm4
0x10022414e: mov eax, dword ptr [rbp - 0x40]
0x100224151: mov dword ptr [r12 + 0x20], eax
0x100224156: vmovups ymm10, ymmword ptr [rbp - 0x60]
0x10022415b: vmovups ymmword ptr [r12], ymm10
0x100224161: vmovaps xmmword ptr [rbx + 0x130], xmm5
0x100224169: vmovaps xmmword ptr [rbx + 0x140], xmm6
0x100224171: vmovaps xmmword ptr [rbx + 0x150], xmm7
0x100224179: vmovaps xmmword ptr [rbx + 0x160], xmm0
0x100224181: vmovaps xmmword ptr [rbx + 0x170], xmm1
0x100224189: mov eax, dword ptr [rbx + 0xa0]
0x10022418f: cmp eax, dword ptr [rbx + 0x20]
0x100224192: jae 0x100224248
0x100224198: mov eax, dword ptr [rbx + 0x20]
0x10022419b: mov dword ptr [rbp - 0x40], eax
0x10022419e: vmovups ymm0, ymmword ptr [rbx]
0x1002241a2: vmovups ymmword ptr [rbp - 0x60], ymm0
0x1002241a7: vmovaps xmm0, xmmword ptr [rbx + 0x30]
0x1002241ac: vmovaps xmm1, xmmword ptr [rbx + 0x40]
0x1002241b1: vmovaps xmm5, xmmword ptr [rbx + 0x50]
0x1002241b6: vmovaps xmm6, xmmword ptr [rbx + 0x60]
0x1002241bb: vmovaps xmm7, xmmword ptr [rbx + 0x70]
0x1002241c0: vmovups ymm10, ymmword ptr [r15]
0x1002241c5: vmovups ymmword ptr [rbx], ymm10
0x1002241c9: mov eax, dword ptr [r15 + 0x20]
0x1002241cd: mov dword ptr [rbx + 0x20], eax
0x1002241d0: vmovaps xmmword ptr [rbx + 0x30], xmm8
0x1002241d5: vmovaps xmmword ptr [rbx + 0x40], xmm9
0x1002241da: vmovaps xmmword ptr [rbx + 0x50], xmm2
0x1002241df: vmovaps xmmword ptr [rbx + 0x60], xmm3
0x1002241e4: vmovaps xmmword ptr [rbx + 0x70], xmm4
0x1002241e9: mov eax, dword ptr [rbp - 0x40]
0x1002241ec: mov dword ptr [r15 + 0x20], eax
0x1002241f0: vmovups ymm2, ymmword ptr [rbp - 0x60]
0x1002241f5: vmovups ymmword ptr [r15], ymm2
0x1002241fa: vmovaps xmmword ptr [rbx + 0xb0], xmm0
0x100224202: vmovaps xmmword ptr [rbx + 0xc0], xmm1
0x10022420a: vmovaps xmmword ptr [rbx + 0xd0], xmm5
0x100224212: vmovaps xmmword ptr [rbx + 0xe0], xmm6
0x10022421a: vmovaps xmmword ptr [rbx + 0xf0], xmm7
0x100224222: jmp 0x100224248 ; 0x100224248
0x100224224: mov rsi, rbx
0x100224227: sub rsi, -0x80
0x10022422b: lea rcx, [rbx + 0x180]
0x100224232: add r14, -0x80
0x100224236: lea rdx, [rbx + 0x100]
0x10022423d: mov rdi, rbx
0x100224240: mov r8, r14
0x100224243: call 0x100223740 ; 0x100223740
0x100224248: mov al, 1
0x10022424a: mov rcx, qword ptr [rip + 0x9e9687] ; 0x100c0d8d8
0x100224251: mov rcx, qword ptr [rcx]
0x100224254: cmp rcx, qword ptr [rbp - 0x28]
0x100224258: jne 0x10022426a
0x10022425a: add rsp, 0x40
0x10022425e: pop rbx
0x10022425f: pop r12
0x100224261: pop r14
0x100224263: pop r15
0x100224265: pop rbp
0x100224266: vzeroupper 
0x100224269: ret 
0x10022426a: vzeroupper 
0x10022426d: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100224272: nop 
