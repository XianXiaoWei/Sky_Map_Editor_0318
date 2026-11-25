0x1004aa2b0: push rbp
0x1004aa2b1: mov rbp, rsp
0x1004aa2b4: test dl, dl
0x1004aa2b6: je 0x1004aa2e6
0x1004aa2b8: mov r8d, dword ptr [rsi + 0x7d10]
0x1004aa2bf: test r8d, r8d
0x1004aa2c2: je 0x1004aa2e6
0x1004aa2c4: xor ecx, ecx
0x1004aa2c6: nop word ptr cs:[rax + rax]
0x1004aa2d0: mov eax, ecx
0x1004aa2d2: imul rax, rax, 0xfa0
0x1004aa2d9: cmp byte ptr [rsi + rax + 0x14], dl
0x1004aa2dd: je 0x1004aa2f1
0x1004aa2df: inc ecx
0x1004aa2e1: cmp ecx, r8d
0x1004aa2e4: jb 0x1004aa2d0
0x1004aa2e6: mov dword ptr [rdi], 0
0x1004aa2ec: mov rax, rdi
0x1004aa2ef: pop rbp
0x1004aa2f0: ret 
0x1004aa2f1: mov eax, dword ptr [rsi + rax + 0x10]
0x1004aa2f5: mov dword ptr [rdi], eax
0x1004aa2f7: mov rax, rdi
0x1004aa2fa: pop rbp
0x1004aa2fb: ret 
0x1004aa2fc: nop dword ptr [rax]
