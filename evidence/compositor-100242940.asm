0x100242940: push rbp
0x100242941: mov rbp, rsp
0x100242944: push r15
0x100242946: push r14
0x100242948: push r13
0x10024294a: push r12
0x10024294c: push rbx
0x10024294d: push rax
0x10024294e: mov rbx, rdi
0x100242951: lea r14, [rbx + 0xdb0]
0x100242958: mov rdi, r14
0x10024295b: call 0x1007f6270 ; 0x1007f6270
0x100242960: lea rsi, [rbp - 0x30]
0x100242964: xor edx, edx
0x100242966: xor ecx, ecx
0x100242968: mov rdi, rax
0x10024296b: call 0x1007ba080 ; 0x1007ba080
0x100242970: cmp byte ptr [rbx + 0x12e8], 0
0x100242977: je 0x100242a2b
0x10024297d: mov rax, qword ptr [rbp - 0x30]
0x100242981: xor ecx, ecx
0x100242983: cmp dword ptr [rax + 8], 0x13
0x100242987: lea rdi, [rbx + 0x1020]
0x10024298e: sete cl
0x100242991: lea r13, [rip + 0x8707b0] ; 0x100ab3148
0x100242998: vmovss xmm0, dword ptr [r13 + rcx*4]
0x10024299f: lea rsi, [rip + 0x939256] ; 0x100b7bbfc u_gammaPow
0x1002429a6: call 0x1007be530 ; 0x1007be530
0x1002429ab: lea r15, [rbx + 0x12f0]
0x1002429b2: mov rdi, r15
0x1002429b5: call 0x1007f6270 ; 0x1007f6270
0x1002429ba: lea rsi, [rbp - 0x30]
0x1002429be: xor edx, edx
0x1002429c0: xor ecx, ecx
0x1002429c2: mov rdi, rax
0x1002429c5: call 0x1007ba080 ; 0x1007ba080
0x1002429ca: cmp byte ptr [rbx + 0x1828], 0
0x1002429d1: je 0x100242a2b
0x1002429d3: lea r12, [rbx + 0x870]
0x1002429da: add rbx, 0x1560
0x1002429e1: mov rax, qword ptr [rbp - 0x30]
0x1002429e5: xor ecx, ecx
0x1002429e7: cmp dword ptr [rax + 8], 0x13
0x1002429eb: sete cl
0x1002429ee: vmovss xmm0, dword ptr [r13 + rcx*4]
0x1002429f5: lea rsi, [rip + 0x939200] ; 0x100b7bbfc u_gammaPow
0x1002429fc: mov rdi, rbx
0x1002429ff: call 0x1007be530 ; 0x1007be530
0x100242a04: mov rdi, r12
0x100242a07: call 0x1007f6540 ; 0x1007f6540
0x100242a0c: mov rdi, r14
0x100242a0f: call 0x1007f6540 ; 0x1007f6540
0x100242a14: mov rdi, r15
0x100242a17: call 0x1007f6540 ; 0x1007f6540
0x100242a1c: add rsp, 8
0x100242a20: pop rbx
0x100242a21: pop r12
0x100242a23: pop r13
0x100242a25: pop r14
0x100242a27: pop r15
0x100242a29: pop rbp
0x100242a2a: ret 
0x100242a2b: lea rdi, [rip + 0x9342b8] ; 0x100b76cea IsInitialized()
0x100242a32: lea rsi, [rip + 0x91f842] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x100242a39: mov edx, 0xa8
0x100242a3e: mov ecx, 3
0x100242a43: call 0x1007e5f70 ; 0x1007e5f70
0x100242a48: ud2 
0x100242a4a: nop word ptr [rax + rax]
