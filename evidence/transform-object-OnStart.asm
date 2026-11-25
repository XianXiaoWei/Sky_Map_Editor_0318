0x1006d6090: push rbp
0x1006d6091: mov rbp, rsp
0x1006d6094: push r15
0x1006d6096: push r14
0x1006d6098: push r13
0x1006d609a: push r12
0x1006d609c: push rbx
0x1006d609d: sub rsp, 0x58
0x1006d60a1: mov r13, rdi
0x1006d60a4: cmp byte ptr [r13 + 0x78], 0
0x1006d60a9: jne 0x1006d6174
0x1006d60af: cmp byte ptr [r13 + 0x7a], 0
0x1006d60b4: jne 0x1006d6174
0x1006d60ba: mov rax, qword ptr [r13 + 0x48]
0x1006d60be: cmp dword ptr [rax + 0x10], 0
0x1006d60c2: je 0x1006d6174
0x1006d60c8: xor ecx, ecx
0x1006d60ca: lea r14, [rbp - 0x70]
0x1006d60ce: lea r15, [rbp - 0x30]
0x1006d60d2: nop word ptr cs:[rax + rax]
0x1006d60e0: mov rax, qword ptr [rax + 8]
0x1006d60e4: mov ebx, ecx
0x1006d60e6: mov rax, qword ptr [rax + rbx*8]
0x1006d60ea: mov qword ptr [rbp - 0x30], rax
0x1006d60ee: call 0x1007abc10 ; 0x1007abc10
0x1006d60f3: mov r12, rax
0x1006d60f6: mov qword ptr [rbp - 0x70], 0
0x1006d60fe: call 0x1007abc10 ; 0x1007abc10
0x1006d6103: mov r8, qword ptr [rax]
0x1006d6106: mov rdi, rax
0x1006d6109: mov rsi, r14
0x1006d610c: mov rdx, r15
0x1006d610f: mov rcx, r12
0x1006d6112: call qword ptr [r8 + 0x40]
0x1006d6116: mov rsi, qword ptr [rbp - 0x70]
0x1006d611a: test rsi, rsi
0x1006d611d: je 0x1006d62bc
0x1006d6123: mov rdi, r14
0x1006d6126: call 0x1004d1e40 ; 0x1004d1e40
0x1006d612b: mov rax, qword ptr [r13 + 0xa8]
0x1006d6132: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1006d6137: mov rcx, rbx
0x1006d613a: shl rcx, 6
0x1006d613e: vmovaps xmmword ptr [rax + rcx], xmm0
0x1006d6143: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1006d6148: vmovaps xmmword ptr [rax + rcx + 0x10], xmm0
0x1006d614e: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1006d6153: vmovaps xmmword ptr [rax + rcx + 0x20], xmm0
0x1006d6159: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1006d615e: vmovaps xmmword ptr [rax + rcx + 0x30], xmm0
0x1006d6164: lea ecx, [rbx + 1]
0x1006d6167: mov rax, qword ptr [r13 + 0x48]
0x1006d616b: cmp ecx, dword ptr [rax + 0x10]
0x1006d616e: jb 0x1006d60e0
0x1006d6174: mov rax, qword ptr [r13 + 0x40]
0x1006d6178: test rax, rax
0x1006d617b: je 0x1006d625f
0x1006d6181: mov rcx, qword ptr [r13 + 0x48]
0x1006d6185: cmp dword ptr [rcx + 0x10], 0
0x1006d6189: je 0x1006d629a
0x1006d618f: cmp dword ptr [rax + 0x10], 0
0x1006d6193: je 0x1006d6240
0x1006d6199: xor ecx, ecx
0x1006d619b: lea r12, [rbp - 0x70]
0x1006d619f: nop 
0x1006d61a0: mov rax, qword ptr [rax + 8]
0x1006d61a4: mov r14d, ecx
0x1006d61a7: mov rax, qword ptr [rax + r14*8]
0x1006d61ab: mov qword ptr [rbp - 0x78], rax
0x1006d61af: call 0x1007abc10 ; 0x1007abc10
0x1006d61b4: mov r15, rax
0x1006d61b7: mov qword ptr [rbp - 0x30], 0
0x1006d61bf: call 0x1007abc10 ; 0x1007abc10
0x1006d61c4: mov rbx, qword ptr [rax]
0x1006d61c7: mov rdi, rax
0x1006d61ca: lea rsi, [rbp - 0x30]
0x1006d61ce: lea rdx, [rbp - 0x78]
0x1006d61d2: mov rcx, r15
0x1006d61d5: call qword ptr [rbx + 0x40]
0x1006d61d8: mov rsi, qword ptr [rbp - 0x30]
0x1006d61dc: test rsi, rsi
0x1006d61df: je 0x1006d62bc
0x1006d61e5: mov rdi, r12
0x1006d61e8: call 0x1004d1e40 ; 0x1004d1e40
0x1006d61ed: mov rax, qword ptr [r13 + 0xb0]
0x1006d61f4: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1006d61f9: mov rcx, r14
0x1006d61fc: shl rcx, 6
0x1006d6200: vmovaps xmmword ptr [rax + rcx], xmm0
0x1006d6205: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1006d620a: vmovaps xmmword ptr [rax + rcx + 0x10], xmm0
0x1006d6210: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1006d6215: vmovaps xmmword ptr [rax + rcx + 0x20], xmm0
0x1006d621b: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1006d6220: vmovaps xmmword ptr [rax + rcx + 0x30], xmm0
0x1006d6226: lea ecx, [r14 + 1]
0x1006d622a: mov rax, qword ptr [r13 + 0x48]
0x1006d622e: cmp ecx, dword ptr [rax + 0x10]
0x1006d6231: jae 0x1006d629a
0x1006d6233: mov rax, qword ptr [r13 + 0x40]
0x1006d6237: cmp dword ptr [rax + 0x10], ecx
0x1006d623a: ja 0x1006d61a0
0x1006d6240: lea rdi, [rip + 0x48b711] ; 0x100b61958 idx < size
0x1006d6247: lea rsi, [rip + 0x48b715] ; 0x100b61963 ./Clump.h
0x1006d624e: mov edx, 0x36
0x1006d6253: mov ecx, 3
0x1006d6258: call 0x1007e5f70 ; 0x1007e5f70
0x1006d625d: ud2 
0x1006d625f: mov rsi, qword ptr [r13 + 0x38]
0x1006d6263: lea rdi, [rbp - 0x70]
0x1006d6267: call 0x1004d1e40 ; 0x1004d1e40
0x1006d626c: mov rax, qword ptr [r13 + 0xb0]
0x1006d6273: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1006d6278: vmovaps xmmword ptr [rax], xmm0
0x1006d627c: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1006d6281: vmovaps xmmword ptr [rax + 0x10], xmm0
0x1006d6286: vmovaps xmm0, xmmword ptr [rbp - 0x50]
0x1006d628b: vmovaps xmmword ptr [rax + 0x20], xmm0
0x1006d6290: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1006d6295: vmovaps xmmword ptr [rax + 0x30], xmm0
0x1006d629a: mov dword ptr [r13 + 0xa0], 0
0x1006d62a5: mov byte ptr [r13 + 0xd1], 1
0x1006d62ad: add rsp, 0x58
0x1006d62b1: pop rbx
0x1006d62b2: pop r12
0x1006d62b4: pop r13
0x1006d62b6: pop r14
0x1006d62b8: pop r15
0x1006d62ba: pop rbp
0x1006d62bb: ret 
0x1006d62bc: lea rdi, [rip + 0x48b835] ; 0x100b61af8 ret
0x1006d62c3: lea rsi, [rip + 0x48b699] ; 0x100b61963 ./Clump.h
0x1006d62ca: mov edx, 0x47
0x1006d62cf: mov ecx, 3
0x1006d62d4: call 0x1007e5f70 ; 0x1007e5f70
0x1006d62d9: ud2 
0x1006d62db: nop dword ptr [rax + rax]
