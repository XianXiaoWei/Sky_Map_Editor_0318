0x1007b9820: push rbp
0x1007b9821: mov rbp, rsp
0x1007b9824: mov ecx, dword ptr [rdi + 0x18]
0x1007b9827: test rcx, rcx
0x1007b982a: je 0x1007b98a2
0x1007b982c: mov r8d, ecx
0x1007b982f: and r8d, 1
0x1007b9833: cmp ecx, 1
0x1007b9836: jne 0x1007b9841
0x1007b9838: xor edx, edx
0x1007b983a: test r8, r8
0x1007b983d: jne 0x1007b9891
0x1007b983f: jmp 0x1007b98a2 ; 0x1007b98a2
0x1007b9841: sub rcx, r8
0x1007b9844: xor edx, edx
0x1007b9846: jmp 0x1007b9870 ; 0x1007b9870
0x1007b9848: nop dword ptr [rax + rax]
0x1007b9850: mov qword ptr [rax + rdx*8], 0
0x1007b9858: mov rax, qword ptr [rdi]
0x1007b985b: cmp qword ptr [rax + rdx*8 + 8], rsi
0x1007b9860: jne 0x1007b9883
0x1007b9862: mov qword ptr [rax + rdx*8 + 8], 0
0x1007b986b: jmp 0x1007b9883 ; 0x1007b9883
0x1007b986d: nop dword ptr [rax]
0x1007b9870: mov rax, qword ptr [rdi]
0x1007b9873: cmp qword ptr [rax + rdx*8], rsi
0x1007b9877: je 0x1007b9850
0x1007b9879: mov rax, qword ptr [rdi]
0x1007b987c: cmp qword ptr [rax + rdx*8 + 8], rsi
0x1007b9881: je 0x1007b9862
0x1007b9883: add rdx, 2
0x1007b9887: cmp rcx, rdx
0x1007b988a: jne 0x1007b9870
0x1007b988c: test r8, r8
0x1007b988f: je 0x1007b98a2
0x1007b9891: mov rax, qword ptr [rdi]
0x1007b9894: cmp qword ptr [rax + rdx*8], rsi
0x1007b9898: jne 0x1007b98a2
0x1007b989a: mov qword ptr [rax + rdx*8], 0
0x1007b98a2: mov r9, qword ptr [rdi + 0x10]
0x1007b98a6: mov eax, dword ptr [rdi + 8]
0x1007b98a9: lea r8, [r9 + rax*8]
0x1007b98ad: mov rcx, r9
0x1007b98b0: test rax, rax
0x1007b98b3: je 0x1007b98d4
0x1007b98b5: lea rdx, [rax*8]
0x1007b98bd: mov rcx, r9
0x1007b98c0: cmp qword ptr [rcx], rsi
0x1007b98c3: je 0x1007b98d4
0x1007b98c5: add rcx, 8
0x1007b98c9: add rdx, -8
0x1007b98cd: jne 0x1007b98c0
0x1007b98cf: jmp 0x1007b997f ; 0x1007b997f
0x1007b98d4: cmp rcx, r8
0x1007b98d7: je 0x1007b997f
0x1007b98dd: lea rdx, [rcx + 8]
0x1007b98e1: cmp rdx, r8
0x1007b98e4: je 0x1007b997c
0x1007b98ea: lea r9, [r9 + rax*8 - 0x10]
0x1007b98ef: sub r9, rcx
0x1007b98f2: mov eax, r9d
0x1007b98f5: shr eax, 3
0x1007b98f8: inc eax
0x1007b98fa: and rax, 3
0x1007b98fe: je 0x1007b9928
0x1007b9900: neg rax
0x1007b9903: nop word ptr cs:[rax + rax]
0x1007b9910: mov r10, qword ptr [rdx]
0x1007b9913: cmp r10, rsi
0x1007b9916: je 0x1007b991f
0x1007b9918: mov qword ptr [rcx], r10
0x1007b991b: add rcx, 8
0x1007b991f: add rdx, 8
0x1007b9923: inc rax
0x1007b9926: jne 0x1007b9910
0x1007b9928: cmp r9, 0x18
0x1007b992c: jb 0x1007b9978
0x1007b992e: nop 
0x1007b9930: mov rax, qword ptr [rdx]
0x1007b9933: cmp rax, rsi
0x1007b9936: je 0x1007b993f
0x1007b9938: mov qword ptr [rcx], rax
0x1007b993b: add rcx, 8
0x1007b993f: mov rax, qword ptr [rdx + 8]
0x1007b9943: cmp rax, rsi
0x1007b9946: je 0x1007b994f
0x1007b9948: mov qword ptr [rcx], rax
0x1007b994b: add rcx, 8
0x1007b994f: mov rax, qword ptr [rdx + 0x10]
0x1007b9953: cmp rax, rsi
0x1007b9956: je 0x1007b995f
0x1007b9958: mov qword ptr [rcx], rax
0x1007b995b: add rcx, 8
0x1007b995f: mov rax, qword ptr [rdx + 0x18]
0x1007b9963: cmp rax, rsi
0x1007b9966: je 0x1007b996f
0x1007b9968: mov qword ptr [rcx], rax
0x1007b996b: add rcx, 8
0x1007b996f: add rdx, 0x20
0x1007b9973: cmp rdx, r8
0x1007b9976: jne 0x1007b9930
0x1007b9978: mov r9, qword ptr [rdi + 0x10]
0x1007b997c: mov r8, rcx
0x1007b997f: sub r8, r9
0x1007b9982: shr r8, 3
0x1007b9986: mov dword ptr [rdi + 8], r8d
0x1007b998a: pop rbp
0x1007b998b: ret 
0x1007b998c: nop dword ptr [rax]

