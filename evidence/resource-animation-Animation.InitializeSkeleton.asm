0x100094900: push rbp
0x100094901: mov rbp, rsp
0x100094904: push r15
0x100094906: push r14
0x100094908: push r13
0x10009490a: push r12
0x10009490c: push rbx
0x10009490d: sub rsp, 0x138
0x100094914: mov r15d, edx
0x100094917: mov r14, rdi
0x10009491a: mov rax, qword ptr [rip + 0xb78fb7] ; 0x100c0d8d8
0x100094921: mov rax, qword ptr [rax]
0x100094924: mov qword ptr [rbp - 0x30], rax
0x100094928: mov rax, qword ptr [r14 + 0x6020]
0x10009492f: mov qword ptr [r14 + 0x6018], rax
0x100094936: cmp r15d, 0x101
0x10009493d: jae 0x1000950f6
0x100094943: mov qword ptr [rbp - 0x120], rsi
0x10009494a: lea ebx, [r15 + 7]
0x10009494e: sar ebx, 3
0x100094951: mov rdi, qword ptr [r14]
0x100094954: imul rsi, rbx, 0xc1
0x10009495b: mov rdx, qword ptr [rip + 0x1cdfca6] ; 0x101d74608
0x100094962: mov ecx, 0x10
0x100094967: call 0x100795530 ; 0x100795530
0x10009496c: mov qword ptr [r14 + 0x5608], rax
0x100094973: lea r8d, [rbx + rbx*2]
0x100094977: lea r9d, [rbx + rbx]
0x10009497b: xor edi, edi
0x10009497d: mov esi, 0x1d0
0x100094982: nop word ptr cs:[rax + rax]
0x100094990: mov ecx, edi
0x100094992: add rcx, rax
0x100094995: mov qword ptr [r14 + rsi - 0x150], rcx
0x10009499d: lea ecx, [rdi + rbx]
0x1000949a0: lea rdx, [rcx + rax]
0x1000949a4: mov qword ptr [r14 + rsi - 0xe0], rdx
0x1000949ac: add ecx, ebx
0x1000949ae: lea edx, [r9 + rdi]
0x1000949b2: add rdx, rax
0x1000949b5: mov qword ptr [r14 + rsi - 0x70], rdx
0x1000949ba: add ecx, ebx
0x1000949bc: add edi, r8d
0x1000949bf: add rdi, rax
0x1000949c2: mov qword ptr [r14 + rsi], rdi
0x1000949c6: add ecx, ebx
0x1000949c8: add rsi, 0x1c0
0x1000949cf: mov edi, ecx
0x1000949d1: cmp rsi, 0x4450
0x1000949d8: jne 0x100094990
0x1000949da: imul ecx, ebx, 0x98
0x1000949e0: add rcx, rax
0x1000949e3: mov qword ptr [r14 + 0x4300], rcx
0x1000949ea: imul ecx, ebx, 0x99
0x1000949f0: add rcx, rax
0x1000949f3: mov qword ptr [r14 + 0x4370], rcx
0x1000949fa: imul ecx, ebx, 0x9a
0x100094a00: add rcx, rax
0x100094a03: mov qword ptr [r14 + 0x43e0], rcx
0x100094a0a: imul ecx, ebx, 0x9b
0x100094a10: add rcx, rax
0x100094a13: mov qword ptr [r14 + 0x4450], rcx
0x100094a1a: imul ecx, ebx, 0x9c
0x100094a20: add rcx, rax
0x100094a23: mov qword ptr [r14 + 0x44c0], rcx
0x100094a2a: imul ecx, ebx, 0x9d
0x100094a30: add rcx, rax
0x100094a33: mov qword ptr [r14 + 0x4530], rcx
0x100094a3a: imul ecx, ebx, 0x9e
0x100094a40: add rcx, rax
0x100094a43: mov qword ptr [r14 + 0x45a0], rcx
0x100094a4a: imul ecx, ebx, 0x9f
0x100094a50: add rcx, rax
0x100094a53: mov qword ptr [r14 + 0x4610], rcx
0x100094a5a: mov ecx, ebx
0x100094a5c: shl ecx, 5
0x100094a5f: lea ecx, [rcx + rcx*4]
0x100094a62: add rcx, rax
0x100094a65: mov qword ptr [r14 + 0x4680], rcx
0x100094a6c: imul ecx, ebx, 0xa1
0x100094a72: add rcx, rax
0x100094a75: mov qword ptr [r14 + 0x46f0], rcx
0x100094a7c: imul ecx, ebx, 0xa2
0x100094a82: add rcx, rax
0x100094a85: mov qword ptr [r14 + 0x4760], rcx
0x100094a8c: imul ecx, ebx, 0xa3
0x100094a92: add rcx, rax
0x100094a95: mov qword ptr [r14 + 0x47d0], rcx
0x100094a9c: imul ecx, ebx, 0xa4
0x100094aa2: add rcx, rax
0x100094aa5: mov qword ptr [r14 + 0x4840], rcx
0x100094aac: imul ecx, ebx, 0xa5
0x100094ab2: add rcx, rax
0x100094ab5: mov qword ptr [r14 + 0x48b0], rcx
0x100094abc: imul ecx, ebx, 0xa6
0x100094ac2: add rcx, rax
0x100094ac5: mov qword ptr [r14 + 0x4920], rcx
0x100094acc: imul ecx, ebx, 0xa7
0x100094ad2: add rcx, rax
0x100094ad5: mov qword ptr [r14 + 0x4990], rcx
0x100094adc: imul ecx, ebx, 0xa8
0x100094ae2: add rcx, rax
0x100094ae5: mov qword ptr [r14 + 0x4a00], rcx
0x100094aec: imul ecx, ebx, 0xa9
0x100094af2: add rcx, rax
0x100094af5: mov qword ptr [r14 + 0x4a70], rcx
0x100094afc: imul ecx, ebx, 0xaa
0x100094b02: add rcx, rax
0x100094b05: mov qword ptr [r14 + 0x4ae0], rcx
0x100094b0c: imul ecx, ebx, 0xab
0x100094b12: add rcx, rax
0x100094b15: mov qword ptr [r14 + 0x4b50], rcx
0x100094b1c: imul ecx, ebx, 0xac
0x100094b22: add rcx, rax
0x100094b25: mov qword ptr [r14 + 0x4bc0], rcx
0x100094b2c: imul ecx, ebx, 0xad
0x100094b32: add rcx, rax
0x100094b35: mov qword ptr [r14 + 0x4c30], rcx
0x100094b3c: imul ecx, ebx, 0xae
0x100094b42: add rcx, rax
0x100094b45: mov qword ptr [r14 + 0x4ca0], rcx
0x100094b4c: imul ecx, ebx, 0xaf
0x100094b52: add rcx, rax
0x100094b55: mov qword ptr [r14 + 0x4d10], rcx
0x100094b5c: imul ecx, ebx, 0xb0
0x100094b62: add rcx, rax
0x100094b65: mov qword ptr [r14 + 0x4d80], rcx
0x100094b6c: imul ecx, ebx, 0xb1
0x100094b72: add rcx, rax
0x100094b75: mov qword ptr [r14 + 0x4df0], rcx
0x100094b7c: imul ecx, ebx, 0xb2
0x100094b82: add rcx, rax
0x100094b85: mov qword ptr [r14 + 0x4e60], rcx
0x100094b8c: imul ecx, ebx, 0xb3
0x100094b92: add rcx, rax
0x100094b95: mov qword ptr [r14 + 0x4ed0], rcx
0x100094b9c: imul ecx, ebx, 0xb4
0x100094ba2: add rcx, rax
0x100094ba5: mov qword ptr [r14 + 0x4f40], rcx
0x100094bac: imul ecx, ebx, 0xb5
0x100094bb2: add rcx, rax
0x100094bb5: mov qword ptr [r14 + 0x4fb0], rcx
0x100094bbc: imul ecx, ebx, 0xb6
0x100094bc2: add rcx, rax
0x100094bc5: mov qword ptr [r14 + 0x5020], rcx
0x100094bcc: imul ecx, ebx, 0xb7
0x100094bd2: add rcx, rax
0x100094bd5: mov qword ptr [r14 + 0x5090], rcx
0x100094bdc: imul ecx, ebx, 0xb8
0x100094be2: add rcx, rax
0x100094be5: mov qword ptr [r14 + 0x5100], rcx
0x100094bec: imul ecx, ebx, 0xb9
0x100094bf2: add rcx, rax
0x100094bf5: mov qword ptr [r14 + 0x5170], rcx
0x100094bfc: imul ecx, ebx, 0xba
0x100094c02: add rcx, rax
0x100094c05: mov qword ptr [r14 + 0x51e0], rcx
0x100094c0c: imul ecx, ebx, 0xbb
0x100094c12: add rcx, rax
0x100094c15: mov qword ptr [r14 + 0x5250], rcx
0x100094c1c: imul ecx, ebx, 0xbc
0x100094c22: add rcx, rax
0x100094c25: mov qword ptr [r14 + 0x52c0], rcx
0x100094c2c: imul ecx, ebx, 0xbd
0x100094c32: add rcx, rax
0x100094c35: mov qword ptr [r14 + 0x5330], rcx
0x100094c3c: imul ecx, ebx, 0xbe
0x100094c42: add rcx, rax
0x100094c45: mov qword ptr [r14 + 0x53a0], rcx
0x100094c4c: imul ecx, ebx, 0xbf
0x100094c52: add rcx, rax
0x100094c55: mov qword ptr [r14 + 0x5410], rcx
0x100094c5c: shl ebx, 6
0x100094c5f: lea ecx, [rbx + rbx*2]
0x100094c62: add rcx, rax
0x100094c65: mov qword ptr [r14 + 0x5480], rcx
0x100094c6c: mov rdi, qword ptr [r14]
0x100094c6f: movsxd rax, r15d
0x100094c72: mov qword ptr [rbp - 0x118], rax
0x100094c79: lea rbx, [rax + 1]
0x100094c7d: mov rsi, rbx
0x100094c80: shl rsi, 6
0x100094c84: mov rdx, qword ptr [rip + 0x1cdf97d] ; 0x101d74608
0x100094c8b: mov ecx, 0x10
0x100094c90: call 0x100795530 ; 0x100795530
0x100094c95: mov qword ptr [r14 + 0x5840], rax
0x100094c9c: mov rdi, qword ptr [r14]
0x100094c9f: imul r12, rbx, 0xf0
0x100094ca6: mov rdx, qword ptr [rip + 0x1cdf95b] ; 0x101d74608
0x100094cad: mov ecx, 0x10
0x100094cb2: mov rsi, r12
0x100094cb5: call 0x100795530 ; 0x100795530
0x100094cba: mov r13, rax
0x100094cbd: mov qword ptr [r14 + 0x5838], r13
0x100094cc4: cmp r15d, -1
0x100094cc8: mov qword ptr [rbp - 0x130], r14
0x100094ccf: je 0x100094dcf
0x100094cd5: xor ebx, ebx
0x100094cd7: nop word ptr [rax + rax]
0x100094ce0: lea rdi, [r13 + rbx]
0x100094ce5: call 0x1007f21f0 ; 0x1007f21f0
0x100094cea: add rbx, 0xf0
0x100094cf1: cmp r12, rbx
0x100094cf4: jne 0x100094ce0
0x100094cf6: mov rbx, qword ptr [rbp - 0x130]
0x100094cfd: mov qword ptr [rbx + 0x5838], r13
0x100094d04: test r15d, r15d
0x100094d07: setg al
0x100094d0a: mov dword ptr [rbp - 0x128], eax
0x100094d10: jle 0x100094dde
0x100094d16: mov word ptr [rbx + 0x5610], 0
0x100094d1f: mov r14, qword ptr [rbp - 0x120]
0x100094d26: movsxd rax, dword ptr [r14 + 0x40]
0x100094d2a: imul rsi, rax, 0xf0
0x100094d31: add rsi, r13
0x100094d34: lea rdi, [r13 + 0xf0]
0x100094d3b: call 0x1007f22c0 ; 0x1007f22c0
0x100094d40: cmp r15d, 1
0x100094d44: je 0x100094dbf
0x100094d46: mov rax, r15
0x100094d49: mov r15, rbx
0x100094d4c: mov qword ptr [rbp - 0x140], rax
0x100094d53: mov r12d, eax
0x100094d56: dec r12
0x100094d59: lea r13, [r14 + 0x84]
0x100094d60: xor eax, eax
0x100094d62: mov ebx, 0x1e0
0x100094d67: nop word ptr [rax + rax]
0x100094d70: mov rcx, qword ptr [r15 + 0x5838]
0x100094d77: lea r14, [rax + 1]
0x100094d7b: mov word ptr [r15 + rax*2 + 0x5612], r14w
0x100094d84: movsxd rax, dword ptr [r13]
0x100094d88: imul rsi, rax, 0xf0
0x100094d8f: add rsi, rcx
0x100094d92: lea rdi, [rcx + rbx]
0x100094d96: call 0x1007f22c0 ; 0x1007f22c0
0x100094d9b: add rbx, 0xf0
0x100094da2: add r13, 0x44
0x100094da6: mov rax, r14
0x100094da9: cmp r12, r14
0x100094dac: jne 0x100094d70
0x100094dae: mov rbx, r15
0x100094db1: mov r15, qword ptr [rbp - 0x140]
0x100094db8: mov r14, qword ptr [rbp - 0x120]
0x100094dbf: mov r12, qword ptr [rbp - 0x118]
0x100094dc6: mov r13d, dword ptr [rbp - 0x128]
0x100094dcd: jmp 0x100094def ; 0x100094def
0x100094dcf: mov qword ptr [r14 + 0x5838], r13
0x100094dd6: xor r13d, r13d
0x100094dd9: mov rbx, r14
0x100094ddc: jmp 0x100094de1 ; 0x100094de1
0x100094dde: xor r13d, r13d
0x100094de1: mov r14, qword ptr [rbp - 0x120]
0x100094de8: mov r12, qword ptr [rbp - 0x118]
0x100094def: mov esi, 0x3a
0x100094df4: mov rdi, r14
0x100094df7: call 0x100aa2c48 ; 0x100aa2c48 _strchr
0x100094dfc: test rax, rax
0x100094dff: jne 0x100094e0e
0x100094e01: mov esi, 0x5f
0x100094e06: mov rdi, r14
0x100094e09: call 0x100aa2c48 ; 0x100aa2c48 _strchr
0x100094e0e: lea ecx, [rax + 1]
0x100094e11: sub ecx, r14d
0x100094e14: xor edx, edx
0x100094e16: test rax, rax
0x100094e19: cmove ecx, edx
0x100094e1c: cmp ecx, 2
0x100094e1f: cmove ecx, edx
0x100094e22: mov dword ptr [rbx + 0x5810], ecx
0x100094e28: lea rdi, [rbx + 0x5610]
0x100094e2f: lea rsi, [rbx + r12*2 + 0x5610]
0x100094e37: mov qword ptr [rbp - 0x110], r14
0x100094e3e: mov qword ptr [rbp - 0x108], rbx
0x100094e45: lea rdx, [rbp - 0x110]
0x100094e4c: mov qword ptr [rbp - 0x138], rdi
0x100094e53: call 0x10009eb40 ; 0x10009eb40
0x100094e58: cmp byte ptr [rbx + 0x5830], 0
0x100094e5f: je 0x100094efd
0x100094e65: mov rdi, qword ptr [rbx]
0x100094e68: shl r12, 4
0x100094e6c: lea r14, [r12 + r12*2]
0x100094e70: mov rdx, qword ptr [rip + 0x1cdf791] ; 0x101d74608
0x100094e77: mov ecx, 0x10
0x100094e7c: mov rsi, r14
0x100094e7f: call 0x100795530 ; 0x100795530
0x100094e84: mov qword ptr [rbx + 0x5818], rax
0x100094e8b: mov rdi, qword ptr [rbx]
0x100094e8e: mov rdx, qword ptr [rip + 0x1cdf773] ; 0x101d74608
0x100094e95: mov ecx, 0x10
0x100094e9a: mov rsi, r14
0x100094e9d: call 0x100795530 ; 0x100795530
0x100094ea2: mov qword ptr [rbx + 0x5820], rax
0x100094ea9: test r13b, r13b
0x100094eac: je 0x100094efd
0x100094eae: mov eax, r15d
0x100094eb1: mov ecx, 0x20
0x100094eb6: nop word ptr cs:[rax + rax]
0x100094ec0: mov rdx, qword ptr [rbx + 0x6018]
0x100094ec7: mov rdx, qword ptr [rdx + 0x58]
0x100094ecb: mov rsi, qword ptr [rbx + 0x5818]
0x100094ed2: vmovaps xmm0, xmmword ptr [rdx + rcx - 0x20]
0x100094ed8: vmovaps xmmword ptr [rsi + rcx - 0x20], xmm0
0x100094ede: vmovaps xmm0, xmmword ptr [rdx + rcx - 0x10]
0x100094ee4: vmovaps xmmword ptr [rsi + rcx - 0x10], xmm0
0x100094eea: vmovaps xmm0, xmmword ptr [rdx + rcx]
0x100094eef: vmovaps xmmword ptr [rsi + rcx], xmm0
0x100094ef4: add rcx, 0x30
0x100094ef8: dec rax
0x100094efb: jne 0x100094ec0
0x100094efd: mov rdi, rbx
0x100094f00: call 0x100094550 ; 0x100094550
0x100094f05: mov rax, qword ptr [rbx + 0x6018]
0x100094f0c: mov ecx, dword ptr [rbx + 0x5810]
0x100094f12: mov qword ptr [rbp - 0x118], rcx
0x100094f19: mov qword ptr [rbp - 0x148], rax
0x100094f20: movsxd rax, dword ptr [rax + 0x54]
0x100094f24: lea rax, [rbx + rax*2 + 0x5610]
0x100094f2c: mov qword ptr [rbp - 0x158], rax
0x100094f33: sub rax, qword ptr [rbp - 0x138]
0x100094f3a: sar rax, 1
0x100094f3d: mov qword ptr [rbp - 0x150], rax
0x100094f44: xor eax, eax
0x100094f46: nop word ptr cs:[rax + rax]
0x100094f50: mov qword ptr [rbp - 0x140], rax
0x100094f57: shl rax, 5
0x100094f5b: lea rcx, [rip + 0xbe8d3e] ; 0x100c7dca0
0x100094f62: mov rbx, qword ptr [rax + rcx + 0x18]
0x100094f67: mov r12, qword ptr [rbp - 0x138]
0x100094f6e: cmp qword ptr [rbp - 0x150], 0
0x100094f76: je 0x100095028
0x100094f7c: mov rax, qword ptr [rbp - 0x148]
0x100094f83: mov rcx, qword ptr [rax + 0x60]
0x100094f87: mov rax, qword ptr [rbp - 0x118]
0x100094f8e: mov qword ptr [rbp - 0x128], rcx
0x100094f95: lea rax, [rcx + rax + 0x4400]
0x100094f9d: mov qword ptr [rbp - 0x120], rax
0x100094fa4: mov r12, qword ptr [rbp - 0x138]
0x100094fab: mov r13, qword ptr [rbp - 0x150]
0x100094fb2: mov r15, r13
0x100094fb5: nop word ptr cs:[rax + rax]
0x100094fc0: shr r15, 0x3f
0x100094fc4: add r15, r13
0x100094fc7: mov r14, r15
0x100094fca: and r14, 0xfffffffffffffffe
0x100094fce: movzx eax, word ptr [r12 + r14]
0x100094fd3: mov rsi, qword ptr [rbp - 0x120]
0x100094fda: mov rdi, rbx
0x100094fdd: cmp rax, 0x100
0x100094fe3: je 0x100094ffa
0x100094fe5: imul rdi, rax, 0x44
0x100094fe9: add rdi, qword ptr [rbp - 0x128]
0x100094ff0: add rdi, qword ptr [rbp - 0x118]
0x100094ff7: mov rsi, rbx
0x100094ffa: sar r15, 1
0x100094ffd: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100095002: test eax, eax
0x100095004: jns 0x100095020
0x100095006: dec r13
0x100095009: sub r13, r15
0x10009500c: lea r12, [r12 + r14 + 2]
0x100095011: mov r15, r13
0x100095014: test r15, r15
0x100095017: jne 0x100094fc0
0x100095019: jmp 0x100095028 ; 0x100095028
0x10009501b: nop dword ptr [rax + rax]
0x100095020: mov r13, r15
0x100095023: test r15, r15
0x100095026: jne 0x100094fc0
0x100095028: cmp r12, qword ptr [rbp - 0x158]
0x10009502f: je 0x100095076
0x100095031: movzx r14d, word ptr [r12]
0x100095036: imul rsi, r14, 0x44
0x10009503a: mov rax, qword ptr [rbp - 0x148]
0x100095041: add rsi, qword ptr [rax + 0x60]
0x100095045: add rsi, qword ptr [rbp - 0x118]
0x10009504c: mov rdi, rbx
0x10009504f: call 0x100aa2c4e ; 0x100aa2c4e _strcmp
0x100095054: test eax, eax
0x100095056: jne 0x100095076
0x100095058: mov rdx, qword ptr [rbp - 0x130]
0x10009505f: mov eax, dword ptr [rdx + 0x5850]
0x100095065: lea ecx, [rax + 1]
0x100095068: mov dword ptr [rdx + 0x5850], ecx
0x10009506e: mov dword ptr [rbp + rax*4 - 0x110], r14d
0x100095076: mov rax, qword ptr [rbp - 0x140]
0x10009507d: inc rax
0x100095080: cmp rax, 0x38
0x100095084: jne 0x100094f50
0x10009508a: mov rbx, qword ptr [rbp - 0x130]
0x100095091: mov rdi, qword ptr [rbx]
0x100095094: mov esi, dword ptr [rbx + 0x5850]
0x10009509a: shl rsi, 2
0x10009509e: mov rdx, qword ptr [rip + 0x1cdf563] ; 0x101d74608
0x1000950a5: mov ecx, 0x10
0x1000950aa: call 0x100795530 ; 0x100795530
0x1000950af: mov qword ptr [rbx + 0x5858], rax
0x1000950b6: mov edx, dword ptr [rbx + 0x5850]
0x1000950bc: shl rdx, 2
0x1000950c0: lea rsi, [rbp - 0x110]
0x1000950c7: mov rdi, rax
0x1000950ca: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1000950cf: mov rax, qword ptr [rip + 0xb78802] ; 0x100c0d8d8
0x1000950d6: mov rax, qword ptr [rax]
0x1000950d9: cmp rax, qword ptr [rbp - 0x30]
0x1000950dd: jne 0x1000950f1
0x1000950df: add rsp, 0x138
0x1000950e6: pop rbx
0x1000950e7: pop r12
0x1000950e9: pop r13
0x1000950eb: pop r14
0x1000950ed: pop r15
0x1000950ef: pop rbp
0x1000950f0: ret 
0x1000950f1: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1000950f6: mov dword ptr [rsp], 0x100
0x1000950fd: lea rdi, [rip + 0xad0866] ; 0x100b6596a boneCount <= kMaxBones
0x100095104: lea rsi, [rip + 0xad04e9] ; 0x100b655f4 AnimationInstance.cpp
0x10009510b: lea r8, [rip + 0xad086f] ; 0x100b65981 Skeleton with %u bones exceeds bone limit of %u
0x100095112: mov edx, 0x194
0x100095117: mov ecx, 4
0x10009511c: xor eax, eax
0x10009511e: mov r9d, r15d
0x100095121: call 0x1007e6030 ; 0x1007e6030
0x100095126: ud2 
0x100095128: mov r14, rax
0x10009512b: test rbx, rbx
0x10009512e: je 0x10009515a
0x100095130: add rbx, -0xf0
0x100095137: nop word ptr [rax + rax]
0x100095140: lea rdi, [r13 + rbx]
0x100095145: call 0x1007f2580 ; 0x1007f2580
0x10009514a: add rbx, -0xf0
0x100095151: cmp rbx, -0xf0
0x100095158: jne 0x100095140
0x10009515a: mov rdi, r14
0x10009515d: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100095162: nop word ptr cs:[rax + rax]
