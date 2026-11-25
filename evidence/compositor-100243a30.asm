0x100243a30: push rbp
0x100243a31: mov rbp, rsp
0x100243a34: push r15
0x100243a36: push r14
0x100243a38: push r13
0x100243a3a: push r12
0x100243a3c: push rbx
0x100243a3d: sub rsp, 0x68
0x100243a41: mov dword ptr [rbp - 0x48], r8d
0x100243a45: mov r13, rsi
0x100243a48: mov r12, rdi
0x100243a4b: mov dword ptr [rbp - 0x44], edx
0x100243a4e: mov eax, edx
0x100243a50: vcvtsi2ss xmm0, xmm0, rax
0x100243a55: vmovss xmm1, dword ptr [r12 + 0x30]
0x100243a5c: vucomiss xmm1, xmm0
0x100243a60: jne 0x100243a8f
0x100243a62: jp 0x100243a8f
0x100243a64: mov eax, ecx
0x100243a66: vcvtsi2ss xmm0, xmm2, rax
0x100243a6b: vcmpeqss xmm0, xmm0, dword ptr [r12 + 0x34]
0x100243a73: vmovd eax, xmm0
0x100243a77: and eax, 1
0x100243a7a: mov dword ptr [rbp - 0x3c], eax
0x100243a7d: mov r14d, dword ptr [r13 + 0x1688c]
0x100243a84: cmp r14d, 2
0x100243a88: jae 0x100243aa7
0x100243a8a: jmp 0x100243df7 ; 0x100243df7
0x100243a8f: mov dword ptr [rbp - 0x3c], 0
0x100243a96: mov r14d, dword ptr [r13 + 0x1688c]
0x100243a9d: cmp r14d, 2
0x100243aa1: jb 0x100243df7
0x100243aa7: mov dword ptr [rbp - 0x40], ecx
0x100243aaa: mov ebx, 1
0x100243aaf: mov qword ptr [rbp - 0x78], r13
0x100243ab3: mov qword ptr [rbp - 0x70], r12
0x100243ab7: nop word ptr [rax + rax]
0x100243ac0: mov ebx, ebx
0x100243ac2: lea r11, [rbx + rbx*2]
0x100243ac6: shl r11, 4
0x100243aca: lea r10, [r13 + r11 + 0x16890]
0x100243ad2: cmp byte ptr [rbp - 0x48], 0
0x100243ad6: mov qword ptr [rbp - 0x58], rbx
0x100243ada: jne 0x100243c30
0x100243ae0: cmp byte ptr [rbp - 0x3c], 0
0x100243ae4: je 0x100243c30
0x100243aea: lea rsi, [r12 + r11 + 0x16a60]
0x100243af2: movzx r8d, byte ptr [r10]
0x100243af6: mov rcx, rbx
0x100243af9: shl rcx, 4
0x100243afd: mov rax, r8
0x100243b00: shr rax, 1
0x100243b03: test r8b, 1
0x100243b07: lea r15, [rcx + rcx*2]
0x100243b0b: mov rdx, qword ptr [r13 + r15 + 0x16898]
0x100243b13: cmove rdx, rax
0x100243b17: movzx r9d, byte ptr [rsi]
0x100243b1b: mov rcx, r9
0x100243b1e: shr rcx, 1
0x100243b21: test r9b, 1
0x100243b25: cmovne rcx, qword ptr [r12 + r15 + 0x16a68]
0x100243b2e: cmp rdx, rcx
0x100243b31: jne 0x100243c30
0x100243b37: lea rcx, [r10 + 1]
0x100243b3b: and r8b, 1
0x100243b3f: mov rdi, qword ptr [r13 + r15 + 0x168a0]
0x100243b47: cmove rdi, rcx
0x100243b4b: inc rsi
0x100243b4e: test r9b, 1
0x100243b52: cmovne rsi, qword ptr [r12 + r15 + 0x16a70]
0x100243b5b: test r8b, r8b
0x100243b5e: jne 0x100243b88
0x100243b60: test rdx, rdx
0x100243b63: je 0x100243bac
0x100243b65: neg rax
0x100243b68: nop dword ptr [rax + rax]
0x100243b70: movzx edx, byte ptr [rcx]
0x100243b73: cmp dl, byte ptr [rsi]
0x100243b75: jne 0x100243c30
0x100243b7b: inc rcx
0x100243b7e: inc rsi
0x100243b81: inc rax
0x100243b84: jne 0x100243b70
0x100243b86: jmp 0x100243bac ; 0x100243bac
0x100243b88: test rdx, rdx
0x100243b8b: je 0x100243bac
0x100243b8d: mov rbx, r10
0x100243b90: mov qword ptr [rbp - 0x38], r11
0x100243b94: call 0x100aa28ee ; 0x100aa28ee _memcmp
0x100243b99: mov r11, qword ptr [rbp - 0x38]
0x100243b9d: mov r10, rbx
0x100243ba0: mov rbx, qword ptr [rbp - 0x58]
0x100243ba4: test eax, eax
0x100243ba6: jne 0x100243c30
0x100243bac: mov eax, dword ptr [r13 + r15 + 0x168a8]
0x100243bb4: cmp eax, dword ptr [r12 + r15 + 0x16a78]
0x100243bbc: jne 0x100243c30
0x100243bbe: mov eax, dword ptr [r13 + r15 + 0x168ac]
0x100243bc6: cmp eax, dword ptr [r12 + r15 + 0x16a7c]
0x100243bce: jne 0x100243c30
0x100243bd0: mov eax, dword ptr [r13 + r15 + 0x168b4]
0x100243bd8: cmp eax, dword ptr [r12 + r15 + 0x16a84]
0x100243be0: jne 0x100243c30
0x100243be2: mov al, byte ptr [r13 + r15 + 0x168b9]
0x100243bea: cmp al, byte ptr [r12 + r15 + 0x16a89]
0x100243bf2: jne 0x100243c30
0x100243bf4: mov al, byte ptr [r13 + r15 + 0x168ba]
0x100243bfc: cmp al, byte ptr [r12 + r15 + 0x16a8a]
0x100243c04: jne 0x100243c30
0x100243c06: mov al, byte ptr [r13 + r15 + 0x168b8]
0x100243c0e: cmp al, byte ptr [r12 + r15 + 0x16a88]
0x100243c16: jne 0x100243c30
0x100243c18: mov al, byte ptr [r13 + r15 + 0x168bb]
0x100243c20: cmp al, byte ptr [r12 + r15 + 0x16a8b]
0x100243c28: je 0x100243dec
0x100243c2e: nop 
0x100243c30: cmp byte ptr [r13 + r11 + 0x168ba], 0
0x100243c39: mov ecx, dword ptr [r13 + r11 + 0x168a8]
0x100243c41: je 0x100243c50
0x100243c43: mov r8d, ecx
0x100243c46: jmp 0x100243c7b ; 0x100243c7b
0x100243c48: nop dword ptr [rax + rax]
0x100243c50: xor edx, edx
0x100243c52: mov esi, dword ptr [rbp - 0x44]
0x100243c55: mov eax, esi
0x100243c57: div ecx
0x100243c59: mov edi, eax
0x100243c5b: cmp ecx, esi
0x100243c5d: mov r9d, 1
0x100243c63: cmova edi, r9d
0x100243c67: xor edx, edx
0x100243c69: mov esi, dword ptr [rbp - 0x40]
0x100243c6c: mov eax, esi
0x100243c6e: div ecx
0x100243c70: mov r8d, eax
0x100243c73: cmp ecx, esi
0x100243c75: cmova r8d, r9d
0x100243c79: mov ecx, edi
0x100243c7b: imul rsi, rbx, 0xf8
0x100243c82: lea rdx, [r12 + rsi + 0x1b800]
0x100243c8a: cmp dword ptr [r12 + rsi + 0x1b800], 0
0x100243c93: mov qword ptr [rbp - 0x68], rsi
0x100243c97: mov qword ptr [rbp - 0x60], rdx
0x100243c9b: je 0x100243cf1
0x100243c9d: mov dword ptr [rbp - 0x30], r8d
0x100243ca1: mov dword ptr [rbp - 0x38], ecx
0x100243ca4: mov r15, r11
0x100243ca7: mov r14, r10
0x100243caa: xor ebx, ebx
0x100243cac: nop dword ptr [rax]
0x100243cb0: mov eax, ebx
0x100243cb2: lea rcx, [r12 + rsi]
0x100243cb6: imul rax, rax, 0x78
0x100243cba: lea rdi, [rax + rcx + 0x1b808]
0x100243cc2: call 0x1007f0c90 ; 0x1007f0c90
0x100243cc7: mov rdx, qword ptr [rbp - 0x60]
0x100243ccb: mov rsi, qword ptr [rbp - 0x68]
0x100243ccf: inc ebx
0x100243cd1: cmp ebx, dword ptr [rdx]
0x100243cd3: jb 0x100243cb0
0x100243cd5: mov byte ptr [r12 + rsi + 0x1b804], 1
0x100243cde: mov dword ptr [rdx], 0
0x100243ce4: mov r10, r14
0x100243ce7: mov r11, r15
0x100243cea: mov ecx, dword ptr [rbp - 0x38]
0x100243ced: mov r8d, dword ptr [rbp - 0x30]
0x100243cf1: test byte ptr [r10], 1
0x100243cf5: jne 0x100243d00
0x100243cf7: inc r10
0x100243cfa: jmp 0x100243d08 ; 0x100243d08
0x100243cfc: nop dword ptr [rax]
0x100243d00: mov r10, qword ptr [r13 + r11 + 0x168a0]
0x100243d08: mov eax, dword ptr [r13 + r11 + 0x168ac]
0x100243d10: mov dword ptr [rbp - 0x30], eax
0x100243d13: mov eax, dword ptr [r13 + r11 + 0x168b0]
0x100243d1b: mov dword ptr [rbp - 0x4c], eax
0x100243d1e: mov eax, dword ptr [r13 + r11 + 0x168b4]
0x100243d26: mov rax, qword ptr [r12 + rax*8 + 0x1b6d0]
0x100243d2e: mov qword ptr [rbp - 0x80], rax
0x100243d32: mov bl, byte ptr [r13 + r11 + 0x168b8]
0x100243d3a: mov al, byte ptr [r13 + r11 + 0x168bb]
0x100243d42: mov byte ptr [rbp - 0x29], al
0x100243d45: cmp byte ptr [r13 + r11 + 0x168b9], 1
0x100243d4e: mov eax, 2
0x100243d53: sbb eax, 0
0x100243d56: mov dword ptr [rdx], eax
0x100243d58: mov byte ptr [rbp - 0x2a], bl
0x100243d5b: mov byte ptr [r12 + rsi + 0x1b804], bl
0x100243d63: xor r13d, r13d
0x100243d66: nop word ptr cs:[rax + rax]
0x100243d70: mov eax, r13d
0x100243d73: mov rdx, qword ptr [rbp - 0x70]
0x100243d77: lea rdx, [rdx + rsi]
0x100243d7b: mov qword ptr [rbp - 0x38], rdx
0x100243d7f: imul r15, rax, 0x78
0x100243d83: lea rdi, [r15 + rdx + 0x1b808]
0x100243d8b: movzx eax, byte ptr [rbp - 0x29]
0x100243d8f: mov dword ptr [rsp + 8], eax
0x100243d93: movzx eax, byte ptr [rbp - 0x2a]
0x100243d97: mov dword ptr [rsp], eax
0x100243d9a: mov rsi, r10
0x100243d9d: mov edx, dword ptr [rbp - 0x4c]
0x100243da0: mov ebx, ecx
0x100243da2: mov r12d, r8d
0x100243da5: mov r9d, dword ptr [rbp - 0x30]
0x100243da9: mov r14, r10
0x100243dac: call 0x1007f0b50 ; 0x1007f0b50
0x100243db1: mov rsi, qword ptr [rbp - 0x68]
0x100243db5: mov r8d, r12d
0x100243db8: mov ecx, ebx
0x100243dba: mov r10, r14
0x100243dbd: mov rax, qword ptr [rbp - 0x80]
0x100243dc1: mov rdx, qword ptr [rbp - 0x38]
0x100243dc5: mov qword ptr [r15 + rdx + 0x1b810], rax
0x100243dcd: mov r12, qword ptr [rbp - 0x70]
0x100243dd1: inc r13d
0x100243dd4: mov rax, qword ptr [rbp - 0x60]
0x100243dd8: cmp r13d, dword ptr [rax]
0x100243ddb: jb 0x100243d70
0x100243ddd: mov r13, qword ptr [rbp - 0x78]
0x100243de1: mov r14d, dword ptr [r13 + 0x1688c]
0x100243de8: mov rbx, qword ptr [rbp - 0x58]
0x100243dec: inc ebx
0x100243dee: cmp ebx, r14d
0x100243df1: jb 0x100243ac0
0x100243df7: mov dword ptr [r12 + 0x1b7f8], r14d
0x100243dff: call 0x1007945e0 ; 0x1007945e0
0x100243e04: mov rbx, rax
0x100243e07: lea r15, [r12 + 0x1b800]
0x100243e0f: lea rdx, [rip + 0x937898] ; 0x100b7b6ae rtFullRGBDepth
0x100243e16: xor ecx, ecx
0x100243e18: mov rdi, r13
0x100243e1b: mov rsi, r15
0x100243e1e: call 0x100241f70 ; 0x100241f70
0x100243e23: lea rsi, [rip + 0x937e8b] ; 0x100b7bcb5 u_opaqueTexRGBDepth
0x100243e2a: xor ecx, ecx
0x100243e2c: mov rdi, rbx
0x100243e2f: mov rdx, rax
0x100243e32: call 0x100794050 ; 0x100794050
0x100243e37: call 0x1007945e0 ; 0x1007945e0
0x100243e3c: mov rbx, rax
0x100243e3f: lea rdx, [rip + 0x9378a6] ; 0x100b7b6ec rtDepthHalf
0x100243e46: xor ecx, ecx
0x100243e48: mov rdi, r13
0x100243e4b: mov rsi, r15
0x100243e4e: call 0x100241f70 ; 0x100241f70
0x100243e53: lea rsi, [rip + 0x937e6f] ; 0x100b7bcc9 u_depthHalfTex
0x100243e5a: xor ecx, ecx
0x100243e5c: mov rdi, rbx
0x100243e5f: mov rdx, rax
0x100243e62: call 0x100794050 ; 0x100794050
0x100243e67: call 0x1007945e0 ; 0x1007945e0
0x100243e6c: mov rbx, rax
0x100243e6f: lea rdx, [rip + 0x937882] ; 0x100b7b6f8 rtDepthQuarter
0x100243e76: xor ecx, ecx
0x100243e78: mov rdi, r13
0x100243e7b: mov rsi, r15
0x100243e7e: call 0x100241f70 ; 0x100241f70
0x100243e83: lea rsi, [rip + 0x937e4e] ; 0x100b7bcd8 u_depthQuarterTex
0x100243e8a: xor ecx, ecx
0x100243e8c: mov rdi, rbx
0x100243e8f: mov rdx, rax
0x100243e92: call 0x100794050 ; 0x100794050
0x100243e97: call 0x1007945e0 ; 0x1007945e0
0x100243e9c: mov rbx, rax
0x100243e9f: lea r14, [r12 + 0x1d0]
0x100243ea7: lea rdx, [rip + 0x9378f4] ; 0x100b7b7a2 rtWaterSim
0x100243eae: xor ecx, ecx
0x100243eb0: mov rdi, r14
0x100243eb3: mov rsi, r15
0x100243eb6: call 0x100241f70 ; 0x100241f70
0x100243ebb: mov rcx, qword ptr [r12 + 0x1b6f0]
0x100243ec3: lea rsi, [rip + 0x937e20] ; 0x100b7bcea u_waterSim
0x100243eca: mov rdi, rbx
0x100243ecd: mov rdx, rax
0x100243ed0: call 0x100794050 ; 0x100794050
0x100243ed5: call 0x1007945e0 ; 0x1007945e0
0x100243eda: mov rbx, rax
0x100243edd: lea rdx, [rip + 0x9378c9] ; 0x100b7b7ad rtWaterSimNorm
0x100243ee4: xor ecx, ecx
0x100243ee6: mov rdi, r14
0x100243ee9: mov rsi, r15
0x100243eec: call 0x100241f70 ; 0x100241f70
0x100243ef1: mov rcx, qword ptr [r12 + 0x1b6f0]
0x100243ef9: lea rsi, [rip + 0x937df5] ; 0x100b7bcf5 u_waterSimNorm
0x100243f00: mov rdi, rbx
0x100243f03: mov rdx, rax
0x100243f06: call 0x100794050 ; 0x100794050
0x100243f0b: call 0x1007945e0 ; 0x1007945e0
0x100243f10: mov rbx, rax
0x100243f13: lea rdx, [rip + 0x9378a2] ; 0x100b7b7bc rtPuddleSim
0x100243f1a: xor ecx, ecx
0x100243f1c: mov rdi, r14
0x100243f1f: mov rsi, r15
0x100243f22: call 0x100241f70 ; 0x100241f70
0x100243f27: mov rcx, qword ptr [r12 + 0x1b6e8]
0x100243f2f: lea rsi, [rip + 0x937dce] ; 0x100b7bd04 u_puddleSim
0x100243f36: mov rdi, rbx
0x100243f39: mov rdx, rax
0x100243f3c: call 0x100794050 ; 0x100794050
0x100243f41: call 0x1007945e0 ; 0x1007945e0
0x100243f46: mov rbx, rax
0x100243f49: lea rdx, [rip + 0x937878] ; 0x100b7b7c8 rtPuddleSimNorm
0x100243f50: xor ecx, ecx
0x100243f52: mov rdi, r14
0x100243f55: mov rsi, r15
0x100243f58: call 0x100241f70 ; 0x100241f70
0x100243f5d: mov rcx, qword ptr [r12 + 0x1b6e8]
0x100243f65: lea rsi, [rip + 0x937da4] ; 0x100b7bd10 u_puddleSimNorm
0x100243f6c: mov rdi, rbx
0x100243f6f: mov rdx, rax
0x100243f72: call 0x100794050 ; 0x100794050
0x100243f77: call 0x1007945e0 ; 0x1007945e0
0x100243f7c: mov rbx, rax
0x100243f7f: lea rdx, [rip + 0x9377a1] ; 0x100b7b727 rtCloudA
0x100243f86: xor ecx, ecx
0x100243f88: mov rdi, r14
0x100243f8b: mov rsi, r15
0x100243f8e: call 0x100241f70 ; 0x100241f70
0x100243f93: mov rcx, qword ptr [r12 + 0x1b6d8]
0x100243f9b: lea rsi, [rip + 0x937d7e] ; 0x100b7bd20 u_cloudTex0
0x100243fa2: mov rdi, rbx
0x100243fa5: mov rdx, rax
0x100243fa8: call 0x100794050 ; 0x100794050
0x100243fad: call 0x1007945e0 ; 0x1007945e0
0x100243fb2: mov rbx, rax
0x100243fb5: lea rdx, [rip + 0x937774] ; 0x100b7b730 rtCloudB
0x100243fbc: xor ecx, ecx
0x100243fbe: mov rdi, r14
0x100243fc1: mov rsi, r15
0x100243fc4: call 0x100241f70 ; 0x100241f70
0x100243fc9: mov rcx, qword ptr [r12 + 0x1b6d8]
0x100243fd1: lea rsi, [rip + 0x937d54] ; 0x100b7bd2c u_cloudTex1
0x100243fd8: mov rdi, rbx
0x100243fdb: mov rdx, rax
0x100243fde: call 0x100794050 ; 0x100794050
0x100243fe3: call 0x1007945e0 ; 0x1007945e0
0x100243fe8: mov rbx, rax
0x100243feb: lea rdx, [rip + 0x93779b] ; 0x100b7b78d rtBloom
0x100243ff2: xor ecx, ecx
0x100243ff4: mov rdi, r14
0x100243ff7: mov rsi, r15
0x100243ffa: call 0x100241f70 ; 0x100241f70
0x100243fff: mov rcx, qword ptr [r12 + 0x1b6e0]
0x100244007: lea rsi, [rip + 0x937d2a] ; 0x100b7bd38 u_bloomTex
0x10024400e: mov rdi, rbx
0x100244011: mov rdx, rax
0x100244014: add rsp, 0x68
0x100244018: pop rbx
0x100244019: pop r12
0x10024401b: pop r13
0x10024401d: pop r14
0x10024401f: pop r15
0x100244021: pop rbp
0x100244022: jmp 0x100794050 ; 0x100794050
0x100244027: nop word ptr [rax + rax]
