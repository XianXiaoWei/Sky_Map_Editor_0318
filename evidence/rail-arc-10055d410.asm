0x10055d410: push rbp
0x10055d411: mov rbp, rsp
0x10055d414: push rbx
0x10055d415: push rax
0x10055d416: mov rbx, rdi
0x10055d419: vxorps xmm1, xmm1, xmm1
0x10055d41d: vucomiss xmm0, xmm1
0x10055d421: jb 0x10055d4b4
0x10055d427: vmovss xmm2, dword ptr [rip + 0x547c91] ; 0x100aa50c0
0x10055d42f: vucomiss xmm2, xmm0
0x10055d433: jb 0x10055d4b4
0x10055d435: cmp byte ptr [rbx + 0x1c], 0
0x10055d439: je 0x10055d45a
0x10055d43b: mov esi, 0x10
0x10055d440: mov rdi, rbx
0x10055d443: vmovss dword ptr [rbp - 0xc], xmm0
0x10055d448: call 0x10055b560 ; 0x10055b560
0x10055d44d: vmovss xmm0, dword ptr [rbp - 0xc]
0x10055d452: vmovss xmm2, dword ptr [rip + 0x547c66] ; 0x100aa50c0
0x10055d45a: mov eax, dword ptr [rbx + 0x14]
0x10055d45d: vcvtsi2ss xmm1, xmm3, rax
0x10055d462: vmulss xmm0, xmm1, xmm0
0x10055d466: vcvttss2si rcx, xmm0
0x10055d46b: mov edx, ecx
0x10055d46d: vcvtsi2ss xmm1, xmm3, rdx
0x10055d472: vsubss xmm0, xmm0, xmm1
0x10055d476: test ecx, ecx
0x10055d478: je 0x10055d48c
0x10055d47a: mov rsi, qword ptr [rbx + 8]
0x10055d47e: cmp eax, ecx
0x10055d480: jne 0x10055d497
0x10055d482: dec eax
0x10055d484: vmovss xmm0, dword ptr [rsi + rax*8 + 4]
0x10055d48a: jmp 0x10055d4ad ; 0x10055d4ad
0x10055d48c: mov rax, qword ptr [rbx + 8]
0x10055d490: vmulss xmm0, xmm0, dword ptr [rax + 4]
0x10055d495: jmp 0x10055d4ad ; 0x10055d4ad
0x10055d497: dec ecx
0x10055d499: vsubss xmm1, xmm2, xmm0
0x10055d49d: vmulss xmm1, xmm1, dword ptr [rsi + rcx*8 + 4]
0x10055d4a3: vmulss xmm0, xmm0, dword ptr [rsi + rdx*8 + 4]
0x10055d4a9: vaddss xmm0, xmm1, xmm0
0x10055d4ad: add rsp, 8
0x10055d4b1: pop rbx
0x10055d4b2: pop rbp
0x10055d4b3: ret 
0x10055d4b4: lea rdi, [rip + 0x6342d4] ; 0x100b9178f 0.0f <= t && t <= 1.0f
0x10055d4bb: lea rsi, [rip + 0x63426a] ; 0x100b9172c Rail.cpp
0x10055d4c2: mov edx, 0x182
0x10055d4c7: mov ecx, 3
0x10055d4cc: call 0x1007e5f70 ; 0x1007e5f70
0x10055d4d1: ud2 
0x10055d4d3: nop word ptr cs:[rax + rax]
