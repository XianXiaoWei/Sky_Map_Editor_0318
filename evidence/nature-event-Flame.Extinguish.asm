0x10033a780: push rbp
0x10033a781: mov rbp, rsp
0x10033a784: push rbx
0x10033a785: and rsp, 0xffffffffffffffe0
0x10033a789: sub rsp, 0x260
0x10033a790: mov rbx, rdi
0x10033a793: mov rax, qword ptr [rip + 0x8d313e] ; 0x100c0d8d8
0x10033a79a: mov rax, qword ptr [rax]
0x10033a79d: mov qword ptr [rsp + 0x240], rax
0x10033a7a5: cmp byte ptr [rbx + 0xb6], 0
0x10033a7ac: mov byte ptr [rbx + 0xb6], 0
0x10033a7b3: je 0x10033ab19
0x10033a7b9: test sil, sil
0x10033a7bc: je 0x10033ab19
0x10033a7c2: vmovss xmm4, dword ptr [rip + 0x76dde6] ; 0x100aa85b0
0x10033a7ca: vucomiss xmm4, dword ptr [rbx + 0x110]
0x10033a7d2: jbe 0x10033ab19
0x10033a7d8: cmp dword ptr [rbx + 0xbc], 1
0x10033a7df: mov rdi, qword ptr [rbx + 0x148]
0x10033a7e6: vxorps ymm0, ymm0, ymm0
0x10033a7ea: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x10033a7f3: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x10033a7fc: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x10033a805: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x10033a80e: vmovss xmm0, dword ptr [rbx + 0xa8]
0x10033a816: vmovss xmm1, dword ptr [rip + 0x76cfd2] ; 0x100aa77f0
0x10033a81e: vcmpunordss xmm2, xmm0, xmm0
0x10033a823: vandps xmm3, xmm2, xmm1
0x10033a827: vmaxss xmm0, xmm1, xmm0
0x10033a82b: vandnps xmm0, xmm2, xmm0
0x10033a82f: vorps xmm0, xmm0, xmm3
0x10033a833: mov byte ptr [rsp + 0x1cd], 1
0x10033a83b: mov dword ptr [rsp + 0x1c0], 0x3f800000
0x10033a846: vmovaps xmm1, xmmword ptr [rbx + 0xc0]
0x10033a84e: vmovaps xmmword ptr [rsp + 0x1d0], xmm1
0x10033a857: mov dword ptr [rsp + 0x208], 0x40200000
0x10033a862: vmovss dword ptr [rsp + 0x20c], xmm0
0x10033a86b: mov dword ptr [rsp + 0x21c], 0x3f800000
0x10033a876: mov dword ptr [rsp + 0x230], 0x8c31
0x10033a881: vxorps ymm0, ymm0, ymm0
0x10033a885: vmovups ymmword ptr [rsp + 0x18c], ymm0
0x10033a88e: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x10033a897: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x10033a8a0: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x10033a8a9: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x10033a8b2: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x10033a8bb: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x10033a8c4: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x10033a8cd: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x10033a8d6: vmovaps ymmword ptr [rsp + 0x80], ymm0
0x10033a8df: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x10033a8e5: vmovaps ymmword ptr [rsp + 0x40], ymm0
0x10033a8eb: vmovaps ymmword ptr [rsp + 0x20], ymm0
0x10033a8f1: vmovaps ymmword ptr [rsp], ymm0
0x10033a8f6: vmovss xmm0, dword ptr [rbx + 0x108]
0x10033a8fe: vcmpunordss xmm1, xmm0, xmm0
0x10033a903: vandps xmm2, xmm1, xmm4
0x10033a907: vmaxss xmm0, xmm4, xmm0
0x10033a90b: vandnps xmm0, xmm1, xmm0
0x10033a90f: vorps xmm0, xmm0, xmm2
0x10033a913: vmovss xmm1, dword ptr [rip + 0x76c7d9] ; 0x100aa70f4
0x10033a91b: vmulss xmm1, xmm1, dword ptr [rbx + 0x10c]
0x10033a923: vmovss xmm2, dword ptr [rip + 0x76a795] ; 0x100aa50c0
0x10033a92b: vaddss xmm1, xmm1, xmm2
0x10033a92f: vmulss xmm0, xmm0, xmm1
0x10033a933: mov byte ptr [rsp], 0x3f
0x10033a937: vmovss dword ptr [rsp + 0x20], xmm0
0x10033a93d: mov eax, dword ptr [rbx + 0xac]
0x10033a943: mov byte ptr [rsp + 1], 0x32
0x10033a948: mov dword ptr [rsp + 0x24], eax
0x10033a94c: mov dword ptr [rsp + 0x1a0], 3
0x10033a957: mov dword ptr [rsp + 0x1ac], 2
0x10033a962: lea rsi, [rip + 0x846d3f] ; 0x100b816a8 firebreathein
0x10033a969: lea rdx, [rsp + 0x1c0]
0x10033a971: mov rcx, rsp
0x10033a974: vzeroupper 
0x10033a977: call 0x1006018a0 ; 0x1006018a0
0x10033a97c: mov rdi, qword ptr [rbx + 0x148]
0x10033a983: vxorps ymm0, ymm0, ymm0
0x10033a987: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x10033a990: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x10033a999: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x10033a9a2: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x10033a9ab: vmovss xmm0, dword ptr [rbx + 0x108]
0x10033a9b3: vcmpunordss xmm1, xmm0, xmm0
0x10033a9b8: vmovss xmm3, dword ptr [rip + 0x76dbf0] ; 0x100aa85b0
0x10033a9c0: vandps xmm2, xmm1, xmm3
0x10033a9c4: vmaxss xmm0, xmm3, xmm0
0x10033a9c8: vandnps xmm0, xmm1, xmm0
0x10033a9cc: vorps xmm0, xmm0, xmm2
0x10033a9d0: vmovss xmm1, dword ptr [rip + 0x76c71c] ; 0x100aa70f4
0x10033a9d8: vmulss xmm1, xmm1, dword ptr [rbx + 0x10c]
0x10033a9e0: vmovss xmm3, dword ptr [rip + 0x76a6d8] ; 0x100aa50c0
0x10033a9e8: vaddss xmm1, xmm1, xmm3
0x10033a9ec: vmulss xmm0, xmm0, xmm1
0x10033a9f0: vmulss xmm1, xmm0, dword ptr [rbx + 0xa8]
0x10033a9f8: vmaxss xmm2, xmm3, xmm1
0x10033a9fc: vcmpunordss xmm1, xmm1, xmm1
0x10033aa01: vandnps xmm2, xmm1, xmm2
0x10033aa05: vandps xmm1, xmm1, xmm3
0x10033aa09: vorps xmm1, xmm2, xmm1
0x10033aa0d: mov byte ptr [rsp + 0x1cd], 1
0x10033aa15: mov dword ptr [rsp + 0x1c0], 0x3f800000
0x10033aa20: vmovaps xmm2, xmmword ptr [rbx + 0xc0]
0x10033aa28: vmovaps xmmword ptr [rsp + 0x1d0], xmm2
0x10033aa31: mov dword ptr [rsp + 0x208], 0x3f333333
0x10033aa3c: vmovss dword ptr [rsp + 0x20c], xmm1
0x10033aa45: mov dword ptr [rsp + 0x21c], 0x3f800000
0x10033aa50: mov dword ptr [rsp + 0x230], 0x8c31
0x10033aa5b: vxorps ymm1, ymm1, ymm1
0x10033aa5f: vmovaps ymmword ptr [rsp], ymm1
0x10033aa64: vmovaps ymmword ptr [rsp + 0x20], ymm1
0x10033aa6a: vmovups ymmword ptr [rsp + 0x18c], ymm1
0x10033aa73: vmovaps ymmword ptr [rsp + 0x180], ymm1
0x10033aa7c: vmovaps ymmword ptr [rsp + 0x160], ymm1
0x10033aa85: vmovaps ymmword ptr [rsp + 0x140], ymm1
0x10033aa8e: vmovaps ymmword ptr [rsp + 0x120], ymm1
0x10033aa97: vmovaps ymmword ptr [rsp + 0x100], ymm1
0x10033aaa0: vmovaps ymmword ptr [rsp + 0xe0], ymm1
0x10033aaa9: vmovaps ymmword ptr [rsp + 0xc0], ymm1
0x10033aab2: vmovaps ymmword ptr [rsp + 0xa0], ymm1
0x10033aabb: vmovaps ymmword ptr [rsp + 0x80], ymm1
0x10033aac4: vmovaps ymmword ptr [rsp + 0x60], ymm1
0x10033aaca: vmovaps ymmword ptr [rsp + 0x40], ymm1
0x10033aad0: mov byte ptr [rsp], 0x3f
0x10033aad4: vmovss dword ptr [rsp + 0x20], xmm0
0x10033aada: mov eax, dword ptr [rbx + 0xac]
0x10033aae0: mov byte ptr [rsp + 1], 0x32
0x10033aae5: mov dword ptr [rsp + 0x24], eax
0x10033aae9: mov dword ptr [rsp + 0x1a0], 3
0x10033aaf4: mov dword ptr [rsp + 0x1ac], 2
0x10033aaff: lea rsi, [rip + 0x84240c] ; 0x100b7cf12 fireextinguish
0x10033ab06: lea rdx, [rsp + 0x1c0]
0x10033ab0e: mov rcx, rsp
0x10033ab11: vzeroupper 
0x10033ab14: call 0x1006018a0 ; 0x1006018a0
0x10033ab19: mov qword ptr [rbx + 0x10c], 0
0x10033ab24: mov byte ptr [rbx + 0x138], 0
0x10033ab2b: mov rax, qword ptr [rip + 0x8d2da6] ; 0x100c0d8d8
0x10033ab32: mov rax, qword ptr [rax]
0x10033ab35: cmp rax, qword ptr [rsp + 0x240]
0x10033ab3d: jne 0x10033ab46
0x10033ab3f: lea rsp, [rbp - 8]
0x10033ab43: pop rbx
0x10033ab44: pop rbp
0x10033ab45: ret 
0x10033ab46: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x10033ab4b: nop dword ptr [rax + rax]
