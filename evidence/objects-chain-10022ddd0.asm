0x10022ddd0: push rbp
0x10022ddd1: mov rbp, rsp
0x10022ddd4: push rbx
0x10022ddd5: push rax
0x10022ddd6: mov ebx, esi
0x10022ddd8: mov rax, qword ptr [rdi + 0x28]
0x10022dddc: mov esi, dword ptr [rdi + 0x20]
0x10022dddf: lea rdx, [rbp - 9]
0x10022dde3: lea rcx, [rbp - 0x10]
0x10022dde7: mov rdi, rax
0x10022ddea: call 0x100776640 ; 0x100776640
0x10022ddef: cmp byte ptr [rbp - 9], bl
0x10022ddf2: je 0x10022ddfe
0x10022ddf4: vxorps xmm0, xmm0, xmm0
0x10022ddf8: test al, al
0x10022ddfa: je 0x10022de07
0x10022ddfc: jmp 0x10022de0b ; 0x10022de0b
0x10022ddfe: vmovss xmm0, dword ptr [rbp - 0x10]
0x10022de03: test al, al
0x10022de05: jne 0x10022de0b
0x10022de07: vxorps xmm0, xmm0, xmm0
0x10022de0b: add rsp, 8
0x10022de0f: pop rbx
0x10022de10: pop rbp
0x10022de11: ret 
0x10022de12: nop word ptr cs:[rax + rax]
