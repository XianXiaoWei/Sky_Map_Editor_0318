0x1001e9320: push rbp
0x1001e9321: mov rbp, rsp
0x1001e9324: push r15
0x1001e9326: push r14
0x1001e9328: push r13
0x1001e932a: push r12
0x1001e932c: push rbx
0x1001e932d: sub rsp, 0x128
0x1001e9334: mov qword ptr [rbp - 0x38], rsi
0x1001e9338: mov rbx, rdi
0x1001e933b: cmp dword ptr [rbx + 0xf6d0], 0
0x1001e9342: je 0x1001e993d
0x1001e9348: lea rax, [rbx + 0xe5]
0x1001e934f: mov qword ptr [rbp - 0x48], rax
0x1001e9353: xor eax, eax
0x1001e9355: vmovss xmm8, dword ptr [rip + 0x8be567] ; 0x100aa78c4
0x1001e935d: nop dword ptr [rax]
0x1001e9360: mov eax, eax
0x1001e9362: mov qword ptr [rbp - 0x40], rax
0x1001e9366: imul r12, rax, 0xb0
0x1001e936d: vmovaps xmm1, xmmword ptr [rbx + r12 + 0x7020]
0x1001e9377: vmovaps xmmword ptr [rbp - 0x90], xmm1
0x1001e937f: vmovaps xmm2, xmmword ptr [rbx + r12 + 0x7030]
0x1001e9389: vmovaps xmmword ptr [rbp - 0x80], xmm2
0x1001e938e: vmovaps xmm3, xmmword ptr [rbx + r12 + 0x7040]
0x1001e9398: vmovaps xmmword ptr [rbp - 0x70], xmm3
0x1001e939d: vmovaps xmm0, xmmword ptr [rbx + r12 + 0x7050]
0x1001e93a7: vmovaps xmmword ptr [rbp - 0x60], xmm0
0x1001e93ac: vmulps xmm0, xmm1, xmm1
0x1001e93b0: vmovshdup xmm4, xmm0
0x1001e93b4: vaddss xmm4, xmm0, xmm4
0x1001e93b8: vpermilpd xmm0, xmm0, 1
0x1001e93be: vaddss xmm0, xmm0, xmm4
0x1001e93c2: vsqrtss xmm0, xmm0, xmm0
0x1001e93c6: vucomiss xmm0, xmm8
0x1001e93cb: vmovaps xmm4, xmm1
0x1001e93cf: jbe 0x1001e93db
0x1001e93d1: vpermilps xmm4, xmm0, 0xc0
0x1001e93d7: vdivps xmm4, xmm1, xmm4
0x1001e93db: vmulps xmm5, xmm2, xmm2
0x1001e93df: vmovshdup xmm6, xmm5
0x1001e93e3: vaddss xmm6, xmm5, xmm6
0x1001e93e7: vpermilpd xmm5, xmm5, 1
0x1001e93ed: vaddss xmm5, xmm5, xmm6
0x1001e93f1: vsqrtss xmm6, xmm5, xmm5
0x1001e93f5: vucomiss xmm6, xmm8
0x1001e93fa: vmovaps xmm5, xmm2
0x1001e93fe: jbe 0x1001e940a
0x1001e9400: vpermilps xmm5, xmm6, 0xc0
0x1001e9406: vdivps xmm5, xmm2, xmm5
0x1001e940a: vmulps xmm6, xmm3, xmm3
0x1001e940e: vmovshdup xmm7, xmm6
0x1001e9412: vaddss xmm7, xmm6, xmm7
0x1001e9416: vpermilpd xmm6, xmm6, 1
0x1001e941c: vaddss xmm6, xmm6, xmm7
0x1001e9420: vsqrtss xmm7, xmm6, xmm6
0x1001e9424: vucomiss xmm7, xmm8
0x1001e9429: vmovaps xmm6, xmm3
0x1001e942d: jbe 0x1001e9439
0x1001e942f: vpermilps xmm6, xmm7, 0xc0
0x1001e9435: vdivps xmm6, xmm3, xmm6
0x1001e9439: lea r14, [rbx + r12 + 0x7020]
0x1001e9441: vblendps xmm1, xmm4, xmm1, 8
0x1001e9447: vmovaps xmmword ptr [rbp - 0x90], xmm1
0x1001e944f: vblendps xmm2, xmm5, xmm2, 8
0x1001e9455: vmovaps xmmword ptr [rbp - 0x80], xmm2
0x1001e945a: vblendps xmm2, xmm6, xmm3, 8
0x1001e9460: vmovaps xmmword ptr [rbp - 0x70], xmm2
0x1001e9465: mov rax, qword ptr [rbp - 0x48]
0x1001e9469: xor ecx, ecx
0x1001e946b: xor r15d, r15d
0x1001e946e: nop 
0x1001e9470: cmp byte ptr [rax - 0x70], 0
0x1001e9474: je 0x1001e94f0
0x1001e9476: test r15, r15
0x1001e9479: je 0x1001e94a0
0x1001e947b: cmp byte ptr [rax], 0
0x1001e947e: je 0x1001e9500
0x1001e9484: test r15, r15
0x1001e9487: jne 0x1001e94d0
0x1001e9489: cmp byte ptr [rax - 3], 0
0x1001e948d: je 0x1001e94be
0x1001e948f: lea r15, [rax - 0x65]
0x1001e9493: jmp 0x1001e94d0 ; 0x1001e94d0
0x1001e9495: nop word ptr cs:[rax + rax]
0x1001e94a0: cmp byte ptr [rax - 0x73], 0
0x1001e94a4: je 0x1001e94b4
0x1001e94a6: lea r15, [rax - 0xd5]
0x1001e94ad: cmp byte ptr [rax], 0
0x1001e94b0: jne 0x1001e9484
0x1001e94b2: jmp 0x1001e9500 ; 0x1001e9500
0x1001e94b4: xor r15d, r15d
0x1001e94b7: cmp byte ptr [rax], 0
0x1001e94ba: jne 0x1001e9484
0x1001e94bc: jmp 0x1001e9500 ; 0x1001e9500
0x1001e94be: xor r15d, r15d
0x1001e94c1: nop word ptr cs:[rax + rax]
0x1001e94d0: add rcx, 2
0x1001e94d4: add rax, 0xe0
0x1001e94da: cmp rcx, 0x100
0x1001e94e1: jb 0x1001e9470
0x1001e94e3: test r15, r15
0x1001e94e6: jne 0x1001e9507
0x1001e94e8: jmp 0x1001e999d ; 0x1001e999d
0x1001e94ed: nop dword ptr [rax]
0x1001e94f0: add rax, -0xd5
0x1001e94f6: jmp 0x1001e9504 ; 0x1001e9504
0x1001e94f8: nop dword ptr [rax + rax]
0x1001e9500: add rax, -0x65
0x1001e9504: mov r15, rax
0x1001e9507: vxorps ymm2, ymm2, ymm2
0x1001e950b: vmovups ymmword ptr [r15 + 0x50], ymm2
0x1001e9511: vmovups ymmword ptr [r15 + 0x30], ymm2
0x1001e9517: vmovups ymmword ptr [r15 + 0x10], ymm2
0x1001e951d: mov byte ptr [r15 + 0x65], 1
0x1001e9522: mov rax, qword ptr [rbp - 0x40]
0x1001e9526: or eax, 0xffff0000
0x1001e952b: mov dword ptr [r15 + 0x48], eax
0x1001e952f: vmovaps xmmword ptr [r15], xmm1
0x1001e9534: vmovaps xmm1, xmmword ptr [rbp - 0x80]
0x1001e9539: vmovaps xmmword ptr [r15 + 0x10], xmm1
0x1001e953f: vmovaps xmm1, xmmword ptr [rbp - 0x70]
0x1001e9544: vmovaps xmmword ptr [r15 + 0x20], xmm1
0x1001e954a: vmovaps xmm1, xmmword ptr [rbp - 0x60]
0x1001e954f: vmovaps xmmword ptr [r15 + 0x30], xmm1
0x1001e9555: mov eax, dword ptr [rbx + r12 + 0x70a8]
0x1001e955d: mov dword ptr [r15 + 0x4c], eax
0x1001e9561: vmovss xmm1, dword ptr [rip + 0x8bb04f] ; 0x100aa45b8
0x1001e9569: vmaxss xmm0, xmm1, xmm0
0x1001e956d: vmovss xmm1, dword ptr [rip + 0x8bd537] ; 0x100aa6aac
0x1001e9575: vminss xmm0, xmm1, xmm0
0x1001e9579: vmovss dword ptr [r15 + 0x50], xmm0
0x1001e957f: vmovss xmm0, dword ptr [rip + 0x8be73d] ; 0x100aa7cc4
0x1001e9587: vminss xmm0, xmm0, dword ptr [rbx + r12 + 0x70ac]
0x1001e9591: vmovss dword ptr [r15 + 0x54], xmm0
0x1001e9597: mov al, byte ptr [rbx + r12 + 0x70b3]
0x1001e959f: mov byte ptr [r15 + 0x60], al
0x1001e95a3: mov eax, dword ptr [rbx + r12 + 0x70b8]
0x1001e95ab: imul rax, rax, 0x70
0x1001e95af: mov eax, dword ptr [rbx + rax + 0xf748]
0x1001e95b6: mov dword ptr [r15 + 0x5c], eax
0x1001e95ba: mov al, byte ptr [rbx + r12 + 0x70b0]
0x1001e95c2: mov byte ptr [r15 + 0x64], al
0x1001e95c6: mov al, byte ptr [rbx + r12 + 0x70b4]
0x1001e95ce: mov byte ptr [r15 + 0x67], al
0x1001e95d2: mov al, byte ptr [rbx + r12 + 0x70b1]
0x1001e95da: mov byte ptr [r15 + 0x61], al
0x1001e95de: mov dword ptr [r15 + 0x58], 0
0x1001e95e6: mov byte ptr [r15 + 0x66], 1
0x1001e95eb: mov rdi, rbx
0x1001e95ee: vzeroupper 
0x1001e95f1: call 0x1001eab70 ; 0x1001eab70
0x1001e95f6: mov qword ptr [r15 + 0x40], rax
0x1001e95fa: mov ecx, dword ptr [rbx + r12 + 0x70b8]
0x1001e9602: mov dword ptr [rax + 0x560], ecx
0x1001e9608: mov rdx, qword ptr [rip + 0x1bf50f1] ; 0x101dde700
0x1001e960f: imul rsi, rcx, 0x70
0x1001e9613: lea rdi, [rdx + rsi + 0xf6e0]
0x1001e961b: mov qword ptr [rax + 0x18], rdi
0x1001e961f: mov rdi, qword ptr [rax + 0x10]
0x1001e9623: mov edx, dword ptr [rdx + rsi + 0xf74c]
0x1001e962a: mov dword ptr [rdi + 0x11c], edx
0x1001e9630: cmp byte ptr [rax + 0x54a], 1
0x1001e9637: je 0x1001e9959
0x1001e963d: mov dword ptr [rax + 0x528], ecx
0x1001e9643: mov rdi, rax
0x1001e9646: lea rsi, [rbp - 0x90]
0x1001e964d: call 0x1001eaf00 ; 0x1001eaf00
0x1001e9652: mov rax, qword ptr [r15 + 0x40]
0x1001e9656: cmp byte ptr [rax + 0x54a], 1
0x1001e965d: je 0x1001e9975
0x1001e9663: mov byte ptr [rax + 0x549], 1
0x1001e966a: mov rdi, qword ptr [rax + 0x10]
0x1001e966e: mov esi, 1
0x1001e9673: call 0x10033ac40 ; 0x10033ac40
0x1001e9678: vmovss xmm0, dword ptr [r15 + 0x5c]
0x1001e967e: vmulss xmm0, xmm0, dword ptr [r15 + 0x50]
0x1001e9684: vpermilps xmm1, xmm0, 0xc0
0x1001e968a: vxorps xmm3, xmm3, xmm3
0x1001e968e: vblendps xmm0, xmm3, xmm0, 1
0x1001e9694: vblendps xmm2, xmm3, xmm1, 2
0x1001e969a: vblendps xmm1, xmm3, xmm1, 4
0x1001e96a0: vmovaps xmmword ptr [rbp - 0x130], xmm0
0x1001e96a8: vmovaps xmmword ptr [rbp - 0x120], xmm2
0x1001e96b0: vmovaps xmmword ptr [rbp - 0x110], xmm1
0x1001e96b8: vmovaps xmm0, xmmword ptr [rip + 0x8bf340] ; 0x100aa8a00
0x1001e96c0: vmovaps xmmword ptr [rbp - 0x100], xmm0
0x1001e96c8: lea r13, [rbp - 0xd0]
0x1001e96cf: mov rdi, r13
0x1001e96d2: mov rsi, r15
0x1001e96d5: lea rax, [rbp - 0x130]
0x1001e96dc: mov rdx, rax
0x1001e96df: call 0x100076df0 ; 0x100076df0
0x1001e96e4: vmovaps xmm0, xmmword ptr [rbp - 0xd0]
0x1001e96ec: vmovaps xmmword ptr [rbx + r12 + 0x7020], xmm0
0x1001e96f6: vmovaps xmm0, xmmword ptr [rbp - 0xc0]
0x1001e96fe: mov r13, r14
0x1001e9701: vmovaps xmmword ptr [r13 + 0x10], xmm0
0x1001e9707: vmovaps xmm1, xmmword ptr [rbp - 0xb0]
0x1001e970f: vmovaps xmmword ptr [r13 + 0x20], xmm1
0x1001e9715: vmovaps xmm1, xmmword ptr [rbp - 0xa0]
0x1001e971d: vmovaps xmmword ptr [r13 + 0x30], xmm1
0x1001e9723: mov rax, qword ptr [r15 + 0x40]
0x1001e9727: mov rax, qword ptr [rax + 0x18]
0x1001e972b: vmovaps xmm2, xmmword ptr [rax]
0x1001e972f: vmovaps xmm3, xmmword ptr [rax + 0x10]
0x1001e9734: vmovaps xmm4, xmmword ptr [rax + 0x20]
0x1001e9739: vmovaps xmm5, xmmword ptr [rax + 0x30]
0x1001e973e: vmovaps xmmword ptr [rbx + r12 + 0x7060], xmm2
0x1001e9748: vmovaps xmmword ptr [rbx + r12 + 0x7070], xmm3
0x1001e9752: vmovaps xmmword ptr [rbx + r12 + 0x7080], xmm4
0x1001e975c: vmovaps xmmword ptr [rbx + r12 + 0x7090], xmm5
0x1001e9766: mov qword ptr [rbx + r12 + 0x70a0], r15
0x1001e976e: mov byte ptr [rbp - 0x148], 1
0x1001e9775: lea rax, [rbp - 0x140]
0x1001e977c: vxorps xmm2, xmm2, xmm2
0x1001e9780: vmovups xmmword ptr [rax], xmm2
0x1001e9784: movabs rax, 0xffffff8f00000001
0x1001e978e: mov qword ptr [rbp - 0x150], rax
0x1001e9795: vmulps xmm0, xmm0, xmm0
0x1001e9799: vmovshdup xmm2, xmm0
0x1001e979d: vaddss xmm2, xmm0, xmm2
0x1001e97a1: vpermilpd xmm0, xmm0, 1
0x1001e97a7: vaddss xmm0, xmm0, xmm2
0x1001e97ab: vsqrtss xmm0, xmm0, xmm0
0x1001e97af: mov rax, qword ptr [rbp - 0x38]
0x1001e97b3: mov rdi, qword ptr [rax + 0x138]
0x1001e97ba: vpermilps xmm2, xmm0, 0xc0
0x1001e97c0: vmulps xmm2, xmm2, xmmword ptr [rip + 0x8be8d8] ; 0x100aa80a0
0x1001e97c8: vaddps xmm1, xmm1, xmm2
0x1001e97cc: vmovaps xmmword ptr [rbp - 0xd0], xmm1
0x1001e97d4: vmovaps xmm1, xmmword ptr [rip + 0x8bfb04] ; 0x100aa92e0
0x1001e97dc: vmovaps xmmword ptr [rbp - 0xf0], xmm1
0x1001e97e4: vaddss xmm0, xmm0, xmm0
0x1001e97e8: lea rsi, [rbp - 0xd0]
0x1001e97ef: lea rdx, [rbp - 0xf0]
0x1001e97f6: lea rcx, [rbp - 0x150]
0x1001e97fd: lea r8, [rbp - 0x130]
0x1001e9804: call 0x100776a90 ; 0x100776a90
0x1001e9809: test al, al
0x1001e980b: je 0x1001e98b3
0x1001e9811: lea r14, [rbx + r12 + 0x7060]
0x1001e9819: vmovss xmm0, dword ptr [rbp - 0x11c]
0x1001e9821: call 0x100aa2576 ; 0x100aa2576 _acosf
0x1001e9826: vmovss dword ptr [rbp - 0x2c], xmm0
0x1001e982b: lea rdi, [rbp - 0xd0]
0x1001e9832: mov rsi, r13
0x1001e9835: mov rdx, r14
0x1001e9838: call 0x100076df0 ; 0x100076df0
0x1001e983d: vmovaps xmm0, xmmword ptr [rbp - 0xd0]
0x1001e9845: vmulps xmm0, xmm0, xmm0
0x1001e9849: vmovshdup xmm1, xmm0
0x1001e984d: vaddss xmm1, xmm0, xmm1
0x1001e9851: vpermilpd xmm0, xmm0, 1
0x1001e9857: vaddss xmm0, xmm0, xmm1
0x1001e985b: vsqrtss xmm0, xmm0, xmm0
0x1001e985f: vpermilps xmm0, xmm0, 0xc0
0x1001e9865: vmulps xmm0, xmm0, xmmword ptr [rip + 0x8be833] ; 0x100aa80a0
0x1001e986d: vmovaps xmmword ptr [rbp - 0xe0], xmm0
0x1001e9875: vmovss xmm0, dword ptr [rbp - 0x2c]
0x1001e987a: call 0x100aa2cfc ; 0x100aa2cfc _tanf
0x1001e987f: vpermilps xmm0, xmm0, 0xc0
0x1001e9885: vmulps xmm0, xmm0, xmmword ptr [rbp - 0xe0]
0x1001e988d: vmovaps xmm1, xmmword ptr [rbp - 0x130]
0x1001e9895: vsubps xmm0, xmm1, xmm0
0x1001e9899: vblendps xmm1, xmm0, xmmword ptr [r13 + 0x30], 8
0x1001e98a0: vmovaps xmmword ptr [r13 + 0x30], xmm1
0x1001e98a6: vblendps xmm0, xmm0, xmmword ptr [r15 + 0x30], 8
0x1001e98ad: vmovaps xmmword ptr [r15 + 0x30], xmm0
0x1001e98b3: mov rax, qword ptr [r15 + 0x40]
0x1001e98b7: mov r13, qword ptr [rax + 0x10]
0x1001e98bb: movzx eax, byte ptr [rbx + r12 + 0x70b2]
0x1001e98c4: mov dword ptr [r13 + 0xbc], eax
0x1001e98cb: cmp byte ptr [r15 + 0x61], 0
0x1001e98d0: je 0x1001e9920
0x1001e98d2: mov rdi, r13
0x1001e98d5: call 0x10033a760 ; 0x10033a760
0x1001e98da: cmp byte ptr [r15 + 0x61], 0
0x1001e98df: je 0x1001e9920
0x1001e98e1: cmp byte ptr [r15 + 0x67], 0
0x1001e98e6: je 0x1001e9920
0x1001e98e8: mov rax, qword ptr [rbp - 0x38]
0x1001e98ec: mov r14, qword ptr [rax + 0x488]
0x1001e98f3: call 0x10072d070 ; 0x10072d070
0x1001e98f8: mov rdi, r14
0x1001e98fb: mov rsi, rax
0x1001e98fe: call 0x100039f40 ; 0x100039f40
0x1001e9903: vmovaps xmm0, xmmword ptr [r13 + 0xc0]
0x1001e990c: vmovaps xmmword ptr [rax + 0x40], xmm0
0x1001e9911: mov ecx, dword ptr [r15 + 0x4c]
0x1001e9915: mov dword ptr [rax + 0x50], ecx
0x1001e9918: mov rdi, rax
0x1001e991b: call 0x10032e2f0 ; 0x10032e2f0
0x1001e9920: mov rcx, qword ptr [rbp - 0x40]
0x1001e9924: inc ecx
0x1001e9926: mov rax, rcx
0x1001e9929: cmp ecx, dword ptr [rbx + 0xf6d0]
0x1001e992f: vmovss xmm8, dword ptr [rip + 0x8bdf8d] ; 0x100aa78c4
0x1001e9937: jb 0x1001e9360
0x1001e993d: mov dword ptr [rbx + 0xf6d4], 0
0x1001e9947: add rsp, 0x128
0x1001e994e: pop rbx
0x1001e994f: pop r12
0x1001e9951: pop r13
0x1001e9953: pop r14
0x1001e9955: pop r15
0x1001e9957: pop rbp
0x1001e9958: ret 
0x1001e9959: lea rdi, [rip + 0x978911] ; 0x100b62271 !m_queued
0x1001e9960: lea rsi, [rip + 0x978914] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1001e9967: lea r8, [rip + 0x978929] ; 0x100b62297 VertexRender has already been committed!
0x1001e996e: mov edx, 0x8e
0x1001e9973: jmp 0x1001e998f ; 0x1001e998f
0x1001e9975: lea rdi, [rip + 0x9788f5] ; 0x100b62271 !m_queued
0x1001e997c: lea rsi, [rip + 0x9788f8] ; 0x100b6227b ../../../Code/Base/Vertex.h
0x1001e9983: lea r8, [rip + 0x97890d] ; 0x100b62297 VertexRender has already been committed!
0x1001e998a: mov edx, 0x8a
0x1001e998f: mov ecx, 4
0x1001e9994: xor eax, eax
0x1001e9996: call 0x1007e6030 ; 0x1007e6030
0x1001e999b: ud2 
0x1001e999d: lea rdi, [rip + 0x98e4d2] ; 0x100b77e76 c
0x1001e99a4: lea rsi, [rip + 0x98faaf] ; 0x100b7945a Candle.cpp
0x1001e99ab: mov edx, 0x169
0x1001e99b0: mov ecx, 3
0x1001e99b5: call 0x1007e5f70 ; 0x1007e5f70
0x1001e99ba: ud2 
0x1001e99bc: nop dword ptr [rax]
