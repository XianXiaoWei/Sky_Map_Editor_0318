0x1007f6280: push rbp
0x1007f6281: mov rbp, rsp
0x1007f6284: push r15
0x1007f6286: push r14
0x1007f6288: push r13
0x1007f628a: push r12
0x1007f628c: push rbx
0x1007f628d: sub rsp, 0x1d8
0x1007f6294: mov r15, rdx
0x1007f6297: mov r12, rsi
0x1007f629a: mov r13, rdi
0x1007f629d: cmp byte ptr [r13 + 0x538], 0
0x1007f62a5: je 0x1007f6526
0x1007f62ab: lea r14, [rbp - 0x1fc]
0x1007f62b2: vxorps ymm0, ymm0, ymm0
0x1007f62b6: vmovups ymmword ptr [rbp - 0xbc], ymm0
0x1007f62be: vmovups ymmword ptr [rbp - 0x9c], ymm0
0x1007f62c6: vmovups ymmword ptr [rbp - 0x5c], ymm0
0x1007f62cb: vmovups ymmword ptr [rbp - 0x7c], ymm0
0x1007f62d0: vmovups ymmword ptr [rbp - 0xdc], ymm0
0x1007f62d8: vmovups ymmword ptr [rbp - 0xfc], ymm0
0x1007f62e0: vmovups ymmword ptr [rbp - 0x11c], ymm0
0x1007f62e8: vmovups ymmword ptr [rbp - 0x13c], ymm0
0x1007f62f0: vmovups ymmword ptr [rbp - 0x15c], ymm0
0x1007f62f8: vmovups ymmword ptr [rbp - 0x17c], ymm0
0x1007f6300: vmovups ymmword ptr [rbp - 0x19c], ymm0
0x1007f6308: vmovups ymmword ptr [rbp - 0x1bc], ymm0
0x1007f6310: vmovups ymmword ptr [rbp - 0x1dc], ymm0
0x1007f6318: vmovups ymmword ptr [rbp - 0x1fc], ymm0
0x1007f6320: mov qword ptr [rbp - 0x3c], 0
0x1007f6328: mov word ptr [rbp - 0xa8], 0x101
0x1007f6331: mov byte ptr [rbp - 0xa6], 0
0x1007f6338: vmovddup xmm0, qword ptr [rip + 0x2bce00] ; 0x100ab3140
0x1007f6340: vmovupd xmmword ptr [rbp - 0xa4], xmm0
0x1007f6348: mov dword ptr [rbp - 0x94], 0
0x1007f6352: mov dword ptr [rbp - 0x90], 0
0x1007f635c: mov byte ptr [rbp - 0x8c], 1
0x1007f6363: mov byte ptr [rbp - 0x8b], 1
0x1007f636a: mov byte ptr [rbp - 0x8a], 0
0x1007f6371: vmovupd xmmword ptr [rbp - 0x88], xmm0
0x1007f6379: mov dword ptr [rbp - 0x78], 0
0x1007f6380: mov dword ptr [rbp - 0x74], 0
0x1007f6387: mov byte ptr [rbp - 0x70], 1
0x1007f638b: mov byte ptr [rbp - 0x6f], 1
0x1007f638f: mov byte ptr [rbp - 0x6e], 0
0x1007f6393: vmovupd xmmword ptr [rbp - 0x6c], xmm0
0x1007f6398: mov dword ptr [rbp - 0x5c], 0
0x1007f639f: mov dword ptr [rbp - 0x58], 0
0x1007f63a6: mov byte ptr [rbp - 0x54], 1
0x1007f63aa: mov byte ptr [rbp - 0x53], 1
0x1007f63ae: mov byte ptr [rbp - 0x52], 0
0x1007f63b2: mov dword ptr [rbp - 0x50], 1
0x1007f63b9: mov dword ptr [rbp - 0x4c], 0
0x1007f63c0: mov eax, 1
0x1007f63c5: vmovd xmm0, eax
0x1007f63c9: vmovdqu xmmword ptr [rbp - 0x48], xmm0
0x1007f63ce: mov byte ptr [rbp - 0x38], 1
0x1007f63d2: mov byte ptr [rbp - 0x37], 0
0x1007f63d6: mov dword ptr [rbp - 0x34], 0
0x1007f63dd: mov dword ptr [rbp - 0x30], 0
0x1007f63e4: mov dword ptr [rbp - 0x2c], 0
0x1007f63eb: mov rax, qword ptr [r13 + 0x4f8]
0x1007f63f2: mov ebx, dword ptr [rax]
0x1007f63f4: mov dword ptr [rbp - 0x200], ebx
0x1007f63fa: mov rsi, qword ptr [r13]
0x1007f63fe: mov edx, 0x134
0x1007f6403: mov rdi, r14
0x1007f6406: vzeroupper 
0x1007f6409: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1007f640e: vmovups ymm0, ymmword ptr [r12]
0x1007f6414: vmovups ymmword ptr [rbp - 0xc8], ymm0
0x1007f641c: vmovups ymm0, ymmword ptr [r15]
0x1007f6421: vmovups ymm1, ymmword ptr [r15 + 0x20]
0x1007f6427: vmovups ymm2, ymmword ptr [r15 + 0x40]
0x1007f642d: vmovups ymm3, ymmword ptr [r15 + 0x60]
0x1007f6433: vmovups ymmword ptr [rbp - 0x48], ymm3
0x1007f6438: vmovups ymmword ptr [rbp - 0x68], ymm2
0x1007f643d: vmovups ymmword ptr [rbp - 0x88], ymm1
0x1007f6445: vmovups ymmword ptr [rbp - 0xa8], ymm0
0x1007f644d: cmp ebx, dword ptr [r13 + 0x94]
0x1007f6454: jne 0x1007f64c5
0x1007f6456: lea rsi, [r13 + 0x98]
0x1007f645d: mov edx, 0x134
0x1007f6462: mov rdi, r14
0x1007f6465: vzeroupper 
0x1007f6468: call 0x100aa28ee ; 0x100aa28ee _memcmp
0x1007f646d: test eax, eax
0x1007f646f: jne 0x1007f64c5
0x1007f6471: lea rax, [rbp - 0xc8]
0x1007f6478: mov rcx, qword ptr [rax + 0x18]
0x1007f647c: xor rcx, qword ptr [r13 + 0x1e4]
0x1007f6483: mov rdx, qword ptr [rax]
0x1007f6486: mov rsi, qword ptr [rax + 8]
0x1007f648a: xor rsi, qword ptr [r13 + 0x1d4]
0x1007f6491: or rsi, rcx
0x1007f6494: mov rax, qword ptr [rax + 0x10]
0x1007f6498: xor rax, qword ptr [r13 + 0x1dc]
0x1007f649f: xor rdx, qword ptr [r13 + 0x1cc]
0x1007f64a6: or rdx, rax
0x1007f64a9: or rdx, rsi
0x1007f64ac: jne 0x1007f64c5
0x1007f64ae: lea rdi, [rbp - 0xa8]
0x1007f64b5: lea rsi, [r13 + 0x1ec]
0x1007f64bc: call 0x1007f6e30 ; 0x1007f6e30
0x1007f64c1: test al, al
0x1007f64c3: jne 0x1007f6526
0x1007f64c5: vzeroupper 
0x1007f64c8: call 0x1007c1470 ; 0x1007c1470
0x1007f64cd: mov rcx, qword ptr [rax]
0x1007f64d0: lea r14, [rbp - 0x200]
0x1007f64d7: mov rdi, rax
0x1007f64da: mov rsi, r14
0x1007f64dd: call qword ptr [rcx + 0xa8]
0x1007f64e3: mov ebx, eax
0x1007f64e5: lea rdi, [r13 + 0x270]
0x1007f64ec: mov esi, ebx
0x1007f64ee: call 0x1007c0080 ; 0x1007c0080
0x1007f64f3: call 0x1007c1470 ; 0x1007c1470
0x1007f64f8: mov rcx, qword ptr [rax]
0x1007f64fb: mov esi, dword ptr [r13 + 0x90]
0x1007f6502: mov rdi, rax
0x1007f6505: call qword ptr [rcx + 0xc0]
0x1007f650b: mov dword ptr [r13 + 0x90], ebx
0x1007f6512: lea rdi, [r13 + 0x94]
0x1007f6519: mov edx, 0x1d8
0x1007f651e: mov rsi, r14
0x1007f6521: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1007f6526: add rsp, 0x1d8
0x1007f652d: pop rbx
0x1007f652e: pop r12
0x1007f6530: pop r13
0x1007f6532: pop r14
0x1007f6534: pop r15
0x1007f6536: pop rbp
0x1007f6537: ret 
0x1007f6538: nop dword ptr [rax + rax]
