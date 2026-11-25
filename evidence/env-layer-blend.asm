0x10031aec0: push rbp
0x10031aec1: mov rbp, rsp
0x10031aec4: push r15
0x10031aec6: push r14
0x10031aec8: push r13
0x10031aeca: push r12
0x10031aecc: push rbx
0x10031aecd: sub rsp, 0x58
0x10031aed1: mov r15, rdx
0x10031aed4: mov rbx, rsi
0x10031aed7: mov r14, rdi
0x10031aeda: mov rax, qword ptr [rip + 0x8f29f7] ; 0x100c0d8d8
0x10031aee1: mov rax, qword ptr [rax]
0x10031aee4: mov qword ptr [rbp - 0x30], rax
0x10031aee8: test r15, r15
0x10031aeeb: je 0x10031aef7
0x10031aeed: mov edi, dword ptr [r15]
0x10031aef0: call 0x1007abd30 ; 0x1007abd30
0x10031aef5: jmp 0x10031aefc ; 0x10031aefc
0x10031aef7: call 0x1007abbf0 ; 0x1007abbf0
0x10031aefc: mov rdi, rax
0x10031aeff: mov rax, qword ptr [rdi]
0x10031af02: call qword ptr [rax + 0x68]
0x10031af05: mov qword ptr [rbp - 0x40], rax
0x10031af09: test rax, rax
0x10031af0c: jne 0x10031af17
0x10031af0e: call 0x1007abc60 ; 0x1007abc60
0x10031af13: mov qword ptr [rbp - 0x40], rax
0x10031af17: mov eax, dword ptr [r14 + 0x90]
0x10031af1e: test eax, eax
0x10031af20: je 0x10031af4a
0x10031af22: xor r12d, r12d
0x10031af25: nop word ptr cs:[rax + rax]
0x10031af30: mov r12d, r12d
0x10031af33: mov r13, qword ptr [r14 + r12*8 + 0x50]
0x10031af38: mov rcx, qword ptr [rbp - 0x40]
0x10031af3c: cmp qword ptr [r13 + 0x10], rcx
0x10031af40: je 0x10031af7a
0x10031af42: inc r12d
0x10031af45: cmp r12d, eax
0x10031af48: jb 0x10031af30
0x10031af4a: mov rax, qword ptr [rbp - 0x40]
0x10031af4e: mov r9, qword ptr [rax + 8]
0x10031af52: lea rdi, [rip + 0x865b91] ; 0x100b80aea varsIdx < m_varCount
0x10031af59: lea rsi, [rip + 0x865a6c] ; 0x100b809cc Environment.cpp
0x10031af60: lea r8, [rip + 0x865b98] ; 0x100b80aff No EnvVars of type %s registered with the Environment system
0x10031af67: mov edx, 0x16b
0x10031af6c: mov ecx, 4
0x10031af71: xor eax, eax
0x10031af73: call 0x1007e6030 ; 0x1007e6030
0x10031af78: ud2 
0x10031af7a: mov qword ptr [rbp - 0x58], rbx
0x10031af7e: mov rsi, qword ptr [r14 + r12*8 + 0x98]
0x10031af86: test rsi, rsi
0x10031af89: je 0x10031afe9
0x10031af8b: cmp dword ptr [r13 + 8], 0
0x10031af90: je 0x10031afe9
0x10031af92: mov rdi, qword ptr [r13]
0x10031af96: vxorps xmm0, xmm0, xmm0
0x10031af9a: mov rdx, rsi
0x10031af9d: mov rcx, r15
0x10031afa0: call 0x10031a230 ; 0x10031a230
0x10031afa5: cmp dword ptr [r13 + 8], 2
0x10031afaa: jb 0x10031afe9
0x10031afac: mov ebx, 1
0x10031afb1: nop word ptr cs:[rax + rax]
0x10031afc0: mov rsi, qword ptr [r14 + r12*8 + 0x98]
0x10031afc8: mov edi, ebx
0x10031afca: shl rdi, 3
0x10031afce: add rdi, qword ptr [r13]
0x10031afd2: vxorps xmm0, xmm0, xmm0
0x10031afd6: mov rdx, rsi
0x10031afd9: mov rcx, r15
0x10031afdc: call 0x10031a230 ; 0x10031a230
0x10031afe1: inc ebx
0x10031afe3: cmp ebx, dword ptr [r13 + 8]
0x10031afe7: jb 0x10031afc0
0x10031afe9: xor eax, eax
0x10031afeb: imul rcx, r12, 0x5400
0x10031aff2: shl r12, 4
0x10031aff6: add r12, r14
0x10031aff9: add rcx, r14
0x10031affc: mov qword ptr [rbp - 0x78], rcx
0x10031b000: mov qword ptr [rbp - 0x70], r15
0x10031b004: mov qword ptr [rbp - 0x68], r12
0x10031b008: nop dword ptr [rax + rax]
0x10031b010: mov qword ptr [rbp - 0x50], rax
0x10031b014: mov eax, dword ptr [r12 + rax*4 + 0x2a0d8]
0x10031b01c: mov qword ptr [rbp - 0x80], rax
0x10031b020: test rax, rax
0x10031b023: je 0x10031b1c0
0x10031b029: mov rbx, qword ptr [rbp - 0x40]
0x10031b02d: mov rax, qword ptr [rbx]
0x10031b030: mov r14, qword ptr [rax + 0xc0]
0x10031b037: mov rdi, rbx
0x10031b03a: call qword ptr [rax + 0xa0]
0x10031b040: add rax, 0xf
0x10031b044: and rax, 0xfffffffffffffff0
0x10031b048: mov rsi, rsp
0x10031b04b: sub rsi, rax
0x10031b04e: mov rsp, rsi
0x10031b051: mov rdi, rbx
0x10031b054: call r14
0x10031b057: mov r14, rax
0x10031b05a: mov rax, qword ptr [rbx]
0x10031b05d: mov rdi, rbx
0x10031b060: call qword ptr [rax + 0xa0]
0x10031b066: mov rdi, r14
0x10031b069: mov rsi, rax
0x10031b06c: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x10031b071: vxorps xmm0, xmm0, xmm0
0x10031b075: vmovss dword ptr [rbp - 0x34], xmm0
0x10031b07a: xor r12d, r12d
0x10031b07d: mov r15, qword ptr [rbp - 0x58]
0x10031b081: mov rbx, qword ptr [rbp - 0x50]
0x10031b085: nop word ptr cs:[rax + rax]
0x10031b090: mov dword ptr [rbp - 0x44], 0
0x10031b097: mov qword ptr [rbp - 0x60], 0
0x10031b09f: imul rax, rbx, 0x1500
0x10031b0a6: add rax, qword ptr [rbp - 0x78]
0x10031b0aa: imul rcx, r12, 0x38
0x10031b0ae: lea rdi, [rcx + rax + 0xd8]
0x10031b0b6: mov rsi, r15
0x10031b0b9: lea rdx, [rbp - 0x44]
0x10031b0bd: lea rcx, [rbp - 0x60]
0x10031b0c1: call 0x10031a6f0 ; 0x10031a6f0
0x10031b0c6: vmovss xmm0, dword ptr [rbp - 0x44]
0x10031b0cb: vmovss xmm1, dword ptr [rip + 0x78b9c9] ; 0x100aa6a9c
0x10031b0d3: vucomiss xmm1, xmm0
0x10031b0d7: ja 0x10031b13d
0x10031b0d9: mov rax, qword ptr [rbp - 0x40]
0x10031b0dd: cmp qword ptr [r13 + 0x10], rax
0x10031b0e1: jne 0x10031b1f5
0x10031b0e7: vmovss xmm1, dword ptr [rbp - 0x34]
0x10031b0ec: vaddss xmm1, xmm1, xmm0
0x10031b0f0: cmp dword ptr [r13 + 8], 0
0x10031b0f5: vmovss dword ptr [rbp - 0x34], xmm1
0x10031b0fa: je 0x10031b13d
0x10031b0fc: vdivss xmm0, xmm0, xmm1
0x10031b100: vmovss dword ptr [rbp - 0x38], xmm0
0x10031b105: xor ebx, ebx
0x10031b107: mov r15, qword ptr [rbp - 0x60]
0x10031b10b: nop dword ptr [rax + rax]
0x10031b110: mov rax, qword ptr [r13]
0x10031b114: mov ecx, ebx
0x10031b116: lea rdi, [rax + rcx*8]
0x10031b11a: vmovss xmm0, dword ptr [rbp - 0x38]
0x10031b11f: mov rsi, r14
0x10031b122: mov rdx, r15
0x10031b125: mov rcx, r14
0x10031b128: call 0x10031a230 ; 0x10031a230
0x10031b12d: inc ebx
0x10031b12f: cmp ebx, dword ptr [r13 + 8]
0x10031b133: jb 0x10031b110
0x10031b135: mov r15, qword ptr [rbp - 0x58]
0x10031b139: mov rbx, qword ptr [rbp - 0x50]
0x10031b13d: inc r12
0x10031b140: cmp r12, qword ptr [rbp - 0x80]
0x10031b144: jb 0x10031b090
0x10031b14a: vmovss xmm0, dword ptr [rbp - 0x34]
0x10031b14f: vucomiss xmm0, dword ptr [rip + 0x78b945] ; 0x100aa6a9c
0x10031b157: mov r15, qword ptr [rbp - 0x70]
0x10031b15b: mov r12, qword ptr [rbp - 0x68]
0x10031b15f: jbe 0x10031b1c0
0x10031b161: mov rax, qword ptr [rbp - 0x40]
0x10031b165: cmp qword ptr [r13 + 0x10], rax
0x10031b169: jne 0x10031b1f5
0x10031b16f: cmp dword ptr [r13 + 8], 0
0x10031b174: je 0x10031b1c0
0x10031b176: vmovaps xmm1, xmm0
0x10031b17a: vmovss xmm0, dword ptr [rip + 0x789f3e] ; 0x100aa50c0
0x10031b182: vminss xmm0, xmm0, xmm1
0x10031b186: vmovss dword ptr [rbp - 0x38], xmm0
0x10031b18b: xor ebx, ebx
0x10031b18d: nop dword ptr [rax]
0x10031b190: mov rax, qword ptr [r13]
0x10031b194: mov ecx, ebx
0x10031b196: lea rdi, [rax + rcx*8]
0x10031b19a: vmovss xmm0, dword ptr [rbp - 0x38]
0x10031b19f: mov rsi, r15
0x10031b1a2: mov rdx, r14
0x10031b1a5: mov rcx, r15
0x10031b1a8: call 0x10031a230 ; 0x10031a230
0x10031b1ad: inc ebx
0x10031b1af: cmp ebx, dword ptr [r13 + 8]
0x10031b1b3: jb 0x10031b190
0x10031b1b5: nop word ptr cs:[rax + rax]
0x10031b1c0: mov rax, qword ptr [rbp - 0x50]
0x10031b1c4: inc rax
0x10031b1c7: cmp rax, 4
0x10031b1cb: jb 0x10031b010
0x10031b1d1: mov rax, qword ptr [rip + 0x8f2700] ; 0x100c0d8d8
0x10031b1d8: mov rax, qword ptr [rax]
0x10031b1db: cmp rax, qword ptr [rbp - 0x30]
0x10031b1df: jne 0x10031b1f0
0x10031b1e1: lea rsp, [rbp - 0x28]
0x10031b1e5: pop rbx
0x10031b1e6: pop r12
0x10031b1e8: pop r13
0x10031b1ea: pop r14
0x10031b1ec: pop r15
0x10031b1ee: pop rbp
0x10031b1ef: ret 
0x10031b1f0: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10031b1f5: lea rdi, [rip + 0x865800] ; 0x100b809fc a.m == m_mc && b.m == m_mc && out.m == m_mc
0x10031b1fc: lea rsi, [rip + 0x8657c9] ; 0x100b809cc Environment.cpp
0x10031b203: mov edx, 0x9c
0x10031b208: mov ecx, 3
0x10031b20d: call 0x1007e5f70 ; 0x1007e5f70
0x10031b212: ud2 
0x10031b214: nop word ptr cs:[rax + rax]
