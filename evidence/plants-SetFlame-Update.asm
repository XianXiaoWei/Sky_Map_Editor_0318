0x100343280: push rbp
0x100343281: mov rbp, rsp
0x100343284: push r15
0x100343286: push r14
0x100343288: push r13
0x10034328a: push r12
0x10034328c: push rbx
0x10034328d: sub rsp, 0x88
0x100343294: mov qword ptr [rbp - 0x80], rsi
0x100343298: mov rax, qword ptr [rsi + 0x160]
0x10034329f: vmovss xmm3, dword ptr [rax + 0x14]
0x1003432a4: vmovss xmm4, dword ptr [rax + 0x20]
0x1003432a9: lea rax, [rip + 0x1cb7e20] ; 0x101ffb0d0
0x1003432b0: mov al, byte ptr [rax]
0x1003432b2: lea rcx, [rip + 0x975287] ; 0x100cb8540
0x1003432b9: vmovss xmm0, dword ptr [rcx]
0x1003432bd: test al, al
0x1003432bf: je 0x1003432c7
0x1003432c1: vmovaps xmm1, xmm0
0x1003432c5: jmp 0x1003432cf ; 0x1003432cf
0x1003432c7: vmovss xmm1, dword ptr [rip + 0x761df1] ; 0x100aa50c0
0x1003432cf: vmulss xmm1, xmm4, xmm1
0x1003432d3: vmulss xmm1, xmm3, xmm1
0x1003432d7: vmovss xmm2, dword ptr [rip + 0x7637bd] ; 0x100aa6a9c
0x1003432df: vmaxss xmm1, xmm2, xmm1
0x1003432e3: vmovss xmm2, dword ptr [rip + 0x7637b5] ; 0x100aa6aa0
0x1003432eb: vminss xmm1, xmm2, xmm1
0x1003432ef: vaddss xmm1, xmm1, dword ptr [rdi + 0x4c]
0x1003432f4: vmovss dword ptr [rdi + 0x4c], xmm1
0x1003432f9: mov rcx, qword ptr [rdi + 0x40]
0x1003432fd: cmp dword ptr [rcx + 0x10], 0
0x100343301: je 0x10034365f
0x100343307: vmovaps xmmword ptr [rbp - 0x70], xmm1
0x10034330c: lea r12, [rdi + 0x48]
0x100343310: lea rsi, [rdi + 0x3c]
0x100343314: xor ebx, ebx
0x100343316: lea r15, [rbp - 0x40]
0x10034331a: mov qword ptr [rbp - 0x38], rdi
0x10034331e: mov qword ptr [rbp - 0x78], r12
0x100343322: mov qword ptr [rbp - 0x48], rsi
0x100343326: jmp 0x100343363 ; 0x100343363
0x100343328: nop dword ptr [rax + rax]
0x100343330: vmovaps xmmword ptr [rbp - 0x70], xmm1
0x100343335: mov rax, qword ptr [rbp - 0x80]
0x100343339: mov rax, qword ptr [rax + 0x160]
0x100343340: vmovss xmm3, dword ptr [rax + 0x14]
0x100343345: vmovss xmm4, dword ptr [rax + 0x20]
0x10034334a: lea rax, [rip + 0x1cb7d7f] ; 0x101ffb0d0
0x100343351: movzx eax, byte ptr [rax]
0x100343354: lea rdx, [rip + 0x9751e5] ; 0x100cb8540
0x10034335b: vmovss xmm0, dword ptr [rdx]
0x10034335f: mov r12, qword ptr [rbp - 0x78]
0x100343363: vmovss dword ptr [rbp - 0x50], xmm4
0x100343368: vmovss dword ptr [rbp - 0x54], xmm3
0x10034336d: mov ebx, ebx
0x10034336f: vcvtsi2ss xmm1, xmm5, rbx
0x100343374: vmulss xmm1, xmm1, dword ptr [r12]
0x10034337a: vmovaps xmmword ptr [rbp - 0xa0], xmm1
0x100343382: vmovss xmm1, dword ptr [rip + 0x761d36] ; 0x100aa50c0
0x10034338a: test al, al
0x10034338c: je 0x100343392
0x10034338e: vmovaps xmm1, xmm0
0x100343392: vmovss dword ptr [rbp - 0x4c], xmm1
0x100343397: vbroadcastss xmm0, dword ptr [rsi]
0x10034339c: vmovaps xmmword ptr [rbp - 0xb0], xmm0
0x1003433a4: mov rax, qword ptr [rcx + 8]
0x1003433a8: mov rax, qword ptr [rax + rbx*8]
0x1003433ac: mov qword ptr [rbp - 0x40], rax
0x1003433b0: call 0x1007abc10 ; 0x1007abc10
0x1003433b5: mov r14, rax
0x1003433b8: mov qword ptr [rbp - 0x30], 0
0x1003433c0: call 0x1007abc10 ; 0x1007abc10
0x1003433c5: mov r8, qword ptr [rax]
0x1003433c8: mov rdi, rax
0x1003433cb: lea r13, [rbp - 0x30]
0x1003433cf: mov rsi, r13
0x1003433d2: mov rdx, r15
0x1003433d5: mov rcx, r14
0x1003433d8: call qword ptr [r8 + 0x40]
0x1003433dc: mov rax, qword ptr [rbp - 0x30]
0x1003433e0: test rax, rax
0x1003433e3: je 0x100343690
0x1003433e9: mov qword ptr [rbp - 0x40], rax
0x1003433ed: call 0x1007abc10 ; 0x1007abc10
0x1003433f2: mov qword ptr [rbp - 0x30], 0
0x1003433fa: mov rdi, qword ptr [rip + 0x1ab208f] ; 0x101df5490
0x100343401: mov r8, qword ptr [rdi]
0x100343404: mov rsi, r13
0x100343407: mov rdx, r15
0x10034340a: mov rcx, rax
0x10034340d: call qword ptr [r8 + 0x40]
0x100343411: mov rax, qword ptr [rbp - 0x38]
0x100343415: mov rax, qword ptr [rax + 0x40]
0x100343419: cmp dword ptr [rax + 0x10], ebx
0x10034341c: jbe 0x1003436af
0x100343422: mov r12, qword ptr [rbp - 0x30]
0x100343426: mov rax, qword ptr [rax + 8]
0x10034342a: mov qword ptr [rbp - 0x88], rbx
0x100343431: mov rax, qword ptr [rax + rbx*8]
0x100343435: mov qword ptr [rbp - 0x40], rax
0x100343439: call 0x1007abc10 ; 0x1007abc10
0x10034343e: mov r14, rax
0x100343441: mov qword ptr [rbp - 0x30], 0
0x100343449: call 0x1007abc10 ; 0x1007abc10
0x10034344e: mov rbx, qword ptr [rax]
0x100343451: mov rdi, rax
0x100343454: mov rsi, r13
0x100343457: mov rdx, r15
0x10034345a: mov rcx, r14
0x10034345d: call qword ptr [rbx + 0x40]
0x100343460: mov rax, qword ptr [rbp - 0x30]
0x100343464: test rax, rax
0x100343467: je 0x100343690
0x10034346d: vmovss xmm0, dword ptr [rbp - 0x4c]
0x100343472: vmulss xmm0, xmm0, dword ptr [rbp - 0x50]
0x100343477: vmulss xmm0, xmm0, dword ptr [rbp - 0x54]
0x10034347c: vmovss xmm1, dword ptr [rip + 0x763618] ; 0x100aa6a9c
0x100343484: vmaxss xmm0, xmm1, xmm0
0x100343488: vmovss xmm1, dword ptr [rip + 0x763610] ; 0x100aa6aa0
0x100343490: vminss xmm0, xmm1, xmm0
0x100343494: vmovaps xmm1, xmmword ptr [rbp - 0x70]
0x100343499: vsubss xmm0, xmm1, xmm0
0x10034349d: vinsertps xmm0, xmm0, xmm1, 0x10
0x1003434a3: vmovsldup xmm1, xmmword ptr [rbp - 0xa0]
0x1003434ab: vsubps xmm0, xmm0, xmm1
0x1003434af: vxorps xmm1, xmm1, xmm1
0x1003434b3: vmaxps xmm0, xmm1, xmm0
0x1003434b7: vmovaps xmmword ptr [rbp - 0x70], xmm0
0x1003434bc: mov qword ptr [rbp - 0x40], rax
0x1003434c0: call 0x1007abc10 ; 0x1007abc10
0x1003434c5: mov r14, rax
0x1003434c8: mov qword ptr [rbp - 0x30], 0
0x1003434d0: call 0x1001e8c00 ; 0x1001e8c00
0x1003434d5: mov rbx, qword ptr [rax]
0x1003434d8: mov rdi, rax
0x1003434db: mov rsi, r13
0x1003434de: mov rdx, r15
0x1003434e1: mov rcx, r14
0x1003434e4: call qword ptr [rbx + 0x40]
0x1003434e7: mov r14, qword ptr [rbp - 0x30]
0x1003434eb: test r14, r14
0x1003434ee: je 0x1003434ff
0x1003434f0: mov rax, qword ptr [r14 + 0x90]
0x1003434f7: mov rax, qword ptr [rax + 0x40]
0x1003434fb: mov r12, qword ptr [rax + 0x10]
0x1003434ff: vmovaps xmm0, xmmword ptr [rbp - 0xb0]
0x100343507: vminps xmm3, xmm0, xmmword ptr [rbp - 0x70]
0x10034350c: mov rsi, qword ptr [rbp - 0x48]
0x100343510: vmovss xmm0, dword ptr [rsi]
0x100343514: vucomiss xmm0, dword ptr [rip + 0x763bc8] ; 0x100aa70e4
0x10034351c: mov rdi, qword ptr [rbp - 0x38]
0x100343520: mov rbx, qword ptr [rbp - 0x88]
0x100343527: jbe 0x1003435b0
0x10034352d: cmp byte ptr [rdi + 0x38], 0
0x100343531: je 0x10034354d
0x100343533: vmovshdup xmm1, xmm3
0x100343537: vmulss xmm1, xmm1, dword ptr [rip + 0x766f69] ; 0x100aaa4a8
0x10034353f: vdivss xmm0, xmm1, xmm0
0x100343543: vaddss xmm0, xmm0, dword ptr [rip + 0x76429d] ; 0x100aa77e8
0x10034354b: jmp 0x100343566 ; 0x100343566
0x10034354d: vmovss xmm1, dword ptr [rip + 0x766f53] ; 0x100aaa4a8
0x100343555: vmovaps xmm2, xmm1
0x100343559: vmulss xmm1, xmm2, dword ptr [rdi + 0x4c]
0x10034355e: vdivss xmm0, xmm1, xmm0
0x100343562: vsubss xmm0, xmm2, xmm0
0x100343566: vmovss dword ptr [r12 + 0x110], xmm0
0x100343570: vxorps xmm1, xmm1, xmm1
0x100343574: vucomiss xmm1, xmm0
0x100343578: jb 0x1003435b0
0x10034357a: cmp byte ptr [r12 + 0xb6], 0
0x100343583: je 0x1003435b0
0x100343585: mov esi, 1
0x10034358a: mov rdi, r12
0x10034358d: vmovaps xmmword ptr [rbp - 0x70], xmm3
0x100343592: call 0x10033a780 ; 0x10033a780
0x100343597: vmovaps xmm3, xmmword ptr [rbp - 0x70]
0x10034359c: mov rdi, qword ptr [rbp - 0x38]
0x1003435a0: mov rsi, qword ptr [rbp - 0x48]
0x1003435a4: nop word ptr cs:[rax + rax]
0x1003435b0: vmovss xmm0, dword ptr [rsi]
0x1003435b4: vxorps xmm1, xmm1, xmm1
0x1003435b8: vucomiss xmm1, xmm0
0x1003435bc: setp r8b
0x1003435c0: setne al
0x1003435c3: vmovshdup xmm1, xmm3
0x1003435c7: vucomiss xmm3, xmm1
0x1003435cb: setnp cl
0x1003435ce: sete dl
0x1003435d1: vucomiss xmm1, xmm0
0x1003435d5: jb 0x10034361e
0x1003435d7: or al, r8b
0x1003435da: and dl, cl
0x1003435dc: and dl, al
0x1003435de: jne 0x10034361e
0x1003435e0: cmp byte ptr [rdi + 0x38], 0
0x1003435e4: je 0x100343636
0x1003435e6: mov byte ptr [r12 + 0xb6], 1
0x1003435ef: mov dword ptr [r12 + 0x110], 0x3f800000
0x1003435fb: mov byte ptr [r12 + 0xb9], 1
0x100343604: test r14, r14
0x100343607: je 0x10034361e
0x100343609: movzx eax, byte ptr [rdi + 0x38]
0x10034360d: mov rcx, qword ptr [r14 + 0x90]
0x100343614: mov byte ptr [rcx + 0x61], al
0x100343617: mov byte ptr [r14 + 0xa1], al
0x10034361e: inc ebx
0x100343620: mov rcx, qword ptr [rdi + 0x40]
0x100343624: mov eax, dword ptr [rcx + 0x10]
0x100343627: vmovss xmm1, dword ptr [rdi + 0x4c]
0x10034362c: cmp ebx, eax
0x10034362e: jb 0x100343330
0x100343634: jmp 0x100343652 ; 0x100343652
0x100343636: mov esi, 1
0x10034363b: mov rdi, r12
0x10034363e: call 0x10033a780 ; 0x10033a780
0x100343643: mov rdi, qword ptr [rbp - 0x38]
0x100343647: mov rsi, qword ptr [rbp - 0x48]
0x10034364b: test r14, r14
0x10034364e: jne 0x100343609
0x100343650: jmp 0x10034361e ; 0x10034361e
0x100343652: mov eax, eax
0x100343654: vcvtsi2ss xmm0, xmm5, rax
0x100343659: mov rax, qword ptr [rbp - 0x78]
0x10034365d: jmp 0x10034366b ; 0x10034366b
0x10034365f: lea rsi, [rdi + 0x3c]
0x100343663: lea rax, [rdi + 0x48]
0x100343667: vxorps xmm0, xmm0, xmm0
0x10034366b: vmulss xmm0, xmm0, dword ptr [rax]
0x10034366f: vaddss xmm0, xmm0, dword ptr [rsi]
0x100343673: vucomiss xmm1, xmm0
0x100343677: jb 0x10034367e
0x100343679: call 0x10032ef60 ; 0x10032ef60
0x10034367e: add rsp, 0x88
0x100343685: pop rbx
0x100343686: pop r12
0x100343688: pop r13
0x10034368a: pop r14
0x10034368c: pop r15
0x10034368e: pop rbp
0x10034368f: ret 
0x100343690: lea rdi, [rip + 0x81e461] ; 0x100b61af8 ret
0x100343697: lea rsi, [rip + 0x81e2c5] ; 0x100b61963 ./Clump.h
0x10034369e: mov edx, 0x47
0x1003436a3: mov ecx, 3
0x1003436a8: call 0x1007e5f70 ; 0x1007e5f70
0x1003436ad: ud2 
0x1003436af: lea rdi, [rip + 0x81e2a2] ; 0x100b61958 idx < size
0x1003436b6: lea rsi, [rip + 0x81e2a6] ; 0x100b61963 ./Clump.h
0x1003436bd: mov edx, 0x36
0x1003436c2: mov ecx, 3
0x1003436c7: call 0x1007e5f70 ; 0x1007e5f70
0x1003436cc: ud2 
0x1003436ce: nop 
