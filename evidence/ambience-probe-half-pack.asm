0x1007ec050: push rbp
0x1007ec051: mov rbp, rsp
0x1007ec054: push r15
0x1007ec056: push r14
0x1007ec058: push rbx
0x1007ec059: cmp edx, 4
0x1007ec05c: jb 0x1007ec0c8
0x1007ec05e: lea r8d, [rdx - 4]
0x1007ec062: mov ecx, r8d
0x1007ec065: and ecx, 0xfffffffc
0x1007ec068: cmp byte ptr [rip + 0x185d3c9], 0 ; 0x102049438
0x1007ec06f: lea r14, [rsi + rcx*4 + 0x10]
0x1007ec074: lea r9, [rcx + 4]
0x1007ec078: je 0x1007ec17e
0x1007ec07e: mov ebx, r8d
0x1007ec081: shr ebx, 2
0x1007ec084: inc ebx
0x1007ec086: and ebx, 3
0x1007ec089: je 0x1007ec224
0x1007ec08f: neg ebx
0x1007ec091: mov rcx, rdi
0x1007ec094: nop word ptr cs:[rax + rax]
0x1007ec0a0: vmovups xmm0, xmmword ptr [rsi]
0x1007ec0a4: vcvtps2ph qword ptr [rcx], xmm0, 0
0x1007ec0aa: add rcx, 8
0x1007ec0ae: add rsi, 0x10
0x1007ec0b2: add edx, -4
0x1007ec0b5: inc ebx
0x1007ec0b7: jne 0x1007ec0a0
0x1007ec0b9: cmp r8d, 0xc
0x1007ec0bd: jae 0x1007ec230
0x1007ec0c3: jmp 0x1007ec26e ; 0x1007ec26e
0x1007ec0c8: mov r14, rsi
0x1007ec0cb: test edx, edx
0x1007ec0cd: je 0x1007ec281
0x1007ec0d3: test dl, 1
0x1007ec0d6: jne 0x1007ec0e4
0x1007ec0d8: mov esi, edx
0x1007ec0da: cmp edx, 1
0x1007ec0dd: jne 0x1007ec121
0x1007ec0df: jmp 0x1007ec281 ; 0x1007ec281
0x1007ec0e4: mov eax, dword ptr [r14]
0x1007ec0e7: add r14, 4
0x1007ec0eb: mov ecx, eax
0x1007ec0ed: shr ecx, 0x17
0x1007ec0f0: mov rsi, qword ptr [rip + 0x4217b1] ; 0x100c0d8a8
0x1007ec0f7: movzx esi, word ptr [rsi + rcx*2]
0x1007ec0fb: and eax, 0x7fffff
0x1007ec100: mov rbx, qword ptr [rip + 0x4217a9] ; 0x100c0d8b0
0x1007ec107: mov cl, byte ptr [rbx + rcx]
0x1007ec10a: shr eax, cl
0x1007ec10c: add eax, esi
0x1007ec10e: mov word ptr [rdi], ax
0x1007ec111: lea rdi, [rdi + 2]
0x1007ec115: lea esi, [rdx - 1]
0x1007ec118: cmp edx, 1
0x1007ec11b: je 0x1007ec281
0x1007ec121: mov r8, qword ptr [rip + 0x421780] ; 0x100c0d8a8
0x1007ec128: mov rbx, qword ptr [rip + 0x421781] ; 0x100c0d8b0
0x1007ec12f: nop 
0x1007ec130: mov eax, dword ptr [r14]
0x1007ec133: mov ecx, eax
0x1007ec135: shr ecx, 0x17
0x1007ec138: movzx edx, word ptr [r8 + rcx*2]
0x1007ec13d: and eax, 0x7fffff
0x1007ec142: movzx ecx, byte ptr [rbx + rcx]
0x1007ec146: shr eax, cl
0x1007ec148: add eax, edx
0x1007ec14a: mov word ptr [rdi], ax
0x1007ec14d: mov eax, dword ptr [r14 + 4]
0x1007ec151: mov ecx, eax
0x1007ec153: shr ecx, 0x17
0x1007ec156: movzx edx, word ptr [r8 + rcx*2]
0x1007ec15b: and eax, 0x7fffff
0x1007ec160: movzx ecx, byte ptr [rbx + rcx]
0x1007ec164: shr eax, cl
0x1007ec166: add eax, edx
0x1007ec168: mov word ptr [rdi + 2], ax
0x1007ec16c: add r14, 8
0x1007ec170: add rdi, 4
0x1007ec174: add esi, -2
0x1007ec177: jne 0x1007ec130
0x1007ec179: jmp 0x1007ec281 ; 0x1007ec281
0x1007ec17e: mov r10, qword ptr [rip + 0x421723] ; 0x100c0d8a8
0x1007ec185: mov r11, qword ptr [rip + 0x421724] ; 0x100c0d8b0
0x1007ec18c: mov rbx, rdi
0x1007ec18f: nop 
0x1007ec190: mov eax, dword ptr [rsi]
0x1007ec192: mov ecx, eax
0x1007ec194: shr ecx, 0x17
0x1007ec197: movzx r15d, word ptr [r10 + rcx*2]
0x1007ec19c: and eax, 0x7fffff
0x1007ec1a1: movzx ecx, byte ptr [r11 + rcx]
0x1007ec1a6: shr eax, cl
0x1007ec1a8: add eax, r15d
0x1007ec1ab: mov word ptr [rbx], ax
0x1007ec1ae: mov eax, dword ptr [rsi + 4]
0x1007ec1b1: mov ecx, eax
0x1007ec1b3: shr ecx, 0x17
0x1007ec1b6: movzx r15d, word ptr [r10 + rcx*2]
0x1007ec1bb: and eax, 0x7fffff
0x1007ec1c0: movzx ecx, byte ptr [r11 + rcx]
0x1007ec1c5: shr eax, cl
0x1007ec1c7: add eax, r15d
0x1007ec1ca: mov word ptr [rbx + 2], ax
0x1007ec1ce: mov eax, dword ptr [rsi + 8]
0x1007ec1d1: mov ecx, eax
0x1007ec1d3: shr ecx, 0x17
0x1007ec1d6: movzx r15d, word ptr [r10 + rcx*2]
0x1007ec1db: and eax, 0x7fffff
0x1007ec1e0: movzx ecx, byte ptr [r11 + rcx]
0x1007ec1e5: shr eax, cl
0x1007ec1e7: add eax, r15d
0x1007ec1ea: mov word ptr [rbx + 4], ax
0x1007ec1ee: mov eax, dword ptr [rsi + 0xc]
0x1007ec1f1: mov ecx, eax
0x1007ec1f3: shr ecx, 0x17
0x1007ec1f6: movzx r15d, word ptr [r10 + rcx*2]
0x1007ec1fb: and eax, 0x7fffff
0x1007ec200: movzx ecx, byte ptr [r11 + rcx]
0x1007ec205: shr eax, cl
0x1007ec207: add eax, r15d
0x1007ec20a: mov word ptr [rbx + 6], ax
0x1007ec20e: add edx, -4
0x1007ec211: add rsi, 0x10
0x1007ec215: add rbx, 8
0x1007ec219: cmp edx, 3
0x1007ec21c: ja 0x1007ec190
0x1007ec222: jmp 0x1007ec26e ; 0x1007ec26e
0x1007ec224: mov rcx, rdi
0x1007ec227: cmp r8d, 0xc
0x1007ec22b: jb 0x1007ec26e
0x1007ec22d: nop dword ptr [rax]
0x1007ec230: vmovups xmm0, xmmword ptr [rsi]
0x1007ec234: vcvtps2ph qword ptr [rcx], xmm0, 0
0x1007ec23a: vmovups xmm0, xmmword ptr [rsi + 0x10]
0x1007ec23f: vcvtps2ph qword ptr [rcx + 8], xmm0, 0
0x1007ec246: vmovups xmm0, xmmword ptr [rsi + 0x20]
0x1007ec24b: vcvtps2ph qword ptr [rcx + 0x10], xmm0, 0
0x1007ec252: vmovups xmm0, xmmword ptr [rsi + 0x30]
0x1007ec257: vcvtps2ph qword ptr [rcx + 0x18], xmm0, 0
0x1007ec25e: add edx, -0x10
0x1007ec261: add rsi, 0x40
0x1007ec265: add rcx, 0x20
0x1007ec269: cmp edx, 3
0x1007ec26c: ja 0x1007ec230
0x1007ec26e: lea rdi, [rdi + r9*2]
0x1007ec272: and r8d, 3
0x1007ec276: mov edx, r8d
0x1007ec279: test edx, edx
0x1007ec27b: jne 0x1007ec0d3
0x1007ec281: pop rbx
0x1007ec282: pop r14
0x1007ec284: pop r15
0x1007ec286: pop rbp
0x1007ec287: ret 
0x1007ec288: nop dword ptr [rax + rax]
