0x1004669b0: push rbp
0x1004669b1: mov rbp, rsp
0x1004669b4: push r15
0x1004669b6: push r14
0x1004669b8: push r13
0x1004669ba: push r12
0x1004669bc: push rbx
0x1004669bd: push rax
0x1004669be: mov r14, rcx
0x1004669c1: mov r15d, edx
0x1004669c4: mov r13, rdi
0x1004669c7: mov eax, dword ptr [r13 + 0x8c]
0x1004669ce: test eax, eax
0x1004669d0: je 0x100466a21
0x1004669d2: mov r12d, esi
0x1004669d5: xor ebx, ebx
0x1004669d7: nop word ptr [rax + rax]
0x1004669e0: mov rcx, qword ptr [r13 + 8]
0x1004669e4: mov ebx, ebx
0x1004669e6: mov rcx, qword ptr [rcx + rbx*8]
0x1004669ea: cmp byte ptr [rcx + 0x14], 0
0x1004669ee: je 0x100466a1b
0x1004669f0: mov rax, qword ptr [r13 + r12*8 + 0x28]
0x1004669f5: mov rdi, qword ptr [rax + rbx*8]
0x1004669f9: cmp byte ptr [rdi + 0x538], 0
0x100466a00: je 0x100466a30
0x100466a02: add rdi, 0x270
0x100466a09: mov esi, r15d
0x100466a0c: mov rdx, r14
0x100466a0f: call 0x1007be290 ; 0x1007be290
0x100466a14: mov eax, dword ptr [r13 + 0x8c]
0x100466a1b: inc ebx
0x100466a1d: cmp ebx, eax
0x100466a1f: jb 0x1004669e0
0x100466a21: add rsp, 8
0x100466a25: pop rbx
0x100466a26: pop r12
0x100466a28: pop r13
0x100466a2a: pop r14
0x100466a2c: pop r15
0x100466a2e: pop rbp
0x100466a2f: ret 
0x100466a30: lea rdi, [rip + 0x7102b3] ; 0x100b76cea IsInitialized()
0x100466a37: lea rsi, [rip + 0x6fb83d] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x100466a3e: mov edx, 0xa8
0x100466a43: mov ecx, 3
0x100466a48: call 0x1007e5f70 ; 0x1007e5f70
0x100466a4d: ud2 
0x100466a4f: nop 
