0x1006a9000: push rbp
0x1006a9001: mov rbp, rsp
0x1006a9004: push r15
0x1006a9006: push r14
0x1006a9008: push r13
0x1006a900a: push r12
0x1006a900c: push rbx
0x1006a900d: and rsp, 0xffffffffffffffe0
0x1006a9011: sub rsp, 0x280
0x1006a9018: mov dword ptr [rsp + 0x10], r8d
0x1006a901d: mov r13d, ecx
0x1006a9020: mov r12, rdx
0x1006a9023: mov r14, rsi
0x1006a9026: mov rbx, rdi
0x1006a9029: mov rax, qword ptr [rip + 0x5648a8] ; 0x100c0d8d8
0x1006a9030: mov rax, qword ptr [rax]
0x1006a9033: mov qword ptr [rsp + 0x260], rax
0x1006a903b: mov r15, qword ptr [rbx + 0xe6c70]
0x1006a9042: test r15, r15
0x1006a9045: je 0x1006a9c51
0x1006a904b: mov rax, qword ptr [r15]
0x1006a904e: mov qword ptr [rbx + 0xe6c70], rax
0x1006a9055: mov esi, 0x5f0
0x1006a905a: mov rdi, r15
0x1006a905d: call 0x100aa24aa ; 0x100aa24aa ___bzero
0x1006a9062: mov dword ptr [r15 + 0x5a8], 0x10001
0x1006a906d: mov word ptr [r15 + 0x5ad], 0x101
0x1006a9077: movabs rax, 0x1000000000000
0x1006a9081: mov qword ptr [r15 + 0x5e0], rax
0x1006a9088: mov eax, dword ptr [rbx + 0xe6c78]
0x1006a908e: lea ecx, [rax + 1]
0x1006a9091: mov dword ptr [rbx + 0xe6c78], ecx
0x1006a9097: mov qword ptr [rbx + rax*8 + 0xe6c80], r15
0x1006a909f: vmovaps xmm0, xmmword ptr [r12]
0x1006a90a5: vmovaps xmmword ptr [r15 + 0x20], xmm0
0x1006a90ab: vmovaps xmm0, xmmword ptr [r12 + 0x10]
0x1006a90b2: vmovaps xmmword ptr [r15 + 0x30], xmm0
0x1006a90b8: vmovaps xmm0, xmmword ptr [r12 + 0x20]
0x1006a90bf: vmovaps xmmword ptr [r15 + 0x40], xmm0
0x1006a90c5: vmovaps xmm0, xmmword ptr [r12 + 0x30]
0x1006a90cc: vmovaps xmmword ptr [r15 + 0x50], xmm0
0x1006a90d2: mov eax, dword ptr [r14 + 0x70]
0x1006a90d6: mov dword ptr [r15 + 0x5e0], eax
0x1006a90dd: vmovaps xmm0, xmmword ptr [r14]
0x1006a90e2: vmovaps xmmword ptr [r15 + 0x5b0], xmm0
0x1006a90eb: vmovaps xmm0, xmmword ptr [r14 + 0x10]
0x1006a90f1: vmovaps xmmword ptr [r15 + 0x5c0], xmm0
0x1006a90fa: mov qword ptr [rsp + 0x28], rbx
0x1006a90ff: mov qword ptr [r15 + 0x5e8], rbx
0x1006a9106: mov byte ptr [r15 + 0x5e6], 1
0x1006a910e: mov byte ptr [r15 + 0x5e5], r13b
0x1006a9115: mov rax, qword ptr [r14 + 0xb8]
0x1006a911c: test rax, rax
0x1006a911f: mov qword ptr [rsp + 0x18], r14
0x1006a9124: je 0x1006a912b
0x1006a9126: mov al, byte ptr [rax + 0x2a]
0x1006a9129: jmp 0x1006a912d ; 0x1006a912d
0x1006a912b: xor eax, eax
0x1006a912d: mov byte ptr [r15 + 0x5e7], al
0x1006a9134: vmovaps xmm0, xmmword ptr [r12]
0x1006a913a: vmovaps xmm1, xmmword ptr [r12 + 0x10]
0x1006a9141: vmovaps xmm2, xmmword ptr [r12 + 0x20]
0x1006a9148: vmovaps xmmword ptr [rsp + 0x160], xmm0
0x1006a9151: vmovaps xmmword ptr [rsp + 0x170], xmm1
0x1006a915a: vmovaps xmmword ptr [rsp + 0x180], xmm2
0x1006a9163: lea rdi, [rsp + 0x50]
0x1006a9168: lea rsi, [rsp + 0x160]
0x1006a9170: call 0x100789e80 ; 0x100789e80
0x1006a9175: vmovaps xmm0, xmmword ptr [rsp + 0x50]
0x1006a917b: vsubps xmm0, xmm0, xmmword ptr [rip + 0x40173d] ; 0x100aaa8c0
0x1006a9183: vandps xmm2, xmm0, xmmword ptr [rip + 0x3fe785] ; 0x100aa7910
0x1006a918b: vmovss xmm1, dword ptr [rip + 0x3fe731] ; 0x100aa78c4
0x1006a9193: vucomiss xmm1, xmm2
0x1006a9197: jbe 0x1006a9c29
0x1006a919d: vmovshdup xmm2, xmm0
0x1006a91a1: vandps xmm2, xmm2, xmmword ptr [rip + 0x3fe767] ; 0x100aa7910
0x1006a91a9: vucomiss xmm1, xmm2
0x1006a91ad: jbe 0x1006a9c29
0x1006a91b3: vpermilpd xmm0, xmm0, 1
0x1006a91b9: vandpd xmm0, xmm0, xmmword ptr [rip + 0x3fe74f] ; 0x100aa7910
0x1006a91c1: vucomiss xmm1, xmm0
0x1006a91c5: jbe 0x1006a9c29
0x1006a91cb: lea rbx, [r15 + 0x20]
0x1006a91cf: mov rdi, qword ptr [rsp + 0x18]
0x1006a91d4: lea rsi, [rdi + 0x10]
0x1006a91d8: mov qword ptr [r15 + 0x5d8], 0
0x1006a91e3: mov eax, dword ptr [rdi + 0x20]
0x1006a91e6: mov dword ptr [r15 + 0x5d0], eax
0x1006a91ed: mov al, 1
0x1006a91ef: cmp byte ptr [rsp + 0x10], 0
0x1006a91f4: jne 0x1006a9200
0x1006a91f6: cmp dword ptr [rdi + 0x80], 2
0x1006a91fd: setb al
0x1006a9200: mov byte ptr [r15 + 0x5e4], al
0x1006a9207: vmovaps xmm0, xmmword ptr [r15 + 0x20]
0x1006a920d: vmovaps xmm1, xmmword ptr [r15 + 0x30]
0x1006a9213: vmovaps xmm2, xmmword ptr [r15 + 0x40]
0x1006a9219: vmovaps xmm3, xmmword ptr [r15 + 0x50]
0x1006a921f: vmovaps xmm4, xmmword ptr [rdi]
0x1006a9223: vmovaps xmm5, xmmword ptr [rdi + 0x10]
0x1006a9228: vpermilps xmm6, xmm4, 0
0x1006a922e: vmulps xmm6, xmm6, xmm0
0x1006a9232: vpermilps xmm7, xmm4, 0x55
0x1006a9238: vmulps xmm7, xmm7, xmm1
0x1006a923c: vaddps xmm6, xmm6, xmm7
0x1006a9240: vpermilps xmm4, xmm4, 0xaa
0x1006a9246: vmulps xmm4, xmm4, xmm2
0x1006a924a: vaddps xmm4, xmm6, xmm4
0x1006a924e: vaddps xmm4, xmm3, xmm4
0x1006a9252: vpermilps xmm6, xmm5, 0
0x1006a9258: vmulps xmm0, xmm0, xmm6
0x1006a925c: vpermilps xmm6, xmm5, 0x55
0x1006a9262: vmulps xmm1, xmm1, xmm6
0x1006a9266: vaddps xmm0, xmm0, xmm1
0x1006a926a: vpermilps xmm1, xmm5, 0xaa
0x1006a9270: vmulps xmm1, xmm2, xmm1
0x1006a9274: vaddps xmm0, xmm1, xmm0
0x1006a9278: vaddps xmm0, xmm3, xmm0
0x1006a927c: vaddps xmm1, xmm4, xmm0
0x1006a9280: vmovaps xmm2, xmmword ptr [rip + 0x3fe3e8] ; 0x100aa7670
0x1006a9288: vmulps xmm1, xmm1, xmm2
0x1006a928c: vsubps xmm0, xmm0, xmm4
0x1006a9290: vmulps xmm0, xmm0, xmm2
0x1006a9294: vmulps xmm0, xmm0, xmm0
0x1006a9298: vmovshdup xmm2, xmm0
0x1006a929c: vaddss xmm2, xmm0, xmm2
0x1006a92a0: vpermilpd xmm0, xmm0, 1
0x1006a92a6: vaddss xmm0, xmm0, xmm2
0x1006a92aa: vsqrtss xmm0, xmm0, xmm0
0x1006a92ae: vinsertps xmm0, xmm1, xmm0, 0x30
0x1006a92b4: vmovaps xmmword ptr [r15 + 0xa0], xmm0
0x1006a92bd: lea r13, [r15 + 0x60]
0x1006a92c1: mov rdx, r13
0x1006a92c4: call 0x10078c950 ; 0x10078c950
0x1006a92c9: lea rdi, [rsp + 0x160]
0x1006a92d1: mov rsi, rbx
0x1006a92d4: mov rdx, r13
0x1006a92d7: call 0x100076df0 ; 0x100076df0
0x1006a92dc: mov rdx, qword ptr [rsp + 0x18]
0x1006a92e1: vmovaps xmm0, xmmword ptr [rsp + 0x160]
0x1006a92ea: vmovaps xmmword ptr [r15 + 0x60], xmm0
0x1006a92f0: vmovaps xmm0, xmmword ptr [rsp + 0x170]
0x1006a92f9: vmovaps xmmword ptr [r15 + 0x70], xmm0
0x1006a92ff: vmovaps xmm0, xmmword ptr [rsp + 0x180]
0x1006a9308: vmovaps xmmword ptr [r15 + 0x80], xmm0
0x1006a9311: vmovaps xmm0, xmmword ptr [rsp + 0x190]
0x1006a931a: vmovaps xmmword ptr [r15 + 0x90], xmm0
0x1006a9323: cmp byte ptr [rdx + 0xc1], 0
0x1006a932a: je 0x1006a9348
0x1006a932c: mov qword ptr [r15 + 0x598], 0
0x1006a9337: lea r14, [rdx + 0x24]
0x1006a933b: lea rbx, [rdx + 0x30]
0x1006a933f: lea r13, [rdx + 0x28]
0x1006a9343: jmp 0x1006a9497 ; 0x1006a9497
0x1006a9348: mov eax, dword ptr [rdx + 0x20]
0x1006a934b: test eax, eax
0x1006a934d: je 0x1006a932c
0x1006a934f: vxorps xmm0, xmm0, xmm0
0x1006a9353: vmovups xmmword ptr [rsp + 0x70], xmm0
0x1006a9359: movabs rcx, 0x3f800000ffffffff
0x1006a9363: mov qword ptr [rsp + 0x90], rcx
0x1006a936b: mov ecx, dword ptr [rdx + 0x24]
0x1006a936e: mov dword ptr [rsp + 0x160], ecx
0x1006a9375: mov rcx, qword ptr [rdx + 0x30]
0x1006a9379: mov qword ptr [rsp + 0x168], rcx
0x1006a9381: mov dword ptr [rsp + 0x170], 2
0x1006a938c: mov dword ptr [rsp + 0x174], eax
0x1006a9393: mov rax, qword ptr [rdx + 0x28]
0x1006a9397: mov qword ptr [rsp + 0x178], rax
0x1006a939f: mov dword ptr [rsp + 0x180], 0x24
0x1006a93aa: lea rcx, [rax + 0xc]
0x1006a93ae: mov qword ptr [rsp + 0x188], rcx
0x1006a93b6: movabs rcx, 0x2400000018
0x1006a93c0: mov qword ptr [rsp + 0x190], rcx
0x1006a93c8: lea rcx, [rax + 0x18]
0x1006a93cc: mov qword ptr [rsp + 0x60], rcx
0x1006a93d1: movabs rcx, 0x240000001c
0x1006a93db: mov qword ptr [rsp + 0x68], rcx
0x1006a93e0: add rax, 0x10
0x1006a93e4: mov qword ptr [rsp + 0x80], rax
0x1006a93ec: movabs rax, 0x2400000019
0x1006a93f6: mov qword ptr [rsp + 0x88], rax
0x1006a93fe: mov rax, qword ptr [rdx + 0xb8]
0x1006a9405: test rax, rax
0x1006a9408: mov qword ptr [rsp + 0x30], rbx
0x1006a940d: je 0x1006a941c
0x1006a940f: movzx eax, byte ptr [rax + 0x2c]
0x1006a9413: lea ecx, [rax*8 + 8]
0x1006a941a: jmp 0x1006a9423 ; 0x1006a9423
0x1006a941c: mov ecx, 8
0x1006a9421: xor eax, eax
0x1006a9423: lea r14, [rdx + 0x24]
0x1006a9427: lea rbx, [rdx + 0x30]
0x1006a942b: lea r13, [rdx + 0x28]
0x1006a942f: mov dword ptr [rsp + 0x90], ecx
0x1006a9436: mov byte ptr [r15 + 0x5a8], 0
0x1006a943e: lea rcx, [r15 + 0x5a0]
0x1006a9445: mov qword ptr [rsp + 0x10], rcx
0x1006a944a: mov byte ptr [r15 + 0x5a9], al
0x1006a9451: mov r12, qword ptr [rsp + 0x28]
0x1006a9456: mov rdi, qword ptr [r12 + 0x318]
0x1006a945e: lea rsi, [rsp + 0x160]
0x1006a9466: call 0x100778b90 ; 0x100778b90
0x1006a946b: mov dword ptr [r15 + 0x590], eax
0x1006a9472: mov rdi, qword ptr [r12 + 0x318]
0x1006a947a: lea rcx, [rsp + 0x60]
0x1006a947f: mov esi, eax
0x1006a9481: mov rdx, qword ptr [rsp + 0x30]
0x1006a9486: mov r8, qword ptr [rsp + 0x10]
0x1006a948b: call 0x100778fd0 ; 0x100778fd0
0x1006a9490: mov qword ptr [r15 + 0x598], rax
0x1006a9497: mov r12d, dword ptr [r14]
0x1006a949a: shl r12d, 4
0x1006a949e: call 0x1007c6c20 ; 0x1007c6c20
0x1006a94a3: add r12, r12
0x1006a94a6: lea rcx, [rip + 0x199f6a3] ; 0x102048b50
0x1006a94ad: mov rdx, qword ptr [rcx]
0x1006a94b0: mov ecx, 2
0x1006a94b5: mov rdi, rax
0x1006a94b8: mov rsi, r12
0x1006a94bb: call 0x100795530 ; 0x100795530
0x1006a94c0: mov rdi, qword ptr [rbx]
0x1006a94c3: mov esi, dword ptr [r14]
0x1006a94c6: mov rdx, qword ptr [r13]
0x1006a94ca: mov r12, qword ptr [rsp + 0x28]
0x1006a94cf: lea r8, [r12 + 0xe10]
0x1006a94d7: mov r9d, dword ptr [r12 + 0xe08]
0x1006a94df: lea rcx, [r15 + 0x2cc]
0x1006a94e6: mov qword ptr [rsp + 8], rcx
0x1006a94eb: mov qword ptr [rsp + 0x10], rax
0x1006a94f0: mov qword ptr [rsp], rax
0x1006a94f4: mov ecx, 0x24
0x1006a94f9: mov qword ptr [rsp + 0x48], r8
0x1006a94fe: call 0x1006a7280 ; 0x1006a7280
0x1006a9503: mov dword ptr [r15 + 0x2c8], eax
0x1006a950a: xor ebx, ebx
0x1006a950c: xor r14d, r14d
0x1006a950f: nop 
0x1006a9510: mov rdi, qword ptr [r12 + 0x340]
0x1006a9518: mov esi, dword ptr [r15 + rbx*4 + 0x2cc]
0x1006a9520: add rsi, rsi
0x1006a9523: mov rdx, qword ptr [rip + 0x198a606] ; 0x102033b30
0x1006a952a: mov ecx, 0x10
0x1006a952f: call 0x100795530 ; 0x100795530
0x1006a9534: mov qword ptr [r15 + rbx*8 + 0x3b8], rax
0x1006a953c: mov ecx, r14d
0x1006a953f: mov rdx, qword ptr [rsp + 0x10]
0x1006a9544: lea rsi, [rdx + rcx*2]
0x1006a9548: mov edx, dword ptr [r15 + rbx*4 + 0x2cc]
0x1006a9550: add rdx, rdx
0x1006a9553: mov rdi, rax
0x1006a9556: call 0x100aa28f4 ; 0x100aa28f4 _memcpy
0x1006a955b: add r14d, dword ptr [r15 + rbx*4 + 0x2cc]
0x1006a9563: inc rbx
0x1006a9566: cmp rbx, 0x3b
0x1006a956a: jb 0x1006a9510
0x1006a956c: mov rdx, qword ptr [rsp + 0x18]
0x1006a9571: mov rax, qword ptr [rdx + 0xb8]
0x1006a9578: test rax, rax
0x1006a957b: je 0x1006a958c
0x1006a957d: cmp byte ptr [rax + 0x2c], 0
0x1006a9581: je 0x1006a958c
0x1006a9583: lea rax, [rip + 0x42db16] ; 0x100ad70a0
0x1006a958a: jmp 0x1006a9593 ; 0x1006a9593
0x1006a958c: lea rax, [rip + 0x42db21] ; 0x100ad70b4
0x1006a9593: mov ecx, dword ptr [rax + 0x10]
0x1006a9596: mov dword ptr [r15 + 0x10], ecx
0x1006a959a: vmovups xmm0, xmmword ptr [rax]
0x1006a959e: vmovups xmmword ptr [r15], xmm0
0x1006a95a3: mov esi, dword ptr [rdx + 0x80]
0x1006a95a9: mov dword ptr [r15 + 0x1d8], esi
0x1006a95b0: mov rdi, qword ptr [r12 + 0x340]
0x1006a95b8: shl rsi, 4
0x1006a95bc: mov rdx, qword ptr [rip + 0x198a54d] ; 0x102033b10
0x1006a95c3: mov ecx, 0x10
0x1006a95c8: call 0x100795530 ; 0x100795530
0x1006a95cd: mov qword ptr [r15 + 0x1a0], rax
0x1006a95d4: mov rdi, qword ptr [r12 + 0x340]
0x1006a95dc: mov esi, dword ptr [r15 + 0x1d8]
0x1006a95e3: shl rsi, 4
0x1006a95e7: mov rdx, qword ptr [rip + 0x198a522] ; 0x102033b10
0x1006a95ee: mov ecx, 0x10
0x1006a95f3: call 0x100795530 ; 0x100795530
0x1006a95f8: mov qword ptr [r15 + 0x1b8], rax
0x1006a95ff: mov rdi, qword ptr [r12 + 0x340]
0x1006a9607: mov esi, dword ptr [r15 + 0x1d8]
0x1006a960e: shl rsi, 4
0x1006a9612: mov rdx, qword ptr [rip + 0x198a4f7] ; 0x102033b10
0x1006a9619: mov ecx, 0x10
0x1006a961e: call 0x100795530 ; 0x100795530
0x1006a9623: mov qword ptr [r15 + 0x1c0], rax
0x1006a962a: mov rdi, qword ptr [r12 + 0x340]
0x1006a9632: mov esi, dword ptr [r15 + 0x1d8]
0x1006a9639: add rsi, rsi
0x1006a963c: mov rdx, qword ptr [rip + 0x198a4cd] ; 0x102033b10
0x1006a9643: mov ecx, 0x10
0x1006a9648: call 0x100795530 ; 0x100795530
0x1006a964d: mov qword ptr [r15 + 0x1a8], rax
0x1006a9654: mov rdi, qword ptr [r12 + 0x340]
0x1006a965c: mov esi, dword ptr [r15 + 0x1d8]
0x1006a9663: add rsi, rsi
0x1006a9666: mov rdx, qword ptr [rip + 0x198a4a3] ; 0x102033b10
0x1006a966d: mov ecx, 0x10
0x1006a9672: call 0x100795530 ; 0x100795530
0x1006a9677: mov qword ptr [r15 + 0x1b0], rax
0x1006a967e: mov rdi, qword ptr [r12 + 0x340]
0x1006a9686: mov esi, dword ptr [r15 + 0x1d8]
0x1006a968d: shl rsi, 7
0x1006a9691: mov rdx, qword ptr [rip + 0x198a478] ; 0x102033b10
0x1006a9698: mov ecx, 0x10
0x1006a969d: call 0x100795530 ; 0x100795530
0x1006a96a2: mov qword ptr [r15 + 0x1d0], rax
0x1006a96a9: mov r10, qword ptr [rsp + 0x18]
0x1006a96ae: cmp dword ptr [r10 + 0x80], 0
0x1006a96b6: je 0x1006a9b9d
0x1006a96bc: vmovss xmm0, dword ptr [r10 + 0x70]
0x1006a96c2: vmulss xmm2, xmm0, dword ptr [rip + 0x3faeee] ; 0x100aa45b8
0x1006a96ca: vcvtss2sd xmm0, xmm2, xmm2
0x1006a96ce: vmulsd xmm0, xmm0, qword ptr [rip + 0x42d952] ; 0x100ad7028
0x1006a96d6: vcvtsd2ss xmm0, xmm0, xmm0
0x1006a96da: vmovaps xmmword ptr [rsp + 0x30], xmm0
0x1006a96e0: vmovaps xmm11, xmmword ptr [r10 + 0x50]
0x1006a96e6: vpermilps xmm12, xmm2, 0xc0
0x1006a96ec: xor r8d, r8d
0x1006a96ef: vxorps xmm14, xmm14, xmm14
0x1006a96f4: xor ecx, ecx
0x1006a96f6: nop word ptr cs:[rax + rax]
0x1006a9700: mov rsi, qword ptr [r10 + 0x88]
0x1006a9707: mov ecx, ecx
0x1006a9709: movzx eax, byte ptr [rsi + rcx*8 + 4]
0x1006a970e: vxorps xmm4, xmm4, xmm4
0x1006a9712: vcvtsi2ss xmm4, xmm4, eax
0x1006a9716: movzx eax, byte ptr [rsi + rcx*8 + 5]
0x1006a971b: vxorps xmm10, xmm10, xmm10
0x1006a9720: vcvtsi2ss xmm0, xmm10, eax
0x1006a9724: movzx eax, byte ptr [rsi + rcx*8 + 6]
0x1006a9729: vxorps xmm10, xmm10, xmm10
0x1006a972e: vcvtsi2ss xmm1, xmm10, eax
0x1006a9732: vinsertps xmm0, xmm4, xmm0, 0x10
0x1006a9738: vinsertps xmm0, xmm0, xmm1, 0x20
0x1006a973e: vmulps xmm0, xmm12, xmm0
0x1006a9742: vaddps xmm0, xmm0, xmm0
0x1006a9746: vaddps xmm0, xmm11, xmm0
0x1006a974a: vblendps xmm13, xmm12, xmm13, 8
0x1006a9750: vaddps xmm0, xmm13, xmm0
0x1006a9754: vmovaps xmm1, xmmword ptr [r15 + 0x20]
0x1006a975a: vmovaps xmm4, xmmword ptr [r15 + 0x30]
0x1006a9760: vmovaps xmm2, xmmword ptr [r15 + 0x40]
0x1006a9766: vmovaps xmm10, xmmword ptr [r15 + 0x50]
0x1006a976c: vmulss xmm15, xmm1, xmm0
0x1006a9770: vmovshdup xmm5, xmm0
0x1006a9774: vmulss xmm8, xmm4, xmm5
0x1006a9778: vaddss xmm8, xmm15, xmm8
0x1006a977d: vpermilpd xmm15, xmm0, 1
0x1006a9783: vmulss xmm9, xmm2, xmm15
0x1006a9788: vaddss xmm8, xmm9, xmm8
0x1006a978d: vmovshdup xmm6, xmm1
0x1006a9791: vmulss xmm9, xmm6, xmm0
0x1006a9795: vmovshdup xmm6, xmm4
0x1006a9799: vmulss xmm6, xmm6, xmm5
0x1006a979d: vaddss xmm9, xmm9, xmm6
0x1006a97a1: vmovshdup xmm6, xmm2
0x1006a97a5: vmulss xmm6, xmm6, xmm15
0x1006a97aa: vaddss xmm9, xmm6, xmm9
0x1006a97af: vmovshdup xmm6, xmm10
0x1006a97b4: vaddss xmm6, xmm6, xmm9
0x1006a97b9: vpermilpd xmm1, xmm1, 1
0x1006a97bf: vmulss xmm0, xmm1, xmm0
0x1006a97c3: vpermilpd xmm1, xmm4, 1
0x1006a97c9: vmulss xmm1, xmm1, xmm5
0x1006a97cd: vaddss xmm0, xmm0, xmm1
0x1006a97d1: vpermilpd xmm1, xmm2, 1
0x1006a97d7: vmulss xmm1, xmm1, xmm15
0x1006a97dc: vaddss xmm0, xmm1, xmm0
0x1006a97e0: vaddss xmm1, xmm10, xmm8
0x1006a97e5: vpermilpd xmm2, xmm10, 1
0x1006a97eb: vaddss xmm0, xmm2, xmm0
0x1006a97ef: vinsertps xmm1, xmm1, xmm6, 0x10
0x1006a97f5: vinsertps xmm0, xmm1, xmm0, 0x20
0x1006a97fb: mov edi, r8d
0x1006a97fe: add rdi, rdi
0x1006a9801: add rdi, qword ptr [r10 + 0x30]
0x1006a9805: add r8d, dword ptr [rsi + rcx*8]
0x1006a9809: vinsertps xmm0, xmm0, dword ptr [rsp + 0x30], 0x30
0x1006a9811: mov rax, qword ptr [r15 + 0x1a0]
0x1006a9818: mov r9, rcx
0x1006a981b: shl r9, 4
0x1006a981f: vmovaps xmmword ptr [rax + r9], xmm0
0x1006a9825: vblendps xmm3, xmm3, xmmword ptr [rip + 0x3fde21], 7 ; 0x100aa7650
0x1006a982f: vblendps xmm7, xmm7, xmmword ptr [rip + 0x3fde07], 7 ; 0x100aa7640
0x1006a9839: mov esi, dword ptr [rsi + rcx*8]
0x1006a983c: test rsi, rsi
0x1006a983f: je 0x1006a9887
0x1006a9841: mov rbx, qword ptr [r13]
0x1006a9845: xor eax, eax
0x1006a9847: nop word ptr [rax + rax]
0x1006a9850: movzx edx, word ptr [rdi + rax*2]
0x1006a9854: lea rdx, [rdx + rdx*8]
0x1006a9858: vmovsd xmm0, qword ptr [rbx + rdx*4]
0x1006a985d: vinsertps xmm0, xmm0, dword ptr [rbx + rdx*4 + 8], 0x20
0x1006a9865: vminps xmm1, xmm7, xmm0
0x1006a9869: vcmpunordps xmm2, xmm0, xmm14
0x1006a986f: vblendvps xmm7, xmm1, xmm7, xmm2
0x1006a9875: vmaxps xmm0, xmm3, xmm0
0x1006a9879: vblendvps xmm3, xmm0, xmm3, xmm2
0x1006a987f: inc rax
0x1006a9882: cmp rax, rsi
0x1006a9885: jb 0x1006a9850
0x1006a9887: vpermilps xmm0, xmm7, 0
0x1006a988d: vmulps xmm0, xmm0, xmmword ptr [r15 + 0x20]
0x1006a9893: vpermilps xmm1, xmm7, 0x55
0x1006a9899: vmulps xmm1, xmm1, xmmword ptr [r15 + 0x30]
0x1006a989f: vaddps xmm0, xmm0, xmm1
0x1006a98a3: vpermilps xmm1, xmm7, 0xaa
0x1006a98a9: vmulps xmm1, xmm1, xmmword ptr [r15 + 0x40]
0x1006a98af: vaddps xmm0, xmm0, xmm1
0x1006a98b3: vaddps xmm0, xmm0, xmmword ptr [r15 + 0x50]
0x1006a98b9: mov rax, qword ptr [r15 + 0x1b8]
0x1006a98c0: vmovaps xmmword ptr [rax + r9], xmm0
0x1006a98c6: vpermilps xmm0, xmm3, 0
0x1006a98cc: vmulps xmm0, xmm0, xmmword ptr [r15 + 0x20]
0x1006a98d2: vpermilps xmm1, xmm3, 0x55
0x1006a98d8: vmulps xmm1, xmm1, xmmword ptr [r15 + 0x30]
0x1006a98de: vaddps xmm0, xmm0, xmm1
0x1006a98e2: vpermilps xmm1, xmm3, 0xaa
0x1006a98e8: vmulps xmm1, xmm1, xmmword ptr [r15 + 0x40]
0x1006a98ee: vaddps xmm0, xmm0, xmm1
0x1006a98f2: vaddps xmm0, xmm0, xmmword ptr [r15 + 0x50]
0x1006a98f8: mov rax, qword ptr [r15 + 0x1c0]
0x1006a98ff: vmovaps xmmword ptr [rax + r9], xmm0
0x1006a9905: inc ecx
0x1006a9907: mov eax, dword ptr [r10 + 0x80]
0x1006a990e: cmp ecx, eax
0x1006a9910: jb 0x1006a9700
0x1006a9916: vxorps ymm0, ymm0, ymm0
0x1006a991a: vmovups ymmword ptr [rsp + 0x22c], ymm0
0x1006a9923: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x1006a992c: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x1006a9935: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x1006a993e: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x1006a9947: vmovaps ymmword ptr [rsp + 0x1a0], ymm0
0x1006a9950: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x1006a9959: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x1006a9962: test eax, eax
0x1006a9964: je 0x1006a9be9
0x1006a996a: xor r13d, r13d
0x1006a996d: mov dword ptr [rsp + 0x24], 0
0x1006a9975: xor r12d, r12d
0x1006a9978: nop dword ptr [rax + rax]
0x1006a9980: mov rax, qword ptr [r10 + 0x88]
0x1006a9987: mov r13d, r13d
0x1006a998a: mov r12d, r12d
0x1006a998d: lea r14, [r12 + r12]
0x1006a9991: mov rdi, qword ptr [r10 + 0x30]
0x1006a9995: add rdi, r14
0x1006a9998: vxorps ymm0, ymm0, ymm0
0x1006a999c: vmovups ymmword ptr [rsp + 0x12c], ymm0
0x1006a99a5: vmovaps ymmword ptr [rsp + 0x120], ymm0
0x1006a99ae: vmovaps ymmword ptr [rsp + 0x100], ymm0
0x1006a99b7: vmovaps ymmword ptr [rsp + 0xe0], ymm0
0x1006a99c0: vmovaps ymmword ptr [rsp + 0xc0], ymm0
0x1006a99c9: vmovaps ymmword ptr [rsp + 0xa0], ymm0
0x1006a99d2: vmovaps ymmword ptr [rsp + 0x80], ymm0
0x1006a99db: vmovaps ymmword ptr [rsp + 0x60], ymm0
0x1006a99e1: mov qword ptr [rsp + 0x30], rax
0x1006a99e6: mov esi, dword ptr [rax + r13*8]
0x1006a99ea: mov rdx, qword ptr [r10 + 0x28]
0x1006a99ee: mov rax, qword ptr [rsp + 0x28]
0x1006a99f3: mov r9d, dword ptr [rax + 0xe08]
0x1006a99fa: lea rax, [rsp + 0x60]
0x1006a99ff: mov qword ptr [rsp + 8], rax
0x1006a9a04: mov qword ptr [rsp], 0
0x1006a9a0c: mov ecx, 0x24
0x1006a9a11: mov r8, qword ptr [rsp + 0x48]
0x1006a9a16: vzeroupper 
0x1006a9a19: call 0x1006a7280 ; 0x1006a7280
0x1006a9a1e: mov r8, qword ptr [r15 + 0x1d0]
0x1006a9a25: mov rcx, r13
0x1006a9a28: shl rcx, 7
0x1006a9a2c: mov word ptr [r8 + rcx + 4], 0
0x1006a9a34: mov word ptr [r8 + rcx + 0xc], 0
0x1006a9a3c: mov word ptr [r8 + rcx + 0x14], 0
0x1006a9a44: mov word ptr [r8 + rcx + 0x1c], 0
0x1006a9a4c: mov word ptr [r8 + rcx + 0x24], 0
0x1006a9a54: mov word ptr [r8 + rcx + 0x2c], 0
0x1006a9a5c: mov word ptr [r8 + rcx + 0x34], 0
0x1006a9a64: mov word ptr [r8 + rcx + 0x3c], 0
0x1006a9a6c: mov word ptr [r8 + rcx + 0x44], 0
0x1006a9a74: mov word ptr [r8 + rcx + 0x4c], 0
0x1006a9a7c: mov word ptr [r8 + rcx + 0x54], 0
0x1006a9a84: mov word ptr [r8 + rcx + 0x5c], 0
0x1006a9a8c: mov word ptr [r8 + rcx + 0x64], 0
0x1006a9a94: mov word ptr [r8 + rcx + 0x6c], 0
0x1006a9a9c: mov word ptr [r8 + rcx + 0x74], 0
0x1006a9aa4: mov word ptr [r8 + rcx + 0x7c], 0
0x1006a9aac: xor edx, edx
0x1006a9aae: xor esi, esi
0x1006a9ab0: mov r10, qword ptr [rsp + 0x18]
0x1006a9ab5: nop word ptr cs:[rax + rax]
0x1006a9ac0: mov edi, dword ptr [rsp + rdx*4 + 0x60]
0x1006a9ac4: test edi, edi
0x1006a9ac6: je 0x1006a9af7
0x1006a9ac8: mov ebx, esi
0x1006a9aca: lea rax, [r8 + rcx]
0x1006a9ace: mov word ptr [rax + rbx*8 + 6], dx
0x1006a9ad3: mov word ptr [rax + rbx*8 + 4], di
0x1006a9ad8: mov edi, dword ptr [rsp + rdx*4 + 0x160]
0x1006a9adf: mov dword ptr [rax + rbx*8], edi
0x1006a9ae2: add edi, dword ptr [rsp + rdx*4 + 0x60]
0x1006a9ae6: mov dword ptr [rsp + rdx*4 + 0x160], edi
0x1006a9aed: inc dword ptr [r15 + rdx*4 + 0x1dc]
0x1006a9af5: inc esi
0x1006a9af7: inc rdx
0x1006a9afa: cmp rdx, 0x3b
0x1006a9afe: jne 0x1006a9ac0
0x1006a9b00: mov rax, qword ptr [r15 + 0x1c8]
0x1006a9b07: test rax, rax
0x1006a9b0a: je 0x1006a9b60
0x1006a9b0c: mov rcx, qword ptr [r10 + 0xb0]
0x1006a9b13: mov edx, dword ptr [rcx + r13*4]
0x1006a9b17: imul rsi, r13, 0x3e0
0x1006a9b1e: mov dword ptr [rax + rsi + 8], edx
0x1006a9b22: mov edi, dword ptr [rsp + 0x24]
0x1006a9b26: mov ecx, edi
0x1006a9b28: shl rcx, 2
0x1006a9b2c: add rcx, qword ptr [r10 + 0xa0]
0x1006a9b33: mov qword ptr [rax + rsi], rcx
0x1006a9b37: mov rcx, qword ptr [rsp + 0x30]
0x1006a9b3c: mov ecx, dword ptr [rcx + r13*8]
0x1006a9b40: mov dword ptr [rax + rsi + 0x18], ecx
0x1006a9b44: add r14, qword ptr [r10 + 0xa8]
0x1006a9b4b: mov qword ptr [rax + rsi + 0x10], r14
0x1006a9b50: add edi, edx
0x1006a9b52: mov dword ptr [rsp + 0x24], edi
0x1006a9b56: jmp 0x1006a9b69 ; 0x1006a9b69
0x1006a9b58: nop dword ptr [rax + rax]
0x1006a9b60: mov rax, qword ptr [rsp + 0x30]
0x1006a9b65: mov ecx, dword ptr [rax + r13*8]
0x1006a9b69: add r12d, ecx
0x1006a9b6c: inc r13d
0x1006a9b6f: mov eax, dword ptr [r10 + 0x80]
0x1006a9b76: cmp r13d, eax
0x1006a9b79: jb 0x1006a9980
0x1006a9b7f: test eax, eax
0x1006a9b81: je 0x1006a9be9
0x1006a9b83: mov rdi, qword ptr [r15 + 0x1a8]
0x1006a9b8a: dec eax
0x1006a9b8c: lea rdx, [rax + rax + 2]
0x1006a9b91: mov esi, 0xff
0x1006a9b96: call 0x100aa2900 ; 0x100aa2900 _memset
0x1006a9b9b: jmp 0x1006a9be9 ; 0x1006a9be9
0x1006a9b9d: vxorps ymm0, ymm0, ymm0
0x1006a9ba1: vmovups ymmword ptr [rsp + 0x22c], ymm0
0x1006a9baa: vmovaps ymmword ptr [rsp + 0x220], ymm0
0x1006a9bb3: vmovaps ymmword ptr [rsp + 0x200], ymm0
0x1006a9bbc: vmovaps ymmword ptr [rsp + 0x1e0], ymm0
0x1006a9bc5: vmovaps ymmword ptr [rsp + 0x1c0], ymm0
0x1006a9bce: vmovaps ymmword ptr [rsp + 0x1a0], ymm0
0x1006a9bd7: vmovaps ymmword ptr [rsp + 0x180], ymm0
0x1006a9be0: vmovaps ymmword ptr [rsp + 0x160], ymm0
0x1006a9be9: vzeroupper 
0x1006a9bec: call 0x1007c6c20 ; 0x1007c6c20
0x1006a9bf1: mov rdi, rax
0x1006a9bf4: mov rsi, qword ptr [rsp + 0x10]
0x1006a9bf9: call 0x100795a70 ; 0x100795a70
0x1006a9bfe: mov rax, qword ptr [rip + 0x563cd3] ; 0x100c0d8d8
0x1006a9c05: mov rax, qword ptr [rax]
0x1006a9c08: cmp rax, qword ptr [rsp + 0x260]
0x1006a9c10: jne 0x1006a9c24
0x1006a9c12: mov rax, r15
0x1006a9c15: lea rsp, [rbp - 0x28]
0x1006a9c19: pop rbx
0x1006a9c1a: pop r12
0x1006a9c1c: pop r13
0x1006a9c1e: pop r14
0x1006a9c20: pop r15
0x1006a9c22: pop rbp
0x1006a9c23: ret 
0x1006a9c24: call 0x100aa251c ; 0x100aa251c ___stack_chk_fail
0x1006a9c29: lea rdi, [rip + 0x4f01df] ; 0x100b99e0f isZeroEps( GetScale( transform.getUpper3x3() ) - vmVector3( 1.0f ), 0.00001f )
0x1006a9c30: lea rsi, [rip + 0x4efdaa] ; 0x100b999e1 TerrainBarn.cpp
0x1006a9c37: lea r8, [rip + 0x4f0220] ; 0x100b99e5e Scaling of Level geometry is not allowed
0x1006a9c3e: mov edx, 0x39f
0x1006a9c43: mov ecx, 4
0x1006a9c48: xor eax, eax
0x1006a9c4a: call 0x1007e6030 ; 0x1007e6030
0x1006a9c4f: ud2 
0x1006a9c51: lea rdi, [rip + 0x4d072a] ; 0x100b7a382 model
0x1006a9c58: lea rsi, [rip + 0x4efd82] ; 0x100b999e1 TerrainBarn.cpp
0x1006a9c5f: mov edx, 0x392
0x1006a9c64: mov ecx, 3
0x1006a9c69: call 0x1007e5f70 ; 0x1007e5f70
0x1006a9c6e: ud2 
0x1006a9c70: mov rdi, rax
0x1006a9c73: call 0x100011bf0 ; 0x100011bf0
0x1006a9c78: jmp 0x1006a9c7e ; 0x1006a9c7e
0x1006a9c7a: jmp 0x1006a9c7e ; 0x1006a9c7e
0x1006a9c7c: jmp 0x1006a9c7e ; 0x1006a9c7e
0x1006a9c7e: mov rbx, rax
0x1006a9c81: call 0x1007c6c20 ; 0x1007c6c20
0x1006a9c86: mov rdi, rax
0x1006a9c89: mov rsi, qword ptr [rsp + 0x10]
0x1006a9c8e: call 0x100795a70 ; 0x100795a70
0x1006a9c93: mov rdi, rbx
0x1006a9c96: call 0x100aa2192 ; 0x100aa2192 __Unwind_Resume
0x1006a9c9b: mov rdi, rax
0x1006a9c9e: call 0x100011bf0 ; 0x100011bf0
0x1006a9ca3: nop word ptr cs:[rax + rax]
