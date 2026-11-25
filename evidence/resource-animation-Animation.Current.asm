0x10009d520: push rbp
0x10009d521: mov rbp, rsp
0x10009d524: mov eax, 0xffffffff
0x10009d529: cmp esi, 2
0x10009d52c: je 0x10009d550
0x10009d52e: cmp esi, 1
0x10009d531: je 0x10009d565
0x10009d533: test esi, esi
0x10009d535: jne 0x10009d5cd
0x10009d53b: lea rcx, [rdi + 0x18]
0x10009d53f: lea rdx, [rdi + 8]
0x10009d543: movsxd rdx, dword ptr [rdx]
0x10009d546: test rdx, rdx
0x10009d549: jg 0x10009d578
0x10009d54b: jmp 0x10009d5cd ; 0x10009d5cd
0x10009d550: lea rcx, [rdi + 0x4998]
0x10009d557: lea rdx, [rdi + 0x10]
0x10009d55b: movsxd rdx, dword ptr [rdx]
0x10009d55e: test rdx, rdx
0x10009d561: jg 0x10009d578
0x10009d563: jmp 0x10009d5cd ; 0x10009d5cd
0x10009d565: lea rcx, [rdi + 0x4298]
0x10009d56c: lea rdx, [rdi + 0xc]
0x10009d570: movsxd rdx, dword ptr [rdx]
0x10009d573: test rdx, rdx
0x10009d576: jle 0x10009d5cd
0x10009d578: lea rsi, [rdi + 0x18]
0x10009d57c: lea r8, [rdi + 0x4298]
0x10009d583: lea r9, [rdi + 0x4998]
0x10009d58a: imul rdi, rdx, 0x70
0x10009d58e: inc rdx
0x10009d591: lea rcx, [rcx + rdi - 0x70]
0x10009d596: vxorps xmm0, xmm0, xmm0
0x10009d59a: nop word ptr [rax + rax]
0x10009d5a0: cmp byte ptr [rcx + 0x4f], 0
0x10009d5a4: je 0x10009d5c0
0x10009d5a6: vmovss xmm1, dword ptr [rcx + 0x14]
0x10009d5ab: vucomiss xmm1, xmm0
0x10009d5af: jbe 0x10009d5c0
0x10009d5b1: cmp dword ptr [rcx + 4], -1
0x10009d5b5: je 0x10009d5c0
0x10009d5b7: cmp dword ptr [rcx + 8], -1
0x10009d5bb: jne 0x10009d5cf
0x10009d5bd: nop dword ptr [rax]
0x10009d5c0: dec rdx
0x10009d5c3: add rcx, -0x70
0x10009d5c7: cmp rdx, 1
0x10009d5cb: jg 0x10009d5a0
0x10009d5cd: pop rbp
0x10009d5ce: ret 
0x10009d5cf: cmp rsi, rcx
0x10009d5d2: ja 0x10009d5f0
0x10009d5d4: cmp r8, rcx
0x10009d5d7: jbe 0x10009d5f0
0x10009d5d9: sub rcx, rsi
0x10009d5dc: sar rcx, 4
0x10009d5e0: movabs rax, 0x6db6db6db6db6db7
0x10009d5ea: imul rax, rcx
0x10009d5ee: pop rbp
0x10009d5ef: ret 
0x10009d5f0: cmp r8, rcx
0x10009d5f3: ja 0x10009d617
0x10009d5f5: cmp r9, rcx
0x10009d5f8: jbe 0x10009d617
0x10009d5fa: sub rcx, r8
0x10009d5fd: sar rcx, 4
0x10009d601: movabs rax, 0x6db6db6db6db6db7
0x10009d60b: imul rax, rcx
0x10009d60f: add rax, 0x98
0x10009d615: pop rbp
0x10009d616: ret 
0x10009d617: sub rcx, r9
0x10009d61a: sar rcx, 4
0x10009d61e: movabs rax, 0x6db6db6db6db6db7
0x10009d628: imul rax, rcx
0x10009d62c: add rax, 0xa8
0x10009d632: pop rbp
0x10009d633: ret 
0x10009d634: nop word ptr cs:[rax + rax]
