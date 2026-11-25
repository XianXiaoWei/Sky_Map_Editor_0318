0x1001a4520: push rbp
0x1001a4521: mov rbp, rsp
0x1001a4524: push r15
0x1001a4526: push r14
0x1001a4528: push r13
0x1001a452a: push r12
0x1001a452c: push rbx
0x1001a452d: sub rsp, 0x18
0x1001a4531: mov r13, rcx
0x1001a4534: mov qword ptr [rbp - 0x30], rdx
0x1001a4538: mov r15, rsi
0x1001a453b: mov r12, rdi
0x1001a453e: vucomiss xmm0, dword ptr [rip + 0x90406e] ; 0x100aa85b4
0x1001a4546: jbe 0x1001a46b2
0x1001a454c: vpermilps xmm0, xmm0, 0xc0
0x1001a4552: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1001a4557: xor r14d, r14d
0x1001a455a: nop word ptr [rax + rax]
0x1001a4560: mov rdi, r13
0x1001a4563: mov esi, r14d
0x1001a4566: call 0x1001031d0 ; 0x1001031d0
0x1001a456b: mov rbx, rax
0x1001a456e: mov rdi, rbx
0x1001a4571: call 0x1000fe050 ; 0x1000fe050
0x1001a4576: test al, al
0x1001a4578: je 0x1001a46a0
0x1001a457e: mov rax, qword ptr [rbx + 0x18]
0x1001a4582: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x1001a4587: vsubps xmm1, xmm0, xmmword ptr [rax + 0x20]
0x1001a458c: vdivps xmm1, xmm1, xmmword ptr [rbp - 0x40]
0x1001a4591: vmulps xmm2, xmm1, xmm1
0x1001a4595: vmovshdup xmm3, xmm2
0x1001a4599: vaddss xmm3, xmm2, xmm3
0x1001a459d: vpermilpd xmm2, xmm2, 1
0x1001a45a3: vaddss xmm2, xmm2, xmm3
0x1001a45a7: vsqrtss xmm2, xmm2, xmm2
0x1001a45ab: vaddss xmm2, xmm2, dword ptr [rip + 0x9093b1] ; 0x100aad964
0x1001a45b3: vdivss xmm2, xmm2, dword ptr [rip + 0x90723d] ; 0x100aab7f8
0x1001a45bb: vxorps xmm3, xmm3, xmm3
0x1001a45bf: vmaxss xmm2, xmm3, xmm2
0x1001a45c3: vmovss xmm3, dword ptr [rip + 0x900af5] ; 0x100aa50c0
0x1001a45cb: vmovaps xmm4, xmm3
0x1001a45cf: vminss xmm2, xmm4, xmm2
0x1001a45d3: vmulps xmm1, xmm1, xmmword ptr [rip + 0x909395] ; 0x100aad970
0x1001a45db: vaddps xmm3, xmm0, xmm1
0x1001a45df: vsubss xmm1, xmm4, xmm2
0x1001a45e3: vmulss xmm1, xmm1, dword ptr [rip + 0x904bd9] ; 0x100aa91c4
0x1001a45eb: vmulss xmm2, xmm2, dword ptr [rip + 0x9031f9] ; 0x100aa77ec
0x1001a45f3: vaddss xmm2, xmm2, xmm1
0x1001a45f7: vmovaps xmm1, xmmword ptr [r15]
0x1001a45fc: vsubps xmm4, xmm3, xmm1
0x1001a4600: vmulps xmm4, xmm4, xmm4
0x1001a4604: vmovshdup xmm5, xmm4
0x1001a4608: vaddss xmm5, xmm4, xmm5
0x1001a460c: vpermilpd xmm4, xmm4, 1
0x1001a4612: vaddss xmm4, xmm4, xmm5
0x1001a4616: vmulss xmm5, xmm2, xmm2
0x1001a461a: vucomiss xmm5, xmm4
0x1001a461e: ja 0x1001a4690
0x1001a4620: vmulss xmm4, xmm2, dword ptr [rip + 0x9031c4] ; 0x100aa77ec
0x1001a4628: vmulss xmm4, xmm4, dword ptr [rip + 0x8fff88] ; 0x100aa45b8
0x1001a4630: vaddps xmm3, xmm0, xmm3
0x1001a4634: vmulps xmm3, xmm3, xmmword ptr [rip + 0x903034] ; 0x100aa7670
0x1001a463c: vsubps xmm3, xmm3, xmm1
0x1001a4640: vmulps xmm3, xmm3, xmm3
0x1001a4644: vmovshdup xmm5, xmm3
0x1001a4648: vaddss xmm5, xmm3, xmm5
0x1001a464c: vpermilpd xmm3, xmm3, 1
0x1001a4652: vaddss xmm3, xmm3, xmm5
0x1001a4656: vmulss xmm4, xmm4, xmm4
0x1001a465a: vucomiss xmm4, xmm3
0x1001a465e: ja 0x1001a4690
0x1001a4660: vmulss xmm2, xmm2, dword ptr [rip + 0x8fff50] ; 0x100aa45b8
0x1001a4668: vsubps xmm0, xmm0, xmm1
0x1001a466c: vmulps xmm0, xmm0, xmm0
0x1001a4670: vmovshdup xmm1, xmm0
0x1001a4674: vaddss xmm1, xmm0, xmm1
0x1001a4678: vpermilpd xmm0, xmm0, 1
0x1001a467e: vaddss xmm0, xmm0, xmm1
0x1001a4682: vmulss xmm1, xmm2, xmm2
0x1001a4686: vucomiss xmm1, xmm0
0x1001a468a: jbe 0x1001a46a0
0x1001a468c: nop dword ptr [rax]
0x1001a4690: mov byte ptr [r12 + 0x48], 0
0x1001a4696: mov rax, qword ptr [rbp - 0x30]
0x1001a469a: mov dword ptr [rax], 0
0x1001a46a0: inc r14d
0x1001a46a3: cmp r14d, 0x10
0x1001a46a7: jne 0x1001a4560
0x1001a46ad: jmp 0x1001a480b ; 0x1001a480b
0x1001a46b2: xor ebx, ebx
0x1001a46b4: nop word ptr cs:[rax + rax]
0x1001a46c0: mov rdi, r13
0x1001a46c3: mov esi, ebx
0x1001a46c5: call 0x1001031d0 ; 0x1001031d0
0x1001a46ca: mov r14, rax
0x1001a46cd: mov rdi, r14
0x1001a46d0: call 0x1000fe050 ; 0x1000fe050
0x1001a46d5: test al, al
0x1001a46d7: je 0x1001a4800
0x1001a46dd: vxorps xmm2, xmm2, xmm2
0x1001a46e1: vmovaps xmm0, xmmword ptr [rbp - 0x40]
0x1001a46e6: vblendps xmm0, xmm2, xmm0, 8
0x1001a46ec: vmovaps xmmword ptr [rbp - 0x40], xmm0
0x1001a46f1: vmulps xmm0, xmm0, xmm0
0x1001a46f5: vmovshdup xmm1, xmm0
0x1001a46f9: vaddss xmm1, xmm0, xmm1
0x1001a46fd: vpermilpd xmm0, xmm0, 1
0x1001a4703: vaddss xmm0, xmm0, xmm1
0x1001a4707: vsqrtss xmm0, xmm0, xmm0
0x1001a470b: vaddss xmm0, xmm0, dword ptr [rip + 0x909251] ; 0x100aad964
0x1001a4713: vdivss xmm0, xmm0, dword ptr [rip + 0x9070dd] ; 0x100aab7f8
0x1001a471b: vxorps xmm1, xmm1, xmm1
0x1001a471f: vmaxss xmm0, xmm1, xmm0
0x1001a4723: vmovss xmm1, dword ptr [rip + 0x900995] ; 0x100aa50c0
0x1001a472b: vmovaps xmm4, xmm1
0x1001a472f: vminss xmm1, xmm4, xmm0
0x1001a4733: mov rax, qword ptr [r14 + 0x18]
0x1001a4737: vmovaps xmm0, xmmword ptr [rax + 0x10]
0x1001a473c: vaddps xmm3, xmm0, xmm2
0x1001a4740: vsubss xmm2, xmm4, xmm1
0x1001a4744: vmulss xmm2, xmm2, dword ptr [rip + 0x904a78] ; 0x100aa91c4
0x1001a474c: vmulss xmm1, xmm1, dword ptr [rip + 0x903098] ; 0x100aa77ec
0x1001a4754: vaddss xmm2, xmm1, xmm2
0x1001a4758: vmovaps xmm1, xmmword ptr [r15]
0x1001a475d: vsubps xmm4, xmm3, xmm1
0x1001a4761: vmulps xmm4, xmm4, xmm4
0x1001a4765: vmovshdup xmm5, xmm4
0x1001a4769: vaddss xmm5, xmm4, xmm5
0x1001a476d: vpermilpd xmm4, xmm4, 1
0x1001a4773: vaddss xmm4, xmm4, xmm5
0x1001a4777: vmulss xmm5, xmm2, xmm2
0x1001a477b: vucomiss xmm5, xmm4
0x1001a477f: ja 0x1001a47f0
0x1001a4781: vmulss xmm4, xmm2, dword ptr [rip + 0x903063] ; 0x100aa77ec
0x1001a4789: vmulss xmm4, xmm4, dword ptr [rip + 0x8ffe27] ; 0x100aa45b8
0x1001a4791: vaddps xmm3, xmm0, xmm3
0x1001a4795: vmulps xmm3, xmm3, xmmword ptr [rip + 0x902ed3] ; 0x100aa7670
0x1001a479d: vsubps xmm3, xmm3, xmm1
0x1001a47a1: vmulps xmm3, xmm3, xmm3
0x1001a47a5: vmovshdup xmm5, xmm3
0x1001a47a9: vaddss xmm5, xmm3, xmm5
0x1001a47ad: vpermilpd xmm3, xmm3, 1
0x1001a47b3: vaddss xmm3, xmm3, xmm5
0x1001a47b7: vmulss xmm4, xmm4, xmm4
0x1001a47bb: vucomiss xmm4, xmm3
0x1001a47bf: ja 0x1001a47f0
0x1001a47c1: vmulss xmm2, xmm2, dword ptr [rip + 0x8ffdef] ; 0x100aa45b8
0x1001a47c9: vsubps xmm0, xmm0, xmm1
0x1001a47cd: vmulps xmm0, xmm0, xmm0
0x1001a47d1: vmovshdup xmm1, xmm0
0x1001a47d5: vaddss xmm1, xmm0, xmm1
0x1001a47d9: vpermilpd xmm0, xmm0, 1
0x1001a47df: vaddss xmm0, xmm0, xmm1
0x1001a47e3: vmulss xmm1, xmm2, xmm2
0x1001a47e7: vucomiss xmm1, xmm0
0x1001a47eb: jbe 0x1001a4800
0x1001a47ed: nop dword ptr [rax]
0x1001a47f0: mov byte ptr [r12 + 0x48], 0
0x1001a47f6: mov rax, qword ptr [rbp - 0x30]
0x1001a47fa: mov dword ptr [rax], 0
0x1001a4800: inc ebx
0x1001a4802: cmp ebx, 0x10
0x1001a4805: jne 0x1001a46c0
0x1001a480b: add rsp, 0x18
0x1001a480f: pop rbx
0x1001a4810: pop r12
0x1001a4812: pop r13
0x1001a4814: pop r14
0x1001a4816: pop r15
0x1001a4818: pop rbp
0x1001a4819: ret 
0x1001a481a: nop word ptr [rax + rax]
