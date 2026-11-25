0x100402ab0: push rbp
0x100402ab1: mov rbp, rsp
0x100402ab4: mov rax, qword ptr [rsi + 0x228]
0x100402abb: test rax, rax
0x100402abe: je 0x100402adb
0x100402ac0: cmp byte ptr [rax + 0x32e], 0
0x100402ac7: lea rsi, [rax + 0x240]
0x100402ace: lea rax, [rax + 0x160]
0x100402ad5: cmove rsi, rax
0x100402ad9: jmp 0x100402adf ; 0x100402adf
0x100402adb: add rsi, 0x10
0x100402adf: vmovaps xmm0, xmmword ptr [rsi]
0x100402ae3: vmovaps xmmword ptr [rdi], xmm0
0x100402ae7: vmovaps xmm0, xmmword ptr [rsi + 0x10]
0x100402aec: vmovaps xmmword ptr [rdi + 0x10], xmm0
0x100402af1: vmovaps xmm0, xmmword ptr [rsi + 0x20]
0x100402af6: vmovaps xmmword ptr [rdi + 0x20], xmm0
0x100402afb: vmovaps xmm0, xmmword ptr [rsi + 0x30]
0x100402b00: vmovaps xmmword ptr [rdi + 0x30], xmm0
0x100402b05: mov rax, rdi
0x100402b08: pop rbp
0x100402b09: ret 
0x100402b0a: nop word ptr [rax + rax]
