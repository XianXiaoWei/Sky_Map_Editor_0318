0x1002bcda0: push rbp
0x1002bcda1: mov rbp, rsp
0x1002bcda4: push r15
0x1002bcda6: push r14
0x1002bcda8: push r13
0x1002bcdaa: push r12
0x1002bcdac: push rbx
0x1002bcdad: sub rsp, 0x108
0x1002bcdb4: mov r14d, ecx
0x1002bcdb7: mov r15, rdx
0x1002bcdba: mov rbx, rdi
0x1002bcdbd: mov rax, qword ptr [rip + 0x950b14] ; 0x100c0d8d8
0x1002bcdc4: mov rax, qword ptr [rax]
0x1002bcdc7: mov qword ptr [rbp - 0x30], rax
0x1002bcdcb: cmp byte ptr [rbx + 0x1390], 0
0x1002bcdd2: je 0x1002bd130
0x1002bcdd8: vmovddup xmm0, qword ptr [rip + 0x7eeb20] ; 0x100aab900
0x1002bcde0: vmovapd xmmword ptr [rbp - 0x130], xmm0
0x1002bcde8: vmovaps xmm1, xmmword ptr [rip + 0x7fbcc0] ; 0x100ab8ab0
0x1002bcdf0: vmovaps xmmword ptr [rbp - 0x120], xmm1
0x1002bcdf8: vmovaps xmm1, xmmword ptr [rip + 0x7fbcc0] ; 0x100ab8ac0
0x1002bce00: vmovaps xmmword ptr [rbp - 0x110], xmm1
0x1002bce08: vmovaps xmm1, xmmword ptr [rip + 0x7f3fa0] ; 0x100ab0db0
0x1002bce10: vmovaps xmmword ptr [rbp - 0x100], xmm1
0x1002bce18: vmovaps xmm1, xmmword ptr [rip + 0x7fbcb0] ; 0x100ab8ad0
0x1002bce20: vmovaps xmmword ptr [rbp - 0xf0], xmm1
0x1002bce28: vmovaps xmm1, xmmword ptr [rip + 0x7fbcb0] ; 0x100ab8ae0
0x1002bce30: vmovaps xmmword ptr [rbp - 0xe0], xmm1
0x1002bce38: vmovaps xmm1, xmmword ptr [rip + 0x7fbcb0] ; 0x100ab8af0
0x1002bce40: vmovaps xmmword ptr [rbp - 0xd0], xmm1
0x1002bce48: vmovaps xmm1, xmmword ptr [rip + 0x7fbcb0] ; 0x100ab8b00
0x1002bce50: vmovaps xmmword ptr [rbp - 0xc0], xmm1
0x1002bce58: vmovaps xmm1, xmmword ptr [rsi + 0x200]
0x1002bce60: vmovaps xmm2, xmmword ptr [rsi + 0x210]
0x1002bce68: vmovaps xmm3, xmmword ptr [rsi + 0x220]
0x1002bce70: vmovaps xmm4, xmmword ptr [rsi + 0x230]
0x1002bce78: xor eax, eax
0x1002bce7a: jmp 0x1002bce8d ; 0x1002bce8d
0x1002bce7c: nop dword ptr [rax]
0x1002bce80: vmovaps xmm0, xmmword ptr [rbp + rax - 0x120]
0x1002bce89: add rax, 0x10
0x1002bce8d: vpermilps xmm5, xmm0, 0
0x1002bce93: vmulps xmm5, xmm1, xmm5
0x1002bce97: vpermilps xmm6, xmm0, 0x55
0x1002bce9d: vmulps xmm6, xmm6, xmm2
0x1002bcea1: vaddps xmm5, xmm5, xmm6
0x1002bcea5: vpermilps xmm6, xmm0, 0xaa
0x1002bceab: vmulps xmm6, xmm6, xmm3
0x1002bceaf: vaddps xmm5, xmm5, xmm6
0x1002bceb3: vpermilps xmm0, xmm0, 0xff
0x1002bceb9: vmulps xmm0, xmm0, xmm4
0x1002bcebd: vaddps xmm0, xmm5, xmm0
0x1002bcec1: vpermilps xmm5, xmm0, 0xff
0x1002bcec7: vdivps xmm0, xmm0, xmm5
0x1002bcecb: vmovaps xmmword ptr [rbp + rax - 0xb0], xmm0
0x1002bced4: cmp rax, 0x70
0x1002bced8: jne 0x1002bce80
0x1002bceda: lea r12, [rbp - 0xa0]
0x1002bcee1: lea rsi, [rbp - 0xb0]
0x1002bcee8: mov rdi, rbx
0x1002bceeb: mov rdx, r15
0x1002bceee: mov ecx, r14d
0x1002bcef1: call 0x1002b9df0 ; 0x1002b9df0
0x1002bcef6: mov rdi, rbx
0x1002bcef9: mov rsi, r12
0x1002bcefc: mov rdx, r15
0x1002bceff: mov ecx, r14d
0x1002bcf02: call 0x1002b9df0 ; 0x1002b9df0
0x1002bcf07: cmp byte ptr [rbx + 0x1390], 0
0x1002bcf0e: je 0x1002bd130
0x1002bcf14: lea r13, [rbp - 0x90]
0x1002bcf1b: mov rdi, rbx
0x1002bcf1e: mov rsi, r12
0x1002bcf21: mov rdx, r15
0x1002bcf24: mov ecx, r14d
0x1002bcf27: call 0x1002b9df0 ; 0x1002b9df0
0x1002bcf2c: mov rdi, rbx
0x1002bcf2f: mov rsi, r13
0x1002bcf32: mov rdx, r15
0x1002bcf35: mov ecx, r14d
0x1002bcf38: call 0x1002b9df0 ; 0x1002b9df0
0x1002bcf3d: cmp byte ptr [rbx + 0x1390], 0
0x1002bcf44: je 0x1002bd130
0x1002bcf4a: lea r13, [rbp - 0x80]
0x1002bcf4e: mov rdi, rbx
0x1002bcf51: lea rsi, [rbp - 0x90]
0x1002bcf58: mov rdx, r15
0x1002bcf5b: mov ecx, r14d
0x1002bcf5e: call 0x1002b9df0 ; 0x1002b9df0
0x1002bcf63: mov rdi, rbx
0x1002bcf66: mov rsi, r13
0x1002bcf69: mov rdx, r15
0x1002bcf6c: mov ecx, r14d
0x1002bcf6f: call 0x1002b9df0 ; 0x1002b9df0
0x1002bcf74: cmp byte ptr [rbx + 0x1390], 0
0x1002bcf7b: je 0x1002bd130
0x1002bcf81: mov rdi, rbx
0x1002bcf84: lea rsi, [rbp - 0x80]
0x1002bcf88: mov rdx, r15
0x1002bcf8b: mov ecx, r14d
0x1002bcf8e: call 0x1002b9df0 ; 0x1002b9df0
0x1002bcf93: lea rsi, [rbp - 0xb0]
0x1002bcf9a: mov rdi, rbx
0x1002bcf9d: mov rdx, r15
0x1002bcfa0: mov ecx, r14d
0x1002bcfa3: call 0x1002b9df0 ; 0x1002b9df0
0x1002bcfa8: cmp byte ptr [rbx + 0x1390], 0
0x1002bcfaf: je 0x1002bd130
0x1002bcfb5: lea rsi, [rbp - 0x70]
0x1002bcfb9: lea r13, [rbp - 0x60]
0x1002bcfbd: mov rdi, rbx
0x1002bcfc0: mov rdx, r15
0x1002bcfc3: mov ecx, r14d
0x1002bcfc6: call 0x1002b9df0 ; 0x1002b9df0
0x1002bcfcb: mov rdi, rbx
0x1002bcfce: mov rsi, r13
0x1002bcfd1: mov rdx, r15
0x1002bcfd4: mov ecx, r14d
0x1002bcfd7: call 0x1002b9df0 ; 0x1002b9df0
0x1002bcfdc: cmp byte ptr [rbx + 0x1390], 0
0x1002bcfe3: je 0x1002bd130
0x1002bcfe9: lea r13, [rbp - 0x50]
0x1002bcfed: mov rdi, rbx
0x1002bcff0: lea rsi, [rbp - 0x60]
0x1002bcff4: mov rdx, r15
0x1002bcff7: mov ecx, r14d
0x1002bcffa: call 0x1002b9df0 ; 0x1002b9df0
0x1002bcfff: mov rdi, rbx
0x1002bd002: mov rsi, r13
0x1002bd005: mov rdx, r15
0x1002bd008: mov ecx, r14d
0x1002bd00b: call 0x1002b9df0 ; 0x1002b9df0
0x1002bd010: cmp byte ptr [rbx + 0x1390], 0
0x1002bd017: je 0x1002bd130
0x1002bd01d: lea r13, [rbp - 0x40]
0x1002bd021: mov rdi, rbx
0x1002bd024: lea rsi, [rbp - 0x50]
0x1002bd028: mov rdx, r15
0x1002bd02b: mov ecx, r14d
0x1002bd02e: call 0x1002b9df0 ; 0x1002b9df0
0x1002bd033: mov rdi, rbx
0x1002bd036: mov rsi, r13
0x1002bd039: mov rdx, r15
0x1002bd03c: mov ecx, r14d
0x1002bd03f: call 0x1002b9df0 ; 0x1002b9df0
0x1002bd044: cmp byte ptr [rbx + 0x1390], 0
0x1002bd04b: je 0x1002bd130
0x1002bd051: mov rdi, rbx
0x1002bd054: mov rsi, r13
0x1002bd057: mov rdx, r15
0x1002bd05a: mov ecx, r14d
0x1002bd05d: call 0x1002b9df0 ; 0x1002b9df0
0x1002bd062: mov rdi, rbx
0x1002bd065: lea rsi, [rbp - 0x70]
0x1002bd069: mov rdx, r15
0x1002bd06c: mov ecx, r14d
0x1002bd06f: call 0x1002b9df0 ; 0x1002b9df0
0x1002bd074: cmp byte ptr [rbx + 0x1390], 0
0x1002bd07b: je 0x1002bd130
0x1002bd081: mov rdi, rbx
0x1002bd084: lea rsi, [rbp - 0x70]
0x1002bd088: mov rdx, r15
0x1002bd08b: mov ecx, r14d
0x1002bd08e: call 0x1002b9df0 ; 0x1002b9df0
0x1002bd093: lea rsi, [rbp - 0xb0]
0x1002bd09a: mov rdi, rbx
0x1002bd09d: mov rdx, r15
0x1002bd0a0: mov ecx, r14d
0x1002bd0a3: call 0x1002b9df0 ; 0x1002b9df0
0x1002bd0a8: cmp byte ptr [rbx + 0x1390], 0
0x1002bd0af: je 0x1002bd130
0x1002bd0b1: mov rdi, rbx
0x1002bd0b4: lea rsi, [rbp - 0x60]
0x1002bd0b8: mov rdx, r15
0x1002bd0bb: mov ecx, r14d
0x1002bd0be: call 0x1002b9df0 ; 0x1002b9df0
0x1002bd0c3: mov rdi, rbx
0x1002bd0c6: mov rsi, r12
0x1002bd0c9: mov rdx, r15
0x1002bd0cc: mov ecx, r14d
0x1002bd0cf: call 0x1002b9df0 ; 0x1002b9df0
0x1002bd0d4: cmp byte ptr [rbx + 0x1390], 0
0x1002bd0db: je 0x1002bd130
0x1002bd0dd: mov rdi, rbx
0x1002bd0e0: lea rsi, [rbp - 0x50]
0x1002bd0e4: mov rdx, r15
0x1002bd0e7: mov ecx, r14d
0x1002bd0ea: call 0x1002b9df0 ; 0x1002b9df0
0x1002bd0ef: mov rdi, rbx
0x1002bd0f2: lea rsi, [rbp - 0x90]
0x1002bd0f9: mov rdx, r15
0x1002bd0fc: mov ecx, r14d
0x1002bd0ff: call 0x1002b9df0 ; 0x1002b9df0
0x1002bd104: cmp byte ptr [rbx + 0x1390], 0
0x1002bd10b: je 0x1002bd130
0x1002bd10d: mov rdi, rbx
0x1002bd110: mov rsi, r13
0x1002bd113: mov rdx, r15
0x1002bd116: mov ecx, r14d
0x1002bd119: call 0x1002b9df0 ; 0x1002b9df0
0x1002bd11e: mov rdi, rbx
0x1002bd121: lea rsi, [rbp - 0x80]
0x1002bd125: mov rdx, r15
0x1002bd128: mov ecx, r14d
0x1002bd12b: call 0x1002b9df0 ; 0x1002b9df0
0x1002bd130: mov rax, qword ptr [rip + 0x9507a1] ; 0x100c0d8d8
0x1002bd137: mov rax, qword ptr [rax]
0x1002bd13a: cmp rax, qword ptr [rbp - 0x30]
0x1002bd13e: jne 0x1002bd152
0x1002bd140: add rsp, 0x108
0x1002bd147: pop rbx
0x1002bd148: pop r12
0x1002bd14a: pop r13
0x1002bd14c: pop r14
0x1002bd14e: pop r15
0x1002bd150: pop rbp
0x1002bd151: ret 
0x1002bd152: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1002bd157: nop word ptr [rax + rax]
