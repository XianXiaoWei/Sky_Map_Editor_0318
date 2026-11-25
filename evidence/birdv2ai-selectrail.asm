0x1001a06a0: push rbp
0x1001a06a1: mov rbp, rsp
0x1001a06a4: push r15
0x1001a06a6: push r14
0x1001a06a8: push r13
0x1001a06aa: push r12
0x1001a06ac: push rbx
0x1001a06ad: sub rsp, 0x58
0x1001a06b1: mov qword ptr [rbp - 0x30], rdx
0x1001a06b5: mov r14, rdi
0x1001a06b8: mov rax, qword ptr [r14 + 8]
0x1001a06bc: mov rax, qword ptr [rax + 0x28]
0x1001a06c0: cmp dword ptr [rax + 0x10], 0
0x1001a06c4: je 0x1001a08a5
0x1001a06ca: vaddss xmm1, xmm0, xmm0
0x1001a06ce: vmulss xmm1, xmm1, xmm1
0x1001a06d2: vmovss dword ptr [rbp - 0x34], xmm1
0x1001a06d7: vpermilps xmm0, xmm0, 0xc0
0x1001a06dd: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1001a06e2: xor r12d, r12d
0x1001a06e5: lea r15, [rbp - 0x50]
0x1001a06e9: nop dword ptr [rax]
0x1001a06f0: mov rax, qword ptr [rax + 8]
0x1001a06f4: mov ecx, r12d
0x1001a06f7: mov rax, qword ptr [rax + rcx*8]
0x1001a06fb: mov qword ptr [rbp - 0x58], rax
0x1001a06ff: call 0x1007abc10 ; 0x1007abc10
0x1001a0704: mov r13, rax
0x1001a0707: mov qword ptr [rbp - 0x50], 0
0x1001a070f: call 0x10055b490 ; 0x10055b490
0x1001a0714: mov rbx, qword ptr [rax]
0x1001a0717: mov rdi, rax
0x1001a071a: mov rsi, r15
0x1001a071d: lea rdx, [rbp - 0x58]
0x1001a0721: mov rcx, r13
0x1001a0724: call qword ptr [rbx + 0x40]
0x1001a0727: mov r13, qword ptr [rbp - 0x50]
0x1001a072b: test r13, r13
0x1001a072e: je 0x1001a08ba
0x1001a0734: cmp r13, qword ptr [r14 + 0x40]
0x1001a0738: je 0x1001a0890
0x1001a073e: cmp byte ptr [r13 + 0x2c], 0
0x1001a0743: jne 0x1001a0890
0x1001a0749: call 0x100aa2b22 ; 0x100aa2b22 _rand
0x1001a074e: vcvtsi2ss xmm0, xmm4, eax
0x1001a0752: vmulss xmm0, xmm0, dword ptr [rip + 0x906996] ; 0x100aa70f0
0x1001a075a: vmulss xmm0, xmm0, dword ptr [rip + 0x90a7de] ; 0x100aaaf40
0x1001a0762: vcvttss2si eax, xmm0
0x1001a0766: imul eax, eax, 0x33
0x1001a0769: add eax, 0x1869f
0x1001a076e: cmp eax, 0x30d3e
0x1001a0773: ja 0x1001a0890
0x1001a0779: xor edx, edx
0x1001a077b: mov rdi, r15
0x1001a077e: mov rsi, r13
0x1001a0781: call 0x100560300 ; 0x100560300
0x1001a0786: mov rax, qword ptr [rbp - 0x30]
0x1001a078a: vmovaps xmm0, xmmword ptr [rax]
0x1001a078e: vsubps xmm0, xmm0, xmmword ptr [rbp - 0x50]
0x1001a0793: vmulps xmm0, xmm0, xmm0
0x1001a0797: vmovshdup xmm1, xmm0
0x1001a079b: vaddss xmm1, xmm0, xmm1
0x1001a079f: vpermilpd xmm0, xmm0, 1
0x1001a07a5: vaddss xmm0, xmm0, xmm1
0x1001a07a9: vmovss xmm1, dword ptr [rbp - 0x34]
0x1001a07ae: vucomiss xmm1, xmm0
0x1001a07b2: jbe 0x1001a0890
0x1001a07b8: mov edx, 1
0x1001a07bd: lea rdi, [rbp - 0x80]
0x1001a07c1: mov rsi, r13
0x1001a07c4: call 0x100560300 ; 0x100560300
0x1001a07c9: vmovaps xmm0, xmmword ptr [rbp - 0x80]
0x1001a07ce: vmovaps xmm1, xmmword ptr [rbp - 0x50]
0x1001a07d3: vsubps xmm0, xmm0, xmm1
0x1001a07d7: vmulps xmm2, xmm0, xmm0
0x1001a07db: vmovshdup xmm3, xmm2
0x1001a07df: vaddss xmm3, xmm2, xmm3
0x1001a07e3: vpermilpd xmm2, xmm2, 1
0x1001a07e9: vaddss xmm2, xmm2, xmm3
0x1001a07ed: vsqrtss xmm2, xmm2, xmm2
0x1001a07f1: vucomiss xmm2, dword ptr [rip + 0x9070cb] ; 0x100aa78c4
0x1001a07f9: jbe 0x1001a0805
0x1001a07fb: vpermilps xmm2, xmm2, 0xc0
0x1001a0801: vdivps xmm0, xmm0, xmm2
0x1001a0805: mov rax, qword ptr [rbp - 0x30]
0x1001a0809: vsubps xmm1, xmm1, xmmword ptr [rax]
0x1001a080d: vmulps xmm2, xmm1, xmm1
0x1001a0811: vmovshdup xmm3, xmm2
0x1001a0815: vaddss xmm3, xmm2, xmm3
0x1001a0819: vpermilpd xmm2, xmm2, 1
0x1001a081f: vaddss xmm2, xmm2, xmm3
0x1001a0823: vsqrtss xmm2, xmm2, xmm2
0x1001a0827: vucomiss xmm2, dword ptr [rip + 0x907095] ; 0x100aa78c4
0x1001a082f: jbe 0x1001a083b
0x1001a0831: vpermilps xmm2, xmm2, 0xc0
0x1001a0837: vdivps xmm1, xmm1, xmm2
0x1001a083b: vmulps xmm1, xmm0, xmm1
0x1001a083f: vmovshdup xmm2, xmm1
0x1001a0843: vaddss xmm2, xmm1, xmm2
0x1001a0847: vpermilpd xmm1, xmm1, 1
0x1001a084d: vaddss xmm1, xmm1, xmm2
0x1001a0851: vucomiss xmm1, dword ptr [rip + 0x908993] ; 0x100aa91ec
0x1001a0859: jbe 0x1001a0890
0x1001a085b: mov rax, qword ptr [rbp - 0x30]
0x1001a085f: vmovaps xmm1, xmmword ptr [rax + 0x40]
0x1001a0864: vdivps xmm1, xmm1, xmmword ptr [rbp - 0x70]
0x1001a0869: vmulps xmm0, xmm0, xmm1
0x1001a086d: vmovshdup xmm1, xmm0
0x1001a0871: vaddss xmm1, xmm0, xmm1
0x1001a0875: vpermilpd xmm0, xmm0, 1
0x1001a087b: vaddss xmm0, xmm0, xmm1
0x1001a087f: vucomiss xmm0, dword ptr [rip + 0x908965] ; 0x100aa91ec
0x1001a0887: ja 0x1001a08b4
0x1001a0889: nop dword ptr [rax]
0x1001a0890: inc r12d
0x1001a0893: mov rax, qword ptr [r14 + 8]
0x1001a0897: mov rax, qword ptr [rax + 0x28]
0x1001a089b: cmp r12d, dword ptr [rax + 0x10]
0x1001a089f: jb 0x1001a06f0
0x1001a08a5: add rsp, 0x58
0x1001a08a9: pop rbx
0x1001a08aa: pop r12
0x1001a08ac: pop r13
0x1001a08ae: pop r14
0x1001a08b0: pop r15
0x1001a08b2: pop rbp
0x1001a08b3: ret 
0x1001a08b4: mov qword ptr [r14 + 0x40], r13
0x1001a08b8: jmp 0x1001a08a5 ; 0x1001a08a5
0x1001a08ba: lea rdi, [rip + 0x9c1237] ; 0x100b61af8 ret
0x1001a08c1: lea rsi, [rip + 0x9c109b] ; 0x100b61963 ./Clump.h
0x1001a08c8: mov edx, 0x47
0x1001a08cd: mov ecx, 3
0x1001a08d2: call 0x1007e5f70 ; 0x1007e5f70
0x1001a08d7: ud2 
0x1001a08d9: nop dword ptr [rax]
