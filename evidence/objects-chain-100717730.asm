0x100717730: push rbp
0x100717731: mov rbp, rsp
0x100717734: push rbx
0x100717735: push rax
0x100717736: mov rbx, rdi
0x100717739: mov rax, qword ptr [rsi + 0x160]
0x100717740: vmovss xmm0, dword ptr [rax + 0x14]
0x100717745: lea rcx, [rip + 0x18e3984] ; 0x101ffb0d0
0x10071774c: cmp byte ptr [rcx], 0
0x10071774f: vmovss xmm2, dword ptr [rip + 0x38d969] ; 0x100aa50c0
0x100717757: vmovaps xmm1, xmm2
0x10071775b: je 0x100717768
0x10071775d: lea rcx, [rip + 0x5a0ddc] ; 0x100cb8540
0x100717764: vmovss xmm1, dword ptr [rcx]
0x100717768: vmulss xmm1, xmm1, dword ptr [rax + 0x20]
0x10071776d: vmulss xmm0, xmm0, xmm1
0x100717771: vmovss xmm1, dword ptr [rip + 0x38f323] ; 0x100aa6a9c
0x100717779: vmaxss xmm0, xmm1, xmm0
0x10071777d: vmovss xmm1, dword ptr [rip + 0x38f31b] ; 0x100aa6aa0
0x100717785: vminss xmm0, xmm1, xmm0
0x100717789: vmovss dword ptr [rbp - 0xc], xmm0
0x10071778e: vmovss xmm0, dword ptr [rbx + 0x48]
0x100717793: vdivss xmm0, xmm0, dword ptr [rip + 0x39051d] ; 0x100aa7cb8
0x10071779b: vxorps xmm1, xmm1, xmm1
0x10071779f: vmaxss xmm0, xmm1, xmm0
0x1007177a3: vminss xmm0, xmm2, xmm0
0x1007177a7: vsubss xmm0, xmm2, xmm0
0x1007177ab: call 0x100aa2858 ; 0x100aa2858 _logf
0x1007177b0: vcvtss2sd xmm0, xmm0, xmm0
0x1007177b4: vdivsd xmm0, xmm0, qword ptr [rip + 0x390f04] ; 0x100aa86c0
0x1007177bc: vcvtsd2ss xmm0, xmm0, xmm0
0x1007177c0: vmulss xmm0, xmm0, dword ptr [rbp - 0xc]
0x1007177c5: call 0x100aa2708 ; 0x100aa2708 _expf
0x1007177ca: vmovss xmm2, dword ptr [rip + 0x38d8ee] ; 0x100aa50c0
0x1007177d2: vsubss xmm1, xmm2, xmm0
0x1007177d6: vsubss xmm0, xmm2, xmm1
0x1007177da: vmulss xmm2, xmm0, dword ptr [rbx + 0x4c]
0x1007177df: vmovss xmm0, dword ptr [rbx + 0x38]
0x1007177e4: vmovss xmm3, dword ptr [rbx + 0x3c]
0x1007177e9: vmulss xmm1, xmm1, xmm3
0x1007177ed: vaddss xmm1, xmm2, xmm1
0x1007177f1: vmovss dword ptr [rbx + 0x4c], xmm1
0x1007177f6: vmovss xmm2, dword ptr [rbx + 0x50]
0x1007177fb: vsubss xmm4, xmm0, xmm2
0x1007177ff: vmulss xmm4, xmm1, xmm4
0x100717803: vaddss xmm2, xmm2, xmm4
0x100717807: mov rax, qword ptr [rbx + 0x40]
0x10071780b: vmovss dword ptr [rax + 0x10], xmm2
0x100717810: vsubss xmm1, xmm3, xmm1
0x100717814: vandps xmm1, xmm1, xmmword ptr [rip + 0x3900f4] ; 0x100aa7910
0x10071781c: vmovss xmm2, dword ptr [rip + 0x390d8c] ; 0x100aa85b0
0x100717824: vucomiss xmm2, xmm1
0x100717828: jae 0x100717831
0x10071782a: add rsp, 8
0x10071782e: pop rbx
0x10071782f: pop rbp
0x100717830: ret 
0x100717831: vmovss dword ptr [rax + 0x10], xmm0
0x100717836: mov rdi, rbx
0x100717839: add rsp, 8
0x10071783d: pop rbx
0x10071783e: pop rbp
0x10071783f: jmp 0x10032ef60 ; 0x10032ef60
0x100717844: nop word ptr cs:[rax + rax]
