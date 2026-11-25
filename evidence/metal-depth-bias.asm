0x100a6da50: push rbp
0x100a6da51: mov rbp, rsp
0x100a6da54: push rbx
0x100a6da55: sub rsp, 0x18
0x100a6da59: mov rbx, rdi
0x100a6da5c: movss xmm3, dword ptr [rbx + 0x28]
0x100a6da61: ucomiss xmm3, xmm0
0x100a6da64: jne 0x100a6da80
0x100a6da66: jp 0x100a6da80
0x100a6da68: movss xmm3, dword ptr [rbx + 0x2c]
0x100a6da6d: ucomiss xmm3, xmm1
0x100a6da70: jne 0x100a6da80
0x100a6da72: jp 0x100a6da80
0x100a6da74: movss xmm3, dword ptr [rbx + 0x30]
0x100a6da79: ucomiss xmm3, xmm2
0x100a6da7c: jne 0x100a6da80
0x100a6da7e: jnp 0x100a6dabe
0x100a6da80: mov rdi, qword ptr [rbx + 0x38]
0x100a6da84: mov rsi, qword ptr [rip + 0x1fc665] ; 0x100c6a0f0
0x100a6da8b: movss dword ptr [rbp - 0x10], xmm1
0x100a6da90: movss dword ptr [rbp - 0x14], xmm2
0x100a6da95: movss dword ptr [rbp - 0xc], xmm0
0x100a6da9a: call qword ptr [rip + 0x1a0070] ; 0x100c0db10
0x100a6daa0: movss xmm0, dword ptr [rbp - 0xc]
0x100a6daa5: movss dword ptr [rbx + 0x28], xmm0
0x100a6daaa: movss xmm0, dword ptr [rbp - 0x10]
0x100a6daaf: movss dword ptr [rbx + 0x2c], xmm0
0x100a6dab4: movss xmm0, dword ptr [rbp - 0x14]
0x100a6dab9: movss dword ptr [rbx + 0x30], xmm0
0x100a6dabe: add rsp, 0x18
0x100a6dac2: pop rbx
0x100a6dac3: pop rbp
0x100a6dac4: ret 
0x100a6dac5: nop word ptr cs:[rax + rax]
