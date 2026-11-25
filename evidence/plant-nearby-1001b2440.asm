0x1001b2440: push rbp
0x1001b2441: mov rbp, rsp
0x1001b2444: push r15
0x1001b2446: push r14
0x1001b2448: push rbx
0x1001b2449: push rax
0x1001b244a: mov edi, 0x12020
0x1001b244f: call 0x100aa2498 ; 0x100aa2498 __Znwm
0x1001b2454: mov r15, rax
0x1001b2457: call 0x1007abc10 ; 0x1007abc10
0x1001b245c: mov eax, dword ptr [rax + 0x38]
0x1001b245f: mov dword ptr [r15], eax
0x1001b2462: call 0x1007b0280 ; 0x1007b0280
0x1001b2467: mov rax, qword ptr [rip + 0x1c28e52] ; 0x101ddb2c0
0x1001b246e: mov eax, dword ptr [rax + 0x38]
0x1001b2471: mov dword ptr [r15], eax
0x1001b2474: lea rbx, [r15 + 0x10]
0x1001b2478: mov r14, r15
0x1001b247b: add r14, 0x12010
0x1001b2482: nop word ptr cs:[rax + rax]
0x1001b2490: call 0x1007abc10 ; 0x1007abc10
0x1001b2495: mov rax, qword ptr [rip + 0x1c28964] ; 0x101ddae00
0x1001b249c: mov eax, dword ptr [rax + 0x38]
0x1001b249f: mov dword ptr [rbx], eax
0x1001b24a1: mov dword ptr [rbx + 0x50], 0
0x1001b24a8: mov dword ptr [rbx + 0x78], 0
0x1001b24af: mov byte ptr [rbx + 0x7c], 0
0x1001b24b3: vxorps xmm0, xmm0, xmm0
0x1001b24b7: vmovaps xmmword ptr [rbx + 0x80], xmm0
0x1001b24bf: mov word ptr [rbx + 0x90], 0
0x1001b24c8: mov dword ptr [rbx + 0x94], 0x3dcccccd
0x1001b24d2: mov byte ptr [rbx + 0x98], 1
0x1001b24d9: mov qword ptr [rbx + 0x100], 0
0x1001b24e4: vmovss xmm0, dword ptr [rip + 0x8f2bd4] ; 0x100aa50c0
0x1001b24ec: vmovaps xmmword ptr [rbx + 0x10], xmm0
0x1001b24f1: vmovaps xmm0, xmmword ptr [rip + 0x8f5ba7] ; 0x100aa80a0
0x1001b24f9: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x1001b24fe: vmovaps xmm0, xmmword ptr [rip + 0x8f652a] ; 0x100aa8a30
0x1001b2506: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x1001b250b: vmovaps xmm0, xmmword ptr [rip + 0x8f64ed] ; 0x100aa8a00
0x1001b2513: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x1001b2518: mov dword ptr [rbx + 0x68], 0xffffffff
0x1001b251f: mov byte ptr [rbx + 0xa1], 0
0x1001b2526: add rbx, 0x120
0x1001b252d: cmp rbx, r14
0x1001b2530: jne 0x1001b2490
0x1001b2536: mov rax, r15
0x1001b2539: add rsp, 8
0x1001b253d: pop rbx
0x1001b253e: pop r14
0x1001b2540: pop r15
0x1001b2542: pop rbp
0x1001b2543: ret 
0x1001b2544: jmp 0x1001b2546 ; 0x1001b2546
0x1001b2546: mov r14, rax
0x1001b2549: mov rdi, r15
0x1001b254c: call 0x100aa248c ; 0x100aa248c __ZdlPv
0x1001b2551: mov rdi, r14
0x1001b2554: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1001b2559: nop dword ptr [rax]
