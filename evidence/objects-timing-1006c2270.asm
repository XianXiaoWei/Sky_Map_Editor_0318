0x1006c2270: push rbp
0x1006c2271: mov rbp, rsp
0x1006c2274: push rbx
0x1006c2275: push rax
0x1006c2276: mov rbx, rsi
0x1006c2279: vmulss xmm0, xmm0, dword ptr [rdi + 0x20]
0x1006c227e: vmovss xmm1, dword ptr [rip + 0x3f6212] ; 0x100ab8498
0x1006c2286: vmaxss xmm0, xmm1, xmm0
0x1006c228a: vmovss dword ptr [rbp - 0xc], xmm0
0x1006c228f: mov rax, qword ptr [rdi]
0x1006c2292: test rax, rax
0x1006c2295: je 0x1006c229d
0x1006c2297: mov rdi, qword ptr [rax + 0x10]
0x1006c229b: jmp 0x1006c229f ; 0x1006c229f
0x1006c229d: xor edi, edi
0x1006c229f: call 0x100362740 ; 0x100362740
0x1006c22a4: vmulss xmm1, xmm0, dword ptr [rbp - 0xc]
0x1006c22a9: vmovaps xmm0, xmm1
0x1006c22ad: mov al, byte ptr [rbx]
0x1006c22af: cmp al, 0xa
0x1006c22b1: jne 0x1006c22c9
0x1006c22b3: jmp 0x1006c22d0 ; 0x1006c22d0
0x1006c22b5: nop word ptr cs:[rax + rax]
0x1006c22c0: inc rbx
0x1006c22c3: mov al, byte ptr [rbx]
0x1006c22c5: cmp al, 0xa
0x1006c22c7: je 0x1006c22d0
0x1006c22c9: test al, al
0x1006c22cb: jne 0x1006c22c0
0x1006c22cd: jmp 0x1006c22d6 ; 0x1006c22d6
0x1006c22cf: nop 
0x1006c22d0: vaddss xmm0, xmm1, xmm0
0x1006c22d4: jmp 0x1006c22c0 ; 0x1006c22c0
0x1006c22d6: add rsp, 8
0x1006c22da: pop rbx
0x1006c22db: pop rbp
0x1006c22dc: ret 
0x1006c22dd: nop dword ptr [rax]
