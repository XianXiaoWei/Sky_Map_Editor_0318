0x1006c22e0: push rbp
0x1006c22e1: mov rbp, rsp
0x1006c22e4: push r15
0x1006c22e6: push r14
0x1006c22e8: push r13
0x1006c22ea: push r12
0x1006c22ec: push rbx
0x1006c22ed: sub rsp, 0x48
0x1006c22f1: mov qword ptr [rbp - 0x58], rcx
0x1006c22f5: vmovss dword ptr [rbp - 0x30], xmm0
0x1006c22fa: mov r12, rdx
0x1006c22fd: mov r15, rsi
0x1006c2300: mov r13, rdi
0x1006c2303: mov al, byte ptr [r15]
0x1006c2306: vxorps xmm0, xmm0, xmm0
0x1006c230a: test al, al
0x1006c230c: je 0x1006c23c7
0x1006c2312: vmovss dword ptr [rbp - 0x2c], xmm0
0x1006c2317: xor ebx, ebx
0x1006c2319: mov rcx, r15
0x1006c231c: nop dword ptr [rax]
0x1006c2320: vxorps xmm1, xmm1, xmm1
0x1006c2324: nop word ptr cs:[rax + rax]
0x1006c2330: mov r14, rcx
0x1006c2333: mov rcx, qword ptr [r13]
0x1006c2337: test rcx, rcx
0x1006c233a: vmovss dword ptr [rbp - 0x50], xmm1
0x1006c233f: je 0x1006c2350
0x1006c2341: mov rdi, qword ptr [rcx + 0x10]
0x1006c2345: jmp 0x1006c2352 ; 0x1006c2352
0x1006c2347: nop word ptr [rax + rax]
0x1006c2350: xor edi, edi
0x1006c2352: movsx esi, al
0x1006c2355: call 0x100362930 ; 0x100362930
0x1006c235a: vmovss xmm1, dword ptr [rbp - 0x50]
0x1006c235f: vaddss xmm1, xmm1, dword ptr [rax + 0x1c]
0x1006c2364: test rbx, rbx
0x1006c2367: je 0x1006c2397
0x1006c2369: mov rax, qword ptr [r13]
0x1006c236d: test rax, rax
0x1006c2370: vmovss dword ptr [rbp - 0x50], xmm1
0x1006c2375: je 0x1006c2380
0x1006c2377: mov rdi, qword ptr [rax + 0x10]
0x1006c237b: jmp 0x1006c2382 ; 0x1006c2382
0x1006c237d: nop dword ptr [rax]
0x1006c2380: xor edi, edi
0x1006c2382: movsx esi, byte ptr [rbx]
0x1006c2385: movsx edx, byte ptr [r14]
0x1006c2389: call 0x100362990 ; 0x100362990
0x1006c238e: vmovss xmm1, dword ptr [rbp - 0x50]
0x1006c2393: vaddss xmm1, xmm1, xmm0
0x1006c2397: lea rcx, [r14 + 1]
0x1006c239b: movzx eax, byte ptr [r14 + 1]
0x1006c23a0: cmp al, 0xa
0x1006c23a2: je 0x1006c23ab
0x1006c23a4: mov rbx, r14
0x1006c23a7: test al, al
0x1006c23a9: jne 0x1006c2330
0x1006c23ab: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1006c23b0: vmaxss xmm0, xmm1, xmm0
0x1006c23b4: vmovss dword ptr [rbp - 0x2c], xmm0
0x1006c23b9: lea rbx, [rcx - 1]
0x1006c23bd: test al, al
0x1006c23bf: jne 0x1006c2320
0x1006c23c5: jmp 0x1006c23cc ; 0x1006c23cc
0x1006c23c7: vmovss dword ptr [rbp - 0x2c], xmm0
0x1006c23cc: vmovss xmm0, dword ptr [rbp - 0x30]
0x1006c23d1: vmulss xmm0, xmm0, dword ptr [r13 + 0x20]
0x1006c23d7: vmovss xmm1, dword ptr [rip + 0x3f60b9] ; 0x100ab8498
0x1006c23df: vmaxss xmm0, xmm1, xmm0
0x1006c23e3: mov rax, qword ptr [r13]
0x1006c23e7: test rax, rax
0x1006c23ea: je 0x1006c23f2
0x1006c23ec: mov rdi, qword ptr [rax + 0x10]
0x1006c23f0: jmp 0x1006c23f4 ; 0x1006c23f4
0x1006c23f2: xor edi, edi
0x1006c23f4: vmovss dword ptr [rbp - 0x34], xmm0
0x1006c23f9: vmulss xmm0, xmm0, dword ptr [rbp - 0x2c]
0x1006c23fe: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x1006c2403: call 0x100362740 ; 0x100362740
0x1006c2408: vmulss xmm1, xmm0, dword ptr [rbp - 0x34]
0x1006c240d: vmovaps xmm0, xmm1
0x1006c2411: mov rax, r15
0x1006c2414: mov cl, byte ptr [rax]
0x1006c2416: cmp cl, 0xa
0x1006c2419: jne 0x1006c242a
0x1006c241b: jmp 0x1006c2430 ; 0x1006c2430
0x1006c241d: nop dword ptr [rax]
0x1006c2420: inc rax
0x1006c2423: mov cl, byte ptr [rax]
0x1006c2425: cmp cl, 0xa
0x1006c2428: je 0x1006c2430
0x1006c242a: test cl, cl
0x1006c242c: jne 0x1006c2420
0x1006c242e: jmp 0x1006c2436 ; 0x1006c2436
0x1006c2430: vaddss xmm0, xmm1, xmm0
0x1006c2434: jmp 0x1006c2420 ; 0x1006c2420
0x1006c2436: vmulss xmm0, xmm0, dword ptr [rip + 0x3e61e2] ; 0x100aa8620
0x1006c243e: vmovaps xmm1, xmmword ptr [rbp - 0x50]
0x1006c2443: vinsertps xmm0, xmm1, xmm0, 0x1c
0x1006c2449: vmovaps xmm1, xmmword ptr [r12]
0x1006c244f: vsubps xmm0, xmm1, xmm0
0x1006c2453: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1006c2458: lea rdx, [rbp - 0x70]
0x1006c245c: mov rdi, r13
0x1006c245f: mov rsi, r15
0x1006c2462: vmovss xmm0, dword ptr [rbp - 0x30]
0x1006c2467: mov rcx, qword ptr [rbp - 0x58]
0x1006c246b: call 0x1006c1bb0 ; 0x1006c1bb0
0x1006c2470: add rsp, 0x48
0x1006c2474: pop rbx
0x1006c2475: pop r12
0x1006c2477: pop r13
0x1006c2479: pop r14
0x1006c247b: pop r15
0x1006c247d: pop rbp
0x1006c247e: ret 
0x1006c247f: nop 
