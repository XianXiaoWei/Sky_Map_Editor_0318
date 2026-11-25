0x10055c580: push rbp
0x10055c581: mov rbp, rsp
0x10055c584: push r15
0x10055c586: push r14
0x10055c588: push r13
0x10055c58a: push r12
0x10055c58c: push rbx
0x10055c58d: push rax
0x10055c58e: mov r15, r9
0x10055c591: mov r14, r8
0x10055c594: mov r12, rcx
0x10055c597: mov r13, rsi
0x10055c59a: mov ebx, edi
0x10055c59c: mov rsi, qword ptr [rbp + 0x18]
0x10055c5a0: mov rdi, qword ptr [rbp + 0x10]
0x10055c5a4: vmovss xmm0, dword ptr [r13]
0x10055c5aa: test dl, dl
0x10055c5ac: je 0x10055c623
0x10055c5ae: vmovss xmm1, dword ptr [rip + 0x548b0a] ; 0x100aa50c0
0x10055c5b6: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x10055c5bb: mov rdi, qword ptr [rbp + 0x10]
0x10055c5bf: vaddss xmm1, xmm0, dword ptr [rip + 0x548af9] ; 0x100aa50c0
0x10055c5c7: vxorps xmm2, xmm2, xmm2
0x10055c5cb: vcmpltss xmm2, xmm0, xmm2
0x10055c5d0: vblendvps xmm0, xmm0, xmm1, xmm2
0x10055c5d6: vmovss dword ptr [r13], xmm0
0x10055c5dc: mov eax, ebx
0x10055c5de: vcvtsi2ss xmm1, xmm3, rax
0x10055c5e3: vmulss xmm2, xmm0, xmm1
0x10055c5e7: vcvttss2si rax, xmm2
0x10055c5ec: mov dword ptr [r12], eax
0x10055c5f0: lea ecx, [rbx - 1]
0x10055c5f3: lea edx, [rax + 1]
0x10055c5f6: xor esi, esi
0x10055c5f8: cmp ecx, eax
0x10055c5fa: cmove edx, esi
0x10055c5fd: mov dword ptr [r14], edx
0x10055c600: mov eax, dword ptr [r12]
0x10055c604: test eax, eax
0x10055c606: cmove eax, ebx
0x10055c609: dec eax
0x10055c60b: mov dword ptr [r15], eax
0x10055c60e: add ebx, -2
0x10055c611: mov eax, dword ptr [r14]
0x10055c614: inc eax
0x10055c616: cmp dword ptr [r12], ebx
0x10055c61a: cmove eax, esi
0x10055c61d: mov rsi, qword ptr [rbp + 0x18]
0x10055c621: jmp 0x10055c67a ; 0x10055c67a
0x10055c623: vxorps xmm1, xmm1, xmm1
0x10055c627: vmaxss xmm0, xmm1, xmm0
0x10055c62b: vmovss xmm1, dword ptr [rip + 0x548a8d] ; 0x100aa50c0
0x10055c633: vminss xmm0, xmm1, xmm0
0x10055c637: vmovss dword ptr [r13], xmm0
0x10055c63d: lea ecx, [rbx - 1]
0x10055c640: vcvtsi2ss xmm1, xmm2, rcx
0x10055c645: vmulss xmm2, xmm0, xmm1
0x10055c649: vcvttss2si rax, xmm2
0x10055c64e: add ebx, -2
0x10055c651: cmp ecx, eax
0x10055c653: cmovne ebx, eax
0x10055c656: mov dword ptr [r12], ebx
0x10055c65a: inc ebx
0x10055c65c: mov dword ptr [r14], ebx
0x10055c65f: mov eax, dword ptr [r12]
0x10055c663: lea edx, [rax - 1]
0x10055c666: test eax, eax
0x10055c668: cmove edx, eax
0x10055c66b: mov dword ptr [r15], edx
0x10055c66e: mov edx, dword ptr [r14]
0x10055c671: xor eax, eax
0x10055c673: cmp edx, ecx
0x10055c675: setne al
0x10055c678: add eax, edx
0x10055c67a: vmulss xmm0, xmm1, xmm0
0x10055c67e: mov dword ptr [rdi], eax
0x10055c680: mov eax, dword ptr [r12]
0x10055c684: vcvtsi2ss xmm1, xmm3, rax
0x10055c689: vsubss xmm0, xmm0, xmm1
0x10055c68d: vmovss dword ptr [rsi], xmm0
0x10055c691: add rsp, 8
0x10055c695: pop rbx
0x10055c696: pop r12
0x10055c698: pop r13
0x10055c69a: pop r14
0x10055c69c: pop r15
0x10055c69e: pop rbp
0x10055c69f: ret 
