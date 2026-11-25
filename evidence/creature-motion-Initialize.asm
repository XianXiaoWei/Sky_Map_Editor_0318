0x10062e5b0: push rbp
0x10062e5b1: mov rbp, rsp
0x10062e5b4: mov qword ptr [rdi + 0x1d0], rsi
0x10062e5bb: mov qword ptr [rdi + 0x1d8], rdx
0x10062e5c2: mov qword ptr [rdi + 0x1e0], rcx
0x10062e5c9: vmovaps xmm0, xmmword ptr [rip + 0x47a45f] ; 0x100aa8a30
0x10062e5d1: vmovaps xmmword ptr [rdi + 0x90], xmm0
0x10062e5d9: vxorps xmm0, xmm0, xmm0
0x10062e5dd: vmovaps xmmword ptr [rdi + 0xa0], xmm0
0x10062e5e5: movsxd rax, dword ptr [rip + 0x6fe54c] ; 0x100d2cb38
0x10062e5ec: lea ecx, [rax + 1]
0x10062e5ef: mov dword ptr [rip + 0x6fe543], ecx ; 0x100d2cb38
0x10062e5f5: imul rcx, rax, 0x66666667
0x10062e5fc: mov rdx, rcx
0x10062e5ff: shr rdx, 0x3f
0x10062e603: sar rcx, 0x21
0x10062e607: add ecx, edx
0x10062e609: lea ecx, [rcx + rcx*4]
0x10062e60c: sub eax, ecx
0x10062e60e: mov dword ptr [rdi + 0xb4], eax
0x10062e614: mov byte ptr [rdi + 0xb0], 0
0x10062e61b: mov dword ptr [rdi + 0x1b8], 0
0x10062e625: movsxd rax, dword ptr [rip + 0x6fe510] ; 0x100d2cb3c
0x10062e62c: lea ecx, [rax + 1]
0x10062e62f: mov dword ptr [rip + 0x6fe507], ecx ; 0x100d2cb3c
0x10062e635: imul rcx, rax, 0x38e38e39
0x10062e63c: mov rdx, rcx
0x10062e63f: shr rdx, 0x3f
0x10062e643: sar rcx, 0x21
0x10062e647: add ecx, edx
0x10062e649: lea ecx, [rcx + rcx*8]
0x10062e64c: sub eax, ecx
0x10062e64e: mov dword ptr [rdi + 0x1bc], eax
0x10062e654: mov qword ptr [rdi + 0x1c0], 0
0x10062e65f: movsxd rax, dword ptr [rip + 0x6fe4da] ; 0x100d2cb40
0x10062e666: lea ecx, [rax + 1]
0x10062e669: mov dword ptr [rip + 0x6fe4d1], ecx ; 0x100d2cb40
0x10062e66f: imul rcx, rax, 0x38e38e39
0x10062e676: mov rdx, rcx
0x10062e679: shr rdx, 0x3f
0x10062e67d: sar rcx, 0x21
0x10062e681: add ecx, edx
0x10062e683: lea ecx, [rcx + rcx*8]
0x10062e686: sub eax, ecx
0x10062e688: mov dword ptr [rdi + 0x1c8], eax
0x10062e68e: pop rbp
0x10062e68f: ret 
