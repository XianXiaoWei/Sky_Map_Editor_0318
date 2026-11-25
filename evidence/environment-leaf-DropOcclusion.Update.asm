0x1002ce7b0: push rbp
0x1002ce7b1: mov rbp, rsp
0x1002ce7b4: push r15
0x1002ce7b6: push r14
0x1002ce7b8: push r13
0x1002ce7ba: push r12
0x1002ce7bc: push rbx
0x1002ce7bd: sub rsp, 0x88
0x1002ce7c4: mov r14, rsi
0x1002ce7c7: mov r13, rdi
0x1002ce7ca: mov rax, qword ptr [r13 + 0x38]
0x1002ce7ce: cmp dword ptr [rax + 0x10], 0
0x1002ce7d2: je 0x1002ce9ec
0x1002ce7d8: lea rcx, [r13 + 0x40]
0x1002ce7dc: mov qword ptr [rbp - 0x40], rcx
0x1002ce7e0: lea rcx, [r13 + 0x54]
0x1002ce7e4: mov qword ptr [rbp - 0x38], rcx
0x1002ce7e8: lea rcx, [r13 + 0x68]
0x1002ce7ec: mov qword ptr [rbp - 0x50], rcx
0x1002ce7f0: lea rcx, [r13 + 0x6c]
0x1002ce7f4: mov qword ptr [rbp - 0x48], rcx
0x1002ce7f8: xor r12d, r12d
0x1002ce7fb: nop dword ptr [rax + rax]
0x1002ce800: mov rax, qword ptr [rax + 8]
0x1002ce804: mov r12d, r12d
0x1002ce807: mov rax, qword ptr [rax + r12*8]
0x1002ce80b: mov qword ptr [rbp - 0x58], rax
0x1002ce80f: call 0x1007abc10 ; 0x1007abc10
0x1002ce814: mov r15, rax
0x1002ce817: mov qword ptr [rbp - 0xb0], 0
0x1002ce822: call 0x1007abc10 ; 0x1007abc10
0x1002ce827: mov rbx, qword ptr [rax]
0x1002ce82a: mov rdi, rax
0x1002ce82d: lea rsi, [rbp - 0xb0]
0x1002ce834: lea rdx, [rbp - 0x58]
0x1002ce838: mov rcx, r15
0x1002ce83b: call qword ptr [rbx + 0x40]
0x1002ce83e: mov r15, qword ptr [rbp - 0xb0]
0x1002ce845: test r15, r15
0x1002ce848: je 0x1002ce9fe
0x1002ce84e: mov rdi, r15
0x1002ce851: call 0x1004d2050 ; 0x1004d2050
0x1002ce856: vmovss xmm0, dword ptr [rip + 0x7d6862] ; 0x100aa50c0
0x1002ce85e: test al, al
0x1002ce860: jne 0x1002ce866
0x1002ce862: vxorps xmm0, xmm0, xmm0
0x1002ce866: cmp byte ptr [r13 + 0x70], 0
0x1002ce86b: je 0x1002ce940
0x1002ce871: vmovss dword ptr [rbp - 0x30], xmm0
0x1002ce876: test al, al
0x1002ce878: mov rax, qword ptr [rbp - 0x48]
0x1002ce87c: cmovne rax, qword ptr [rbp - 0x50]
0x1002ce881: vmovss xmm0, dword ptr [rax]
0x1002ce885: mov rax, qword ptr [r14 + 0x160]
0x1002ce88c: vmovss xmm1, dword ptr [rax + 0x14]
0x1002ce891: lea rcx, [rip + 0x1d2c838] ; 0x101ffb0d0
0x1002ce898: cmp byte ptr [rcx], 0
0x1002ce89b: vmovss xmm2, dword ptr [rip + 0x7d681d] ; 0x100aa50c0
0x1002ce8a3: je 0x1002ce8b0
0x1002ce8a5: lea rcx, [rip + 0x9e9c94] ; 0x100cb8540
0x1002ce8ac: vmovss xmm2, dword ptr [rcx]
0x1002ce8b0: vmulss xmm2, xmm2, dword ptr [rax + 0x20]
0x1002ce8b5: vmulss xmm1, xmm1, xmm2
0x1002ce8b9: vmovss xmm2, dword ptr [rip + 0x7d81db] ; 0x100aa6a9c
0x1002ce8c1: vmaxss xmm1, xmm2, xmm1
0x1002ce8c5: vmovss xmm2, dword ptr [rip + 0x7d81d3] ; 0x100aa6aa0
0x1002ce8cd: vminss xmm1, xmm2, xmm1
0x1002ce8d1: vmovss dword ptr [rbp - 0x2c], xmm1
0x1002ce8d6: vdivss xmm0, xmm0, dword ptr [rip + 0x7d93da] ; 0x100aa7cb8
0x1002ce8de: vxorps xmm1, xmm1, xmm1
0x1002ce8e2: vmaxss xmm0, xmm1, xmm0
0x1002ce8e6: vmovss xmm1, dword ptr [rip + 0x7d67d2] ; 0x100aa50c0
0x1002ce8ee: vminss xmm0, xmm1, xmm0
0x1002ce8f2: vsubss xmm0, xmm1, xmm0
0x1002ce8f6: call 0x100aa2858 ; 0x100aa2858 _logf
0x1002ce8fb: vcvtss2sd xmm0, xmm0, xmm0
0x1002ce8ff: vdivsd xmm0, xmm0, qword ptr [rip + 0x7d9db9] ; 0x100aa86c0
0x1002ce907: vcvtsd2ss xmm0, xmm0, xmm0
0x1002ce90b: vmulss xmm0, xmm0, dword ptr [rbp - 0x2c]
0x1002ce910: call 0x100aa2708 ; 0x100aa2708 _expf
0x1002ce915: vmovss xmm1, dword ptr [rip + 0x7d67a3] ; 0x100aa50c0
0x1002ce91d: vsubss xmm0, xmm1, xmm0
0x1002ce921: mov rax, qword ptr [r13 + 0x78]
0x1002ce925: vsubss xmm1, xmm1, xmm0
0x1002ce929: vmulss xmm1, xmm1, dword ptr [rax + r12*4]
0x1002ce92f: vmulss xmm0, xmm0, dword ptr [rbp - 0x30]
0x1002ce934: vaddss xmm0, xmm0, xmm1
0x1002ce938: jmp 0x1002ce944 ; 0x1002ce944
0x1002ce93a: nop word ptr [rax + rax]
0x1002ce940: mov rax, qword ptr [r13 + 0x78]
0x1002ce944: vxorps xmm1, xmm1, xmm1
0x1002ce948: vmovss dword ptr [rax + r12*4], xmm0
0x1002ce94e: vucomiss xmm0, xmm1
0x1002ce952: jbe 0x1002ce9db
0x1002ce958: lea rdi, [rbp - 0xb0]
0x1002ce95f: mov rsi, r15
0x1002ce962: call 0x1004d1e40 ; 0x1004d1e40
0x1002ce967: mov rdi, qword ptr [r14 + 0x500]
0x1002ce96e: mov esi, dword ptr [r13 + 0x64]
0x1002ce972: vmovaps xmm1, xmmword ptr [rbp - 0xb0]
0x1002ce97a: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x1002ce97f: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1002ce984: vmovss xmm0, dword ptr [r13 + 0x50]
0x1002ce98a: vmulps xmm1, xmm1, xmm1
0x1002ce98e: vmovshdup xmm2, xmm1
0x1002ce992: vaddss xmm2, xmm1, xmm2
0x1002ce996: vpermilpd xmm1, xmm1, 1
0x1002ce99c: vaddss xmm1, xmm1, xmm2
0x1002ce9a0: vsqrtss xmm1, xmm1, xmm1
0x1002ce9a4: mov rax, qword ptr [r13 + 0x58]
0x1002ce9a8: test rax, rax
0x1002ce9ab: lea rax, [rax + 0x10]
0x1002ce9af: cmove rax, qword ptr [rbp - 0x38]
0x1002ce9b4: vmovss xmm2, dword ptr [rax]
0x1002ce9b8: vmulss xmm2, xmm2, dword ptr [r13 + 0x74]
0x1002ce9be: mov rax, qword ptr [r13 + 0x78]
0x1002ce9c2: vmulss xmm2, xmm2, dword ptr [rax + r12*4]
0x1002ce9c8: vmovss xmm3, dword ptr [r13 + 0x60]
0x1002ce9ce: lea rdx, [rbp - 0x70]
0x1002ce9d2: mov rcx, qword ptr [rbp - 0x40]
0x1002ce9d6: call 0x1004d3940 ; 0x1004d3940
0x1002ce9db: inc r12d
0x1002ce9de: mov rax, qword ptr [r13 + 0x38]
0x1002ce9e2: cmp r12d, dword ptr [rax + 0x10]
0x1002ce9e6: jb 0x1002ce800
0x1002ce9ec: add rsp, 0x88
0x1002ce9f3: pop rbx
0x1002ce9f4: pop r12
0x1002ce9f6: pop r13
0x1002ce9f8: pop r14
0x1002ce9fa: pop r15
0x1002ce9fc: pop rbp
0x1002ce9fd: ret 
0x1002ce9fe: lea rdi, [rip + 0x8930f3] ; 0x100b61af8 ret
0x1002cea05: lea rsi, [rip + 0x892f57] ; 0x100b61963 ./Clump.h
0x1002cea0c: mov edx, 0x47
0x1002cea11: mov ecx, 3
0x1002cea16: call 0x1007e5f70 ; 0x1007e5f70
0x1002cea1b: ud2 
0x1002cea1d: nop dword ptr [rax]
