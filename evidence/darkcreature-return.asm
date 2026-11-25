0x100270f10: push rbp
0x100270f11: mov rbp, rsp
0x100270f14: push rbx
0x100270f15: sub rsp, 0x28
0x100270f19: vmovss dword ptr [rbp - 0xc], xmm0
0x100270f1e: mov rbx, rdi
0x100270f21: lea rsi, [rbx + 0x60]
0x100270f25: vmovaps xmm0, xmmword ptr [rbx + 0x60]
0x100270f2a: vaddps xmm0, xmm0, xmmword ptr [rbx + 0xa0]
0x100270f32: vmovaps xmmword ptr [rbp - 0x20], xmm0
0x100270f37: lea rdi, [rbp - 0x30]
0x100270f3b: lea rdx, [rbp - 0x20]
0x100270f3f: vmovss xmm0, dword ptr [rip + 0x834179] ; 0x100aa50c0
0x100270f47: call 0x10062cb10 ; 0x10062cb10
0x100270f4c: vmovaps xmm0, xmmword ptr [rbx + 0xc0]
0x100270f54: vaddps xmm0, xmm0, xmmword ptr [rbp - 0x30]
0x100270f59: vmovaps xmmword ptr [rbx + 0xc0], xmm0
0x100270f61: vmovss xmm0, dword ptr [rbp - 0xc]
0x100270f66: vaddss xmm0, xmm0, dword ptr [rbx + 0x178]
0x100270f6e: vmovss dword ptr [rbx + 0x178], xmm0
0x100270f76: vucomiss xmm0, dword ptr [rip + 0x8376da] ; 0x100aa8658
0x100270f7e: jbe 0x100270fc5
0x100270f80: mov esi, 1
0x100270f85: mov rdi, rbx
0x100270f88: call 0x10026d0f0 ; 0x10026d0f0
0x100270f8d: mov byte ptr [rbx + 0x2d0], 0
0x100270f94: mov dword ptr [rbx + 0x140], 0
0x100270f9e: mov dword ptr [rbx + 0x178], 0
0x100270fa8: mov dword ptr [rbx + 0x100], 0x40800000
0x100270fb2: mov dword ptr [rbx + 0x2e0], 0
0x100270fbc: mov word ptr [rbx + 0x2c1], 0
0x100270fc5: add rsp, 0x28
0x100270fc9: pop rbx
0x100270fca: pop rbp
0x100270fcb: ret 
0x100270fcc: nop dword ptr [rax]
