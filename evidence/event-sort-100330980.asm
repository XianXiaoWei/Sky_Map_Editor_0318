0x100330980: push rbp
0x100330981: mov rbp, rsp
0x100330984: push r15
0x100330986: push r14
0x100330988: push r13
0x10033098a: push r12
0x10033098c: push rbx
0x10033098d: sub rsp, 0x18
0x100330991: mov r14, rsi
0x100330994: mov r12, rdi
0x100330997: jmp 0x1003309c0 ; 0x1003309c0
0x100330999: mov r14, rbx
0x10033099c: test r15b, r15b
0x10033099f: je 0x1003309c0
0x1003309a1: jmp 0x100330f81 ; 0x100330f81
0x1003309a6: lea rdi, [rbx + 8]
0x1003309aa: mov rsi, r14
0x1003309ad: call 0x100330980 ; 0x100330980
0x1003309b2: mov r14, rbx
0x1003309b5: nop word ptr cs:[rax + rax]
0x1003309c0: lea r15, [r14 - 8]
0x1003309c4: lea rax, [r14 - 0x10]
0x1003309c8: mov qword ptr [rbp - 0x30], rax
0x1003309cc: mov r13, r12
0x1003309cf: mov qword ptr [rbp - 0x38], r15
0x1003309d3: jmp 0x100330c50 ; 0x100330c50
0x1003309d8: nop dword ptr [rax + rax]
0x1003309e0: mov rsi, qword ptr [rbp - 0x30]
0x1003309e4: mov rcx, rsi
0x1003309e7: cmp r12, rsi
0x1003309ea: je 0x100330a1f
0x1003309ec: nop dword ptr [rax]
0x1003309f0: mov rbx, qword ptr [rcx]
0x1003309f3: cmp dword ptr [rbx + 0x28], 1
0x1003309f7: jne 0x100330ff9
0x1003309fd: movzx esi, word ptr [rbx + 0x2c]
0x100330a01: cmp esi, 0xffff
0x100330a07: je 0x100330ff9
0x100330a0d: cmp si, di
0x100330a10: jb 0x100330a95
0x100330a16: add rcx, -8
0x100330a1a: cmp r12, rcx
0x100330a1d: jne 0x1003309f0
0x100330a1f: mov rax, qword ptr [r15]
0x100330a22: cmp dword ptr [rax + 0x28], 1
0x100330a26: jne 0x100330ff9
0x100330a2c: movzx ecx, word ptr [rax + 0x2c]
0x100330a30: cmp ecx, 0xffff
0x100330a36: je 0x100330ff9
0x100330a3c: lea r13, [r12 + 8]
0x100330a41: cmp dx, cx
0x100330a44: jb 0x100330b55
0x100330a4a: cmp r13, r15
0x100330a4d: je 0x100330f81
0x100330a53: lea r13, [r12 + 0x10]
0x100330a58: nop dword ptr [rax + rax]
0x100330a60: mov rcx, qword ptr [r13 - 8]
0x100330a64: cmp dword ptr [rcx + 0x28], 1
0x100330a68: jne 0x100330ff9
0x100330a6e: movzx esi, word ptr [rcx + 0x2c]
0x100330a72: cmp esi, 0xffff
0x100330a78: je 0x100330ff9
0x100330a7e: cmp dx, si
0x100330a81: jb 0x100330b4e
0x100330a87: add r13, 8
0x100330a8b: cmp r14, r13
0x100330a8e: jne 0x100330a60
0x100330a90: jmp 0x100330f81 ; 0x100330f81
0x100330a95: mov qword ptr [r12], rbx
0x100330a99: mov qword ptr [rcx], r8
0x100330a9c: inc eax
0x100330a9e: lea rbx, [r12 + 8]
0x100330aa3: cmp rbx, rcx
0x100330aa6: jb 0x100330d46
0x100330aac: nop dword ptr [rax]
0x100330ab0: cmp rbx, r13
0x100330ab3: je 0x100330afe
0x100330ab5: mov rcx, qword ptr [r13]
0x100330ab9: cmp dword ptr [rcx + 0x28], 1
0x100330abd: jne 0x100330ff9
0x100330ac3: movzx edx, word ptr [rcx + 0x2c]
0x100330ac7: cmp edx, 0xffff
0x100330acd: je 0x100330ff9
0x100330ad3: mov rsi, qword ptr [rbx]
0x100330ad6: cmp dword ptr [rsi + 0x28], 1
0x100330ada: jne 0x100330ff9
0x100330ae0: movzx edi, word ptr [rsi + 0x2c]
0x100330ae4: cmp edi, 0xffff
0x100330aea: je 0x100330ff9
0x100330af0: cmp dx, di
0x100330af3: jae 0x100330afe
0x100330af5: mov qword ptr [rbx], rcx
0x100330af8: mov qword ptr [r13], rsi
0x100330afc: inc eax
0x100330afe: test eax, eax
0x100330b00: jne 0x100330b34
0x100330b02: mov rdi, r12
0x100330b05: mov rsi, rbx
0x100330b08: call 0x1003313d0 ; 0x1003313d0
0x100330b0d: mov r15d, eax
0x100330b10: lea r13, [rbx + 8]
0x100330b14: mov rdi, r13
0x100330b17: mov rsi, r14
0x100330b1a: call 0x1003313d0 ; 0x1003313d0
0x100330b1f: test al, al
0x100330b21: jne 0x100330999
0x100330b27: test r15b, r15b
0x100330b2a: mov r15, qword ptr [rbp - 0x38]
0x100330b2e: jne 0x100330c50
0x100330b34: mov rax, rbx
0x100330b37: sub rax, r12
0x100330b3a: mov rcx, r14
0x100330b3d: sub rcx, rbx
0x100330b40: cmp rax, rcx
0x100330b43: jl 0x100330c3a
0x100330b49: jmp 0x1003309a6 ; 0x1003309a6
0x100330b4e: mov qword ptr [r13 - 8], rax
0x100330b52: mov qword ptr [r15], rcx
0x100330b55: cmp r13, r15
0x100330b58: je 0x100330f81
0x100330b5e: mov rcx, qword ptr [r12]
0x100330b62: cmp dword ptr [rcx + 0x28], 1
0x100330b66: jne 0x100330ff9
0x100330b6c: mov rax, r15
0x100330b6f: nop 
0x100330b70: movzx ecx, word ptr [rcx + 0x2c]
0x100330b74: cmp ecx, 0xffff
0x100330b7a: je 0x100330ff9
0x100330b80: mov rdx, qword ptr [r13]
0x100330b84: cmp dword ptr [rdx + 0x28], 1
0x100330b88: jne 0x100330ff9
0x100330b8e: movzx edx, word ptr [rdx + 0x2c]
0x100330b92: cmp edx, 0xffff
0x100330b98: je 0x100330ff9
0x100330b9e: cmp cx, dx
0x100330ba1: jb 0x100330bc0
0x100330ba3: movzx edx, cx
0x100330ba6: add r13, 8
0x100330baa: cmp edx, 0xffff
0x100330bb0: jne 0x100330b80
0x100330bb2: jmp 0x100330ff9 ; 0x100330ff9
0x100330bb7: nop word ptr [rax + rax]
0x100330bc0: mov rdx, qword ptr [rax - 8]
0x100330bc4: cmp dword ptr [rdx + 0x28], 1
0x100330bc8: jne 0x100330ff9
0x100330bce: add rax, -8
0x100330bd2: nop word ptr cs:[rax + rax]
0x100330be0: movzx edx, word ptr [rdx + 0x2c]
0x100330be4: cmp edx, 0xffff
0x100330bea: je 0x100330ff9
0x100330bf0: cmp cx, dx
0x100330bf3: jae 0x100330c10
0x100330bf5: mov rdx, qword ptr [rax - 8]
0x100330bf9: add rax, -8
0x100330bfd: cmp dword ptr [rdx + 0x28], 1
0x100330c01: je 0x100330be0
0x100330c03: jmp 0x100330ff9 ; 0x100330ff9
0x100330c08: nop dword ptr [rax + rax]
0x100330c10: cmp r13, rax
0x100330c13: jae 0x100330c50
0x100330c15: mov rcx, qword ptr [r13]
0x100330c19: mov rdx, qword ptr [rax]
0x100330c1c: mov qword ptr [r13], rdx
0x100330c20: mov qword ptr [rax], rcx
0x100330c23: add r13, 8
0x100330c27: mov rcx, qword ptr [r12]
0x100330c2b: cmp dword ptr [rcx + 0x28], 1
0x100330c2f: je 0x100330b70
0x100330c35: jmp 0x100330ff9 ; 0x100330ff9
0x100330c3a: mov rdi, r12
0x100330c3d: mov rsi, rbx
0x100330c40: call 0x100330980 ; 0x100330980
0x100330c45: add rbx, 8
0x100330c49: mov r13, rbx
0x100330c4c: nop dword ptr [rax]
0x100330c50: mov r12, r13
0x100330c53: mov rcx, r14
0x100330c56: sub rcx, r12
0x100330c59: mov rax, rcx
0x100330c5c: sar rax, 3
0x100330c60: cmp rax, 5
0x100330c64: jbe 0x100330e4e
0x100330c6a: cmp rcx, 0xf7
0x100330c71: jle 0x100330eae
0x100330c77: mov rdx, rax
0x100330c7a: shr rdx, 0x3f
0x100330c7e: add rdx, rax
0x100330c81: movabs rsi, 0x3ffffffffffffffe
0x100330c8b: and rdx, rsi
0x100330c8e: lea r13, [r12 + rdx*4]
0x100330c92: cmp rcx, 0x1f39
0x100330c99: jl 0x100330ce0
0x100330c9b: mov rcx, rax
0x100330c9e: sar rcx, 0x3f
0x100330ca2: shr rcx, 0x3e
0x100330ca6: add rcx, rax
0x100330ca9: add rcx, rcx
0x100330cac: and rcx, 0xfffffffffffffff8
0x100330cb0: lea rsi, [r12 + rcx]
0x100330cb4: add rcx, r13
0x100330cb7: mov rdi, r12
0x100330cba: mov rdx, r13
0x100330cbd: mov r8, r15
0x100330cc0: call 0x100331260 ; 0x100331260
0x100330cc5: mov r8, qword ptr [r12]
0x100330cc9: cmp dword ptr [r8 + 0x28], 1
0x100330cce: je 0x100330cfd
0x100330cd0: jmp 0x100330ff9 ; 0x100330ff9
0x100330cd5: nop word ptr cs:[rax + rax]
0x100330ce0: mov rdi, r12
0x100330ce3: mov rsi, r13
0x100330ce6: mov rdx, r15
0x100330ce9: call 0x100331030 ; 0x100331030
0x100330cee: mov r8, qword ptr [r12]
0x100330cf2: cmp dword ptr [r8 + 0x28], 1
0x100330cf7: jne 0x100330ff9
0x100330cfd: movzx edx, word ptr [r8 + 0x2c]
0x100330d02: cmp edx, 0xffff
0x100330d08: je 0x100330ff9
0x100330d0e: mov rcx, qword ptr [r13]
0x100330d12: cmp dword ptr [rcx + 0x28], 1
0x100330d16: jne 0x100330ff9
0x100330d1c: movzx edi, word ptr [rcx + 0x2c]
0x100330d20: cmp edi, 0xffff
0x100330d26: je 0x100330ff9
0x100330d2c: cmp dx, di
0x100330d2f: jae 0x1003309e0
0x100330d35: mov rcx, r15
0x100330d38: lea rbx, [r12 + 8]
0x100330d3d: cmp rbx, rcx
0x100330d40: jae 0x100330ab0
0x100330d46: mov rdx, qword ptr [rbx]
0x100330d49: cmp dword ptr [rdx + 0x28], 1
0x100330d4d: je 0x100330db0
0x100330d4f: jmp 0x100330ff9 ; 0x100330ff9
0x100330d54: nop word ptr cs:[rax + rax]
0x100330d60: mov rsi, qword ptr [rcx - 8]
0x100330d64: add rcx, -8
0x100330d68: cmp dword ptr [rsi + 0x28], 1
0x100330d6c: je 0x100330e30
0x100330d72: jmp 0x100330ff9 ; 0x100330ff9
0x100330d77: nop word ptr [rax + rax]
0x100330d80: cmp rbx, rcx
0x100330d83: ja 0x100330ab0
0x100330d89: mov rdx, qword ptr [rbx]
0x100330d8c: mov rsi, qword ptr [rcx]
0x100330d8f: mov qword ptr [rbx], rsi
0x100330d92: mov qword ptr [rcx], rdx
0x100330d95: inc eax
0x100330d97: cmp r13, rbx
0x100330d9a: cmove r13, rcx
0x100330d9e: mov rdx, qword ptr [rbx + 8]
0x100330da2: add rbx, 8
0x100330da6: cmp dword ptr [rdx + 0x28], 1
0x100330daa: jne 0x100330ff9
0x100330db0: mov rsi, qword ptr [r13]
0x100330db4: nop word ptr cs:[rax + rax]
0x100330dc0: movzx edi, word ptr [rdx + 0x2c]
0x100330dc4: cmp edi, 0xffff
0x100330dca: je 0x100330ff9
0x100330dd0: cmp dword ptr [rsi + 0x28], 1
0x100330dd4: jne 0x100330ff9
0x100330dda: movzx edx, word ptr [rsi + 0x2c]
0x100330dde: cmp edx, 0xffff
0x100330de4: je 0x100330ff9
0x100330dea: cmp di, dx
0x100330ded: jae 0x100330e10
0x100330def: mov rdx, qword ptr [rbx + 8]
0x100330df3: add rbx, 8
0x100330df7: cmp dword ptr [rdx + 0x28], 1
0x100330dfb: je 0x100330dc0
0x100330dfd: jmp 0x100330ff9 ; 0x100330ff9
0x100330e02: nop word ptr cs:[rax + rax]
0x100330e10: mov rsi, qword ptr [rcx - 8]
0x100330e14: cmp dword ptr [rsi + 0x28], 1
0x100330e18: jne 0x100330ff9
0x100330e1e: add rcx, -8
0x100330e22: nop word ptr cs:[rax + rax]
0x100330e30: movzx esi, word ptr [rsi + 0x2c]
0x100330e34: cmp esi, 0xffff
0x100330e3a: je 0x100330ff9
0x100330e40: cmp si, dx
0x100330e43: jae 0x100330d60
0x100330e49: jmp 0x100330d80 ; 0x100330d80
0x100330e4e: lea rcx, [rip + 0x1c3] ; 0x100331018
0x100330e55: movsxd rax, dword ptr [rcx + rax*4]
0x100330e59: add rax, rcx
0x100330e5c: jmp rax
0x100330e5e: mov rax, qword ptr [r15]
0x100330e61: cmp dword ptr [rax + 0x28], 1
0x100330e65: jne 0x100330ff9
0x100330e6b: movzx edx, word ptr [rax + 0x2c]
0x100330e6f: cmp edx, 0xffff
0x100330e75: je 0x100330ff9
0x100330e7b: mov rcx, qword ptr [r12]
0x100330e7f: cmp dword ptr [rcx + 0x28], 1
0x100330e83: jne 0x100330ff9
0x100330e89: movzx esi, word ptr [rcx + 0x2c]
0x100330e8d: cmp esi, 0xffff
0x100330e93: je 0x100330ff9
0x100330e99: cmp dx, si
0x100330e9c: jae 0x100330f81
0x100330ea2: mov qword ptr [r12], rax
0x100330ea6: mov qword ptr [r15], rcx
0x100330ea9: jmp 0x100330f81 ; 0x100330f81
0x100330eae: lea rbx, [r12 + 0x10]
0x100330eb3: lea rsi, [r12 + 8]
0x100330eb8: mov rdi, r12
0x100330ebb: mov rdx, rbx
0x100330ebe: call 0x100331030 ; 0x100331030
0x100330ec3: lea rdx, [r12 + 0x18]
0x100330ec8: cmp rdx, r14
0x100330ecb: je 0x100330f81
0x100330ed1: mov r8d, 0x10
0x100330ed7: nop word ptr [rax + rax]
0x100330ee0: mov rcx, rdx
0x100330ee3: mov rdx, qword ptr [rcx]
0x100330ee6: cmp dword ptr [rdx + 0x28], 1
0x100330eea: jne 0x100330ff9
0x100330ef0: movzx esi, word ptr [rdx + 0x2c]
0x100330ef4: cmp esi, 0xffff
0x100330efa: je 0x100330ff9
0x100330f00: mov rax, qword ptr [rbx]
0x100330f03: cmp dword ptr [rax + 0x28], 1
0x100330f07: jne 0x100330ff9
0x100330f0d: movzx edi, word ptr [rax + 0x2c]
0x100330f11: cmp edi, 0xffff
0x100330f17: je 0x100330ff9
0x100330f1d: cmp si, di
0x100330f20: jae 0x100330f6d
0x100330f22: mov rax, r8
0x100330f25: nop word ptr cs:[rax + rax]
0x100330f30: mov rdi, rax
0x100330f33: mov rax, qword ptr [r12 + rdi]
0x100330f37: mov qword ptr [r12 + rdi + 8], rax
0x100330f3c: test rdi, rdi
0x100330f3f: je 0x100330f69
0x100330f41: mov rax, qword ptr [r12 + rdi - 8]
0x100330f46: cmp dword ptr [rax + 0x28], 1
0x100330f4a: jne 0x100330ff9
0x100330f50: movzx ebx, word ptr [rax + 0x2c]
0x100330f54: cmp ebx, 0xffff
0x100330f5a: je 0x100330ff9
0x100330f60: lea rax, [rdi - 8]
0x100330f64: cmp si, bx
0x100330f67: jb 0x100330f30
0x100330f69: mov qword ptr [r12 + rdi], rdx
0x100330f6d: lea rdx, [rcx + 8]
0x100330f71: add r8, 8
0x100330f75: mov rbx, rcx
0x100330f78: cmp rdx, r14
0x100330f7b: jne 0x100330ee0
0x100330f81: add rsp, 0x18
0x100330f85: pop rbx
0x100330f86: pop r12
0x100330f88: pop r13
0x100330f8a: pop r14
0x100330f8c: pop r15
0x100330f8e: pop rbp
0x100330f8f: ret 
0x100330f90: lea rsi, [r12 + 8]
0x100330f95: mov rdi, r12
0x100330f98: mov rdx, r15
0x100330f9b: add rsp, 0x18
0x100330f9f: pop rbx
0x100330fa0: pop r12
0x100330fa2: pop r13
0x100330fa4: pop r14
0x100330fa6: pop r15
0x100330fa8: pop rbp
0x100330fa9: jmp 0x100331030 ; 0x100331030
0x100330fae: lea rsi, [r12 + 8]
0x100330fb3: lea rdx, [r12 + 0x10]
0x100330fb8: mov rdi, r12
0x100330fbb: mov rcx, r15
0x100330fbe: add rsp, 0x18
0x100330fc2: pop rbx
0x100330fc3: pop r12
0x100330fc5: pop r13
0x100330fc7: pop r14
0x100330fc9: pop r15
0x100330fcb: pop rbp
0x100330fcc: jmp 0x100331150 ; 0x100331150
0x100330fd1: lea rdx, [r12 + 0x10]
0x100330fd6: lea rcx, [r12 + 0x18]
0x100330fdb: lea rsi, [r12 + 8]
0x100330fe0: mov rdi, r12
0x100330fe3: mov r8, r15
0x100330fe6: add rsp, 0x18
0x100330fea: pop rbx
0x100330feb: pop r12
0x100330fed: pop r13
0x100330fef: pop r14
0x100330ff1: pop r15
0x100330ff3: pop rbp
0x100330ff4: jmp 0x100331260 ; 0x100331260
0x100330ff9: lea rdi, [rip + 0x85013d] ; 0x100b8113d HasUniqueId()
0x100331000: lea rsi, [rip + 0x850144] ; 0x100b8114b Event.cpp
0x100331007: mov edx, 0x59
0x10033100c: mov ecx, 3
0x100331011: call 0x1007e5f70 ; 0x1007e5f70
0x100331016: ud2 
