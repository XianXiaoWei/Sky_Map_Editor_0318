0x100400c80: push rbp
0x100400c81: mov rbp, rsp
0x100400c84: push r15
0x100400c86: push r14
0x100400c88: push r13
0x100400c8a: push r12
0x100400c8c: push rbx
0x100400c8d: sub rsp, 0x18
0x100400c91: mov r13d, ecx
0x100400c94: mov r14, rdi
0x100400c97: movzx eax, byte ptr [rdx]
0x100400c9a: mov rcx, rax
0x100400c9d: shr rcx, 1
0x100400ca0: test al, 1
0x100400ca2: cmovne rcx, qword ptr [rdx + 8]
0x100400ca7: cmp rcx, 0x1c
0x100400cab: jae 0x100400e7c
0x100400cb1: mov dword ptr [rbp - 0x30], esi
0x100400cb4: mov r15d, dword ptr [r14 + 0x220]
0x100400cbb: test r15d, r15d
0x100400cbe: mov qword ptr [rbp - 0x38], rdx
0x100400cc2: je 0x100400d45
0x100400cc8: mov dword ptr [rbp - 0x2c], r13d
0x100400ccc: lea r12, [rdx + 1]
0x100400cd0: test al, 1
0x100400cd2: cmovne r12, qword ptr [rdx + 0x10]
0x100400cd7: xor r13d, r13d
0x100400cda: nop word ptr [rax + rax]
0x100400ce0: mov rbx, qword ptr [r14 + r13*8 + 0x1a0]
0x100400ce8: test byte ptr [rbx + 8], 1
0x100400cec: jne 0x100400d00
0x100400cee: lea rsi, [rbx + 8]
0x100400cf2: inc rsi
0x100400cf5: jmp 0x100400d04 ; 0x100400d04
0x100400cf7: nop word ptr [rax + rax]
0x100400d00: mov rsi, qword ptr [rbx + 0x18]
0x100400d04: mov rdi, r12
0x100400d07: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100400d0c: test eax, eax
0x100400d0e: je 0x100400db6
0x100400d14: inc r13
0x100400d17: cmp r13d, r15d
0x100400d1a: jb 0x100400ce0
0x100400d1c: cmp r15d, 0x10
0x100400d20: mov r13d, dword ptr [rbp - 0x2c]
0x100400d24: jb 0x100400d48
0x100400d26: lea rdi, [rip + 0x786934] ; 0x100b87661 numShaderParams < kMaxShaderParams
0x100400d2d: lea rsi, [rip + 0x786701] ; 0x100b87435 LevelMesh.cpp
0x100400d34: mov edx, 0x2be
0x100400d39: mov ecx, 3
0x100400d3e: call 0x1007e5f70 ; 0x1007e5f70
0x100400d43: ud2 
0x100400d45: xor r15d, r15d
0x100400d48: lea eax, [r15 + 1]
0x100400d4c: mov dword ptr [r14 + 0x220], eax
0x100400d53: mov eax, r15d
0x100400d56: mov rbx, qword ptr [r14 + rax*8 + 0x1a0]
0x100400d5e: lea r12, [rbx + 8]
0x100400d62: mov rdx, qword ptr [rbp - 0x38]
0x100400d66: cmp r12, rdx
0x100400d69: je 0x100400e59
0x100400d6f: movzx ecx, byte ptr [rdx]
0x100400d72: lea rax, [rdx + 1]
0x100400d76: mov r14, rcx
0x100400d79: shr r14, 1
0x100400d7c: and cl, 1
0x100400d7f: cmovne rax, qword ptr [rdx + 0x10]
0x100400d84: test cl, cl
0x100400d86: cmovne r14, qword ptr [rdx + 8]
0x100400d8b: movzx ecx, byte ptr [r12]
0x100400d90: test cl, 1
0x100400d93: jne 0x100400ded
0x100400d95: mov esi, 0x16
0x100400d9a: mov rdx, r14
0x100400d9d: sub rdx, rsi
0x100400da0: ja 0x100400e00
0x100400da2: mov r15d, r13d
0x100400da5: test cl, 1
0x100400da8: jne 0x100400e0a
0x100400daa: lea r13, [r12 + 1]
0x100400daf: test r14, r14
0x100400db2: jne 0x100400e13
0x100400db4: jmp 0x100400e21 ; 0x100400e21
0x100400db6: mov eax, dword ptr [rbp - 0x2c]
0x100400db9: cmp dword ptr [rbx + 0x20], eax
0x100400dbc: je 0x100400e6a
0x100400dc2: lea rdi, [rip + 0x78684b] ; 0x100b87614 shaderParams[ i ]->valueType == valueType
0x100400dc9: lea rsi, [rip + 0x786665] ; 0x100b87435 LevelMesh.cpp
0x100400dd0: lea r8, [rip + 0x786867] ; 0x100b8763e Mismatched shader param type on %s
0x100400dd7: mov edx, 0x2b9
0x100400ddc: mov ecx, 4
0x100400de1: xor eax, eax
0x100400de3: mov r9, r12
0x100400de6: call 0x1007e6030 ; 0x1007e6030
0x100400deb: ud2 
0x100400ded: mov rsi, qword ptr [r12]
0x100400df1: and rsi, 0xfffffffffffffffe
0x100400df5: dec rsi
0x100400df8: mov rdx, r14
0x100400dfb: sub rdx, rsi
0x100400dfe: jbe 0x100400da2
0x100400e00: test cl, 1
0x100400e03: jne 0x100400e37
0x100400e05: shr rcx, 1
0x100400e08: jmp 0x100400e3b ; 0x100400e3b
0x100400e0a: mov r13, qword ptr [rbx + 0x18]
0x100400e0e: test r14, r14
0x100400e11: je 0x100400e21
0x100400e13: mov rdi, r13
0x100400e16: mov rsi, rax
0x100400e19: mov rdx, r14
0x100400e1c: call 0x100aa28fa ; 0x100aa28fa _memmove
0x100400e21: mov byte ptr [r13 + r14], 0
0x100400e27: test byte ptr [r12], 1
0x100400e2c: jne 0x100400e52
0x100400e2e: add r14b, r14b
0x100400e31: mov byte ptr [r12], r14b
0x100400e35: jmp 0x100400e56 ; 0x100400e56
0x100400e37: mov rcx, qword ptr [rbx + 0x10]
0x100400e3b: xor r8d, r8d
0x100400e3e: mov rdi, r12
0x100400e41: mov r9, rcx
0x100400e44: push rax
0x100400e45: push r14
0x100400e47: call 0x1000198c0 ; 0x1000198c0
0x100400e4c: add rsp, 0x10
0x100400e50: jmp 0x100400e59 ; 0x100400e59
0x100400e52: mov qword ptr [rbx + 0x10], r14
0x100400e56: mov r13d, r15d
0x100400e59: mov dword ptr [rbx + 0x5c], 0xffffffff
0x100400e60: mov eax, dword ptr [rbp - 0x30]
0x100400e63: mov dword ptr [rbx + 0x58], eax
0x100400e66: mov dword ptr [rbx + 0x20], r13d
0x100400e6a: mov rax, rbx
0x100400e6d: add rsp, 0x18
0x100400e71: pop rbx
0x100400e72: pop r12
0x100400e74: pop r13
0x100400e76: pop r14
0x100400e78: pop r15
0x100400e7a: pop rbp
0x100400e7b: ret 
0x100400e7c: lea rdi, [rip + 0x78675d] ; 0x100b875e0 uniform.length() < sizeof( ShaderUniformDef::name )
0x100400e83: lea rsi, [rip + 0x7865ab] ; 0x100b87435 LevelMesh.cpp
0x100400e8a: mov edx, 0x2b4
0x100400e8f: mov ecx, 3
0x100400e94: call 0x1007e5f70 ; 0x1007e5f70
0x100400e99: ud2 
0x100400e9b: nop dword ptr [rax + rax]
