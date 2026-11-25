0x10055e420: push rbp
0x10055e421: mov rbp, rsp
0x10055e424: push r15
0x10055e426: push r14
0x10055e428: push rbx
0x10055e429: push rax
0x10055e42a: mov r14, rdi
0x10055e42d: mov r15, qword ptr [rsi + 0x90]
0x10055e434: mov ebx, dword ptr [rsi + 0x28]
0x10055e437: cmp byte ptr [rsi + 0x2c], 0
0x10055e43b: je 0x10055e496
0x10055e43d: vmovss xmm1, dword ptr [rip + 0x546c7b] ; 0x100aa50c0
0x10055e445: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x10055e44a: vaddss xmm1, xmm0, dword ptr [rip + 0x546c6e] ; 0x100aa50c0
0x10055e452: vxorps xmm2, xmm2, xmm2
0x10055e456: vcmpltss xmm2, xmm0, xmm2
0x10055e45b: vblendvps xmm0, xmm0, xmm1, xmm2
0x10055e461: mov eax, ebx
0x10055e463: vcvtsi2ss xmm1, xmm3, rax
0x10055e468: vmulss xmm2, xmm0, xmm1
0x10055e46c: vcvttss2si rsi, xmm2
0x10055e471: lea ecx, [rbx - 1]
0x10055e474: lea eax, [rsi + 1]
0x10055e477: xor edi, edi
0x10055e479: cmp ecx, esi
0x10055e47b: cmove eax, edi
0x10055e47e: test esi, esi
0x10055e480: mov ecx, esi
0x10055e482: cmove ecx, ebx
0x10055e485: dec ecx
0x10055e487: add ebx, -2
0x10055e48a: lea edx, [rax + 1]
0x10055e48d: cmp ebx, esi
0x10055e48f: cmove edx, edi
0x10055e492: mov ebx, esi
0x10055e494: jmp 0x10055e4da ; 0x10055e4da
0x10055e496: vxorps xmm1, xmm1, xmm1
0x10055e49a: vmaxss xmm0, xmm1, xmm0
0x10055e49e: vmovss xmm1, dword ptr [rip + 0x546c1a] ; 0x100aa50c0
0x10055e4a6: vminss xmm0, xmm1, xmm0
0x10055e4aa: lea edx, [rbx - 1]
0x10055e4ad: vcvtsi2ss xmm1, xmm2, rdx
0x10055e4b2: vmulss xmm2, xmm0, xmm1
0x10055e4b6: vcvttss2si rax, xmm2
0x10055e4bb: add ebx, -2
0x10055e4be: cmp edx, eax
0x10055e4c0: cmovne ebx, eax
0x10055e4c3: lea eax, [rbx + 1]
0x10055e4c6: lea ecx, [rbx - 1]
0x10055e4c9: test ebx, ebx
0x10055e4cb: cmove ecx, ebx
0x10055e4ce: xor esi, esi
0x10055e4d0: cmp eax, edx
0x10055e4d2: setne sil
0x10055e4d6: lea edx, [rbx + rsi + 1]
0x10055e4da: vmulss xmm0, xmm0, xmm1
0x10055e4de: mov esi, ebx
0x10055e4e0: vcvtsi2ss xmm1, xmm3, rsi
0x10055e4e5: vsubss xmm8, xmm0, xmm1
0x10055e4e9: mov ecx, ecx
0x10055e4eb: shl rcx, 4
0x10055e4ef: vmovaps xmm1, xmmword ptr [r15 + rcx]
0x10055e4f5: shl rsi, 4
0x10055e4f9: vmovaps xmm2, xmmword ptr [r15 + rsi]
0x10055e4ff: mov eax, eax
0x10055e501: shl rax, 4
0x10055e505: vmovaps xmm3, xmmword ptr [r15 + rax]
0x10055e50b: mov eax, edx
0x10055e50d: shl rax, 4
0x10055e511: vmovaps xmm4, xmmword ptr [r15 + rax]
0x10055e517: vaddps xmm5, xmm2, xmm2
0x10055e51b: vsubps xmm6, xmm3, xmm1
0x10055e51f: vaddps xmm7, xmm1, xmm1
0x10055e523: vmulps xmm0, xmm2, xmmword ptr [rip + 0x549255] ; 0x100aa7780
0x10055e52b: vsubps xmm0, xmm7, xmm0
0x10055e52f: vmulps xmm7, xmm3, xmmword ptr [rip + 0x549a19] ; 0x100aa7f50
0x10055e537: vaddps xmm0, xmm0, xmm7
0x10055e53b: vsubps xmm0, xmm0, xmm4
0x10055e53f: vmovaps xmm7, xmmword ptr [rip + 0x549b39] ; 0x100aa8080
0x10055e547: vmulps xmm2, xmm2, xmm7
0x10055e54b: vsubps xmm1, xmm2, xmm1
0x10055e54f: vmulps xmm2, xmm3, xmm7
0x10055e553: vsubps xmm1, xmm1, xmm2
0x10055e557: vaddps xmm1, xmm4, xmm1
0x10055e55b: vpermilps xmm2, xmm8, 0xc0
0x10055e561: vmulps xmm1, xmm2, xmm1
0x10055e565: vaddps xmm0, xmm0, xmm1
0x10055e569: vmulps xmm0, xmm2, xmm0
0x10055e56d: vaddps xmm0, xmm6, xmm0
0x10055e571: vmulps xmm0, xmm2, xmm0
0x10055e575: vaddps xmm0, xmm5, xmm0
0x10055e579: vmulps xmm0, xmm0, xmmword ptr [rip + 0x5490ef] ; 0x100aa7670
0x10055e581: vmovaps xmmword ptr [r14], xmm0
0x10055e586: mov rax, r14
0x10055e589: add rsp, 8
0x10055e58d: pop rbx
0x10055e58e: pop r14
0x10055e590: pop r15
0x10055e592: pop rbp
0x10055e593: ret 
0x10055e594: nop word ptr cs:[rax + rax]
