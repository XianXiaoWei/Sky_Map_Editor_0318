0x100100fb0: push rbp
0x100100fb1: mov rbp, rsp
0x100100fb4: push r15
0x100100fb6: push r14
0x100100fb8: push r13
0x100100fba: push r12
0x100100fbc: push rbx
0x100100fbd: sub rsp, 0xa8
0x100100fc4: mov r14d, edx
0x100100fc7: mov r15, rsi
0x100100fca: mov r12, rdi
0x100100fcd: mov rax, qword ptr [rip + 0xb0c904] ; 0x100c0d8d8
0x100100fd4: mov rax, qword ptr [rax]
0x100100fd7: mov qword ptr [rbp - 0x30], rax
0x100100fdb: mov rbx, qword ptr [r12 + 0x50]
0x100100fe0: lea r13, [rbp - 0xb0]
0x100100fe7: mov rdi, r13
0x100100fea: mov rsi, rbx
0x100100fed: call 0x10035cef0 ; 0x10035cef0
0x100100ff2: mov rdi, r13
0x100100ff5: mov rsi, rbx
0x100100ff8: call 0x10035bca0 ; 0x10035bca0
0x100100ffd: test al, al
0x100100fff: jne 0x100101010
0x100101001: cmp byte ptr [r12 + 0x1ef8], 0
0x10010100a: je 0x100101112
0x100101010: mov rdi, qword ptr [r12 + 0x18]
0x100101015: vmovaps xmm0, xmmword ptr [r15]
0x10010101a: vsubps xmm0, xmm0, xmmword ptr [rdi + 0x10]
0x10010101f: vmovaps xmmword ptr [rbp - 0xd0], xmm0
0x100101027: test r14b, r14b
0x10010102a: je 0x100101036
0x10010102c: mov rsi, r15
0x10010102f: call 0x1001480d0 ; 0x1001480d0
0x100101034: jmp 0x100101043 ; 0x100101043
0x100101036: mov edx, 1
0x10010103b: mov rsi, r15
0x10010103e: call 0x100146de0 ; 0x100146de0
0x100101043: mov rbx, qword ptr [r12 + 0x50]
0x100101048: lea r15, [rbp - 0xb0]
0x10010104f: mov rdi, r15
0x100101052: mov rsi, rbx
0x100101055: call 0x10035cef0 ; 0x10035cef0
0x10010105a: mov rdi, r15
0x10010105d: mov rsi, rbx
0x100101060: call 0x10035bca0 ; 0x10035bca0
0x100101065: test al, al
0x100101067: je 0x100101112
0x10010106d: mov rdi, qword ptr [r12 + 0x50]
0x100101072: lea r15, [rbp - 0xb0]
0x100101079: mov rsi, r15
0x10010107c: call 0x10012e6e0 ; 0x10012e6e0
0x100101081: test eax, eax
0x100101083: je 0x100101112
0x100101089: mov ebx, eax
0x10010108b: test r14b, r14b
0x10010108e: je 0x1001010cf
0x100101090: lea r15, [rbp - 0xb0]
0x100101097: lea r14, [rbp - 0xc0]
0x10010109e: nop 
0x1001010a0: mov rax, qword ptr [r15]
0x1001010a3: mov rdi, qword ptr [rax + 0x18]
0x1001010a7: vmovaps xmm0, xmmword ptr [rbp - 0xd0]
0x1001010af: vaddps xmm0, xmm0, xmmword ptr [rdi + 0x10]
0x1001010b4: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x1001010bc: mov rsi, r14
0x1001010bf: call 0x1001480d0 ; 0x1001480d0
0x1001010c4: add r15, 8
0x1001010c8: dec rbx
0x1001010cb: jne 0x1001010a0
0x1001010cd: jmp 0x100101112 ; 0x100101112
0x1001010cf: lea r14, [rbp - 0xc0]
0x1001010d6: nop word ptr cs:[rax + rax]
0x1001010e0: mov rax, qword ptr [r15]
0x1001010e3: mov rdi, qword ptr [rax + 0x18]
0x1001010e7: vmovaps xmm0, xmmword ptr [rbp - 0xd0]
0x1001010ef: vaddps xmm0, xmm0, xmmword ptr [rdi + 0x10]
0x1001010f4: vmovaps xmmword ptr [rbp - 0xc0], xmm0
0x1001010fc: mov edx, 1
0x100101101: mov rsi, r14
0x100101104: call 0x100146de0 ; 0x100146de0
0x100101109: add r15, 8
0x10010110d: dec rbx
0x100101110: jne 0x1001010e0
0x100101112: mov rax, qword ptr [rip + 0xb0c7bf] ; 0x100c0d8d8
0x100101119: mov rax, qword ptr [rax]
0x10010111c: cmp rax, qword ptr [rbp - 0x30]
0x100101120: jne 0x100101134
0x100101122: add rsp, 0xa8
0x100101129: pop rbx
0x10010112a: pop r12
0x10010112c: pop r13
0x10010112e: pop r14
0x100101130: pop r15
0x100101132: pop rbp
0x100101133: ret 
0x100101134: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100101139: nop dword ptr [rax]
