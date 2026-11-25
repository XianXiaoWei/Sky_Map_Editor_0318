0x100743f10: push rbp
0x100743f11: mov rbp, rsp
0x100743f14: mov rax, qword ptr [rip + 0x4c66a5] ; 0x100c0a5c0
0x100743f1b: add rax, 0x10
0x100743f1f: mov qword ptr [rdi], rax
0x100743f22: mov rax, qword ptr [rdi + 0xe8]
0x100743f29: test rax, rax
0x100743f2c: je 0x100743f8d
0x100743f2e: lea r9, [rdi + 0xe8]
0x100743f35: lea r8, [rdi + 0xf0]
0x100743f3c: vxorps xmm0, xmm0, xmm0
0x100743f40: cmp qword ptr [rax], r9
0x100743f43: jne 0x100743fc0
0x100743f45: mov rsi, qword ptr [rax + 8]
0x100743f49: mov rdx, qword ptr [rax + 0x10]
0x100743f4d: mov rcx, r9
0x100743f50: test rdx, rdx
0x100743f53: je 0x100743f5c
0x100743f55: add rdx, 8
0x100743f59: mov rcx, rdx
0x100743f5c: mov qword ptr [rcx], rsi
0x100743f5f: mov rdx, qword ptr [rax + 8]
0x100743f63: mov rsi, qword ptr [rax + 0x10]
0x100743f67: mov rcx, r8
0x100743f6a: test rdx, rdx
0x100743f6d: je 0x100743f76
0x100743f6f: add rdx, 0x10
0x100743f73: mov rcx, rdx
0x100743f76: mov qword ptr [rcx], rsi
0x100743f79: vmovups xmmword ptr [rax], xmm0
0x100743f7d: mov qword ptr [rax + 0x10], 0
0x100743f85: mov rax, qword ptr [r9]
0x100743f88: test rax, rax
0x100743f8b: jne 0x100743f40
0x100743f8d: mov rax, qword ptr [rdi + 0x10]
0x100743f91: test rax, rax
0x100743f94: je 0x100743f9e
0x100743f96: mov rcx, qword ptr [rdi + 0x18]
0x100743f9a: mov qword ptr [rax + 0x18], rcx
0x100743f9e: mov rcx, qword ptr [rdi + 0x18]
0x100743fa2: add rdi, 0x10
0x100743fa6: test rcx, rcx
0x100743fa9: je 0x100743faf
0x100743fab: mov qword ptr [rcx + 0x10], rax
0x100743faf: vxorps xmm0, xmm0, xmm0
0x100743fb3: vmovups xmmword ptr [rdi], xmm0
0x100743fb7: pop rbp
0x100743fb8: ret 
0x100743fb9: nop dword ptr [rax]
0x100743fc0: jmp 0x100743fc0 ; 0x100743fc0
0x100743fc2: nop word ptr cs:[rax + rax]
