0x1001b2580: push rbp
0x1001b2581: mov rbp, rsp
0x1001b2584: push r15
0x1001b2586: push r14
0x1001b2588: push rbx
0x1001b2589: push rax
0x1001b258a: mov r14, rsi
0x1001b258d: call 0x1007abc10 ; 0x1007abc10
0x1001b2592: mov eax, dword ptr [rax + 0x38]
0x1001b2595: mov dword ptr [r14], eax
0x1001b2598: call 0x1007b0280 ; 0x1007b0280
0x1001b259d: mov rax, qword ptr [rip + 0x1c28d1c] ; 0x101ddb2c0
0x1001b25a4: mov eax, dword ptr [rax + 0x38]
0x1001b25a7: mov dword ptr [r14], eax
0x1001b25aa: lea rbx, [r14 + 0x10]
0x1001b25ae: lea r15, [r14 + 0x12010]
0x1001b25b5: nop word ptr cs:[rax + rax]
0x1001b25c0: call 0x1007abc10 ; 0x1007abc10
0x1001b25c5: mov rax, qword ptr [rip + 0x1c28834] ; 0x101ddae00
0x1001b25cc: mov eax, dword ptr [rax + 0x38]
0x1001b25cf: mov dword ptr [rbx], eax
0x1001b25d1: mov dword ptr [rbx + 0x50], 0
0x1001b25d8: mov dword ptr [rbx + 0x78], 0
0x1001b25df: mov byte ptr [rbx + 0x7c], 0
0x1001b25e3: vxorps xmm0, xmm0, xmm0
0x1001b25e7: vmovaps xmmword ptr [rbx + 0x80], xmm0
0x1001b25ef: mov word ptr [rbx + 0x90], 0
0x1001b25f8: mov dword ptr [rbx + 0x94], 0x3dcccccd
0x1001b2602: mov byte ptr [rbx + 0x98], 1
0x1001b2609: mov qword ptr [rbx + 0x100], 0
0x1001b2614: vmovss xmm0, dword ptr [rip + 0x8f2aa4] ; 0x100aa50c0
0x1001b261c: vmovaps xmmword ptr [rbx + 0x10], xmm0
0x1001b2621: vmovaps xmm0, xmmword ptr [rip + 0x8f5a77] ; 0x100aa80a0
0x1001b2629: vmovaps xmmword ptr [rbx + 0x20], xmm0
0x1001b262e: vmovaps xmm0, xmmword ptr [rip + 0x8f63fa] ; 0x100aa8a30
0x1001b2636: vmovaps xmmword ptr [rbx + 0x30], xmm0
0x1001b263b: vmovaps xmm0, xmmword ptr [rip + 0x8f63bd] ; 0x100aa8a00
0x1001b2643: vmovaps xmmword ptr [rbx + 0x40], xmm0
0x1001b2648: mov dword ptr [rbx + 0x68], 0xffffffff
0x1001b264f: mov byte ptr [rbx + 0xa1], 0
0x1001b2656: add rbx, 0x120
0x1001b265d: cmp rbx, r15
0x1001b2660: jne 0x1001b25c0
0x1001b2666: mov rax, r14
0x1001b2669: add rsp, 8
0x1001b266d: pop rbx
0x1001b266e: pop r14
0x1001b2670: pop r15
0x1001b2672: pop rbp
0x1001b2673: ret 
0x1001b2674: nop word ptr cs:[rax + rax]
