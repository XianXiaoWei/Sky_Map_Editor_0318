0x100241f70: push rbp
0x100241f71: mov rbp, rsp
0x100241f74: push r15
0x100241f76: push r14
0x100241f78: push r13
0x100241f7a: push r12
0x100241f7c: push rbx
0x100241f7d: sub rsp, 0x18
0x100241f81: mov dword ptr [rbp - 0x2c], ecx
0x100241f84: mov r14, rdx
0x100241f87: mov qword ptr [rbp - 0x38], rsi
0x100241f8b: mov rbx, rdi
0x100241f8e: mov r12d, dword ptr [rbx + 0x1688c]
0x100241f95: test r12d, r12d
0x100241f98: je 0x100242035
0x100241f9e: mov rdi, r14
0x100241fa1: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x100241fa6: mov r13, rax
0x100241fa9: cmp r13, -1
0x100241fad: je 0x100241ff8
0x100241faf: test r13, r13
0x100241fb2: jne 0x100242060
0x100241fb8: xor r15d, r15d
0x100241fbb: nop dword ptr [rax + rax]
0x100241fc0: mov r15d, r15d
0x100241fc3: lea rax, [r15 + r15*2]
0x100241fc7: shl rax, 4
0x100241fcb: movzx ecx, byte ptr [rbx + rax + 0x16890]
0x100241fd3: mov rdx, rcx
0x100241fd6: shr rdx, 1
0x100241fd9: test cl, 1
0x100241fdc: cmovne rdx, qword ptr [rbx + rax + 0x16898]
0x100241fe5: test rdx, rdx
0x100241fe8: je 0x1002420ad
0x100241fee: inc r15d
0x100241ff1: cmp r15d, r12d
0x100241ff4: jb 0x100241fc0
0x100241ff6: jmp 0x100242035 ; 0x100242035
0x100241ff8: xor eax, eax
0x100241ffa: nop word ptr [rax + rax]
0x100242000: mov ecx, eax
0x100242002: lea rcx, [rcx + rcx*2]
0x100242006: shl rcx, 4
0x10024200a: movzx edx, byte ptr [rbx + rcx + 0x16890]
0x100242012: mov rsi, rdx
0x100242015: shr rsi, 1
0x100242018: test dl, 1
0x10024201b: cmovne rsi, qword ptr [rbx + rcx + 0x16898]
0x100242024: cmp rsi, -1
0x100242028: je 0x1002420dd
0x10024202e: inc eax
0x100242030: cmp eax, r12d
0x100242033: jb 0x100242000
0x100242035: lea rdi, [rip + 0x960ff0] ; 0x100ba302c false
0x10024203c: lea rsi, [rip + 0x939515] ; 0x100b7b558 Compositor.cpp
0x100242043: lea r8, [rip + 0x939b11] ; 0x100b7bb5b Failed to find RenderTarget named %s
0x10024204a: mov edx, 0x332
0x10024204f: mov ecx, 4
0x100242054: xor eax, eax
0x100242056: mov r9, r14
0x100242059: call 0x1007e6030 ; 0x1007e6030
0x10024205e: ud2 
0x100242060: add rbx, 0x168a0
0x100242067: xor r15d, r15d
0x10024206a: nop word ptr [rax + rax]
0x100242070: movzx eax, byte ptr [rbx - 0x10]
0x100242074: mov rcx, rax
0x100242077: shr rcx, 1
0x10024207a: test al, 1
0x10024207c: cmovne rcx, qword ptr [rbx - 8]
0x100242081: cmp r13, rcx
0x100242084: jne 0x10024209f
0x100242086: lea rdi, [rbx - 0xf]
0x10024208a: test al, 1
0x10024208c: cmovne rdi, qword ptr [rbx]
0x100242090: mov rsi, r14
0x100242093: mov rdx, r13
0x100242096: call 0x100aa28ee ; 0x100aa28ee _memcmp
0x10024209b: test eax, eax
0x10024209d: je 0x1002420ad
0x10024209f: inc r15
0x1002420a2: add rbx, 0x30
0x1002420a6: cmp r15d, r12d
0x1002420a9: jb 0x100242070
0x1002420ab: jmp 0x100242035 ; 0x100242035
0x1002420ad: mov ecx, dword ptr [rbp - 0x2c]
0x1002420b0: imul rax, r15, 0xf8
0x1002420b7: mov rdx, qword ptr [rbp - 0x38]
0x1002420bb: cmp dword ptr [rdx + rax], ecx
0x1002420be: jbe 0x1002420ea
0x1002420c0: mov ecx, ecx
0x1002420c2: add rdx, rax
0x1002420c5: imul rax, rcx, 0x78
0x1002420c9: lea rax, [rax + rdx + 8]
0x1002420ce: add rsp, 0x18
0x1002420d2: pop rbx
0x1002420d3: pop r12
0x1002420d5: pop r13
0x1002420d7: pop r14
0x1002420d9: pop r15
0x1002420db: pop rbp
0x1002420dc: ret 
0x1002420dd: lea rdi, [rbx + rcx + 0x16890]
0x1002420e5: call 0x100aa2312 ; 0x100aa2312 __ZNKSt3__121__basic_string_commonILb1EE20__throw_out_of_rangeEv
0x1002420ea: lea rdi, [rip + 0x939e9b] ; 0x100b7bf8c i < m_texCount
0x1002420f1: lea rsi, [rip + 0x939ea3] ; 0x100b7bf9b ./Compositor.h
0x1002420f8: mov edx, 0x3d
0x1002420fd: mov ecx, 3
0x100242102: call 0x1007e5f70 ; 0x1007e5f70
0x100242107: ud2 
0x100242109: mov rdi, rax
0x10024210c: call 0x100011bf0 ; 0x100011bf0
0x100242111: nop word ptr cs:[rax + rax]
