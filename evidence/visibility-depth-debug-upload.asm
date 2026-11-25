0x100720a40: push rbp
0x100720a41: mov rbp, rsp
0x100720a44: push r15
0x100720a46: push r14
0x100720a48: push r13
0x100720a4a: push r12
0x100720a4c: push rbx
0x100720a4d: sub rsp, 0x78
0x100720a51: mov r14, rsi
0x100720a54: mov rbx, rdi
0x100720a57: cmp byte ptr [rip + 0x191b58a], 0 ; 0x10203bfe8
0x100720a5e: je 0x100720d90
0x100720a64: mov eax, dword ptr [rbx + 0x218]
0x100720a6a: test eax, eax
0x100720a6c: je 0x100720d90
0x100720a72: dec eax
0x100720a74: vcvtsi2ss xmm0, xmm0, rax
0x100720a79: vmulss xmm0, xmm0, dword ptr [rip + 0x191b8e7] ; 0x10203c368
0x100720a81: vcvttss2si r12, xmm0
0x100720a86: mov rdi, qword ptr [rbx + 0x220]
0x100720a8d: test rdi, rdi
0x100720a90: mov qword ptr [rbp - 0x30], rbx
0x100720a94: je 0x100720ae2
0x100720a96: cmp dword ptr [rbx + 0x230], r12d
0x100720a9d: jne 0x100720ac1
0x100720a9f: mov r14d, dword ptr [rdi + 0x10]
0x100720aa3: mov r15d, r12d
0x100720aa6: cmp r14d, dword ptr [rbx + r15*4 + 0xd8]
0x100720aae: jne 0x100720ac1
0x100720ab0: mov eax, dword ptr [rdi + 0x14]
0x100720ab3: cmp eax, dword ptr [rbx + r15*4 + 0x128]
0x100720abb: je 0x100720bd6
0x100720ac1: call 0x1007f0c90 ; 0x1007f0c90
0x100720ac6: lea r14, [rbx + 0x228]
0x100720acd: mov rdi, qword ptr [rbx + 0x228]
0x100720ad4: call 0x1007f0510 ; 0x1007f0510
0x100720ad9: mov rdi, qword ptr [rbx + 0x228]
0x100720ae0: jmp 0x100720b53 ; 0x100720b53
0x100720ae2: mov rdx, qword ptr [rip + 0x191b39f] ; 0x10203be88
0x100720ae9: mov esi, 0x78
0x100720aee: mov ecx, 8
0x100720af3: mov rdi, r14
0x100720af6: call 0x100795530 ; 0x100795530
0x100720afb: mov r15, rax
0x100720afe: mov rdi, r15
0x100720b01: call 0x1007f0590 ; 0x1007f0590
0x100720b06: mov rax, qword ptr [rbp - 0x30]
0x100720b0a: mov qword ptr [rax + 0x220], r15
0x100720b11: mov rbx, qword ptr [rbp - 0x30]
0x100720b15: mov rdx, qword ptr [rip + 0x191b36c] ; 0x10203be88
0x100720b1c: mov esi, 0x28
0x100720b21: mov ecx, 4
0x100720b26: mov rdi, r14
0x100720b29: call 0x100795530 ; 0x100795530
0x100720b2e: mov rdi, rax
0x100720b31: vmovaps ymm0, ymmword ptr [rip + 0x3b8da7] ; 0x100ad98e0
0x100720b39: vmovups ymmword ptr [rdi], ymm0
0x100720b3d: mov qword ptr [rdi + 0x20], 1
0x100720b45: lea r14, [rbx + 0x228]
0x100720b4c: mov qword ptr [rbx + 0x228], rdi
0x100720b53: mov dword ptr [rbp - 0x70], 1
0x100720b5a: vmovaps ymm0, ymmword ptr [rip + 0x3b8d9e] ; 0x100ad9900
0x100720b62: vmovups ymmword ptr [rbp - 0x90], ymm0
0x100720b6a: lea rsi, [rbp - 0x90]
0x100720b71: vzeroupper 
0x100720b74: call 0x1007f04d0 ; 0x1007f04d0
0x100720b79: mov rdi, qword ptr [rbx + 0x220]
0x100720b80: mov r15d, r12d
0x100720b83: mov ecx, dword ptr [rbx + r15*4 + 0xd8]
0x100720b8b: mov r8d, dword ptr [rbx + r15*4 + 0x128]
0x100720b93: mov dword ptr [rsp], 0
0x100720b9a: lea rsi, [rip + 0x47bffe] ; 0x100b9cb9f SoftwareDepthVis
0x100720ba1: mov edx, 2
0x100720ba6: mov r9d, 6
0x100720bac: call 0x1007f0850 ; 0x1007f0850
0x100720bb1: mov rax, qword ptr [rbx + 0x220]
0x100720bb8: mov rcx, qword ptr [r14]
0x100720bbb: mov qword ptr [rax + 8], rcx
0x100720bbf: mov dword ptr [rbx + 0x230], r12d
0x100720bc6: mov r14d, dword ptr [rbx + r15*4 + 0xd8]
0x100720bce: mov eax, dword ptr [rbx + r15*4 + 0x128]
0x100720bd6: mov qword ptr [rbp - 0x50], rax
0x100720bda: mov rcx, qword ptr [rbx + r15*8 + 0x38]
0x100720bdf: mov qword ptr [rbp - 0x68], rcx
0x100720be3: mov ebx, r14d
0x100720be6: imul ebx, eax
0x100720be9: shl ebx, 2
0x100720bec: call 0x1007c6c20 ; 0x1007c6c20
0x100720bf1: lea rcx, [rip + 0x1927f58] ; 0x102048b50
0x100720bf8: mov rdx, qword ptr [rcx]
0x100720bfb: mov ecx, 1
0x100720c00: mov rdi, rax
0x100720c03: mov rsi, rbx
0x100720c06: call 0x100795530 ; 0x100795530
0x100720c0b: mov rcx, qword ptr [rbp - 0x50]
0x100720c0f: mov r13, rax
0x100720c12: test ecx, ecx
0x100720c14: je 0x100720d61
0x100720c1a: mov r14d, r14d
0x100720c1d: test r14d, r14d
0x100720c20: je 0x100720d61
0x100720c26: lea eax, [rcx - 1]
0x100720c29: mov edx, r14d
0x100720c2c: neg edx
0x100720c2e: imul eax, r14d
0x100720c32: lea eax, [rax*4 + 3]
0x100720c39: lea ecx, [r14*4]
0x100720c41: mov dword ptr [rbp - 0x34], ecx
0x100720c44: xor edi, edi
0x100720c46: vmovss xmm2, dword ptr [rip + 0x384472] ; 0x100aa50c0
0x100720c4e: xor ecx, ecx
0x100720c50: mov qword ptr [rbp - 0x60], r13
0x100720c54: nop word ptr cs:[rax + rax]
0x100720c60: lea ebx, [rcx + rcx]
0x100720c63: and ebx, 2
0x100720c66: mov dword ptr [rbp - 0x44], ebx
0x100720c69: mov ebx, ecx
0x100720c6b: and ebx, 0xfffffffe
0x100720c6e: mov dword ptr [rbp - 0x40], ebx
0x100720c71: mov qword ptr [rbp - 0x58], rcx
0x100720c75: or ecx, 1
0x100720c78: mov dword ptr [rbp - 0x3c], ecx
0x100720c7b: xor ebx, ebx
0x100720c7d: mov dword ptr [rbp - 0x38], eax
0x100720c80: mov r12d, eax
0x100720c83: xor r15d, r15d
0x100720c86: nop word ptr cs:[rax + rax]
0x100720c90: mov eax, ebx
0x100720c92: and eax, 0xfffffffc
0x100720c95: mov ecx, r15d
0x100720c98: and ecx, 1
0x100720c9b: or ecx, dword ptr [rbp - 0x44]
0x100720c9e: or ecx, eax
0x100720ca0: cmp ecx, r14d
0x100720ca3: mov eax, dword ptr [rbp - 0x3c]
0x100720ca6: cmovb eax, dword ptr [rbp - 0x40]
0x100720caa: mov r13d, edx
0x100720cad: cmovb edx, edi
0x100720cb0: add edx, ecx
0x100720cb2: imul eax, r14d
0x100720cb6: add eax, edx
0x100720cb8: mov rcx, qword ptr [rbp - 0x30]
0x100720cbc: mov rcx, qword ptr [rcx + 0x10]
0x100720cc0: vmovss xmm0, dword ptr [rcx + 0xc]
0x100720cc5: mov rcx, qword ptr [rbp - 0x68]
0x100720cc9: vsubss xmm1, xmm2, dword ptr [rcx + rax*4]
0x100720cce: vdivss xmm0, xmm0, xmm1
0x100720cd2: vaddss xmm0, xmm0, xmm2
0x100720cd6: call 0x100aa2858 ; 0x100aa2858 _logf
0x100720cdb: vmovss xmm1, dword ptr [rip + 0x3b8b5d] ; 0x100ad9840
0x100720ce3: vmovss xmm2, dword ptr [rip + 0x3843d5] ; 0x100aa50c0
0x100720ceb: xor edi, edi
0x100720ced: mov edx, r13d
0x100720cf0: mov r13, qword ptr [rbp - 0x60]
0x100720cf4: vdivss xmm0, xmm0, xmm1
0x100720cf8: vmovss xmm1, dword ptr [rip + 0x386fc4] ; 0x100aa7cc4
0x100720d00: vminss xmm0, xmm0, xmm1
0x100720d04: vcvttss2si eax, xmm0
0x100720d08: movzx eax, al
0x100720d0b: lea ecx, [r12 - 3]
0x100720d10: mov byte ptr [r13 + rcx], al
0x100720d15: lea ecx, [r12 - 2]
0x100720d1a: mov byte ptr [r13 + rcx], al
0x100720d1f: lea ecx, [r12 - 1]
0x100720d24: mov byte ptr [r13 + rcx], al
0x100720d29: imul eax, eax
0x100720d2c: shr eax, 8
0x100720d2f: not al
0x100720d31: mov ecx, r12d
0x100720d34: mov byte ptr [r13 + rcx], al
0x100720d39: inc r15
0x100720d3c: add r12d, 4
0x100720d40: add ebx, 2
0x100720d43: cmp r14, r15
0x100720d46: jne 0x100720c90
0x100720d4c: mov rcx, qword ptr [rbp - 0x58]
0x100720d50: inc ecx
0x100720d52: mov eax, dword ptr [rbp - 0x38]
0x100720d55: sub eax, dword ptr [rbp - 0x34]
0x100720d58: cmp ecx, dword ptr [rbp - 0x50]
0x100720d5b: jne 0x100720c60
0x100720d61: mov r14, qword ptr [rbp - 0x30]
0x100720d65: mov rdi, qword ptr [r14 + 0x220]
0x100720d6c: mov rsi, r13
0x100720d6f: call 0x1007f0e00 ; 0x1007f0e00
0x100720d74: mov rdi, qword ptr [r14 + 0x220]
0x100720d7b: call 0x1007f1390 ; 0x1007f1390
0x100720d80: call 0x1007c6c20 ; 0x1007c6c20
0x100720d85: mov rdi, rax
0x100720d88: mov rsi, r13
0x100720d8b: call 0x100795a70 ; 0x100795a70
0x100720d90: add rsp, 0x78
0x100720d94: pop rbx
0x100720d95: pop r12
0x100720d97: pop r13
0x100720d99: pop r14
0x100720d9b: pop r15
0x100720d9d: pop rbp
0x100720d9e: ret 
0x100720d9f: mov rdi, rax
0x100720da2: call 0x100011bf0 ; 0x100011bf0
0x100720da7: mov r14, rax
0x100720daa: call 0x1007c6c20 ; 0x1007c6c20
0x100720daf: mov rdi, rax
0x100720db2: mov rsi, r13
0x100720db5: call 0x100795a70 ; 0x100795a70
0x100720dba: mov rdi, r14
0x100720dbd: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x100720dc2: mov rdi, rax
0x100720dc5: call 0x100011bf0 ; 0x100011bf0
0x100720dca: nop word ptr [rax + rax]
