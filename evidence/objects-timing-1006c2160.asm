0x1006c2160: push rbp
0x1006c2161: mov rbp, rsp
0x1006c2164: push r15
0x1006c2166: push r14
0x1006c2168: push rbx
0x1006c2169: sub rsp, 0x18
0x1006c216d: vmovss dword ptr [rbp - 0x24], xmm0
0x1006c2172: mov r14, rdi
0x1006c2175: mov al, byte ptr [rsi]
0x1006c2177: vxorps xmm0, xmm0, xmm0
0x1006c217b: test al, al
0x1006c217d: je 0x1006c2236
0x1006c2183: vmovss dword ptr [rbp - 0x1c], xmm0
0x1006c2188: xor r15d, r15d
0x1006c218b: nop dword ptr [rax + rax]
0x1006c2190: vxorps xmm1, xmm1, xmm1
0x1006c2194: nop word ptr cs:[rax + rax]
0x1006c21a0: mov rbx, rsi
0x1006c21a3: mov rcx, qword ptr [r14]
0x1006c21a6: test rcx, rcx
0x1006c21a9: vmovss dword ptr [rbp - 0x20], xmm1
0x1006c21ae: je 0x1006c21c0
0x1006c21b0: mov rdi, qword ptr [rcx + 0x10]
0x1006c21b4: jmp 0x1006c21c2 ; 0x1006c21c2
0x1006c21b6: nop word ptr cs:[rax + rax]
0x1006c21c0: xor edi, edi
0x1006c21c2: movsx esi, al
0x1006c21c5: call 0x100362930 ; 0x100362930
0x1006c21ca: vmovss xmm1, dword ptr [rbp - 0x20]
0x1006c21cf: vaddss xmm1, xmm1, dword ptr [rax + 0x1c]
0x1006c21d4: test r15, r15
0x1006c21d7: je 0x1006c2207
0x1006c21d9: mov rax, qword ptr [r14]
0x1006c21dc: test rax, rax
0x1006c21df: vmovss dword ptr [rbp - 0x20], xmm1
0x1006c21e4: je 0x1006c21f0
0x1006c21e6: mov rdi, qword ptr [rax + 0x10]
0x1006c21ea: jmp 0x1006c21f2 ; 0x1006c21f2
0x1006c21ec: nop dword ptr [rax]
0x1006c21f0: xor edi, edi
0x1006c21f2: movsx esi, byte ptr [r15]
0x1006c21f6: movsx edx, byte ptr [rbx]
0x1006c21f9: call 0x100362990 ; 0x100362990
0x1006c21fe: vmovss xmm1, dword ptr [rbp - 0x20]
0x1006c2203: vaddss xmm1, xmm1, xmm0
0x1006c2207: lea rsi, [rbx + 1]
0x1006c220b: movzx eax, byte ptr [rbx + 1]
0x1006c220f: cmp al, 0xa
0x1006c2211: je 0x1006c221a
0x1006c2213: mov r15, rbx
0x1006c2216: test al, al
0x1006c2218: jne 0x1006c21a0
0x1006c221a: vmovss xmm0, dword ptr [rbp - 0x1c]
0x1006c221f: vmaxss xmm0, xmm1, xmm0
0x1006c2223: vmovss dword ptr [rbp - 0x1c], xmm0
0x1006c2228: lea r15, [rsi - 1]
0x1006c222c: test al, al
0x1006c222e: jne 0x1006c2190
0x1006c2234: jmp 0x1006c223b ; 0x1006c223b
0x1006c2236: vmovss dword ptr [rbp - 0x1c], xmm0
0x1006c223b: vmovss xmm0, dword ptr [rbp - 0x24]
0x1006c2240: vmulss xmm0, xmm0, dword ptr [r14 + 0x20]
0x1006c2246: vmovss xmm1, dword ptr [rip + 0x3f624a] ; 0x100ab8498
0x1006c224e: vmaxss xmm0, xmm1, xmm0
0x1006c2252: vmulss xmm0, xmm0, dword ptr [rbp - 0x1c]
0x1006c2257: add rsp, 0x18
0x1006c225b: pop rbx
0x1006c225c: pop r14
0x1006c225e: pop r15
0x1006c2260: pop rbp
0x1006c2261: ret 
0x1006c2262: nop word ptr cs:[rax + rax]
