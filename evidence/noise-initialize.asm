0x1004b72d0: push rbp
0x1004b72d1: mov rbp, rsp
0x1004b72d4: push r15
0x1004b72d6: push r14
0x1004b72d8: push r13
0x1004b72da: push r12
0x1004b72dc: push rbx
0x1004b72dd: sub rsp, 0x128
0x1004b72e4: mov qword ptr [rbp - 0x148], rsi
0x1004b72eb: mov rbx, rdi
0x1004b72ee: mov rax, qword ptr [rip + 0x7565e3] ; 0x100c0d8d8
0x1004b72f5: mov rax, qword ptr [rax]
0x1004b72f8: mov qword ptr [rbp - 0x30], rax
0x1004b72fc: cmp qword ptr [rip + 0x1b58334], 0 ; 0x10200f638
0x1004b7304: jne 0x1004b74bb
0x1004b730a: mov qword ptr [rip + 0x1b58327], rbx ; 0x10200f638
0x1004b7311: movabs rax, 0x7865542f61746144
0x1004b731b: mov qword ptr [rbp - 0x130], rax
0x1004b7322: mov dword ptr [rbp - 0x128], 0x2f4433
0x1004b732c: lea rdi, [rbp - 0x130]
0x1004b7333: call 0x100aa2c7e ; 0x100aa2c7e _strlen
0x1004b7338: mov qword ptr [rbp - 0x140], 0
0x1004b7343: mov dword ptr [rbp - 0x134], 0
0x1004b734d: lea r12, [rbp + rax - 0x130]
0x1004b7355: lea r13, [rip + 0x7601a4] ; 0x100c17500
0x1004b735c: mov r15d, 0x40
0x1004b7362: vmovss xmm1, dword ptr [rip + 0x5ed24e] ; 0x100aa45b8
0x1004b736a: lea r14, [rip + 0x173] ; 0x1004b74e4
0x1004b7371: nop word ptr cs:[rax + rax]
0x1004b7380: lea rcx, [r15 - 0x40]
0x1004b7384: cmp ecx, 0x11
0x1004b7387: ja 0x1004b742b
0x1004b738d: mov eax, 0x40
0x1004b7392: mov ecx, ecx
0x1004b7394: movsxd rcx, dword ptr [r14 + rcx*4]
0x1004b7398: add rcx, r14
0x1004b739b: vmovaps xmm0, xmm1
0x1004b739f: jmp rcx
0x1004b73a1: mov rsi, qword ptr [r13]
0x1004b73a5: mov rdi, r12
0x1004b73a8: call 0x100aa2c5a ; 0x100aa2c5a _strcpy
0x1004b73ad: mov rax, qword ptr [rbp - 0x148]
0x1004b73b4: mov rdi, qword ptr [rax + 0x10]
0x1004b73b8: lea rsi, [rbp - 0x130]
0x1004b73bf: lea rdx, [rbp - 0x140]
0x1004b73c6: lea rcx, [rbp - 0x134]
0x1004b73cd: call 0x1004ba510 ; 0x1004ba510
0x1004b73d2: vmovss xmm1, dword ptr [rip + 0x5ed1de] ; 0x100aa45b8
0x1004b73da: mov rax, qword ptr [rbp - 0x140]
0x1004b73e1: mov qword ptr [rbx + r15*8 - 0x1a0], rax
0x1004b73e9: mov eax, dword ptr [rbp - 0x134]
0x1004b73ef: mov dword ptr [rbx + r15*4 - 0xf4], eax
0x1004b73f7: vcvtsi2ss xmm0, xmm3, rax
0x1004b73fc: vmovss xmm2, dword ptr [rip + 0x5f1250] ; 0x100aa8654
0x1004b7404: vdivss xmm0, xmm2, xmm0
0x1004b7408: jmp 0x1004b7425 ; 0x1004b7425
0x1004b740a: nop word ptr [rax + rax]
0x1004b7410: mov eax, 0x80
0x1004b7415: vmovss xmm0, dword ptr [rip + 0x5efcd7] ; 0x100aa70f4
0x1004b741d: mov dword ptr [rbx + r15*4 - 0xf4], eax
0x1004b7425: vmovss dword ptr [rbx + r15*4], xmm0
0x1004b742b: inc r15
0x1004b742e: add r13, 8
0x1004b7432: cmp r15, 0x54
0x1004b7436: jne 0x1004b7380
0x1004b743c: vmovups xmm0, xmmword ptr [rbx + 0x114]
0x1004b7444: vmulps xmm0, xmm0, xmmword ptr [rip + 0x60cf14] ; 0x100ac4360
0x1004b744c: vmovups xmmword ptr [rbx + 0x114], xmm0
0x1004b7454: vmovss xmm0, dword ptr [rbx + 0x128]
0x1004b745c: vmulss xmm0, xmm0, dword ptr [rip + 0x5f43a4] ; 0x100aab808
0x1004b7464: vmovss dword ptr [rbx + 0x128], xmm0
0x1004b746c: vmovss xmm0, dword ptr [rbx + 0x130]
0x1004b7474: vaddss xmm0, xmm0, xmm0
0x1004b7478: vmovss dword ptr [rbx + 0x130], xmm0
0x1004b7480: vmovss xmm0, dword ptr [rbx + 0x13c]
0x1004b7488: vaddss xmm0, xmm0, xmm0
0x1004b748c: vmovss dword ptr [rbx + 0x13c], xmm0
0x1004b7494: mov rax, qword ptr [rip + 0x75643d] ; 0x100c0d8d8
0x1004b749b: mov rax, qword ptr [rax]
0x1004b749e: cmp rax, qword ptr [rbp - 0x30]
0x1004b74a2: jne 0x1004b74b6
0x1004b74a4: add rsp, 0x128
0x1004b74ab: pop rbx
0x1004b74ac: pop r12
0x1004b74ae: pop r13
0x1004b74b0: pop r14
0x1004b74b2: pop r15
0x1004b74b4: pop rbp
0x1004b74b5: ret 
0x1004b74b6: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1004b74bb: lea rdi, [rip + 0x6d6173] ; 0x100b8d635 !g_noise
0x1004b74c2: lea rsi, [rip + 0x6d6175] ; 0x100b8d63e Noise.cpp
0x1004b74c9: lea r8, [rip + 0x6d6178] ; 0x100b8d648 Noise is a singleton and must be initialized only once.
0x1004b74d0: mov edx, 0x1d4
0x1004b74d5: mov ecx, 4
0x1004b74da: xor eax, eax
0x1004b74dc: call 0x1007e6030 ; 0x1007e6030
0x1004b74e1: ud2 
