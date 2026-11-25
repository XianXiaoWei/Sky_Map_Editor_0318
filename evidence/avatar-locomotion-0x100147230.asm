0x100147230: push rbp
0x100147231: mov rbp, rsp
0x100147234: push r15
0x100147236: push r14
0x100147238: push r13
0x10014723a: push r12
0x10014723c: push rbx
0x10014723d: sub rsp, 0x78
0x100147241: mov dword ptr [rbp - 0x34], r9d
0x100147245: mov dword ptr [rbp - 0x30], r8d
0x100147249: vmovss dword ptr [rbp - 0x2c], xmm0
0x10014724e: mov r14, rcx
0x100147251: mov r13, rdx
0x100147254: mov rbx, rsi
0x100147257: mov r15, rdi
0x10014725a: vmovaps xmm0, xmmword ptr [r14]
0x10014725f: vmulps xmm0, xmm0, xmm0
0x100147263: vmovshdup xmm1, xmm0
0x100147267: vaddss xmm1, xmm0, xmm1
0x10014726b: vpermilpd xmm0, xmm0, 1
0x100147271: vaddss xmm0, xmm0, xmm1
0x100147275: vmovaps xmm1, xmmword ptr [r13]
0x10014727b: vsubps xmm1, xmm1, xmmword ptr [rbx]
0x10014727f: vsqrtss xmm0, xmm0, xmm0
0x100147283: vmulps xmm1, xmm1, xmm1
0x100147287: vmovshdup xmm2, xmm1
0x10014728b: vaddss xmm2, xmm1, xmm2
0x10014728f: vpermilpd xmm1, xmm1, 1
0x100147295: vaddss xmm1, xmm1, xmm2
0x100147299: vsqrtss xmm3, xmm1, xmm1
0x10014729d: vpermilps xmm0, xmm0, 0xc0
0x1001472a3: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1001472a8: xor r12d, r12d
0x1001472ab: mov dword ptr [rbp - 0x50], 0
0x1001472b2: nop word ptr cs:[rax + rax]
0x1001472c0: vmovaps xmmword ptr [rbp - 0x60], xmm3
0x1001472c5: mov rdi, r15
0x1001472c8: mov rsi, rbx
0x1001472cb: mov rdx, r13
0x1001472ce: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001472d3: mov ecx, dword ptr [rbp - 0x30]
0x1001472d6: lea r8, [rbp - 0x70]
0x1001472da: call 0x100778220 ; 0x100778220
0x1001472df: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x1001472e4: vsubps xmm4, xmm0, xmmword ptr [rbx]
0x1001472e8: vmulps xmm1, xmm4, xmm4
0x1001472ec: vmovshdup xmm2, xmm1
0x1001472f0: vaddss xmm2, xmm1, xmm2
0x1001472f4: vpermilpd xmm1, xmm1, 1
0x1001472fa: vaddss xmm1, xmm1, xmm2
0x1001472fe: vsqrtss xmm1, xmm1, xmm1
0x100147302: vucomiss xmm1, dword ptr [rip + 0x9605ba] ; 0x100aa78c4
0x10014730a: jbe 0x100147316
0x10014730c: vpermilps xmm2, xmm1, 0xc0
0x100147312: vdivps xmm4, xmm4, xmm2
0x100147316: test al, al
0x100147318: je 0x1001473b0
0x10014731e: vmovaps xmmword ptr [rbp - 0x50], xmm4
0x100147323: vmulps xmm1, xmm4, xmmword ptr [rip + 0x964445] ; 0x100aab770
0x10014732b: vaddps xmm0, xmm0, xmm1
0x10014732f: vmovaps xmmword ptr [rbp - 0x90], xmm0
0x100147337: mov rdi, r15
0x10014733a: lea rsi, [rbp - 0x70]
0x10014733e: lea rdx, [rbp - 0x90]
0x100147345: vmovss xmm0, dword ptr [rbp - 0x2c]
0x10014734a: mov ecx, dword ptr [rbp - 0x30]
0x10014734d: lea r8, [rbp - 0xa0]
0x100147354: call 0x100778220 ; 0x100778220
0x100147359: test al, al
0x10014735b: je 0x100147450
0x100147361: vmovaps xmm1, xmmword ptr [rbp - 0xa0]
0x100147369: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x10014736e: vsubps xmm4, xmm1, xmm0
0x100147372: vmulps xmm1, xmm4, xmm4
0x100147376: vmovshdup xmm2, xmm1
0x10014737a: vaddss xmm2, xmm1, xmm2
0x10014737e: vpermilpd xmm1, xmm1, 1
0x100147384: vaddss xmm1, xmm1, xmm2
0x100147388: vsqrtss xmm1, xmm1, xmm1
0x10014738c: vucomiss xmm1, dword ptr [rip + 0x960530] ; 0x100aa78c4
0x100147394: jbe 0x1001473a0
0x100147396: vpermilps xmm1, xmm1, 0xc0
0x10014739c: vdivps xmm4, xmm4, xmm1
0x1001473a0: vmovaps xmm3, xmmword ptr [rbp - 0x60]
0x1001473a5: jmp 0x10014745f ; 0x10014745f
0x1001473aa: nop word ptr [rax + rax]
0x1001473b0: vmovaps xmm3, xmmword ptr [rbp - 0x60]
0x1001473b5: vsubss xmm3, xmm3, xmm1
0x1001473b9: vmovaps xmmword ptr [rbx], xmm0
0x1001473bd: cmp byte ptr [rbp - 0x34], 0
0x1001473c1: jne 0x100147494
0x1001473c7: vmovaps xmm0, xmmword ptr [r14]
0x1001473cc: vmulps xmm1, xmm0, xmm0
0x1001473d0: vmovshdup xmm2, xmm1
0x1001473d4: vaddss xmm2, xmm1, xmm2
0x1001473d8: vpermilpd xmm1, xmm1, 1
0x1001473de: vaddss xmm1, xmm1, xmm2
0x1001473e2: vsqrtss xmm2, xmm1, xmm1
0x1001473e6: vucomiss xmm2, dword ptr [rip + 0x9604d6] ; 0x100aa78c4
0x1001473ee: vmovaps xmm1, xmm0
0x1001473f2: jbe 0x1001473fe
0x1001473f4: vpermilps xmm1, xmm2, 0xc0
0x1001473fa: vdivps xmm1, xmm0, xmm1
0x1001473fe: vmulps xmm1, xmm4, xmm1
0x100147402: vmovshdup xmm2, xmm1
0x100147406: vaddss xmm2, xmm1, xmm2
0x10014740a: vpermilpd xmm1, xmm1, 1
0x100147410: vaddss xmm1, xmm1, xmm2
0x100147414: vmulss xmm3, xmm3, xmm1
0x100147418: vmulps xmm0, xmm4, xmm0
0x10014741c: vmovshdup xmm1, xmm0
0x100147420: vaddss xmm1, xmm0, xmm1
0x100147424: vpermilpd xmm0, xmm0, 1
0x10014742a: vaddss xmm0, xmm0, xmm1
0x10014742e: vpermilps xmm0, xmm0, 0xc0
0x100147434: vmulps xmm0, xmm4, xmm0
0x100147438: vmovaps xmmword ptr [r14], xmm0
0x10014743d: vmovss xmm0, dword ptr [rip + 0x96116f] ; 0x100aa85b4
0x100147445: vucomiss xmm0, xmm3
0x100147449: jbe 0x1001474ac
0x10014744b: jmp 0x1001474cd ; 0x1001474cd
0x100147450: vmovaps xmm0, xmmword ptr [rbp - 0x70]
0x100147455: vmovaps xmm3, xmmword ptr [rbp - 0x60]
0x10014745a: vmovaps xmm4, xmmword ptr [rbp - 0x50]
0x10014745f: vsubps xmm1, xmm0, xmmword ptr [rbx]
0x100147463: vmulps xmm1, xmm1, xmm1
0x100147467: vmovshdup xmm2, xmm1
0x10014746b: vaddss xmm2, xmm1, xmm2
0x10014746f: vpermilpd xmm1, xmm1, 1
0x100147475: vaddss xmm1, xmm1, xmm2
0x100147479: vsqrtss xmm1, xmm1, xmm1
0x10014747d: mov al, 1
0x10014747f: mov dword ptr [rbp - 0x50], eax
0x100147482: vsubss xmm3, xmm3, xmm1
0x100147486: vmovaps xmmword ptr [rbx], xmm0
0x10014748a: cmp byte ptr [rbp - 0x34], 0
0x10014748e: je 0x1001473c7
0x100147494: vmulps xmm0, xmm4, xmmword ptr [rbp - 0x80]
0x100147499: vmovaps xmmword ptr [r14], xmm0
0x10014749e: vmovss xmm0, dword ptr [rip + 0x96110e] ; 0x100aa85b4
0x1001474a6: vucomiss xmm0, xmm3
0x1001474aa: ja 0x1001474cd
0x1001474ac: vpermilps xmm0, xmm3, 0xc0
0x1001474b2: vmulps xmm0, xmm4, xmm0
0x1001474b6: vaddps xmm0, xmm0, xmmword ptr [rbx]
0x1001474ba: vmovaps xmmword ptr [r13], xmm0
0x1001474c0: inc r12d
0x1001474c3: cmp r12d, 8
0x1001474c7: jb 0x1001472c0
0x1001474cd: mov rax, qword ptr [rbp + 0x10]
0x1001474d1: test rax, rax
0x1001474d4: je 0x1001474de
0x1001474d6: vmovaps xmm0, xmmword ptr [rbx]
0x1001474da: vmovaps xmmword ptr [rax], xmm0
0x1001474de: mov rax, qword ptr [rbp + 0x18]
0x1001474e2: test rax, rax
0x1001474e5: je 0x1001474f0
0x1001474e7: vmovaps xmm0, xmmword ptr [r14]
0x1001474ec: vmovaps xmmword ptr [rax], xmm0
0x1001474f0: mov eax, dword ptr [rbp - 0x50]
0x1001474f3: and al, 1
0x1001474f5: add rsp, 0x78
0x1001474f9: pop rbx
0x1001474fa: pop r12
0x1001474fc: pop r13
0x1001474fe: pop r14
0x100147500: pop r15
0x100147502: pop rbp
0x100147503: ret 
0x100147504: nop word ptr cs:[rax + rax]

