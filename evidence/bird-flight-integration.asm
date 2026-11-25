0x1001a2f30: push rbp
0x1001a2f31: mov rbp, rsp
0x1001a2f34: push r15
0x1001a2f36: push r14
0x1001a2f38: push r13
0x1001a2f3a: push r12
0x1001a2f3c: push rbx
0x1001a2f3d: sub rsp, 0x98
0x1001a2f44: mov r13, r8
0x1001a2f47: mov r14, rcx
0x1001a2f4a: mov r15, rdx
0x1001a2f4d: mov rbx, rsi
0x1001a2f50: mov r12, rdi
0x1001a2f53: mov rax, qword ptr [rip + 0xa6a97e] ; 0x100c0d8d8
0x1001a2f5a: mov rax, qword ptr [rax]
0x1001a2f5d: mov qword ptr [rbp - 0x30], rax
0x1001a2f61: cmp byte ptr [rbx + 0x84], 0
0x1001a2f68: je 0x1001a2f90
0x1001a2f6a: mov rax, qword ptr [rip + 0xa6a967] ; 0x100c0d8d8
0x1001a2f71: mov rax, qword ptr [rax]
0x1001a2f74: cmp rax, qword ptr [rbp - 0x30]
0x1001a2f78: jne 0x1001a34ae
0x1001a2f7e: add rsp, 0x98
0x1001a2f85: pop rbx
0x1001a2f86: pop r12
0x1001a2f88: pop r13
0x1001a2f8a: pop r14
0x1001a2f8c: pop r15
0x1001a2f8e: pop rbp
0x1001a2f8f: ret 
0x1001a2f90: lea rdi, [rbp - 0xc0]
0x1001a2f97: mov rsi, rbx
0x1001a2f9a: mov rdx, r13
0x1001a2f9d: vmovaps xmmword ptr [rbp - 0x80], xmm0
0x1001a2fa2: mov qword ptr [rbp - 0x48], r9
0x1001a2fa6: call 0x1001a0060 ; 0x1001a0060
0x1001a2fab: mov rcx, qword ptr [rbp - 0x48]
0x1001a2faf: vmovaps xmm4, xmmword ptr [rbp - 0x80]
0x1001a2fb4: vpermilps xmm0, xmm4, 0xc0
0x1001a2fba: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x1001a2fc2: vmulps xmm0, xmm0, xmmword ptr [rbp - 0xc0]
0x1001a2fca: vaddps xmm0, xmm0, xmmword ptr [r14 + 0x40]
0x1001a2fd0: vmovaps xmmword ptr [r14 + 0x40], xmm0
0x1001a2fd6: mov eax, dword ptr [r15 + 0x1c]
0x1001a2fda: mov dword ptr [r14 + 0x54], eax
0x1001a2fde: vmulps xmm0, xmm0, xmm0
0x1001a2fe2: vmovshdup xmm1, xmm0
0x1001a2fe6: vaddss xmm1, xmm0, xmm1
0x1001a2fea: vpermilpd xmm0, xmm0, 1
0x1001a2ff0: vaddss xmm0, xmm0, xmm1
0x1001a2ff4: vsqrtss xmm0, xmm0, xmm0
0x1001a2ff8: vmovss dword ptr [rcx], xmm0
0x1001a2ffc: vucomiss xmm0, dword ptr [rip + 0x903a98] ; 0x100aa6a9c
0x1001a3004: jbe 0x1001a3040
0x1001a3006: vmovss xmm1, dword ptr [r14 + 0x44]
0x1001a300c: vdivss xmm0, xmm1, xmm0
0x1001a3010: vmulss xmm0, xmm0, dword ptr [r15 + 0x24]
0x1001a3016: vmulss xmm0, xmm0, xmm4
0x1001a301a: vmovss xmm1, dword ptr [rip + 0x90209e] ; 0x100aa50c0
0x1001a3022: vsubss xmm0, xmm1, xmm0
0x1001a3026: vpermilps xmm1, xmm0, 0xc0
0x1001a302c: vmulps xmm1, xmm1, xmmword ptr [r14 + 0x40]
0x1001a3032: vmovaps xmmword ptr [r14 + 0x40], xmm1
0x1001a3038: vmulss xmm0, xmm0, dword ptr [rcx]
0x1001a303c: vmovss dword ptr [rcx], xmm0
0x1001a3040: lea rax, [r14 + 0x40]
0x1001a3044: mov qword ptr [rbp - 0x50], rax
0x1001a3048: vmovss xmm1, dword ptr [r15 + 0x24]
0x1001a304e: vaddss xmm1, xmm1, dword ptr [rip + 0x90206a] ; 0x100aa50c0
0x1001a3056: vmulss xmm1, xmm1, dword ptr [r15 + 0x1c]
0x1001a305c: vucomiss xmm0, xmm1
0x1001a3060: jbe 0x1001a3086
0x1001a3062: mov rax, qword ptr [rbp - 0x50]
0x1001a3066: vmovaps xmm2, xmmword ptr [rax]
0x1001a306a: vpermilps xmm0, xmm0, 0xc0
0x1001a3070: vdivps xmm0, xmm2, xmm0
0x1001a3074: vpermilps xmm2, xmm1, 0xc0
0x1001a307a: vmulps xmm0, xmm2, xmm0
0x1001a307e: vmovaps xmmword ptr [rax], xmm0
0x1001a3082: vmovss dword ptr [rcx], xmm1
0x1001a3086: vmovss xmm0, dword ptr [rbx + 0x24]
0x1001a308b: vandps xmm0, xmm0, xmmword ptr [rip + 0x90487d] ; 0x100aa7910
0x1001a3093: vmovss xmm1, dword ptr [rip + 0x904829] ; 0x100aa78c4
0x1001a309b: vucomiss xmm1, xmm0
0x1001a309f: jb 0x1001a33b5
0x1001a30a5: mov rax, qword ptr [rbx + 8]
0x1001a30a9: vmovss xmm0, dword ptr [rax + 0x68]
0x1001a30ae: vandps xmm0, xmm0, xmmword ptr [rip + 0x90485a] ; 0x100aa7910
0x1001a30b6: vucomiss xmm1, xmm0
0x1001a30ba: jae 0x1001a314d
0x1001a30c0: mov qword ptr [rbp - 0x98], rbx
0x1001a30c7: mov qword ptr [rbp - 0xa0], r13
0x1001a30ce: mov qword ptr [rbp - 0x60], r12
0x1001a30d2: mov r15, qword ptr [rbp + 0x10]
0x1001a30d6: mov byte ptr [rbp - 0x90], 1
0x1001a30dd: vmulss xmm0, xmm4, dword ptr [rip + 0x9047d7] ; 0x100aa78bc
0x1001a30e5: vmovss dword ptr [rbp - 0x70], xmm0
0x1001a30ea: mov r12d, 1
0x1001a30f0: lea rbx, [rbp - 0x40]
0x1001a30f4: lea r13, [rbp - 0x90]
0x1001a30fb: nop dword ptr [rax + rax]
0x1001a3100: mov rdi, rbx
0x1001a3103: mov rsi, r14
0x1001a3106: mov rdx, qword ptr [rbp - 0x50]
0x1001a310a: vmovss xmm0, dword ptr [rbp - 0x70]
0x1001a310f: mov rcx, r15
0x1001a3112: mov r8, r13
0x1001a3115: call 0x10062d590 ; 0x10062d590
0x1001a311a: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001a311f: vmovaps xmmword ptr [r14 + 0x40], xmm0
0x1001a3125: cmp r12d, 2
0x1001a3129: ja 0x1001a313b
0x1001a312b: movzx eax, byte ptr [rbp - 0x90]
0x1001a3132: and al, 1
0x1001a3134: inc r12d
0x1001a3137: test al, al
0x1001a3139: jne 0x1001a3100
0x1001a313b: mov r12, qword ptr [rbp - 0x60]
0x1001a313f: mov r13, qword ptr [rbp - 0xa0]
0x1001a3146: mov rbx, qword ptr [rbp - 0x98]
0x1001a314d: mov rax, qword ptr [rbp - 0x50]
0x1001a3151: vmovaps xmm2, xmmword ptr [rax]
0x1001a3155: vmulps xmm0, xmm2, xmm2
0x1001a3159: vmovshdup xmm1, xmm0
0x1001a315d: vaddss xmm1, xmm0, xmm1
0x1001a3161: vpermilpd xmm0, xmm0, 1
0x1001a3167: vaddss xmm0, xmm0, xmm1
0x1001a316b: vsqrtss xmm0, xmm0, xmm0
0x1001a316f: vucomiss xmm0, dword ptr [rip + 0x90474d] ; 0x100aa78c4
0x1001a3177: jbe 0x1001a3183
0x1001a3179: vpermilps xmm0, xmm0, 0xc0
0x1001a317f: vdivps xmm2, xmm2, xmm0
0x1001a3183: vmovaps xmmword ptr [rbp - 0x70], xmm2
0x1001a3188: vmulps xmm0, xmm2, xmmword ptr [rip + 0x904f10] ; 0x100aa80a0
0x1001a3190: vmovshdup xmm1, xmm0
0x1001a3194: vaddss xmm1, xmm0, xmm1
0x1001a3198: vpermilpd xmm0, xmm0, 1
0x1001a319e: vaddss xmm0, xmm0, xmm1
0x1001a31a2: vmovss xmm1, dword ptr [rip + 0x901f1a] ; 0x100aa50c4
0x1001a31aa: vmaxss xmm0, xmm1, xmm0
0x1001a31ae: vmovss xmm1, dword ptr [rip + 0x901f0a] ; 0x100aa50c0
0x1001a31b6: vminss xmm0, xmm1, xmm0
0x1001a31ba: call 0x100aa2576 ; 0x100aa2576 _acosf
0x1001a31bf: vucomiss xmm0, dword ptr [rip + 0x90a78d] ; 0x100aad954
0x1001a31c7: jbe 0x1001a321e
0x1001a31c9: vaddss xmm1, xmm0, dword ptr [rip + 0x901eef] ; 0x100aa50c0
0x1001a31d1: vandps xmm1, xmm1, xmmword ptr [rip + 0x904737] ; 0x100aa7910
0x1001a31d9: vmovss xmm4, dword ptr [rip + 0x9046e3] ; 0x100aa78c4
0x1001a31e1: vucomiss xmm4, xmm1
0x1001a31e5: vmovss xmm1, dword ptr [rip + 0x901ed3] ; 0x100aa50c0
0x1001a31ed: jae 0x1001a31f7
0x1001a31ef: vmovaps xmm1, xmmword ptr [rip + 0x904ea9] ; 0x100aa80a0
0x1001a31f7: vaddss xmm0, xmm0, dword ptr [rip + 0x90a75d] ; 0x100aad95c
0x1001a31ff: vmovaps xmm3, xmmword ptr [rbp - 0x70]
0x1001a3204: vpermilps xmm2, xmm3, 0xd2
0x1001a320a: vmulps xmm2, xmm2, xmm1
0x1001a320e: vpermilps xmm1, xmm1, 0xd2
0x1001a3214: vmulps xmm1, xmm3, xmm1
0x1001a3218: vsubps xmm1, xmm2, xmm1
0x1001a321c: jmp 0x1001a3283 ; 0x1001a3283
0x1001a321e: vmovss xmm1, dword ptr [rip + 0x90a732] ; 0x100aad958
0x1001a3226: vucomiss xmm1, xmm0
0x1001a322a: mov rax, qword ptr [rbp - 0x48]
0x1001a322e: vmovss xmm4, dword ptr [rip + 0x90468e] ; 0x100aa78c4
0x1001a3236: jbe 0x1001a339a
0x1001a323c: vaddss xmm2, xmm0, dword ptr [rip + 0x901e80] ; 0x100aa50c4
0x1001a3244: vandps xmm2, xmm2, xmmword ptr [rip + 0x9046c4] ; 0x100aa7910
0x1001a324c: vucomiss xmm4, xmm2
0x1001a3250: vmovss xmm2, dword ptr [rip + 0x901e68] ; 0x100aa50c0
0x1001a3258: vmovaps xmm3, xmmword ptr [rbp - 0x70]
0x1001a325d: jae 0x1001a3267
0x1001a325f: vmovaps xmm2, xmmword ptr [rip + 0x904e39] ; 0x100aa80a0
0x1001a3267: vsubss xmm0, xmm1, xmm0
0x1001a326b: vpermilps xmm1, xmm2, 0xd2
0x1001a3271: vmulps xmm1, xmm3, xmm1
0x1001a3275: vpermilps xmm3, xmm3, 0xd2
0x1001a327b: vmulps xmm2, xmm3, xmm2
0x1001a327f: vsubps xmm1, xmm1, xmm2
0x1001a3283: vpermilps xmm3, xmm1, 0xd2
0x1001a3289: vmulps xmm1, xmm1, xmm1
0x1001a328d: vpermilpd xmm2, xmm1, 1
0x1001a3293: vaddss xmm2, xmm2, xmm1
0x1001a3297: vmovshdup xmm1, xmm1
0x1001a329b: vaddss xmm1, xmm1, xmm2
0x1001a329f: vsqrtss xmm1, xmm1, xmm1
0x1001a32a3: vucomiss xmm1, xmm4
0x1001a32a7: jbe 0x1001a32b3
0x1001a32a9: vpermilps xmm1, xmm1, 0xc0
0x1001a32af: vdivps xmm3, xmm3, xmm1
0x1001a32b3: vmovaps xmmword ptr [rbp - 0x60], xmm3
0x1001a32b8: call 0x100aa250a ; 0x100aa250a ___sincosf_stret
0x1001a32bd: vmovshdup xmm14, xmm0
0x1001a32c1: vmovaps xmm1, xmmword ptr [rbp - 0x60]
0x1001a32c6: vmovshdup xmm2, xmm1
0x1001a32ca: vpermilpd xmm3, xmm1, 1
0x1001a32d0: vmulss xmm4, xmm1, xmm2
0x1001a32d4: vmulss xmm8, xmm2, xmm3
0x1001a32d8: vmulss xmm9, xmm3, xmm1
0x1001a32dc: vmovss xmm5, dword ptr [rip + 0x901ddc] ; 0x100aa50c0
0x1001a32e4: vsubss xmm7, xmm5, xmm14
0x1001a32e9: vmulss xmm5, xmm1, xmm1
0x1001a32ed: vmulss xmm5, xmm5, xmm7
0x1001a32f1: vaddss xmm10, xmm14, xmm5
0x1001a32f5: vmulss xmm4, xmm4, xmm7
0x1001a32f9: vmulss xmm6, xmm0, xmm3
0x1001a32fd: vaddss xmm11, xmm6, xmm4
0x1001a3301: vmulss xmm9, xmm9, xmm7
0x1001a3305: vmulss xmm13, xmm0, xmm2
0x1001a3309: vsubss xmm12, xmm9, xmm13
0x1001a330e: vinsertps xmm5, xmm10, xmm11, 0x10
0x1001a3314: vinsertps xmm10, xmm5, xmm12, 0x20
0x1001a331a: vsubss xmm4, xmm4, xmm6
0x1001a331e: vmulss xmm2, xmm2, xmm2
0x1001a3322: vmulss xmm2, xmm2, xmm7
0x1001a3326: vaddss xmm2, xmm14, xmm2
0x1001a332a: vmulss xmm6, xmm8, xmm7
0x1001a332e: vmulss xmm0, xmm0, xmm1
0x1001a3332: vaddss xmm5, xmm0, xmm6
0x1001a3336: vinsertps xmm2, xmm4, xmm2, 0x10
0x1001a333c: vinsertps xmm2, xmm2, xmm5, 0x20
0x1001a3342: vaddss xmm4, xmm13, xmm9
0x1001a3347: vsubss xmm0, xmm6, xmm0
0x1001a334b: vmulss xmm3, xmm3, xmm3
0x1001a334f: vmulss xmm3, xmm3, xmm7
0x1001a3353: vaddss xmm1, xmm14, xmm3
0x1001a3357: vinsertps xmm0, xmm4, xmm0, 0x10
0x1001a335d: vinsertps xmm0, xmm0, xmm1, 0x20
0x1001a3363: vmovaps xmm4, xmmword ptr [rbp - 0x70]
0x1001a3368: vpermilps xmm1, xmm4, 0xc0
0x1001a336e: vmulps xmm1, xmm1, xmm10
0x1001a3373: vpermilps xmm3, xmm4, 0xd5
0x1001a3379: vmulps xmm2, xmm2, xmm3
0x1001a337d: vaddps xmm1, xmm2, xmm1
0x1001a3381: vpermilps xmm2, xmm4, 0xea
0x1001a3387: vmulps xmm0, xmm0, xmm2
0x1001a338b: vaddps xmm1, xmm0, xmm1
0x1001a338f: vmovaps xmm4, xmmword ptr [rbp - 0x80]
0x1001a3394: mov rax, qword ptr [rbp - 0x48]
0x1001a3398: jmp 0x1001a33a4 ; 0x1001a33a4
0x1001a339a: vmovaps xmm4, xmmword ptr [rbp - 0x80]
0x1001a339f: vmovaps xmm1, xmmword ptr [rbp - 0x70]
0x1001a33a4: vbroadcastss xmm0, dword ptr [rax]
0x1001a33a9: vmulps xmm0, xmm1, xmm0
0x1001a33ad: mov rax, qword ptr [rbp - 0x50]
0x1001a33b1: vmovaps xmmword ptr [rax], xmm0
0x1001a33b5: cmp byte ptr [rbx + 0x48], 0
0x1001a33b9: je 0x1001a2f6a
0x1001a33bf: vmovaps xmm1, xmmword ptr [rbx + 0x30]
0x1001a33c4: vmovaps xmmword ptr [rbp - 0x90], xmm1
0x1001a33cc: vmovaps xmm0, xmmword ptr [r12 + 0x10]
0x1001a33d3: vsubps xmm1, xmm1, xmm0
0x1001a33d7: vmulps xmm2, xmm1, xmm1
0x1001a33db: vmovshdup xmm3, xmm2
0x1001a33df: vaddss xmm3, xmm2, xmm3
0x1001a33e3: vpermilpd xmm2, xmm2, 1
0x1001a33e9: vaddss xmm2, xmm2, xmm3
0x1001a33ed: vmovss xmm3, dword ptr [rip + 0x9095af] ; 0x100aac9a4
0x1001a33f5: vucomiss xmm3, xmm2
0x1001a33f9: jbe 0x1001a3413
0x1001a33fb: vmulps xmm1, xmm1, xmmword ptr [rbp - 0xb0]
0x1001a3403: vaddps xmm0, xmm0, xmm1
0x1001a3407: vmovaps xmmword ptr [r12 + 0x10], xmm0
0x1001a340e: jmp 0x1001a2f6a ; 0x1001a2f6a
0x1001a3413: vmovss xmm0, dword ptr [rip + 0x90521d] ; 0x100aa8638
0x1001a341b: vucomiss xmm0, xmm2
0x1001a341f: jbe 0x1001a2f6a
0x1001a3425: vmovss xmm0, dword ptr [r12 + 0x510]
0x1001a342f: vxorps xmm1, xmm1, xmm1
0x1001a3433: vucomiss xmm1, xmm0
0x1001a3437: jae 0x1001a344c
0x1001a3439: vsubss xmm0, xmm0, xmm4
0x1001a343d: vmovss dword ptr [r12 + 0x510], xmm0
0x1001a3447: jmp 0x1001a2f6a ; 0x1001a2f6a
0x1001a344c: mov rdi, qword ptr [r13 + 0x220]
0x1001a3453: lea r8, [rip + 0x3396] ; 0x1001a67f0
0x1001a345a: lea rsi, [rbp - 0x90]
0x1001a3461: vmovss xmm0, dword ptr [rip + 0x903c8b] ; 0x100aa70f4
0x1001a3469: lea rdx, [rbp - 0x40]
0x1001a346d: xor ebx, ebx
0x1001a346f: mov ecx, 2
0x1001a3474: xor r9d, r9d
0x1001a3477: call 0x1004ce4b0 ; 0x1004ce4b0
0x1001a347c: test eax, eax
0x1001a347e: je 0x1001a349d
0x1001a3480: mov ecx, ebx
0x1001a3482: cmp qword ptr [rbp + rcx*8 - 0x40], r12
0x1001a3487: jne 0x1001a3491
0x1001a3489: inc ebx
0x1001a348b: cmp ebx, eax
0x1001a348d: jb 0x1001a3480
0x1001a348f: jmp 0x1001a349d ; 0x1001a349d
0x1001a3491: mov dword ptr [r12 + 0x50c], 0
0x1001a349d: mov dword ptr [r12 + 0x510], 0x3fc00000
0x1001a34a9: jmp 0x1001a2f6a ; 0x1001a2f6a
0x1001a34ae: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1001a34b3: nop word ptr cs:[rax + rax]
