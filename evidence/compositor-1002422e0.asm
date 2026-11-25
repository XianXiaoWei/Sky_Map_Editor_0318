0x1002422e0: push rbp
0x1002422e1: mov rbp, rsp
0x1002422e4: push r15
0x1002422e6: push r14
0x1002422e8: push r13
0x1002422ea: push r12
0x1002422ec: push rbx
0x1002422ed: sub rsp, 0xfa048
0x1002422f4: mov qword ptr [rbp - 0xfa058], r8
0x1002422fb: mov qword ptr [rbp - 0xfa060], rsi
0x100242302: mov r14, rdi
0x100242305: mov rax, qword ptr [rip + 0x9cb5cc] ; 0x100c0d8d8
0x10024230c: mov rax, qword ptr [rax]
0x10024230f: mov qword ptr [rbp - 0x30], rax
0x100242313: mov eax, ecx
0x100242315: imul eax, edx
0x100242318: mov dword ptr [rbp - 0xfa044], eax
0x10024231e: cmp eax, 0xa001
0x100242323: jae 0x100242776
0x100242329: lea eax, [rdx - 1]
0x10024232c: lea esi, [rcx - 1]
0x10024232f: imul esi, eax
0x100242332: cmp esi, 0x7801
0x100242338: jae 0x100242795
0x10024233e: mov dword ptr [r14 + 0x1830], edx
0x100242345: mov dword ptr [r14 + 0x1834], ecx
0x10024234c: xor ebx, ebx
0x10024234e: lea r15, [rbp - 0xa0030]
0x100242355: vmovss xmm7, dword ptr [rip + 0x862d67] ; 0x100aa50c4
0x10024235d: mov qword ptr [rbp - 0xfa050], r14
0x100242364: nop word ptr cs:[rax + rax]
0x100242370: vmovss xmm0, dword ptr [rip + 0x864734] ; 0x100aa6aac
0x100242378: test rbx, rbx
0x10024237b: jne 0x1002423ac
0x10024237d: mov rax, qword ptr [rbp - 0xfa058]
0x100242384: vmovss xmm0, dword ptr [rax + 0x260]
0x10024238c: vmovss xmm1, dword ptr [rax + 0x264]
0x100242394: vdivss xmm0, xmm0, dword ptr [rax + 0x298]
0x10024239c: vdivss xmm0, xmm1, xmm0
0x1002423a0: vmovss xmm1, dword ptr [rip + 0x864704] ; 0x100aa6aac
0x1002423a8: vdivss xmm0, xmm1, xmm0
0x1002423ac: imul r9, rbx, 0x438
0x1002423b3: mov edi, dword ptr [r14 + 0x1830]
0x1002423ba: mov esi, dword ptr [r14 + 0x1834]
0x1002423c1: test rsi, rsi
0x1002423c4: mov qword ptr [rbp - 0xfa070], rbx
0x1002423cb: je 0x100242490
0x1002423d1: test edi, edi
0x1002423d3: je 0x1002424a0
0x1002423d9: vmulss xmm1, xmm0, dword ptr [rip + 0x8621d7] ; 0x100aa45b8
0x1002423e1: lea eax, [rsi - 1]
0x1002423e4: vcvtsi2ss xmm2, xmm8, rax
0x1002423e9: lea eax, [rdi - 1]
0x1002423ec: vcvtsi2ss xmm3, xmm8, rax
0x1002423f1: vxorps xmm4, xmm4, xmm4
0x1002423f5: vdivss xmm4, xmm4, xmm3
0x1002423f9: vaddss xmm4, xmm4, xmm7
0x1002423fd: xor eax, eax
0x1002423ff: xor r8d, r8d
0x100242402: nop word ptr cs:[rax + rax]
0x100242410: mov edx, edi
0x100242412: imul edx, r8d
0x100242416: mov ebx, r8d
0x100242419: vcvtsi2ss xmm5, xmm8, rbx
0x10024241e: vmulss xmm5, xmm0, xmm5
0x100242422: vdivss xmm5, xmm5, xmm2
0x100242426: vsubss xmm5, xmm5, xmm1
0x10024242a: vmovss dword ptr [rbp + rdx*8 - 0x50030], xmm4
0x100242433: vmovss dword ptr [rbp + rdx*8 - 0x5002c], xmm5
0x10024243c: cmp edi, 1
0x10024243f: je 0x10024247e
0x100242441: mov edx, 1
0x100242446: nop word ptr cs:[rax + rax]
0x100242450: lea ebx, [rax + rdx]
0x100242453: mov ecx, edx
0x100242455: vcvtsi2ss xmm6, xmm8, rcx
0x10024245a: vaddss xmm6, xmm6, xmm6
0x10024245e: vdivss xmm6, xmm6, xmm3
0x100242462: vaddss xmm6, xmm6, xmm7
0x100242466: vmovss dword ptr [rbp + rbx*8 - 0x50030], xmm6
0x10024246f: vmovss dword ptr [rbp + rbx*8 - 0x5002c], xmm5
0x100242478: inc edx
0x10024247a: cmp edx, edi
0x10024247c: jb 0x100242450
0x10024247e: inc r8
0x100242481: add eax, edi
0x100242483: cmp r8, rsi
0x100242486: jb 0x100242410
0x100242488: jmp 0x1002424a2 ; 0x1002424a2
0x10024248a: nop word ptr [rax + rax]
0x100242490: xor esi, esi
0x100242492: jmp 0x1002424a2 ; 0x1002424a2
0x100242494: nop word ptr cs:[rax + rax]
0x1002424a0: xor edi, edi
0x1002424a2: add r9, r14
0x1002424a5: mov qword ptr [rbp - 0xfa068], r9
0x1002424ac: mov rax, qword ptr [rbp - 0xfa060]
0x1002424b3: vmovss xmm1, dword ptr [rax + 4]
0x1002424b8: vmovss xmm0, dword ptr [rax + 8]
0x1002424bd: mov rdx, r15
0x1002424c0: call 0x100242120 ; 0x100242120
0x1002424c5: mov eax, dword ptr [r14 + 0x1834]
0x1002424cc: mov qword ptr [rbp - 0xfa040], rax
0x1002424d3: cmp eax, 1
0x1002424d6: je 0x100242632
0x1002424dc: mov rax, qword ptr [rbp - 0xfa050]
0x1002424e3: mov r10d, dword ptr [rax + 0x1830]
0x1002424ea: mov r8d, r10d
0x1002424ed: dec r8d
0x1002424f0: je 0x100242632
0x1002424f6: mov rax, qword ptr [rbp - 0xfa040]
0x1002424fd: dec eax
0x1002424ff: mov qword ptr [rbp - 0xfa040], rax
0x100242506: lea r9d, [r10 + 1]
0x10024250a: lea edi, [r10 + 2]
0x10024250e: lea eax, [r10 + r10*2]
0x100242512: lea eax, [rax + rax - 6]
0x100242516: mov dword ptr [rbp - 0xfa048], eax
0x10024251c: xor ebx, ebx
0x10024251e: mov r11d, 0xb
0x100242524: xor r14d, r14d
0x100242527: nop word ptr [rax + rax]
0x100242530: mov eax, r8d
0x100242533: imul eax, r14d
0x100242537: mov ecx, r10d
0x10024253a: imul ecx, r14d
0x10024253e: add eax, eax
0x100242540: lea r15d, [rax + rax*2]
0x100242544: lea r12d, [rcx + 1]
0x100242548: mov word ptr [rbp + r15*2 - 0xfa030], cx
0x100242551: or r15d, 1
0x100242555: lea r13d, [rcx + r10]
0x100242559: mov word ptr [rbp + r15*2 - 0xfa030], r12w
0x100242562: lea r15d, [rcx + r10 + 1]
0x100242567: lea edx, [rax + rax*2 + 2]
0x10024256b: mov word ptr [rbp + rdx*2 - 0xfa030], r15w
0x100242574: lea edx, [rax + rax*2 + 3]
0x100242578: mov word ptr [rbp + rdx*2 - 0xfa030], cx
0x100242580: lea ecx, [rax + rax*2 + 4]
0x100242584: mov word ptr [rbp + rcx*2 - 0xfa030], r15w
0x10024258d: lea eax, [rax + rax*2 + 5]
0x100242591: mov word ptr [rbp + rax*2 - 0xfa030], r13w
0x10024259a: cmp r8d, 1
0x10024259e: je 0x100242612
0x1002425a0: mov eax, 1
0x1002425a5: mov r15d, r11d
0x1002425a8: nop dword ptr [rax + rax]
0x1002425b0: lea ecx, [rbx + rax]
0x1002425b3: lea edx, [r15 - 5]
0x1002425b7: mov word ptr [rbp + rdx*2 - 0xfa030], cx
0x1002425bf: lea edx, [rbx + rax + 1]
0x1002425c3: lea esi, [r15 - 4]
0x1002425c7: mov word ptr [rbp + rsi*2 - 0xfa030], dx
0x1002425cf: lea edx, [rdi + rax - 1]
0x1002425d3: lea esi, [r15 - 3]
0x1002425d7: mov word ptr [rbp + rsi*2 - 0xfa030], dx
0x1002425df: lea esi, [r15 - 2]
0x1002425e3: mov word ptr [rbp + rsi*2 - 0xfa030], cx
0x1002425eb: lea ecx, [r15 - 1]
0x1002425ef: mov word ptr [rbp + rcx*2 - 0xfa030], dx
0x1002425f7: lea ecx, [r9 + rax - 1]
0x1002425fc: mov edx, r15d
0x1002425ff: mov word ptr [rbp + rdx*2 - 0xfa030], cx
0x100242607: inc eax
0x100242609: add r15d, 6
0x10024260d: cmp eax, r8d
0x100242610: jb 0x1002425b0
0x100242612: inc r14
0x100242615: add r9d, r10d
0x100242618: add edi, r10d
0x10024261b: add ebx, r10d
0x10024261e: add r11d, dword ptr [rbp - 0xfa048]
0x100242625: cmp r14, qword ptr [rbp - 0xfa040]
0x10024262c: jb 0x100242530
0x100242632: mov r12, qword ptr [rbp - 0xfa068]
0x100242639: mov rdi, r12
0x10024263c: call 0x1007f5250 ; 0x1007f5250
0x100242641: mov rbx, qword ptr [rbp - 0xfa070]
0x100242648: test rbx, rbx
0x10024264b: lea rsi, [rip + 0x939585] ; 0x100b7bbd7 LensDistortionMeshScreenshot
0x100242652: lea rax, [rip + 0x93956b] ; 0x100b7bbc4 LensDistortionMesh
0x100242659: cmove rsi, rax
0x10024265d: mov rdi, r12
0x100242660: mov edx, dword ptr [rbp - 0xfa044]
0x100242666: call 0x1007f53c0 ; 0x1007f53c0
0x10024266b: movabs rax, 0x100000002
0x100242675: mov qword ptr [rbp - 0xfa038], rax
0x10024267c: xor esi, esi
0x10024267e: mov r8d, 1
0x100242684: mov r9d, 1
0x10024268a: mov rdi, r12
0x10024268d: lea r14, [rbp - 0xfa038]
0x100242694: mov rdx, r14
0x100242697: lea rcx, [rbp - 0xfa034]
0x10024269e: lea rax, [rbp - 0x50030]
0x1002426a5: push rax
0x1002426a6: push 0
0x1002426a8: call 0x1007f5430 ; 0x1007f5430
0x1002426ad: add rsp, 0x10
0x1002426b1: movabs rax, 0x500000002
0x1002426bb: mov qword ptr [rbp - 0xfa038], rax
0x1002426c2: mov esi, 1
0x1002426c7: mov r8d, 1
0x1002426cd: mov r9d, 2
0x1002426d3: mov rdi, r12
0x1002426d6: mov rdx, r14
0x1002426d9: lea rcx, [rbp - 0xfa034]
0x1002426e0: lea r15, [rbp - 0xa0030]
0x1002426e7: push r15
0x1002426e9: push 0
0x1002426eb: call 0x1007f5430 ; 0x1007f5430
0x1002426f0: add rsp, 0x10
0x1002426f4: mov r14, qword ptr [rbp - 0xfa050]
0x1002426fb: mov eax, dword ptr [r14 + 0x1830]
0x100242702: mov r8d, dword ptr [r14 + 0x1834]
0x100242709: lea eax, [rax + rax*2]
0x10024270c: lea eax, [rax + rax - 6]
0x100242710: dec r8d
0x100242713: imul r8d, eax
0x100242717: xor esi, esi
0x100242719: mov edx, 0x11
0x10024271e: mov ecx, 1
0x100242723: mov rdi, r12
0x100242726: lea r9, [rbp - 0xfa030]
0x10024272d: call 0x1007f55d0 ; 0x1007f55d0
0x100242732: mov rdi, r12
0x100242735: call 0x1007f5690 ; 0x1007f5690
0x10024273a: inc rbx
0x10024273d: cmp rbx, 2
0x100242741: vmovss xmm7, dword ptr [rip + 0x86297b] ; 0x100aa50c4
0x100242749: jne 0x100242370
0x10024274f: mov rax, qword ptr [rip + 0x9cb182] ; 0x100c0d8d8
0x100242756: mov rax, qword ptr [rax]
0x100242759: cmp rax, qword ptr [rbp - 0x30]
0x10024275d: jne 0x100242771
0x10024275f: add rsp, 0xfa048
0x100242766: pop rbx
0x100242767: pop r12
0x100242769: pop r13
0x10024276b: pop r14
0x10024276d: pop r15
0x10024276f: pop rbp
0x100242770: ret 
0x100242771: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x100242776: lea rdi, [rip + 0x939403] ; 0x100b7bb80 width * height <= kMaxVerts
0x10024277d: lea rsi, [rip + 0x938dd4] ; 0x100b7b558 Compositor.cpp
0x100242784: mov edx, 0x351
0x100242789: mov ecx, 3
0x10024278e: call 0x1007e5f70 ; 0x1007e5f70
0x100242793: ud2 
0x100242795: lea rdi, [rip + 0x939400] ; 0x100b7bb9c (width - 1) * (height - 1) <= kMaxQuads
0x10024279c: lea rsi, [rip + 0x938db5] ; 0x100b7b558 Compositor.cpp
0x1002427a3: mov edx, 0x352
0x1002427a8: mov ecx, 3
0x1002427ad: call 0x1007e5f70 ; 0x1007e5f70
0x1002427b2: ud2 
0x1002427b4: nop word ptr cs:[rax + rax]
