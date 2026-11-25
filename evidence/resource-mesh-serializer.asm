0x100453e00: add byte ptr [rax], al
0x100453e02: mov dword ptr [rsp + 0x1c0], 0x3f800000
0x100453e0d: mov dword ptr [rsp + 0x230], 0x11
0x100453e18: vmovups ymmword ptr [rsp + 0x190], ymm0
0x100453e21: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x100453e2a: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x100453e33: vmovaps ymmword ptr [rsp + 0x140], ymm0
0x100453e3c: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x100453e45: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x100453e4e: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x100453e57: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x100453e60: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x100453e69: vmovaps ymmword ptr [rsp + 0x80], ymm0
0x100453e72: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x100453e78: vmovaps ymmword ptr [rsp + 0x40], ymm0
0x100453e7e: vmovaps ymmword ptr [rsp + 0x20], ymm0
0x100453e84: vmovaps ymmword ptr [rsp], ymm0
0x100453e89: lea rsi, [rip + 0x73558d]
0x100453e90: lea rdx, [rsp + 0x1c0]
0x100453e98: mov rcx, rsp
0x100453e9b: vzeroupper 
0x100453e9e: call 0x1006018a0
0x100453ea3: mov rax, qword ptr [rip + 0x7b9a2e]
0x100453eaa: mov rax, qword ptr [rax]
0x100453ead: cmp rax, qword ptr [rsp + 0x250]
0x100453eb5: jne 0x100453ec2
0x100453eb7: lea rsp, [rbp - 0x18]
0x100453ebb: pop rbx
0x100453ebc: pop r14
0x100453ebe: pop r15
0x100453ec0: pop rbp
0x100453ec1: ret 
0x100453ec2: call 0x100aa251c
0x100453ec7: lea rdi, [rip + 0x735534]
0x100453ece: lea rsi, [rip + 0x73553b]
0x100453ed5: mov edx, 0x95
0x100453eda: mov ecx, 3
0x100453edf: call 0x1007e5f70
0x100453ee4: ud2 
0x100453ee6: nop word ptr cs:[rax + rax]
0x100453ef0: push rbp
0x100453ef1: mov rbp, rsp
0x100453ef4: push r15
0x100453ef6: push r14
0x100453ef8: push rbx
0x100453ef9: push rax
0x100453efa: mov r15, rsi
0x100453efd: mov r14, rdi
0x100453f00: mov esi, dword ptr [r14 + 0x220]
0x100453f07: test esi, esi
0x100453f09: je 0x100453f5b
0x100453f0b: xor ebx, ebx
0x100453f0d: nop dword ptr [rax]
0x100453f10: mov eax, ebx
0x100453f12: mov rdi, qword ptr [r14 + rax*8 + 0x120]
0x100453f1a: mov rdx, qword ptr [rdi + 0x38]
0x100453f1e: mov rax, qword ptr [rdi + 0x40]
0x100453f22: test rax, rax
0x100453f25: setne cl
0x100453f28: cmp rax, r15
0x100453f2b: sete al
0x100453f2e: test rdx, rdx
0x100453f31: setne r8b
0x100453f35: cmp rdx, r15
0x100453f38: sete dl
0x100453f3b: cmp rdi, r15
0x100453f3e: je 0x100453f55
0x100453f40: and al, cl
0x100453f42: jne 0x100453f55
0x100453f44: and dl, r8b
0x100453f47: jne 0x100453f55
0x100453f49: call 0x100453b00
0x100453f4e: mov esi, dword ptr [r14 + 0x220]
0x100453f55: inc ebx
0x100453f57: cmp ebx, esi
0x100453f59: jb 0x100453f10
0x100453f5b: add rsp, 8
0x100453f5f: pop rbx
0x100453f60: pop r14
0x100453f62: pop r15
0x100453f64: pop rbp
0x100453f65: ret 
0x100453f66: nop word ptr cs:[rax + rax]
0x100453f70: mov eax, dword ptr [rdi + 0x220]
0x100453f76: cmp rax, 0x20
0x100453f7a: jae 0x100453f8e
0x100453f7c: mov qword ptr [rdi + rax*8 + 0x120], rsi
0x100453f84: lea eax, [rax + 1]
0x100453f87: mov dword ptr [rdi + 0x220], eax
0x100453f8d: ret 
0x100453f8e: push rbp
0x100453f8f: mov rbp, rsp
0x100453f92: lea rdi, [rip + 0x7354bb]
0x100453f99: lea rsi, [rip + 0x735470]
0x100453fa0: mov edx, 0x29f
0x100453fa5: mov ecx, 3
0x100453faa: call 0x1007e5f70
0x100453faf: ud2 
0x100453fb1: nop word ptr cs:[rax + rax]
0x100453fc0: push rbp
0x100453fc1: mov rbp, rsp
0x100453fc4: push r14
0x100453fc6: push rbx
0x100453fc7: sub rsp, 0x40
0x100453fcb: mov r14, rsi
0x100453fce: mov rbx, rdi
0x100453fd1: cmp qword ptr [rbx + 0x240], 0
0x100453fd9: je 0x1004540a3
0x100453fdf: mov rdi, qword ptr [r14 + 0x280]
0x100453fe6: call 0x1000fc260
0x100453feb: mov rax, qword ptr [rax + 0x18]
0x100453fef: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x100453ff4: vinsertps xmm0, xmm0, dword ptr [rip + 0x6510c2], 0x30
0x100453ffe: vmovss xmm1, dword ptr [rip + 0x6510ba]
0x100454006: vmovaps xmm2, xmmword ptr [rbx + 0x260]
0x10045400e: mov rdi, qword ptr [rbx + 0x240]
0x100454015: vpermilps xmm3, xmm2, 0
0x10045401b: vmulps xmm1, xmm3, xmm1
0x10045401f: vpermilps xmm3, xmm2, 0x55
0x100454025: vmulps xmm3, xmm3, xmmword ptr [rip + 0x654073]
0x10045402d: vpermilps xmm2, xmm2, 0xaa
0x100454033: vmulps xmm2, xmm2, xmmword ptr [rip + 0x6549f5]
0x10045403b: vmovaps xmmword ptr [rbp - 0x50], xmm1
0x100454040: vmovaps xmmword ptr [rbp - 0x40], xmm3
0x100454045: vmovaps xmmword ptr [rbp - 0x30], xmm2
0x10045404a: vmovaps xmmword ptr [rbp - 0x20], xmm0
0x10045404f: lea rsi, [rbp - 0x50]
0x100454053: call 0x100463750
0x100454058: mov rax, qword ptr [r14 + 0x160]
0x10045405f: vmovss xmm0, dword ptr [rbx + 0x248]
0x100454067: vcvtss2sd xmm0, xmm0, xmm0
0x10045406b: vmulsd xmm0, xmm0, qword ptr [rax + 0xb0]
0x100454073: vcvtsd2ss xmm0, xmm0, xmm0
0x100454077: mov rdi, qword ptr [rbx + 0x240]
0x10045407e: vmulss xmm1, xmm0, dword ptr [rip + 0x653756]
0x100454086: vinsertps xmm0, xmm0, xmm1, 0x1c
0x10045408c: vmovaps xmmword ptr [rbp - 0x50], xmm0
0x100454091: lea rdx, [rip + 0x72025d]
0x100454098: lea rcx, [rbp - 0x50]
0x10045409c: xor esi, esi
0x10045409e: call 0x100466af0
0x1004540a3: add rsp, 0x40
0x1004540a7: pop rbx
0x1004540a8: pop r14
0x1004540aa: pop rbp
0x1004540ab: ret 
0x1004540ac: nop dword ptr [rax]
0x1004540b0: push rbp
0x1004540b1: mov rbp, rsp
0x1004540b4: mov ecx, dword ptr [rdi + 0x220]
0x1004540ba: test ecx, ecx
0x1004540bc: je 0x1004540d9
0x1004540be: xor edx, edx
0x1004540c0: mov rax, qword ptr [rdi + rdx*8 + 0x120]
0x1004540c8: cmp byte ptr [rax + 0x18], 0
0x1004540cc: jne 0x1004540dd
0x1004540ce: inc rdx
0x1004540d1: cmp edx, ecx
0x1004540d3: jb 0x1004540c0
0x1004540d5: xor eax, eax
0x1004540d7: pop rbp
0x1004540d8: ret 
0x1004540d9: xor eax, eax
0x1004540db: pop rbp
0x1004540dc: ret 
0x1004540dd: pop rbp
0x1004540de: ret 
0x1004540df: nop 
0x1004540e0: push rbp
0x1004540e1: mov rbp, rsp
0x1004540e4: push r15
0x1004540e6: push r14
0x1004540e8: push rbx
0x1004540e9: push rax
0x1004540ea: mov r14, rsi
0x1004540ed: mov r15, rdi
0x1004540f0: mov eax, dword ptr [r15 + 0x220]
0x1004540f7: test eax, eax
0x1004540f9: je 0x10045415a
0x1004540fb: xor ebx, ebx
0x1004540fd: test r14, r14
0x100454100: je 0x100454140
0x100454102: nop word ptr cs:[rax + rax]
0x100454110: mov ecx, ebx
0x100454112: mov rdi, qword ptr [r15 + rcx*8 + 0x120]
0x10045411a: mov rcx, qword ptr [rdi + 0x20]
0x10045411e: test rcx, rcx
0x100454121: je 0x100454134
0x100454123: cmp rcx, r14
0x100454126: je 0x100454134
0x100454128: call 0x100453b00
0x10045412d: mov eax, dword ptr [r15 + 0x220]
0x100454134: inc ebx
0x100454136: cmp ebx, eax
0x100454138: jb 0x100454110
0x10045413a: jmp 0x10045415a
0x10045413c: nop dword ptr [rax]
0x100454140: mov eax, ebx
0x100454142: mov rdi, qword ptr [r15 + rax*8 + 0x120]
0x10045414a: call 0x100453b00
0x10045414f: inc ebx
0x100454151: cmp ebx, dword ptr [r15 + 0x220]
0x100454158: jb 0x100454140
0x10045415a: add rsp, 8
0x10045415e: pop rbx
0x10045415f: pop r14
0x100454161: pop r15
0x100454163: pop rbp
0x100454164: ret 
0x100454165: nop word ptr cs:[rax + rax]
0x100454170: push rbp
0x100454171: mov rbp, rsp
0x100454174: mov eax, dword ptr [rdi + 0x220]
0x10045417a: test eax, eax
0x10045417c: je 0x100454196
0x10045417e: xor ecx, ecx
0x100454180: mov edx, ecx
0x100454182: mov rdx, qword ptr [rdi + rdx*8 + 0x120]
0x10045418a: cmp byte ptr [rdx + 0x18], 0
0x10045418e: jne 0x100454198
0x100454190: inc ecx
0x100454192: cmp ecx, eax
0x100454194: jb 0x100454180
0x100454196: xor edx, edx
0x100454198: mov qword ptr [rdi + 0x228], rdx
0x10045419f: vmovss dword ptr [rdi + 0x230], xmm0
0x1004541a7: pop rbp
0x1004541a8: ret 
0x1004541a9: nop dword ptr [rax]
0x1004541b0: push rbp
0x1004541b1: mov rbp, rsp
0x1004541b4: mov eax, dword ptr [rdi + 0x220]
0x1004541ba: test eax, eax
0x1004541bc: je 0x1004541d9
0x1004541be: xor ecx, ecx
0x1004541c0: mov rdx, qword ptr [rdi + rcx*8 + 0x120]
0x1004541c8: cmp byte ptr [rdx + 0x18], 0
0x1004541cc: jne 0x1004541dd
0x1004541ce: inc rcx
0x1004541d1: cmp ecx, eax
0x1004541d3: jb 0x1004541c0
0x1004541d5: xor eax, eax
0x1004541d7: pop rbp
0x1004541d8: ret 
0x1004541d9: xor eax, eax
0x1004541db: pop rbp
0x1004541dc: ret 
0x1004541dd: mov al, 1
0x1004541df: pop rbp
0x1004541e0: ret 
0x1004541e1: nop word ptr cs:[rax + rax]
0x1004541f0: push rbp
0x1004541f1: mov rbp, rsp
0x1004541f4: push rbx
0x1004541f5: push rax
0x1004541f6: mov rbx, rdi
0x1004541f9: cmp dword ptr [rbx + 0x234], -1
0x100454200: jne 0x100454226
0x100454202: mov rdi, qword ptr [rsi + 0x58]
0x100454206: mov rax, qword ptr [rdi]
0x100454209: mov rsi, rdx
0x10045420c: mov edx, ecx
0x10045420e: mov rcx, r8
0x100454211: call qword ptr [rax + 0x50]
0x100454214: mov dword ptr [rbx + 0x234], eax
0x10045421a: cmp eax, -1
0x10045421d: jne 0x100454226
0x10045421f: mov byte ptr [rbx + 0x238], 1
0x100454226: add rsp, 8
0x10045422a: pop rbx
0x10045422b: pop rbp
0x10045422c: ret 
0x10045422d: nop dword ptr [rax]
0x100454230: push rbp
0x100454231: mov rbp, rsp
0x100454234: push r15
0x100454236: push r14
0x100454238: push r13
0x10045423a: push r12
0x10045423c: push rbx
0x10045423d: sub rsp, 0x1f8
0x100454244: mov r15, rsi
0x100454247: mov r13, rdi
0x10045424a: mov rax, qword ptr [rip + 0x7b9687]
0x100454251: mov rax, qword ptr [rax]
0x100454254: mov qword ptr [rbp - 0x30], rax
0x100454258: cmp dword ptr [r13 + 0x234], -1
0x100454260: je 0x1004543d5
0x100454266: lea rdi, [rbp - 0xc8]
0x10045426d: lea r12, [rbp - 0x210]
0x100454274: mov rax, qword ptr [rip + 0x7b62a5]
0x10045427b: lea rcx, [rax + 0x18]
0x10045427f: mov qword ptr [rbp - 0x218], rcx
0x100454286: add rax, 0x40
0x10045428a: mov qword ptr [rbp - 0xc8], rax
0x100454291: mov rsi, r12
0x100454294: call 0x100aa2450
0x100454299: mov qword ptr [rbp - 0x40], 0
0x1004542a1: mov dword ptr [rbp - 0x38], 0xffffffff
0x1004542a8: mov rbx, qword ptr [rip + 0x7b9319]
0x1004542af: lea r14, [rbx + 0x18]
0x1004542b3: mov qword ptr [rbp - 0x218], r14
0x1004542ba: add rbx, 0x40
0x1004542be: mov qword ptr [rbp - 0xc8], rbx
0x1004542c5: lea rsi, [rip + 0x70c73a]
0x1004542cc: mov edx, 8
0x1004542d1: mov rdi, r12
0x1004542d4: call 0x1007a56a0
0x1004542d9: lea rsi, [rip + 0x735151]
0x1004542e0: lea rdi, [rbp - 0x218]
0x1004542e7: mov edx, 0xb
0x1004542ec: call 0x100011930
0x1004542f1: lea rsi, [rip + 0x70c714]
0x1004542f8: mov edx, 2
0x1004542fd: mov rdi, rax
0x100454300: call 0x100011930
0x100454305: lea rsi, [rip + 0x735131]
0x10045430c: mov edx, 9
0x100454311: mov rdi, rax
0x100454314: call 0x100011930
0x100454319: lea rsi, [rip + 0x70c6ef]
0x100454320: mov edx, 1
0x100454325: mov rdi, rax
0x100454328: call 0x100011930
0x10045432d: lea rsi, [rip + 0x735113]
0x100454334: mov edx, 0xc
0x100454339: mov rdi, rax
0x10045433c: call 0x100011930
0x100454341: lea rsi, [rip + 0x70c6c4]
0x100454348: mov edx, 2
0x10045434d: mov rdi, rax
0x100454350: call 0x100011930
0x100454355: mov esi, dword ptr [r13 + 0x234]
0x10045435c: mov rdi, rax
0x10045435f: call 0x100aa23de
0x100454364: lea rsi, [rip + 0x70c6a4]
0x10045436b: mov edx, 1
0x100454370: mov rdi, rax
0x100454373: call 0x100011930
0x100454378: mov qword ptr [rbp - 0x218], r14
0x10045437f: mov qword ptr [rbp - 0xc8], rbx
0x100454386: mov rdi, r12
0x100454389: call 0x1007a58d0
0x10045438e: mov rsi, qword ptr [rip + 0x7b61eb]
0x100454395: add rsi, 8
0x100454399: lea rdi, [rbp - 0x218]
0x1004543a0: call 0x100aa23ba
0x1004543a5: lea rdi, [rbp - 0xc8]
0x1004543ac: call 0x100aa245c
0x1004543b1: mov rdi, qword ptr [r15 + 0x58]
0x1004543b5: mov rax, qword ptr [rdi]
0x1004543b8: mov esi, dword ptr [r13 + 0x234]
0x1004543bf: call qword ptr [rax + 0x58]
0x1004543c2: mov dword ptr [r13 + 0x234], 0xffffffff
0x1004543cd: mov byte ptr [r13 + 0x238], 1
0x1004543d5: mov rax, qword ptr [rip + 0x7b94fc]
0x1004543dc: mov rax, qword ptr [rax]
0x1004543df: cmp rax, qword ptr [rbp - 0x30]
0x1004543e3: jne 0x1004543f7
0x1004543e5: add rsp, 0x1f8
0x1004543ec: pop rbx
0x1004543ed: pop r12
0x1004543ef: pop r13
0x1004543f1: pop r14
0x1004543f3: pop r15
0x1004543f5: pop rbp
0x1004543f6: ret 
0x1004543f7: call 0x100aa251c
0x1004543fc: mov r15, rax
0x1004543ff: jmp 0x10045441f
0x100454401: mov r15, rax
0x100454404: jmp 0x100454436
0x100454406: mov r15, rax
0x100454409: mov qword ptr [rbp - 0x218], r14
0x100454410: mov qword ptr [rbp - 0xc8], rbx
0x100454417: mov rdi, r12
0x10045441a: call 0x1007a58d0
0x10045441f: mov rsi, qword ptr [rip + 0x7b615a]
0x100454426: add rsi, 8
0x10045442a: lea rdi, [rbp - 0x218]
0x100454431: call 0x100aa23ba
0x100454436: lea rdi, [rbp - 0xc8]
0x10045443d: call 0x100aa245c
0x100454442: mov rdi, r15
0x100454445: call 0x100aa2192
0x10045444a: nop word ptr [rax + rax]
0x100454450: push rbp
0x100454451: mov rbp, rsp
0x100454454: cmp dword ptr [rdi + 0x220], 0
0x10045445b: je 0x100454496
0x10045445d: mov rcx, qword ptr [rdi + 0x40]
0x100454461: mov al, 1
0x100454463: cmp byte ptr [rcx + 0x18], 0
0x100454467: jne 0x100454498
0x100454469: mov rcx, qword ptr [rdi + 0x48]
0x10045446d: cmp byte ptr [rcx + 0x18], 0
0x100454471: jne 0x100454498
0x100454473: mov rcx, qword ptr [rdi + 0x50]
0x100454477: cmp byte ptr [rcx + 0x18], 0
0x10045447b: jne 0x100454498
0x10045447d: mov rcx, qword ptr [rdi + 0x58]
0x100454481: cmp byte ptr [rcx + 0x18], 0
0x100454485: jne 0x100454498
0x100454487: cmp byte ptr [rdi + 0x23a], 0
0x10045448e: jne 0x100454498
0x100454490: pop rbp
0x100454491: jmp 0x1005f2cd0
0x100454496: xor eax, eax
0x100454498: pop rbp
0x100454499: ret 
0x10045449a: nop word ptr [rax + rax]
0x1004544a0: push rbp
0x1004544a1: mov rbp, rsp
0x1004544a4: cmp dword ptr [rdi + 0x220], 0
0x1004544ab: je 0x1004544e6
0x1004544ad: mov rcx, qword ptr [rdi + 0x40]
0x1004544b1: mov al, 1
0x1004544b3: cmp byte ptr [rcx + 0x18], 0
0x1004544b7: jne 0x1004544e8
0x1004544b9: mov rcx, qword ptr [rdi + 0x48]
0x1004544bd: cmp byte ptr [rcx + 0x18], 0
0x1004544c1: jne 0x1004544e8
0x1004544c3: mov rcx, qword ptr [rdi + 0x50]
0x1004544c7: cmp byte ptr [rcx + 0x18], 0
0x1004544cb: jne 0x1004544e8
0x1004544cd: mov rcx, qword ptr [rdi + 0x58]
0x1004544d1: cmp byte ptr [rcx + 0x18], 0
0x1004544d5: jne 0x1004544e8
0x1004544d7: cmp byte ptr [rdi + 0x23a], 0
0x1004544de: jne 0x1004544e8
0x1004544e0: pop rbp
0x1004544e1: jmp 0x1005f2cd0
0x1004544e6: xor eax, eax
0x1004544e8: pop rbp
0x1004544e9: ret 
0x1004544ea: nop word ptr [rax + rax]
0x1004544f0: push rbp
0x1004544f1: mov rbp, rsp
0x1004544f4: pop rbp
0x1004544f5: jmp 0x100aa248c
0x1004544fa: nop word ptr [rax + rax]
0x100454500: push rbp
0x100454501: mov rbp, rsp
0x100454504: mov eax, 8
0x100454509: pop rbp
0x10045450a: ret 
0x10045450b: nop dword ptr [rax + rax]
0x100454510: push rbp
0x100454511: mov rbp, rsp
0x100454514: mov eax, 8
0x100454519: pop rbp
0x10045451a: ret 
0x10045451b: nop dword ptr [rax + rax]
0x100454520: push rbp
0x100454521: mov rbp, rsp
0x100454524: mov edi, 8
0x100454529: call 0x100aa2498
0x10045452e: mov qword ptr [rax], 0
0x100454535: pop rbp
0x100454536: ret 
0x100454537: nop word ptr [rax + rax]
0x100454540: push rbp
0x100454541: mov rbp, rsp
0x100454544: test rsi, rsi
0x100454547: je 0x100454552
0x100454549: mov rdi, rsi
0x10045454c: pop rbp
0x10045454d: jmp 0x100aa248c
0x100454552: pop rbp
0x100454553: ret 
0x100454554: nop word ptr cs:[rax + rax]
0x100454560: push rbp
0x100454561: mov rbp, rsp
0x100454564: mov qword ptr [rsi], 0
0x10045456b: mov rax, rsi
0x10045456e: pop rbp
0x10045456f: ret 
0x100454570: push rbp
0x100454571: mov rbp, rsp
0x100454574: pop rbp
0x100454575: ret 
0x100454576: nop word ptr cs:[rax + rax]
0x100454580: push rbp
0x100454581: mov rbp, rsp
0x100454584: push rbx
0x100454585: push rax
0x100454586: mov rbx, rdi
0x100454589: mov edi, 0x60
0x10045458e: call 0x100aa2498
0x100454593: vmovups ymm0, ymmword ptr [rbx + 8]
0x100454598: vmovups ymmword ptr [rax + 8], ymm0
0x10045459d: mov rcx, qword ptr [rbx + 0x28]
0x1004545a1: mov qword ptr [rax + 0x28], rcx
0x1004545a5: vmovups ymm0, ymmword ptr [rbx + 0x30]
0x1004545aa: vmovups ymm1, ymmword ptr [rbx + 0x40]
0x1004545af: vmovups ymmword ptr [rax + 0x40], ymm1
0x1004545b4: vmovups ymmword ptr [rax + 0x30], ymm0
0x1004545b9: mov rcx, qword ptr [rip + 0x7b7e00]
0x1004545c0: add rcx, 0x10
0x1004545c4: mov qword ptr [rax], rcx
0x1004545c7: add rsp, 8
0x1004545cb: pop rbx
0x1004545cc: pop rbp
0x1004545cd: vzeroupper 
0x1004545d0: ret 
0x1004545d1: nop word ptr cs:[rax + rax]
0x1004545e0: push rbp
0x1004545e1: mov rbp, rsp
0x1004545e4: xor eax, eax
0x1004545e6: pop rbp
0x1004545e7: ret 
0x1004545e8: nop dword ptr [rax + rax]
0x1004545f0: push rbp
0x1004545f1: mov rbp, rsp
0x1004545f4: mov al, 1
0x1004545f6: pop rbp
0x1004545f7: ret 
0x1004545f8: nop dword ptr [rax + rax]
0x100454600: push rbp
0x100454601: mov rbp, rsp
0x100454604: mov eax, 0x48
0x100454609: pop rbp
0x10045460a: ret 
0x10045460b: nop dword ptr [rax + rax]
0x100454610: push rbp
0x100454611: mov rbp, rsp
0x100454614: mov eax, 8
0x100454619: pop rbp
0x10045461a: ret 
0x10045461b: nop dword ptr [rax + rax]
0x100454620: push rbp
0x100454621: mov rbp, rsp
0x100454624: push r14
0x100454626: push rbx
0x100454627: mov edi, 0x48
0x10045462c: call 0x100aa2498
0x100454631: mov rbx, rax
0x100454634: call 0x1007abc10
0x100454639: mov rax, qword ptr [rip + 0x1bb2440]
0x100454640: mov eax, dword ptr [rax + 0x38]
0x100454643: mov dword ptr [rbx + 8], eax
0x100454646: mov rax, qword ptr [rip + 0x7b8dfb]
0x10045464d: add rax, 0x10
0x100454651: mov qword ptr [rbx], rax
0x100454654: mov rax, rbx
0x100454657: pop rbx
0x100454658: pop r14
0x10045465a: pop rbp
0x10045465b: ret 
0x10045465c: mov r14, rax
0x10045465f: mov rdi, rbx
0x100454662: call 0x100aa248c
0x100454667: mov rdi, r14
0x10045466a: call 0x100aa2192
0x10045466f: nop 
0x100454670: push rbp
0x100454671: mov rbp, rsp
0x100454674: test rsi, rsi
0x100454677: je 0x100454682
0x100454679: mov rdi, rsi
0x10045467c: pop rbp
0x10045467d: jmp 0x100aa248c
0x100454682: pop rbp
0x100454683: ret 
0x100454684: nop word ptr cs:[rax + rax]
0x100454690: push rbp
0x100454691: mov rbp, rsp
0x100454694: push rbx
0x100454695: push rax
0x100454696: mov rbx, rsi
0x100454699: call 0x1007abc10
0x10045469e: mov rax, qword ptr [rip + 0x1bb23db]
0x1004546a5: mov eax, dword ptr [rax + 0x38]
0x1004546a8: mov dword ptr [rbx + 8], eax
0x1004546ab: mov rax, qword ptr [rip + 0x7b8d96]
0x1004546b2: add rax, 0x10
0x1004546b6: mov qword ptr [rbx], rax
0x1004546b9: mov rax, rbx
0x1004546bc: add rsp, 8
0x1004546c0: pop rbx
0x1004546c1: pop rbp
0x1004546c2: ret 
0x1004546c3: nop word ptr cs:[rax + rax]
0x1004546d0: push rbp
0x1004546d1: mov rbp, rsp
0x1004546d4: pop rbp
0x1004546d5: ret 
0x1004546d6: nop word ptr cs:[rax + rax]
0x1004546e0: push rbp
0x1004546e1: mov rbp, rsp
0x1004546e4: mov rcx, qword ptr [rsi]
0x1004546e7: lea rax, [rcx + 8]
0x1004546eb: test rcx, rcx
0x1004546ee: cmove rax, rcx
0x1004546f2: pop rbp
0x1004546f3: ret 
0x1004546f4: nop word ptr cs:[rax + rax]
0x100454700: push rbp
0x100454701: mov rbp, rsp
0x100454704: mov rcx, qword ptr [rsi]
0x100454707: lea rax, [rcx - 8]
0x10045470b: test rcx, rcx
0x10045470e: cmove rax, rcx
0x100454712: pop rbp
0x100454713: ret 
0x100454714: nop word ptr cs:[rax + rax]
0x100454720: push rbp
0x100454721: mov rbp, rsp
0x100454724: push r14
0x100454726: push rbx
0x100454727: sub rsp, 0x10
0x10045472b: mov r14, rcx
0x10045472e: mov rax, rdx
0x100454731: mov rcx, rsi
0x100454734: mov qword ptr [rbp - 0x18], 0
0x10045473c: mov rbx, qword ptr [rdi]
0x10045473f: lea rsi, [rbp - 0x18]
0x100454743: mov rdx, rcx
0x100454746: mov rcx, rax
0x100454749: call qword ptr [rbx + 0x40]
0x10045474c: mov rax, qword ptr [rbp - 0x18]
0x100454750: test rax, rax
0x100454753: je 0x100454761
0x100454755: add rax, r14
0x100454758: add rsp, 0x10
0x10045475c: pop rbx
0x10045475d: pop r14
0x10045475f: pop rbp
0x100454760: ret 
0x100454761: lea rdi, [rip + 0x74e954]
0x100454768: lea rsi, [rip + 0x708e69]
0x10045476f: mov edx, 0x3a9
0x100454774: mov ecx, 3
0x100454779: call 0x1007e5f70
0x10045477e: ud2 
0x100454780: push rbp
0x100454781: mov rbp, rsp
0x100454784: pop rbp
0x100454785: ret 
0x100454786: nop word ptr cs:[rax + rax]
0x100454790: push rbp
0x100454791: mov rbp, rsp
0x100454794: xor eax, eax
0x100454796: pop rbp
0x100454797: ret 
0x100454798: nop dword ptr [rax + rax]
0x1004547a0: push rbp
0x1004547a1: mov rbp, rsp
0x1004547a4: pop rbp
0x1004547a5: ret 
0x1004547a6: nop word ptr cs:[rax + rax]
0x1004547b0: push rbp
0x1004547b1: mov rbp, rsp
0x1004547b4: pop rbp
0x1004547b5: jmp 0x100aa248c
0x1004547ba: nop word ptr [rax + rax]
0x1004547c0: push rbp
0x1004547c1: mov rbp, rsp
0x1004547c4: mov eax, 8
0x1004547c9: pop rbp
0x1004547ca: ret 
0x1004547cb: nop dword ptr [rax + rax]
0x1004547d0: push rbp
0x1004547d1: mov rbp, rsp
0x1004547d4: mov eax, 8
0x1004547d9: pop rbp
0x1004547da: ret 
0x1004547db: nop dword ptr [rax + rax]
0x1004547e0: push rbp
0x1004547e1: mov rbp, rsp
0x1004547e4: mov edi, 8
0x1004547e9: call 0x100aa2498
0x1004547ee: mov qword ptr [rax], 0
0x1004547f5: pop rbp
0x1004547f6: ret 
0x1004547f7: nop word ptr [rax + rax]
0x100454800: push rbp
0x100454801: mov rbp, rsp
0x100454804: test rsi, rsi
0x100454807: je 0x100454812
0x100454809: mov rdi, rsi
0x10045480c: pop rbp
0x10045480d: jmp 0x100aa248c
0x100454812: pop rbp
0x100454813: ret 
0x100454814: nop word ptr cs:[rax + rax]
0x100454820: push rbp
0x100454821: mov rbp, rsp
0x100454824: mov qword ptr [rsi], 0
0x10045482b: mov rax, rsi
0x10045482e: pop rbp
0x10045482f: ret 
0x100454830: push rbp
0x100454831: mov rbp, rsp
0x100454834: pop rbp
0x100454835: ret 
0x100454836: nop word ptr cs:[rax + rax]
0x100454840: push rbp
0x100454841: mov rbp, rsp
0x100454844: push rbx
0x100454845: push rax
0x100454846: mov rbx, rdi
0x100454849: mov edi, 0x60
0x10045484e: call 0x100aa2498
0x100454853: vmovups ymm0, ymmword ptr [rbx + 8]
0x100454858: vmovups ymmword ptr [rax + 8], ymm0
0x10045485d: mov rcx, qword ptr [rbx + 0x28]
0x100454861: mov qword ptr [rax + 0x28], rcx
0x100454865: vmovups ymm0, ymmword ptr [rbx + 0x30]
0x10045486a: vmovups ymm1, ymmword ptr [rbx + 0x40]
0x10045486f: vmovups ymmword ptr [rax + 0x40], ymm1
0x100454874: vmovups ymmword ptr [rax + 0x30], ymm0
0x100454879: mov rcx, qword ptr [rip + 0x7b7e88]
0x100454880: add rcx, 0x10
0x100454884: mov qword ptr [rax], rcx
0x100454887: add rsp, 8
0x10045488b: pop rbx
0x10045488c: pop rbp
0x10045488d: vzeroupper 
0x100454890: ret 
0x100454891: nop word ptr cs:[rax + rax]
0x1004548a0: push rbp
0x1004548a1: mov rbp, rsp
0x1004548a4: xor eax, eax
0x1004548a6: pop rbp
0x1004548a7: ret 
0x1004548a8: nop dword ptr [rax + rax]
0x1004548b0: push rbp
0x1004548b1: mov rbp, rsp
0x1004548b4: xor eax, eax
0x1004548b6: pop rbp
0x1004548b7: ret 
0x1004548b8: nop dword ptr [rax + rax]
0x1004548c0: push rbp
0x1004548c1: mov rbp, rsp
0x1004548c4: mov eax, 0x270
0x1004548c9: pop rbp
0x1004548ca: ret 
0x1004548cb: nop dword ptr [rax + rax]
0x1004548d0: push rbp
0x1004548d1: mov rbp, rsp
0x1004548d4: mov eax, 0x10
0x1004548d9: pop rbp
0x1004548da: ret 
0x1004548db: nop dword ptr [rax + rax]
0x1004548e0: push rbp
0x1004548e1: mov rbp, rsp
0x1004548e4: push r14
0x1004548e6: push rbx
0x1004548e7: mov edi, 0x270
0x1004548ec: call 0x100aa2498
0x1004548f1: mov rbx, rax
0x1004548f4: call 0x1007abc10
0x1004548f9: mov eax, dword ptr [rax + 0x38]
0x1004548fc: mov dword ptr [rbx], eax