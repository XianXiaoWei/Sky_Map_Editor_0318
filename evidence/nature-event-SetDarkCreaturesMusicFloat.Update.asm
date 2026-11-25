0x1002744a0: push rbp
0x1002744a1: mov rbp, rsp
0x1002744a4: push r15
0x1002744a6: push r14
0x1002744a8: push r13
0x1002744aa: push r12
0x1002744ac: push rbx
0x1002744ad: sub rsp, 0x38
0x1002744b1: mov r13, rdi
0x1002744b4: mov rax, qword ptr [rsi + 0x160]
0x1002744bb: mov rdi, qword ptr [rsi + 0x280]
0x1002744c2: vmovss xmm0, dword ptr [rax + 0x14]
0x1002744c7: vmovss dword ptr [rbp - 0x38], xmm0
0x1002744cc: lea rcx, [rip + 0x1d86bfd] ; 0x101ffb0d0
0x1002744d3: cmp byte ptr [rcx], 0
0x1002744d6: je 0x1002744e5
0x1002744d8: lea rcx, [rip + 0xa44061] ; 0x100cb8540
0x1002744df: vmovss xmm0, dword ptr [rcx]
0x1002744e3: jmp 0x1002744ed ; 0x1002744ed
0x1002744e5: vmovss xmm0, dword ptr [rip + 0x830bd3] ; 0x100aa50c0
0x1002744ed: vmulss xmm0, xmm0, dword ptr [rax + 0x20]
0x1002744f2: vmovss dword ptr [rbp - 0x34], xmm0
0x1002744f7: mov ebx, dword ptr [r13 + 0x50]
0x1002744fb: call 0x1000fc260 ; 0x1000fc260
0x100274500: mov rcx, qword ptr [r13 + 0x40]
0x100274504: mov r14d, dword ptr [rcx + 0x10]
0x100274508: test r14, r14
0x10027450b: je 0x10027460f
0x100274511: mov dword ptr [rbp - 0x30], ebx
0x100274514: mov edx, dword ptr [rax + 0xe0]
0x10027451a: mov dword ptr [rbp - 0x3c], edx
0x10027451d: mov rax, qword ptr [rax + 0x18]
0x100274521: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x100274526: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x10027452b: vmovss xmm0, dword ptr [rip + 0x833385] ; 0x100aa78b8
0x100274533: vmovss dword ptr [rbp - 0x2c], xmm0
0x100274538: xor r12d, r12d
0x10027453b: lea r15, [rbp - 0x50]
0x10027453f: nop 
0x100274540: mov rax, qword ptr [rcx + 8]
0x100274544: mov rax, qword ptr [rax + r12*8]
0x100274548: mov qword ptr [rbp - 0x50], rax
0x10027454c: call 0x1007abc10 ; 0x1007abc10
0x100274551: mov qword ptr [rbp - 0x48], 0
0x100274559: mov rdi, qword ptr [rip + 0x1b73140] ; 0x101de76a0
0x100274560: mov rbx, qword ptr [rdi]
0x100274563: lea rsi, [rbp - 0x48]
0x100274567: mov rdx, r15
0x10027456a: mov rcx, rax
0x10027456d: call qword ptr [rbx + 0x40]
0x100274570: mov rax, qword ptr [rbp - 0x48]
0x100274574: test rax, rax
0x100274577: je 0x100274712
0x10027457d: cmp byte ptr [rax + 0x2c7], 1
0x100274584: jne 0x100274595
0x100274586: mov ecx, dword ptr [rbp - 0x3c]
0x100274589: cmp dword ptr [rax + 0x2c8], ecx
0x10027458f: je 0x10027461e
0x100274595: cmp byte ptr [rax + 0x2c5], 0
0x10027459c: je 0x1002745c0
0x10027459e: inc r12
0x1002745a1: cmp r12, r14
0x1002745a4: jae 0x10027460a
0x1002745a6: mov rcx, qword ptr [r13 + 0x40]
0x1002745aa: mov eax, dword ptr [rcx + 0x10]
0x1002745ad: cmp r12, rax
0x1002745b0: jb 0x100274540
0x1002745b2: jmp 0x100274731 ; 0x100274731
0x1002745b7: nop word ptr [rax + rax]
0x1002745c0: cmp byte ptr [rax + 0x1d4], 0
0x1002745c7: je 0x10027459e
0x1002745c9: cmp dword ptr [rax + 0x2e0], 3
0x1002745d0: je 0x10027459e
0x1002745d2: vmovaps xmm0, xmmword ptr [rbp - 0x60]
0x1002745d7: vsubps xmm0, xmm0, xmmword ptr [rax + 0x60]
0x1002745dc: vmulps xmm0, xmm0, xmm0
0x1002745e0: vmovshdup xmm1, xmm0
0x1002745e4: vaddss xmm1, xmm0, xmm1
0x1002745e8: vpermilpd xmm0, xmm0, 1
0x1002745ee: vaddss xmm0, xmm0, xmm1
0x1002745f2: vmovss xmm1, dword ptr [rbp - 0x2c]
0x1002745f7: vucomiss xmm1, xmm0
0x1002745fb: jbe 0x10027459e
0x1002745fd: vmovss dword ptr [rbp - 0x2c], xmm0
0x100274602: inc r12
0x100274605: cmp r12, r14
0x100274608: jb 0x1002745a6
0x10027460a: mov ebx, dword ptr [rbp - 0x30]
0x10027460d: jmp 0x100274622 ; 0x100274622
0x10027460f: vmovss xmm0, dword ptr [rip + 0x8332a1] ; 0x100aa78b8
0x100274617: vmovss dword ptr [rbp - 0x2c], xmm0
0x10027461c: jmp 0x100274622 ; 0x100274622
0x10027461e: mov ebx, dword ptr [r13 + 0x48]
0x100274622: vmovss xmm0, dword ptr [rbp - 0x34]
0x100274627: vmulss xmm0, xmm0, dword ptr [rbp - 0x38]
0x10027462c: vmovss xmm1, dword ptr [rip + 0x832468] ; 0x100aa6a9c
0x100274634: vmaxss xmm0, xmm1, xmm0
0x100274638: vmovss xmm1, dword ptr [rip + 0x832460] ; 0x100aa6aa0
0x100274640: vminss xmm0, xmm1, xmm0
0x100274644: vmovd xmm1, ebx
0x100274648: vmovss xmm2, dword ptr [r13 + 0x48]
0x10027464e: vucomiss xmm2, xmm1
0x100274652: jbe 0x1002746b9
0x100274654: vmovss xmm2, dword ptr [r13 + 0x54]
0x10027465a: vmovss xmm1, dword ptr [r13 + 0x58]
0x100274660: vsubss xmm3, xmm1, xmm2
0x100274664: vucomiss xmm3, dword ptr [rip + 0x833258] ; 0x100aa78c4
0x10027466c: vmovss xmm1, dword ptr [rip + 0x830a4c] ; 0x100aa50c0
0x100274674: ja 0x100274688
0x100274676: vmovss xmm4, dword ptr [rip + 0x834f52] ; 0x100aa95d0
0x10027467e: vucomiss xmm4, xmm3
0x100274682: vmovaps xmm4, xmm1
0x100274686: jbe 0x100274695
0x100274688: vmovss xmm4, dword ptr [rbp - 0x2c]
0x10027468d: vsubss xmm2, xmm4, xmm2
0x100274691: vdivss xmm4, xmm2, xmm3
0x100274695: vxorps xmm2, xmm2, xmm2
0x100274699: vmaxss xmm2, xmm2, xmm4
0x10027469d: vminss xmm2, xmm1, xmm2
0x1002746a1: vsubss xmm1, xmm1, xmm2
0x1002746a5: vmulss xmm1, xmm1, dword ptr [r13 + 0x4c]
0x1002746ab: vmulss xmm2, xmm2, dword ptr [r13 + 0x50]
0x1002746b1: vaddss xmm1, xmm2, xmm1
0x1002746b5: vmovd ebx, xmm1
0x1002746b9: vmulss xmm0, xmm0, dword ptr [rip + 0x835dcb] ; 0x100aaa48c
0x1002746c1: call 0x100aa2708 ; 0x100aa2708 _expf
0x1002746c6: vmovss xmm1, dword ptr [rip + 0x8309f2] ; 0x100aa50c0
0x1002746ce: vsubss xmm0, xmm1, xmm0
0x1002746d2: vxorps xmm2, xmm2, xmm2
0x1002746d6: vmaxss xmm0, xmm2, xmm0
0x1002746da: vminss xmm0, xmm1, xmm0
0x1002746de: vsubss xmm1, xmm1, xmm0
0x1002746e2: vmulss xmm1, xmm1, dword ptr [r13 + 0x5c]
0x1002746e8: vmovd xmm2, ebx
0x1002746ec: vmulss xmm0, xmm0, xmm2
0x1002746f0: vaddss xmm0, xmm0, xmm1
0x1002746f4: vmovss dword ptr [r13 + 0x5c], xmm0
0x1002746fa: mov rax, qword ptr [r13 + 0x38]
0x1002746fe: vmovss dword ptr [rax + 0x10], xmm0
0x100274703: add rsp, 0x38
0x100274707: pop rbx
0x100274708: pop r12
0x10027470a: pop r13
0x10027470c: pop r14
0x10027470e: pop r15
0x100274710: pop rbp
0x100274711: ret 
0x100274712: lea rdi, [rip + 0x8ed3df] ; 0x100b61af8 ret
0x100274719: lea rsi, [rip + 0x8ed243] ; 0x100b61963 ./Clump.h
0x100274720: mov edx, 0x47
0x100274725: mov ecx, 3
0x10027472a: call 0x1007e5f70 ; 0x1007e5f70
0x10027472f: ud2 
0x100274731: lea rdi, [rip + 0x8ed220] ; 0x100b61958 idx < size
0x100274738: lea rsi, [rip + 0x8ed224] ; 0x100b61963 ./Clump.h
0x10027473f: mov edx, 0x36
0x100274744: mov ecx, 3
0x100274749: call 0x1007e5f70 ; 0x1007e5f70
0x10027474e: ud2 
