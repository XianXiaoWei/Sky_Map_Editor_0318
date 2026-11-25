0x10009eb40: push rbp
0x10009eb41: mov rbp, rsp
0x10009eb44: push r15
0x10009eb46: push r14
0x10009eb48: push r13
0x10009eb4a: push r12
0x10009eb4c: push rbx
0x10009eb4d: sub rsp, 0x68
0x10009eb51: mov r14, rdx
0x10009eb54: mov qword ptr [rbp - 0x50], rsi
0x10009eb58: mov r13, rdi
0x10009eb5b: mov qword ptr [rbp - 0x68], r14
0x10009eb5f: jmp 0x10009eb80 ; 0x10009eb80
0x10009eb61: lea rdi, [r12 + 2]
0x10009eb66: mov rsi, qword ptr [rbp - 0x50]
0x10009eb6a: mov rdx, r14
0x10009eb6d: call 0x10009eb40 ; 0x10009eb40
0x10009eb72: mov qword ptr [rbp - 0x50], r12
0x10009eb76: nop word ptr cs:[rax + rax]
0x10009eb80: mov rax, qword ptr [rbp - 0x50]
0x10009eb84: lea rcx, [rax - 2]
0x10009eb88: mov qword ptr [rbp - 0x40], rcx
0x10009eb8c: lea rax, [rax - 4]
0x10009eb90: mov qword ptr [rbp - 0x80], rax
0x10009eb94: mov rax, r13
0x10009eb97: jmp 0x10009eba4 ; 0x10009eba4
0x10009eb99: nop dword ptr [rax]
0x10009eba0: mov r14, qword ptr [rbp - 0x68]
0x10009eba4: mov r13, rax
0x10009eba7: mov rcx, qword ptr [rbp - 0x50]
0x10009ebab: sub rcx, r13
0x10009ebae: mov rax, rcx
0x10009ebb1: sar rax, 1
0x10009ebb4: cmp rax, 5
0x10009ebb8: jbe 0x10009f027
0x10009ebbe: cmp rcx, 0x3d
0x10009ebc2: mov qword ptr [rbp - 0x70], r13
0x10009ebc6: jle 0x10009f086
0x10009ebcc: mov rbx, rax
0x10009ebcf: shr rbx, 0x3f
0x10009ebd3: add rbx, rax
0x10009ebd6: and rbx, 0xfffffffffffffffe
0x10009ebda: add rbx, r13
0x10009ebdd: cmp rcx, 0x7cf
0x10009ebe4: jl 0x10009ec20
0x10009ebe6: mov rcx, rax
0x10009ebe9: sar rcx, 0x3f
0x10009ebed: shr rcx, 0x3e
0x10009ebf1: add rcx, rax
0x10009ebf4: sar rcx, 2
0x10009ebf8: lea rsi, [r13 + rcx*2]
0x10009ebfd: lea rcx, [rbx + rcx*2]
0x10009ec01: mov rdi, r13
0x10009ec04: mov rdx, rbx
0x10009ec07: mov r8, qword ptr [rbp - 0x40]
0x10009ec0b: mov r9, r14
0x10009ec0e: call 0x10009f4a0 ; 0x10009f4a0
0x10009ec13: jmp 0x10009ec3d ; 0x10009ec3d
0x10009ec15: nop word ptr cs:[rax + rax]
0x10009ec20: mov rcx, qword ptr [r14]
0x10009ec23: mov rax, qword ptr [r14 + 8]
0x10009ec27: mov r8d, dword ptr [rax + 0x5810]
0x10009ec2e: mov rdi, r13
0x10009ec31: mov rsi, rbx
0x10009ec34: mov rdx, qword ptr [rbp - 0x40]
0x10009ec38: call 0x10009f220 ; 0x10009f220
0x10009ec3d: mov dword ptr [rbp - 0x2c], eax
0x10009ec40: mov rdx, rbx
0x10009ec43: movzx esi, word ptr [r13]
0x10009ec48: mov rbx, r13
0x10009ec4b: mov r13, qword ptr [r14]
0x10009ec4e: mov rax, qword ptr [r14 + 8]
0x10009ec52: mov ecx, dword ptr [rax + 0x5810]
0x10009ec58: mov qword ptr [rbp - 0x58], rsi
0x10009ec5c: imul r12, rsi, 0x44
0x10009ec60: add r12, r13
0x10009ec63: add r12, rcx
0x10009ec66: mov qword ptr [rbp - 0x60], rdx
0x10009ec6a: movzx eax, word ptr [rdx]
0x10009ec6d: imul r15, rax, 0x44
0x10009ec71: add r15, r13
0x10009ec74: mov qword ptr [rbp - 0x38], rcx
0x10009ec78: add r15, rcx
0x10009ec7b: mov rdi, r12
0x10009ec7e: mov rsi, r15
0x10009ec81: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009ec86: test eax, eax
0x10009ec88: mov qword ptr [rbp - 0x48], r13
0x10009ec8c: jns 0x10009eca0
0x10009ec8e: mov rax, rbx
0x10009ec91: mov r14, qword ptr [rbp - 0x40]
0x10009ec95: jmp 0x10009ed83 ; 0x10009ed83
0x10009ec9a: nop word ptr [rax + rax]
0x10009eca0: mov qword ptr [rbp - 0x78], r12
0x10009eca4: mov rax, qword ptr [rbp - 0x80]
0x10009eca8: mov r14, rax
0x10009ecab: cmp rbx, rax
0x10009ecae: mov r12, qword ptr [rbp - 0x58]
0x10009ecb2: mov r13, rbx
0x10009ecb5: je 0x10009ece9
0x10009ecb7: nop word ptr [rax + rax]
0x10009ecc0: movzx ebx, word ptr [r14]
0x10009ecc4: imul rdi, rbx, 0x44
0x10009ecc8: add rdi, qword ptr [rbp - 0x48]
0x10009eccc: add rdi, qword ptr [rbp - 0x38]
0x10009ecd0: mov rsi, r15
0x10009ecd3: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009ecd8: test eax, eax
0x10009ecda: js 0x10009ed70
0x10009ece0: add r14, -2
0x10009ece4: cmp r13, r14
0x10009ece7: jne 0x10009ecc0
0x10009ece9: lea r15, [r13 + 2]
0x10009eced: mov r12, qword ptr [rbp - 0x40]
0x10009ecf1: movzx r14d, word ptr [r12]
0x10009ecf6: imul rsi, r14, 0x44
0x10009ecfa: add rsi, qword ptr [rbp - 0x48]
0x10009ecfe: add rsi, qword ptr [rbp - 0x38]
0x10009ed02: mov rbx, qword ptr [rbp - 0x78]
0x10009ed06: mov rdi, rbx
0x10009ed09: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009ed0e: test eax, eax
0x10009ed10: jns 0x10009ed23
0x10009ed12: mov rsi, r15
0x10009ed15: cmp rsi, r12
0x10009ed18: jne 0x10009ef5b
0x10009ed1e: jmp 0x10009f177 ; 0x10009f177
0x10009ed23: cmp r15, r12
0x10009ed26: mov r12, rbx
0x10009ed29: je 0x10009f177
0x10009ed2f: lea rbx, [r13 + 4]
0x10009ed33: nop word ptr cs:[rax + rax]
0x10009ed40: movzx r15d, word ptr [rbx - 2]
0x10009ed45: imul rsi, r15, 0x44
0x10009ed49: add rsi, qword ptr [rbp - 0x48]
0x10009ed4d: add rsi, qword ptr [rbp - 0x38]
0x10009ed51: mov rdi, r12
0x10009ed54: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009ed59: test eax, eax
0x10009ed5b: js 0x10009ef41
0x10009ed61: add rbx, 2
0x10009ed65: cmp qword ptr [rbp - 0x50], rbx
0x10009ed69: jne 0x10009ed40
0x10009ed6b: jmp 0x10009f177 ; 0x10009f177
0x10009ed70: mov rax, r13
0x10009ed73: mov word ptr [r13], bx
0x10009ed78: mov word ptr [r14], r12w
0x10009ed7c: inc dword ptr [rbp - 0x2c]
0x10009ed7f: mov r13, qword ptr [rbp - 0x48]
0x10009ed83: lea r12, [rax + 2]
0x10009ed87: cmp r12, r14
0x10009ed8a: mov r15, qword ptr [rbp - 0x60]
0x10009ed8e: jae 0x10009eeb0
0x10009ed94: mov qword ptr [rbp - 0x78], r14
0x10009ed98: mov qword ptr [rbp - 0x58], r12
0x10009ed9c: jmp 0x10009edc9 ; 0x10009edc9
0x10009ed9e: nop 
0x10009eda0: mov word ptr [r15], bx
0x10009eda4: mov rax, qword ptr [rbp - 0x88]
0x10009edab: mov word ptr [r13], ax
0x10009edb0: inc dword ptr [rbp - 0x2c]
0x10009edb3: mov rax, qword ptr [rbp - 0x60]
0x10009edb7: cmp rax, r15
0x10009edba: mov r15, rax
0x10009edbd: mov qword ptr [rbp - 0x78], r13
0x10009edc1: cmove r15, r13
0x10009edc5: mov r13, qword ptr [rbp - 0x48]
0x10009edc9: mov rdx, qword ptr [rbp - 0x38]
0x10009edcd: mov qword ptr [rbp - 0x60], r15
0x10009edd1: movzx eax, word ptr [r15]
0x10009edd5: imul rcx, rax, 0x44
0x10009edd9: add rcx, r13
0x10009eddc: add rcx, rdx
0x10009eddf: mov r15, qword ptr [rbp - 0x58]
0x10009ede3: add r15, -2
0x10009ede7: nop word ptr [rax + rax]
0x10009edf0: movzx ebx, word ptr [r15 + 2]
0x10009edf5: add r15, 2
0x10009edf9: imul rdi, rbx, 0x44
0x10009edfd: add rdi, r13
0x10009ee00: add rdi, rdx
0x10009ee03: mov r12, rcx
0x10009ee06: mov rsi, r12
0x10009ee09: mov r14, rdx
0x10009ee0c: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009ee11: mov rdx, r14
0x10009ee14: mov rcx, r12
0x10009ee17: test eax, eax
0x10009ee19: js 0x10009edf0
0x10009ee1b: mov qword ptr [rbp - 0x88], rbx
0x10009ee22: lea rax, [r15 + 2]
0x10009ee26: mov qword ptr [rbp - 0x58], rax
0x10009ee2a: mov r13, qword ptr [rbp - 0x78]
0x10009ee2e: nop 
0x10009ee30: movzx ebx, word ptr [r13 - 2]
0x10009ee35: add r13, -2
0x10009ee39: imul rdi, rbx, 0x44
0x10009ee3d: add rdi, qword ptr [rbp - 0x48]
0x10009ee41: add rdi, rdx
0x10009ee44: mov rsi, r12
0x10009ee47: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009ee4c: mov rdx, r14
0x10009ee4f: test eax, eax
0x10009ee51: jns 0x10009ee30
0x10009ee53: cmp r15, r13
0x10009ee56: jbe 0x10009eda0
0x10009ee5c: mov r12, r15
0x10009ee5f: mov r14, qword ptr [rbp - 0x68]
0x10009ee63: mov r13, qword ptr [rbp - 0x48]
0x10009ee67: mov r15, qword ptr [rbp - 0x60]
0x10009ee6b: cmp r12, r15
0x10009ee6e: je 0x10009eeb9
0x10009ee70: mov r14, r12
0x10009ee73: movzx r12d, word ptr [r15]
0x10009ee77: movzx ebx, word ptr [r14]
0x10009ee7b: imul rdi, r12, 0x44
0x10009ee7f: add rdi, r13
0x10009ee82: mov rcx, qword ptr [rbp - 0x38]
0x10009ee86: add rdi, rcx
0x10009ee89: imul rsi, rbx, 0x44
0x10009ee8d: add rsi, r13
0x10009ee90: add rsi, rcx
0x10009ee93: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009ee98: test eax, eax
0x10009ee9a: jns 0x10009eec6
0x10009ee9c: mov word ptr [r14], r12w
0x10009eea0: mov word ptr [r15], bx
0x10009eea4: mov eax, dword ptr [rbp - 0x2c]
0x10009eea7: inc eax
0x10009eea9: jmp 0x10009eec9 ; 0x10009eec9
0x10009eeab: nop dword ptr [rax + rax]
0x10009eeb0: mov r14, qword ptr [rbp - 0x68]
0x10009eeb4: cmp r12, r15
0x10009eeb7: jne 0x10009ee70
0x10009eeb9: mov eax, dword ptr [rbp - 0x2c]
0x10009eebc: mov r13, qword ptr [rbp - 0x70]
0x10009eec0: test eax, eax
0x10009eec2: je 0x10009eed8
0x10009eec4: jmp 0x10009ef11 ; 0x10009ef11
0x10009eec6: mov eax, dword ptr [rbp - 0x2c]
0x10009eec9: mov r12, r14
0x10009eecc: mov r14, qword ptr [rbp - 0x68]
0x10009eed0: mov r13, qword ptr [rbp - 0x70]
0x10009eed4: test eax, eax
0x10009eed6: jne 0x10009ef11
0x10009eed8: mov rdi, r13
0x10009eedb: mov rsi, r12
0x10009eede: mov rdx, r14
0x10009eee1: call 0x10009f600 ; 0x10009f600
0x10009eee6: mov r15d, eax
0x10009eee9: lea rdi, [r12 + 2]
0x10009eeee: mov rbx, rdi
0x10009eef1: mov rsi, qword ptr [rbp - 0x50]
0x10009eef5: mov rdx, r14
0x10009eef8: call 0x10009f600 ; 0x10009f600
0x10009eefd: test al, al
0x10009eeff: jne 0x10009f015
0x10009ef05: test r15b, r15b
0x10009ef08: mov rax, rbx
0x10009ef0b: jne 0x10009eba4
0x10009ef11: mov rax, r12
0x10009ef14: sub rax, r13
0x10009ef17: mov rcx, qword ptr [rbp - 0x50]
0x10009ef1b: sub rcx, r12
0x10009ef1e: cmp rax, rcx
0x10009ef21: jge 0x10009eb61
0x10009ef27: mov rdi, r13
0x10009ef2a: mov rsi, r12
0x10009ef2d: mov rdx, r14
0x10009ef30: call 0x10009eb40 ; 0x10009eb40
0x10009ef35: add r12, 2
0x10009ef39: mov rax, r12
0x10009ef3c: jmp 0x10009eba4 ; 0x10009eba4
0x10009ef41: mov word ptr [rbx - 2], r14w
0x10009ef46: mov r12, qword ptr [rbp - 0x40]
0x10009ef4a: mov word ptr [r12], r15w
0x10009ef4f: mov rsi, rbx
0x10009ef52: cmp rsi, r12
0x10009ef55: je 0x10009f177
0x10009ef5b: mov r14, qword ptr [rbp - 0x40]
0x10009ef5f: jmp 0x10009ef80 ; 0x10009ef80
0x10009ef61: nop word ptr cs:[rax + rax]
0x10009ef70: mov word ptr [rax], r13w
0x10009ef74: mov word ptr [r14], r12w
0x10009ef78: mov r13, qword ptr [rbp - 0x70]
0x10009ef7c: mov rsi, qword ptr [rbp - 0x58]
0x10009ef80: movzx eax, word ptr [r13]
0x10009ef85: imul rdx, rax, 0x44
0x10009ef89: mov rcx, qword ptr [rbp - 0x48]
0x10009ef8d: add rdx, rcx
0x10009ef90: add rdx, qword ptr [rbp - 0x38]
0x10009ef94: nop word ptr cs:[rax + rax]
0x10009efa0: movzx r12d, word ptr [rsi]
0x10009efa4: mov r13, rsi
0x10009efa7: imul rsi, r12, 0x44
0x10009efab: add rsi, rcx
0x10009efae: add rsi, qword ptr [rbp - 0x38]
0x10009efb2: mov r15, rdx
0x10009efb5: mov rdi, r15
0x10009efb8: mov rbx, rcx
0x10009efbb: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009efc0: mov rsi, r13
0x10009efc3: mov rdx, r15
0x10009efc6: mov rcx, rbx
0x10009efc9: add rsi, 2
0x10009efcd: test eax, eax
0x10009efcf: jns 0x10009efa0
0x10009efd1: mov qword ptr [rbp - 0x58], rsi
0x10009efd5: lea rax, [rsi - 2]
0x10009efd9: mov qword ptr [rbp - 0x60], rax
0x10009efdd: nop dword ptr [rax]
0x10009efe0: movzx r13d, word ptr [r14 - 2]
0x10009efe5: add r14, -2
0x10009efe9: imul rsi, r13, 0x44
0x10009efed: add rsi, rcx
0x10009eff0: add rsi, qword ptr [rbp - 0x38]
0x10009eff4: mov rdi, r15
0x10009eff7: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009effc: mov rcx, rbx
0x10009efff: test eax, eax
0x10009f001: js 0x10009efe0
0x10009f003: mov rax, qword ptr [rbp - 0x60]
0x10009f007: cmp rax, r14
0x10009f00a: jb 0x10009ef70
0x10009f010: jmp 0x10009eba0 ; 0x10009eba0
0x10009f015: mov qword ptr [rbp - 0x50], r12
0x10009f019: test r15b, r15b
0x10009f01c: je 0x10009eb80
0x10009f022: jmp 0x10009f177 ; 0x10009f177
0x10009f027: lea rcx, [rip + 0x1d2] ; 0x10009f200
0x10009f02e: movsxd rax, dword ptr [rcx + rax*4]
0x10009f032: add rax, rcx
0x10009f035: jmp rax
0x10009f037: mov rax, qword ptr [rbp - 0x40]
0x10009f03b: mov rcx, r14
0x10009f03e: movzx r14d, word ptr [rax]
0x10009f042: movzx ebx, word ptr [r13]
0x10009f047: mov rax, qword ptr [rcx]
0x10009f04a: mov rcx, qword ptr [rcx + 8]
0x10009f04e: mov ecx, dword ptr [rcx + 0x5810]
0x10009f054: imul rdi, r14, 0x44
0x10009f058: add rdi, rax
0x10009f05b: add rdi, rcx
0x10009f05e: imul rsi, rbx, 0x44
0x10009f062: add rsi, rax
0x10009f065: add rsi, rcx
0x10009f068: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009f06d: test eax, eax
0x10009f06f: jns 0x10009f177
0x10009f075: mov word ptr [r13], r14w
0x10009f07a: mov rax, qword ptr [rbp - 0x40]
0x10009f07e: mov word ptr [rax], bx
0x10009f081: jmp 0x10009f177 ; 0x10009f177
0x10009f086: lea r15, [r13 + 4]
0x10009f08a: lea rsi, [r13 + 2]
0x10009f08e: mov rcx, qword ptr [r14]
0x10009f091: mov rax, qword ptr [r14 + 8]
0x10009f095: mov r8d, dword ptr [rax + 0x5810]
0x10009f09c: mov rdi, r13
0x10009f09f: mov rdx, r15
0x10009f0a2: call 0x10009f220 ; 0x10009f220
0x10009f0a7: lea rax, [r13 + 6]
0x10009f0ab: cmp rax, qword ptr [rbp - 0x50]
0x10009f0af: je 0x10009f177
0x10009f0b5: mov rcx, qword ptr [r14]
0x10009f0b8: mov qword ptr [rbp - 0x38], rcx
0x10009f0bc: mov rcx, qword ptr [r14 + 8]
0x10009f0c0: mov r12d, dword ptr [rcx + 0x5810]
0x10009f0c7: mov ecx, 6
0x10009f0cc: mov qword ptr [rbp - 0x48], rcx
0x10009f0d0: movzx r14d, word ptr [r15]
0x10009f0d4: mov r15, rax
0x10009f0d7: movzx eax, word ptr [r15]
0x10009f0db: mov qword ptr [rbp - 0x60], rax
0x10009f0df: imul rbx, rax, 0x44
0x10009f0e3: mov rax, qword ptr [rbp - 0x38]
0x10009f0e7: add rbx, rax
0x10009f0ea: add rbx, r12
0x10009f0ed: imul rsi, r14, 0x44
0x10009f0f1: add rsi, rax
0x10009f0f4: add rsi, r12
0x10009f0f7: mov rdi, rbx
0x10009f0fa: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009f0ff: test eax, eax
0x10009f101: jns 0x10009f164
0x10009f103: mov qword ptr [rbp - 0x58], r15
0x10009f107: mov r15, r13
0x10009f10a: mov r13, qword ptr [rbp - 0x48]
0x10009f10e: nop 
0x10009f110: mov word ptr [r15 + r13], r14w
0x10009f115: cmp r13, 2
0x10009f119: je 0x10009f150
0x10009f11b: movzx r14d, word ptr [r15 + r13 - 4]
0x10009f121: imul rsi, r14, 0x44
0x10009f125: add rsi, qword ptr [rbp - 0x38]
0x10009f129: add rsi, r12
0x10009f12c: mov rdi, rbx
0x10009f12f: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x10009f134: add r13, -2
0x10009f138: test eax, eax
0x10009f13a: js 0x10009f110
0x10009f13c: add r13, r15
0x10009f13f: jmp 0x10009f153 ; 0x10009f153
0x10009f141: nop word ptr cs:[rax + rax]
0x10009f150: mov r13, r15
0x10009f153: mov rax, qword ptr [rbp - 0x60]
0x10009f157: mov word ptr [r13], ax
0x10009f15c: mov r13, qword ptr [rbp - 0x70]
0x10009f160: mov r15, qword ptr [rbp - 0x58]
0x10009f164: lea rax, [r15 + 2]
0x10009f168: add qword ptr [rbp - 0x48], 2
0x10009f16d: cmp rax, qword ptr [rbp - 0x50]
0x10009f171: jne 0x10009f0d0
0x10009f177: add rsp, 0x68
0x10009f17b: pop rbx
0x10009f17c: pop r12
0x10009f17e: pop r13
0x10009f180: pop r14
0x10009f182: pop r15
0x10009f184: pop rbp
0x10009f185: ret 
0x10009f186: lea rsi, [r13 + 2]
0x10009f18a: mov rcx, qword ptr [r14]
0x10009f18d: mov rax, qword ptr [r14 + 8]
0x10009f191: mov r8d, dword ptr [rax + 0x5810]
0x10009f198: mov rdi, r13
0x10009f19b: mov rdx, qword ptr [rbp - 0x40]
0x10009f19f: add rsp, 0x68
0x10009f1a3: pop rbx
0x10009f1a4: pop r12
0x10009f1a6: pop r13
0x10009f1a8: pop r14
0x10009f1aa: pop r15
0x10009f1ac: pop rbp
0x10009f1ad: jmp 0x10009f220 ; 0x10009f220
0x10009f1b2: lea rsi, [r13 + 2]
0x10009f1b6: lea rdx, [r13 + 4]
0x10009f1ba: mov rdi, r13
0x10009f1bd: mov rcx, qword ptr [rbp - 0x40]
0x10009f1c1: mov r8, r14
0x10009f1c4: add rsp, 0x68
0x10009f1c8: pop rbx
0x10009f1c9: pop r12
0x10009f1cb: pop r13
0x10009f1cd: pop r14
0x10009f1cf: pop r15
0x10009f1d1: pop rbp
0x10009f1d2: jmp 0x10009f380 ; 0x10009f380
0x10009f1d7: lea rdx, [r13 + 4]
0x10009f1db: lea rcx, [r13 + 6]
0x10009f1df: lea rsi, [r13 + 2]
0x10009f1e3: mov rdi, r13
0x10009f1e6: mov r8, qword ptr [rbp - 0x40]
0x10009f1ea: mov r9, r14
0x10009f1ed: add rsp, 0x68
0x10009f1f1: pop rbx
0x10009f1f2: pop r12
0x10009f1f4: pop r13
0x10009f1f6: pop r14
0x10009f1f8: pop r15
0x10009f1fa: pop rbp
0x10009f1fb: jmp 0x10009f4a0 ; 0x10009f4a0
