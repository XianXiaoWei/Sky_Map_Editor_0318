0x1005609d0: push rbp
0x1005609d1: mov rbp, rsp
0x1005609d4: push r14
0x1005609d6: push rbx
0x1005609d7: mov ebx, esi
0x1005609d9: mov r14, rdi
0x1005609dc: test dl, dl
0x1005609de: je 0x100560a39
0x1005609e0: vmovss xmm1, dword ptr [rip + 0x5446d8] ; 0x100aa50c0
0x1005609e8: call 0x100aa2744 ; 0x100aa2744 _fmodf
0x1005609ed: vaddss xmm1, xmm0, dword ptr [rip + 0x5446cb] ; 0x100aa50c0
0x1005609f5: vxorps xmm2, xmm2, xmm2
0x1005609f9: vcmpltss xmm2, xmm0, xmm2
0x1005609fe: vblendvps xmm0, xmm0, xmm1, xmm2
0x100560a04: mov eax, ebx
0x100560a06: vcvtsi2ss xmm1, xmm3, rax
0x100560a0b: vmulss xmm2, xmm0, xmm1
0x100560a0f: vcvttss2si rsi, xmm2
0x100560a14: lea ecx, [rbx - 1]
0x100560a17: lea eax, [rsi + 1]
0x100560a1a: xor edi, edi
0x100560a1c: cmp ecx, esi
0x100560a1e: cmove eax, edi
0x100560a21: test esi, esi
0x100560a23: mov ecx, esi
0x100560a25: cmove ecx, ebx
0x100560a28: dec ecx
0x100560a2a: add ebx, -2
0x100560a2d: lea edx, [rax + 1]
0x100560a30: cmp ebx, esi
0x100560a32: cmove edx, edi
0x100560a35: mov ebx, esi
0x100560a37: jmp 0x100560a7d ; 0x100560a7d
0x100560a39: vxorps xmm1, xmm1, xmm1
0x100560a3d: vmaxss xmm0, xmm1, xmm0
0x100560a41: vmovss xmm1, dword ptr [rip + 0x544677] ; 0x100aa50c0
0x100560a49: vminss xmm0, xmm1, xmm0
0x100560a4d: lea edx, [rbx - 1]
0x100560a50: vcvtsi2ss xmm1, xmm2, rdx
0x100560a55: vmulss xmm2, xmm0, xmm1
0x100560a59: vcvttss2si rax, xmm2
0x100560a5e: add ebx, -2
0x100560a61: cmp edx, eax
0x100560a63: cmovne ebx, eax
0x100560a66: lea eax, [rbx + 1]
0x100560a69: lea ecx, [rbx - 1]
0x100560a6c: test ebx, ebx
0x100560a6e: cmove ecx, ebx
0x100560a71: xor esi, esi
0x100560a73: cmp eax, edx
0x100560a75: setne sil
0x100560a79: lea edx, [rbx + rsi + 1]
0x100560a7d: vmulss xmm0, xmm0, xmm1
0x100560a81: mov esi, ebx
0x100560a83: vcvtsi2ss xmm1, xmm3, rsi
0x100560a88: vsubss xmm0, xmm0, xmm1
0x100560a8c: mov ecx, ecx
0x100560a8e: vmovss xmm1, dword ptr [r14 + rcx*4]
0x100560a94: vmovss xmm2, dword ptr [r14 + rsi*4]
0x100560a9a: mov eax, eax
0x100560a9c: vmovss xmm3, dword ptr [r14 + rax*4]
0x100560aa2: mov eax, edx
0x100560aa4: vmovss xmm4, dword ptr [r14 + rax*4]
0x100560aaa: vaddss xmm8, xmm2, xmm2
0x100560aae: vsubss xmm6, xmm3, xmm1
0x100560ab2: vaddss xmm7, xmm1, xmm1
0x100560ab6: vmulss xmm5, xmm2, dword ptr [rip + 0x547ba2] ; 0x100aa8660
0x100560abe: vaddss xmm5, xmm7, xmm5
0x100560ac2: vmulss xmm7, xmm3, dword ptr [rip + 0x546df2] ; 0x100aa78bc
0x100560aca: vaddss xmm5, xmm5, xmm7
0x100560ace: vsubss xmm5, xmm5, xmm4
0x100560ad2: vmovss xmm7, dword ptr [rip + 0x546d16] ; 0x100aa77f0
0x100560ada: vmulss xmm2, xmm2, xmm7
0x100560ade: vsubss xmm1, xmm2, xmm1
0x100560ae2: vmulss xmm2, xmm3, xmm7
0x100560ae6: vsubss xmm1, xmm1, xmm2
0x100560aea: vaddss xmm1, xmm4, xmm1
0x100560aee: vmulss xmm1, xmm0, xmm1
0x100560af2: vaddss xmm1, xmm5, xmm1
0x100560af6: vmulss xmm1, xmm0, xmm1
0x100560afa: vaddss xmm1, xmm6, xmm1
0x100560afe: vmulss xmm0, xmm0, xmm1
0x100560b02: vaddss xmm0, xmm8, xmm0
0x100560b06: vmulss xmm0, xmm0, dword ptr [rip + 0x543aaa] ; 0x100aa45b8
0x100560b0e: pop rbx
0x100560b0f: pop r14
0x100560b11: pop rbp
0x100560b12: ret 
0x100560b13: nop word ptr cs:[rax + rax]
