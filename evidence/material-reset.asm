0x100443f50: push rbp
0x100443f51: mov rbp, rsp
0x100443f54: push r15
0x100443f56: push r14
0x100443f58: push rbx
0x100443f59: sub rsp, 0x28
0x100443f5d: mov r15, rdi
0x100443f60: mov dword ptr [r15 + 0xc], 0
0x100443f68: mov ebx, 0x1ac
0x100443f6d: lea r14, [rbp - 0x30]
0x100443f71: nop word ptr cs:[rax + rax]
0x100443f80: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x100443f85: mov byte ptr [r15 + rbx - 0x19c], 0
0x100443f8e: mov qword ptr [r15 + rbx - 0x194], 0
0x100443f9a: mov byte ptr [r15 + rbx - 0x18c], 0
0x100443fa3: vxorps xmm0, xmm0, xmm0
0x100443fa7: vxorps xmm1, xmm1, xmm1
0x100443fab: mov rdi, r14
0x100443fae: vmovss xmm2, dword ptr [rip + 0x660602] ; 0x100aa45b8
0x100443fb6: vmovss xmm3, dword ptr [rip + 0x661102] ; 0x100aa50c0
0x100443fbe: call 0x10077d540 ; 0x10077d540
0x100443fc3: vmovaps xmm0, xmmword ptr [rbp - 0x30]
0x100443fc8: vmovaps xmmword ptr [r15 + rbx - 0x17c], xmm0
0x100443fd2: vxorps xmm0, xmm0, xmm0
0x100443fd6: vxorps xmm1, xmm1, xmm1
0x100443fda: vxorps xmm2, xmm2, xmm2
0x100443fde: mov rdi, r14
0x100443fe1: vmovss xmm3, dword ptr [rip + 0x6610d7] ; 0x100aa50c0
0x100443fe9: call 0x10077d540 ; 0x10077d540
0x100443fee: vmovaps xmm0, xmmword ptr [rbp - 0x30]
0x100443ff3: vmovaps xmmword ptr [r15 + rbx - 0x16c], xmm0
0x100443ffd: vxorps xmm0, xmm0, xmm0
0x100444001: vxorps xmm1, xmm1, xmm1
0x100444005: mov rdi, r14
0x100444008: vmovss xmm2, dword ptr [rip + 0x6610b0] ; 0x100aa50c0
0x100444010: vmovaps xmm3, xmm2
0x100444014: call 0x10077d540 ; 0x10077d540
0x100444019: vmovaps xmm0, xmmword ptr [rbp - 0x30]
0x10044401e: vmovaps xmmword ptr [r15 + rbx - 0x15c], xmm0
0x100444028: mov word ptr [r15 + rbx - 0x13c], 0xff00
0x100444033: vmovaps xmm0, xmmword ptr [rip + 0x667e65] ; 0x100aabea0
0x10044403b: vmovaps xmmword ptr [r15 + rbx - 0x14c], xmm0
0x100444045: mov qword ptr [r15 + rbx - 0x114], 0
0x100444051: mov qword ptr [r15 + rbx - 0xf4], 0
0x10044405d: vxorps xmm1, xmm1, xmm1
0x100444061: vmovaps xmmword ptr [r15 + rbx - 0xcc], xmm1
0x10044406b: mov qword ptr [r15 + rbx - 0x8c], 0
0x100444077: vblendps xmm0, xmm1, xmmword ptr [rbp - 0x40], 8
0x10044407e: vmovaps xmmword ptr [r15 + rbx - 0x6c], xmm0
0x100444085: mov qword ptr [r15 + rbx - 0x2c], 0
0x10044408e: mov qword ptr [r15 + rbx - 0xc], 0
0x100444097: vmovups xmmword ptr [r15 + rbx - 0x134], xmm1
0x1004440a1: vmovaps xmmword ptr [r15 + rbx - 0xbc], xmm1
0x1004440ab: vblendps xmm0, xmm1, xmm0, 8
0x1004440b1: vmovaps xmmword ptr [r15 + rbx - 0x5c], xmm0
0x1004440b8: vmovups xmmword ptr [r15 + rbx - 0x10c], xmm1
0x1004440c2: vmovups xmmword ptr [r15 + rbx - 0xec], xmm1
0x1004440cc: vmovaps xmmword ptr [r15 + rbx - 0xac], xmm1
0x1004440d6: vmovups xmmword ptr [r15 + rbx - 0x84], xmm1
0x1004440e0: vblendps xmm0, xmm1, xmm0, 8
0x1004440e6: vmovaps xmmword ptr [r15 + rbx - 0x4c], xmm0
0x1004440ed: vmovups xmmword ptr [r15 + rbx - 0x24], xmm1
0x1004440f4: mov qword ptr [r15 + rbx - 4], 0
0x1004440fd: vmovups xmmword ptr [r15 + rbx - 0x124], xmm1
0x100444107: mov qword ptr [r15 + rbx - 0xfc], 0
0x100444113: mov qword ptr [r15 + rbx - 0xdc], 0
0x10044411f: vmovaps xmmword ptr [r15 + rbx - 0x9c], xmm1
0x100444129: mov qword ptr [r15 + rbx - 0x74], 0
0x100444132: vblendps xmm0, xmm1, xmm0, 8
0x100444138: vmovaps xmmword ptr [r15 + rbx - 0x3c], xmm0
0x10044413f: mov qword ptr [r15 + rbx - 0x14], 0
0x100444148: add rbx, 0x1a0
0x10044414f: cmp rbx, 0x326c
0x100444156: jne 0x100443f80
0x10044415c: add r15, 0x30d0
0x100444163: mov esi, 0x400
0x100444168: mov rdi, r15
0x10044416b: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x100444170: add rsp, 0x28
0x100444174: pop rbx
0x100444175: pop r14
0x100444177: pop r15
0x100444179: pop rbp
0x10044417a: ret 
0x10044417b: nop dword ptr [rax + rax]
