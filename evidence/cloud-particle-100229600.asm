0x100229600: push rbp
0x100229601: mov rbp, rsp
0x100229604: push r15
0x100229606: push r14
0x100229608: push r13
0x10022960a: push r12
0x10022960c: push rbx
0x10022960d: sub rsp, 0x28
0x100229611: mov qword ptr [rbp - 0x30], rdx
0x100229615: mov r14, rsi
0x100229618: mov r13, rdi
0x10022961b: jmp 0x100229630 ; 0x100229630
0x10022961d: lea rdi, [r15 + 2]
0x100229621: mov rsi, r14
0x100229624: mov rdx, qword ptr [rbp - 0x30]
0x100229628: call 0x100229600 ; 0x100229600
0x10022962d: mov r14, r15
0x100229630: lea rax, [r14 - 2]
0x100229634: mov qword ptr [rbp - 0x38], rax
0x100229638: lea rax, [r14 - 4]
0x10022963c: mov qword ptr [rbp - 0x48], rax
0x100229640: mov rbx, r13
0x100229643: jmp 0x100229660 ; 0x100229660
0x100229645: mov rdi, r13
0x100229648: mov rsi, r15
0x10022964b: mov rdx, qword ptr [rbp - 0x30]
0x10022964f: call 0x100229600 ; 0x100229600
0x100229654: add r15, 2
0x100229658: mov rbx, r15
0x10022965b: nop dword ptr [rax + rax]
0x100229660: mov r13, rbx
0x100229663: mov rcx, r14
0x100229666: sub rcx, r13
0x100229669: mov rax, rcx
0x10022966c: sar rax, 1
0x10022966f: cmp rax, 5
0x100229673: jbe 0x1002299e3
0x100229679: cmp rcx, 0x3d
0x10022967d: mov r15, qword ptr [rbp - 0x38]
0x100229681: jle 0x100229a25
0x100229687: mov r12, rax
0x10022968a: shr r12, 0x3f
0x10022968e: add r12, rax
0x100229691: and r12, 0xfffffffffffffffe
0x100229695: add r12, r13
0x100229698: cmp rcx, 0x7cf
0x10022969f: jl 0x100229710
0x1002296a1: mov rcx, rax
0x1002296a4: sar rcx, 0x3f
0x1002296a8: shr rcx, 0x3e
0x1002296ac: add rcx, rax
0x1002296af: sar rcx, 2
0x1002296b3: lea rsi, [r13 + rcx*2]
0x1002296b8: lea rcx, [r12 + rcx*2]
0x1002296bc: mov rdi, r13
0x1002296bf: mov rdx, r12
0x1002296c2: mov r8, r15
0x1002296c5: mov rbx, qword ptr [rbp - 0x30]
0x1002296c9: mov r9, rbx
0x1002296cc: call 0x100229d10 ; 0x100229d10
0x1002296d1: mov rcx, qword ptr [rbx]
0x1002296d4: movzx esi, word ptr [r13]
0x1002296d9: vmovss xmm0, dword ptr [rcx + rsi*4]
0x1002296de: movzx edx, word ptr [r12]
0x1002296e3: vmovss xmm1, dword ptr [rcx + rdx*4]
0x1002296e8: vucomiss xmm1, xmm0
0x1002296ec: jbe 0x100229760
0x1002296ee: mov rdx, r15
0x1002296f1: lea r15, [r13 + 2]
0x1002296f5: cmp r15, rdx
0x1002296f8: jb 0x10022984f
0x1002296fe: cmp r15, r12
0x100229701: jne 0x10022989c
0x100229707: jmp 0x1002298bc ; 0x1002298bc
0x10022970c: nop dword ptr [rax]
0x100229710: movzx esi, word ptr [r12]
0x100229715: movzx edx, word ptr [r13]
0x10022971a: mov rax, qword ptr [rbp - 0x30]
0x10022971e: mov rcx, qword ptr [rax]
0x100229721: vmovss xmm1, dword ptr [rcx + rsi*4]
0x100229726: vmovss xmm0, dword ptr [rcx + rdx*4]
0x10022972b: vucomiss xmm0, xmm1
0x10022972f: movzx edi, word ptr [r15]
0x100229733: vmovss xmm2, dword ptr [rcx + rdi*4]
0x100229738: jbe 0x1002297e0
0x10022973e: vucomiss xmm1, xmm2
0x100229742: jbe 0x10022991e
0x100229748: mov word ptr [r13], di
0x10022974d: mov word ptr [r15], dx
0x100229751: mov eax, 1
0x100229756: jmp 0x1002296d4 ; 0x1002296d4
0x10022975b: nop dword ptr [rax + rax]
0x100229760: mov rdi, qword ptr [rbp - 0x48]
0x100229764: mov rdx, rdi
0x100229767: cmp r13, rdi
0x10022976a: je 0x100229787
0x10022976c: nop dword ptr [rax]
0x100229770: movzx edi, word ptr [rdx]
0x100229773: vucomiss xmm1, dword ptr [rcx + rdi*4]
0x100229778: ja 0x100229823
0x10022977e: add rdx, -2
0x100229782: cmp r13, rdx
0x100229785: jne 0x100229770
0x100229787: lea rax, [r13 + 2]
0x10022978b: movzx edx, word ptr [r15]
0x10022978f: vmovss xmm1, dword ptr [rcx + rdx*4]
0x100229794: vucomiss xmm1, xmm0
0x100229798: ja 0x100229957
0x10022979e: cmp rax, r15
0x1002297a1: je 0x100229cde
0x1002297a7: lea rax, [r13 + 4]
0x1002297ab: nop dword ptr [rax + rax]
0x1002297b0: movzx esi, word ptr [rax - 2]
0x1002297b4: vmovss xmm1, dword ptr [rcx + rsi*4]
0x1002297b9: vucomiss xmm1, xmm0
0x1002297bd: ja 0x10022994f
0x1002297c3: add rax, 2
0x1002297c7: cmp r14, rax
0x1002297ca: jne 0x1002297b0
0x1002297cc: jmp 0x100229cde ; 0x100229cde
0x1002297d1: nop word ptr cs:[rax + rax]
0x1002297e0: xor eax, eax
0x1002297e2: vucomiss xmm1, xmm2
0x1002297e6: jbe 0x1002296d4
0x1002297ec: mov word ptr [r12], di
0x1002297f1: mov word ptr [r15], si
0x1002297f5: movzx edx, word ptr [r12]
0x1002297fa: movzx esi, word ptr [r13]
0x1002297ff: vmovss xmm0, dword ptr [rcx + rsi*4]
0x100229804: mov eax, 1
0x100229809: vucomiss xmm0, dword ptr [rcx + rdx*4]
0x10022980e: jbe 0x1002296d4
0x100229814: mov word ptr [r13], dx
0x100229819: mov word ptr [r12], si
0x10022981e: jmp 0x100229945 ; 0x100229945
0x100229823: mov word ptr [r13], di
0x100229828: mov word ptr [rdx], si
0x10022982b: inc eax
0x10022982d: lea r15, [r13 + 2]
0x100229831: cmp r15, rdx
0x100229834: jb 0x10022984f
0x100229836: jmp 0x1002296fe ; 0x1002296fe
0x10022983b: nop dword ptr [rax + rax]
0x100229840: mov word ptr [rsi], bx
0x100229843: mov word ptr [rdx], di
0x100229846: inc eax
0x100229848: cmp r12, rsi
0x10022984b: cmove r12, rdx
0x10022984f: movzx esi, word ptr [r12]
0x100229854: vmovss xmm0, dword ptr [rcx + rsi*4]
0x100229859: add r15, -2
0x10022985d: mov rsi, r15
0x100229860: movzx edi, word ptr [rsi + 2]
0x100229864: add rsi, 2
0x100229868: vucomiss xmm0, dword ptr [rcx + rdi*4]
0x10022986d: ja 0x100229860
0x10022986f: lea r15, [rsi + 2]
0x100229873: nop word ptr cs:[rax + rax]
0x100229880: movzx ebx, word ptr [rdx - 2]
0x100229884: add rdx, -2
0x100229888: vucomiss xmm0, dword ptr [rcx + rbx*4]
0x10022988d: jbe 0x100229880
0x10022988f: cmp rsi, rdx
0x100229892: jbe 0x100229840
0x100229894: mov r15, rsi
0x100229897: cmp r15, r12
0x10022989a: je 0x1002298bc
0x10022989c: movzx edx, word ptr [r12]
0x1002298a1: movzx esi, word ptr [r15]
0x1002298a5: vmovss xmm0, dword ptr [rcx + rsi*4]
0x1002298aa: vucomiss xmm0, dword ptr [rcx + rdx*4]
0x1002298af: jbe 0x1002298bc
0x1002298b1: mov word ptr [r15], dx
0x1002298b5: mov word ptr [r12], si
0x1002298ba: inc eax
0x1002298bc: test eax, eax
0x1002298be: jne 0x100229904
0x1002298c0: mov qword ptr [rbp - 0x40], r13
0x1002298c4: mov rdi, r13
0x1002298c7: mov rsi, r15
0x1002298ca: mov rdx, qword ptr [rbp - 0x30]
0x1002298ce: call 0x100229ea0 ; 0x100229ea0
0x1002298d3: mov r12d, eax
0x1002298d6: lea rbx, [r15 + 2]
0x1002298da: mov rdi, rbx
0x1002298dd: mov r13, r14
0x1002298e0: mov rsi, r14
0x1002298e3: mov rdx, qword ptr [rbp - 0x30]
0x1002298e7: call 0x100229ea0 ; 0x100229ea0
0x1002298ec: test al, al
0x1002298ee: jne 0x1002299ce
0x1002298f4: test r12b, r12b
0x1002298f7: mov r14, r13
0x1002298fa: mov r13, qword ptr [rbp - 0x40]
0x1002298fe: jne 0x100229660
0x100229904: mov rax, r15
0x100229907: sub rax, r13
0x10022990a: mov rcx, r14
0x10022990d: sub rcx, r15
0x100229910: cmp rax, rcx
0x100229913: jl 0x100229645
0x100229919: jmp 0x10022961d ; 0x10022961d
0x10022991e: mov word ptr [r13], si
0x100229923: mov word ptr [r12], dx
0x100229928: movzx esi, word ptr [r15]
0x10022992c: mov eax, 1
0x100229931: vucomiss xmm0, dword ptr [rcx + rsi*4]
0x100229936: jbe 0x1002296d4
0x10022993c: mov word ptr [r12], si
0x100229941: mov word ptr [r15], dx
0x100229945: mov eax, 2
0x10022994a: jmp 0x1002296d4 ; 0x1002296d4
0x10022994f: mov word ptr [rax - 2], dx
0x100229953: mov word ptr [r15], si
0x100229957: cmp rax, r15
0x10022995a: jne 0x100229977
0x10022995c: jmp 0x100229cde ; 0x100229cde
0x100229961: nop word ptr cs:[rax + rax]
0x100229970: mov word ptr [rbx], di
0x100229973: mov word ptr [r15], si
0x100229977: movzx esi, word ptr [r13]
0x10022997c: vmovss xmm0, dword ptr [rcx + rsi*4]
0x100229981: nop word ptr cs:[rax + rax]
0x100229990: movzx esi, word ptr [rax]
0x100229993: vmovss xmm1, dword ptr [rcx + rsi*4]
0x100229998: add rax, 2
0x10022999c: vucomiss xmm1, xmm0
0x1002299a0: jbe 0x100229990
0x1002299a2: lea rbx, [rax - 2]
0x1002299a6: nop word ptr cs:[rax + rax]
0x1002299b0: movzx edi, word ptr [r15 - 2]
0x1002299b5: add r15, -2
0x1002299b9: vmovss xmm1, dword ptr [rcx + rdi*4]
0x1002299be: vucomiss xmm1, xmm0
0x1002299c2: ja 0x1002299b0
0x1002299c4: cmp rbx, r15
0x1002299c7: jb 0x100229970
0x1002299c9: jmp 0x100229660 ; 0x100229660
0x1002299ce: mov r14, r15
0x1002299d1: test r12b, r12b
0x1002299d4: mov r13, qword ptr [rbp - 0x40]
0x1002299d8: je 0x100229630
0x1002299de: jmp 0x100229cde ; 0x100229cde
0x1002299e3: lea rcx, [rip + 0x306] ; 0x100229cf0
0x1002299ea: movsxd rax, dword ptr [rcx + rax*4]
0x1002299ee: add rax, rcx
0x1002299f1: mov r8, qword ptr [rbp - 0x38]
0x1002299f5: jmp rax
0x1002299f7: movzx eax, word ptr [r8]
0x1002299fb: movzx ecx, word ptr [r13]
0x100229a00: mov rdx, qword ptr [rbp - 0x30]
0x100229a04: mov rdx, qword ptr [rdx]
0x100229a07: vmovss xmm0, dword ptr [rdx + rcx*4]
0x100229a0c: vucomiss xmm0, dword ptr [rdx + rax*4]
0x100229a11: jbe 0x100229cde
0x100229a17: mov word ptr [r13], ax
0x100229a1c: mov word ptr [r8], cx
0x100229a20: jmp 0x100229cde ; 0x100229cde
0x100229a25: movzx ecx, word ptr [r13 + 2]
0x100229a2a: movzx edx, word ptr [r13]
0x100229a2f: mov rax, qword ptr [rbp - 0x30]
0x100229a33: mov rax, qword ptr [rax]
0x100229a36: vmovss xmm2, dword ptr [rax + rcx*4]
0x100229a3b: vmovss xmm0, dword ptr [rax + rdx*4]
0x100229a40: vucomiss xmm0, xmm2
0x100229a44: movzx esi, word ptr [r13 + 4]
0x100229a49: vmovss xmm1, dword ptr [rax + rsi*4]
0x100229a4e: jbe 0x100229a5d
0x100229a50: vucomiss xmm2, xmm1
0x100229a54: jbe 0x100229a8b
0x100229a56: mov word ptr [r13], si
0x100229a5b: jmp 0x100229aa0 ; 0x100229aa0
0x100229a5d: vucomiss xmm2, xmm1
0x100229a61: jbe 0x100229ab6
0x100229a63: mov word ptr [r13 + 2], si
0x100229a68: mov word ptr [r13 + 4], cx
0x100229a6d: vucomiss xmm0, xmm1
0x100229a71: jbe 0x100229aa8
0x100229a73: mov word ptr [r13], si
0x100229a78: mov word ptr [r13 + 2], dx
0x100229a7d: lea rsi, [r13 + 6]
0x100229a81: cmp rsi, r14
0x100229a84: jne 0x100229ac6
0x100229a86: jmp 0x100229cde ; 0x100229cde
0x100229a8b: mov word ptr [r13], cx
0x100229a90: mov word ptr [r13 + 2], dx
0x100229a95: vucomiss xmm0, xmm1
0x100229a99: jbe 0x100229ab6
0x100229a9b: mov word ptr [r13 + 2], si
0x100229aa0: mov word ptr [r13 + 4], dx
0x100229aa5: mov cx, dx
0x100229aa8: lea rsi, [r13 + 6]
0x100229aac: cmp rsi, r14
0x100229aaf: jne 0x100229ac6
0x100229ab1: jmp 0x100229cde ; 0x100229cde
0x100229ab6: mov cx, si
0x100229ab9: lea rsi, [r13 + 6]
0x100229abd: cmp rsi, r14
0x100229ac0: je 0x100229cde
0x100229ac6: mov ebx, 6
0x100229acb: jmp 0x100229afd ; 0x100229afd
0x100229acd: nop dword ptr [rax]
0x100229ad0: add rdx, r13
0x100229ad3: jmp 0x100229ae3 ; 0x100229ae3
0x100229ad5: nop word ptr cs:[rax + rax]
0x100229ae0: mov rdx, r13
0x100229ae3: mov word ptr [rdx], di
0x100229ae6: lea rdx, [rsi + 2]
0x100229aea: cmp rdx, r14
0x100229aed: je 0x100229cde
0x100229af3: mov cx, word ptr [rsi]
0x100229af6: add rbx, 2
0x100229afa: mov rsi, rdx
0x100229afd: movzx edi, word ptr [rsi]
0x100229b00: vmovss xmm0, dword ptr [rax + rdi*4]
0x100229b05: movzx edx, cx
0x100229b08: vmovss xmm1, dword ptr [rax + rdx*4]
0x100229b0d: vucomiss xmm1, xmm0
0x100229b11: jbe 0x100229ae6
0x100229b13: mov rdx, rbx
0x100229b16: nop word ptr cs:[rax + rax]
0x100229b20: mov word ptr [r13 + rdx], cx
0x100229b26: cmp rdx, 2
0x100229b2a: je 0x100229ae0
0x100229b2c: movzx ecx, word ptr [r13 + rdx - 4]
0x100229b32: vmovss xmm1, dword ptr [rax + rcx*4]
0x100229b37: add rdx, -2
0x100229b3b: vucomiss xmm1, xmm0
0x100229b3f: ja 0x100229b20
0x100229b41: jmp 0x100229ad0 ; 0x100229ad0
0x100229b43: movzx edx, word ptr [r13 + 2]
0x100229b48: movzx ecx, word ptr [r13]
0x100229b4d: mov rax, qword ptr [rbp - 0x30]
0x100229b51: mov rax, qword ptr [rax]
0x100229b54: vmovss xmm1, dword ptr [rax + rdx*4]
0x100229b59: vmovss xmm0, dword ptr [rax + rcx*4]
0x100229b5e: vucomiss xmm0, xmm1
0x100229b62: movzx esi, word ptr [r8]
0x100229b66: vmovss xmm2, dword ptr [rax + rsi*4]
0x100229b6b: jbe 0x100229bea
0x100229b6d: vucomiss xmm1, xmm2
0x100229b71: jbe 0x100229c3e
0x100229b77: mov word ptr [r13], si
0x100229b7c: mov word ptr [r8], cx
0x100229b80: jmp 0x100229cde ; 0x100229cde
0x100229b85: lea rdx, [r13 + 4]
0x100229b89: lea rcx, [r13 + 6]
0x100229b8d: lea rsi, [r13 + 2]
0x100229b91: mov rdi, r13
0x100229b94: mov r9, qword ptr [rbp - 0x30]
0x100229b98: add rsp, 0x28
0x100229b9c: pop rbx
0x100229b9d: pop r12
0x100229b9f: pop r13
0x100229ba1: pop r14
0x100229ba3: pop r15
0x100229ba5: pop rbp
0x100229ba6: jmp 0x100229d10 ; 0x100229d10
0x100229bab: movzx ecx, word ptr [r13 + 2]
0x100229bb0: movzx edx, word ptr [r13]
0x100229bb5: mov rax, qword ptr [rbp - 0x30]
0x100229bb9: mov rax, qword ptr [rax]
0x100229bbc: vmovss xmm2, dword ptr [rax + rcx*4]
0x100229bc1: vmovss xmm0, dword ptr [rax + rdx*4]
0x100229bc6: vucomiss xmm0, xmm2
0x100229bca: movzx esi, word ptr [r13 + 4]
0x100229bcf: vmovss xmm1, dword ptr [rax + rsi*4]
0x100229bd4: jbe 0x100229c1c
0x100229bd6: vucomiss xmm2, xmm1
0x100229bda: jbe 0x100229c62
0x100229be0: mov word ptr [r13], si
0x100229be5: jmp 0x100229c77 ; 0x100229c77
0x100229bea: vucomiss xmm1, xmm2
0x100229bee: jbe 0x100229cde
0x100229bf4: mov word ptr [r13 + 2], si
0x100229bf9: mov word ptr [r8], dx
0x100229bfd: movzx ecx, word ptr [r13 + 2]
0x100229c02: movzx edx, word ptr [r13]
0x100229c07: vmovss xmm0, dword ptr [rax + rdx*4]
0x100229c0c: vucomiss xmm0, dword ptr [rax + rcx*4]
0x100229c11: ja 0x100229cd4
0x100229c17: jmp 0x100229cde ; 0x100229cde
0x100229c1c: vucomiss xmm2, xmm1
0x100229c20: jbe 0x100229c81
0x100229c22: mov word ptr [r13 + 2], si
0x100229c27: mov word ptr [r13 + 4], cx
0x100229c2c: vucomiss xmm0, xmm1
0x100229c30: jbe 0x100229c84
0x100229c32: mov word ptr [r13], si
0x100229c37: mov word ptr [r13 + 2], dx
0x100229c3c: jmp 0x100229c84 ; 0x100229c84
0x100229c3e: mov word ptr [r13], dx
0x100229c43: mov word ptr [r13 + 2], cx
0x100229c48: movzx edx, word ptr [r8]
0x100229c4c: vucomiss xmm0, dword ptr [rax + rdx*4]
0x100229c51: jbe 0x100229cde
0x100229c57: mov word ptr [r13 + 2], dx
0x100229c5c: mov word ptr [r8], cx
0x100229c60: jmp 0x100229cde ; 0x100229cde
0x100229c62: mov word ptr [r13], cx
0x100229c67: mov word ptr [r13 + 2], dx
0x100229c6c: vucomiss xmm0, xmm1
0x100229c70: jbe 0x100229c81
0x100229c72: mov word ptr [r13 + 2], si
0x100229c77: mov word ptr [r13 + 4], dx
0x100229c7c: mov cx, dx
0x100229c7f: jmp 0x100229c84 ; 0x100229c84
0x100229c81: mov cx, si
0x100229c84: movzx edx, word ptr [r8]
0x100229c88: movzx esi, cx
0x100229c8b: vmovss xmm0, dword ptr [rax + rsi*4]
0x100229c90: vucomiss xmm0, dword ptr [rax + rdx*4]
0x100229c95: jbe 0x100229cde
0x100229c97: mov word ptr [r13 + 4], dx
0x100229c9c: mov word ptr [r8], cx
0x100229ca0: movzx ecx, word ptr [r13 + 4]
0x100229ca5: movzx edx, word ptr [r13 + 2]
0x100229caa: vmovss xmm0, dword ptr [rax + rcx*4]
0x100229caf: vmovss xmm1, dword ptr [rax + rdx*4]
0x100229cb4: vucomiss xmm1, xmm0
0x100229cb8: jbe 0x100229cde
0x100229cba: mov word ptr [r13 + 2], cx
0x100229cbf: mov word ptr [r13 + 4], dx
0x100229cc4: movzx edx, word ptr [r13]
0x100229cc9: vmovss xmm1, dword ptr [rax + rdx*4]
0x100229cce: vucomiss xmm1, xmm0
0x100229cd2: jbe 0x100229cde
0x100229cd4: mov word ptr [r13], cx
0x100229cd9: mov word ptr [r13 + 2], dx
0x100229cde: add rsp, 0x28
0x100229ce2: pop rbx
0x100229ce3: pop r12
0x100229ce5: pop r13
0x100229ce7: pop r14
0x100229ce9: pop r15
0x100229ceb: pop rbp
0x100229cec: ret 
