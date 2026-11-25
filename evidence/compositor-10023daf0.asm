0x10023daf0: push rbp
0x10023daf1: mov rbp, rsp
0x10023daf4: push r15
0x10023daf6: push r14
0x10023daf8: push r13
0x10023dafa: push r12
0x10023dafc: push rbx
0x10023dafd: and rsp, 0xffffffffffffffe0
0x10023db01: sub rsp, 0x198a0
0x10023db08: mov rbx, r9
0x10023db0b: mov qword ptr [rsp + 0x10], r8
0x10023db10: mov r15, rcx
0x10023db13: mov r13, rsi
0x10023db16: mov r14, rdi
0x10023db19: lea r12, [rsp + 0x50]
0x10023db1e: mov rdi, r12
0x10023db21: call 0x100247850 ; 0x100247850
0x10023db26: mov rdi, r14
0x10023db29: mov rsi, r12
0x10023db2c: mov rdx, r13
0x10023db2f: call 0x10023de50 ; 0x10023de50
0x10023db34: mov rdi, rbx
0x10023db37: call 0x100596200 ; 0x100596200
0x10023db3c: vcvttss2si rdx, dword ptr [r14 + 0x30]
0x10023db42: vcvttss2si rcx, dword ptr [r14 + 0x34]
0x10023db48: lea rsi, [rsp + 0x50]
0x10023db4d: mov r8d, 1
0x10023db53: mov rdi, r14
0x10023db56: call 0x100243a30 ; 0x100243a30
0x10023db5b: mov qword ptr [rsp + 8], rbx
0x10023db60: mov eax, dword ptr [r14 + 0x1f600]
0x10023db67: test eax, eax
0x10023db69: je 0x10023dc03
0x10023db6f: xor edx, edx
0x10023db71: mov qword ptr [rsp], r15
0x10023db75: mov edx, edx
0x10023db77: imul rbx, rdx, 0x38
0x10023db7b: lea r13, [r14 + rbx + 0x1f630]
0x10023db83: mov ecx, dword ptr [r14 + rbx + 0x1f630]
0x10023db8b: test ecx, ecx
0x10023db8d: je 0x10023dbf1
0x10023db8f: mov qword ptr [rsp + 0x18], rdx
0x10023db94: mov r12, r14
0x10023db97: lea r15, [r14 + rbx + 0x1f638]
0x10023db9f: xor r14d, r14d
0x10023dba2: nop word ptr cs:[rax + rax]
0x10023dbb0: cmp dword ptr [r15], 0
0x10023dbb4: je 0x10023dbd6
0x10023dbb6: call 0x1007c1470 ; 0x1007c1470
0x10023dbbb: mov rcx, qword ptr [rax]
0x10023dbbe: mov edx, r14d
0x10023dbc1: lea rsi, [r12 + rbx]
0x10023dbc5: mov esi, dword ptr [rsi + rdx*4 + 0x1f638]
0x10023dbcc: mov rdi, rax
0x10023dbcf: call qword ptr [rcx + 0x70]
0x10023dbd2: mov ecx, dword ptr [r13]
0x10023dbd6: inc r14d
0x10023dbd9: cmp r14d, ecx
0x10023dbdc: jb 0x10023dbb0
0x10023dbde: mov r14, r12
0x10023dbe1: mov eax, dword ptr [r14 + 0x1f600]
0x10023dbe8: mov r15, qword ptr [rsp]
0x10023dbec: mov rdx, qword ptr [rsp + 0x18]
0x10023dbf1: mov dword ptr [r13], 0
0x10023dbf9: inc edx
0x10023dbfb: cmp edx, eax
0x10023dbfd: jb 0x10023db75
0x10023dc03: cmp dword ptr [rsp + 0x50], 0
0x10023dc08: je 0x10023dc4a
0x10023dc0a: lea r13, [r14 + 0x1b800]
0x10023dc11: xor ebx, ebx
0x10023dc13: nop word ptr cs:[rax + rax]
0x10023dc20: mov eax, ebx
0x10023dc22: imul rcx, rax, 0xf0
0x10023dc29: lea rsi, [rsp + rcx + 0x58]
0x10023dc2e: imul rax, rax, 0x38
0x10023dc32: lea rdi, [r14 + rax + 0x1f608]
0x10023dc3a: mov rdx, r13
0x10023dc3d: call 0x100242d10 ; 0x100242d10
0x10023dc42: inc ebx
0x10023dc44: cmp ebx, dword ptr [rsp + 0x50]
0x10023dc48: jb 0x10023dc20
0x10023dc4a: mov eax, dword ptr [r14 + 0x1d0]
0x10023dc51: mov dword ptr [r14 + 0x1f600], eax
0x10023dc58: lea rsi, [rsp + 0x50]
0x10023dc5d: mov rdi, r14
0x10023dc60: mov rdx, r15
0x10023dc63: call 0x100244030 ; 0x100244030
0x10023dc68: mov rbx, qword ptr [rsp + 8]
0x10023dc6d: lea rsi, [rsp + 0x50]
0x10023dc72: mov rdi, r14
0x10023dc75: mov rdx, r15
0x10023dc78: mov rcx, rbx
0x10023dc7b: call 0x100244410 ; 0x100244410
0x10023dc80: lea rsi, [rsp + 0x50]
0x10023dc85: mov rdi, r14
0x10023dc88: mov rdx, r15
0x10023dc8b: mov rcx, rbx
0x10023dc8e: call 0x1002445a0 ; 0x1002445a0
0x10023dc93: mov r12, r14
0x10023dc96: cmp dword ptr [rsp + 0x157d8], 0
0x10023dc9e: mov r13, qword ptr [rsp + 0x10]
0x10023dca3: je 0x10023dd17
0x10023dca5: xor ebx, ebx
0x10023dca7: lea r15, [rsp + 0x20]
0x10023dcac: nop dword ptr [rax]
0x10023dcb0: mov ebx, ebx
0x10023dcb2: vxorps ymm0, ymm0, ymm0
0x10023dcb6: vmovaps ymmword ptr [rsp + 0x20], ymm0
0x10023dcbc: imul r14, rbx, 0x88
0x10023dcc3: mov eax, dword ptr [rsp + r14 + 0x157e0]
0x10023dccb: imul rax, rax, 0xf0
0x10023dcd2: lea rsi, [rsp + rax + 0x78]
0x10023dcd7: mov rdi, r12
0x10023dcda: mov rdx, r15
0x10023dcdd: vzeroupper 
0x10023dce0: call 0x100241e30 ; 0x100241e30
0x10023dce5: mov ecx, dword ptr [rsp + r14 + 0x157dc]
0x10023dced: imul rcx, rcx, 0xe8
0x10023dcf4: lea rdi, [r13 + rcx + 0x10]
0x10023dcf9: lea rdx, [rsp + r14 + 0x157e4]
0x10023dd01: movzx ecx, al
0x10023dd04: mov rsi, r15
0x10023dd07: call 0x1007b9fc0 ; 0x1007b9fc0
0x10023dd0c: inc ebx
0x10023dd0e: cmp ebx, dword ptr [rsp + 0x157d8]
0x10023dd15: jb 0x10023dcb0
0x10023dd17: cmp dword ptr [r12 + 0x387d0], 0
0x10023dd20: je 0x10023dd57
0x10023dd22: xor ebx, ebx
0x10023dd24: nop word ptr cs:[rax + rax]
0x10023dd30: mov rdi, qword ptr [r12 + 0x1b0]
0x10023dd38: mov rax, qword ptr [rdi]
0x10023dd3b: mov ecx, ebx
0x10023dd3d: mov esi, dword ptr [r12 + rcx*4 + 0x387d4]
0x10023dd45: call qword ptr [rax + 0xa0]
0x10023dd4b: inc ebx
0x10023dd4d: cmp ebx, dword ptr [r12 + 0x387d0]
0x10023dd55: jb 0x10023dd30
0x10023dd57: cmp dword ptr [r12 + 0x17660], 0
0x10023dd60: je 0x10023dda8
0x10023dd62: xor eax, eax
0x10023dd64: nop word ptr cs:[rax + rax]
0x10023dd70: mov rdi, qword ptr [r12 + 0x1b0]
0x10023dd78: mov rcx, qword ptr [rdi]
0x10023dd7b: mov ebx, eax
0x10023dd7d: lea rax, [rbx + rbx*8]
0x10023dd81: lea rsi, [r12 + rax*8 + 0x17680]
0x10023dd89: call qword ptr [rcx + 0x98]
0x10023dd8f: mov dword ptr [r12 + rbx*4 + 0x387d4], eax
0x10023dd97: lea eax, [rbx + 1]
0x10023dd9a: mov ecx, dword ptr [r12 + 0x17660]
0x10023dda2: cmp eax, ecx
0x10023dda4: jb 0x10023dd70
0x10023dda6: jmp 0x10023ddaa ; 0x10023ddaa
0x10023dda8: xor ecx, ecx
0x10023ddaa: mov dword ptr [r12 + 0x387d0], ecx
0x10023ddb2: add r12, 0x1d0
0x10023ddb9: lea rsi, [rsp + 0x50]
0x10023ddbe: mov rdi, r12
0x10023ddc1: call 0x100244a30 ; 0x100244a30
0x10023ddc6: lea rdi, [rsp + 0x50]
0x10023ddcb: call 0x100249950 ; 0x100249950
0x10023ddd0: lea rsp, [rbp - 0x28]
0x10023ddd4: pop rbx
0x10023ddd5: pop r12
0x10023ddd7: pop r13
0x10023ddd9: pop r14
0x10023dddb: pop r15
0x10023dddd: pop rbp
0x10023ddde: ret 
0x10023dddf: jmp 0x10023dde9 ; 0x10023dde9
0x10023dde1: jmp 0x10023dde9 ; 0x10023dde9
0x10023dde3: jmp 0x10023dde9 ; 0x10023dde9
0x10023dde5: jmp 0x10023dde9 ; 0x10023dde9
0x10023dde7: jmp 0x10023dde9 ; 0x10023dde9
0x10023dde9: mov rbx, rax
0x10023ddec: lea rdi, [rsp + 0x50]
0x10023ddf1: call 0x100249950 ; 0x100249950
0x10023ddf6: mov rdi, rbx
0x10023ddf9: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x10023ddfe: nop 
